using System;
using System.Drawing.Imaging;
using System.IO;
using System.Runtime.ExceptionServices;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Forms;
using AxDNVideoXLib;

namespace DinoLiteBridge
{
    public class BridgeForm : Form
    {
        // ── Win32 ──────────────────────────────────────────────────────────
        [DllImport("user32.dll")] static extern bool IsWindowVisible(IntPtr hWnd);
        [DllImport("user32.dll", CharSet = CharSet.Auto)] static extern IntPtr FindWindow(string cls, string title);
        [DllImport("user32.dll")] static extern bool SetWindowPos(IntPtr hWnd, IntPtr after, int x, int y, int w, int h, uint flags);
        [DllImport("user32.dll")] static extern IntPtr SetWindowsHookEx(int id, LowLevelKeyboardProc fn, IntPtr mod, uint threadId);
        [DllImport("user32.dll")] static extern bool UnhookWindowsHookEx(IntPtr hook);
        [DllImport("user32.dll")] static extern IntPtr CallNextHookEx(IntPtr hook, int code, IntPtr wParam, IntPtr lParam);
        [DllImport("kernel32.dll", CharSet = CharSet.Auto)] static extern IntPtr GetModuleHandle(string name);
        delegate IntPtr LowLevelKeyboardProc(int code, IntPtr wParam, IntPtr lParam);
        const uint SWP_NOZORDER   = 0x0004;
        const uint SWP_NOACTIVATE = 0x0010;
        const uint SWP_NOSIZE     = 0x0001; // move only, keep existing size
        const int  WH_KEYBOARD_LL = 13;
        const int  WM_KEYDOWN     = 0x0100;

        // ── Raw Input (RegisterRawInput) ────────────────────────────────────
        [DllImport("user32.dll", SetLastError = true)]
        static extern bool RegisterRawInputDevices(RAWINPUTDEVICE[] devices, uint numDevices, uint cbSize);
        [DllImport("user32.dll")]
        static extern int GetRawInputData(IntPtr hRawInput, uint uiCommand, byte[] pData, ref uint pcbSize, uint cbSizeHeader);
        [DllImport("user32.dll")]
        static extern int GetRawInputDeviceInfo(IntPtr hDevice, uint uiCommand, byte[] pData, ref uint pcbSize);

        [StructLayout(LayoutKind.Sequential)]
        struct RAWINPUTDEVICE { public ushort UsagePage, Usage; public uint Flags; public IntPtr Target; }

        const uint RIDEV_INPUTSINK = 0x00000100;
        // RIDEV_PAGEONLY is required when usUsage == 0 with a non-zero usUsagePage.
        // Without it RegisterRawInputDevices returns ERROR_INVALID_PARAMETER (87).
        const uint RIDEV_PAGEONLY  = 0x00000020;
        const uint RID_INPUT       = 0x10000003;
        const uint RIDI_DEVICENAME = 0x20000007;
        const int  WM_INPUT        = 0x00FF;
        // RAWINPUTHEADER on x86: type(4)+size(4)+hDevice(4)+wParam(4) = 16 bytes
        const int  RAW_HDR         = 16;

        // ── Fields ─────────────────────────────────────────────────────────
        private AxDNVideoX _camera;
        private HidButtonWatcher _hidWatcher;
        private System.Windows.Forms.Timer _frameTimer;
        private readonly string _previewPath;
        private readonly ImageCodecInfo _jpegCodec;
        private readonly EncoderParameters _jpegParams;
        private IntPtr _keyboardHook = IntPtr.Zero;
        private LowLevelKeyboardProc _keyboardProc; // keep delegate alive (no GC)
        private FileSystemWatcher _dinoCaptureFsw;
        private DateTime _watcherStartTime;
        private DateTime _lastCaptureSent = DateTime.MinValue; // debounce
        private bool _readySent; // guards exit-on-error during startup
        private int _ledBrightness      = 6;   // 1-6 (FLC level), -1 = unknown
        private int _ledQuadrant        = 15;  // 1-15 bitmask, 15 = all quadrants on
        // File-based command channel — avoids Console.In pipe issues on Windows.
        // Flutter writes a command to this file; the frame timer polls and clears it.
        private readonly string _cmdPath;

        protected override CreateParams CreateParams
        {
            get
            {
                var cp = base.CreateParams;
                // WS_EX_TOOLWINDOW: keep out of the taskbar/Alt-Tab list.
                // WS_EX_NOACTIVATE REMOVED — DNVideoX EnableMicroTouch(true) returns
                // false when the host window can never be activated.  Removing it lets
                // the OCX set up the UVC XU extension-unit pipeline correctly while the
                // window remains invisible (positioned at -32000,-32000 off-screen).
                cp.ExStyle |= 0x00000080; // WS_EX_TOOLWINDOW only
                return cp;
            }
        }

