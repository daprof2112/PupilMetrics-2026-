// lib/presentation/camera_screen/android_uvc_camera.dart
// Android-specific UVC camera implementation using flutter_uvc_camera
// This file is only used on Android

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_uvc_camera/flutter_uvc_camera.dart';
import 'package:path_provider/path_provider.dart';
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
  UVCCameraController? _controller;
  bool _isInitialized = false;
  bool _isCapturing = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeUvcCamera();
  }

  Future<void> _initializeUvcCamera() async {
    try {
      _controller = UVCCameraController();
      await _controller!.initialize();

      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = 'UVC Camera error: $e');
      }
    }
  }

  Future<void> _captureImage() async {
    if (_controller == null || _isCapturing) return;

    setState(() => _isCapturing = true);

    try {
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final eyeLabel = widget.isRightEye ? 'right' : 'left';
      final filePath = '${tempDir.path}/uvc_${eyeLabel}_$timestamp.jpg';

      await _controller!.takePicture(filePath);

      if (mounted && File(filePath).existsSync()) {
        _navigateToResult(filePath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.failedToCaptureImage), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isCapturing = false);
      }
    }
  }

  void _navigateToResult(String imagePath) {
    if (widget.isRightEye) {
      Get.off(() => TakeRightEyePhotoScreen(
        rightEyePhoto: imagePath,
        isUsbMode: true,
      ));
    } else {
      Get.off(() => TakeLeftEyePhotoScreen(
        leftEyePhoto: imagePath,
        rightEyePhoto: rightEyePic,
        isUsbMode: true,
      ));
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // USB Mode indicator
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.teal.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.usb, color: Colors.teal, size: 20),
                const SizedBox(width: 8),
                Text(
                  l10n.usbIriscopeMode,
                  style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          // Camera preview
          Expanded(
            child: _buildCameraPreview(),
          ),

          // Capture button
          _buildCaptureButton(l10n),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.usb_off, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.connectUsbIriscopeEnsurePlugged,
              style: const TextStyle(color: Colors.white54),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _initializeUvcCamera,
              icon: const Icon(Icons.refresh),
              label: Text(AppLocalizations.of(context)!.retry),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.teal),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.connectingToUsbIriscope, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      );
    }

    return UVCCameraView(controller: _controller!);
  }

  Widget _buildCaptureButton(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: GestureDetector(
        onTap: _isInitialized && !_isCapturing ? _captureImage : null,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.isRightEye ? Colors.blue : Colors.green,
              width: 4,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isCapturing
                  ? Colors.grey
                  : (widget.isRightEye ? Colors.blue : Colors.green),
            ),
            child: _isCapturing
                ? const Center(
              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
            )
                : const Icon(Icons.camera, color: Colors.white, size: 40),
          ),
        ),
      ),
    );
  }
}