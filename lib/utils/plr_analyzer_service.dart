// lib/services/plr_analyzer_service.dart
// PLR (Pupillary Light Reflex) Analysis Service
// Processes video frames to calculate PLR metrics

import 'dart:async';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:image/image.dart' as img;
import 'package:ai_eye_capture/pupil_analyzer/pupil_analyzer.dart';
import 'package:ai_eye_capture/utils/plr_constants.dart';

/// A single frame's pupil measurement
class PLRFrameData {
  final int frameIndex;
  final double timestampMs;
  final double? pupilDiameterPx;
  final double? irisDiameterPx;
  final double? pupilIrisRatio;
  final double? confidence;
  final double? brightness;  // To detect flash
  final bool isValid;
  final String? error;

  PLRFrameData({
    required this.frameIndex,
    required this.timestampMs,
    this.pupilDiameterPx,
    this.irisDiameterPx,
    this.pupilIrisRatio,
    this.confidence,
    this.brightness,
    this.isValid = true,
    this.error,
  });

  Map<String, dynamic> toJson() => {
    'frameIndex': frameIndex,
    'timestampMs': timestampMs,
    'pupilDiameterPx': pupilDiameterPx,
    'irisDiameterPx': irisDiameterPx,
    'pupilIrisRatio': pupilIrisRatio,
    'confidence': confidence,
    'brightness': brightness,
    'isValid': isValid,
    'error': error,
  };
}

/// Complete PLR analysis result
class PLRAnalysisResult {
  final DateTime timestamp;
  final bool isRightEye;
  final int totalFrames;
  final int validFrames;
  final int frameRate;

  // Raw time series data
  final List<PLRFrameData> frameData;

  // Detected events
  final int? flashFrameIndex;
  final double? flashTimestampMs;

  // Baseline measurements (pre-flash average)
  final double? baselinePupilRatio;
  final double? baselineStdDev;

  // Constriction measurements
  final double? minPupilRatio;
  final int? minPupilFrameIndex;
  final double? constrictionPercent;
  final double? latencyMs;
  final double? constrictionVelocity;  // %/sec
  final double? timeToMinMs;

  // Recovery measurements
  final double? dilationVelocity;  // %/sec
  final double? t75Ms;  // Time to 75% recovery
  final double? recoveryPercent;  // At end of recording

  // Quality metrics
  final double overallConfidence;
  final String qualityGrade;
  final List<String> warnings;

  // Status evaluations
  final PLRStatus? latencyStatus;
  final PLRStatus? constrictionStatus;
  final PLRStatus? velocityStatus;
  final PLRStatus? recoveryStatus;

  PLRAnalysisResult({
    required this.timestamp,
    required this.isRightEye,
    required this.totalFrames,
    required this.validFrames,
    required this.frameRate,
    required this.frameData,
    this.flashFrameIndex,
    this.flashTimestampMs,
    this.baselinePupilRatio,
    this.baselineStdDev,
    this.minPupilRatio,
    this.minPupilFrameIndex,
    this.constrictionPercent,
    this.latencyMs,
    this.constrictionVelocity,
    this.timeToMinMs,
    this.dilationVelocity,
    this.t75Ms,
    this.recoveryPercent,
    required this.overallConfidence,
    required this.qualityGrade,
    required this.warnings,
    this.latencyStatus,
    this.constrictionStatus,
    this.velocityStatus,
    this.recoveryStatus,
  });

  String get eyeLabel => isRightEye ? 'Right Eye (OD)' : 'Left Eye (OS)';

  bool get isAllNormal =>
      latencyStatus == PLRStatus.normal &&
          constrictionStatus == PLRStatus.normal &&
          velocityStatus == PLRStatus.normal &&
          recoveryStatus == PLRStatus.normal;

  /// Get pupil ratio time series for charting
  List<double?> get pupilRatioSeries =>
      frameData.map((f) => f.pupilIrisRatio).toList();

  /// Get timestamps for charting (in seconds)
  List<double> get timestampsSec =>
      frameData.map((f) => f.timestampMs / 1000.0).toList();