        public BridgeForm()
        {
            this.Text = "DinoLiteBridge";
            this.ShowInTaskbar = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.StartPosition = FormStartPosition.Manual;
            this.Location = new System.Drawing.Point(-32000, -32000);
            this.Width = 640;
            this.Height = 480;

            _previewPath = Path.Combine(Path.GetTempPath(), "dinolite_preview.jpg");
            _cmdPath     = Path.Combine(Path.GetTempPath(), "dinolite_cmd.txt");

            _jpegCodec = GetJpegCodec();
            _jpegParams = new EncoderParameters(1);
            _jpegParams.Param[0] = new EncoderParameter(
                System.Drawing.Imaging.Encoder.Quality, 85L);

            // Use the WinForms designer's standard AxHost initialization sequence:
            //   BeginInit → add to Controls → EndInit
            // The designer ALWAYS does it this way; using CreateControl() instead
            // skips the ISupportInitialize contract that sets up the ActiveX site
            // correctly, leaving the OCX partially initialised (EnableMicroTouch
            // returns false regardless of timing because the XU pipeline is never
            // properly established by the COM container).
            _camera = new AxDNVideoX();
            ((System.ComponentModel.ISupportInitialize)_camera).BeginInit();
            _camera.Dock = DockStyle.Fill;
            this.Controls.Add(_camera);
            ((System.ComponentModel.ISupportInitialize)_camera).EndInit();

            this.Load += OnFormLoad;
        }

