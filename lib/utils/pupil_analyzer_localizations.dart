// lib/utils/pupil_analyzer_localizations.dart
// Localization helper for PupilAnalyzer clinical descriptions
// Bridges pure Dart analyzer with Flutter l10n system
// v5.2.1 - Now uses ClinicalConstants as English base/fallback

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/config/clinical_constants.dart';
import 'pupil_analyzer_fixed.dart';

/// Helper class to get localized strings for pupil analysis results.
/// Uses ClinicalConstants as English base, l10n for translations.
class PupilAnalyzerLocalizations {
  final AppLocalizations l10n;

  PupilAnalyzerLocalizations(this.l10n);

  /// Factory constructor from BuildContext
  factory PupilAnalyzerLocalizations.of(BuildContext context) {
    return PupilAnalyzerLocalizations(AppLocalizations.of(context)!);
  }

  // ============================================================================
  // SIGNIFICANCE LABELS
  // ============================================================================

  String getSignificanceLabel(FindingSignificance significance) {
    switch (significance) {
      case FindingSignificance.withinLimits:
        return _tryL10n(() => l10n.significanceWithinLimits,
            ClinicalConstants.significanceLabels['withinLimits']!);
      case FindingSignificance.mild:
        return _tryL10n(() => l10n.significanceMild,
            ClinicalConstants.significanceLabels['mild']!);
      case FindingSignificance.moderate:
        return _tryL10n(() => l10n.significanceModerate,
            ClinicalConstants.significanceLabels['moderate']!);
      case FindingSignificance.significant:
        return _tryL10n(() => l10n.significanceSignificant,
            ClinicalConstants.significanceLabels['significant']!);
    }
  }

  // ============================================================================
  // PUPIL FORM TYPE NAMES
  // ============================================================================

  String getFormTypeName(PupilFormType formType) {
    switch (formType) {
      case PupilFormType.circle:
        return _tryL10n(() => l10n.formTypeCircle,
            ClinicalConstants.pupilFormTypeNames['circle']!);
      case PupilFormType.oval:
        return _tryL10n(() => l10n.formTypeOval,
            ClinicalConstants.pupilFormTypeNames['oval']!);
      case PupilFormType.ovalVertical:
        return _tryL10n(() => l10n.formTypeOvalVertical,
            ClinicalConstants.pupilFormTypeNames['ovalVertical']!);
      case PupilFormType.ovalHorizontal:
        return _tryL10n(() => l10n.formTypeOvalHorizontal,
            ClinicalConstants.pupilFormTypeNames['ovalHorizontal']!);
      case PupilFormType.ovalDiagonal:
        return _tryL10n(() => l10n.formTypeOvalDiagonal,
            ClinicalConstants.pupilFormTypeNames['ovalDiagonal']!);
      case PupilFormType.leftObliqueEllipse:
        return _tryL10n(() => l10n.formTypeLeftObliqueEllipse,
            ClinicalConstants.pupilFormTypeNames['leftObliqueEllipse']!);
      case PupilFormType.unilateralEllipse:
        return _tryL10n(() => l10n.formTypeUnilateralEllipse,
            ClinicalConstants.pupilFormTypeNames['unilateralEllipse']!);
      case PupilFormType.ventralDivergingEllipse:
        return _tryL10n(() => l10n.formTypeVentralDivergingEllipse,
            ClinicalConstants.pupilFormTypeNames['ventralDivergingEllipse']!);
      case PupilFormType.frontalDivergingEllipse:
        return _tryL10n(() => l10n.formTypeFrontalDivergingEllipse,
            ClinicalConstants.pupilFormTypeNames['frontalDivergingEllipse']!);
      case PupilFormType.ellipse:
        return _tryL10n(() => l10n.formTypeEllipse,
            ClinicalConstants.pupilFormTypeNames['ellipse']!);
      case PupilFormType.chord:
        return _tryL10n(() => l10n.formTypeChord,
            ClinicalConstants.pupilFormTypeNames['chord']!);
      case PupilFormType.irregular:
        return _tryL10n(() => l10n.formTypeIrregular,
            ClinicalConstants.pupilFormTypeNames['irregular']!);
    }
  }