  Map<String, dynamic> toJson() => {
    'timestamp': timestamp.toIso8601String(),
    'eye': isRightEye ? 'OD' : 'OS',
    'totalFrames': totalFrames,
    'validFrames': validFrames,
    'frameRate': frameRate,
    'flashFrameIndex': flashFrameIndex,
    'flashTimestampMs': flashTimestampMs,
    'baseline': {
      'pupilRatio': baselinePupilRatio,
      'stdDev': baselineStdDev,
    },
    'constriction': {
      'minPupilRatio': minPupilRatio,
      'constrictionPercent': constrictionPercent,
      'latencyMs': latencyMs,
      'velocityPerSec': constrictionVelocity,
      'timeToMinMs': timeToMinMs,
    },
    'recovery': {
      'dilationVelocityPerSec': dilationVelocity,
      't75Ms': t75Ms,
      'recoveryPercent': recoveryPercent,
    },
    'quality': {
      'confidence': overallConfidence,
      'grade': qualityGrade,
      'warnings': warnings,
    },
    'status': {
      'latency': latencyStatus?.name,
      'constriction': constrictionStatus?.name,
      'velocity': velocityStatus?.name,
      'recovery': recoveryStatus?.name,
      'allNormal': isAllNormal,
    },
    'waveform': pupilRatioSeries,
  };
}

/// PLR Analyzer Service
class PLRAnalyzerService {
  final PupilAnalyzer _pupilAnalyzer = PupilAnalyzer();

  // Analysis parameters
  static const int _minValidFrames = 50;  // Need at least this many valid frames
  static const double _flashBrightnessThreshold = 180;  // Brightness spike detection
  static const double _flashBrightnessIncrease = 30;  // Min brightness jump
  static const double _baselineWindowSec = 2.5;  // Use first 2.5s for baseline
  static const double _minConfidenceThreshold = 0.3;  // Min confidence to accept frame