        private void OnFormLoad(object sender, EventArgs e)
        {
            string _step = "start";
            try
            {
                _step = "subscribe";
                _camera.MicroTouchPressed += Camera_MicroTouch;
                _camera.CaptureStart      += Camera_CaptureStart;

                _step = "delete preview";
                try { if (File.Exists(_previewPath)) File.Delete(_previewPath); } catch { }

                _step = "connect";
                // Replicate the DN_sample connect sequence exactly:
                //   v.Connected = false  (reset)
                //   v.PreviewScale = false
                //   v.VideoDeviceIndex = 0
                //   v.UseVideoFilter = vcxBoth (2)   ← required for XU event path
                //   v.Connected = true
                // UseVideoFilter must be set via Enum.ToObject so the property's
                // enum type is matched correctly (plain int 2 causes a type mismatch
                // that SetValue rejects, silently swallowed by the catch).
                try { _camera.Connected = false; } catch { }
                try { _camera.PreviewScale = false; } catch { }
                _camera.VideoDeviceIndex = 0;
                try
                {
                    var ufProp = _camera.GetType().GetProperty("UseVideoFilter");
                    if (ufProp != null)
                    {
                        var val = Enum.ToObject(ufProp.PropertyType, 2);
                        ufProp.SetValue(_camera, val, null);
                        Console.WriteLine("INFO:UseVideoFilter=vcxBoth set");
                    }
                    else Console.WriteLine("INFO:UseVideoFilter property not found");
                    Console.Out.Flush();
                }
                catch (Exception ufEx)
                {
                    Console.WriteLine("INFO:UseVideoFilter failed: " + ufEx.Message);
                    Console.Out.Flush();
                }
                _camera.Connected = true;
                System.Threading.Thread.Sleep(0); // yield message pump (matches sample)

                _step = "sleep500";
                // Let the DirectShow graph fully initialise before arming
                // MicroTouch — calling it too early means the XU pipeline
                // that routes the button signal isn't ready yet.
                System.Threading.Thread.Sleep(500);

                // Verify a real camera is connected by grabbing a test frame.
                // DNVideoX returns null when no device is present.
                // Retry for up to 4 s — some cameras need time to stream first frames.
                // GrabFrame() can throw "generic error in GDI+" during early
                // pipeline init instead of returning null — catch and retry.
                System.Drawing.Image testFrame = null;
                for (int attempt = 0; attempt < 8 && testFrame == null; attempt++)
                {
                    _step = "grabframe-attempt-" + attempt;
                    try { testFrame = _camera.GrabFrame(); }
                    catch { testFrame = null; }
                    if (testFrame == null) System.Threading.Thread.Sleep(500);
                }

                _step = "check-frame";
                if (testFrame == null)
                {
                    Console.WriteLine("ERROR:No Dino-Lite camera detected — plug in the iriscope and retry.");
                    Console.Out.Flush();
                    try { _camera.Connected = false; } catch { }
                    this.BeginInvoke((Action)Application.Exit);
                    return;
                }

                _step = "dispose-test-frame";
                try { testFrame.Dispose(); } catch { } // DirectShow bitmaps can throw on Dispose

                _step = "preview";
                // Enable the built-in preview renderer AFTER confirming the camera
                // is live. Calling Preview=true before a valid frame is ready caused
                // AccessViolationException when no camera was connected.
                try { _camera.Preview = true; } catch { }

                _step = "led-on";
                // Turn on iriscope LEDs. The SDK sample calls LightOn(1) right
                // after Preview = true; we call it here so we know the camera
                // is fully streaming before arming it.
                try
                {
                    _camera.LightOn(1);
                    System.Threading.Thread.Sleep(280); // allow LED to stabilise
                    Console.WriteLine("INFO:LEDs armed (LightOn 1)");
                    Console.Out.Flush();
                }
                catch (Exception ledEx)
                {
                    Console.WriteLine("INFO:LightOn not supported: " + ledEx.Message);
                    Console.Out.Flush();
                }

                _step = "getx-init";
                // The DN_sample calls GetExposure / GetSaturation / GetAWBR/G/B with
                // Sleep(50) between each after connecting.  These XU read commands
                // appear to complete the camera's internal initialisation and are
                // required before EnableMicroTouch(true) will return true.
                try
                {
                    System.Threading.Thread.Sleep(0);
                    _camera.GetExposure(0); System.Threading.Thread.Sleep(50);
                    _camera.GetSaturation(0); System.Threading.Thread.Sleep(50);
                    _camera.GetAWBR(0); System.Threading.Thread.Sleep(50);
                    _camera.GetAWBG(0); System.Threading.Thread.Sleep(50);
                    _camera.GetAWBB(0); System.Threading.Thread.Sleep(50);
                    Console.WriteLine("INFO:GetX init done");
                    Console.Out.Flush();
                }
                catch { /* not fatal if any GetX call fails */ }

                _step = "hide-activemovie";
                // Hide ActiveMovie window immediately after camera connects —
                // before starting the frame timer so there's no visible flash.
                for (int i = 0; i < 20; i++)
                {
                    IntPtr amWnd = FindWindow(null, "ActiveMovie Window");
                    if (amWnd != IntPtr.Zero)
                    {
                        SetWindowPos(amWnd, IntPtr.Zero, -32000, -32000, 0, 0,
                            SWP_NOZORDER | SWP_NOACTIVATE | SWP_NOSIZE);
                        break;
                    }
                    System.Threading.Thread.Sleep(50);
                }

                // ArmMicroTouch is NOT called here — the DN_sample shows that
                // EnableMicroTouch(true) must only be called after the camera has
                // been fully streaming for several seconds (in the sample the user
                // manually ticks a checkbox long after init).  Calling it too early
                // silently fails to arm the XU event path.  We arm it in the
                // re-arm timer below (5 s after READY is sent) instead.

                _step = "hid-watcher";
                // The Dino-Lite Premier has TWO USB interfaces:
                //   Video (UVC): vid_a168  — used by DNVideoX for streaming
                //   Button (HID): vid_30fa — the MicroTouch button HID endpoint
                // Previous builds matched 0 devices because 0xA168 is the video
                // VID; the button sends HID reports under VID 0x30FA instead.
                _hidWatcher = new HidButtonWatcher(0x30FA);
                _hidWatcher.OnButtonPressed += OnHidButtonPressed;
                _hidWatcher.Start();

                _step = "keyboard-hook";
                // Low-level keyboard hook — diagnoses whether the iriscope
                // MicroTouch button generates any Windows key event.
                _keyboardProc = KeyboardHookCallback;
                _keyboardHook = SetWindowsHookEx(
                    WH_KEYBOARD_LL, _keyboardProc,
                    GetModuleHandle(null), 0);

                _step = "raw-input";
                // RegisterRawInput lets us receive HID reports via WM_INPUT
                // without needing exclusive device access (unlike CreateFile).
                // This catches the iriscope button even when the HID device
                // path is locked by the DNVideoX driver.
                RegisterForRawHid();

                _step = "frame-timer";
                _frameTimer = new System.Windows.Forms.Timer();
                _frameTimer.Interval = 100;
                _frameTimer.Tick += (s, ev) => WritePreviewFrame();
                _frameTimer.Start();

                _step = "rearm-timer";
                // EnableMicroTouch(true) arms the XU button event path.
                // Camera_MicroTouch fires regardless of the return value once
                // the event handler is registered, so one attempt is enough.
                // We delay 3 s to let the DirectShow pipeline fully settle.
                var reArmTimer = new System.Windows.Forms.Timer();
                reArmTimer.Interval = 3000;
                reArmTimer.Tick += (s, ev) =>
                {
                    reArmTimer.Stop();
                    bool ok = false;
                    try { ok = _camera.EnableMicroTouch(true); } catch { }
                    Console.WriteLine("INFO:EnableMicroTouch result=" + ok);
                    Console.Out.Flush();
                };
                reArmTimer.Start();

                _step = "start-watcher";
                StartDinoCaptureWatcher();

                _step = "set-ready";
                // Clean up any stale command file from a previous session.
                try { if (File.Exists(_cmdPath)) File.Delete(_cmdPath); } catch { }
                _readySent = true;
                Console.WriteLine("READY:" + _previewPath);
                // Tell Flutter where to write commands — avoids Console.In pipe issues.
                Console.WriteLine("CMD:" + _cmdPath);
                Console.Out.Flush();
            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR:[step=" + _step + "] " + ex.Message);
                Console.Out.Flush();
                // If READY was never sent, exit so Flutter can show Retry.
                if (!_readySent)
                    this.BeginInvoke((Action)Application.Exit);
            }

            var t = new Thread(ReadStdinLoop) { IsBackground = true };
            t.Start();
        }

