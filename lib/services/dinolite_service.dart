import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

/// Manages the 32-bit DNVideoX bridge process.
///
/// The bridge owns the camera exclusively so DNVideoX can receive MicroTouch
/// events. Flutter must NOT open a CameraController for the same device.
///
/// Preview: bridge writes frames to a temp JPEG file; Flutter polls that file.
/// Capture: bridge sends MICROTOUCH:<path> when the iriscope button is pressed.
class DinoLiteService {
  Process? _process;
  StreamSubscription<String>? _stdoutSub;
  StreamSubscription<String>? _stderrSub;

  final _captureController = StreamController<String>.broadcast();
  final _statusController = StreamController<DinoLiteStatus>.broadcast();

  /// Path to the JPEG preview file the bridge updates at ~10 fps.
  /// Non-null only after [onStatus] emits a [DinoLiteStatus.ready] event.
  String? previewFilePath;

  /// Path to the command file the bridge polls every 100ms.
  /// Non-null after the bridge prints CMD:<path> at startup.
  String? _cmdFilePath;

  /// Fires with a JPEG file path each time the MicroTouch button is pressed.
  Stream<String> get onCapture => _captureController.stream;

  /// Status / error events from the bridge.
  Stream<DinoLiteStatus> get onStatus => _statusController.stream;

  bool get isRunning => _process != null;

  Future<void> start() async {
    if (_process != null) return;

    // Kill any stale bridge process left over from a previous app session.
    // Without this, the old process holds the camera exclusively and the
    // new bridge fails to connect with "No Dino-Lite camera detected".
    try {
      await Process.run(
        'taskkill', ['/F', '/IM', 'dinolite_bridge.exe'],
        runInShell: false,
      );
    } catch (_) {} // no-op if not running or taskkill fails

    final exePath = _bridgeExePath();
    if (!File(exePath).existsSync()) {
      throw DinoLiteException(
        'Bridge not found at $exePath.\n'
        'Build windows/dinolite_bridge/dinolite_bridge.sln (Release|x86) first.',
      );
    }

    _process = await Process.start(exePath, [], runInShell: false);

    _stdoutSub = _process!.stdout
        .transform(const SystemEncoding().decoder)
        .transform(const LineSplitter())
        .cast<String>()
        .listen(_handleLine, onDone: _onProcessDone);

    _stderrSub = _process!.stderr
        .transform(const SystemEncoding().decoder)
        .transform(const LineSplitter())
        .cast<String>()
        .listen((line) {
      if (line.trim().isNotEmpty) {
        _statusController.add(DinoLiteStatus.error('Bridge: $line'));
      }
    });

    _process!.exitCode.then((_) => _onProcessDone());
  }

  Future<void> stop() async {
    if (_process == null) return;
    _sendCommand('EXIT');
    await _process!.exitCode.timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        _process?.kill();
        return -1;
      },
    );
    await _cleanup();
  }

  void switchDevice(int index) => _sendCommand('CONNECT:$index');

  /// Triggers a manual capture via the bridge's GrabFrame — used when the
  /// on-screen shutter button is pressed instead of the iriscope button.
  void sendCapture() => _sendCommand('CAPTURE');

  /// LED brightness: 1 (dim) – 6 (full). Uses FLC level if supported.
  void setLedBrightness(int level) {
    assert(level >= 1 && level <= 6);
    _sendCommand('LED:$level');
  }

  /// LED quadrant mask: 1–15 (15 = all quadrants on). Uses FLC switch.
  void setLedQuadrant(int mask) {
    assert(mask >= 1 && mask <= 15);
    _sendCommand('LEDQ:$mask');
  }

  /// Turn all LEDs off.
  void setLedOff() => _sendCommand('LEDOFF');

  // ---------------------------------------------------------------------------

  void _handleLine(String line) {
    line = line.trim();
    if (line.startsWith('READY:')) {
      previewFilePath = line.substring('READY:'.length);
      _statusController.add(DinoLiteStatus.ready(previewFilePath!));
    } else if (line.startsWith('CMD:')) {
      // Bridge tells us where to write commands (file-based IPC).
      _cmdFilePath = line.substring('CMD:'.length);
    } else if (line.startsWith('MICROTOUCH:')) {
      _captureController.add(line.substring('MICROTOUCH:'.length));
    } else if (line.startsWith('ERROR:')) {
      _statusController.add(DinoLiteStatus.error(line.substring('ERROR:'.length)));
    } else if (line.startsWith('WARN:')) {
      // Non-fatal warning — log only, do NOT reset dinoReady in the UI.
      _statusController.add(DinoLiteStatus.info('⚠️ ${line.substring("WARN:".length)}'));
    } else if (line.isNotEmpty) {
      // Forward any other bridge output (HID diagnostics etc.) to Flutter log
      _statusController.add(DinoLiteStatus.info(line));
    }
  }

  void _sendCommand(String cmd) {
    // Primary: write to the command file the bridge polls every 100ms.
    // Console.In stdin pipe is unreliable for GUI processes started by Dart
    // (DETACHED_PROCESS causes GetStdHandle to return NULL even when STARTUPINFO
    // specifies the pipe handle). The file channel is unconditionally reliable.
    final path = _cmdFilePath;
    if (path != null) {
      try {
        File(path).writeAsBytesSync(
          Uint8List.fromList(utf8.encode(cmd)),
        );
        return;
      } catch (_) {}
    }
    // Fallback: stdin (works if bridge was started in a mode that keeps stdin valid).
    try {
      _process?.stdin.writeln(cmd);
      _process?.stdin.flush();
    } catch (_) {}
  }

  void _onProcessDone() {
    // Only emit error if the process exited without us asking it to.
    // (When we send EXIT the process exits cleanly and _process is already null.)
    if (_process != null) {
      _statusController.add(DinoLiteStatus.error('Bridge process exited'));
    }
    _cleanup();
  }

  Future<void> _cleanup() async {
    await _stdoutSub?.cancel();
    await _stderrSub?.cancel();
    _stdoutSub = null;
    _stderrSub = null;
    _process = null;
    previewFilePath = null;
    _cmdFilePath = null;
  }

  void dispose() {
    stop();
    if (!_captureController.isClosed) _captureController.close();
    if (!_statusController.isClosed) _statusController.close();
  }

  static String _bridgeExePath() {
    final exeDir = File(Platform.resolvedExecutable).parent.path;
    return '$exeDir/dinolite_bridge/dinolite_bridge.exe';
  }
}

// ---------------------------------------------------------------------------

enum DinoLiteStatusType { ready, error, info }

class DinoLiteStatus {
  final DinoLiteStatusType type;
  final String? message;

  DinoLiteStatus.ready(this.message) : type = DinoLiteStatusType.ready;
  DinoLiteStatus.error(this.message) : type = DinoLiteStatusType.error;
  DinoLiteStatus.info(this.message)  : type = DinoLiteStatusType.info;
}

class DinoLiteException implements Exception {
  final String message;
  DinoLiteException(this.message);
  @override
  String toString() => 'DinoLiteException: $message';
}
