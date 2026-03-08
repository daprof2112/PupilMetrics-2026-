import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:image/image.dart' as img;

/// Result of pupil analysis for a single eye
class EyeAnalysisResult {
  /// Iris measurements
  final double irisCenterX;
  final double irisCenterY;
  final double irisRadius;
  final double irisDiameter;

  /// Pupil measurements
  final double pupilCenterX;
  final double pupilCenterY;
  final double pupilMajorAxis;
  final double pupilMinorAxis;
  final double pupilAngle;

  /// Calculated parameters (percentages)
  final double pupilIrisRatio;
  final double ellipseness;
  final double decentralization;
  final double decentralizationAngle;

  /// ANW (Autonomic Nerve Wreath / Collarette) - if detected
  final double? anwRadius;
  final double? anwRatio;

  /// Quality metrics
  final double confidence;
  final bool hasReflections;
  final String qualityGrade; // A, B, C, D

  /// Clinical interpretation
  final String decentralizationZone;
  final bool isDeformationSignificant;

  EyeAnalysisResult({
    required this.irisCenterX,
    required this.irisCenterY,
    required this.irisRadius,
    required this.irisDiameter,
    required this.pupilCenterX,
    required this.pupilCenterY,
    required this.pupilMajorAxis,
    required this.pupilMinorAxis,
    required this.pupilAngle,
    required this.pupilIrisRatio,
    required this.ellipseness,
    required this.decentralization,
    required this.decentralizationAngle,
    this.anwRadius,
    this.anwRatio,
    required this.confidence,
    required this.hasReflections,
    required this.qualityGrade,
    required this.decentralizationZone,
    required this.isDeformationSignificant,
  });

  Map<String, dynamic> toJson() => {
        'iris': {
          'centerX': irisCenterX,
          'centerY': irisCenterY,
          'radius': irisRadius,
          'diameter': irisDiameter,
        },
        'pupil': {
          'centerX': pupilCenterX,
          'centerY': pupilCenterY,
          'majorAxis': pupilMajorAxis,
          'minorAxis': pupilMinorAxis,
          'angle': pupilAngle,
        },
        'parameters': {
          'pupilIrisRatio': pupilIrisRatio,
          'ellipseness': ellipseness,
          'decentralization': decentralization,
          'decentralizationAngle': decentralizationAngle,
          'anwRatio': anwRatio,
        },
        'clinical': {
          'decentralizationZone': decentralizationZone,
          'isDeformationSignificant': isDeformationSignificant,
        },
        'quality': {
          'confidence': confidence,
          'hasReflections': hasReflections,
          'grade': qualityGrade,
        },
      };
}

/// Combined analysis result for both eyes
class BilateralAnalysisResult {
  final EyeAnalysisResult? leftEye;
  final EyeAnalysisResult? rightEye;
  final DateTime analyzedAt;
  final List<String> clinicalNotes;
  final List<String> warnings;

  /// Bilateral comparison metrics
  final double? pupilRatioAsymmetry;
  final double? ellipsenessAsymmetry;

  BilateralAnalysisResult({
    this.leftEye,
    this.rightEye,
    required this.analyzedAt,
    required this.clinicalNotes,
    required this.warnings,
    this.pupilRatioAsymmetry,
    this.ellipsenessAsymmetry,
  });

  bool get hasBothEyes => leftEye != null && rightEye != null;

  Map<String, dynamic> toJson() => {
        'leftEye': leftEye?.toJson(),
        'rightEye': rightEye?.toJson(),
        'analyzedAt': analyzedAt.toIso8601String(),
        'clinicalNotes': clinicalNotes,
        'warnings': warnings,
        'bilateral': {
          'pupilRatioAsymmetry': pupilRatioAsymmetry,
          'ellipsenessAsymmetry': ellipsenessAsymmetry,
        },
      };
}