        private IntPtr KeyboardHookCallback(int nCode, IntPtr wParam, IntPtr lParam)
        {
            if (nCode >= 0 && wParam == (IntPtr)WM_KEYDOWN)
            {
                int vkCode = Marshal.ReadInt32(lParam);
                Console.WriteLine("KEY:" + vkCode + "(" + ((System.Windows.Forms.Keys)vkCode).ToString() + ")");
                Console.Out.Flush();

                // VK_F2 (113) is sent by the Dino-Lite iriscope MicroTouch button.
                // Camera_MicroTouch / HID watcher may not fire on all driver versions,
                // so intercept F2 here as a reliable fallback.
                if (vkCode == 113)
                {
                    Console.WriteLine("INFO:F2 intercepted — queuing capture");
                    Console.Out.Flush();
                    this.BeginInvoke((Action)OnHidButtonPressed);
                }
            }
            return CallNextHookEx(_keyboardHook, nCode, wParam, lParam);
        }

        // Poll the command file written by Flutter. Called from the 100ms frame timer.
        // File-based IPC is used because Console.In pipe may be invalid for GUI processes
        // started by Dart with DETACHED_PROCESS — GetStdHandle(STD_INPUT_HANDLE) returns
        // NULL even when stdin was specified in STARTUPINFO.
        private void PollCommandFile()
        {
            if (!File.Exists(_cmdPath)) return;
            string cmd;
            try
            {
                cmd = File.ReadAllText(_cmdPath).Trim();
                File.Delete(_cmdPath);
            }
            catch { return; } // file locked briefly by writer — retry next tick

            Console.WriteLine("INFO:CMD " + cmd);
            Console.Out.Flush();

            if (cmd == "CAPTURE")
            {
                OnHidButtonPressed();
            }
            else if (cmd == "EXIT")
            {
                _frameTimer?.Stop();
                _hidWatcher?.Stop();
                try { _camera.Connected = false; } catch { }
                Application.Exit();
            }
            else if (cmd == "LEDOFF")
            {
                SetLed(0, -1);
            }
            else if (cmd.StartsWith("LED:"))
            {
                if (int.TryParse(cmd.Substring("LED:".Length), out int bright))
                    SetLed(bright, -1);
            }
            else if (cmd.StartsWith("LEDQ:"))
            {
                if (int.TryParse(cmd.Substring("LEDQ:".Length), out int quad))
                    SetLed(-1, quad);
            }
            else if (cmd.StartsWith("CONNECT:"))
            {
                if (int.TryParse(cmd.Substring("CONNECT:".Length), out int idx))
                    SwitchDevice(idx);
            }
        }

        private void WritePreviewFrame()
        {
            PollCommandFile();

            // Move the DirectShow "ActiveMovie Window" off-screen every tick.
            // We CANNOT use SW_HIDE — hiding the renderer pauses the DirectShow
            // filter graph, which stops frame processing and breaks MicroTouch.
            // Moving it off-screen keeps the pipeline fully active while making
            // it invisible to the user.
            IntPtr amWnd = FindWindow(null, "ActiveMovie Window");
            if (amWnd != IntPtr.Zero && IsWindowVisible(amWnd))
                SetWindowPos(amWnd, IntPtr.Zero, -32000, -32000, 1, 1,
                    SWP_NOZORDER | SWP_NOACTIVATE);

            try
            {
                var raw = _camera.GrabFrame();
                if (raw == null) return;

                // Clone the DirectShow bitmap into a plain 24-bit Bitmap.
                // The raw frame is backed by locked DirectShow memory; saving
                // or disposing it directly throws "GDI+ generic error".
                System.Drawing.Bitmap frame;
                try
                {
                    frame = new System.Drawing.Bitmap(raw.Width, raw.Height,
                        System.Drawing.Imaging.PixelFormat.Format24bppRgb);
                    using (var g = System.Drawing.Graphics.FromImage(frame))
                        g.DrawImage(raw, 0, 0, raw.Width, raw.Height);
                }
                finally { try { raw.Dispose(); } catch { } }

                string tmpPath = _previewPath + ".tmp";

                using (var fs = new FileStream(
                    tmpPath, FileMode.Create, FileAccess.Write, FileShare.None))
                {
                    if (_jpegCodec != null)
                        frame.Save(fs, _jpegCodec, _jpegParams);
                    else
                        frame.Save(fs, ImageFormat.Jpeg);
                }

                frame.Dispose();

                // Replace atomically: readers get either the old or the new
                // complete file, never a partial one.
                if (File.Exists(_previewPath))
                    File.Replace(tmpPath, _previewPath, null);
                else
                    File.Move(tmpPath, _previewPath);
            }
            catch { /* dropped frame — ignore */ }
        }