  // ============================================================================
  // PUPIL FORM DESCRIPTIONS
  // ============================================================================

  String getPupilFormDescription(PupilFormType formType) {
    final fallback = ClinicalConstants.getPupilFormDescription(formType.name);

    switch (formType) {
      case PupilFormType.circle:
        return _tryL10n(() => l10n.pupilFormCircleDesc, fallback);
      case PupilFormType.ovalHorizontal:
        return _tryL10n(() => l10n.pupilFormOvalHorizontalDesc, fallback);
      case PupilFormType.ovalVertical:
        return _tryL10n(() => l10n.pupilFormOvalVerticalDesc, fallback);
      case PupilFormType.ovalDiagonal:
        return _tryL10n(() => l10n.pupilFormOvalDiagonalDesc, fallback);
      case PupilFormType.leftObliqueEllipse:
        return _tryL10n(() => l10n.pupilFormLeftObliqueEllipseDesc, fallback);
      case PupilFormType.unilateralEllipse:
        return _tryL10n(() => l10n.pupilFormUnilateralEllipseDesc, fallback);
      case PupilFormType.ventralDivergingEllipse:
        return _tryL10n(() => l10n.pupilFormVentralDivergingEllipseDesc, fallback);
      case PupilFormType.frontalDivergingEllipse:
        return _tryL10n(() => l10n.pupilFormFrontalDivergingEllipseDesc, fallback);
      case PupilFormType.oval:
        return _tryL10n(() => l10n.pupilFormOvalDesc, fallback);
      case PupilFormType.ellipse:
        return _tryL10n(() => l10n.pupilFormEllipseDesc, fallback);
      case PupilFormType.chord:
        return _tryL10n(() => l10n.pupilFormChordDesc, fallback);
      case PupilFormType.irregular:
        return _tryL10n(() => l10n.pupilFormIrregularDesc, fallback);
    }
  }

  // ============================================================================
  // DECENTRATION PATTERN NAMES
  // ============================================================================

  String getPatternName(DecentrationPattern pattern) {
    final fallback = ClinicalConstants.getPatternName(pattern.name);

    switch (pattern) {
      case DecentrationPattern.centered:
        return _tryL10n(() => l10n.patternCentered, fallback);
      case DecentrationPattern.frontal:
        return _tryL10n(() => l10n.patternFrontal, fallback);
      case DecentrationPattern.basal:
        return _tryL10n(() => l10n.patternBasal, fallback);
      case DecentrationPattern.nasal:
        return _tryL10n(() => l10n.patternNasal, fallback);
      case DecentrationPattern.temporal:
        return _tryL10n(() => l10n.patternTemporal, fallback);
      case DecentrationPattern.middleNasal:
        return _tryL10n(() => l10n.patternMiddleNasal, fallback);
      case DecentrationPattern.middleTemporal:
        return _tryL10n(() => l10n.patternMiddleTemporal, fallback);
      case DecentrationPattern.upperNasal:
        return _tryL10n(() => l10n.patternUpperNasal, fallback);
      case DecentrationPattern.upperTemporal:
        return _tryL10n(() => l10n.patternUpperTemporal, fallback);
      case DecentrationPattern.lowerNasal:
        return _tryL10n(() => l10n.patternLowerNasal, fallback);
      case DecentrationPattern.lowerTemporal:
        return _tryL10n(() => l10n.patternLowerTemporal, fallback);
      case DecentrationPattern.upwards:
        return _tryL10n(() => l10n.patternUpwards, fallback);
      case DecentrationPattern.downwards:
        return _tryL10n(() => l10n.patternDownwards, fallback);
      case DecentrationPattern.upwardsInwards:
        return _tryL10n(() => l10n.patternUpwardsInwards, fallback);
      case DecentrationPattern.upwardsOutwards:
        return _tryL10n(() => l10n.patternUpwardsOutwards, fallback);
    }
  }

  // ============================================================================
  // DECENTRATION PATTERN DESCRIPTIONS
  // ============================================================================