/// Main analyzer class - drop this into your Flutter project!
class PupilAnalyzer {
  // Configuration constants (calibrated from 712 Bexel images)
  static const double _irisMinRatio = 0.30; // Min iris size as % of image width
  static const double _irisMaxRatio = 0.55; // Max iris size as % of image width
  static const double _pupilSearchRatio = 0.45; // Search inner 45% of iris
  static const double _darkPercentile = 0.25; // 25th percentile for pupil threshold
  static const double _reflectionThreshold = 0.85; // 85% brightness = reflection
  static const double _deformationThreshold = 3.0; // Clinical significance threshold

  // ANW detection parameters
  static const double _anwInnerRatio = 0.35; // ANW typically 35-45% from center
  static const double _anwOuterRatio = 0.50;

  /// Analyze a single eye image
  /// 
  /// [imageFile] - File object pointing to the eye image (JPG, PNG, BMP)
  /// Returns [EyeAnalysisResult] with all measurements
  Future<EyeAnalysisResult> analyzeEye(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    return analyzeEyeFromBytes(bytes);
  }

  /// Analyze from image bytes (useful for camera captures)
  Future<EyeAnalysisResult> analyzeEyeFromBytes(Uint8List bytes) async {
    final image = img.decodeImage(bytes);
    if (image == null) {
      throw ArgumentError('Could not decode image');
    }
    return _analyzeImage(image);
  }

  /// Analyze from dart:ui Image (after camera capture)
  Future<EyeAnalysisResult> analyzeEyeFromImage(img.Image image) async {
    return _analyzeImage(image);
  }

  /// Analyze both eyes and generate bilateral report
  Future<BilateralAnalysisResult> analyzeEyes({
    File? leftEyeImage,
    File? rightEyeImage,
    Uint8List? leftEyeBytes,
    Uint8List? rightEyeBytes,
  }) async {
    EyeAnalysisResult? leftResult;
    EyeAnalysisResult? rightResult;
    final warnings = <String>[];
    final clinicalNotes = <String>[];

    // Analyze left eye
    if (leftEyeImage != null) {
      try {
        leftResult = await analyzeEye(leftEyeImage);
      } catch (e) {
        warnings.add('Left eye analysis failed: $e');
      }
    } else if (leftEyeBytes != null) {
      try {
        leftResult = await analyzeEyeFromBytes(leftEyeBytes);
      } catch (e) {
        warnings.add('Left eye analysis failed: $e');
      }
    }

    // Analyze right eye
    if (rightEyeImage != null) {
      try {
        rightResult = await analyzeEye(rightEyeImage);
      } catch (e) {
        warnings.add('Right eye analysis failed: $e');
      }
    } else if (rightEyeBytes != null) {
      try {
        rightResult = await analyzeEyeFromBytes(rightEyeBytes);
      } catch (e) {
        warnings.add('Right eye analysis failed: $e');
      }
    }

    // Generate clinical notes
    if (leftResult != null) {
      _addClinicalNotes(clinicalNotes, leftResult, 'Left');
    }
    if (rightResult != null) {
      _addClinicalNotes(clinicalNotes, rightResult, 'Right');
    }

    // Calculate bilateral asymmetry
    double? pupilAsymmetry;
    double? ellipAsymmetry;
    if (leftResult != null && rightResult != null) {
      pupilAsymmetry =
          (leftResult.pupilIrisRatio - rightResult.pupilIrisRatio).abs();
      ellipAsymmetry =
          (leftResult.ellipseness - rightResult.ellipseness).abs();

      if (pupilAsymmetry > 5.0) {
        clinicalNotes.add(
            'Significant pupil size asymmetry: ${pupilAsymmetry.toStringAsFixed(1)}%');
      }
      if (ellipAsymmetry > 5.0) {
        clinicalNotes
            .add('Ellipseness asymmetry noted: ${ellipAsymmetry.toStringAsFixed(1)}%');
      }
    }

    return BilateralAnalysisResult(
      leftEye: leftResult,
      rightEye: rightResult,
      analyzedAt: DateTime.now(),
      clinicalNotes: clinicalNotes,
      warnings: warnings,
      pupilRatioAsymmetry: pupilAsymmetry,
      ellipsenessAsymmetry: ellipAsymmetry,
    );
  }