        // ── RegisterRawInput ──────────────────────────────────────────────────
        private void RegisterForRawHid()
        {
            // RIDEV_PAGEONLY is required when Usage == 0 (meaning "all usages on
            // this page").  Without it the API returns ERROR_INVALID_PARAMETER (87).
            // RIDEV_INPUTSINK receives reports even when our window is not focused.
            // We register three pages to cover every possible Dino-Lite variant:
            //   0x01 – Generic Desktop (buttons, joysticks, digitizers)
            //   0x0C – Consumer controls
            //   0xFF – Vendor-specific (e.g. AnMo/Dino-Lite proprietary reports)
            // HandleRawInput filters by device name (vid_30fa) so unrelated HID
            // reports from other pages/devices are silently dropped.
            const uint flags = RIDEV_INPUTSINK | RIDEV_PAGEONLY;
            var devices = new[]
            {
                new RAWINPUTDEVICE { UsagePage = 0x01, Usage = 0x00, Flags = flags, Target = Handle },
                new RAWINPUTDEVICE { UsagePage = 0x0C, Usage = 0x00, Flags = flags, Target = Handle },
                new RAWINPUTDEVICE { UsagePage = 0xFF, Usage = 0x00, Flags = flags, Target = Handle },
            };
            bool ok = RegisterRawInputDevices(devices, (uint)devices.Length,
                (uint)Marshal.SizeOf(typeof(RAWINPUTDEVICE)));
            Console.WriteLine("INFO:RegisterRawInput " + (ok ? "armed" : "failed:" + Marshal.GetLastWin32Error()));
            Console.Out.Flush();
        }

        protected override void WndProc(ref Message m)
        {
            if (m.Msg == WM_INPUT)
                HandleRawInput(m.LParam);
            base.WndProc(ref m);
        }

        private void HandleRawInput(IntPtr lParam)
        {
            uint size = 0;
            GetRawInputData(lParam, RID_INPUT, null, ref size, RAW_HDR);
            if (size == 0 || size > 4096) return;

            byte[] data = new byte[size];
            if (GetRawInputData(lParam, RID_INPUT, data, ref size, RAW_HDR) <= 0) return;

            // RAWINPUTHEADER.dwType: 0=mouse, 1=keyboard, 2=HID
            if (data.Length < RAW_HDR) return;
            uint type = BitConverter.ToUInt32(data, 0);
            if (type != 2) return; // only HID

            // hDevice at offset 8 (x86: IntPtr = 4 bytes)
            IntPtr hDevice = new IntPtr(BitConverter.ToInt32(data, 8));

            // Get device name and filter to vid_30fa only
            uint nameLen = 0;
            GetRawInputDeviceInfo(hDevice, RIDI_DEVICENAME, null, ref nameLen);
            if (nameLen == 0) return;
            byte[] nameBuf = new byte[nameLen * 2]; // Unicode chars
            GetRawInputDeviceInfo(hDevice, RIDI_DEVICENAME, nameBuf, ref nameLen);
            string devName = System.Text.Encoding.Unicode.GetString(nameBuf).TrimEnd('\0');
            if (devName.IndexOf("vid_30fa", StringComparison.OrdinalIgnoreCase) < 0) return;

            // RAWHID header after RAWINPUTHEADER: dwSizeHid(4) + dwCount(4)
            if (data.Length < RAW_HDR + 8) return;
            uint sizeHid = BitConverter.ToUInt32(data, RAW_HDR);
            uint count   = BitConverter.ToUInt32(data, RAW_HDR + 4);
            int  dataOff = RAW_HDR + 8;
            if (sizeHid == 0 || count == 0 || data.Length < dataOff + sizeHid) return;

            byte[] report = new byte[sizeHid];
            Array.Copy(data, dataOff, report, 0, (int)sizeHid);
            // Any report from the iriscope HID interface = button event.
            OnHidButtonPressed();
        }

        private void ArmMicroTouch()
        {
            // The SDK sample only ever calls EnableMicroTouch(true) — never
            // resets with false first.  Log the return value: true = armed OK,
            // false = internal failure (e.g. XU pipeline not ready yet).
            try
            {
                bool ok = _camera.EnableMicroTouch(true);
                Console.WriteLine("INFO:EnableMicroTouch armed result=" + ok);
                Console.Out.Flush();
            }
            catch (Exception ex)
            {
                Console.WriteLine("INFO:EnableMicroTouch error: " + ex.Message);
                Console.Out.Flush();
            }
        }

        // LightOn can throw AccessViolationException on some firmware versions,
        // which bypasses regular try/catch in .NET Framework and crashes the
        // process. The [HandleProcessCorruptedStateExceptions] attribute makes
        // the CLR route it through managed exception handling so we can swallow it.
        [System.Runtime.ExceptionServices.HandleProcessCorruptedStateExceptions]
        private void SafeLightOn()
        {
            try { _camera.LightOn(1); }
            catch { }
        }

