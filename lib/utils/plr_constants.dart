// lib/utils/plr_constants.dart
// PLR Reference Values from peer-reviewed literature
// Sources: Lurie Children's Ophthalmology study, Military Medicine normative study

/// Normal PLR reference values based on clinical research
class PLRNormativeValues {
  // === PUPIL SIZE ===
  /// Baseline (maximum) pupil diameter in mm
  static const double baselineDiameterMean = 6.6;
  static const double baselineDiameterSD = 0.74;
  static const double baselineDiameterMin = 5.1;  // 95% CI lower
  static const double baselineDiameterMax = 8.1;  // 95% CI upper

  /// Minimum pupil diameter after constriction in mm
  static const double minDiameterMean = 4.7;
  static const double minDiameterSD = 0.77;
  static const double minDiameterMin = 3.1;
  static const double minDiameterMax = 6.1;

  // === CONSTRICTION ===
  /// Percentage of pupil constriction
  static const double constrictionPercentMean = 30.0;
  static const double constrictionPercentSD = 6.2;
  static const double constrictionPercentMin = 17.0;  // 95% CI
  static const double constrictionPercentMax = 42.0;  // 95% CI

  /// Latency from light stimulus to constriction start (milliseconds)
  static const double latencyMsMean = 230.0;
  static const double latencyMsSD = 34.0;
  static const double latencyMsMin = 160.0;
  static const double latencyMsMax = 300.0;

  /// Note: Latency increases ~1ms per year with aging

  // === VELOCITIES ===
  /// Average constriction velocity (mm/sec)
  static const double avgConstrictionVelocityMean = 3.70;
  static const double avgConstrictionVelocitySD = 0.744;
  static const double avgConstrictionVelocityMin = 2.21;
  static const double avgConstrictionVelocityMax = 5.18;

  /// Average dilation velocity (mm/sec)
  static const double avgDilationVelocityMean = 0.88;
  static const double avgDilationVelocitySD = 0.25;
  static const double avgDilationVelocityMin = 0.63;
  static const double avgDilationVelocityMax = 1.13;

  /// Abnormal constriction velocity threshold (mm/sec)
  /// Values below this are considered "slow"
  static const double abnormalConstrictionVelocityThreshold = 0.8;

  // === RECOVERY ===
  /// T75: Time for pupil to recover to 75% of baseline (seconds)
  static const double t75SecondsMean = 2.07;  // Normal eyes
  static const double t75SecondsAbnormal = 2.87;  // Horner syndrome example

  // === NEUROLOGICAL PUPIL INDEX (NPi) ===
  /// NPi ranges from 0 (non-reactive) to 5 (normal)
  static const double npiNormalMin = 3.0;
  static const double npiMax = 5.0;

  // === RECORDING PARAMETERS ===
  static const int targetFrameRate = 30;  // Minimum fps for accurate timing
  static const int recordingDurationSec = 10;
  static const int flashTriggerSec = 3;  // When to trigger flash
  static const int flashDurationMs = 500;

  /// Evaluate if a metric is within normal range
  static PLRStatus evaluateLatency(double latencyMs) {
    if (latencyMs < latencyMsMin) return PLRStatus.fast;
    if (latencyMs > latencyMsMax) return PLRStatus.slow;
    return PLRStatus.normal;
  }

  static PLRStatus evaluateConstrictionPercent(double percent) {
    if (percent < constrictionPercentMin) return PLRStatus.reduced;
    if (percent > constrictionPercentMax) return PLRStatus.elevated;
    return PLRStatus.normal;
  }

  static PLRStatus evaluateConstrictionVelocity(double velocity) {
    if (velocity < abnormalConstrictionVelocityThreshold) return PLRStatus.slow;
    if (velocity < avgConstrictionVelocityMin) return PLRStatus.reduced;
    if (velocity > avgConstrictionVelocityMax) return PLRStatus.elevated;
    return PLRStatus.normal;
  }

  static PLRStatus evaluateDilationVelocity(double velocity) {
    if (velocity < avgDilationVelocityMin) return PLRStatus.slow;
    if (velocity > avgDilationVelocityMax) return PLRStatus.fast;
    return PLRStatus.normal;
  }