  /// Internal: Main analysis algorithm
  EyeAnalysisResult _analyzeImage(img.Image image) {
    final width = image.width;
    final height = image.height;

    // Convert to grayscale for processing
    final gray = _toGrayscale(image);

    // Step 1: Detect iris boundary
    final irisResult = _detectIris(gray, width, height);

    // Step 2: Detect and mask reflections
    final reflectionMask = _detectReflections(gray, irisResult);

    // Step 3: Detect pupil within iris
    final pupilResult =
        _detectPupil(gray, irisResult, reflectionMask, width, height);

    // Step 4: Detect ANW (collarette) - optional
    final anwResult = _detectANW(gray, irisResult, pupilResult);

    // Step 5: Calculate all parameters
    return _calculateParameters(
      irisResult,
      pupilResult,
      anwResult,
      reflectionMask.hasReflections,
      width,
      height,
    );
  }

  /// Convert image to grayscale values (0-255)
  List<List<int>> _toGrayscale(img.Image image) {
    final gray = List.generate(
      image.height,
      (y) => List.generate(image.width, (x) {
        final pixel = image.getPixel(x, y);
        // Luminance formula
        return ((0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b)).round();
      }),
    );
    return gray;
  }

  /// Detect iris boundary using edge detection and circle fitting
  _IrisResult _detectIris(List<List<int>> gray, int width, int height) {
    // Expected iris radius range
    final minRadius = (width * _irisMinRatio).round();
    final maxRadius = (width * _irisMaxRatio).round();

    // Apply Gaussian blur (simple 3x3 box blur approximation)
    final blurred = _boxBlur(gray, 3);

    // Find circular gradient patterns
    // Using simplified radial gradient voting
    double bestScore = 0;
    int bestX = width ~/ 2;
    int bestY = height ~/ 2;
    int bestR = (width * 0.40).round();

    // Search grid (coarse to fine)
    for (int r = minRadius; r <= maxRadius; r += 5) {
      for (int cy = height ~/ 4; cy < 3 * height ~/ 4; cy += 5) {
        for (int cx = width ~/ 4; cx < 3 * width ~/ 4; cx += 5) {
          final score = _circleGradientScore(blurred, cx, cy, r, width, height);
          if (score > bestScore) {
            bestScore = score;
            bestX = cx;
            bestY = cy;
            bestR = r;
          }
        }
      }
    }

    // Fine-tune around best candidate
    for (int r = bestR - 5; r <= bestR + 5; r++) {
      for (int cy = bestY - 5; cy <= bestY + 5; cy++) {
        for (int cx = bestX - 5; cx <= bestX + 5; cx++) {
          final score = _circleGradientScore(blurred, cx, cy, r, width, height);
          if (score > bestScore) {
            bestScore = score;
            bestX = cx;
            bestY = cy;
            bestR = r;
          }
        }
      }
    }

    return _IrisResult(
      centerX: bestX.toDouble(),
      centerY: bestY.toDouble(),
      radius: bestR.toDouble(),
      confidence: math.min(bestScore / 100, 1.0),
    );
  }

