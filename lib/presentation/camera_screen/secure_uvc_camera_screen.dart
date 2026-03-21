// lib/presentation/camera_screen/secure_uvc_camera_screen.dart
// USB/External Camera Screen - Cross-platform support
// v5.4.0 - Windows: bridge-owned camera so DNVideoX MicroTouch events fire
//          Non-Windows: standard camera plugin

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/right_eye_screen/take_right_eye_photo_screen.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/utils/usb_camera_utils.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/services/dinolite_service.dart';
import 'package:camera/camera.dart';

// =============================================================================
// MAIN ENTRY POINT
// =============================================================================
class SecureUvcCameraScreen extends StatelessWidget {
  final bool isRightEye;
  const SecureUvcCameraScreen({super.key, required this.isRightEye});

  @override
  Widget build(BuildContext context) {
    return UnifiedCameraScreen(isRightEye: isRightEye);
  }
}

// =============================================================================
// UNIFIED CAMERA SCREEN
// Windows: bridge owns the camera, preview via temp-file polling
// Other:   standard camera plugin
// =============================================================================
class UnifiedCameraScreen extends StatefulWidget {
  final bool isRightEye;
  const UnifiedCameraScreen({super.key, required this.isRightEye});

  @override
  State<UnifiedCameraScreen> createState() => _UnifiedCameraScreenState();
}

class _UnifiedCameraScreenState extends State<UnifiedCameraScreen> {

  // ── Non-Windows camera plugin state ───────────────────────────────────────
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;
  bool _isInitialized = false;

  // ── Windows bridge state ───────────────────────────────────────────────────
  // Use the global singleton so the bridge stays alive between eye captures
  // and doesn't need to reconnect the camera each time.
  DinoLiteService get _dinoService => globalDinoService!;
  StreamSubscription<String>? _dinoCaptureSub;
  StreamSubscription<DinoLiteStatus>? _dinoStatusSub;
  bool _dinoReady = false;
  bool _bridgeStarted = false;    // guard against multiple starts
  String? _previewFilePath;       // temp file the bridge writes frames into
  Uint8List? _previewBytes;       // raw bytes read from the file each tick
  Timer? _previewPollTimer;

  // ── Shared state ──────────────────────────────────────────────────────────
  bool _isCapturing = false;
  bool _isLoadingCameras = true;
  String? _errorMessage;

