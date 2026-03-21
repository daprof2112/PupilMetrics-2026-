using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Threading;

namespace DinoLiteBridge
{
    /// <summary>
    /// Watches all HID interfaces of a USB device (matched by VID) for button
    /// press events without relying on the DNVideoX ActiveX control.
    ///
    /// Strategy:
    ///   1. Enumerate every HID device path whose hardware ID contains our VID.
    ///   2. Open each one in shared, non-exclusive mode.
    ///   3. Read reports on a background thread.
    ///   4. First report = neutral baseline.
    ///      Any subsequent report that differs from baseline = button press.
    ///   5. Fire OnButtonPressed callback, then debounce for 500 ms.
    /// </summary>
    internal class HidButtonWatcher
    {
        // ── Win32 ──────────────────────────────────────────────────────────
        [DllImport("hid.dll")]
        static extern void HidD_GetHidGuid(out Guid hidGuid);

        [DllImport("setupapi.dll", CharSet = CharSet.Auto, SetLastError = true)]
        static extern IntPtr SetupDiGetClassDevs(ref Guid classGuid,
            string enumerator, IntPtr hwnd, uint flags);

        [DllImport("setupapi.dll", SetLastError = true)]
        static extern bool SetupDiEnumDeviceInterfaces(IntPtr devInfo,
            IntPtr devInfoData, ref Guid interfaceClassGuid,
            uint memberIndex, ref SP_DEVICE_INTERFACE_DATA devIfaceData);

        [DllImport("setupapi.dll", CharSet = CharSet.Auto, SetLastError = true)]
        static extern bool SetupDiGetDeviceInterfaceDetail(IntPtr devInfo,
            ref SP_DEVICE_INTERFACE_DATA devIfaceData,
            IntPtr detail, uint detailSize, out uint reqSize, IntPtr devInfoData);

        [DllImport("setupapi.dll", SetLastError = true)]
        static extern bool SetupDiDestroyDeviceInfoList(IntPtr devInfo);

        [DllImport("hid.dll")]
        static extern bool HidD_GetAttributes(IntPtr device,
            ref HIDD_ATTRIBUTES attrs);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        static extern IntPtr CreateFile(string name, uint access, uint share,
            IntPtr security, uint creation, uint flags, IntPtr template);

        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool ReadFile(IntPtr file, byte[] buf, uint toRead,
            out uint read, IntPtr overlapped);

        [DllImport("kernel32.dll")]
        static extern bool CloseHandle(IntPtr handle);

        [StructLayout(LayoutKind.Sequential)]
        struct SP_DEVICE_INTERFACE_DATA
        {
            public uint cbSize;
            public Guid InterfaceClassGuid;
            public uint Flags;
            public IntPtr Reserved;
        }

        [StructLayout(LayoutKind.Sequential)]
        struct HIDD_ATTRIBUTES
        {
            public uint Size;
            public ushort VendorID;
            public ushort ProductID;
            public ushort VersionNumber;
        }

        const uint DIGCF_PRESENT        = 0x02;
        const uint DIGCF_DEVICEINTERFACE = 0x10;
        const uint GENERIC_READ         = 0x80000000;
        const uint FILE_SHARE_READ      = 0x01;
        const uint FILE_SHARE_WRITE     = 0x02;
        const uint OPEN_EXISTING        = 3;
        static readonly IntPtr INVALID_HANDLE = new IntPtr(-1);

        // ── Public ─────────────────────────────────────────────────────────
        public event Action OnButtonPressed;

        private readonly ushort _vid;
        private readonly List<Thread> _threads = new List<Thread>();
        private volatile bool _stop;

        public HidButtonWatcher(ushort vid) { _vid = vid; }

        public void Start()
        {
            // Enumerate ALL HID devices and log VID/PID — helps identify the
            // correct Dino-Lite VID if 0xA168 turns out to be wrong.
            var allPaths = FindAllHidPaths();
            Console.WriteLine("HID:All HID devices (" + allPaths.Count + "):");
            foreach (var p in allPaths)
            {
                // Device path contains vid_xxxx&pid_xxxx — extract and log it
                int s = p.IndexOf("vid_", StringComparison.OrdinalIgnoreCase);
                string tag = s >= 0 ? p.Substring(s, Math.Min(20, p.Length - s)) : p;
                Console.WriteLine("HID:  " + tag);
            }
            Console.Out.Flush();

            var paths = allPaths.FindAll(p =>
                p.IndexOf("vid_" + _vid.ToString("x4"),
                    StringComparison.OrdinalIgnoreCase) >= 0);
            Console.WriteLine("HID:Matched " + paths.Count + " for VID 0x"
                + _vid.ToString("X4"));
            Console.Out.Flush();

            foreach (var path in paths)
            {
                var p = path; // closure capture
                var t = new Thread(() => ReadLoop(p)) { IsBackground = true };
                _threads.Add(t);
                t.Start();
            }
        }

        public void Stop()
        {
            _stop = true;
        }

        // ── Private ────────────────────────────────────────────────────────

