// lib/presentation/camera_screen/uvc_camera_screen.dart
// Dedicated UVC Camera Screen for USB Iriscopes
// Compatible with flutter_uvc_camera: ^0.0.4
// v5.2.8 - Removed Chinese error messages, English only

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_uvc_camera/flutter_uvc_camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/right_eye_screen/take_right_eye_photo_screen.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

class UvcCameraScreen extends StatefulWidget {
  final bool isRightEye;

  const UvcCameraScreen({
    super.key,
    required this.isRightEye,
  });

  @override
  State<UvcCameraScreen> createState() => _UvcCameraScreenState();
}

class _UvcCameraScreenState extends State<UvcCameraScreen> {
  late UVCCameraController _cameraController;
  UVCCameraState _cameraState = UVCCameraState.closed;
  bool _isCapturing = false;
  String? _statusMessage;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  // v5.2.8: Sanitize messages - remove Chinese/non-ASCII and provide English fallback
  String _sanitizeMessage(String? message) {
    if (message == null || message.isEmpty) {
      return 'No external camera detected';
    }

    // Check if message contains Chinese characters (Unicode range for CJK)
    final containsChinese = RegExp(r'[\u4e00-\u9fff]').hasMatch(message);

    // Check if message contains mostly non-ASCII characters
    final nonAsciiCount = message.runes.where((r) => r > 127).length;
    final hasExcessiveNonAscii = nonAsciiCount > message.length * 0.3;

    if (containsChinese || hasExcessiveNonAscii) {
      // Map common error scenarios to English messages
      final lowerMsg = message.toLowerCase();

      if (lowerMsg.contains('connect') || lowerMsg.contains('usb') || lowerMsg.contains('device')) {
        return 'No external camera detected';
      } else if (lowerMsg.contains('permission') || lowerMsg.contains('denied')) {
        return 'Camera permission denied';
      } else if (lowerMsg.contains('open') || lowerMsg.contains('init')) {
        return 'Failed to initialize camera';
      } else if (lowerMsg.contains('close') || lowerMsg.contains('disconnect')) {
        return 'Camera disconnected';
      } else if (lowerMsg.contains('error') || lowerMsg.contains('fail')) {
        return 'Camera error occurred';
      } else if (lowerMsg.contains('busy') || lowerMsg.contains('use')) {
        return 'Camera is in use by another app';
      } else if (lowerMsg.contains('support') || lowerMsg.contains('format')) {
        return 'Camera format not supported';
      }

      // Default fallback for any Chinese/unknown message
      return 'No external camera detected';
    }

    // Message is already in English/ASCII, return as-is
    return message;
  }

  // v5.2.8: Get clean English error message
  String _getCleanErrorMessage() {
    final rawError = _cameraController.getCameraErrorMsg;
    return _sanitizeMessage(rawError);
  }

  void _initializeController() {
    _cameraController = UVCCameraController();

    // Listen for camera state changes
    _cameraController.cameraStateCallback = (UVCCameraState state) {
      if (mounted) {
        setState(() {
          _cameraState = state;
          if (state == UVCCameraState.opened) {
            _statusMessage = 'Camera connected';
            _errorMessage = null;
          } else if (state == UVCCameraState.closed) {
            _statusMessage = 'Camera disconnected';
          } else if (state == UVCCameraState.error) {
            // v5.2.8: Use sanitized error message
            _errorMessage = _getCleanErrorMessage();
          }
        });
      }
    };

    // Listen for messages from native side
    _cameraController.msgCallback = (String msg) {
      debugPrint('UVC Camera raw message: $msg');
      if (mounted) {
        setState(() {
          // v5.2.8: Sanitize all messages from plugin
          _statusMessage = _sanitizeMessage(msg);
        });
      }
    };

    // Listen for picture capture success
    _cameraController.clickTakePictureButtonCallback = (String path) {
      debugPrint('Picture captured at: $path');
      if (mounted && path.isNotEmpty) {
        _navigateWithPhoto(path);
      }
    };
  }

  bool get _isReady => _cameraState == UVCCameraState.opened;

  Future<void> _capturePhoto() async {
    if (_isCapturing || !_isReady) return;

    setState(() => _isCapturing = true);

    try {
      final String? imagePath = await _cameraController.takePicture();

      if (imagePath != null && imagePath.isNotEmpty) {
        final file = File(imagePath);
        if (await file.exists()) {
          if (mounted) {
            _navigateWithPhoto(imagePath);
          }
        } else {
          _showError('Captured image file not found');
        }
      } else {
        _showError('Failed to capture image');
      }
    } catch (e) {
      debugPrint('Capture error: $e');
      _showError('Capture failed: ${_sanitizeMessage(e.toString())}');
    } finally {
      if (mounted) {
        setState(() => _isCapturing = false);
      }
    }
  }