  bool get _usingBridge => Platform.isWindows;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    if (_usingBridge) {
      _startBridge();
    } else {
      _initializeCameras();
    }
  }

  @override
  void dispose() {
    _previewPollTimer?.cancel();
    _dinoCaptureSub?.cancel();
    _dinoStatusSub?.cancel();
    // Do NOT dispose the global bridge — it stays alive between eye captures.
    // Only dispose a locally-owned non-Windows controller.
    _controller?.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Windows bridge mode
  // ---------------------------------------------------------------------------
  Future<void> _startBridge() async {
    if (_bridgeStarted) return;   // prevent duplicate starts
    _bridgeStarted = true;

    // Cancel any lingering subscriptions from a previous screen visit
    await _dinoCaptureSub?.cancel();
    await _dinoStatusSub?.cancel();

    // If the bridge is running but has no preview (error/startup failure),
    // stop it first so start() launches a clean new process.
    if (_dinoService.isRunning && _dinoService.previewFilePath == null) {
      await _dinoService.stop();
    }

    // If the singleton bridge is already running and ready (e.g. returning
    // from right-eye screen), re-subscribe without restarting the process.
    if (_dinoService.isRunning) {
      _dinoStatusSub = _dinoService.onStatus.listen((s) {
        if (!mounted) return;
        if (s.type == DinoLiteStatusType.ready) {
          setState(() {
            _previewFilePath = _dinoService.previewFilePath;
            _dinoReady = true;
            _isLoadingCameras = false;
            _isInitialized = true;
          });
          _startPreviewTimer();
        } else if (s.type == DinoLiteStatusType.info) {
          debugPrint('🔌 Bridge: ${s.message}');
        } else {
          setState(() { _errorMessage = s.message ?? 'Bridge error'; _isLoadingCameras = false; });
        }
      });
      _dinoCaptureSub = _dinoService.onCapture.listen(_handleBridgeCapture);
      // Bridge already ready (singleton re-entry) — restore state immediately
      if (_dinoService.previewFilePath != null) {
        setState(() {
          _previewFilePath = _dinoService.previewFilePath;
          _dinoReady = true;
          _isLoadingCameras = false;
          _isInitialized = true;
        });
        _startPreviewTimer();
      }
      return;
    }

    setState(() { _isLoadingCameras = true; _errorMessage = null; });
    try {
      await _dinoService.start();

      _dinoStatusSub = _dinoService.onStatus.listen((s) {
        if (!mounted) return;
        if (s.type == DinoLiteStatusType.ready) {
          setState(() {
            _previewFilePath = _dinoService.previewFilePath;
            _dinoReady = true;
            _isLoadingCameras = false;
            _isInitialized = true;
          });
          _startPreviewTimer();
          debugPrint('✅ Dino-Lite MicroTouch armed, preview at $_previewFilePath');
        } else if (s.type == DinoLiteStatusType.info) {
          debugPrint('🔌 Bridge: ${s.message}');
        } else {
          // Bridge reported an error (e.g. no camera connected).
          // Reset bridgeStarted so the refresh button can retry.
          _bridgeStarted = false;
          setState(() {
            // ??= keeps the first error — "Bridge process exited" fires
            // right after the camera-not-found error and must not overwrite it.
            _errorMessage ??= s.message ?? 'Dino-Lite camera not detected.\nPlug in the iriscope and tap Retry.';
            _isLoadingCameras = false;
            _dinoReady = false;
          });
          debugPrint('⚠️ Dino-Lite: ${s.message}');
        }
      });

      _dinoCaptureSub = _dinoService.onCapture.listen(_handleBridgeCapture);
    } catch (e) {
      debugPrint('ℹ️ Dino-Lite bridge not available: $e');
      _bridgeStarted = false; // allow retry via refresh button
      setState(() { _isLoadingCameras = false; });
      _initializeCameras();
    }
  }

  void _startPreviewTimer() {
    _previewPollTimer?.cancel();
    _previewPollTimer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) async {
        if (!mounted || _previewFilePath == null) return;
        try {
          final bytes = await File(_previewFilePath!).readAsBytes();
          // Only check the JPEG SOI marker — bridge uses atomic File.Replace
          // so partial files cannot occur, and the strict EOI check was
          // preventing valid frames from rendering.
          if (bytes.length > 2 && bytes[0] == 0xFF && bytes[1] == 0xD8) {
            if (mounted) setState(() => _previewBytes = bytes);
          }
        } catch (_) {}
      },
    );
  }

  Future<void> _handleBridgeCapture(String imagePath) async {
    if (!mounted) return;
    setState(() => _isCapturing = true);
    try {
      final bytes = await File(imagePath).readAsBytes();

      // Validate the captured image is actually an eye before proceeding.
      // Use a looser check tuned for iriscope images: ignore aspect ratio
      // (iriscopes output widescreen 1920×1080) and require only 2 of the 4
      // core eye checks (circle, dark center, texture, concentric circles).
      // This rejects obvious non-eyes (walls, hands, food) without being so
      // strict that it rejects valid close-up iriscope eye images.
      if (!_isEyeImage(await EyeValidator().validateBytes(bytes))) {
        if (mounted) _showNotAnEyeDialog();
        return;
      }

      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final eyeLabel = widget.isRightEye ? 'right' : 'left';
      final ext = imagePath.contains('.') ? imagePath.split('.').last.toLowerCase() : 'jpg';
      final savedPath = '${tempDir.path}/usb_${eyeLabel}_$timestamp.$ext';
      await File(savedPath).writeAsBytes(bytes);
      if (mounted) _navigateToResult(savedPath);
    } catch (e) {
      debugPrint('❌ Bridge capture error: $e');
    } finally {
      if (mounted) setState(() => _isCapturing = false);
    }
  }

  /// Returns true if the image looks like an eye, tuned for iriscope captures.
  /// Ignores aspect ratio (iriscopes are widescreen), colour distribution, and
  /// edge density. Requires the two checks that are uniquely eye-specific:
  ///   • hasDarkCenter  — dark pupil in the centre of the frame
  ///   • hasCircle      — circular iris boundary around the pupil
  /// Texture and concentric-circle checks are NOT required because random
  /// surfaces (wood, fabric, skin) can pass them accidentally.
  bool _isEyeImage(EyeValidationResult v) {
    return v.checkResults['hasDarkCenter'] == true &&
           v.checkResults['hasCircle'] == true;
  }

  void _showNotAnEyeDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.orange),
            const SizedBox(width: 8),
            Text(l10n.notAnEyeImageTitle),
          ],
        ),
        content: Text(l10n.notAnEyeImageBodyCapture),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.retake),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Non-Windows camera plugin mode
  // ---------------------------------------------------------------------------
  Future<void> _initializeCameras() async {
    setState(() { _isLoadingCameras = true; _errorMessage = null; });
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() {
          _errorMessage = AppLocalizations.of(context)!.noCamerasDetectedMessage;
          _isLoadingCameras = false;
        });
        return;
      }
      int extIdx = _findExternalCamera();
      _selectedCameraIndex = extIdx != -1 ? extIdx : 0;
      await _initializeCamera(_selectedCameraIndex);
    } catch (e) {
      setState(() {
        _errorMessage = AppLocalizations.of(context)!.failedToAccessCameras;
        _isLoadingCameras = false;
      });
    }
  }

  int _findExternalCamera() {
    for (int i = 0; i < _cameras.length; i++) {
      final name = _cameras[i].name.toLowerCase();
      if (name.contains('usb') || name.contains('external') ||
          name.contains('uvc') || name.contains('microscope') ||
          name.contains('iris')) return i;
    }
    if (_cameras.length > 2) return _cameras.length - 1;
    return -1;
  }

  Future<void> _initializeCamera(int index) async {
    if (index >= _cameras.length) return;
    await _controller?.dispose();
    _controller = null;
    setState(() { _isInitialized = false; _errorMessage = null; });
    try {
      _controller = CameraController(
        _cameras[index],
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
          _selectedCameraIndex = index;
          _isLoadingCameras = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = AppLocalizations.of(context)!.cameraFailedInit;
        _isLoadingCameras = false;
      });
    }
  }

  // ---------------------------------------------------------------------------
  // Capture
  // ---------------------------------------------------------------------------
  Future<void> _captureImage() async {
    if (_isCapturing) return;

    // In bridge mode: send CAPTURE command — bridge grabs current frame
    if (_usingBridge) {
      if (!_dinoReady) return;
      setState(() => _isCapturing = true);
      globalDinoService?.sendCapture();
      // Result comes back through _handleBridgeCapture via the onCapture stream.
      // Reset flag after a timeout in case the bridge doesn't respond.
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted && _isCapturing) setState(() => _isCapturing = false);
      });
      return;
    }

    if (_controller == null || !_controller!.value.isInitialized) return;

    setState(() => _isCapturing = true);
    try {
      final XFile image = await _controller!.takePicture();
      final bytes = await File(image.path).readAsBytes();

      if (!_isEyeImage(await EyeValidator().validateBytes(bytes))) {
        if (mounted) _showNotAnEyeDialog();
        return;
      }

      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final eyeLabel = widget.isRightEye ? 'right' : 'left';
      final savedPath = '${tempDir.path}/usb_${eyeLabel}_$timestamp.jpg';
      await File(image.path).copy(savedPath);
      if (mounted) _navigateToResult(savedPath);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.failedToCaptureImage),
          backgroundColor: Colors.red,
        ));
      }
    } finally {
      if (mounted) setState(() => _isCapturing = false);
    }
  }

  void _navigateToResult(String imagePath) {
    if (widget.isRightEye) {
      Get.off(() => TakeRightEyePhotoScreen(
        camera: _cameras.isNotEmpty ? _cameras.first : null,
        rightEyePhoto: imagePath,
        isUsbMode: true,
      ));
    } else {
      Get.off(() => TakeLeftEyePhotoScreen(
        camera: _cameras.isNotEmpty ? _cameras.first : null,
        leftEyePhoto: imagePath,
        rightEyePhoto: rightEyePic,
        isUsbMode: true,
      ));
    }
  }

  void _switchCamera() {
    if (_usingBridge) return; // handled by bridge device index
    if (_cameras.length <= 1) return;
    _initializeCamera((_selectedCameraIndex + 1) % _cameras.length);
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (!_usingBridge && _cameras.length > 1)
            IconButton(
              icon: const Icon(Icons.cameraswitch, color: Colors.white),
              tooltip: UsbCameraDatabase.getFriendlyName(
                  _cameras.isNotEmpty ? _cameras[_selectedCameraIndex].name : ''),
              onPressed: _switchCamera,
            ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: l10n.refresh,
            onPressed: _usingBridge ? _startBridge : _initializeCameras,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStatusBar(l10n),
          if (!_usingBridge && _isInitialized && _cameras.isNotEmpty)
            _buildCameraInfoBar(),
          Expanded(child: _buildMainContent(l10n)),
          _buildBottomControls(l10n),
        ],
      ),
    );
  }

  Widget _buildStatusBar(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.teal.withValues(alpha: 0.2),
      child: Row(
        children: [
          const Icon(Icons.usb, color: Colors.teal, size: 18),
          const SizedBox(width: 8),
          Text(l10n.usbIriscopeMode,
              style: const TextStyle(color: Colors.teal, fontSize: 14)),
          if (_dinoReady) ...[
            const SizedBox(width: 10),
            const Icon(Icons.radio_button_checked,
                color: Colors.greenAccent, size: 14),
            const SizedBox(width: 4),
            const Text('MicroTouch',
                style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
          ],
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: widget.isRightEye
                  ? Colors.blue.withValues(alpha: 0.3)
                  : Colors.green.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.isRightEye ? l10n.od : l10n.os,
              style: TextStyle(
                color: widget.isRightEye ? Colors.blue : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraInfoBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Colors.white.withValues(alpha: 0.05),
      child: Row(
        children: [
          Icon(Icons.videocam, color: Colors.white.withValues(alpha: 0.7), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UsbCameraDatabase.getFriendlyName(_cameras[_selectedCameraIndex].name),
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  UsbCameraDatabase.getDeviceInfo(_cameras[_selectedCameraIndex].name).technicalInfo,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5), fontSize: 10),
                ),
              ],
            ),
          ),
          Text('${_selectedCameraIndex + 1}/${_cameras.length}',
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMainContent(AppLocalizations l10n) {
    if (_isLoadingCameras) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.teal),
            const SizedBox(height: 16),
            Text(l10n.detectingCameras,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.7))),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.videocam_off,
                  size: 64, color: Colors.red.withValues(alpha: 0.7)),
              const SizedBox(height: 16),
              Text(_errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _usingBridge ? _startBridge : _initializeCameras,
                icon: const Icon(Icons.refresh),
                label: Text(l10n.retryDetection),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white),
              ),
            ],
          ),
        ),
      );
    }

    // ── Windows bridge preview ─────────────────────────────────────────────
    if (_usingBridge && _isInitialized && _previewBytes != null) {
      return ClipRect(
        child: Image.memory(
          _previewBytes!,
          fit: BoxFit.cover,
          gaplessPlayback: true,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    // ── Non-Windows camera preview ─────────────────────────────────────────
    if (!_usingBridge && _isInitialized && _controller != null) {
      return ClipRect(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller!.value.previewSize?.height ?? 640,
            height: _controller!.value.previewSize?.width ?? 480,
            child: CameraPreview(_controller!),
          ),
        ),
      );
    }

    return const Center(child: CircularProgressIndicator(color: Colors.teal));
  }

  Widget _buildBottomControls(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.black,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Switch eye
            TextButton.icon(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SecureUvcCameraScreen(isRightEye: !widget.isRightEye),
                ),
              ),
              icon: const Icon(Icons.swap_horiz, size: 20),
              label: Text(widget.isRightEye ? l10n.os : l10n.od),
              style: TextButton.styleFrom(foregroundColor: Colors.white70),
            ),

            // Shutter button — works for both bridge mode (sends CAPTURE command)
            // and standard camera plugin mode (calls takePicture).
            GestureDetector(
              onTap: _isInitialized && !_isCapturing ? _captureImage : null,
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isInitialized
                      ? (widget.isRightEye ? Colors.blue : Colors.green)
                      : Colors.grey,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: _isCapturing
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 3))
                    : const Icon(Icons.camera, color: Colors.white, size: 32),
              ),
            ),

            // Camera count / spacer
            if (!_usingBridge)
              TextButton.icon(
                onPressed: _cameras.length > 1 ? _switchCamera : null,
                icon: const Icon(Icons.cameraswitch, size: 20),
                label: Text('${_cameras.length}'),
                style: TextButton.styleFrom(
                  foregroundColor:
                      _cameras.length > 1 ? Colors.white70 : Colors.white30,
                ),
              )
            else
              const SizedBox(width: 80),
          ],
        ),
      ),
    );
  }

}
