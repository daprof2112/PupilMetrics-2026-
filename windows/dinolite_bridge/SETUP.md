# Dino-Lite MicroTouch Bridge – Setup Instructions

## One-time machine setup

1. **Register the COM control** (run once per machine, as Administrator):
   ```
   regsvr32 "C:\path\to\DNVideoX.ocx"
   ```
   The OCX and its required DLLs must all be in the same folder:
   - `DNVideoX.ocx`
   - `ClientPropertyPageLIB.dll`
   - `d3dx9_31.dll`
   - `SMIUtility.dll`

## One-time build setup

2. **Copy the interop DLLs** from the SDK into this folder:
   ```
   DNVideoX SDK/Samples/Sample_C#/DLL/Release/AxInterop.DNVideoXLib.dll  →  here
   DNVideoX SDK/Samples/Sample_C#/DLL/Release/Interop.DNVideoXLib.dll    →  here
   ```
   Also copy the runtime DLLs that must ship with the bridge exe:
   ```
   DNVideoX SDK/ClientPropertyPageLIB.dll  →  here
   DNVideoX SDK/d3dx9_31.dll               →  here
   ```

3. **Build the bridge** (must be x86 / 32-bit):
   - Open `dinolite_bridge.sln` in Visual Studio 2019 or later
   - Set configuration to **Release | x86**
   - Build → output goes to `bin\Release\`

## Flutter build

4. Run `flutter build windows` as normal.
   CMake will automatically copy `bin\Release\` into:
   ```
   build\windows\x64\runner\Release\dinolite_bridge\
   ```

## How it works at runtime

- When the user opens the USB/UVC camera screen, `DinoLiteService` spawns
  `dinolite_bridge.exe` as a child process.
- The bridge hosts the 32-bit `DNVideoX.ocx` ActiveX control and calls
  `EnableMicroTouch(true)`.
- When the physical button on the iriscope is pressed, the bridge calls
  `GrabFrame()`, saves a JPEG to `%TEMP%`, and writes `MICROTOUCH:<path>`
  to stdout.
- Flutter reads that line and routes the image through the normal capture
  flow (same as tapping the on-screen shutter button).
- A green "MicroTouch" indicator appears in the camera screen status bar
  once the bridge signals it is ready.
