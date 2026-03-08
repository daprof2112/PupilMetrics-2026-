import 'dart:typed_data';
import 'package:image/image.dart' as img_lib;
import 'dart:math';

class DetectionResult {
  final bool eyeDetected;
  final bool isWellCentered;
  final bool hasGoodLighting;
  final double centerX;
  final double centerY;
  final double confidence;
  final double sharpness;

  DetectionResult({
    required this.eyeDetected,
    required this.isWellCentered,
    required this.hasGoodLighting,
    required this.centerX,
    required this.centerY,
    required this.confidence,
    required this.sharpness,
  });
}

class IrisDetector {
  static const int processingSize = 128;
  static const double centerThreshold = 0.20;
  static const double minBrightness = 50;
  static const double maxBrightness = 220;
  static const double minSharpness = 30;

  Future<void> loadModel() async {
    print('[IrisDetector] Using built-in eye detection (no model required)');
  }

  Future<DetectionResult> detectIrisFromBytes(Uint8List imageBytes) async {
    try {
      final img = img_lib.decodeImage(imageBytes);
      if (img == null) {
        return _noDetectionResult();
      }

      final resized = img_lib.copyResize(
        img,
        width: processingSize,
        height: processingSize,
      );

      final brightness = _calculateBrightness(resized);
      final hasGoodLighting = brightness >= minBrightness && brightness <= maxBrightness;

      final sharpness = _calculateSharpness(resized);
      final isSharp = sharpness > minSharpness;

      final detection = _advancedEyeDetection(resized, hasGoodLighting);
      final eyeDetected = detection.eyeDetected && isSharp;

      return DetectionResult(
        eyeDetected: eyeDetected,
        isWellCentered: detection.isWellCentered,
        hasGoodLighting: hasGoodLighting,
        centerX: detection.centerX,
        centerY: detection.centerY,
        confidence: detection.confidence,
        sharpness: sharpness,
      );
    } catch (e) {
      print('[IrisDetector] Error in detectIris: $e');
      return _noDetectionResult();
    }
  }

  DetectionResult _advancedEyeDetection(img_lib.Image image, bool hasGoodLighting) {
    try {
      final gray = img_lib.grayscale(image);
      final pupilDetection = _detectPupilRegion(gray);
      final edgeDetection = _detectIrisBoundary(gray);

      final centerX = (pupilDetection['x']! + edgeDetection['x']!) / 2;
      final centerY = (pupilDetection['y']! + edgeDetection['y']!) / 2;
      final confidence = (pupilDetection['confidence']! + edgeDetection['confidence']!) / 2;

      final eyeDetected = confidence > 0.4;

      final distanceFromCenter = sqrt(
          pow(centerX - 0.5, 2) + pow(centerY - 0.5, 2)
      );
      final isWellCentered = distanceFromCenter < centerThreshold;

      return DetectionResult(
        eyeDetected: eyeDetected,
        isWellCentered: isWellCentered,
        hasGoodLighting: hasGoodLighting,
        centerX: centerX,
        centerY: centerY,
        confidence: confidence,
        sharpness: 0,
      );
    } catch (e) {
      print('[IrisDetector] Error in advanced detection: $e');
      return _noDetectionResult();
    }
  }

  Map<String, double> _detectPupilRegion(img_lib.Image gray) {
    int minBrightness = 255;
    int darkestX = processingSize ~/ 2;
    int darkestY = processingSize ~/ 2;
    int darkPixelCount = 0;

    const startX = processingSize ~/ 4;
    const endX = 3 * processingSize ~/ 4;
    const startY = processingSize ~/ 4;
    const endY = 3 * processingSize ~/ 4;

    for (int y = startY; y < endY; y++) {
      for (int x = startX; x < endX; x++) {
        final pixel = gray.getPixel(x, y);
        final brightness = pixel.r.toInt();

        if (brightness < 80) {
          darkPixelCount++;
        }

        if (brightness < minBrightness) {
          minBrightness = brightness;
          darkestX = x;
          darkestY = y;
        }
      }
    }

    const expectedPupilSize = (processingSize * processingSize) * 0.02;
    final confidence = (darkPixelCount > expectedPupilSize && minBrightness < 100) ? 0.7 : 0.3;

    return {
      'x': darkestX / processingSize,
      'y': darkestY / processingSize,
      'confidence': confidence,
    };
  }