  /// Score how well a circle matches the iris boundary gradient
  double _circleGradientScore(
      List<List<int>> gray, int cx, int cy, int r, int width, int height) {
    double score = 0;
    int samples = 0;

    // Sample points around the circle
    for (int angle = 0; angle < 360; angle += 10) {
      final rad = angle * math.pi / 180;
      final x = (cx + r * math.cos(rad)).round();
      final y = (cy + r * math.sin(rad)).round();

      // Check bounds
      if (x < 2 || x >= width - 2 || y < 2 || y >= height - 2) continue;

      // Calculate radial gradient (inside should be darker/iris, outside lighter/sclera)
      final innerX = (cx + (r - 5) * math.cos(rad)).round();
      final innerY = (cy + (r - 5) * math.sin(rad)).round();
      final outerX = (cx + (r + 5) * math.cos(rad)).round();
      final outerY = (cy + (r + 5) * math.sin(rad)).round();

      if (innerX >= 0 &&
          innerX < width &&
          innerY >= 0 &&
          innerY < height &&
          outerX >= 0 &&
          outerX < width &&
          outerY >= 0 &&
          outerY < height) {
        final innerVal = gray[innerY][innerX];
        final outerVal = gray[outerY][outerX];

        // Iris should be darker than sclera
        if (outerVal > innerVal) {
          score += (outerVal - innerVal);
        }
        samples++;
      }
    }

    return samples > 0 ? score / samples : 0;
  }

  /// Detect bright reflections (flash spots)
  _ReflectionResult _detectReflections(List<List<int>> gray, _IrisResult iris) {
    final reflectionPixels = <_Point>[];
    final threshold = (255 * _reflectionThreshold).round();

    final minX = math.max(0, (iris.centerX - iris.radius).round());
    final maxX = math.min(gray[0].length - 1, (iris.centerX + iris.radius).round());
    final minY = math.max(0, (iris.centerY - iris.radius).round());
    final maxY = math.min(gray.length - 1, (iris.centerY + iris.radius).round());

    for (int y = minY; y <= maxY; y++) {
      for (int x = minX; x <= maxX; x++) {
        // Check if within iris
        final dx = x - iris.centerX;
        final dy = y - iris.centerY;
        if (dx * dx + dy * dy <= iris.radius * iris.radius) {
          if (gray[y][x] > threshold) {
            reflectionPixels.add(_Point(x.toDouble(), y.toDouble()));
          }
        }
      }
    }

    return _ReflectionResult(
      pixels: reflectionPixels,
      hasReflections: reflectionPixels.length > 50,
    );
  }