        // ── DinoCapture folder watcher ────────────────────────────────────────
        private void StartDinoCaptureWatcher()
        {
            // Look for DinoCapture's save folder in its known locations.
            // The user's folder was confirmed as:
            //   Documents\Digital Microscope\Default
            string docs = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string[] candidates = {
                Path.Combine(docs, "Digital Microscope", "Default"),
                Path.Combine(docs, "DinoCapture", "Default"),
                Path.Combine(docs, "DinoCapture"),
            };

            string watchPath = null;
            foreach (var c in candidates)
                if (Directory.Exists(c)) { watchPath = c; break; }

            if (watchPath == null)
            {
                Console.WriteLine("INFO:DinoCapture folder not found — folder watcher disabled");
                Console.Out.Flush();
                return;
            }

            // DinoCapture cannot capture while our bridge holds the camera exclusively
            // (DNVideoX Connected=true gives us exclusive DirectShow access).
            // Launching DinoCapture serves no purpose and may interfere with the UVC
            // XU extension-unit routing that Camera_MicroTouch depends on.
            Console.WriteLine("INFO:DinoCapture launch skipped (bridge owns camera)");
            Console.Out.Flush();

            _watcherStartTime = DateTime.Now;
            _dinoCaptureFsw = new FileSystemWatcher(watchPath)
            {
                // Watch for any image format DinoCapture might write.
                // IncludeSubdirectories = true catches date-based subfolders
                // that DinoCapture creates (e.g. Default\2026-03-18\).
                Filter = "*.*",
                NotifyFilter = NotifyFilters.FileName,
                IncludeSubdirectories = true,
                EnableRaisingEvents = true,
            };

            _dinoCaptureFsw.Created += OnDinoCaptureFileCreated;
            _dinoCaptureFsw.Renamed += (s, e) => OnDinoCaptureFileCreated(s,
                new FileSystemEventArgs(WatcherChangeTypes.Created, Path.GetDirectoryName(e.FullPath), e.Name));

            Console.WriteLine("INFO:Watching DinoCapture folder: " + watchPath);
            Console.Out.Flush();
        }

        private static void LaunchDinoCaptureIfNeeded()
        {
            // Check if DinoCapture is already running
            if (System.Diagnostics.Process.GetProcessesByName("DinoCapture").Length > 0 ||
                System.Diagnostics.Process.GetProcessesByName("DinoCapture2").Length > 0)
            {
                Console.WriteLine("INFO:DinoCapture already running");
                Console.Out.Flush();
                return;
            }

            // Common install paths
            string[] exePaths = {
                @"C:\Program Files\AnMo Electronics Corporation\DinoCapture 2.0\DinoCapture.exe",
                @"C:\Program Files (x86)\AnMo Electronics Corporation\DinoCapture 2.0\DinoCapture.exe",
                @"C:\Program Files\AnMo Electronics\DinoCapture 2.0\DinoCapture.exe",
                @"C:\Program Files (x86)\AnMo Electronics\DinoCapture 2.0\DinoCapture.exe",
                @"C:\Program Files\DinoCapture 2.0\DinoCapture.exe",
                @"C:\Program Files (x86)\DinoCapture 2.0\DinoCapture.exe",
            };

            foreach (var path in exePaths)
            {
                if (!File.Exists(path)) continue;
                try
                {
                    var psi = new System.Diagnostics.ProcessStartInfo(path)
                    {
                        WindowStyle = System.Diagnostics.ProcessWindowStyle.Minimized,
                        UseShellExecute = true,
                    };
                    System.Diagnostics.Process.Start(psi);
                    Console.WriteLine("INFO:DinoCapture launched: " + path);
                    Console.Out.Flush();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("INFO:DinoCapture launch failed: " + ex.Message);
                    Console.Out.Flush();
                }
                return;
            }

            Console.WriteLine("INFO:DinoCapture not found — MicroTouch button disabled, use on-screen button");
            Console.Out.Flush();
        }

