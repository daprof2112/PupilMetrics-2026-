// lib/services/simple_eye_quality_gate.dart
// Real-time eye quality assessment for camera preview
// v5.2.4 - Iris/pupil diameter detection for bilateral comparison

import 'dart:math' as math;
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Quality issues that can be detected
enum QualityIssue {
  none,
  tooBlurry,
  tooDark,
  tooBright,
  noContrast,
  noPupil,
  notCentered,
  notAnEye,
  processing,
}

/// Thresholds for quality assessment
class SimpleQualityThresholds {
  final double minSharpness;
  final double minBrightness;
  final double maxBrightness;
  final double minContrast;
  final double minPupilConfidence;
  final double maxCenterOffset;

  const SimpleQualityThresholds({
    this.minSharpness = 100.0,
    this.minBrightness = 30.0,
    this.maxBrightness = 230.0,
    this.minContrast = 30.0,
    this.minPupilConfidence = 0.3,
    this.maxCenterOffset = 0.25,
  });
}

/// Result from quality assessment
class SimpleQualityResult {
  final bool isReady;
  final QualityIssue issue;
  final String feedback;
  final double sharpness;
  final double brightness;
  final double contrast;
  final double pupilConfidence;
  final Offset? estimatedPupilCenter;

  // Iris/pupil size tracking
  final double? estimatedIrisDiameterPx;
  final double? estimatedPupilDiameterPx;
  final double? irisToFrameRatio;
  final int? frameWidth;
  final int? frameHeight;

  SimpleQualityResult({
    required this.isReady,
    required this.issue,
    required this.feedback,
    required this.sharpness,
    required this.brightness,
    required this.contrast,
    required this.pupilConfidence,
    this.estimatedPupilCenter,
    this.estimatedIrisDiameterPx,
    this.estimatedPupilDiameterPx,
    this.irisToFrameRatio,
    this.frameWidth,
    this.frameHeight,
  });

  /// Compare iris size with another capture for distance matching
  double? compareIrisSize(SimpleQualityResult other) {
    if (estimatedIrisDiameterPx == null || other.estimatedIrisDiameterPx == null) {
      return null;
    }
    final diff = (estimatedIrisDiameterPx! - other.estimatedIrisDiameterPx!).abs();
    final avg = (estimatedIrisDiameterPx! + other.estimatedIrisDiameterPx!) / 2;
    if (avg == 0) return null;
    return (1 - (diff / avg)) * 100;
  }
}

/// Main quality gate class for real-time frame processing
class SimpleEyeQualityGate {
  final SimpleQualityThresholds thresholds;

  // Detection state
  int _frameCount = 0;
  double _lastSharpness = 0;
  double _lastBrightness = 0;
  double _lastContrast = 0;
  double _lastPupilConfidence = 0;
  Offset? _lastPupilCenter;

  // Size tracking
  double? _lastIrisDiameter;
  double? _lastPupilDiameter;

  SimpleEyeQualityGate({
    this.thresholds = const SimpleQualityThresholds(),
  });

  /// Process a camera frame and return quality assessment
  SimpleQualityResult processFrame(CameraImage image) {
    _frameCount++;

    try {
      // Convert YUV to grayscale for analysis
      final grayscale = _extractGrayscale(image);
      final width = image.width;
      final height = image.height;

      // Calculate quality metrics
      final brightness = _calculateBrightness(grayscale);
      final contrast = _calculateContrast(grayscale, brightness);
      final sharpness = _calculateSharpness(grayscale, width, height);

      // Detect pupil/iris region
      final detection = _detectPupilRegion(grayscale, width, height);
      final pupilConfidence = detection.confidence;
      final pupilCenter = detection.center;

      // Get iris and pupil diameter estimates
      final irisDiameter = detection.irisDiameterPx;
      final pupilDiameter = detection.pupilDiameterPx;
      final irisToFrame = irisDiameter != null ? irisDiameter / width : null;

      // Store for smoothing
      _lastSharpness = sharpness;
      _lastBrightness = brightness;
      _lastContrast = contrast;
      _lastPupilConfidence = pupilConfidence;
      _lastPupilCenter = pupilCenter;
      _lastIrisDiameter = irisDiameter;
      _lastPupilDiameter = pupilDiameter;

      // Determine quality issue and readiness
      final issue = _determineIssue(
        sharpness: sharpness,
        brightness: brightness,
        contrast: contrast,
        pupilConfidence: pupilConfidence,
        pupilCenter: pupilCenter,
      );

      final isReady = issue == QualityIssue.none;
      final feedback = _getFeedback(issue);

      return SimpleQualityResult(
        isReady: isReady,
        issue: issue,
        feedback: feedback,
        sharpness: sharpness,
        brightness: brightness,
        contrast: contrast,
        pupilConfidence: pupilConfidence,
        estimatedPupilCenter: pupilCenter,
        estimatedIrisDiameterPx: irisDiameter,
        estimatedPupilDiameterPx: pupilDiameter,
        irisToFrameRatio: irisToFrame,
        frameWidth: width,
        frameHeight: height,
      );

    } catch (e) {
      // Return safe defaults on error
      return SimpleQualityResult(
        isReady: false,
        issue: QualityIssue.processing,
        feedback: 'Processing...',
        sharpness: _lastSharpness,
        brightness: _lastBrightness,
        contrast: _lastContrast,
        pupilConfidence: _lastPupilConfidence,
        estimatedPupilCenter: _lastPupilCenter,
        estimatedIrisDiameterPx: _lastIrisDiameter,
        estimatedPupilDiameterPx: _lastPupilDiameter,
      );
    }
  }