  void _navigateWithPhoto(String imagePath) {
    if (widget.isRightEye) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TakeRightEyePhotoScreen(
            camera: null,
            rightEyePhoto: imagePath,
            isUsbMode: true,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TakeLeftEyePhotoScreen(
            camera: null,
            leftEyePhoto: imagePath,
            rightEyePhoto: rightEyePic,
            isUsbMode: true,
          ),
        ),
      );
    }
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_sanitizeMessage(message)), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.usb, color: Colors.teal, size: 20),
            const SizedBox(width: 8),
            Text(
              widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: l10n.usbCameraInfo,
            onPressed: _showDeviceInfo,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStatusBar(),
          Expanded(child: _buildCameraArea()),
          _buildCaptureControls(),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    final l10n = AppLocalizations.of(context)!;
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (_cameraState) {
      case UVCCameraState.opened:
        statusColor = Colors.green;
        statusText = l10n.connected;
        statusIcon = Icons.usb;
        break;
      case UVCCameraState.error:
        statusColor = Colors.red;
        statusText = l10n.error;
        statusIcon = Icons.error_outline;
        break;
      case UVCCameraState.closed:
      default:
        statusColor = Colors.orange;
        statusText = l10n.waiting;
        statusIcon = Icons.usb_off;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[900],
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: statusColor, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(statusIcon, size: 14, color: statusColor),
                const SizedBox(width: 6),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              // v5.2.8: Show clean English message
              _statusMessage ?? l10n.connectUsbCameraToBegin,
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: widget.isRightEye
                  ? Colors.green.withOpacity(0.2)
                  : Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.isRightEye ? l10n.od : l10n.os,
              style: TextStyle(
                fontSize: 11,
                color: widget.isRightEye ? Colors.green : Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraArea() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double previewWidth = constraints.maxWidth;
        double previewHeight = constraints.maxHeight;

        if (previewWidth / previewHeight > 4 / 3) {
          previewWidth = previewHeight * 4 / 3;
        } else {
          previewHeight = previewWidth * 3 / 4;
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: UVCCameraView(
                  cameraController: _cameraController,
                  width: previewWidth,
                  height: previewHeight,
                ),
              ),
            ),

            // Eye guide overlay
            Center(
              child: IgnorePointer(
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isReady
                          ? Colors.teal.withOpacity(0.7)
                          : Colors.grey.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _isReady
                              ? Colors.teal.withOpacity(0.5)
                              : Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Eye label overlay
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.isRightEye ? AppLocalizations.of(context)!.rightEyeOD : AppLocalizations.of(context)!.leftEyeOS,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // v5.2.8: Error overlay with ENGLISH ONLY message
            if (_errorMessage != null)
              Positioned(
                bottom: 80,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _errorMessage!, // Already sanitized
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // v5.2.8: Instructions overlay with ENGLISH ONLY
            if (!_isReady && _errorMessage == null)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.teal.withOpacity(0.3)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.usb, color: Colors.teal, size: 32),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalizations.of(context)!.noExternalCameraTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.connectUsbIriscopeEnsurePlugged,
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCaptureControls() {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: Colors.grey[400]),
            iconSize: 28,
            tooltip: l10n.back,
          ),

          GestureDetector(
            onTap: _isReady && !_isCapturing ? _capturePhoto : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isReady ? Colors.teal : Colors.grey[700],
                border: Border.all(
                  color: _isReady ? Colors.teal.shade300 : Colors.grey,
                  width: 4,
                ),
                boxShadow: _isReady
                    ? [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.4),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
                    : null,
              ),
              child: _isCapturing
                  ? const Center(
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              )
                  : Icon(
                Icons.camera,
                color: _isReady ? Colors.white : Colors.grey,
                size: 32,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => UvcCameraScreen(isRightEye: !widget.isRightEye),
                ),
              );
            },
            icon: Icon(Icons.swap_horiz, color: Colors.grey[400]),
            iconSize: 28,
            tooltip: l10n.switchEye,
          ),
        ],
      ),
    );
  }

  void _showDeviceInfo() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Row(
          children: [
            const Icon(Icons.usb, color: Colors.teal),
            const SizedBox(width: 12),
            Text(l10n.usbCameraInfo, style: const TextStyle(color: Colors.white)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(l10n.state, _cameraState.name.toUpperCase()),
            _buildInfoRow(l10n.eye, widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS),
            if (_statusMessage != null)
              _buildInfoRow(l10n.status, _statusMessage!),
            if (_errorMessage != null)
              _buildInfoRow(l10n.error, _errorMessage!),
            const SizedBox(height: 16),
            const Divider(color: Colors.grey),
            const SizedBox(height: 8),
            Text(
              l10n.usingFlutterUvcPlugin,
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[400], fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}