  /// Analyze a list of video frames
  ///
  /// [frames] - List of image bytes (JPEG/PNG) extracted from video
  /// [frameRate] - Video frame rate (typically 30)
  /// [isRightEye] - Whether this is the right eye
  /// [flashTimestampMs] - Known flash time (if available), otherwise auto-detect
  /// [onProgress] - Optional callback for progress updates
  Future<PLRAnalysisResult> analyzeFrames({
    required List<Uint8List> frames,
    required int frameRate,
    required bool isRightEye,
    double? flashTimestampMs,
    Function(int current, int total)? onProgress,
  }) async {
    final warnings = <String>[];
    final frameData = <PLRFrameData>[];

    print('[PLR] Starting analysis of ${frames.length} frames at ${frameRate}fps');

    // Process each frame
    for (int i = 0; i < frames.length; i++) {
      final timestampMs = (i / frameRate) * 1000.0;

      try {
        final result = await _analyzeFrame(frames[i], i, timestampMs);
        frameData.add(result);
      } catch (e) {
        frameData.add(PLRFrameData(
          frameIndex: i,
          timestampMs: timestampMs,
          isValid: false,
          error: e.toString(),
        ));
      }

      // Progress callback
      if (onProgress != null && i % 10 == 0) {
        onProgress(i, frames.length);
      }
    }

    final validFrames = frameData.where((f) => f.isValid).length;
    print('[PLR] Processed ${frameData.length} frames, $validFrames valid');

    if (validFrames < _minValidFrames) {
      warnings.add('Low valid frame count: $validFrames (need $_minValidFrames+)');
    }

    // Detect flash frame if not provided
    int? detectedFlashFrame;
    double? detectedFlashMs;

    if (flashTimestampMs != null) {
      detectedFlashFrame = (flashTimestampMs / 1000.0 * frameRate).round();
      detectedFlashMs = flashTimestampMs;
    } else {
      final flashDetection = _detectFlashFrame(frameData);
      detectedFlashFrame = flashDetection['frameIndex'] as int?;
      detectedFlashMs = flashDetection['timestampMs'] as double?;
    }

    if (detectedFlashFrame == null) {
      warnings.add('Could not detect flash frame');
    } else {
      print('[PLR] Flash detected at frame $detectedFlashFrame (${detectedFlashMs?.toStringAsFixed(0)}ms)');
    }

    // Calculate baseline (pre-flash)
    final baseline = _calculateBaseline(frameData, detectedFlashFrame, frameRate);

    // Calculate constriction metrics
    final constriction = _calculateConstriction(
      frameData,
      detectedFlashFrame,
      baseline['mean'] as double?,
      frameRate,
    );

    // Calculate recovery metrics
    final recovery = _calculateRecovery(
      frameData,
      detectedFlashFrame,
      baseline['mean'] as double?,
      constriction['minRatio'] as double?,
      constriction['minFrameIndex'] as int?,
      frameRate,
    );

    // Calculate overall confidence
    final avgConfidence = frameData
        .where((f) => f.isValid && f.confidence != null)
        .map((f) => f.confidence!)
        .fold(0.0, (a, b) => a + b) / math.max(1, validFrames);

    // Determine quality grade
    String qualityGrade;
    if (avgConfidence > 0.7 && validFrames > 200) {
      qualityGrade = 'A';
    } else if (avgConfidence > 0.5 && validFrames > 100) {
      qualityGrade = 'B';
    } else if (avgConfidence > 0.3 && validFrames > 50) {
      qualityGrade = 'C';
    } else {
      qualityGrade = 'D';
    }

    // Evaluate status against normative values
    PLRStatus? latencyStatus;
    PLRStatus? constrictionStatus;
    PLRStatus? velocityStatus;
    PLRStatus? recoveryStatus;

    if (constriction['latencyMs'] != null) {
      latencyStatus = PLRNormativeValues.evaluateLatency(constriction['latencyMs'] as double);
    }
    if (constriction['constrictionPercent'] != null) {
      constrictionStatus = PLRNormativeValues.evaluateConstrictionPercent(
          constriction['constrictionPercent'] as double
      );
    }
    if (constriction['velocity'] != null) {
      // Convert from %/sec to mm/sec (approximate)
      // Assuming average baseline ~6.6mm iris, 30% pupil = ~2mm pupil
      // So 1% change ≈ 0.066mm
      final velocityMmSec = (constriction['velocity'] as double) * 0.066;
      velocityStatus = PLRNormativeValues.evaluateConstrictionVelocity(velocityMmSec);
    }
    if (recovery['t75Sec'] != null) {
      recoveryStatus = PLRNormativeValues.evaluateT75(recovery['t75Sec'] as double);
    }

    return PLRAnalysisResult(
      timestamp: DateTime.now(),
      isRightEye: isRightEye,
      totalFrames: frames.length,
      validFrames: validFrames,
      frameRate: frameRate,
      frameData: frameData,
      flashFrameIndex: detectedFlashFrame,
      flashTimestampMs: detectedFlashMs,
      baselinePupilRatio: baseline['mean'] as double?,
      baselineStdDev: baseline['stdDev'] as double?,
      minPupilRatio: constriction['minRatio'] as double?,
      minPupilFrameIndex: constriction['minFrameIndex'] as int?,
      constrictionPercent: constriction['constrictionPercent'] as double?,
      latencyMs: constriction['latencyMs'] as double?,
      constrictionVelocity: constriction['velocity'] as double?,
      timeToMinMs: constriction['timeToMinMs'] as double?,
      dilationVelocity: recovery['velocity'] as double?,
      t75Ms: recovery['t75Ms'] as double?,
      recoveryPercent: recovery['recoveryPercent'] as double?,
      overallConfidence: avgConfidence,
      qualityGrade: qualityGrade,
      warnings: warnings,
      latencyStatus: latencyStatus,
      constrictionStatus: constrictionStatus,
      velocityStatus: velocityStatus,
      recoveryStatus: recoveryStatus,
    );
  }