        private void ReadLoop(string devicePath)
        {
            IntPtr hDev = CreateFile(devicePath,
                GENERIC_READ,
                FILE_SHARE_READ | FILE_SHARE_WRITE,
                IntPtr.Zero, OPEN_EXISTING, 0, IntPtr.Zero);

            if (hDev == INVALID_HANDLE)
            {
                // Device is held exclusively — common for HID devices owned by
                // the DNVideoX driver or Windows HID subsystem. Log so we know.
                Console.WriteLine("HID:Cannot open (exclusive): "
                    + System.IO.Path.GetFileName(devicePath));
                Console.Out.Flush();
                return;
            }

            Console.WriteLine("HID:Listening on " + devicePath);
            Console.Out.Flush();

            byte[] buf     = new byte[64];
            byte[] neutral = null;
            DateTime lastFire = DateTime.MinValue;

            try
            {
                while (!_stop)
                {
                    uint bytesRead;
                    if (!ReadFile(hDev, buf, (uint)buf.Length, out bytesRead, IntPtr.Zero))
                        break; // device disconnected

                    if (bytesRead == 0) continue;

                    byte[] report = new byte[bytesRead];
                    Array.Copy(buf, report, bytesRead);

                    if (neutral == null)
                    {
                        // First report = idle/neutral state
                        neutral = report;
                        continue;
                    }

                    // Any change from neutral = interaction detected
                    if (!ReportsEqual(report, neutral))
                    {
                        // Debounce: ignore repeats within 500 ms
                        if ((DateTime.Now - lastFire).TotalMilliseconds > 500)
                        {
                            lastFire = DateTime.Now;
                            Console.WriteLine("HID:ButtonPress detected on "
                                + System.IO.Path.GetFileName(devicePath)
                                + " report=" + BitConverter.ToString(report));
                            Console.Out.Flush();
                            OnButtonPressed?.Invoke();
                        }
                        // Reset neutral so next read establishes new baseline
                        neutral = report;
                    }
                }
            }
            finally
            {
                CloseHandle(hDev);
            }
        }

        private static bool ReportsEqual(byte[] a, byte[] b)
        {
            if (a.Length != b.Length) return false;
            for (int i = 0; i < a.Length; i++)
                if (a[i] != b[i]) return false;
            return true;
        }

        private static List<string> FindAllHidPaths()
        {
            var results = new List<string>();
            HidD_GetHidGuid(out Guid hidGuid);
            IntPtr devInfo = SetupDiGetClassDevs(ref hidGuid, null, IntPtr.Zero,
                DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
            if (devInfo == INVALID_HANDLE) return results;
            try
            {
                uint index = 0;
                var ifaceData = new SP_DEVICE_INTERFACE_DATA();
                ifaceData.cbSize = (uint)Marshal.SizeOf(ifaceData);
                while (SetupDiEnumDeviceInterfaces(devInfo, IntPtr.Zero, ref hidGuid,
                       index++, ref ifaceData))
                {
                    SetupDiGetDeviceInterfaceDetail(devInfo, ref ifaceData,
                        IntPtr.Zero, 0, out uint reqSize, IntPtr.Zero);
                    IntPtr buf = Marshal.AllocHGlobal((int)reqSize);
                    try
                    {
                        Marshal.WriteInt32(buf, IntPtr.Size == 8 ? 8 : 6);
                        if (!SetupDiGetDeviceInterfaceDetail(devInfo, ref ifaceData,
                            buf, reqSize, out _, IntPtr.Zero)) continue;
                        string path = Marshal.PtrToStringAuto(
                            new IntPtr(buf.ToInt64() + 4));
                        if (path != null) results.Add(path);
                    }
                    finally { Marshal.FreeHGlobal(buf); }
                }
            }
            finally { SetupDiDestroyDeviceInfoList(devInfo); }
            return results;
        }

        private static List<string> FindHidPaths(ushort vid)
        {
            var results = new List<string>();

            HidD_GetHidGuid(out Guid hidGuid);
            IntPtr devInfo = SetupDiGetClassDevs(ref hidGuid, null, IntPtr.Zero,
                DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
            if (devInfo == INVALID_HANDLE) return results;

            try
            {
                uint index = 0;
                var ifaceData = new SP_DEVICE_INTERFACE_DATA();
                ifaceData.cbSize = (uint)Marshal.SizeOf(ifaceData);

                while (SetupDiEnumDeviceInterfaces(devInfo, IntPtr.Zero, ref hidGuid,
                       index++, ref ifaceData))
                {
                    // Get required buffer size
                    SetupDiGetDeviceInterfaceDetail(devInfo, ref ifaceData,
                        IntPtr.Zero, 0, out uint reqSize, IntPtr.Zero);

                    IntPtr detailBuf = Marshal.AllocHGlobal((int)reqSize);
                    try
                    {
                        // First DWORD of SP_DEVICE_INTERFACE_DETAIL_DATA is cbSize
                        Marshal.WriteInt32(detailBuf,
                            IntPtr.Size == 8 ? 8 : 6); // x64=8, x86=6

                        if (!SetupDiGetDeviceInterfaceDetail(devInfo, ref ifaceData,
                            detailBuf, reqSize, out _, IntPtr.Zero))
                            continue;

                        // DevicePath starts at offset 4 (after cbSize DWORD)
                        string path = Marshal.PtrToStringAuto(
                            new IntPtr(detailBuf.ToInt64() + 4));

                        // Check VID without opening the device
                        if (path != null && path.IndexOf(
                            "vid_" + vid.ToString("x4"),
                            StringComparison.OrdinalIgnoreCase) >= 0)
                        {
                            results.Add(path);
                        }
                    }
                    finally { Marshal.FreeHGlobal(detailBuf); }
                }
            }
            finally { SetupDiDestroyDeviceInfoList(devInfo); }

            return results;
        }
    }
}