        private void OnDinoCaptureFileCreated(object sender, FileSystemEventArgs e)
        {
            // Only process image files
            string ext = Path.GetExtension(e.FullPath).ToLowerInvariant();
            if (ext != ".jpg" && ext != ".jpeg" && ext != ".bmp" && ext != ".png") return;

            // Debounce — ignore if another capture was sent within 1 second
            if ((DateTime.Now - _lastCaptureSent).TotalMilliseconds < 1000) return;
            _lastCaptureSent = DateTime.Now;

            // Wait for DinoCapture to finish writing — BMP files can be large
            System.Threading.Thread.Sleep(600);

            try
            {
                string capturePath = Path.Combine(
                    Path.GetTempPath(),
                    "dinolite_capture_" + DateTime.Now.Ticks + ".jpg");

                // Load and re-encode as JPEG so Flutter always receives a valid
                // JPEG regardless of what format DinoCapture saved (usually BMP).
                // Clone to a plain 24-bit bitmap first — the raw GDI image may
                // be backed by a memory-mapped file and throw on Save.
                using (var raw = System.Drawing.Image.FromFile(e.FullPath))
                {
                    var bmp = new System.Drawing.Bitmap(raw.Width, raw.Height,
                        System.Drawing.Imaging.PixelFormat.Format24bppRgb);
                    try
                    {
                        using (var g = System.Drawing.Graphics.FromImage(bmp))
                            g.DrawImage(raw, 0, 0, raw.Width, raw.Height);

                        using (var fs = new FileStream(
                            capturePath, FileMode.Create, FileAccess.Write, FileShare.None))
                        {
                            if (_jpegCodec != null)
                                bmp.Save(fs, _jpegCodec, _jpegParams);
                            else
                                bmp.Save(fs, System.Drawing.Imaging.ImageFormat.Jpeg);
                        }
                    }
                    finally { try { bmp.Dispose(); } catch { } }
                }

                Console.WriteLine("INFO:DinoCapture file: " + e.Name);
                Console.WriteLine("MICROTOUCH:" + capturePath);
                Console.Out.Flush();
            }
            catch (Exception ex)
            {
                // WARN (not ERROR) — non-fatal; Flutter must not reset _dinoReady
                Console.WriteLine("WARN:DinoCapture watcher: " + ex.Message);
                Console.Out.Flush();
            }
        }

        // ── DNVideoX COM events ────────────────────────────────────────────────
        private void Camera_MicroTouch(object sender, EventArgs e)
        {
            Console.WriteLine("INFO:MicroTouchPressed event fired!");
            Console.Out.Flush();
            OnHidButtonPressed(); // reuse capture logic
        }

        private void Camera_CaptureStart(object sender, EventArgs e)
        {
            // CaptureStart fires whenever DNVideoX starts a capture,
            // including from MicroTouch if Edge3Driver is installed.
            Console.WriteLine("INFO:CaptureStart event fired!");
            Console.Out.Flush();
            OnHidButtonPressed();
        }