  /// Analyze a single frame
  Future<PLRFrameData> _analyzeFrame(Uint8List imageBytes, int frameIndex, double timestampMs) async {
    try {
      // Decode image for brightness calculation
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        return PLRFrameData(
          frameIndex: frameIndex,
          timestampMs: timestampMs,
          isValid: false,
          error: 'Could not decode image',
        );
      }

      // Calculate frame brightness (for flash detection)
      final brightness = _calculateBrightness(image);

      // Run pupil analysis
      final result = await _pupilAnalyzer.analyzeEyeFromBytes(imageBytes);

      // Check confidence threshold
      if (result.confidence < _minConfidenceThreshold) {
        return PLRFrameData(
          frameIndex: frameIndex,
          timestampMs: timestampMs,
          brightness: brightness,
          confidence: result.confidence,
          isValid: false,
          error: 'Low confidence: ${result.confidence.toStringAsFixed(2)}',
        );
      }

      // Calculate pupil diameter (average of major/minor axes)
      final pupilDiameter = (result.pupilMajorAxis + result.pupilMinorAxis) / 2;

      return PLRFrameData(
        frameIndex: frameIndex,
        timestampMs: timestampMs,
        pupilDiameterPx: pupilDiameter,
        irisDiameterPx: result.irisDiameter,
        pupilIrisRatio: result.pupilIrisRatio,
        confidence: result.confidence,
        brightness: brightness,
        isValid: true,
      );
    } catch (e) {
      return PLRFrameData(
        frameIndex: frameIndex,
        timestampMs: timestampMs,
        isValid: false,
        error: e.toString(),
      );
    }
  }

  /// Calculate average brightness of an image
  double _calculateBrightness(img.Image image) {
    double total = 0;
    int count = 0;

    // Sample every 4th pixel for speed
    for (int y = 0; y < image.height; y += 4) {
      for (int x = 0; x < image.width; x += 4) {
        final pixel = image.getPixel(x, y);
        total += (0.299 * pixel.r + 0.587 * pixel.g + 0.114 * pixel.b);
        count++;
      }
    }

    return count > 0 ? total / count : 0;
  }

  /// Detect flash frame from brightness spike
  Map<String, dynamic> _detectFlashFrame(List<PLRFrameData> frameData) {
    double maxBrightness = 0;
    int? flashFrame;
    double? flashMs;

    // Find the brightest frame (should be the flash)
    for (int i = 0; i < frameData.length; i++) {
      final frame = frameData[i];
      if (frame.brightness != null && frame.brightness! > maxBrightness) {
        maxBrightness = frame.brightness!;
        flashFrame = i;
        flashMs = frame.timestampMs;
      }
    }

    // Validate: flash should be significantly brighter than surroundings
    if (flashFrame != null && maxBrightness > _flashBrightnessThreshold) {
      // Check if it's a true spike (not just overall bright video)
      final surroundingBrightness = _getAverageBrightness(
        frameData,
        math.max(0, flashFrame - 30),
        flashFrame - 5,
      );

      if (maxBrightness - surroundingBrightness > _flashBrightnessIncrease) {
        return {'frameIndex': flashFrame, 'timestampMs': flashMs};
      }
    }

    return {'frameIndex': null, 'timestampMs': null};
  }

  /// Get average brightness in a frame range
  double _getAverageBrightness(List<PLRFrameData> frameData, int start, int end) {
    double total = 0;
    int count = 0;

    for (int i = start; i <= end && i < frameData.length; i++) {
      if (frameData[i].brightness != null) {
        total += frameData[i].brightness!;
        count++;
      }
    }

    return count > 0 ? total / count : 0;
  }

  /// Calculate baseline pupil ratio (before flash)
  Map<String, dynamic> _calculateBaseline(
      List<PLRFrameData> frameData,
      int? flashFrame,
      int frameRate,
      ) {
    if (flashFrame == null) {
      return {'mean': null, 'stdDev': null};
    }

    // Use frames from 0.5s to (flash - 0.2s) for baseline
    final startFrame = (0.5 * frameRate).round();
    final endFrame = flashFrame - (0.2 * frameRate).round();

    final baselineValues = <double>[];
    for (int i = startFrame; i < endFrame && i < frameData.length; i++) {
      final frame = frameData[i];
      if (frame.isValid && frame.pupilIrisRatio != null) {
        baselineValues.add(frame.pupilIrisRatio!);
      }
    }

    if (baselineValues.isEmpty) {
      return {'mean': null, 'stdDev': null};
    }

    final mean = baselineValues.reduce((a, b) => a + b) / baselineValues.length;
    final variance = baselineValues
        .map((v) => math.pow(v - mean, 2))
        .reduce((a, b) => a + b) / baselineValues.length;
    final stdDev = math.sqrt(variance);

    return {'mean': mean, 'stdDev': stdDev};
  }

  /// Calculate constriction metrics
  Map<String, dynamic> _calculateConstriction(
      List<PLRFrameData> frameData,
      int? flashFrame,
      double? baselineRatio,
      int frameRate,
      ) {
    if (flashFrame == null || baselineRatio == null) {
      return {
        'minRatio': null,
        'minFrameIndex': null,
        'constrictionPercent': null,
        'latencyMs': null,
        'velocity': null,
        'timeToMinMs': null,
      };
    }

    // Search for minimum pupil ratio after flash (within 2 seconds)
    final searchEnd = math.min(frameData.length, flashFrame + (2 * frameRate).round());

    double? minRatio;
    int? minFrameIndex;

    for (int i = flashFrame; i < searchEnd; i++) {
      final frame = frameData[i];
      if (frame.isValid && frame.pupilIrisRatio != null) {
        if (minRatio == null || frame.pupilIrisRatio! < minRatio) {
          minRatio = frame.pupilIrisRatio;
          minFrameIndex = i;
        }
      }
    }

    if (minRatio == null || minFrameIndex == null) {
      return {
        'minRatio': null,
        'minFrameIndex': null,
        'constrictionPercent': null,
        'latencyMs': null,
        'velocity': null,
        'timeToMinMs': null,
      };
    }

    // Constriction percent
    final constrictionPercent = ((baselineRatio - minRatio) / baselineRatio) * 100;

    // Latency: time from flash to start of constriction
    // Define "start" as when pupil drops below baseline - 2*stdDev
    double? latencyMs;
    for (int i = flashFrame; i < minFrameIndex; i++) {
      final frame = frameData[i];
      if (frame.isValid && frame.pupilIrisRatio != null) {
        if (frame.pupilIrisRatio! < baselineRatio * 0.98) {  // 2% drop
          latencyMs = frame.timestampMs - frameData[flashFrame].timestampMs;
          break;
        }
      }
    }

    // Time to minimum
    final timeToMinMs = frameData[minFrameIndex].timestampMs - frameData[flashFrame].timestampMs;

    // Constriction velocity (%/sec)
    double? velocity;
    if (timeToMinMs > 0 && latencyMs != null) {
      final constrictionDuration = timeToMinMs - latencyMs;
      if (constrictionDuration > 0) {
        velocity = constrictionPercent / (constrictionDuration / 1000.0);
      }
    }

    return {
      'minRatio': minRatio,
      'minFrameIndex': minFrameIndex,
      'constrictionPercent': constrictionPercent,
      'latencyMs': latencyMs,
      'velocity': velocity,
      'timeToMinMs': timeToMinMs,
    };
  }

  /// Calculate recovery metrics
  Map<String, dynamic> _calculateRecovery(
      List<PLRFrameData> frameData,
      int? flashFrame,
      double? baselineRatio,
      double? minRatio,
      int? minFrameIndex,
      int frameRate,
      ) {
    if (flashFrame == null || baselineRatio == null || minRatio == null || minFrameIndex == null) {
      return {
        'velocity': null,
        't75Ms': null,
        't75Sec': null,
        'recoveryPercent': null,
      };
    }

    // Target for 75% recovery
    final recoveryTarget = minRatio + (baselineRatio - minRatio) * 0.75;

    // Find T75
    double? t75Ms;
    for (int i = minFrameIndex; i < frameData.length; i++) {
      final frame = frameData[i];
      if (frame.isValid && frame.pupilIrisRatio != null) {
        if (frame.pupilIrisRatio! >= recoveryTarget) {
          t75Ms = frame.timestampMs - frameData[minFrameIndex].timestampMs;
          break;
        }
      }
    }

    // Final recovery percent
    double? recoveryPercent;
    final lastValidFrame = frameData.lastWhere(
          (f) => f.isValid && f.pupilIrisRatio != null,
      orElse: () => frameData.last,
    );
    if (lastValidFrame.pupilIrisRatio != null) {
      final recovered = lastValidFrame.pupilIrisRatio! - minRatio;
      final totalConstriction = baselineRatio - minRatio;
      if (totalConstriction > 0) {
        recoveryPercent = (recovered / totalConstriction) * 100;
      }
    }

    // Dilation velocity
    double? velocity;
    if (t75Ms != null && t75Ms > 0) {
      final dilationAmount = (recoveryTarget - minRatio) / baselineRatio * 100;  // % of baseline
      velocity = dilationAmount / (t75Ms / 1000.0);
    }

    return {
      'velocity': velocity,
      't75Ms': t75Ms,
      't75Sec': t75Ms != null ? t75Ms / 1000.0 : null,
      'recoveryPercent': recoveryPercent,
    };
  }
}