  /// Extract grayscale values from YUV420 image
  Uint8List _extractGrayscale(CameraImage image) {
    final yPlane = image.planes[0];
    return Uint8List.fromList(yPlane.bytes);
  }

  /// Calculate average brightness (0-255)
  double _calculateBrightness(Uint8List grayscale) {
    if (grayscale.isEmpty) return 128.0;

    int sum = 0;
    final step = math.max(1, grayscale.length ~/ 4096);
    int count = 0;

    for (int i = 0; i < grayscale.length; i += step) {
      sum += grayscale[i];
      count++;
    }

    return count > 0 ? sum / count : 128.0;
  }

  /// Calculate contrast (standard deviation of brightness)
  double _calculateContrast(Uint8List grayscale, double meanBrightness) {
    if (grayscale.isEmpty) return 0.0;

    double sumSquaredDiff = 0;
    final step = math.max(1, grayscale.length ~/ 4096);
    int count = 0;

    for (int i = 0; i < grayscale.length; i += step) {
      final diff = grayscale[i] - meanBrightness;
      sumSquaredDiff += diff * diff;
      count++;
    }

    return count > 0 ? math.sqrt(sumSquaredDiff / count) : 0.0;
  }

  /// Calculate sharpness using Laplacian variance
  double _calculateSharpness(Uint8List grayscale, int width, int height) {
    if (grayscale.length < width * height) return 0.0;

    double laplacianSum = 0;
    int count = 0;

    final startX = width ~/ 4;
    final endX = 3 * width ~/ 4;
    final startY = height ~/ 4;
    final endY = 3 * height ~/ 4;

    for (int y = startY + 1; y < endY - 1; y += 2) {
      for (int x = startX + 1; x < endX - 1; x += 2) {
        final idx = y * width + x;

        if (idx - width >= 0 && idx + width < grayscale.length) {
          final center = grayscale[idx];
          final top = grayscale[idx - width];
          final bottom = grayscale[idx + width];
          final left = grayscale[idx - 1];
          final right = grayscale[idx + 1];

          final laplacian = (top + bottom + left + right - 4 * center).abs();
          laplacianSum += laplacian * laplacian;
          count++;
        }
      }
    }

    return count > 0 ? laplacianSum / count : 0.0;
  }

  /// Detect pupil region and estimate its properties
  _PupilDetection _detectPupilRegion(Uint8List grayscale, int width, int height) {
    final centerX = width ~/ 2;
    final centerY = height ~/ 2;
    final searchRadius = math.min(width, height) ~/ 3;

    double minBrightness = 255;
    int darkestX = centerX;
    int darkestY = centerY;

    for (int y = centerY - searchRadius; y < centerY + searchRadius; y += 4) {
      for (int x = centerX - searchRadius; x < centerX + searchRadius; x += 4) {
        if (x >= 0 && x < width && y >= 0 && y < height) {
          final idx = y * width + x;
          if (idx < grayscale.length && grayscale[idx] < minBrightness) {
            minBrightness = grayscale[idx].toDouble();
            darkestX = x;
            darkestY = y;
          }
        }
      }
    }

    final pupilThreshold = minBrightness + 30;
    int pupilRadius = 0;

    for (int r = 1; r < searchRadius; r += 2) {
      int darkPixels = 0;
      int totalPixels = 0;

      for (int angle = 0; angle < 8; angle++) {
        final dx = (r * math.cos(angle * math.pi / 4)).round();
        final dy = (r * math.sin(angle * math.pi / 4)).round();
        final px = darkestX + dx;
        final py = darkestY + dy;

        if (px >= 0 && px < width && py >= 0 && py < height) {
          final idx = py * width + px;
          if (idx < grayscale.length) {
            totalPixels++;
            if (grayscale[idx] < pupilThreshold) {
              darkPixels++;
            }
          }
        }
      }

      if (totalPixels > 0 && darkPixels < totalPixels / 2) {
        pupilRadius = r;
        break;
      }
    }

    final irisRadius = _estimateIrisRadius(
        grayscale, width, height,
        darkestX, darkestY,
        pupilRadius > 0 ? pupilRadius : searchRadius ~/ 4
    );

    final darknessScore = (128 - minBrightness) / 128;
    final centerOffsetX = (darkestX - centerX).abs() / (width / 2);
    final centerOffsetY = (darkestY - centerY).abs() / (height / 2);
    final centerScore = 1 - math.max(centerOffsetX, centerOffsetY);

    final sizeScore = pupilRadius > 5 && pupilRadius < searchRadius ? 1.0 : 0.5;

    final confidence = (darknessScore * 0.4 + centerScore * 0.4 + sizeScore * 0.2).clamp(0.0, 1.0);

    final normalizedCenter = Offset(
      darkestX / width,
      darkestY / height,
    );

    return _PupilDetection(
      confidence: confidence,
      center: normalizedCenter,
      pupilDiameterPx: pupilRadius > 0 ? pupilRadius * 2.0 : null,
      irisDiameterPx: irisRadius > 0 ? irisRadius * 2.0 : null,
    );
  }

