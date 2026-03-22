// lib/presentation/camera_screen/android_uvc_camera.dart
// Android-specific UVC camera implementation using flutter_uvc_camera
// Auto-capture countdown (0-10 s) replaces the hardware MicroTouch trigger.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_uvc_camera/flutter_uvc_camera.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/right_eye_screen/take_right_eye_photo_screen.dart';
import 'package:ai_eye_capture/main.dart';

class AndroidUvcCameraScreen extends StatefulWidget {
  final bool isRightEye;
  const AndroidUvcCameraScreen({super.key, required this.isRightEye});

  @override
  State<AndroidUvcCameraScreen> createState() => _AndroidUvcCameraScreenState();
}

class _AndroidUvcCameraScreenState extends State<AndroidUvcCameraScreen> {
  late UVCCameraController _controller;
  UVCCameraState _cameraState = UVCCameraState.closed;
  bool _isCapturing = false;
  String? _statusError;

  // ── Auto-capture countdown ─────────────────────────────────────────────────
  int _autoCaptureDelay = 0; // 0 = off; 1-10 = seconds
  int _countdownSeconds = 0; // currently ticking value
  Timer? _countdownTimer;

  // ── USB detection retry ────────────────────────────────────────────────────
  // USBMonitor.register() enumerates pre-connected devices asynchronously and
  // can be unreliable. After _kDetectionTimeoutSec seconds with no connection
  // we force-recreate the UVCCameraView (software unplug/replug).
  static const int _kDetectionTimeoutSec = 5;
  Timer? _detectionTimer;
  int _viewKey = 0; // incrementing forces UVCCameraView full rebuild

  bool get _isReady => _cameraState == UVCCameraState.opened;
  bool get _isCounting => _countdownSeconds > 0;

  // ── Accent colour for this eye ─────────────────────────────────────────────
  Color get _eyeColor => widget.isRightEye ? Colors.blue : Colors.green;

  @override
  void initState() {
    super.initState();
    _setupController();
    _startDetectionTimer();
  }

  void _setupController() {
    _controller = UVCCameraController();

    _controller.cameraStateCallback = (UVCCameraState state) {
      if (!mounted) return;
      setState(() {
        _cameraState = state;
        if (state == UVCCameraState.opened) {
          _statusError = null;
          _detectionTimer?.cancel(); // camera found — no need to retry
        } else if (state == UVCCameraState.error) {
          final raw = _controller.getCameraErrorMsg;
          _statusError = raw.isNotEmpty ? raw : 'Camera error';
        }
      });
    };

    // Hardware trigger button on the iriscope fires this.
    _controller.clickTakePictureButtonCallback = (String path) {
      if (mounted && path.isNotEmpty) _navigateToResult(path);
    };
  }

  // ── USB detection auto-retry ───────────────────────────────────────────────
  void _startDetectionTimer() {
    _detectionTimer?.cancel();
    _detectionTimer = Timer(
      const Duration(seconds: _kDetectionTimeoutSec),
      () {
        if (!mounted || _isReady) return;
        // Camera still not open — force a fresh UVCCameraView recreation.
        // This is equivalent to a software unplug/replug: a new view triggers
        // a new registerMultiCamera() + clean USB enumeration.
        _forceViewRebuild();
      },
    );
  }

  void _forceViewRebuild() {
    _controller.dispose();
    setState(() {
      _cameraState = UVCCameraState.closed;
      _statusError = null;
      _viewKey++; // new key → Flutter destroys old UVCCameraView, creates fresh one
    });
    _setupController();
    _startDetectionTimer(); // allow one more auto-retry cycle
  }

  // ── Countdown logic ────────────────────────────────────────────────────────
  void _onCaptureButtonTapped() {
    if (!_isReady) return;

    if (_isCounting) {
      _cancelCountdown();
      return;
    }

    if (_autoCaptureDelay == 0) {
      _captureImage();
    } else {
      _startCountdown();
    }
  }

