// lib/presentation/camera_screen/secure_uvc_camera_screen.dart
// USB/External Camera Screen - Cross-platform support
// v5.3.2 - Windows uses camera_windows, Android uses camera package
//        - Removed brand references, generic UVC terminology

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/right_eye_screen/take_right_eye_photo_screen.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/utils/usb_camera_utils.dart';
import 'package:camera/camera.dart';

// =============================================================================
// MAIN ENTRY POINT - Routes to platform-specific implementation
// =============================================================================
class SecureUvcCameraScreen extends StatelessWidget {
  final bool isRightEye;

  const SecureUvcCameraScreen({
    super.key,
    required this.isRightEye,
  });

  @override
  Widget build(BuildContext context) {
    // Use unified camera approach for all platforms
    return UnifiedCameraScreen(isRightEye: isRightEye);
  }
}

// =============================================================================
// UNIFIED CAMERA SCREEN - Works on Windows, Android, iOS, macOS, Linux
// Uses camera package which supports Windows via camera_windows plugin
// =============================================================================
class UnifiedCameraScreen extends StatefulWidget {
  final bool isRightEye;
  const UnifiedCameraScreen({super.key, required this.isRightEye});

  @override
  State<UnifiedCameraScreen> createState() => _UnifiedCameraScreenState();
}