        // GrabFrame() can throw AccessViolationException (corrupted-state exception)
        // which bypasses catch(Exception) in .NET 4+. The attribute below routes
        // it through managed handling so we can fall back to the preview file.
        [System.Runtime.ExceptionServices.HandleProcessCorruptedStateExceptions]
        private void OnHidButtonPressed()
        {
            // Called from the HID reader background thread — marshal to UI
            // thread so GrabFrame (COM STA) is called safely.
            if (this.InvokeRequired)
            {
                this.Invoke((Action)OnHidButtonPressed);
                return;
            }

            // Debounce — multiple triggers (F2 hook + Camera_MicroTouch + HID)
            // can fire within milliseconds of each other for one button press.
            if ((DateTime.Now - _lastCaptureSent).TotalMilliseconds < 1000)
            {
                Console.WriteLine("INFO:Capture debounced (< 1s since last)");
                Console.Out.Flush();
                return;
            }
            _lastCaptureSent = DateTime.Now;
            Console.WriteLine("INFO:OnHidButtonPressed — grabbing frame");
            Console.Out.Flush();

            try
            {
                string capturePath = Path.Combine(
                    Path.GetTempPath(),
                    "dinolite_capture_" + DateTime.Now.Ticks + ".jpg");

                var raw = _camera.GrabFrame();
                if (raw != null)
                {
                    // Clone DirectShow frame into a plain bitmap before saving —
                    // the raw frame is backed by locked DirectShow memory and
                    // throws "GDI+ generic error" if saved directly.
                    System.Drawing.Bitmap frame;
                    try
                    {
                        frame = new System.Drawing.Bitmap(raw.Width, raw.Height,
                            System.Drawing.Imaging.PixelFormat.Format24bppRgb);
                        using (var g = System.Drawing.Graphics.FromImage(frame))
                            g.DrawImage(raw, 0, 0, raw.Width, raw.Height);
                    }
                    finally { try { raw.Dispose(); } catch { } }

                    using (var fs = new FileStream(
                        capturePath, FileMode.Create, FileAccess.Write, FileShare.None))
                    {
                        if (_jpegCodec != null)
                            frame.Save(fs, _jpegCodec, _jpegParams);
                        else
                            frame.Save(fs, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    frame.Dispose();
                }
                else if (File.Exists(_previewPath))
                {
                    // Camera returned null frame — fall back to last preview
                    File.Copy(_previewPath, capturePath, overwrite: true);
                }
                else
                {
                    Console.WriteLine("ERROR:Capture failed — no frame available");
                    Console.Out.Flush();
                    return;
                }

                Console.WriteLine("MICROTOUCH:" + capturePath);
                Console.Out.Flush();
            }
            catch (Exception ex)
            {
                // WARN (not ERROR) — capture failed but camera is still live.
                // Fall back to the last preview frame so the capture still completes.
                Console.WriteLine("WARN:capture error (" + ex.GetType().Name + "): " + ex.Message);
                Console.Out.Flush();
                try
                {
                    string fallback = Path.Combine(
                        Path.GetTempPath(),
                        "dinolite_capture_err_" + DateTime.Now.Ticks + ".jpg");
                    if (File.Exists(_previewPath))
                    {
                        File.Copy(_previewPath, fallback, overwrite: true);
                        Console.WriteLine("MICROTOUCH:" + fallback);
                        Console.Out.Flush();
                    }
                }
                catch { }
            }
        }

        private void ReadStdinLoop()
        {
            try
            {
                string line;
                while ((line = Console.ReadLine()) != null)
                {
                    line = line.Trim();
                    if (line == "EXIT")
                    {
                        this.Invoke((Action)(() =>
                        {
                            _frameTimer?.Stop();
                            _hidWatcher?.Stop();
                            try { _camera.Connected = false; } catch { }
                            Application.Exit();
                        }));
                        return;
                    }
                    else if (line == "CAPTURE")
                    {
                        // Manual capture from the Flutter shutter button —
                        // grab the current frame and return it as MICROTOUCH.
                        Console.WriteLine("INFO:RECV CAPTURE — grabbing frame");
                        Console.Out.Flush();
                        this.Invoke((Action)OnHidButtonPressed);
                    }
                    else if (line.StartsWith("CONNECT:"))
                    {
                        if (int.TryParse(line.Substring("CONNECT:".Length), out int idx))
                            this.Invoke((Action)(() => SwitchDevice(idx)));
                    }
                    else if (line == "LEDOFF")
                    {
                        this.Invoke((Action)(() => SetLed(0, -1)));
                    }
                    else if (line.StartsWith("LED:"))
                    {
                        // LED:<brightness 1-6>  — FLC brightness level
                        if (int.TryParse(line.Substring("LED:".Length), out int bright))
                            this.Invoke((Action)(() => SetLed(bright, -1)));
                    }
                    else if (line.StartsWith("LEDQ:"))
                    {
                        // LEDQ:<quadrant 1-15>  — FLC quadrant mask
                        if (int.TryParse(line.Substring("LEDQ:".Length), out int quad))
                            this.Invoke((Action)(() => SetLed(-1, quad)));
                    }
                }
            }
            catch { this.Invoke((Action)(Application.Exit)); }
        }

        // ── LED control ───────────────────────────────────────────────────────
        // bright: 1-6 = FLC brightness level, 0 = LEDs off, -1 = keep current
        // quad:   1-15 = FLC quadrant mask (15 = all on),   -1 = keep current
        private void SetLed(int bright, int quad)
        {
            try
            {
                int devIdx = _camera.VideoDeviceIndex;

                if (bright == 0)
                {
                    // Turn off all LEDs
                    _camera.LightOn(0);
                    _ledBrightness = 0;
                    Console.WriteLine("INFO:LED off");
                    Console.Out.Flush();
                    return;
                }

                // Make sure LEDs are on first
                _camera.LightOn(1);

                if (bright > 0)
                {
                    _ledBrightness = bright;
                    try
                    {
                        _camera.SetFLCLevel(devIdx, bright);
                        Console.WriteLine("INFO:LED brightness=" + bright);
                    }
                    catch
                    {
                        // Model may not support FLC level — not an error
                        Console.WriteLine("INFO:SetFLCLevel not supported, LightOn only");
                    }
                    Console.Out.Flush();
                }

                if (quad > 0)
                {
                    _ledQuadrant = quad;
                    try
                    {
                        _camera.SetFLCSwitch(devIdx, quad);
                        Console.WriteLine("INFO:LED quadrant=" + quad);
                    }
                    catch
                    {
                        Console.WriteLine("INFO:SetFLCSwitch not supported");
                    }
                    Console.Out.Flush();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("INFO:LED control error: " + ex.Message);
                Console.Out.Flush();
            }
        }

        private void SwitchDevice(int deviceIndex)
        {
            try
            {
                _frameTimer?.Stop();
                _camera.EnableMicroTouch(false);
                _camera.Connected = false;
                _camera.VideoDeviceIndex = deviceIndex;
                _camera.Connected = true;
                try { _camera.LightOn(1); System.Threading.Thread.Sleep(280); } catch { }
                _camera.EnableMicroTouch(true);
                _frameTimer?.Start();
                Console.WriteLine("READY:" + _previewPath);
                Console.Out.Flush();
            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR:" + ex.Message);
                Console.Out.Flush();
            }
        }

        protected override void OnFormClosed(FormClosedEventArgs e)
        {
            if (_keyboardHook != IntPtr.Zero)
            {
                UnhookWindowsHookEx(_keyboardHook);
                _keyboardHook = IntPtr.Zero;
            }
            _dinoCaptureFsw?.Dispose();
            _frameTimer?.Stop();
            _hidWatcher?.Stop();
            try { _camera.Connected = false; } catch { }
            _camera.Dispose();
            base.OnFormClosed(e);
        }

        private static ImageCodecInfo GetJpegCodec()
        {
            foreach (var codec in ImageCodecInfo.GetImageEncoders())
                if (codec.MimeType == "image/jpeg") return codec;
            return null;
        }
    }
}