  String getDecentrationDescription(DecentrationPattern pattern, bool isRightEye) {
    final fallback = ClinicalConstants.getDecentrationAssociation(pattern.name, isRightEye);

    switch (pattern) {
      case DecentrationPattern.centered:
        return _tryL10n(() => l10n.decentrationCenteredDesc, fallback);
      case DecentrationPattern.nasal:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationNasalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationNasalLeftDesc, fallback);
      case DecentrationPattern.temporal:
        return _tryL10n(() => l10n.decentrationTemporalDesc, fallback);
      case DecentrationPattern.frontal:
      case DecentrationPattern.upwards:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationFrontalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationFrontalLeftDesc, fallback);
      case DecentrationPattern.basal:
      case DecentrationPattern.downwards:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationBasalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationBasalLeftDesc, fallback);
      case DecentrationPattern.upwardsInwards:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationUpwardsInwardsRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationUpwardsInwardsLeftDesc, fallback);
      case DecentrationPattern.upwardsOutwards:
        return _tryL10n(() => l10n.decentrationUpwardsOutwardsDesc, fallback);
      case DecentrationPattern.middleNasal:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationMiddleNasalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationMiddleNasalLeftDesc, fallback);
      case DecentrationPattern.middleTemporal:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationMiddleTemporalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationMiddleTemporalLeftDesc, fallback);
      case DecentrationPattern.upperNasal:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationUpperNasalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationUpperNasalLeftDesc, fallback);
      case DecentrationPattern.upperTemporal:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationUpperTemporalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationUpperTemporalLeftDesc, fallback);
      case DecentrationPattern.lowerNasal:
        return _tryL10n(() => l10n.decentrationLowerNasalDesc, fallback);
      case DecentrationPattern.lowerTemporal:
        return isRightEye
            ? _tryL10n(() => l10n.decentrationLowerTemporalRightDesc, fallback)
            : _tryL10n(() => l10n.decentrationLowerTemporalLeftDesc, fallback);
    }
  }

  // ============================================================================
  // ZONE NAMES
  // ============================================================================

  String getZoneName(String zone) {
    final z = zone.toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');
    switch (z) {
      case 'upper-central':
      case 'frontal':
        return _tryL10n(() => l10n.zoneUpperCentral, 'Upper-Central');
      case 'upper-nasal':
        return _tryL10n(() => l10n.zoneUpperNasal, 'Upper-Nasal');
      case 'middle-nasal':
        return _tryL10n(() => l10n.zoneMiddleNasal, 'Middle-Nasal');
      case 'lower-nasal':
        return _tryL10n(() => l10n.zoneLowerNasal, 'Lower-Nasal');
      case 'lower-basal':
      case 'basal':
        return _tryL10n(() => l10n.zoneLowerBasal, 'Lower-Basal');
      case 'lower-temporal':
        return _tryL10n(() => l10n.zoneLowerTemporal, 'Lower-Temporal');
      case 'middle-temporal':
        return _tryL10n(() => l10n.zoneMiddleTemporal, 'Middle-Temporal');
      case 'upper-temporal':
        return _tryL10n(() => l10n.zoneUpperTemporal, 'Upper-Temporal');
      default:
        return _tryL10n(() => l10n.zoneUnknown, 'Unknown');
    }
  }

  // ============================================================================
  // FLATTENING DESCRIPTIONS
  // ============================================================================

  String getFlatteningDescription(String zone, bool isRightEye) {
    final fallback = ClinicalConstants.getFlatteningAssociation(zone, isRightEye);
    final z = zone.toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');

    if (isRightEye) {
      switch (z) {
        case 'upper-central':
        case 'frontal':
          return _tryL10n(() => l10n.flatteningUpperCentralRightDesc, fallback);
        case 'upper-temporal':
          return _tryL10n(() => l10n.flatteningUpperTemporalRightDesc, fallback);
        case 'middle-temporal':
          return _tryL10n(() => l10n.flatteningMiddleTemporalRightDesc, fallback);
        case 'lower-temporal':
          return _tryL10n(() => l10n.flatteningLowerTemporalRightDesc, fallback);
        case 'lower-basal':
        case 'basal':
          return _tryL10n(() => l10n.flatteningLowerBasalRightDesc, fallback);
        case 'lower-nasal':
          return _tryL10n(() => l10n.flatteningLowerNasalRightDesc, fallback);
        case 'middle-nasal':
          return _tryL10n(() => l10n.flatteningMiddleNasalRightDesc, fallback);
        case 'upper-nasal':
          return _tryL10n(() => l10n.flatteningUpperNasalRightDesc, fallback);
        default:
          return _tryL10n(() => l10n.flatteningDefaultRightDesc, fallback);
      }
    } else {
      switch (z) {
        case 'upper-central':
        case 'frontal':
          return _tryL10n(() => l10n.flatteningUpperCentralLeftDesc, fallback);
        case 'upper-temporal':
          return _tryL10n(() => l10n.flatteningUpperTemporalLeftDesc, fallback);
        case 'middle-temporal':
          return _tryL10n(() => l10n.flatteningMiddleTemporalLeftDesc, fallback);
        case 'lower-temporal':
          return _tryL10n(() => l10n.flatteningLowerTemporalLeftDesc, fallback);
        case 'lower-basal':
        case 'basal':
          return _tryL10n(() => l10n.flatteningLowerBasalLeftDesc, fallback);
        case 'lower-nasal':
          return _tryL10n(() => l10n.flatteningLowerNasalLeftDesc, fallback);
        case 'middle-nasal':
          return _tryL10n(() => l10n.flatteningMiddleNasalLeftDesc, fallback);
        case 'upper-nasal':
          return _tryL10n(() => l10n.flatteningUpperNasalLeftDesc, fallback);
        default:
          return _tryL10n(() => l10n.flatteningDefaultLeftDesc, fallback);
      }
    }
  }

  // ============================================================================
  // PROTRUSION DESCRIPTIONS
  // ============================================================================

  String getProtrusionDescription(String zone, bool isRightEye) {
    final fallback = ClinicalConstants.getProtrusionAssociation(zone, isRightEye);
    final z = zone.toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');

    if (isRightEye) {
      switch (z) {
        case 'upper-central':
        case 'frontal':
          return _tryL10n(() => l10n.protrusionUpperCentralRightDesc, fallback);
        case 'upper-temporal':
          return _tryL10n(() => l10n.protrusionUpperTemporalRightDesc, fallback);
        case 'middle-temporal':
          return _tryL10n(() => l10n.protrusionMiddleTemporalRightDesc, fallback);
        case 'lower-temporal':
          return _tryL10n(() => l10n.protrusionLowerTemporalRightDesc, fallback);
        case 'lower-basal':
        case 'basal':
          return _tryL10n(() => l10n.protrusionLowerBasalRightDesc, fallback);
        case 'lower-nasal':
          return _tryL10n(() => l10n.protrusionLowerNasalRightDesc, fallback);
        case 'middle-nasal':
          return _tryL10n(() => l10n.protrusionMiddleNasalRightDesc, fallback);
        case 'upper-nasal':
          return _tryL10n(() => l10n.protrusionUpperNasalRightDesc, fallback);
        default:
          return _tryL10n(() => l10n.protrusionDefaultRightDesc, fallback);
      }
    } else {
      switch (z) {
        case 'upper-central':
        case 'frontal':
          return _tryL10n(() => l10n.protrusionUpperCentralLeftDesc, fallback);
        case 'upper-temporal':
          return _tryL10n(() => l10n.protrusionUpperTemporalLeftDesc, fallback);
        case 'middle-temporal':
          return _tryL10n(() => l10n.protrusionMiddleTemporalLeftDesc, fallback);
        case 'lower-temporal':
          return _tryL10n(() => l10n.protrusionLowerTemporalLeftDesc, fallback);
        case 'lower-basal':
        case 'basal':
          return _tryL10n(() => l10n.protrusionLowerBasalLeftDesc, fallback);
        case 'lower-nasal':
          return _tryL10n(() => l10n.protrusionLowerNasalLeftDesc, fallback);
        case 'middle-nasal':
          return _tryL10n(() => l10n.protrusionMiddleNasalLeftDesc, fallback);
        case 'upper-nasal':
          return _tryL10n(() => l10n.protrusionUpperNasalLeftDesc, fallback);
        default:
          return _tryL10n(() => l10n.protrusionDefaultLeftDesc, fallback);
      }
    }
  }

  // ============================================================================
  // ANISOCORIA
  // ============================================================================

  String getAnisocoriaSeverityDescription(AnisocoriaSeverity severity) {
    final fallback = ClinicalConstants.getSeverityDescription(severity.name);

    switch (severity) {
      case AnisocoriaSeverity.none:
        return _tryL10n(() => l10n.anisocoriaSeverityNone, fallback);
      case AnisocoriaSeverity.mild:
        return _tryL10n(() => l10n.anisocoriaSeverityMild, fallback);
      case AnisocoriaSeverity.moderate:
        return _tryL10n(() => l10n.anisocoriaSeverityModerate, fallback);
      case AnisocoriaSeverity.severe:
        return _tryL10n(() => l10n.anisocoriaSeveritySevere, fallback);
    }
  }

  String getLargerPupilLabel(String largerPupil) {
    switch (largerPupil.toLowerCase()) {
      case 'equal':
        return _tryL10n(() => l10n.largerPupilEqual, 'Equal');
      case 'os (left)':
        return _tryL10n(() => l10n.largerPupilOS, 'OS (Left)');
      case 'od (right)':
        return _tryL10n(() => l10n.largerPupilOD, 'OD (Right)');
      default:
        return largerPupil;
    }
  }

  String getAnisocoriaClinicalNote(AnisocoriaAssessment assessment) {
    if (assessment.severity == AnisocoriaSeverity.none) {
      return _tryL10n(() => l10n.anisocoriaNone, 'Pupils symmetric.');
    }

    final direction = assessment.leftPupilRatio > assessment.rightPupilRatio
        ? _tryL10n(() => l10n.anisocoriaDirectionSD, 'S>D')
        : _tryL10n(() => l10n.anisocoriaDirectionDS, 'D>S');

    final description = getAnisocoriaSeverityDescription(assessment.severity);

    return _tryL10n(
          () => l10n.anisocoriaDetected(
        assessment.absoluteDifference.toStringAsFixed(1),
        direction,
        description,
      ),
      'Anisocoria detected: ${assessment.absoluteDifference.toStringAsFixed(1)}% ($direction). $description',
    );
  }

  // ============================================================================
  // DECENTRATION CLINICAL NOTE
  // ============================================================================

  String getDecentrationClinicalNote(DecentrationAssessment assessment) {
    if (assessment.correctedOffsetPercent < ClinicalThresholds.decentrationNormal) {
      return _tryL10n(() => l10n.decentrationWithinLimits, 'Within normal limits.');
    }

    final patternName = getPatternName(assessment.pattern);
    return _tryL10n(
          () => l10n.decentrationClinicalNote(
        patternName,
        assessment.correctedOffsetPercent.toStringAsFixed(2),
      ),
      '$patternName. Offset: ${assessment.correctedOffsetPercent.toStringAsFixed(2)}%',
    );
  }

  // ============================================================================
  // ZONE ANOMALY HELPERS
  // ============================================================================

  /// Get localized description for a ZoneAnomaly
  String getZoneAnomalyDescription(ZoneAnomaly anomaly, bool isRightEye) {
    final zoneName = getZoneName(anomaly.zone);
    final fallback = '${anomaly.anomalyType == AnomalyType.flattening ? "Flattening" : "Protrusion"} '
        'at $zoneName (${anomaly.clockPosition}) - ${anomaly.percentage.toStringAsFixed(1)}%';

    if (anomaly.anomalyType == AnomalyType.flattening) {
      return _tryL10n(
            () => l10n.flatteningDescription(
          zoneName,
          anomaly.clockPosition,
          anomaly.percentage.toStringAsFixed(1),
        ),
        fallback,
      );
    } else {
      return _tryL10n(
            () => l10n.protrusionDescription(
          zoneName,
          anomaly.clockPosition,
          anomaly.percentage.toStringAsFixed(1),
        ),
        fallback,
      );
    }
  }

  /// Get localized organ association for a ZoneAnomaly
  String getZoneAnomalyOrganAssociation(ZoneAnomaly anomaly, bool isRightEye) {
    if (anomaly.anomalyType == AnomalyType.flattening) {
      return getFlatteningDescription(anomaly.zone, isRightEye);
    } else {
      return getProtrusionDescription(anomaly.zone, isRightEye);
    }
  }

  /// Get localized severity label for a ZoneAnomaly
  String getZoneAnomalySeverity(ZoneAnomaly anomaly) {
    return getSignificanceLabel(anomaly.significance);
  }

  // ============================================================================
  // COMPLETE RESULT LOCALIZATION
  // ============================================================================

  /// Create a fully localized version of EyeAnalysisResult descriptions
  LocalizedEyeAnalysis localizeEyeAnalysis(EyeAnalysisResult result, bool isRightEye) {
    return LocalizedEyeAnalysis(
      pupilFormTypeName: getFormTypeName(result.pupilFormType),
      pupilFormDescription: getPupilFormDescription(result.pupilFormType),
      decentrationPatternName: result.decentrationAssessment != null
          ? getPatternName(result.decentrationAssessment!.pattern)
          : getPatternName(DecentrationPattern.centered),
      decentrationDescription: result.decentrationAssessment != null
          ? getDecentrationDescription(result.decentrationAssessment!.pattern, isRightEye)
          : getDecentrationDescription(DecentrationPattern.centered, isRightEye),
      decentrationClinicalNote: result.decentrationAssessment != null
          ? getDecentrationClinicalNote(result.decentrationAssessment!)
          : _tryL10n(() => l10n.decentrationWithinLimits, 'Within normal limits.'),
      flattenings: result.flattenings.map((f) => LocalizedZoneAnomaly(
        zone: getZoneName(f.zone),
        severity: getSignificanceLabel(f.significance),
        percentage: f.percentage,
        organAssociation: getFlatteningDescription(f.zone, isRightEye),
        clockPosition: f.clockPosition,
        description: getZoneAnomalyDescription(f, isRightEye),
      )).toList(),
      protrusions: result.protrusions.map((p) => LocalizedZoneAnomaly(
        zone: getZoneName(p.zone),
        severity: getSignificanceLabel(p.significance),
        percentage: p.percentage,
        organAssociation: getProtrusionDescription(p.zone, isRightEye),
        clockPosition: p.clockPosition,
        description: getZoneAnomalyDescription(p, isRightEye),
      )).toList(),
    );
  }

  // ============================================================================
  // HELPER: Safe l10n access with fallback
  // ============================================================================

  /// Try to get localized string, fall back to English from ClinicalConstants
  String _tryL10n(String Function() l10nGetter, String fallback) {
    try {
      return l10nGetter();
    } catch (_) {
      return fallback;
    }
  }
}

// ============================================================================
// LOCALIZED DATA CLASSES
// ============================================================================

/// Localized version of eye analysis for display
class LocalizedEyeAnalysis {
  final String pupilFormTypeName;
  final String pupilFormDescription;
  final String decentrationPatternName;
  final String decentrationDescription;
  final String decentrationClinicalNote;
  final List<LocalizedZoneAnomaly> flattenings;
  final List<LocalizedZoneAnomaly> protrusions;

  LocalizedEyeAnalysis({
    required this.pupilFormTypeName,
    required this.pupilFormDescription,
    required this.decentrationPatternName,
    required this.decentrationDescription,
    required this.decentrationClinicalNote,
    required this.flattenings,
    required this.protrusions,
  });
}

/// Localized version of zone anomaly for display
class LocalizedZoneAnomaly {
  final String zone;
  final String severity;
  final double percentage;
  final String organAssociation;
  final String clockPosition;
  final String description;

  LocalizedZoneAnomaly({
    required this.zone,
    required this.severity,
    required this.percentage,
    required this.organAssociation,
    required this.clockPosition,
    required this.description,
  });
}