  static PLRStatus evaluateT75(double t75Seconds) {
    if (t75Seconds > 3.0) return PLRStatus.prolonged;  // Slow recovery
    if (t75Seconds < 1.5) return PLRStatus.fast;
    return PLRStatus.normal;
  }

  /// Get a description for the status
  static String statusDescription(PLRStatus status) {
    switch (status) {
      case PLRStatus.normal: return 'Within normal range';
      case PLRStatus.slow: return 'Slower than normal';
      case PLRStatus.fast: return 'Faster than normal';
      case PLRStatus.reduced: return 'Reduced response';
      case PLRStatus.elevated: return 'Elevated response';
      case PLRStatus.prolonged: return 'Prolonged recovery';
      case PLRStatus.absent: return 'No response detected';
    }
  }
}

enum PLRStatus {
  normal,
  slow,
  fast,
  reduced,
  elevated,
  prolonged,
  absent,
}

/// PLR Analysis Result Model
class PLRAnalysisResult {
  final DateTime timestamp;
  final bool isRightEye;

  // Raw measurements
  final double baselineDiameterMm;
  final double minDiameterMm;
  final double constrictionPercent;
  final double latencyMs;
  final double avgConstrictionVelocity;  // mm/s
  final double avgDilationVelocity;      // mm/s
  final double t75Seconds;

  // Frame data for waveform
  final List<double> diameterTimeSeries;  // Diameter at each frame
  final int frameRate;
  final int flashFrameIndex;  // Frame where flash occurred

  // Evaluated statuses
  late final PLRStatus latencyStatus;
  late final PLRStatus constrictionStatus;
  late final PLRStatus constrictionVelocityStatus;
  late final PLRStatus dilationVelocityStatus;
  late final PLRStatus t75Status;

  PLRAnalysisResult({
    required this.timestamp,
    required this.isRightEye,
    required this.baselineDiameterMm,
    required this.minDiameterMm,
    required this.constrictionPercent,
    required this.latencyMs,
    required this.avgConstrictionVelocity,
    required this.avgDilationVelocity,
    required this.t75Seconds,
    required this.diameterTimeSeries,
    required this.frameRate,
    required this.flashFrameIndex,
  }) {
    // Evaluate all metrics against normative values
    latencyStatus = PLRNormativeValues.evaluateLatency(latencyMs);
    constrictionStatus = PLRNormativeValues.evaluateConstrictionPercent(constrictionPercent);
    constrictionVelocityStatus = PLRNormativeValues.evaluateConstrictionVelocity(avgConstrictionVelocity);
    dilationVelocityStatus = PLRNormativeValues.evaluateDilationVelocity(avgDilationVelocity);
    t75Status = PLRNormativeValues.evaluateT75(t75Seconds);
  }

  String get eyeLabel => isRightEye ? 'Right Eye (OD)' : 'Left Eye (OS)';

  /// Overall assessment
  bool get isAllNormal =>
      latencyStatus == PLRStatus.normal &&
          constrictionStatus == PLRStatus.normal &&
          constrictionVelocityStatus == PLRStatus.normal &&
          dilationVelocityStatus == PLRStatus.normal &&
          t75Status == PLRStatus.normal;

  /// Convert to JSON for export
  Map<String, dynamic> toJson() => {
    'timestamp': timestamp.toIso8601String(),
    'eye': isRightEye ? 'OD' : 'OS',
    'baseline_diameter_mm': baselineDiameterMm,
    'min_diameter_mm': minDiameterMm,
    'constriction_percent': constrictionPercent,
    'latency_ms': latencyMs,
    'avg_constriction_velocity_mm_s': avgConstrictionVelocity,
    'avg_dilation_velocity_mm_s': avgDilationVelocity,
    't75_seconds': t75Seconds,
    'frame_rate': frameRate,
    'flash_frame': flashFrameIndex,
    'waveform_data': diameterTimeSeries,
    'assessment': {
      'latency': latencyStatus.name,
      'constriction': constrictionStatus.name,
      'constriction_velocity': constrictionVelocityStatus.name,
      'dilation_velocity': dilationVelocityStatus.name,
      't75': t75Status.name,
      'all_normal': isAllNormal,
    },
  };
}