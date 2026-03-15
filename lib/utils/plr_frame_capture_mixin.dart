// lib/presentation/video_mode/plr_frame_capture_mixin.dart
// Mixin to add real-time frame capture during PLR recording
// Captures frames from camera stream for analysis

import 'dart:async';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

/// Captured frame with metadata
class CapturedFrame {
  final int index;
  final double timestampMs;
  final Uint8List imageBytes;
  final double? brightness;

  CapturedFrame({
    required this.index,
    required this.timestampMs,
    required this.imageBytes,
    this.brightness,
  });
}

/// Mixin for capturing frames during PLR recording
mixin PLRFrameCaptureMixin {
  // Frame capture state
  final List<CapturedFrame> _capturedFrames = [];
  StreamSubscription<CameraImage>? _imageStreamSubscription;
  int _frameIndex = 0;
  DateTime? _recordingStartTime;
  bool _isCapturing = false;

  // Configuration
  static const int targetCaptureRate = 15;  // Capture every Nth frame (30fps/15 = 2fps actual)
  static const int maxFramesToCapture = 300;  // ~10 seconds at 30fps
  int _frameCaptureCounter = 0;

  /// Get captured frames
  List<CapturedFrame> get capturedFrames => List.unmodifiable(_capturedFrames);

  /// Start capturing frames from camera stream
  Future<void> startFrameCapture(CameraController controller) async {
    if (_isCapturing) return;

    _capturedFrames.clear();
    _frameIndex = 0;
    _frameCaptureCounter = 0;
    _recordingStartTime = DateTime.now();
    _isCapturing = true;

    debugPrint('[PLR Capture] Starting frame capture...');

    try {
      await controller.startImageStream((CameraImage image) {
        _processCameraImage(image);
      });
    } catch (e) {
      debugPrint('[PLR Capture] Error starting image stream: $e');
      _isCapturing = false;
    }
  }

  /// Stop capturing frames
  Future<void> stopFrameCapture(CameraController controller) async {
    if (!_isCapturing) return;

    _isCapturing = false;

    try {
      await controller.stopImageStream();
    } catch (e) {
      debugPrint('[PLR Capture] Error stopping image stream: $e');
    }

    debugPrint('[PLR Capture] Captured ${_capturedFrames.length} frames');
  }

  /// Process incoming camera image
  void _processCameraImage(CameraImage image) {
    if (!_isCapturing) return;
    if (_capturedFrames.length >= maxFramesToCapture) return;

    _frameCaptureCounter++;

    // Only capture every Nth frame to reduce processing load
    // For PLR, we need ~30fps for accurate timing, but can process subset
    // Capture every 2nd frame = 15fps, enough for PLR metrics
    if (_frameCaptureCounter % 2 != 0) return;

    try {
      final timestampMs = DateTime.now().difference(_recordingStartTime!).inMilliseconds.toDouble();

      // Convert CameraImage to JPEG bytes
      final bytes = _convertCameraImageToJpeg(image);
      if (bytes == null) return;

      // Quick brightness calculation
      final brightness = _quickBrightness(image);

      _capturedFrames.add(CapturedFrame(
        index: _frameIndex++,
        timestampMs: timestampMs,
        imageBytes: bytes,
        brightness: brightness,
      ));

    } catch (e) {
      debugPrint('[PLR Capture] Frame processing error: $e');
    }
  }

  /// Convert CameraImage to JPEG bytes
  Uint8List? _convertCameraImageToJpeg(CameraImage image) {
    try {
      // Handle different image formats
      if (image.format.group == ImageFormatGroup.yuv420) {
        return _yuv420ToJpeg(image);
      } else if (image.format.group == ImageFormatGroup.bgra8888) {
        return _bgra8888ToJpeg(image);
      } else if (image.format.group == ImageFormatGroup.jpeg) {
        return image.planes[0].bytes;
      }

      debugPrint('[PLR Capture] Unsupported image format: ${image.format.group}');
      return null;
    } catch (e) {
      debugPrint('[PLR Capture] Image conversion error: $e');
      return null;
    }
  }

  /// Convert YUV420 to JPEG
  Uint8List? _yuv420ToJpeg(CameraImage image) {
    try {
      final width = image.width;
      final height = image.height;

      // Create grayscale image from Y plane (faster than full color)
      final yPlane = image.planes[0];
      final imgImage = img.Image(width: width, height: height);

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final yIndex = y * yPlane.bytesPerRow + x;
          if (yIndex < yPlane.bytes.length) {
            final yValue = yPlane.bytes[yIndex];
            imgImage.setPixelRgba(x, y, yValue, yValue, yValue, 255);
          }
        }
      }

      // Resize for faster processing
      final resized = img.copyResize(imgImage, width: 320, height: 240);

      return Uint8List.fromList(img.encodeJpg(resized, quality: 70));
    } catch (e) {
      debugPrint('[PLR Capture] YUV conversion error: $e');
      return null;
    }
  }

  /// Convert BGRA8888 to JPEG
  Uint8List? _bgra8888ToJpeg(CameraImage image) {
    try {
      final width = image.width;
      final height = image.height;
      final plane = image.planes[0];

      final imgImage = img.Image(width: width, height: height);

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final index = (y * plane.bytesPerRow) + (x * 4);
          if (index + 3 < plane.bytes.length) {
            final b = plane.bytes[index];
            final g = plane.bytes[index + 1];
            final r = plane.bytes[index + 2];
            imgImage.setPixelRgba(x, y, r, g, b, 255);
          }
        }
      }

      // Resize for faster processing
      final resized = img.copyResize(imgImage, width: 320, height: 240);

      return Uint8List.fromList(img.encodeJpg(resized, quality: 70));
    } catch (e) {
      debugPrint('[PLR Capture] BGRA conversion error: $e');
      return null;
    }
  }

  /// Quick brightness calculation from Y plane
  double _quickBrightness(CameraImage image) {
    try {
      final yPlane = image.planes[0];
      final bytes = yPlane.bytes;

      // Sample every 100th pixel
      int total = 0;
      int count = 0;

      for (int i = 0; i < bytes.length; i += 100) {
        total += bytes[i];
        count++;
      }

      return count > 0 ? total / count : 0;
    } catch (e) {
      return 0;
    }
  }

  /// Clear captured frames (call after analysis)
  void clearCapturedFrames() {
    _capturedFrames.clear();
    _frameIndex = 0;
  }

  /// Get frames as bytes list for analysis
  List<Uint8List> getFrameBytesForAnalysis() {
    return _capturedFrames.map((f) => f.imageBytes).toList();
  }

  /// Detect flash frame from captured frames (using brightness spike)
  int? detectFlashFrameIndex() {
    if (_capturedFrames.isEmpty) return null;

    double maxBrightness = 0;
    int? flashIndex;

    for (int i = 0; i < _capturedFrames.length; i++) {
      final frame = _capturedFrames[i];
      if (frame.brightness != null && frame.brightness! > maxBrightness) {
        maxBrightness = frame.brightness!;
        flashIndex = i;
      }
    }

    // Validate it's actually a spike
    if (flashIndex != null && maxBrightness > 150) {
      return flashIndex;
    }

    return null;
  }
}