class _UnifiedCameraScreenState extends State<UnifiedCameraScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;
  bool _isInitialized = false;
  bool _isCapturing = false;
  bool _isLoadingCameras = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    setState(() {
      _isLoadingCameras = true;
      _errorMessage = null;
    });

    try {
      _cameras = await availableCameras();
      debugPrint('📷 Found ${_cameras.length} cameras:');
      for (int i = 0; i < _cameras.length; i++) {
        final info = UsbCameraDatabase.getDeviceInfo(_cameras[i].name);
        debugPrint('  [$i] ${info.friendlyName} ${info.technicalInfo} (${_cameras[i].lensDirection})');
      }

      if (_cameras.isEmpty) {
        setState(() {
          _errorMessage = 'No cameras detected.\n\nPlease ensure your USB camera is connected and recognized by your system.';
          _isLoadingCameras = false;
        });
        return;
      }

      // Try to find external/USB camera
      int externalIndex = _findExternalCamera();
      _selectedCameraIndex = externalIndex != -1 ? externalIndex : 0;

      await _initializeCamera(_selectedCameraIndex);
    } catch (e) {
      debugPrint('❌ Camera init error: $e');
      setState(() {
        _errorMessage = 'Failed to access cameras:\n${e.toString().split('\n').first}';
        _isLoadingCameras = false;
      });
    }
  }

  int _findExternalCamera() {
    // Look for USB/external/UVC camera keywords
    for (int i = 0; i < _cameras.length; i++) {
      final name = _cameras[i].name.toLowerCase();
      if (name.contains('usb') ||
          name.contains('external') ||
          name.contains('uvc') ||
          name.contains('microscope') ||
          name.contains('iris')) {
        debugPrint('🎯 Found external camera at index $i: ${UsbCameraDatabase.getFriendlyName(_cameras[i].name)}');
        return i;
      }
    }
    // If more than 2 cameras, last one is often external
    if (_cameras.length > 2) {
      return _cameras.length - 1;
    }
    return -1;
  }

  Future<void> _initializeCamera(int index) async {
    if (index >= _cameras.length) return;

    // Dispose existing controller
    if (_controller != null) {
      await _controller!.dispose();
      _controller = null;
    }

    setState(() {
      _isInitialized = false;
      _errorMessage = null;
    });

    try {
      debugPrint('📷 Initializing camera $index: ${UsbCameraDatabase.getFriendlyName(_cameras[index].name)}');

      _controller = CameraController(
        _cameras[index],
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: Platform.isWindows
            ? ImageFormatGroup.jpeg
            : ImageFormatGroup.yuv420,
      );

      await _controller!.initialize();

      if (mounted) {
        setState(() {
          _isInitialized = true;
          _selectedCameraIndex = index;
          _isLoadingCameras = false;
        });
        debugPrint('✅ Camera initialized successfully');
      }
    } catch (e) {
      debugPrint('❌ Camera $index error: $e');
      setState(() {
        _errorMessage = 'Camera "${UsbCameraDatabase.getFriendlyName(_cameras[index].name)}" failed:\n${e.toString().split('\n').first}';
        _isLoadingCameras = false;
      });
    }
  }

  Future<void> _captureImage() async {
    if (_controller == null || !_controller!.value.isInitialized || _isCapturing) {
      return;
    }

    setState(() => _isCapturing = true);

    try {
      final XFile image = await _controller!.takePicture();
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final eyeLabel = widget.isRightEye ? 'right' : 'left';
      final savedPath = '${tempDir.path}/usb_${eyeLabel}_$timestamp.jpg';

      await File(image.path).copy(savedPath);
      debugPrint('📸 Image saved: $savedPath');

      if (mounted) {
        _navigateToResult(savedPath);
      }
    } catch (e) {
      debugPrint('❌ Capture error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Capture failed: ${e.toString().split('\n').first}'),
            backgroundColor: Colors.red,
          ),
        );
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
    if (_cameras.length <= 1) return;
    final nextIndex = (_selectedCameraIndex + 1) % _cameras.length;
    _initializeCamera(nextIndex);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
          // Camera switch button
          if (_cameras.length > 1)
            IconButton(
              icon: const Icon(Icons.cameraswitch, color: Colors.white),
              tooltip: 'Switch Camera (${UsbCameraDatabase.getFriendlyName(_cameras[_selectedCameraIndex].name)})',
              onPressed: _switchCamera,
            ),
          // Refresh cameras
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: l10n!.refresh,
            onPressed: _initializeCameras,
          ),
        ],
      ),
      body: Column(
        children: [
          // Status bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.teal.withOpacity(0.2),
            child: Row(
              children: [
                const Icon(Icons.usb, color: Colors.teal, size: 18),
                const SizedBox(width: 8),
                Text(l10n.usbIriscopeMode, style: const TextStyle(color: Colors.teal, fontSize: 14)),
                const Spacer(),
                // Eye indicator
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.isRightEye ? Colors.blue.withOpacity(0.3) : Colors.green.withOpacity(0.3),
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
          ),

          // Camera info bar (when initialized)
          if (_isInitialized && _cameras.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              color: Colors.white.withOpacity(0.05),
              child: Row(
                children: [
                  Icon(Icons.videocam, color: Colors.white.withOpacity(0.7), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          UsbCameraDatabase.getFriendlyName(_cameras[_selectedCameraIndex].name),
                          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          UsbCameraDatabase.getDeviceInfo(_cameras[_selectedCameraIndex].name).technicalInfo,
                          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${_selectedCameraIndex + 1}/${_cameras.length}',
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                  ),
                ],
              ),
            ),

          // Main content area
          Expanded(
            child: _buildMainContent(l10n),
          ),

          // Bottom controls
          _buildBottomControls(l10n),
        ],
      ),
    );
  }

  Widget _buildMainContent(AppLocalizations l10n) {
    // Loading state
    if (_isLoadingCameras) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.teal),
            const SizedBox(height: 16),
            Text(
              l10n.detectingCameras,
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
          ],
        ),
      );
    }

    // Error state
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.videocam_off, size: 64, color: Colors.red.withOpacity(0.7)),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Instructions
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHelpRow(Icons.usb, l10n.connectUvcCameraViaUsb),
                    const SizedBox(height: 8),
                    _buildHelpRow(Icons.settings, l10n.ensureCameraDriversInstalled),
                    const SizedBox(height: 8),
                    _buildHelpRow(Icons.refresh, l10n.tapRefreshToDetect),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _initializeCameras,
                icon: const Icon(Icons.refresh),
                label: Text(l10n.retryDetection),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Camera preview
    if (_isInitialized && _controller != null) {
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

    // Initializing state
    return const Center(
      child: CircularProgressIndicator(color: Colors.teal),
    );
  }

  Widget _buildHelpRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
        ),
      ],
    );
  }

  Widget _buildBottomControls(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.black,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Switch eye button
            TextButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SecureUvcCameraScreen(isRightEye: !widget.isRightEye),
                  ),
                );
              },
              icon: const Icon(Icons.swap_horiz, size: 20),
              label: Text(widget.isRightEye ? l10n.os : l10n.od),
              style: TextButton.styleFrom(foregroundColor: Colors.white70),
            ),

            // Capture button
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
                  boxShadow: _isInitialized
                      ? [BoxShadow(
                          color: (widget.isRightEye ? Colors.blue : Colors.green).withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 2,
                        )]
                      : null,
                ),
                child: _isCapturing
                    ? const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
                    : const Icon(Icons.camera, color: Colors.white, size: 32),
              ),
            ),

            // Camera switch
            TextButton.icon(
              onPressed: _cameras.length > 1 ? _switchCamera : null,
              icon: const Icon(Icons.cameraswitch, size: 20),
              label: Text('${_cameras.length}'),
              style: TextButton.styleFrom(
                foregroundColor: _cameras.length > 1 ? Colors.white70 : Colors.white30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}