  void _startCountdown() {
    setState(() => _countdownSeconds = _autoCaptureDelay);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() => _countdownSeconds--);
      if (_countdownSeconds <= 0) {
        t.cancel();
        _captureImage();
      }
    });
  }

  void _cancelCountdown() {
    _countdownTimer?.cancel();
    setState(() => _countdownSeconds = 0);
  }

  // ── Photo capture ──────────────────────────────────────────────────────────
  Future<void> _captureImage() async {
    if (!_isReady || _isCapturing) return;
    setState(() { _isCapturing = true; _countdownSeconds = 0; });
    try {
      final String? imagePath = await _controller.takePicture();
      if (mounted && imagePath != null && imagePath.isNotEmpty) {
        _navigateToResult(imagePath);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.failedToCaptureImage),
          backgroundColor: Colors.red,
        ));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.cameraErrorOccurred),
          backgroundColor: Colors.red,
        ));
      }
    } finally {
      if (mounted) setState(() => _isCapturing = false);
    }
  }

  void _navigateToResult(String imagePath) {
    _countdownTimer?.cancel();
    if (widget.isRightEye) {
      Get.off(() => TakeRightEyePhotoScreen(rightEyePhoto: imagePath, isUsbMode: true));
    } else {
      Get.off(() => TakeLeftEyePhotoScreen(
        leftEyePhoto: imagePath, rightEyePhoto: rightEyePic, isUsbMode: true));
    }
  }

  void _retryOpenCamera() {
    _forceViewRebuild();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _detectionTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            _cancelCountdown();
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          _buildUsbBanner(l10n),
          Expanded(child: _buildCameraPreview(l10n)),
          _buildDelaySelector(),
          _buildCaptureButton(l10n),
        ],
      ),
    );
  }

  Widget _buildUsbBanner(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.teal.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.usb, color: Colors.teal, size: 20),
          const SizedBox(width: 8),
          Text(l10n.usbIriscopeMode,
              style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // ── Delay selector ─────────────────────────────────────────────────────────
  Widget _buildDelaySelector() {
    const delays = [0, 3, 5, 10];
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer, color: Colors.white54, size: 18),
          const SizedBox(width: 8),
          ...delays.map((d) => _DelayChip(
            label: d == 0 ? 'Off' : '${d}s',
            selected: _autoCaptureDelay == d,
            color: _eyeColor,
            onTap: () {
              if (_isCounting) _cancelCountdown();
              setState(() => _autoCaptureDelay = d);
            },
          )),
        ],
      ),
    );
  }

  // ── Camera preview with overlays ───────────────────────────────────────────
  Widget _buildCameraPreview(AppLocalizations l10n) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: [
          // Always in the tree — removing it calls dispose() which unregisters
          // the USB listener mid-enumeration and prevents camera from opening.
          UVCCameraView(
            key: ValueKey(_viewKey),
            cameraController: _controller,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          ),

          // Loading overlay
          if (!_isReady && _statusError == null)
            Container(
              color: Colors.black87,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.teal),
                    SizedBox(height: 16),
                    Text('Waiting for USB iriscope…',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),

          // Error overlay
          if (!_isReady && _statusError != null)
            Container(
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.usb_off, color: Colors.red, size: 64),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(l10n.connectUsbIriscopeEnsurePlugged,
                          style: const TextStyle(color: Colors.white70),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _retryOpenCamera,
                      icon: const Icon(Icons.refresh),
                      label: Text(l10n.retry),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    ),
                  ],
                ),
              ),
            ),

          // Countdown overlay
          if (_isCounting)
            Container(
              color: Colors.black54,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_countdownSeconds',
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: _eyeColor,
                        shadows: const [
                          Shadow(color: Colors.black, blurRadius: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Tap to cancel',
                        style: TextStyle(
                            color: _eyeColor.withOpacity(0.8), fontSize: 16)),
                  ],
                ),
              ),
            ),
        ],
      );
    });
  }

  // ── Capture button ─────────────────────────────────────────────────────────
  Widget _buildCaptureButton(AppLocalizations l10n) {
    final bool active = _isReady && !_isCapturing;
    final bool showCancel = _isCounting;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      color: Colors.black,
      child: Column(
        children: [
          // Hint text
          if (_isReady)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                showCancel
                    ? 'Tap to cancel'
                    : _autoCaptureDelay == 0
                        ? 'Tap to capture'
                        : 'Tap to start ${_autoCaptureDelay}s countdown',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),

          // Shutter button
          GestureDetector(
            onTap: active || showCancel ? _onCaptureButtonTapped : null,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: showCancel ? Colors.orange : _eyeColor,
                  width: 4,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isCapturing
                      ? Colors.grey
                      : !_isReady
                          ? Colors.grey.withOpacity(0.4)
                          : showCancel
                              ? Colors.orange
                              : _eyeColor,
                ),
                child: _isCapturing
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 3))
                    : Icon(
                        showCancel ? Icons.close : Icons.camera,
                        color: Colors.white,
                        size: 40,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Delay selector chip ────────────────────────────────────────────────────
class _DelayChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _DelayChip({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.25) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? color : Colors.white30,
            width: selected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? color : Colors.white54,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
