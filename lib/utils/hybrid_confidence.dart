import 'package:ai_eye_capture/utils/ml_pupil_analyzer.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

class HybridConfidenceFusion {
  static const double _captureWeight = 0.20;
  static const double _classicalWeight = 0.35;
  static const double _mlWeight = 0.20;
  static const double _agreementWeight = 0.25;

  static HybridConfidenceBreakdown fuse({
    required EyeAnalysisResult classical,
    required MLAnalysisResult ml,
    double? captureQuality,
    bool validationPassed = true,
  }) {
    if (!validationPassed) {
      return const HybridConfidenceBreakdown(
        fusedConfidence: 0.0,
        captureQuality: 0.0,
        classicalConfidence: 0.0,
        mlPlausibility: 0.0,
        crossModelAgreement: 0.0,
        agreementPi: 0.0,
        agreementEllipseness: 0.0,
        agreementDecentration: 0.0,
        validationPassed: false,
      );
    }

    final normalizedCapture = (captureQuality ?? 0.60).clamp(0.0, 1.0);
    final normalizedClassical = classical.confidence.clamp(0.0, 1.0);
    final mlPlausibility = _computeMlPlausibility(ml);
    final agreementPi =
        _agreement(classical.pupilIrisRatio, ml.piRatio, tolerance: 10.0);
    final agreementEllipseness =
        _agreement(classical.ellipseness, ml.ellipseness, tolerance: 10.0);
    final agreementDecentration =
        _agreement(classical.decentralization, ml.decentration, tolerance: 8.0);

    final crossModelAgreement = (
      0.50 * agreementPi +
      0.30 * agreementEllipseness +
      0.20 * agreementDecentration
    ).clamp(0.0, 1.0);

    double fused = (
      _captureWeight * normalizedCapture +
      _classicalWeight * normalizedClassical +
      _mlWeight * mlPlausibility +
      _agreementWeight * crossModelAgreement
    ).clamp(0.0, 1.0);

    if (normalizedClassical < 0.25) {
      fused = fused.clamp(0.0, 0.40);
    }
    if (normalizedCapture < 0.30) {
      fused = fused.clamp(0.0, 0.50);
    }
    if (agreementPi < 0.20 && agreementEllipseness < 0.20) {
      fused = fused.clamp(0.0, 0.35);
    }

    return HybridConfidenceBreakdown(
      fusedConfidence: fused,
      captureQuality: normalizedCapture,
      classicalConfidence: normalizedClassical,
      mlPlausibility: mlPlausibility,
      crossModelAgreement: crossModelAgreement,
      agreementPi: agreementPi,
      agreementEllipseness: agreementEllipseness,
      agreementDecentration: agreementDecentration,
      validationPassed: validationPassed,
    );
  }

  static double _computeMlPlausibility(MLAnalysisResult ml) {
    final piScore = _softRange(ml.piRatio, idealMin: 20.0, idealMax: 40.0);
    final ellipsenessScore =
        _softRange(ml.ellipseness, idealMin: 88.0, idealMax: 100.0);
    final decentrationScore =
        _softInverseRange(ml.decentration, idealMin: 0.0, idealMax: 8.0);
    // decentrationAngle should be a valid compass bearing (0–360°); outside that = implausible
    final angleScore =
        _softRange(ml.decentrationAngle, idealMin: 0.0, idealMax: 360.0);

    return (
      0.35 * piScore +
      0.25 * ellipsenessScore +
      0.20 * decentrationScore +
      0.20 * angleScore
    ).clamp(0.0, 1.0);
  }

  static double _agreement(double classicalValue, double mlValue,
      {required double tolerance}) {
    return (1.0 - ((classicalValue - mlValue).abs() / tolerance))
        .clamp(0.0, 1.0);
  }

  static double _softRange(double value,
      {required double idealMin, required double idealMax}) {
    if (value >= idealMin && value <= idealMax) {
      return 1.0;
    }

    final center = (idealMin + idealMax) / 2.0;
    final halfWidth = (idealMax - idealMin) / 2.0;
    final distance = (value - center).abs() - halfWidth;
    final normalizedDistance = distance <= 0 ? 0.0 : distance / halfWidth;
    return (1.0 - normalizedDistance).clamp(0.0, 1.0);
  }

  static double _softInverseRange(double value,
      {required double idealMin, required double idealMax}) {
    if (value >= idealMin && value <= idealMax) {
      return 1.0;
    }

    final span = (idealMax - idealMin).abs();
    if (span == 0) return 0.0;

    final distance = value < idealMin ? idealMin - value : value - idealMax;
    return (1.0 - (distance / span)).clamp(0.0, 1.0);
  }
}

class HybridConfidenceBreakdown {
  final double fusedConfidence;
  final double captureQuality;
  final double classicalConfidence;
  final double mlPlausibility;
  final double crossModelAgreement;
  final double agreementPi;
  final double agreementEllipseness;
  final double agreementDecentration;
  final bool validationPassed;

  const HybridConfidenceBreakdown({
    required this.fusedConfidence,
    required this.captureQuality,
    required this.classicalConfidence,
    required this.mlPlausibility,
    required this.crossModelAgreement,
    required this.agreementPi,
    required this.agreementEllipseness,
    required this.agreementDecentration,
    required this.validationPassed,
  });

  Map<String, dynamic> toJson() => {
        'fusedConfidence': fusedConfidence,
        'captureQuality': captureQuality,
        'classicalConfidence': classicalConfidence,
        'mlPlausibility': mlPlausibility,
        'crossModelAgreement': crossModelAgreement,
        'agreementPi': agreementPi,
        'agreementEllipseness': agreementEllipseness,
        'agreementDecentration': agreementDecentration,
        'validationPassed': validationPassed,
      };
}