  /// Estimate iris radius by detecting texture/contrast boundary
  int _estimateIrisRadius(
      Uint8List grayscale,
      int width,
      int height,
      int centerX,
      int centerY,
      int startRadius,
      ) {
    final maxRadius = math.min(width, height) ~/ 2 - 10;
    int bestRadius = startRadius * 3;
    double maxGradient = 0;

    for (int r = startRadius * 2; r < maxRadius; r += 3) {
      double innerBrightness = 0;
      double outerBrightness = 0;
      int innerCount = 0;
      int outerCount = 0;

      for (int angle = 0; angle < 16; angle++) {
        final theta = angle * math.pi / 8;

        final ix = centerX + ((r - 5) * math.cos(theta)).round();
        final iy = centerY + ((r - 5) * math.sin(theta)).round();
        if (ix >= 0 && ix < width && iy >= 0 && iy < height) {
          final idx = iy * width + ix;
          if (idx < grayscale.length) {
            innerBrightness += grayscale[idx];
            innerCount++;
          }
        }

        final ox = centerX + ((r + 5) * math.cos(theta)).round();
        final oy = centerY + ((r + 5) * math.sin(theta)).round();
        if (ox >= 0 && ox < width && oy >= 0 && oy < height) {
          final idx = oy * width + ox;
          if (idx < grayscale.length) {
            outerBrightness += grayscale[idx];
            outerCount++;
          }
        }
      }

      if (innerCount > 0 && outerCount > 0) {
        innerBrightness /= innerCount;
        outerBrightness /= outerCount;

        final gradient = outerBrightness - innerBrightness;
        if (gradient > maxGradient && gradient > 20) {
          maxGradient = gradient;
          bestRadius = r;
        }
      }
    }

    return bestRadius;
  }

  /// Determine the primary quality issue
  QualityIssue _determineIssue({
    required double sharpness,
    required double brightness,
    required double contrast,
    required double pupilConfidence,
    Offset? pupilCenter,
  }) {
    if (brightness < thresholds.minBrightness) {
      return QualityIssue.tooDark;
    }
    if (brightness > thresholds.maxBrightness) {
      return QualityIssue.tooBright;
    }

    if (contrast < thresholds.minContrast) {
      return QualityIssue.noContrast;
    }

    if (sharpness < thresholds.minSharpness) {
      return QualityIssue.tooBlurry;
    }

    if (pupilConfidence < thresholds.minPupilConfidence) {
      return QualityIssue.noPupil;
    }

    if (pupilCenter != null) {
      final offsetX = (pupilCenter.dx - 0.5).abs();
      final offsetY = (pupilCenter.dy - 0.5).abs();
      if (offsetX > thresholds.maxCenterOffset || offsetY > thresholds.maxCenterOffset) {
        return QualityIssue.notCentered;
      }
    }

    return QualityIssue.none;
  }

  /// Get user-friendly feedback for an issue
  String _getFeedback(QualityIssue issue) {
    switch (issue) {
      case QualityIssue.none:
        return 'Ready! Hold steady...';
      case QualityIssue.tooBlurry:
        return 'Hold camera steady';
      case QualityIssue.tooDark:
        return 'Need more light';
      case QualityIssue.tooBright:
        return 'Too bright - reduce light';
      case QualityIssue.noContrast:
        return 'Adjust lighting angle';
      case QualityIssue.noPupil:
        return 'Center pupil in frame';
      case QualityIssue.notCentered:
        return 'Move eye to center';
      case QualityIssue.notAnEye:
        return 'No eye detected';
      case QualityIssue.processing:
        return 'Processing...';
    }
  }
}

/// Internal class for pupil detection results
class _PupilDetection {
  final double confidence;
  final Offset? center;
  final double? pupilDiameterPx;
  final double? irisDiameterPx;

  _PupilDetection({
    required this.confidence,
    this.center,
    this.pupilDiameterPx,
    this.irisDiameterPx,
  });
}