  Map<String, double> _detectIrisBoundary(img_lib.Image gray) {
    final edges = _sobelEdgeDetection(gray);

    double sumX = 0;
    double sumY = 0;
    int edgeCount = 0;

    const startX = processingSize ~/ 4;
    const endX = 3 * processingSize ~/ 4;
    const startY = processingSize ~/ 4;
    const endY = 3 * processingSize ~/ 4;

    for (int y = startY; y < endY; y++) {
      for (int x = startX; x < endX; x++) {
        final pixel = edges.getPixel(x, y);
        final edgeStrength = pixel.r.toInt();

        if (edgeStrength > 100) {
          sumX += x * edgeStrength;
          sumY += y * edgeStrength;
          edgeCount += edgeStrength;
        }
      }
    }

    if (edgeCount == 0) {
      return {
        'x': 0.5,
        'y': 0.5,
        'confidence': 0.0,
      };
    }

    final centerX = (sumX / edgeCount) / processingSize;
    final centerY = (sumY / edgeCount) / processingSize;
    final confidence = min(edgeCount / 10000.0, 1.0);

    return {
      'x': centerX,
      'y': centerY,
      'confidence': confidence,
    };
  }

  img_lib.Image _sobelEdgeDetection(img_lib.Image gray) {
    final width = gray.width;
    final height = gray.height;
    final edges = img_lib.Image(width: width, height: height);

    final sobelX = [[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]];
    final sobelY = [[-1, -2, -1], [0, 0, 0], [1, 2, 1]];

    for (int y = 1; y < height - 1; y++) {
      for (int x = 1; x < width - 1; x++) {
        double gx = 0;
        double gy = 0;

        for (int ky = -1; ky <= 1; ky++) {
          for (int kx = -1; kx <= 1; kx++) {
            final pixel = gray.getPixel(x + kx, y + ky);
            final value = pixel.r.toInt();
            gx += value * sobelX[ky + 1][kx + 1];
            gy += value * sobelY[ky + 1][kx + 1];
          }
        }

        final magnitude = sqrt(gx * gx + gy * gy).clamp(0, 255).toInt();
        edges.setPixelRgba(x, y, magnitude, magnitude, magnitude, 255);
      }
    }

    return edges;
  }

  double _calculateSharpness(img_lib.Image image) {
    final gray = img_lib.grayscale(image);
    final width = gray.width;
    final height = gray.height;

    List<double> laplacianValues = [];

    final kernel = [
      [0, 1, 0],
      [1, -4, 1],
      [0, 1, 0],
    ];

    for (int y = 1; y < height - 1; y++) {
      for (int x = 1; x < width - 1; x++) {
        double sum = 0;

        for (int ky = -1; ky <= 1; ky++) {
          for (int kx = -1; kx <= 1; kx++) {
            final pixel = gray.getPixel(x + kx, y + ky);
            sum += pixel.r.toInt() * kernel[ky + 1][kx + 1];
          }
        }

        laplacianValues.add(sum.abs());
      }
    }

    if (laplacianValues.isEmpty) return 0;

    final mean = laplacianValues.reduce((a, b) => a + b) / laplacianValues.length;
    final variance = laplacianValues
        .map((v) => pow(v - mean, 2))
        .reduce((a, b) => a + b) / laplacianValues.length;

    return variance;
  }

  double _calculateBrightness(img_lib.Image image) {
    double totalBrightness = 0;
    int pixelCount = 0;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        totalBrightness += (0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b);
        pixelCount++;
      }
    }

    return totalBrightness / pixelCount;
  }

  DetectionResult _noDetectionResult() {
    return DetectionResult(
      eyeDetected: false,
      isWellCentered: false,
      hasGoodLighting: false,
      centerX: 0.5,
      centerY: 0.5,
      confidence: 0.0,
      sharpness: 0.0,
    );
  }

  void dispose() {
    // Nothing to dispose
  }
}