  /// Detect pupil boundary within iris
  _PupilResult _detectPupil(List<List<int>> gray, _IrisResult iris,
      _ReflectionResult reflections, int width, int height) {
    // Search region: inner portion of iris
    final searchRadius = iris.radius * _pupilSearchRatio;

    // Collect pixel values in search region (excluding reflections)
    final searchPixels = <int>[];
    final reflectionSet = reflections.pixels
        .map((p) => '${p.x.round()},${p.y.round()}')
        .toSet();

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final dx = x - iris.centerX;
        final dy = y - iris.centerY;
        final dist = math.sqrt(dx * dx + dy * dy);

        if (dist <= searchRadius) {
          final key = '$x,$y';
          if (!reflectionSet.contains(key)) {
            searchPixels.add(gray[y][x]);
          }
        }
      }
    }

    if (searchPixels.isEmpty) {
      // Fallback: assume pupil at center with default size
      return _PupilResult(
        centerX: iris.centerX,
        centerY: iris.centerY,
        majorAxis: iris.radius * 0.24,
        minorAxis: iris.radius * 0.24,
        angle: 0,
        confidence: 0.2,
      );
    }

    // Find dark threshold (25th percentile)
    searchPixels.sort();
    final thresholdIndex = (searchPixels.length * _darkPercentile).round();
    final darkThreshold = searchPixels[thresholdIndex];

    // Find all dark pixels (potential pupil)
    final pupilPixels = <_Point>[];
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final dx = x - iris.centerX;
        final dy = y - iris.centerY;
        final dist = math.sqrt(dx * dx + dy * dy);

        if (dist <= searchRadius && gray[y][x] <= darkThreshold) {
          final key = '$x,$y';
          if (!reflectionSet.contains(key)) {
            pupilPixels.add(_Point(x.toDouble(), y.toDouble()));
          }
        }
      }
    }

    if (pupilPixels.isEmpty) {
      return _PupilResult(
        centerX: iris.centerX,
        centerY: iris.centerY,
        majorAxis: iris.radius * 0.24,
        minorAxis: iris.radius * 0.24,
        angle: 0,
        confidence: 0.3,
      );
    }

    // Calculate centroid
    double sumX = 0, sumY = 0;
    for (final p in pupilPixels) {
      sumX += p.x;
      sumY += p.y;
    }
    final centroidX = sumX / pupilPixels.length;
    final centroidY = sumY / pupilPixels.length;

    // Fit ellipse using covariance matrix (PCA approach)
    final ellipse = _fitEllipse(pupilPixels, centroidX, centroidY);

    // Validate size
    final pupilRatio = ellipse.majorAxis / iris.radius;
    double confidence = 0.5;

    if (pupilRatio >= 0.15 && pupilRatio <= 0.50) {
      confidence += 0.3;
    }
    if (ellipse.minorAxis / ellipse.majorAxis > 0.7) {
      confidence += 0.2; // Good circularity
    }

    return _PupilResult(
      centerX: centroidX,
      centerY: centroidY,
      majorAxis: ellipse.majorAxis,
      minorAxis: ellipse.minorAxis,
      angle: ellipse.angle,
      confidence: math.min(confidence, 1.0),
    );
  }

  /// Fit ellipse to points using PCA
  _EllipseParams _fitEllipse(List<_Point> points, double cx, double cy) {
    if (points.length < 5) {
      return _EllipseParams(majorAxis: 20, minorAxis: 20, angle: 0);
    }

    // Calculate covariance matrix
    double cxx = 0, cyy = 0, cxy = 0;
    for (final p in points) {
      final dx = p.x - cx;
      final dy = p.y - cy;
      cxx += dx * dx;
      cyy += dy * dy;
      cxy += dx * dy;
    }
    cxx /= points.length;
    cyy /= points.length;
    cxy /= points.length;

    // Eigenvalues for axes
    final trace = cxx + cyy;
    final det = cxx * cyy - cxy * cxy;
    final discriminant = math.sqrt(math.max(0, trace * trace / 4 - det));

    final lambda1 = trace / 2 + discriminant;
    final lambda2 = trace / 2 - discriminant;

    // Axes are proportional to sqrt of eigenvalues
    // Scale factor ~2 to convert from std to diameter approximation
    final majorAxis = 2.0 * math.sqrt(math.max(lambda1, lambda2));
    final minorAxis = 2.0 * math.sqrt(math.max(0, math.min(lambda1, lambda2)));

    // Angle from eigenvector
    final angle = 0.5 * math.atan2(2 * cxy, cxx - cyy) * 180 / math.pi;

    return _EllipseParams(
      majorAxis: majorAxis,
      minorAxis: minorAxis,
      angle: angle,
    );
  }

  /// Detect ANW (Autonomic Nerve Wreath / Collarette)
  _ANWResult? _detectANW(
      List<List<int>> gray, _IrisResult iris, _PupilResult pupil) {
    // ANW is the boundary between pupillary zone and ciliary zone
    // Typically appears as a lighter ring at 35-45% from center

    final innerRadius = iris.radius * _anwInnerRatio;
    final outerRadius = iris.radius * _anwOuterRatio;

    // Sample radial profiles to find the ANW
    final radialProfiles = <double>[];

    for (int angle = 0; angle < 360; angle += 5) {
      final rad = angle * math.pi / 180;
      double maxGradient = 0;
      double maxGradientRadius = innerRadius;

      for (double r = innerRadius; r < outerRadius; r += 2) {
        final x = (iris.centerX + r * math.cos(rad)).round();
        final y = (iris.centerY + r * math.sin(rad)).round();
        final xNext = (iris.centerX + (r + 2) * math.cos(rad)).round();
        final yNext = (iris.centerY + (r + 2) * math.sin(rad)).round();

        if (x >= 0 &&
            x < gray[0].length &&
            y >= 0 &&
            y < gray.length &&
            xNext >= 0 &&
            xNext < gray[0].length &&
            yNext >= 0 &&
            yNext < gray.length) {
          final gradient = (gray[yNext][xNext] - gray[y][x]).abs().toDouble();
          if (gradient > maxGradient) {
            maxGradient = gradient;
            maxGradientRadius = r;
          }
        }
      }
      radialProfiles.add(maxGradientRadius);
    }

    if (radialProfiles.isEmpty) return null;

    // Average ANW radius
    final avgRadius =
        radialProfiles.reduce((a, b) => a + b) / radialProfiles.length;

    return _ANWResult(
      radius: avgRadius,
      confidence: 0.5, // ANW detection is less reliable
    );
  }

  /// Calculate all clinical parameters
  EyeAnalysisResult _calculateParameters(
    _IrisResult iris,
    _PupilResult pupil,
    _ANWResult? anw,
    bool hasReflections,
    int imageWidth,
    int imageHeight,
  ) {
    // Pupil/Iris ratio (percentage)
    final pupilDiameter = (pupil.majorAxis + pupil.minorAxis); // Average diameter
    final pupilIrisRatio = (pupilDiameter / (iris.radius * 2)) * 100;

    // Ellipseness (100% = perfect circle)
    final ellipseness = (pupil.minorAxis / pupil.majorAxis) * 100;

    // Decentralization (pupil offset from iris center)
    final dx = pupil.centerX - iris.centerX;
    final dy = pupil.centerY - iris.centerY;
    final offsetDistance = math.sqrt(dx * dx + dy * dy);
    final decentralization = (offsetDistance / iris.radius) * 100;

    // Decentralization angle (0° = right/temporal, counterclockwise)
    // Note: In image coordinates, Y increases downward
    final decentralizationAngle = math.atan2(-dy, dx) * 180 / math.pi;

    // Determine anatomical zone
    final zone = _getAnatomicalZone(decentralizationAngle);

    // ANW ratio
    double? anwRatio;
    if (anw != null) {
      anwRatio = (anw.radius / iris.radius) * 100;
    }

    // Deformation significance (Bexel uses 3% threshold)
    final isSignificant = decentralization >= _deformationThreshold ||
        ellipseness <= 90 ||
        pupilIrisRatio < 15 ||
        pupilIrisRatio > 40;

    // Quality grade
    String qualityGrade;
    final avgConfidence = (iris.confidence + pupil.confidence) / 2;
    if (avgConfidence > 0.8 && !hasReflections) {
      qualityGrade = 'A';
    } else if (avgConfidence > 0.6) {
      qualityGrade = 'B';
    } else if (avgConfidence > 0.4) {
      qualityGrade = 'C';
    } else {
      qualityGrade = 'D';
    }

    return EyeAnalysisResult(
      irisCenterX: iris.centerX,
      irisCenterY: iris.centerY,
      irisRadius: iris.radius,
      irisDiameter: iris.radius * 2,
      pupilCenterX: pupil.centerX,
      pupilCenterY: pupil.centerY,
      pupilMajorAxis: pupil.majorAxis,
      pupilMinorAxis: pupil.minorAxis,
      pupilAngle: pupil.angle,
      pupilIrisRatio: pupilIrisRatio,
      ellipseness: ellipseness,
      decentralization: decentralization,
      decentralizationAngle: decentralizationAngle,
      anwRadius: anw?.radius,
      anwRatio: anwRatio,
      confidence: avgConfidence,
      hasReflections: hasReflections,
      qualityGrade: qualityGrade,
      decentralizationZone: zone,
      isDeformationSignificant: isSignificant,
    );
  }

  /// Map decentralization angle to anatomical zone
  String _getAnatomicalZone(double angle) {
    // Normalize angle to 0-360
    double normAngle = angle;
    if (normAngle < 0) normAngle += 360;

    // Map to clock positions and zones
    // Note: This is for RIGHT eye; LEFT eye would be mirrored
    if (normAngle >= 330 || normAngle < 30) {
      return 'temporal'; // 3 o'clock position
    } else if (normAngle >= 30 && normAngle < 60) {
      return 'upper-temporal';
    } else if (normAngle >= 60 && normAngle < 120) {
      return 'upper-nasal'; // 12 o'clock area
    } else if (normAngle >= 120 && normAngle < 150) {
      return 'middle-nasal';
    } else if (normAngle >= 150 && normAngle < 210) {
      return 'nasal'; // 9 o'clock position
    } else if (normAngle >= 210 && normAngle < 240) {
      return 'lower-nasal';
    } else if (normAngle >= 240 && normAngle < 300) {
      return 'lower-temporal'; // 6 o'clock area
    } else {
      return 'middle-temporal';
    }
  }

  /// Add clinical notes based on analysis
  void _addClinicalNotes(
      List<String> notes, EyeAnalysisResult result, String eye) {
    if (result.isDeformationSignificant) {
      if (result.decentralization >= _deformationThreshold) {
        notes.add(
            '$eye eye: ${result.decentralizationZone} decentralization (${result.decentralization.toStringAsFixed(1)}%)');
      }
      if (result.ellipseness <= 90) {
        notes.add(
            '$eye eye: Pupil ellipseness noted (${result.ellipseness.toStringAsFixed(1)}%)');
      }
      if (result.pupilIrisRatio < 15) {
        notes.add('$eye eye: Miosis (small pupil ${result.pupilIrisRatio.toStringAsFixed(1)}%)');
      }
      if (result.pupilIrisRatio > 40) {
        notes.add(
            '$eye eye: Mydriasis (large pupil ${result.pupilIrisRatio.toStringAsFixed(1)}%)');
      }
    }

    if (result.qualityGrade == 'D') {
      notes.add('$eye eye: Low image quality - consider recapture');
    }
  }

  /// Simple box blur for noise reduction
  List<List<int>> _boxBlur(List<List<int>> input, int size) {
    final height = input.length;
    final width = input[0].length;
    final output = List.generate(height, (y) => List.filled(width, 0));
    final half = size ~/ 2;

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int sum = 0;
        int count = 0;
        for (int dy = -half; dy <= half; dy++) {
          for (int dx = -half; dx <= half; dx++) {
            final ny = y + dy;
            final nx = x + dx;
            if (ny >= 0 && ny < height && nx >= 0 && nx < width) {
              sum += input[ny][nx];
              count++;
            }
          }
        }
        output[y][x] = sum ~/ count;
      }
    }
    return output;
  }
}

// ============================================================
// Internal helper classes
// ============================================================

class _Point {
  final double x;
  final double y;
  _Point(this.x, this.y);
}

class _IrisResult {
  final double centerX;
  final double centerY;
  final double radius;
  final double confidence;

  _IrisResult({
    required this.centerX,
    required this.centerY,
    required this.radius,
    required this.confidence,
  });
}

class _PupilResult {
  final double centerX;
  final double centerY;
  final double majorAxis;
  final double minorAxis;
  final double angle;
  final double confidence;

  _PupilResult({
    required this.centerX,
    required this.centerY,
    required this.majorAxis,
    required this.minorAxis,
    required this.angle,
    required this.confidence,
  });
}

class _ReflectionResult {
  final List<_Point> pixels;
  final bool hasReflections;

  _ReflectionResult({
    required this.pixels,
    required this.hasReflections,
  });
}

class _EllipseParams {
  final double majorAxis;
  final double minorAxis;
  final double angle;

  _EllipseParams({
    required this.majorAxis,
    required this.minorAxis,
    required this.angle,
  });
}

class _ANWResult {
  final double radius;
  final double confidence;

  _ANWResult({
    required this.radius,
    required this.confidence,
  });
}
