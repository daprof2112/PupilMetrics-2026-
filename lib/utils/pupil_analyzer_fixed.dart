// lib/utils/pupil_analyzer_fixed.dart
// PUPIL ANALYZER v5.3.0 - WITH BEXEL-COMPATIBLE ANW ASSESSMENT
// Based on Dr. Bryan K. Marcia's 2004 CNRI Reference Charts
//
// v5.3.0 CHANGES:
// 1. Added full ANW (Collarette) assessment matching Bexel methodology
// 2. Separate detection of SHIFTS (drawing out) vs CONSTRICTIONS (drawing in)
// 3. Velhover clinical correlations for shifts
// 4. Bexel-compatible ratio calculation: (ANW_r - Pupil_r) / (Iris_r - Pupil_r)
// 5. Zone-specific constriction detection (frontal, basal)
//
// SECTION 1 OF 5: Imports, Enumerations, Thresholds, Basic Data Classes

import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:ai_eye_capture/models/patient_info.dart';

// ============================================================================
// VALIDATION CONFIG (unchanged)
// ============================================================================
class ValidationConfig {
  static const bool checkAspectRatio = false;
  static const bool checkHasCircle = true;
  static const bool checkHasDarkCenter = true;
  static const bool checkHasTexture = true;
  static const bool checkConcentricCircles = true;
  static const bool checkColorDistribution = false;
  static const bool checkEdgeDensity = false;
  static const double minPassRatio = 0.8;
}

// ============================================================================
// EXISTING ENUMERATIONS (unchanged)
// ============================================================================

enum AnisocoriaSeverity { none, mild, moderate, severe }
enum PupilSizeStatus { normal, belowNormal, aboveNormal }

enum PupilFormType {
  circle, oval, ovalVertical, ovalHorizontal, ovalDiagonal,
  ellipse, leftObliqueEllipse, unilateralEllipse,
  ventralDivergingEllipse, frontalDivergingEllipse, chord, irregular
}

enum AnomalyType { flattening, protrusion }
enum FindingSignificance { withinLimits, mild, moderate, significant }

enum DecentrationPattern {
  centered, frontal, basal, nasal, temporal,
  middleNasal, middleTemporal, upperNasal, upperTemporal,
  lowerNasal, lowerTemporal, upwards, downwards,
  upwardsInwards, upwardsOutwards
}

// ============================================================================
// UPDATE v5.3.0: NEW ANW ENUMERATIONS
// ============================================================================

/// ANW Form Types - matches Bexel's 4 detected forms
enum ANWFormType {
  regular,      // Normal, balanced collarette
  drawnIn,      // Constricted toward pupil (parasympathetic dominance)
  indented,     // Local/sectoral indentations
  lacerated,    // Irregular/torn appearance (like zigzag)
}

/// ANW Ratio Classification - Bexel thresholds
enum ANWRatioStatus {
  spastic,      // <25% - Parasympathotonic
  normal,       // 25-35% - Balanced ANS
  atonic,       // >35% - Sympathotonic
}

/// Zone status for constriction detection
enum ZoneConstrictionStatus {
  normal,
  constricted,  // Drawing IN
  expanded,     // Drawing OUT (rare, usually detected as shift)
}

// ============================================================================
// CLINICAL THRESHOLDS (unchanged + new ANW thresholds)
// ============================================================================

class ClinicalThresholds {
  // Existing thresholds
  static const double minReportable = 1.5;
  static const double withinLimitsMax = 3.0;
  static const double mildMax = 6.0;
  static const double moderateMax = 10.0;
  static const double significantMax = 15.0;
  static const double decentrationNormal = 5.0;
  static const double ellipsenessNormal = 95.0;
  static const double deformationNormal = 5.0;

  // UPDATE v5.3.0: ANW thresholds (Bexel-compatible)
  static const double anwSpasticThreshold = 25.0;    // Below = Spastic
  static const double anwAtonicThreshold = 35.0;     // Above = Atonic
  static const double anwAsymmetryNormal = 5.0;      // 0-5% is normal
  static const double anwShiftThreshold = 8.0;       // % deviation for shift detection
  static const double anwConstrictionThreshold = 8.0; // % deviation for constriction

  static FindingSignificance getSignificance(double pct) {
    if (pct < withinLimitsMax) return FindingSignificance.withinLimits;
    if (pct < mildMax) return FindingSignificance.mild;
    if (pct < moderateMax) return FindingSignificance.moderate;
    return FindingSignificance.significant;
  }

  static String getSignificanceLabel(FindingSignificance s) {
    switch (s) {
      case FindingSignificance.withinLimits: return 'within acceptable limits';
      case FindingSignificance.mild: return 'mild';
      case FindingSignificance.moderate: return 'moderate';
      case FindingSignificance.significant: return 'significant';
    }
  }
}

// ============================================================================
// BASIC DATA CLASSES (unchanged)
// ============================================================================

class ZoneAnomaly {
  final String zone;
  final String severity;
  final double percentage;
  final String organAssociation;
  final String clockPosition;
  final AnomalyType anomalyType;
  final FindingSignificance significance;
  final String description;

  ZoneAnomaly({
    required this.zone, required this.severity, required this.percentage,
    required this.organAssociation, this.clockPosition = '',
    this.anomalyType = AnomalyType.flattening,
    this.significance = FindingSignificance.mild, this.description = ''
  });

  double get deviation => percentage;
  bool get showFullDescription => significance != FindingSignificance.withinLimits;

  Map<String, dynamic> toJson() => {
    'zone': zone, 'severity': severity, 'percentage': percentage,
    'organAssociation': organAssociation, 'clockPosition': clockPosition,
    'anomalyType': anomalyType.name, 'significance': significance.name, 'description': description
  };

  factory ZoneAnomaly.fromJson(Map<String, dynamic> j) => ZoneAnomaly(
      zone: j['zone'] ?? '', severity: j['severity'] ?? 'mild',
      percentage: (j['percentage'] ?? 0).toDouble(),
      organAssociation: j['organAssociation'] ?? '', clockPosition: j['clockPosition'] ?? '',
      anomalyType: j['anomalyType'] == 'protrusion' ? AnomalyType.protrusion : AnomalyType.flattening,
      significance: FindingSignificance.values.firstWhere((s) => s.name == j['significance'], orElse: () => FindingSignificance.mild),
      description: j['description'] ?? ''
  );
}

// ============================================================================
// END OF SECTION 1 - Continue to Section 2 for Assessment Classes
// ============================================================================
// ============================================================================
// DECENTRATION ASSESSMENT
// ============================================================================

// ============================================================================
// SECTION 2 OF 5: ASSESSMENT CLASSES
// ============================================================================

// ============================================================================
// DECENTRATION ASSESSMENT (unchanged)
// ============================================================================

class DecentrationAssessment {
  final double rawOffsetPercent;
  final double rawOffsetAngle;
  final double correctedOffsetPercent;
  final DecentrationPattern pattern;
  final String patternName;
  final String organAssociation;
  final bool isPathological;
  final String clinicalNote;
  final String description;

  DecentrationAssessment({
    required this.rawOffsetPercent, required this.rawOffsetAngle,
    required this.correctedOffsetPercent, required this.pattern,
    required this.patternName, required this.organAssociation,
    required this.isPathological, required this.clinicalNote, this.description = ''
  });

  Map<String, dynamic> toJson() => {
    'rawOffsetPercent': rawOffsetPercent, 'rawOffsetAngle': rawOffsetAngle,
    'correctedOffsetPercent': correctedOffsetPercent, 'pattern': pattern.name,
    'patternName': patternName, 'organAssociation': organAssociation,
    'isPathological': isPathological, 'clinicalNote': clinicalNote, 'description': description
  };

  factory DecentrationAssessment.fromJson(Map<String, dynamic> j) => DecentrationAssessment(
      rawOffsetPercent: (j['rawOffsetPercent'] ?? 0).toDouble(),
      rawOffsetAngle: (j['rawOffsetAngle'] ?? 0).toDouble(),
      correctedOffsetPercent: (j['correctedOffsetPercent'] ?? 0).toDouble(),
      pattern: DecentrationPattern.values.firstWhere((p) => p.name == j['pattern'], orElse: () => DecentrationPattern.centered),
      patternName: j['patternName'] ?? 'Centered', organAssociation: j['organAssociation'] ?? '',
      isPathological: j['isPathological'] ?? false, clinicalNote: j['clinicalNote'] ?? '', description: j['description'] ?? ''
  );
}

// ============================================================================
// ELLIPSE ASSESSMENT (unchanged)
// ============================================================================

class EllipseAssessment {
  final double ellipseness;
  final double orientationAngle;
  final PupilFormType formType;
  final String formTypeName;
  final String organAssociation;
  final bool isPathological;
  final String description;

  EllipseAssessment({
    required this.ellipseness, required this.orientationAngle,
    required this.formType, required this.formTypeName,
    required this.organAssociation, required this.isPathological, this.description = ''
  });

  Map<String, dynamic> toJson() => {
    'ellipseness': ellipseness, 'orientationAngle': orientationAngle,
    'formType': formType.name, 'formTypeName': formTypeName,
    'organAssociation': organAssociation, 'isPathological': isPathological, 'description': description
  };
}

// ============================================================================
// UPDATE v5.3.0: ANW SHIFT CLASS (Drawing Out - Protrusion)
// ============================================================================

class ANWShift {
  final String zoneName;           // e.g., "Middle-temporal"
  final String clockPosition;      // e.g., "8:00 - 10:00"
  final double deviationPercent;   // How much it protrudes outward
  final String clinicalAssociation;

  ANWShift({
    required this.zoneName, required this.clockPosition,
    required this.deviationPercent, required this.clinicalAssociation,
  });

  String toBexelString(bool isRightEye) {
    String eye = isRightEye ? 'D' : 'S';
    return '$eye: $zoneName shift.';
  }

  Map<String, dynamic> toJson() => {
    'zoneName': zoneName, 'clockPosition': clockPosition,
    'deviationPercent': deviationPercent, 'clinicalAssociation': clinicalAssociation,
  };

  factory ANWShift.fromJson(Map<String, dynamic> j) => ANWShift(
    zoneName: j['zoneName'] ?? '', clockPosition: j['clockPosition'] ?? '',
    deviationPercent: (j['deviationPercent'] ?? 0).toDouble(),
    clinicalAssociation: j['clinicalAssociation'] ?? '',
  );
}

// ============================================================================
// UPDATE v5.3.0: ANW ZONE CONSTRICTION CLASS (Drawing In - Narrowing)
// ============================================================================

class ANWZoneConstriction {
  final String zoneName;           // e.g., "Frontal", "Basal"
  final String clockPosition;
  final double deviationPercent;   // Negative value (inward)

  ANWZoneConstriction({
    required this.zoneName, required this.clockPosition, required this.deviationPercent,
  });

  Map<String, dynamic> toJson() => {
    'zoneName': zoneName, 'clockPosition': clockPosition, 'deviationPercent': deviationPercent,
  };

  factory ANWZoneConstriction.fromJson(Map<String, dynamic> j) => ANWZoneConstriction(
    zoneName: j['zoneName'] ?? '', clockPosition: j['clockPosition'] ?? '',
    deviationPercent: (j['deviationPercent'] ?? 0).toDouble(),
  );
}

// ============================================================================
// UPDATE v5.3.0: COMPLETE ANW ASSESSMENT (Bexel-Compatible)
// ============================================================================

class ANWAssessment {
  // Core Bexel metrics
  final double diameterPx;
  final double perimeterPx;
  final double ratio;                    // 25-35% normal (Bexel calculation)
  final ANWRatioStatus ratioStatus;
  final double asymmetryPercent;         // 0-5% normal
  final bool isAsymmetryNormal;
  final ANWFormType formType;
  final String formTypeName;
  final bool isFormNormal;

  // SHIFTS (Drawing Out) - protrusions
  final ANWShift? primaryShift;
  final List<ANWShift> allShifts;

  // CONSTRICTIONS (Drawing In) - narrowings
  final bool frontalConstricted;
  final bool basalConstricted;
  final bool temporalConstricted;
  final bool nasalConstricted;
  final List<ANWZoneConstriction> constrictions;

  // Tonic state (Bexel interpretation)
  final String? tonicState;              // "Parasympathotonic" or "Sympathotonic"
  final String tonicStateDescription;

  // Bexel-style output strings
  final List<String> bexelFindings;

  ANWAssessment({
    required this.diameterPx, required this.perimeterPx,
    required this.ratio, required this.ratioStatus,
    required this.asymmetryPercent, required this.isAsymmetryNormal,
    required this.formType, required this.formTypeName, required this.isFormNormal,
    this.primaryShift, required this.allShifts,
    required this.frontalConstricted, required this.basalConstricted,
    required this.temporalConstricted, required this.nasalConstricted,
    required this.constrictions,
    this.tonicState, required this.tonicStateDescription,
    required this.bexelFindings,
  });

  bool get isRatioNormal => ratioStatus == ANWRatioStatus.normal;
  bool get hasShift => primaryShift != null;
  bool get hasConstrictions => frontalConstricted || basalConstricted;
  bool get isOverallNormal => isRatioNormal && isAsymmetryNormal && isFormNormal;

  String get ratioStatusLabel {
    switch (ratioStatus) {
      case ANWRatioStatus.spastic: return 'Spastic';
      case ANWRatioStatus.normal: return 'Normal';
      case ANWRatioStatus.atonic: return 'Atonic';
    }
  }

  String get constrictionString {
    if (frontalConstricted && basalConstricted) {
      return 'Frontal and basal zones of pupillary belt are constricted.';
    } else if (frontalConstricted) {
      return 'Frontal zone of pupillary belt is constricted.';
    } else if (basalConstricted) {
      return 'Basal zone of pupillary belt is constricted.';
    }
    return '';
  }

  Map<String, dynamic> toJson() => {
    'diameterPx': diameterPx, 'perimeterPx': perimeterPx,
    'ratio': ratio, 'ratioStatus': ratioStatus.name, 'ratioStatusLabel': ratioStatusLabel,
    'asymmetryPercent': asymmetryPercent, 'isAsymmetryNormal': isAsymmetryNormal,
    'formType': formType.name, 'formTypeName': formTypeName, 'isFormNormal': isFormNormal,
    'primaryShift': primaryShift?.toJson(), 'allShifts': allShifts.map((s) => s.toJson()).toList(),
    'frontalConstricted': frontalConstricted, 'basalConstricted': basalConstricted,
    'temporalConstricted': temporalConstricted, 'nasalConstricted': nasalConstricted,
    'constrictions': constrictions.map((c) => c.toJson()).toList(),
    'tonicState': tonicState, 'tonicStateDescription': tonicStateDescription,
    'bexelFindings': bexelFindings, 'isOverallNormal': isOverallNormal,
  };

  factory ANWAssessment.fromJson(Map<String, dynamic> j) => ANWAssessment(
    diameterPx: (j['diameterPx'] ?? 0).toDouble(),
    perimeterPx: (j['perimeterPx'] ?? 0).toDouble(),
    ratio: (j['ratio'] ?? 30).toDouble(),
    ratioStatus: ANWRatioStatus.values.firstWhere((s) => s.name == j['ratioStatus'], orElse: () => ANWRatioStatus.normal),
    asymmetryPercent: (j['asymmetryPercent'] ?? 0).toDouble(),
    isAsymmetryNormal: j['isAsymmetryNormal'] ?? true,
    formType: ANWFormType.values.firstWhere((f) => f.name == j['formType'], orElse: () => ANWFormType.regular),
    formTypeName: j['formTypeName'] ?? 'Regular',
    isFormNormal: j['isFormNormal'] ?? true,
    primaryShift: j['primaryShift'] != null ? ANWShift.fromJson(j['primaryShift']) : null,
    allShifts: (j['allShifts'] as List?)?.map((s) => ANWShift.fromJson(s)).toList() ?? [],
    frontalConstricted: j['frontalConstricted'] ?? false,
    basalConstricted: j['basalConstricted'] ?? false,
    temporalConstricted: j['temporalConstricted'] ?? false,
    nasalConstricted: j['nasalConstricted'] ?? false,
    constrictions: (j['constrictions'] as List?)?.map((c) => ANWZoneConstriction.fromJson(c)).toList() ?? [],
    tonicState: j['tonicState'],
    tonicStateDescription: j['tonicStateDescription'] ?? '',
    bexelFindings: List<String>.from(j['bexelFindings'] ?? []),
  );
}

// ============================================================================
// EYE ANALYSIS RESULT - UPDATED v5.3.0 with ANWAssessment
// ============================================================================

class EyeAnalysisResult {
  final double pupilDiameterPx;
  final double irisDiameterPx;
  final double pupilIrisRatio;
  final double ellipseness;
  final double pupilBorderDeformation;
  final double decentralization;
  final double decentralizationAngle;
  final String decentralizationZone;
  final double? anwRatio;              // Keep for backward compatibility
  final ANWAssessment? anwAssessment;  // UPDATE v5.3.0: Full ANW assessment
  final double confidence;
  final String qualityGrade;
  final PupilFormType pupilFormType;
  final String pupilFormTypeName;
  final bool isDeformationSignificant;
  final double circularityScore;
  final List<ZoneAnomaly> flattenings;
  final List<ZoneAnomaly> protrusions;
  final DecentrationAssessment? decentrationAssessment;
  final EllipseAssessment? ellipseAssessment;

  EyeAnalysisResult({
    required this.pupilDiameterPx, required this.irisDiameterPx,
    required this.pupilIrisRatio, required this.ellipseness,
    required this.pupilBorderDeformation, required this.decentralization,
    required this.decentralizationAngle, required this.decentralizationZone,
    this.anwRatio, this.anwAssessment,
    required this.confidence, required this.qualityGrade,
    required this.pupilFormType, required this.pupilFormTypeName,
    required this.isDeformationSignificant, required this.circularityScore,
    required this.flattenings, required this.protrusions,
    this.decentrationAssessment, this.ellipseAssessment
  });

  String get grade => qualityGrade;
  double get circularity => circularityScore;
  double get decentration => decentralization;
  String get decentrationPatternName => decentrationAssessment?.patternName ?? 'Centered';
  bool get hasDecentrationPattern => decentrationAssessment != null && decentrationAssessment!.pattern != DecentrationPattern.centered;
  String get pupilFormDescription => ellipseAssessment?.formTypeName ?? 'Circle (Normal)';
  bool get hasPupilFormAnomaly => ellipseAssessment != null && ellipseAssessment!.formType != PupilFormType.circle;

  Map<String, dynamic> toJson() => {
    'pupilDiameterPx': pupilDiameterPx, 'irisDiameterPx': irisDiameterPx,
    'pupilIrisRatio': pupilIrisRatio, 'ellipseness': ellipseness,
    'pupilBorderDeformation': pupilBorderDeformation,
    'decentralization': decentralization, 'decentration': decentralization,
    'decentralizationAngle': decentralizationAngle, 'decentralizationZone': decentralizationZone,
    'circularityScore': circularityScore, 'circularity': circularityScore,
    'pupilFormType': pupilFormType.name, 'pupilFormTypeName': pupilFormTypeName,
    'decentrationPatternName': decentrationPatternName, 'hasDecentrationPattern': hasDecentrationPattern,
    'pupilFormDescription': pupilFormDescription, 'hasPupilFormAnomaly': hasPupilFormAnomaly,
    'flattenings': flattenings.map((f) => f.toJson()).toList(),
    'protrusions': protrusions.map((p) => p.toJson()).toList(),
    'decentrationAssessment': decentrationAssessment?.toJson(),
    'ellipseAssessment': ellipseAssessment?.toJson(),
    'anwRatio': anwRatio, 'anwAssessment': anwAssessment?.toJson(),
    'confidence': confidence, 'qualityGrade': qualityGrade, 'grade': qualityGrade,
    'isDeformationSignificant': isDeformationSignificant,
  };

  factory EyeAnalysisResult.fromJson(Map<String, dynamic> j) => EyeAnalysisResult(
      pupilDiameterPx: (j['pupilDiameterPx'] ?? 0).toDouble(),
      irisDiameterPx: (j['irisDiameterPx'] ?? 0).toDouble(),
      pupilIrisRatio: (j['pupilIrisRatio'] ?? 0).toDouble(),
      ellipseness: (j['ellipseness'] ?? 100).toDouble(),
      pupilBorderDeformation: (j['pupilBorderDeformation'] ?? 0).toDouble(),
      decentralization: (j['decentralization'] ?? j['decentration'] ?? 0).toDouble(),
      decentralizationAngle: (j['decentralizationAngle'] ?? 0).toDouble(),
      decentralizationZone: j['decentralizationZone'] ?? '',
      anwRatio: j['anwRatio']?.toDouble(),
      anwAssessment: j['anwAssessment'] != null ? ANWAssessment.fromJson(j['anwAssessment']) : null,
      confidence: (j['confidence'] ?? 0.5).toDouble(),
      qualityGrade: j['qualityGrade'] ?? j['grade'] ?? 'C',
      pupilFormType: PupilFormType.values.firstWhere((t) => t.name == j['pupilFormType'], orElse: () => PupilFormType.circle),
      pupilFormTypeName: j['pupilFormTypeName'] ?? 'Circle',
      isDeformationSignificant: j['isDeformationSignificant'] ?? false,
      circularityScore: (j['circularityScore'] ?? j['circularity'] ?? 95).toDouble(),
      flattenings: (j['flattenings'] as List?)?.map((f) => ZoneAnomaly.fromJson(f)).toList() ?? [],
      protrusions: (j['protrusions'] as List?)?.map((p) => ZoneAnomaly.fromJson(p)).toList() ?? [],
      decentrationAssessment: j['decentrationAssessment'] != null ? DecentrationAssessment.fromJson(j['decentrationAssessment']) : null,
      ellipseAssessment: j['ellipseAssessment'] != null ? EllipseAssessment(
          ellipseness: (j['ellipseAssessment']['ellipseness'] ?? 100).toDouble(),
          orientationAngle: (j['ellipseAssessment']['orientationAngle'] ?? 0).toDouble(),
          formType: PupilFormType.values.firstWhere((t) => t.name == j['ellipseAssessment']['formType'], orElse: () => PupilFormType.circle),
          formTypeName: j['ellipseAssessment']['formTypeName'] ?? 'Circle',
          organAssociation: j['ellipseAssessment']['organAssociation'] ?? '',
          isPathological: j['ellipseAssessment']['isPathological'] ?? false
      ) : null
  );
}

// ============================================================================
// ANISOCORIA & AGE NORM ASSESSMENTS (unchanged)
// ============================================================================

class AnisocoriaAssessment {
  final double absoluteDifference;
  final double relativeDifference;
  final String largerPupil;
  final AnisocoriaSeverity severity;
  final String clinicalNote;
  final bool isTBIIndicator;
  final double leftPupilRatio;
  final double rightPupilRatio;
  final double leftPupilDiameterPx;
  final double rightPupilDiameterPx;

  AnisocoriaAssessment({
    required this.absoluteDifference, required this.relativeDifference,
    required this.largerPupil, required this.severity, required this.clinicalNote,
    required this.isTBIIndicator, required this.leftPupilRatio, required this.rightPupilRatio,
    required this.leftPupilDiameterPx, required this.rightPupilDiameterPx
  });

  double get odRatio => rightPupilRatio;
  double get osRatio => leftPupilRatio;
  double get difference => relativeDifference;

  Map<String, dynamic> toJson() => {
    'absoluteDiff': absoluteDifference, 'relativeDiff': relativeDifference,
    'largerPupil': largerPupil, 'severity': severity.name, 'clinicalNote': clinicalNote,
    'tbi': isTBIIndicator, 'leftRatio': leftPupilRatio, 'rightRatio': rightPupilRatio,
    'osRatio': leftPupilRatio, 'odRatio': rightPupilRatio,
    'leftPupilDiameterPx': leftPupilDiameterPx, 'rightPupilDiameterPx': rightPupilDiameterPx
  };

  factory AnisocoriaAssessment.fromJson(Map<String, dynamic> j) => AnisocoriaAssessment(
      absoluteDifference: (j['absoluteDiff'] ?? j['absoluteDifference'] ?? 0).toDouble(),
      relativeDifference: (j['relativeDiff'] ?? j['relativeDifference'] ?? 0).toDouble(),
      largerPupil: j['largerPupil'] ?? 'equal',
      severity: AnisocoriaSeverity.values.firstWhere((s) => s.name == j['severity'], orElse: () => AnisocoriaSeverity.none),
      clinicalNote: j['clinicalNote'] ?? '', isTBIIndicator: j['tbi'] ?? j['isTBIIndicator'] ?? false,
      leftPupilRatio: (j['leftRatio'] ?? j['osRatio'] ?? 0).toDouble(),
      rightPupilRatio: (j['rightRatio'] ?? j['odRatio'] ?? 0).toDouble(),
      leftPupilDiameterPx: (j['leftPupilDiameterPx'] ?? 0).toDouble(),
      rightPupilDiameterPx: (j['rightPupilDiameterPx'] ?? 0).toDouble()
  );
}

class AgeNormAssessment {
  final int patientAge;
  final double expectedDiameter;
  final String expectedRange;
  final double measuredDiameter;
  final double percentDeviation;
  final PupilSizeStatus status;
  final String interpretation;
  final String ageGroup;
  final String normalRatioRange;

  AgeNormAssessment({
    required this.patientAge, required this.expectedDiameter, required this.expectedRange,
    required this.measuredDiameter, required this.percentDeviation, required this.status,
    required this.interpretation, required this.ageGroup, required this.normalRatioRange
  });
}

// ============================================================================
// END OF SECTION 2 - Continue to Section 3 for Zone Associations
// ============================================================================
// pupil_analyzer_fixed.dart v5.2.1 - PART 3 OF 5
// ZONE ASSOCIATIONS - RESEARCH/EDUCATIONAL VERSION
// All diagnostic terms removed, replaced with historical research observations
// ============================================================================

// ============================================================================
// SECTION 3 OF 5: ZONE ASSOCIATIONS (Unchanged from v5.2.1)
// This section contains clinical associations for pupil findings
// ============================================================================

class ZoneAssociations {

  static String getPupilFormAssociation(PupilFormType t) {
    switch (t) {
      case PupilFormType.circle:
        return 'Normal circular pupil form. No pattern variations detected.';
      case PupilFormType.ovalHorizontal:
        return 'Horizontal oval pattern. Historical research associated this with autonomic nervous system patterns affecting respiratory and glandular function zones.';
      case PupilFormType.ovalVertical:
        return 'Vertical oval pattern. Historical research linked this pattern to cerebral circulation zones in autonomic reflex studies.';
      case PupilFormType.ovalDiagonal:
        return 'Diagonal oval pattern. Research literature associated this with urogenital zone reflexes in autonomic studies.';
      case PupilFormType.leftObliqueEllipse:
        return 'Left oblique ellipse pattern. Historical observations linked this to urogenital and lower extremity autonomic zones.';
      case PupilFormType.unilateralEllipse:
        return 'Unilateral ellipse pattern. Research indicated associations with respiratory and bronchial autonomic zones.';
      case PupilFormType.ventralDivergingEllipse:
        return 'Ventral diverging ellipse. Historical studies associated this with lower body autonomic zones and motor function patterns.';
      case PupilFormType.frontalDivergingEllipse:
        return 'Frontal diverging ellipse. Research literature linked this pattern to cerebral and upper autonomic zones.';
      case PupilFormType.oval:
        return 'Mild oval deformation pattern. Monitor for progression in research observations.';
      case PupilFormType.ellipse:
        return 'Elliptical pupil pattern indicating autonomic system variations in historical studies.';
      case PupilFormType.chord:
        return 'Chord-like deformation pattern indicating localized autonomic influences in research literature.';
      case PupilFormType.irregular:
        return 'Irregular form suggesting multiple autonomic pattern influences based on historical observations.';
    }
  }

  static String getDecentrationAssociation(DecentrationPattern p, bool isRightEye) {
    switch (p) {
      case DecentrationPattern.centered:
        return 'Normal pupil positioning within physiological limits.';
      case DecentrationPattern.nasal:
        return isRightEye
            ? 'Nasal pattern (Right). Historical research associated this zone with pulmonary autonomic reflexes.'
            : 'Nasal pattern (Left). Research literature linked this zone to cardiac autonomic function patterns.';
      case DecentrationPattern.temporal:
        return 'Temporal pattern. Historical observations associated this zone with renal and reproductive autonomic reflexes.';
      case DecentrationPattern.frontal:
      case DecentrationPattern.upwards:
        return isRightEye
            ? 'Frontal pattern (Right). Research associated this zone with cognitive and cerebral function patterns.'
            : 'Frontal pattern (Left). Historical studies linked this zone to cerebral autonomic patterns.';
      case DecentrationPattern.basal:
      case DecentrationPattern.downwards:
        return isRightEye
            ? 'Basal pattern (Right). Research indicated associations with intracranial pressure reflexes.'
            : 'Basal pattern (Left). Historical observations linked this to cerebral inflammatory zone patterns.';
      case DecentrationPattern.upwardsInwards:
        return isRightEye
            ? 'Upper-nasal pattern (Right). Research associated this zone with hepatobiliary autonomic reflexes.'
            : 'Upper-nasal pattern (Left). Historical studies linked this to splenic and diaphragmatic zones.';
      case DecentrationPattern.upwardsOutwards:
        return 'Upper-temporal pattern. Research indicated associations with renal and reproductive autonomic zones.';
      case DecentrationPattern.middleNasal:
        return isRightEye
            ? 'Middle-nasal pattern (Right). Historical observations linked this to oxygen utilization and cardiac zones.'
            : 'Middle-nasal pattern (Left). Research associated this with neurological and cardiac autonomic patterns.';
      case DecentrationPattern.middleTemporal:
        return isRightEye
            ? 'Middle-temporal pattern (Right). Research linked this to cardiac autonomic regulation zones.'
            : 'Middle-temporal pattern (Left). Historical studies associated this with pulmonary and cardiac zones.';
      case DecentrationPattern.upperNasal:
        return isRightEye
            ? 'Upper-nasal pattern (Right). Research indicated associations with cognitive zones and cervical spine reflexes.'
            : 'Upper-nasal pattern (Left). Historical observations linked this to cognitive patterns and cervical zones.';
      case DecentrationPattern.upperTemporal:
        return isRightEye
            ? 'Upper-temporal pattern (Right). Research associated this zone with cranial nerve and auditory reflexes.'
            : 'Upper-temporal pattern (Left). Historical studies linked this to neurovegetative and speech zones.';
      case DecentrationPattern.lowerNasal:
        return 'Lower-nasal pattern. Research indicated associations with urogenital and lumbosacral autonomic zones.';
      case DecentrationPattern.lowerTemporal:
        return isRightEye
            ? 'Lower-temporal pattern (Right). Historical observations associated this with metabolic and hepatic zones.'
            : 'Lower-temporal pattern (Left). Research linked this to cardiac and splenic autonomic patterns.';
    }
  }

  static String getFlatteningAssociation(String zone, bool isRightEye) {
    final z = zone.toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');
    if (isRightEye) {
      switch (z) {
        case 'upper-central': case 'frontal': return 'Pattern associated with upper-central zone. Historical research linked this to mood regulation and energy autonomic reflexes.';
        case 'upper-temporal': return 'Pattern associated with upper-temporal zone. Research indicated associations with cranial nerve and auditory autonomic reflexes.';
        case 'middle-temporal': return 'Pattern associated with middle-temporal zone. Historical observations linked this to respiratory and cardiac autonomic patterns.';
        case 'lower-temporal': return 'Pattern associated with lower-temporal zone. Research literature associated this with hepatic and metabolic autonomic zones.';
        case 'lower-basal': case 'basal': return 'Pattern associated with lower-basal zone. Historical studies linked this to renal and lower extremity autonomic reflexes.';
        case 'lower-nasal': return 'Pattern associated with lower-nasal zone. Research indicated associations with urogenital and pelvic autonomic zones.';
        case 'middle-nasal': return 'Pattern associated with middle-nasal zone. Historical observations linked this to oxygen utilization and respiratory autonomic patterns.';
        case 'upper-nasal': return 'Pattern associated with upper-nasal zone. Research literature associated this with cognitive and cervical autonomic reflexes.';
        default: return 'Autonomic nervous system pattern variation detected in this zone based on historical research.';
      }
    } else {
      switch (z) {
        case 'upper-central': case 'frontal': return 'Pattern associated with upper-central zone. Historical research linked this to mood regulation and neurological autonomic patterns.';
        case 'upper-temporal': return 'Pattern associated with upper-temporal zone. Research indicated associations with neurovegetative and speech autonomic zones.';
        case 'middle-temporal': return 'Pattern associated with middle-temporal zone. Historical observations linked this to pulmonary and cardiac autonomic reflexes.';
        case 'lower-temporal': return 'Pattern associated with lower-temporal zone. Research literature associated this with cardiac and splenic autonomic patterns.';
        case 'lower-basal': case 'basal': return 'Pattern associated with lower-basal zone. Historical studies linked this to renal and eliminative autonomic zones.';
        case 'lower-nasal': return 'Pattern associated with lower-nasal zone. Research indicated associations with urogenital and lumbosacral autonomic reflexes.';
        case 'middle-nasal': return 'Pattern associated with middle-nasal zone. Historical observations linked this to cardiac and respiratory autonomic patterns.';
        case 'upper-nasal': return 'Pattern associated with upper-nasal zone. Research literature associated this with cognitive and cervical autonomic zones.';
        default: return 'Autonomic nervous system pattern variation detected in this zone based on historical research.';
      }
    }
  }

  static String getProtrusionAssociation(String zone, bool isRightEye) {
    final z = zone.toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');
    if (isRightEye) {
      switch (z) {
        case 'upper-central': case 'frontal': return 'Upper-central zone protrusion pattern. Research associated this with sympathetic hyperarousal patterns affecting cerebral zones.';
        case 'middle-temporal': return 'Middle-temporal zone protrusion pattern. Research indicated associations with cardiac and respiratory sympathetic patterns.';
        case 'lower-temporal': return 'Lower-temporal zone protrusion pattern. Historical studies linked this to hepatobiliary and metabolic sympathetic zones.';
        case 'lower-basal': case 'basal': return 'Lower-basal zone protrusion pattern. Research associated this with renal and pelvic sympathetic hyperactivity patterns.';
        case 'lower-nasal': return 'Lower-nasal zone protrusion pattern. Historical observations linked this to urogenital sympathetic activation zones.';
        default: return 'Sympathetic nervous system hyperactivity pattern detected in this zone based on research observations.';
      }
    } else {
      switch (z) {
        case 'upper-central': case 'frontal': return 'Upper-central zone protrusion pattern. Research associated this with psychomotor and cerebral sympathetic patterns.';
        case 'middle-temporal': return 'Middle-temporal zone protrusion pattern. Research indicated associations with pulmonary and cardiac sympathetic patterns.';
        case 'lower-temporal': return 'Lower-temporal zone protrusion pattern. Historical studies linked this to splenic and cardiac sympathetic activation zones.';
        case 'lower-basal': case 'basal': return 'Lower-basal zone protrusion pattern. Research associated this with pelvic and renal sympathetic hyperactivity patterns.';
        default: return 'Sympathetic nervous system hyperactivity pattern detected in this zone based on research observations.';
      }
    }
  }

  static String getPatternName(DecentrationPattern p) {
    switch (p) {
      case DecentrationPattern.centered: return 'Centered (Normal)';
      case DecentrationPattern.frontal: return 'Frontal decentralization';
      case DecentrationPattern.basal: return 'Basal decentralization';
      case DecentrationPattern.nasal: return 'Nasal decentralization';
      case DecentrationPattern.temporal: return 'Temporal decentralization';
      case DecentrationPattern.middleNasal: return 'Middle-nasal decentralization';
      case DecentrationPattern.middleTemporal: return 'Middle-temporal decentralization';
      case DecentrationPattern.upperNasal: return 'Upper-nasal decentralization';
      case DecentrationPattern.upperTemporal: return 'Upper-temporal decentralization';
      case DecentrationPattern.lowerNasal: return 'Lower-nasal decentralization';
      case DecentrationPattern.lowerTemporal: return 'Lower-temporal decentralization';
      case DecentrationPattern.upwards: return 'Decentration - Upwards';
      case DecentrationPattern.downwards: return 'Decentration - Downwards';
      case DecentrationPattern.upwardsInwards: return 'Decentration - Upwards-Inwards';
      case DecentrationPattern.upwardsOutwards: return 'Decentration - Upwards-Outwards';
    }
  }

  static String getFormTypeName(PupilFormType t) {
    switch (t) {
      case PupilFormType.circle: return 'Circle (Normal)';
      case PupilFormType.oval: return 'Oval';
      case PupilFormType.ovalVertical: return 'Oval-vertical';
      case PupilFormType.ovalHorizontal: return 'Oval-horizontal';
      case PupilFormType.ovalDiagonal: return 'Oval-diagonal';
      case PupilFormType.leftObliqueEllipse: return 'Left Oblique Ellipse';
      case PupilFormType.unilateralEllipse: return 'Unilateral Ellipse';
      case PupilFormType.ventralDivergingEllipse: return 'Ventral Diverging Ellipse';
      case PupilFormType.frontalDivergingEllipse: return 'Frontal Diverging Ellipse';
      case PupilFormType.ellipse: return 'Ellipse';
      case PupilFormType.chord: return 'Chord';
      case PupilFormType.irregular: return 'Irregular';
    }
  }

  static DecentrationPattern detectDecentrationPattern(double offsetPct, double angle, bool isRightEye) {
    if (offsetPct < ClinicalThresholds.decentrationNormal) return DecentrationPattern.centered;
    double a = angle; while (a < 0) a += 360; while (a >= 360) a -= 360;
    if (isRightEye) {
      if (a >= 337.5 || a < 22.5) return DecentrationPattern.nasal;
      if (a >= 22.5 && a < 67.5) return DecentrationPattern.upperNasal;
      if (a >= 67.5 && a < 112.5) return DecentrationPattern.frontal;
      if (a >= 112.5 && a < 157.5) return DecentrationPattern.upperTemporal;
      if (a >= 157.5 && a < 202.5) return DecentrationPattern.temporal;
      if (a >= 202.5 && a < 247.5) return DecentrationPattern.lowerTemporal;
      if (a >= 247.5 && a < 292.5) return DecentrationPattern.basal;
      return DecentrationPattern.lowerNasal;
    } else {
      if (a >= 337.5 || a < 22.5) return DecentrationPattern.temporal;
      if (a >= 22.5 && a < 67.5) return DecentrationPattern.upperTemporal;
      if (a >= 67.5 && a < 112.5) return DecentrationPattern.frontal;
      if (a >= 112.5 && a < 157.5) return DecentrationPattern.upperNasal;
      if (a >= 157.5 && a < 202.5) return DecentrationPattern.nasal;
      if (a >= 202.5 && a < 247.5) return DecentrationPattern.lowerNasal;
      if (a >= 247.5 && a < 292.5) return DecentrationPattern.basal;
      return DecentrationPattern.lowerTemporal;
    }
  }

  static PupilFormType detectPupilFormType(double ellipseness, double orientationAngle) {
    if (ellipseness >= 95) return PupilFormType.circle;
    if (ellipseness >= 90) return PupilFormType.oval;
    double a = orientationAngle; while (a < 0) a += 180; while (a >= 180) a -= 180;
    if (a >= 67.5 && a < 112.5) return PupilFormType.ovalVertical;
    if (a < 22.5 || a >= 157.5) return PupilFormType.ovalHorizontal;
    return PupilFormType.ovalDiagonal;
  }

  static String getZoneFromAngle(double angleDeg, bool isRightEye) {
    double a = angleDeg; while (a < 0) a += 360; while (a >= 360) a -= 360;
    double hour = (90 - a) / 30; while (hour < 0) hour += 12; while (hour >= 12) hour -= 12;
    int ch = hour.round() % 12; if (ch == 0) ch = 12;
    if (isRightEye) {
      switch (ch) {
        case 12: return 'upper-central'; case 1: return 'upper-nasal';
        case 2: case 3: return 'middle-nasal'; case 4: case 5: return 'lower-nasal';
        case 6: return 'lower-basal'; case 7: case 8: return 'lower-temporal';
        case 9: return 'middle-temporal'; case 10: case 11: return 'upper-temporal';
        default: return 'unknown';
      }
    } else {
      switch (ch) {
        case 12: return 'upper-central'; case 1: case 2: return 'upper-temporal';
        case 3: return 'middle-temporal'; case 4: case 5: return 'lower-temporal';
        case 6: return 'lower-basal'; case 7: case 8: return 'lower-nasal';
        case 9: return 'middle-nasal'; case 10: case 11: return 'upper-nasal';
        default: return 'unknown';
      }
    }
  }

  static String getClockPosition(double startAngle, double endAngle) {
    String toClockStr(double angle) {
      double h = ((90 - angle) / 30) % 12; if (h <= 0) h += 12;
      int hr = h.floor(); int m = ((h - hr) * 60).round();
      String hrStr = (hr == 0 ? 12 : hr).toString();
      return '$hrStr:${m.toString().padLeft(2, '0')}';
    }
    return '${toClockStr(startAngle)} - ${toClockStr(endAngle)}';
  }

  static String getOrganAssociation(String zone) => getFlatteningAssociation(zone, true);
}

// ============================================================================
// END OF SECTION 3 - Continue to Section 4 for PupilAnalyzer
// ============================================================================
// pupil_analyzer_fixed.dart v5.2.1 - PART 4 OF 5
// HELPER CLASSES & MAIN PUPIL ANALYZER - STABILIZED DETECTION
// ============================================================================

// ============================================================================
// INTERNAL HELPER CLASSES
// ============================================================================

// ============================================================================
// SECTION 4 OF 5: HELPER CLASSES & MAIN PUPIL ANALYZER
// ============================================================================

// Internal helper classes
class _IrisResult {
  final double centerX, centerY, radius, confidence;
  _IrisResult({required this.centerX, required this.centerY, required this.radius, required this.confidence});
}

class _PupilResult {
  final double centerX, centerY, majorAxis, minorAxis, angle, confidence;
  final List<_BoundaryPoint> boundaryPoints;
  _PupilResult({required this.centerX, required this.centerY, required this.majorAxis, required this.minorAxis, required this.angle, required this.confidence, required this.boundaryPoints});
}

class _BoundaryPoint {
  final double x, y, angle, radius;
  _BoundaryPoint({required this.x, required this.y, required this.angle, required this.radius});
}

class _ShapeAnalysis {
  final double circularity, deformationDegree;
  final List<ZoneAnomaly> flattenings, protrusions;
  _ShapeAnalysis({required this.circularity, required this.deformationDegree, required this.flattenings, required this.protrusions});
}

class _Point { final double x, y; _Point(this.x, this.y); }

class _PupilCandidate {
  final _PupilResult result;
  final int threshold;
  final double percentile, stabilityScore, ellipseness, piRatio;
  _PupilCandidate({required this.result, required this.threshold, required this.percentile, required this.stabilityScore, required this.ellipseness, required this.piRatio});
}

class _ZoneStats {
  final double smoothedDeviation;
  final int sampleCount;
  final String clockRange;
  _ZoneStats({required this.smoothedDeviation, required this.sampleCount, required this.clockRange});
}

// ============================================================================
// MAIN PUPIL ANALYZER CLASS - v5.3.0 with ANW Assessment
// ============================================================================

class PupilAnalyzer {
  static const double _boundaryCalibrationFactor = 0.12;
  static const double _maxReportablePercent = 15.0;
  static const double _minPupilIrisRatio = 0.15;
  static const double _maxPupilIrisRatio = 0.45;
  static const double _minEllipseness = 0.80;
  static const List<double> _thresholdPercentiles = [0.20, 0.25, 0.30, 0.35, 0.40];

  Future<EyeAnalysisResult> analyzeEye(File file, {bool isRightEye = true}) async {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Could not decode image');
    return _analyze(image, isRightEye: isRightEye);
  }

  Future<EyeAnalysisResult> analyzeBytes(Uint8List bytes, {bool isRightEye = true}) async {
    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Could not decode image');
    return _analyze(image, isRightEye: isRightEye);
  }

  // ============================================================================
  // MAIN ANALYSIS - UPDATED v5.3.0 with full ANW Assessment
  // ============================================================================

  EyeAnalysisResult _analyze(img.Image image, {bool isRightEye = true}) {
    final w = image.width;
    final h = image.height;
    final gray = _toGrayscale(image);
    final iris = _detectIris(gray, w, h);
    final pupil = _detectPupil(gray, iris, w, h);
    final shape = _analyzeShape(pupil, iris, isRightEye);

    final pupilDiameter = (pupil.majorAxis + pupil.minorAxis) / 2;
    final pupilRadius = pupilDiameter / 2;
    final irisDiameter = iris.radius * 2;

    double rawRatio = irisDiameter > 0 ? (pupilDiameter / irisDiameter) * 100 : 0.0;
    double ratio = rawRatio.clamp(15, 50);

    double rawEllipseness = pupil.majorAxis > 0 ? (pupil.minorAxis / pupil.majorAxis) * 100 : 100.0;
    double ellipseness = rawEllipseness.clamp(75, 100);

    final dx = pupil.centerX - iris.centerX;
    final dy = pupil.centerY - iris.centerY;
    final rawOffset = math.sqrt(dx * dx + dy * dy);
    double rawDecentPct = iris.radius > 0 ? (rawOffset / iris.radius) * 100 : 0.0;
    double decentralization = (rawDecentPct * 0.5).clamp(0, 25);

    final decentralizationAngle = math.atan2(-dy, dx) * 180 / math.pi;
    final decentralizationZone = ZoneAssociations.getZoneFromAngle(decentralizationAngle, isRightEye);

    final decentrationPattern = ZoneAssociations.detectDecentrationPattern(decentralization, decentralizationAngle, isRightEye);
    final pupilFormType = ZoneAssociations.detectPupilFormType(ellipseness, pupil.angle * 180 / math.pi);

    double conf = _calculateOverallConfidence(iris, pupil, ellipseness, ratio);
    String grade = conf > 0.75 && ellipseness > 90 ? 'A' : conf > 0.60 ? 'B' : conf > 0.45 ? 'C' : 'D';

    final decentrationAssessment = DecentrationAssessment(
      rawOffsetPercent: rawDecentPct, rawOffsetAngle: decentralizationAngle,
      correctedOffsetPercent: decentralization, pattern: decentrationPattern,
      patternName: ZoneAssociations.getPatternName(decentrationPattern),
      organAssociation: ZoneAssociations.getDecentrationAssociation(decentrationPattern, isRightEye),
      isPathological: decentralization >= ClinicalThresholds.decentrationNormal,
      clinicalNote: decentralization < ClinicalThresholds.decentrationNormal
          ? 'Within normal limits.'
          : '${ZoneAssociations.getPatternName(decentrationPattern)}. Offset: ${decentralization.toStringAsFixed(2)}%',
      description: ZoneAssociations.getDecentrationAssociation(decentrationPattern, isRightEye),
    );

    final ellipseAssessment = EllipseAssessment(
      ellipseness: ellipseness, orientationAngle: pupil.angle * 180 / math.pi,
      formType: pupilFormType, formTypeName: ZoneAssociations.getFormTypeName(pupilFormType),
      organAssociation: ZoneAssociations.getPupilFormAssociation(pupilFormType),
      isPathological: ellipseness < ClinicalThresholds.ellipsenessNormal,
      description: ZoneAssociations.getPupilFormAssociation(pupilFormType),
    );

    // ========================================================================
    // UPDATE v5.3.0: FULL ANW ASSESSMENT (Bexel-Compatible)
    // ========================================================================
    final anwAssessment = ANWAnalyzer.analyze(
      gray, iris.centerX, iris.centerY, iris.radius,
      pupil.centerX, pupil.centerY, pupilRadius,
      w, h, isRightEye,
    );

    // For backward compatibility, extract ratio from assessment
    final anwRatio = anwAssessment?.ratio;

    return EyeAnalysisResult(
      pupilDiameterPx: pupilDiameter, irisDiameterPx: irisDiameter,
      pupilIrisRatio: ratio, ellipseness: ellipseness,
      pupilBorderDeformation: shape.deformationDegree.clamp(0, 30),
      decentralization: decentralization, decentralizationAngle: decentralizationAngle,
      decentralizationZone: decentralizationZone,
      anwRatio: anwRatio?.clamp(15, 50),
      anwAssessment: anwAssessment,  // UPDATE v5.3.0
      confidence: conf, qualityGrade: grade,
      pupilFormType: pupilFormType, pupilFormTypeName: ZoneAssociations.getFormTypeName(pupilFormType),
      isDeformationSignificant: shape.deformationDegree > 5 || decentralization > 5 || ellipseness < 95,
      circularityScore: shape.circularity,
      flattenings: shape.flattenings, protrusions: shape.protrusions,
      decentrationAssessment: decentrationAssessment, ellipseAssessment: ellipseAssessment,
    );
  }

  double _calculateOverallConfidence(_IrisResult iris, _PupilResult pupil, double ellipseness, double piRatio) {
    double conf = 0.0;
    conf += iris.confidence * 0.3;
    conf += pupil.confidence * 0.3;
    if (ellipseness >= 85) conf += 0.2 * ((ellipseness - 85) / 15);
    if (piRatio >= 20 && piRatio <= 40) {
      double deviation = ((piRatio - 30).abs() / 10);
      conf += 0.2 * (1 - deviation).clamp(0, 1);
    }
    return conf.clamp(0, 1);
  }

  List<List<int>> _toGrayscale(img.Image image) {
    return List.generate(image.height, (y) =>
        List.generate(image.width, (x) {
          final p = image.getPixel(x, y);
          return ((0.299 * p.r + 0.587 * p.g + 0.114 * p.b)).round();
        }));
  }

  _IrisResult _detectIris(List<List<int>> gray, int w, int h) {
    int minR = (w * 0.25).round(), maxR = (w * 0.50).round();
    double bestScore = 0; int bestX = w ~/ 2, bestY = h ~/ 2, bestR = (w * 0.35).round();
    for (int r = minR; r <= maxR; r += 10) {
      for (int cy = h ~/ 4; cy < 3 * h ~/ 4; cy += 10) {
        for (int cx = w ~/ 4; cx < 3 * w ~/ 4; cx += 10) {
          double s = _circleScore(gray, cx, cy, r, w, h);
          if (s > bestScore) { bestScore = s; bestX = cx; bestY = cy; bestR = r; }
        }
      }
    }
    for (int r = (bestR - 10).clamp(minR, maxR); r <= (bestR + 10).clamp(minR, maxR); r += 2) {
      for (int cy = bestY - 10; cy <= bestY + 10; cy += 2) {
        for (int cx = bestX - 10; cx <= bestX + 10; cx += 2) {
          double s = _circleScore(gray, cx, cy, r, w, h);
          if (s > bestScore) { bestScore = s; bestX = cx; bestY = cy; bestR = r; }
        }
      }
    }
    double refinedRadius = _refineIrisRadius(gray, bestX, bestY, bestR, w, h);
    return _IrisResult(centerX: bestX.toDouble(), centerY: bestY.toDouble(), radius: refinedRadius, confidence: math.min(bestScore / 40, 1.0));
  }

  double _refineIrisRadius(List<List<int>> gray, int cx, int cy, int approxR, int w, int h) {
    List<double> edgeRadii = [];
    for (int angle = 0; angle < 360; angle += 15) {
      double rad = angle * math.pi / 180; double maxGrad = 0, maxGradR = approxR.toDouble();
      for (int r = approxR - 20; r <= approxR + 20; r++) {
        int x1 = (cx + r * math.cos(rad)).round().clamp(0, w - 1);
        int y1 = (cy + r * math.sin(rad)).round().clamp(0, h - 1);
        int x2 = (cx + (r + 3) * math.cos(rad)).round().clamp(0, w - 1);
        int y2 = (cy + (r + 3) * math.sin(rad)).round().clamp(0, h - 1);
        double grad = (gray[y2][x2] - gray[y1][x1]).toDouble();
        if (grad > maxGrad) { maxGrad = grad; maxGradR = r.toDouble(); }
      }
      if (maxGrad > 10) edgeRadii.add(maxGradR);
    }
    if (edgeRadii.length < 12) return approxR.toDouble();
    edgeRadii.sort();
    return edgeRadii[edgeRadii.length ~/ 2];
  }

  double _circleScore(List<List<int>> gray, int cx, int cy, int r, int w, int h) {
    double score = 0; int count = 0;
    for (int a = 0; a < 360; a += 10) {
      double rad = a * math.pi / 180;
      int ix = (cx + (r - 8) * math.cos(rad)).round().clamp(0, w - 1);
      int iy = (cy + (r - 8) * math.sin(rad)).round().clamp(0, h - 1);
      int ox = (cx + (r + 8) * math.cos(rad)).round().clamp(0, w - 1);
      int oy = (cy + (r + 8) * math.sin(rad)).round().clamp(0, h - 1);
      int diff = gray[oy][ox] - gray[iy][ix];
      if (diff > 10) score += diff;
      count++;
    }
    return count > 0 ? score / count : 0;
  }

  _PupilResult _detectPupil(List<List<int>> gray, _IrisResult iris, int w, int h) {
    double searchR = iris.radius * 0.55;
    List<int> darkPx = [];
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        double d = math.sqrt(math.pow(x - iris.centerX, 2) + math.pow(y - iris.centerY, 2));
        if (d <= searchR) darkPx.add(gray[y][x]);
      }
    }
    if (darkPx.isEmpty) return _createDefaultPupilResult(iris);
    darkPx.sort();

    List<_PupilCandidate> candidateList = [];
    for (double percentile in _thresholdPercentiles) {
      int threshIdx = (darkPx.length * percentile).round().clamp(0, darkPx.length - 1);
      int thresh = darkPx[threshIdx];
      _PupilCandidate? candidate = _detectPupilAtThreshold(gray, iris, w, h, searchR, thresh, percentile);
      if (candidate != null) candidateList.add(candidate);
    }
    if (candidateList.length < 2) return _createDefaultPupilResult(iris);
    candidateList.sort((a, b) => b.stabilityScore.compareTo(a.stabilityScore));
    double topPiRatio = candidateList[0].piRatio;
    int agreeingCandidates = candidateList.where((c) => (c.piRatio - topPiRatio).abs() < 0.03).length;
    if (agreeingCandidates < 2) {
      _PupilCandidate best = candidateList[0];
      return _PupilResult(centerX: best.result.centerX, centerY: best.result.centerY, majorAxis: best.result.majorAxis, minorAxis: best.result.minorAxis, angle: best.result.angle, confidence: best.result.confidence * 0.7, boundaryPoints: best.result.boundaryPoints);
    }
    return _selectBestCandidate(candidateList, iris).result;
  }

  _PupilCandidate? _detectPupilAtThreshold(List<List<int>> gray, _IrisResult iris, int w, int h, double searchR, int thresh, double percentile) {
    List<_Point> darkPts = [];
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        double d = math.sqrt(math.pow(x - iris.centerX, 2) + math.pow(y - iris.centerY, 2));
        if (d <= searchR && gray[y][x] <= thresh) darkPts.add(_Point(x.toDouble(), y.toDouble()));
      }
    }
    if (darkPts.length < 50) return null;

    double sumX = 0, sumY = 0;
    for (final p in darkPts) { sumX += p.x; sumY += p.y; }
    double cx = sumX / darkPts.length, cy = sumY / darkPts.length;
    double centroidOffset = math.sqrt(math.pow(cx - iris.centerX, 2) + math.pow(cy - iris.centerY, 2));
    if (centroidOffset > iris.radius * 0.3) return null;

    double cxx = 0, cyy = 0, cxy = 0;
    for (final p in darkPts) { double ddx = p.x - cx, ddy = p.y - cy; cxx += ddx * ddx; cyy += ddy * ddy; cxy += ddx * ddy; }
    cxx /= darkPts.length; cyy /= darkPts.length; cxy /= darkPts.length;
    double trace = cxx + cyy, det = cxx * cyy - cxy * cxy;
    double disc = math.sqrt(math.max(0, trace * trace / 4 - det));
    double l1 = trace / 2 + disc, l2 = trace / 2 - disc;
    double major = 2.0 * math.sqrt(math.max(l1, l2).abs()) * 1.5;
    double minor = 2.0 * math.sqrt(math.max(0, math.min(l1, l2).abs())) * 1.5;
    double angle = 0.5 * math.atan2(2 * cxy, cxx - cyy);

    double avgRadius = (major + minor) / 4;
    double piRatio = avgRadius / iris.radius;
    if (piRatio < _minPupilIrisRatio || piRatio > _maxPupilIrisRatio) return null;
    double ellipseness = minor / major;
    if (ellipseness < _minEllipseness) return null;

    List<_BoundaryPoint> bpts = _detectBoundaryPoints(gray, cx, cy, thresh, w, h, iris.radius);
    double stabilityScore = _calculateStabilityScore(piRatio, ellipseness, bpts, centroidOffset / iris.radius);

    return _PupilCandidate(
        result: _PupilResult(centerX: cx, centerY: cy, majorAxis: major, minorAxis: minor, angle: angle, confidence: stabilityScore, boundaryPoints: bpts),
        threshold: thresh, percentile: percentile, stabilityScore: stabilityScore, ellipseness: ellipseness, piRatio: piRatio
    );
  }

  List<_BoundaryPoint> _detectBoundaryPoints(List<List<int>> gray, double cx, double cy, int thresh, int w, int h, double irisRadius) {
    List<_BoundaryPoint> bpts = [];
    double maxSearchR = irisRadius * 0.5;
    for (int ad = 0; ad < 360; ad += 5) {
      double ar = ad * math.pi / 180; double? boundaryR; int consecutiveBright = 0;
      for (double r = 5; r < maxSearchR; r += 1) {
        int px = (cx + r * math.cos(ar)).round(), py = (cy + r * math.sin(ar)).round();
        if (px < 0 || px >= w || py < 0 || py >= h) break;
        if (gray[py][px] > thresh + 15) { consecutiveBright++; if (consecutiveBright >= 3 && boundaryR == null) boundaryR = r - 2; }
        else consecutiveBright = 0;
      }
      if (boundaryR != null && boundaryR > 5) bpts.add(_BoundaryPoint(x: cx + boundaryR * math.cos(ar), y: cy + boundaryR * math.sin(ar), angle: ad.toDouble(), radius: boundaryR));
    }
    return bpts;
  }

  double _calculateStabilityScore(double piRatio, double ellipseness, List<_BoundaryPoint> bpts, double centroidOffsetRatio) {
    double score = 0.0;
    double idealPiRatio = 0.30;
    double piScore = 1.0 - (piRatio - idealPiRatio).abs() / 0.15;
    score += piScore.clamp(0, 1) * 0.3;
    double ellipseScore = (ellipseness - _minEllipseness) / (1.0 - _minEllipseness);
    score += ellipseScore.clamp(0, 1) * 0.3;
    double bptScore = (bpts.length / 72).clamp(0, 1);
    score += bptScore * 0.2;
    double centerScore = 1.0 - centroidOffsetRatio / 0.3;
    score += centerScore.clamp(0, 1) * 0.2;
    return score.clamp(0, 1);
  }

  _PupilCandidate _selectBestCandidate(List<_PupilCandidate> candidateList, _IrisResult iris) {
    candidateList.sort((a, b) => b.stabilityScore.compareTo(a.stabilityScore));
    if (candidateList.length >= 3) {
      double topScore = candidateList[0].stabilityScore;
      List<_PupilCandidate> similarCandidates = candidateList.where((c) => c.stabilityScore >= topScore - 0.1).toList();
      if (similarCandidates.length > 1) {
        similarCandidates.sort((a, b) => (a.percentile - 0.30).abs().compareTo((b.percentile - 0.30).abs()));
        return similarCandidates[0];
      }
    }
    return candidateList[0];
  }

  _PupilResult _createDefaultPupilResult(_IrisResult iris) {
    return _PupilResult(centerX: iris.centerX, centerY: iris.centerY, majorAxis: iris.radius * 0.5, minorAxis: iris.radius * 0.45, angle: 0, confidence: 0.20, boundaryPoints: []);
  }

  _ShapeAnalysis _analyzeShape(_PupilResult pupil, _IrisResult iris, bool isRightEye) {
    if (pupil.boundaryPoints.isEmpty || pupil.boundaryPoints.length < 20) {
      return _ShapeAnalysis(circularity: 95, deformationDegree: 0, flattenings: [], protrusions: []);
    }
    List<_BoundaryPoint> fpts = _ransacFilterBoundary(pupil.boundaryPoints);
    if (fpts.length < 24) return _ShapeAnalysis(circularity: 95, deformationDegree: 0, flattenings: [], protrusions: []);

    List<double> radii = fpts.map((p) => p.radius).toList()..sort();
    double medianR = radii[radii.length ~/ 2];
    List<double> absDevs = radii.map((r) => (r - medianR).abs()).toList()..sort();
    double mad = absDevs[absDevs.length ~/ 2];
    if (medianR < 10 || medianR > iris.radius * 0.55) return _ShapeAnalysis(circularity: 95, deformationDegree: 0, flattenings: [], protrusions: []);

    double robustCV = mad / medianR;
    double circ = (100 - robustCV * 150).clamp(70.0, 100.0);
    List<double> devPcts = fpts.map((p) => ((p.radius - medianR) / medianR * 100).abs()).toList()..sort();
    double p90Dev = devPcts[(devPcts.length * 0.9).floor()];
    double deformDegree = (p90Dev * _boundaryCalibrationFactor).clamp(0, 15);

    Map<String, _ZoneStats> zoneStats = _calculateZoneStatistics(fpts, medianR, isRightEye);
    List<ZoneAnomaly> flats = [], prots = [];

    zoneStats.forEach((zoneName, stats) {
      if (stats.sampleCount < 3) return;
      double smoothedDev = stats.smoothedDeviation;
      double calibratedPct = (smoothedDev.abs() * _boundaryCalibrationFactor * 1.5).clamp(0.0, _maxReportablePercent);
      if (calibratedPct < ClinicalThresholds.minReportable) return;

      FindingSignificance sig = ClinicalThresholds.getSignificance(calibratedPct);
      String sev = ClinicalThresholds.getSignificanceLabel(sig);

      if (smoothedDev < 0) {
        String organ = ZoneAssociations.getFlatteningAssociation(zoneName, isRightEye);
        String desc = '${_formatZoneNameForDisplay(zoneName)} flatness (${stats.clockRange}) - ${calibratedPct.toStringAsFixed(1)}%';
        flats.add(ZoneAnomaly(zone: zoneName, severity: sev, percentage: double.parse(calibratedPct.toStringAsFixed(1)), organAssociation: organ, clockPosition: stats.clockRange, anomalyType: AnomalyType.flattening, significance: sig, description: desc));
      } else {
        String organ = ZoneAssociations.getProtrusionAssociation(zoneName, isRightEye);
        String desc = '${_formatZoneNameForDisplay(zoneName)} protrusion (${stats.clockRange}) - ${calibratedPct.toStringAsFixed(1)}%';
        prots.add(ZoneAnomaly(zone: zoneName, severity: sev, percentage: double.parse(calibratedPct.toStringAsFixed(1)), organAssociation: organ, clockPosition: stats.clockRange, anomalyType: AnomalyType.protrusion, significance: sig, description: desc));
      }
    });

    flats.sort((a, b) => b.percentage.compareTo(a.percentage));
    prots.sort((a, b) => b.percentage.compareTo(a.percentage));
    if (flats.length > 4) flats = flats.sublist(0, 4);
    if (prots.length > 4) prots = prots.sublist(0, 4);
    return _ShapeAnalysis(circularity: circ, deformationDegree: deformDegree, flattenings: flats, protrusions: prots);
  }

  List<_BoundaryPoint> _ransacFilterBoundary(List<_BoundaryPoint> pts) {
    if (pts.length < 20) return pts;
    List<double> radii = pts.map((p) => p.radius).toList()..sort();
    int q1i = (radii.length * 0.25).floor(), q3i = (radii.length * 0.75).floor();
    double q1 = radii[q1i], q3 = radii[q3i], iqr = q3 - q1;
    double lo = q1 - 1.5 * iqr, hi = q3 + 1.5 * iqr;
    List<_BoundaryPoint> filtered = pts.where((p) => p.radius >= lo && p.radius <= hi).toList();
    if (filtered.length < 20) return pts;
    List<double> filteredRadii = filtered.map((p) => p.radius).toList()..sort();
    double medianR = filteredRadii[filteredRadii.length ~/ 2];
    List<double> absDevs = filteredRadii.map((r) => (r - medianR).abs()).toList()..sort();
    double mad = absDevs[absDevs.length ~/ 2];
    double threshold = medianR + 2.5 * mad * 1.4826;
    double lowerThreshold = medianR - 2.5 * mad * 1.4826;
    List<_BoundaryPoint> finalPts = filtered.where((p) => p.radius >= lowerThreshold && p.radius <= threshold).toList();
    return finalPts.length >= 20 ? finalPts : filtered;
  }

  Map<String, _ZoneStats> _calculateZoneStatistics(List<_BoundaryPoint> pts, double medianR, bool isRightEye) {
    Map<int, List<double>> hourDeviations = {};
    for (int hr = 0; hr < 12; hr++) hourDeviations[hr] = [];
    for (final p in pts) { int hr = _angleToClockHour(p.angle); double devPct = ((p.radius - medianR) / medianR) * 100; hourDeviations[hr]!.add(devPct); }
    Map<int, double> hourMedians = {};
    for (int hr = 0; hr < 12; hr++) { List<double> devs = hourDeviations[hr]!; hourMedians[hr] = devs.isEmpty ? 0 : (devs..sort())[devs.length ~/ 2]; }
    Map<int, double> smoothedMedians = {};
    for (int hr = 0; hr < 12; hr++) { int prev = (hr - 1 + 12) % 12, next = (hr + 1) % 12; smoothedMedians[hr] = (hourMedians[prev]! + hourMedians[hr]! * 2 + hourMedians[next]!) / 4; }

    Map<String, _ZoneStats> zoneStats = {};
    for (int hr = 0; hr < 12; hr++) {
      String zoneName = _getZoneNameFromHour(hr, isRightEye);
      double smoothedDev = smoothedMedians[hr]!;
      int sampleCount = hourDeviations[hr]!.length;
      if (!zoneStats.containsKey(zoneName)) {
        zoneStats[zoneName] = _ZoneStats(smoothedDeviation: smoothedDev, sampleCount: sampleCount, clockRange: _formatClockRangeForHour(hr));
      } else {
        _ZoneStats existing = zoneStats[zoneName]!;
        if (smoothedDev.abs() > existing.smoothedDeviation.abs()) {
          zoneStats[zoneName] = _ZoneStats(smoothedDeviation: smoothedDev, sampleCount: existing.sampleCount + sampleCount, clockRange: existing.clockRange);
        } else {
          zoneStats[zoneName] = _ZoneStats(smoothedDeviation: existing.smoothedDeviation, sampleCount: existing.sampleCount + sampleCount, clockRange: existing.clockRange);
        }
      }
    }
    return zoneStats;
  }

  String _formatZoneNameForDisplay(String zone) => zone.split('-').map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w).join('-');
  String _getZoneNameFromHour(int hr, bool isRightEye) {
    if (isRightEye) {
      switch (hr) { case 0: case 11: case 1: return 'upper-central'; case 2: return 'upper-nasal'; case 3: return 'middle-nasal'; case 4: case 5: return 'lower-nasal'; case 6: return 'lower-basal'; case 7: case 8: return 'lower-temporal'; case 9: return 'middle-temporal'; case 10: return 'upper-temporal'; default: return 'unknown'; }
    } else {
      switch (hr) { case 0: case 11: case 1: return 'upper-central'; case 2: return 'upper-temporal'; case 3: return 'middle-temporal'; case 4: case 5: return 'lower-temporal'; case 6: return 'lower-basal'; case 7: case 8: return 'lower-nasal'; case 9: return 'middle-nasal'; case 10: return 'upper-nasal'; default: return 'unknown'; }
    }
  }
  String _formatClockRangeForHour(int hr) { int prevHr = (hr - 1 + 12) % 12, nextHr = (hr + 1) % 12; int prevDisplay = prevHr == 0 ? 12 : prevHr, nextDisplay = nextHr == 0 ? 12 : nextHr; return '$prevDisplay:30 - $nextDisplay:30'; }
  int _angleToClockHour(double a) { while (a < 0) a += 360; while (a >= 360) a -= 360; double h = (90 - a) / 30; while (h < 0) h += 12; while (h >= 12) h -= 12; return h.round() % 12; }
}

// ============================================================================
// END OF SECTION 4 - Continue to Section 5 for ANWAnalyzer & Support Classes
// ============================================================================
// ============================================================================
// ANISOCORIA CALCULATOR - v5.2.1 STABILIZED (P/I RATIO BASED)
// ============================================================================

// ============================================================================
// SECTION 5 OF 5: ANW ANALYZER & SUPPORT CLASSES
// ============================================================================

// ============================================================================
// UPDATE v5.3.0: ANW ANALYZER - Bexel-Compatible with Shifts & Constrictions
// ============================================================================

class ANWAnalyzer {
  /// Detect ANW at a specific angle, returns radius or null
  static double? _detectANWAtAngle(List<List<int>> gray, double cx, double cy, double inner, double outer, double angleRad, int w, int h) {
    double maxGrad = 0; double? maxGradR;
    for (double r = inner; r < outer; r += 1.5) {
      int x1 = (cx + r * math.cos(angleRad)).round(), y1 = (cy + r * math.sin(angleRad)).round();
      int x2 = (cx + (r + 4) * math.cos(angleRad)).round(), y2 = (cy + (r + 4) * math.sin(angleRad)).round();
      if (x1 >= 0 && x1 < w && y1 >= 0 && y1 < h && x2 >= 0 && x2 < w && y2 >= 0 && y2 < h) {
        double grad = (gray[y2][x2] - gray[y1][x1]).abs().toDouble();
        if (grad > maxGrad) { maxGrad = grad; maxGradR = r; }
      }
    }
    return maxGrad > 8 ? maxGradR : null;
  }

  /// Main ANW analysis method
  static ANWAssessment? analyze(List<List<int>> gray, double irisCenterX, double irisCenterY, double irisRadius, double pupilCenterX, double pupilCenterY, double pupilRadius, int w, int h, bool isRightEye) {
    double inner = pupilRadius * 1.15, outer = irisRadius * 0.65;
    if (inner >= outer || pupilRadius < 10) return null;

    // Detect ANW radius at each angle (5-degree resolution)
    Map<int, double> sectorRadii = {};
    for (int angle = 0; angle < 360; angle += 5) {
      double rad = angle * math.pi / 180;
      double? r = _detectANWAtAngle(gray, irisCenterX, irisCenterY, inner, outer, rad, w, h);
      if (r != null) sectorRadii[angle] = r;
    }
    if (sectorRadii.length < 36) return null;

    // Statistics
    List<double> radii = sectorRadii.values.toList()..sort();
    double medianR = radii[radii.length ~/ 2], minR = radii.first, maxR = radii.last;
    double perimeter = 2 * math.pi * medianR;

    // Bexel ratio: (ANW_r - Pupil_r) / (Iris_r - Pupil_r) * 100
    double beltWidth = medianR - pupilRadius;
    double totalZone = irisRadius - pupilRadius;
    double ratio = (beltWidth / totalZone) * 100;
    double asymmetry = ((maxR - minR) / medianR) * 100;

    // Ratio status
    ANWRatioStatus ratioStatus = ratio < ClinicalThresholds.anwSpasticThreshold
        ? ANWRatioStatus.spastic
        : ratio > ClinicalThresholds.anwAtonicThreshold
        ? ANWRatioStatus.atonic
        : ANWRatioStatus.normal;

    // Detect SHIFTS (Drawing Out) - protrusions
    List<ANWShift> shifts = _detectShifts(sectorRadii, medianR, isRightEye);
    ANWShift? primaryShift = shifts.isNotEmpty ? shifts.first : null;

    // Detect CONSTRICTIONS (Drawing In) - narrowings
    var constrictionData = _detectConstrictions(sectorRadii, medianR, isRightEye);

    // Form type determination
    ANWFormType formType; String formTypeName; bool isFormNormal;
    if (asymmetry > 15) {
      formType = ANWFormType.lacerated; formTypeName = 'Lacerated'; isFormNormal = false;
    } else if (_hasLocalIndentations(sectorRadii, medianR)) {
      formType = ANWFormType.indented; formTypeName = 'Indented'; isFormNormal = false;
    } else if (ratio < ClinicalThresholds.anwSpasticThreshold || (constrictionData['frontal'] == true && constrictionData['basal'] == true)) {
      formType = ANWFormType.drawnIn; formTypeName = 'Drawn In'; isFormNormal = false;
    } else {
      formType = ANWFormType.regular; formTypeName = 'Regular'; isFormNormal = true;
    }

    // Tonic state (Bexel interpretation)
    String? tonicState; String tonicDesc = '';
    if (ratioStatus == ANWRatioStatus.spastic) {
      tonicState = 'Parasympathotonic';
      tonicDesc = 'Liminal sensitivity increased. Reflex activity accelerated. GI secretory/evacuation functions heightened.';
    } else if (ratioStatus == ANWRatioStatus.atonic) {
      tonicState = 'Sympathotonic';
      tonicDesc = 'Liminal sensitivity decreased. Reflex activity decelerated. GI secretory/evacuation functions reduced.';
    }

    // Generate Bexel-style findings
    List<String> findings = _generateBexelFindings(primaryShift, constrictionData, isRightEye);

    return ANWAssessment(
      diameterPx: medianR * 2, perimeterPx: perimeter,
      ratio: double.parse(ratio.toStringAsFixed(2)), ratioStatus: ratioStatus,
      asymmetryPercent: double.parse(asymmetry.toStringAsFixed(2)),
      isAsymmetryNormal: asymmetry <= ClinicalThresholds.anwAsymmetryNormal,
      formType: formType, formTypeName: formTypeName, isFormNormal: isFormNormal,
      primaryShift: primaryShift, allShifts: shifts,
      frontalConstricted: constrictionData['frontal'] ?? false,
      basalConstricted: constrictionData['basal'] ?? false,
      temporalConstricted: constrictionData['temporal'] ?? false,
      nasalConstricted: constrictionData['nasal'] ?? false,
      constrictions: constrictionData['list'] ?? [],
      tonicState: tonicState, tonicStateDescription: tonicDesc,
      bexelFindings: findings,
    );
  }

  /// Detect SHIFTS (Drawing Out) - where collarette bulges OUTWARD
  static List<ANWShift> _detectShifts(Map<int, double> radii, double medianR, bool isRightEye) {
    List<ANWShift> shifts = [];
    Map<int, double> deviations = {};
    radii.forEach((angle, r) {
      double devPct = ((r - medianR) / medianR) * 100;
      if (devPct > ClinicalThresholds.anwShiftThreshold) deviations[angle] = devPct;
    });
    if (deviations.isEmpty) return shifts;

    int maxAngle = deviations.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    double maxDev = deviations[maxAngle]!;
    var zoneInfo = _angleToShiftZone(maxAngle, isRightEye);
    shifts.add(ANWShift(zoneName: zoneInfo['name']!, clockPosition: zoneInfo['clock']!, deviationPercent: maxDev, clinicalAssociation: zoneInfo['clinical']!));
    return shifts;
  }

  /// Convert angle to shift zone with Velhover clinical associations
  static Map<String, String> _angleToShiftZone(int angle, bool isRightEye) {
    double hour = ((90 - angle) / 30) % 12; if (hour < 0) hour += 12;

    if (isRightEye) {
      if (hour >= 8 && hour < 10) return {'name': 'Middle-temporal', 'clock': '8:00 - 10:00', 'clinical': 'Respiratory and cardiac autonomic patterns.'};
      if (hour >= 6 && hour < 8) return {'name': 'Lower temporal', 'clock': '6:00 - 8:00', 'clinical': 'Hemodynamics disturbance in vena cava inferior.'};
      if (hour >= 2 && hour < 4) return {'name': 'Middle-nasal', 'clock': '2:00 - 4:00', 'clinical': 'Hypofunction of n. vagus or stellate ganglion.'};
      if (hour >= 10 || hour < 2) return {'name': 'Upper temporal', 'clock': '10:00 - 2:00', 'clinical': 'Circulation in vertebral artery affected.'};
    } else {
      // LEFT EYE - Middle-temporal shift = CARDIAC (Velhover)
      if (hour >= 2 && hour < 4) return {'name': 'Middle-temporal', 'clock': '2:00 - 4:00', 'clinical': 'Overloads of the left ventricle. Cardiac stress.'};
      if (hour >= 4 && hour < 6) return {'name': 'Lower temporal', 'clock': '4:00 - 6:00', 'clinical': 'Hemodynamics disturbance in vena cava inferior.'};
      if (hour >= 8 && hour < 10) return {'name': 'Middle-nasal', 'clock': '8:00 - 10:00', 'clinical': 'Hypofunction of n. vagus or stellate ganglion.'};
    }
    if (hour >= 5 && hour < 7) return {'name': 'Basal', 'clock': '5:00 - 7:00', 'clinical': 'Congestive symptoms in small pelvis.'};
    return {'name': 'Frontal', 'clock': '11:00 - 1:00', 'clinical': 'Cerebral circulation patterns.'};
  }

  /// Detect CONSTRICTIONS (Drawing In) - where collarette narrows INWARD
  static Map<String, dynamic> _detectConstrictions(Map<int, double> radii, double medianR, bool isRightEye) {
    List<int> frontalAngles = [75, 80, 85, 90, 95, 100, 105];
    List<int> basalAngles = [255, 260, 265, 270, 275, 280, 285];

    double frontalDev = _getZoneDeviation(radii, frontalAngles, medianR);
    double basalDev = _getZoneDeviation(radii, basalAngles, medianR);

    bool frontalConstricted = frontalDev < -ClinicalThresholds.anwConstrictionThreshold;
    bool basalConstricted = basalDev < -ClinicalThresholds.anwConstrictionThreshold;

    List<ANWZoneConstriction> list = [];
    if (frontalConstricted) list.add(ANWZoneConstriction(zoneName: 'Frontal', clockPosition: '11:00 - 1:00', deviationPercent: frontalDev));
    if (basalConstricted) list.add(ANWZoneConstriction(zoneName: 'Basal', clockPosition: '5:00 - 7:00', deviationPercent: basalDev));

    return {'frontal': frontalConstricted, 'basal': basalConstricted, 'temporal': false, 'nasal': false, 'overall': frontalConstricted || basalConstricted, 'list': list};
  }

  static double _getZoneDeviation(Map<int, double> radii, List<int> angles, double medianR) {
    List<double> values = [];
    for (int a in angles) {
      if (radii.containsKey(a)) values.add(radii[a]!);
      if (radii.containsKey((a + 5) % 360)) values.add(radii[(a + 5) % 360]!);
    }
    if (values.isEmpty) return 0;
    double avg = values.reduce((a, b) => a + b) / values.length;
    return ((avg - medianR) / medianR) * 100;
  }

  static bool _hasLocalIndentations(Map<int, double> radii, double medianR) {
    int indentCount = 0;
    List<int> angles = radii.keys.toList()..sort();
    for (int i = 1; i < angles.length - 1; i++) {
      double prev = radii[angles[i - 1]]!, curr = radii[angles[i]]!, next = radii[angles[i + 1]]!;
      if (curr < prev - 5 && curr < next - 5 && curr < medianR * 0.9) indentCount++;
    }
    return indentCount >= 2;
  }

  static List<String> _generateBexelFindings(ANWShift? shift, Map<String, dynamic> constrictions, bool isRightEye) {
    List<String> findings = [];
    String eye = isRightEye ? 'D' : 'S';
    if (shift != null) findings.add('$eye: ${shift.zoneName} shift.');
    bool frontal = constrictions['frontal'] ?? false, basal = constrictions['basal'] ?? false;
    if (frontal && basal) findings.add('$eye: Frontal and basal zones of pupillary belt are constricted.');
    else if (frontal) findings.add('$eye: Frontal zone of pupillary belt is constricted.');
    else if (basal) findings.add('$eye: Basal zone of pupillary belt is constricted.');
    return findings;
  }
}

// ============================================================================
// ANISOCORIA CALCULATOR (unchanged from v5.2.1)
// ============================================================================

class AnisocoriaCalculator {
  static AnisocoriaAssessment? calculate(EyeAnalysisResult leftEye, EyeAnalysisResult rightEye) {
    if (leftEye.confidence < 0.45 || rightEye.confidence < 0.45) return null;
    bool odSuspicious = leftEye.ellipseness >= 99.9 && leftEye.decentralization < 0.1;
    bool osSuspicious = rightEye.ellipseness >= 99.9 && rightEye.decentralization < 0.1;
    if (odSuspicious || osSuspicious) return null;

    double osRatio = leftEye.pupilIrisRatio, odRatio = rightEye.pupilIrisRatio;
    double absoluteDiff = (osRatio - odRatio).abs();
    double avgRatio = (osRatio + odRatio) / 2;
    double relativeDiff = avgRatio > 0 ? (absoluteDiff / avgRatio) * 100 : 0;
    String largerPupil = absoluteDiff < 1.0 ? 'equal' : osRatio > odRatio ? 'OS (Left)' : 'OD (Right)';

    AnisocoriaSeverity severity = absoluteDiff < 2.0 ? AnisocoriaSeverity.none : absoluteDiff < 4.0 ? AnisocoriaSeverity.mild : absoluteDiff < 8.0 ? AnisocoriaSeverity.moderate : AnisocoriaSeverity.severe;

    String clinicalNote = severity == AnisocoriaSeverity.none
        ? 'Pupil sizes within normal limits. No significant anisocoria detected.'
        : 'Anisocoria detected: ${absoluteDiff.toStringAsFixed(1)}% (${osRatio > odRatio ? "S>D" : "D>S"}). ${_getSeverityDescription(severity)}';

    bool tbiIndicator = severity == AnisocoriaSeverity.moderate || severity == AnisocoriaSeverity.severe;

    return AnisocoriaAssessment(
      absoluteDifference: absoluteDiff, relativeDifference: relativeDiff,
      largerPupil: largerPupil, severity: severity, clinicalNote: clinicalNote,
      isTBIIndicator: tbiIndicator, leftPupilRatio: osRatio, rightPupilRatio: odRatio,
      leftPupilDiameterPx: leftEye.pupilDiameterPx, rightPupilDiameterPx: rightEye.pupilDiameterPx,
    );
  }

  static String _getSeverityDescription(AnisocoriaSeverity severity) {
    switch (severity) {
      case AnisocoriaSeverity.none: return 'Within normal limits.';
      case AnisocoriaSeverity.mild: return 'Mild difference observed. May be physiological.';
      case AnisocoriaSeverity.moderate: return 'Moderate asymmetry. Research observation noted.';
      case AnisocoriaSeverity.severe: return 'Significant asymmetry. Research observation flagged.';
    }
  }
}

// ============================================================================
// EYE VALIDATOR (unchanged from v5.2.2)
// ============================================================================

class EyeValidationResult {
  final bool isValidEye;
  final String? rejectionReason;
  final double confidence;
  final Map<String, bool> checkResults;
  EyeValidationResult({required this.isValidEye, this.rejectionReason, required this.confidence, this.checkResults = const {}});
}

class EyeValidator {
  static const double _minConfidenceThreshold = 0.70;
  static const int _minChecksRequired = 5;

  Future<EyeValidationResult> validateEyeImage(File file) async {
    final bytes = await file.readAsBytes();
    return validateBytes(bytes);
  }

  Future<EyeValidationResult> validateBytes(Uint8List bytes) async {
    final image = img.decodeImage(bytes);
    if (image == null) return EyeValidationResult(isValidEye: false, rejectionReason: 'Could not decode image', confidence: 0);
    return _validateImageData(image);
  }

  EyeValidationResult _validateImageData(img.Image image) {
    final w = image.width, h = image.height;
    final gray = List.generate(h, (y) => List.generate(w, (x) { final p = image.getPixel(x, y); return ((0.299 * p.r + 0.587 * p.g + 0.114 * p.b)).round(); }));
    final colorData = _extractColorData(image);

    Map<String, bool> checks = {};
    checks['aspectRatio'] = _checkAspectRatio(w, h);
    checks['hasCircle'] = _hasCircle(gray, w, h);
    checks['hasDarkCenter'] = _hasDarkCenter(gray, w, h);
    checks['hasTexture'] = _hasIrisTexture(gray, w, h);
    checks['hasConcentricCircles'] = _hasConcentricCircles(gray, w, h);
    checks['colorDistribution'] = _checkColorDistribution(colorData, w, h);
    checks['edgeDensity'] = _checkEdgeDensity(gray, w, h);

    int passedChecks = checks.values.where((v) => v).length;
    double confidence = passedChecks / checks.length;
    bool isValid = passedChecks >= _minChecksRequired && confidence >= _minConfidenceThreshold;

    String? rejectionReason;
    if (!isValid) {
      List<String> failedChecks = checks.entries.where((e) => !e.value).map((e) => _getCheckDescription(e.key)).toList();
      rejectionReason = 'Not a valid eye image. Failed: ${failedChecks.join(", ")} ($passedChecks/${checks.length} checks passed)';
    }
    return EyeValidationResult(isValidEye: isValid, rejectionReason: rejectionReason, confidence: confidence, checkResults: checks);
  }

  bool _checkAspectRatio(int w, int h) => w / h >= 0.75 && w / h <= 1.5;

  bool _hasCircle(List<List<int>> gray, int w, int h) {
    int cx = w ~/ 2, cy = h ~/ 2, passed = 0, totalTests = 0;
    for (int r = (w * 0.15).round(); r < (w * 0.45).round(); r += 12) {
      int edgeCount = 0, sampleCount = 0;
      for (int a = 0; a < 360; a += 15) {
        double rad = a * math.pi / 180;
        int x1 = (cx + (r - 5) * math.cos(rad)).round().clamp(0, w - 1), y1 = (cy + (r - 5) * math.sin(rad)).round().clamp(0, h - 1);
        int x2 = (cx + (r + 5) * math.cos(rad)).round().clamp(0, w - 1), y2 = (cy + (r + 5) * math.sin(rad)).round().clamp(0, h - 1);
        if ((gray[y2][x2] - gray[y1][x1]).abs() > 12) edgeCount++;
        sampleCount++;
      }
      if (sampleCount > 0 && edgeCount >= sampleCount * 0.5) passed++;
      totalTests++;
    }
    return passed >= 2;
  }

  bool _hasDarkCenter(List<List<int>> gray, int w, int h) {
    int cx = w ~/ 2, cy = h ~/ 2, centerR = (w * 0.08).round().clamp(5, 50);
    int centerSum = 0, centerCount = 0, innerRingR = (w * 0.12).round(), outerRingR = (w * 0.25).round(), ringSum = 0, ringCount = 0;
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        double d = math.sqrt((x - cx) * (x - cx) + (y - cy) * (y - cy));
        if (d < centerR) { centerSum += gray[y][x]; centerCount++; }
        else if (d >= innerRingR && d < outerRingR) { ringSum += gray[y][x]; ringCount++; }
      }
    }
    if (centerCount == 0 || ringCount == 0) return false;
    return centerSum / centerCount < ringSum / ringCount - 20;
  }

  bool _hasIrisTexture(List<List<int>> gray, int w, int h) {
    int cx = w ~/ 2, cy = h ~/ 2, innerR = (w * 0.10).round(), outerR = (w * 0.35).round();
    List<int> samples = []; List<double> radialVariances = [];
    for (int angle = 0; angle < 360; angle += 20) {
      double rad = angle * math.pi / 180; List<int> radialSamples = [];
      for (int r = innerR; r < outerR; r += 3) {
        int x = (cx + r * math.cos(rad)).round().clamp(0, w - 1), y = (cy + r * math.sin(rad)).round().clamp(0, h - 1);
        radialSamples.add(gray[y][x]); samples.add(gray[y][x]);
      }
      if (radialSamples.length > 3) {
        double mean = radialSamples.reduce((a, b) => a + b) / radialSamples.length;
        double variance = radialSamples.map((s) => (s - mean) * (s - mean)).reduce((a, b) => a + b) / radialSamples.length;
        radialVariances.add(variance);
      }
    }
    if (samples.isEmpty || radialVariances.isEmpty) return false;
    double mean = samples.reduce((a, b) => a + b) / samples.length;
    double variance = samples.map((s) => (s - mean) * (s - mean)).reduce((a, b) => a + b) / samples.length;
    double avgRadialVariance = radialVariances.reduce((a, b) => a + b) / radialVariances.length;
    return variance > 80 && variance < 5000 && avgRadialVariance > 50;
  }

  bool _hasConcentricCircles(List<List<int>> gray, int w, int h) {
    int cx = w ~/ 2, cy = h ~/ 2; List<int> edgeStrengths = [];
    for (int r = (w * 0.05).round(); r < (w * 0.45).round(); r += 5) {
      int totalEdge = 0, samples = 0;
      for (int a = 0; a < 360; a += 10) {
        double rad = a * math.pi / 180;
        int x1 = (cx + (r - 2) * math.cos(rad)).round().clamp(0, w - 1), y1 = (cy + (r - 2) * math.sin(rad)).round().clamp(0, h - 1);
        int x2 = (cx + (r + 2) * math.cos(rad)).round().clamp(0, w - 1), y2 = (cy + (r + 2) * math.sin(rad)).round().clamp(0, h - 1);
        totalEdge += (gray[y2][x2] - gray[y1][x1]).abs(); samples++;
      }
      edgeStrengths.add(samples > 0 ? totalEdge ~/ samples : 0);
    }
    if (edgeStrengths.length < 10) return false;
    int peakCount = 0;
    for (int i = 2; i < edgeStrengths.length - 2; i++) {
      if (edgeStrengths[i] > edgeStrengths[i - 1] && edgeStrengths[i] > edgeStrengths[i - 2] && edgeStrengths[i] > edgeStrengths[i + 1] && edgeStrengths[i] > edgeStrengths[i + 2] && edgeStrengths[i] > 15) peakCount++;
    }
    return peakCount >= 2;
  }

  bool _checkColorDistribution(Map<String, dynamic> colorData, int w, int h) {
    double avgR = colorData['avgR'], avgG = colorData['avgG'], avgB = colorData['avgB'];
    double saturation = colorData['saturation'], centerSaturation = colorData['centerSaturation'];
    if (centerSaturation > 0.3 || saturation > 0.6) return false;
    double rgbRange = [avgR, avgG, avgB].reduce(math.max) - [avgR, avgG, avgB].reduce(math.min);
    if (rgbRange < 5 && avgR > 200) return false;
    return true;
  }

  Map<String, dynamic> _extractColorData(img.Image image) {
    int w = image.width, h = image.height, cx = w ~/ 2, cy = h ~/ 2;
    double totalR = 0, totalG = 0, totalB = 0, centerR = 0, centerG = 0, centerB = 0;
    int totalCount = 0, centerCount = 0, centerRadius = (w * 0.1).round();
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        final p = image.getPixel(x, y);
        totalR += p.r; totalG += p.g; totalB += p.b; totalCount++;
        double d = math.sqrt((x - cx) * (x - cx) + (y - cy) * (y - cy));
        if (d < centerRadius) { centerR += p.r; centerG += p.g; centerB += p.b; centerCount++; }
      }
    }
    double avgR = totalCount > 0 ? totalR / totalCount : 0, avgG = totalCount > 0 ? totalG / totalCount : 0, avgB = totalCount > 0 ? totalB / totalCount : 0;
    double cR = centerCount > 0 ? centerR / centerCount : 0, cG = centerCount > 0 ? centerG / centerCount : 0, cB = centerCount > 0 ? centerB / centerCount : 0;
    double maxC = [avgR, avgG, avgB].reduce(math.max), minC = [avgR, avgG, avgB].reduce(math.min);
    double saturation = maxC > 0 ? (maxC - minC) / maxC : 0;
    double maxCC = [cR, cG, cB].reduce(math.max), minCC = [cR, cG, cB].reduce(math.min);
    double centerSaturation = maxCC > 0 ? (maxCC - minCC) / maxCC : 0;
    return {'avgR': avgR, 'avgG': avgG, 'avgB': avgB, 'saturation': saturation, 'centerSaturation': centerSaturation};
  }

  bool _checkEdgeDensity(List<List<int>> gray, int w, int h) {
    int horizontalEdges = 0, verticalEdges = 0, circularEdges = 0;
    for (int y = 1; y < h - 1; y += 5) {
      for (int x = 1; x < w - 1; x += 5) {
        if ((gray[y][x + 1] - gray[y][x - 1]).abs() > 30) horizontalEdges++;
        if ((gray[y + 1][x] - gray[y - 1][x]).abs() > 30) verticalEdges++;
      }
    }
    int cx = w ~/ 2, cy = h ~/ 2;
    for (int r = (w * 0.1).round(); r < (w * 0.4).round(); r += 10) {
      for (int a = 0; a < 360; a += 20) {
        double rad = a * math.pi / 180;
        int x1 = (cx + (r - 3) * math.cos(rad)).round().clamp(1, w - 2), y1 = (cy + (r - 3) * math.sin(rad)).round().clamp(1, h - 2);
        int x2 = (cx + (r + 3) * math.cos(rad)).round().clamp(1, w - 2), y2 = (cy + (r + 3) * math.sin(rad)).round().clamp(1, h - 2);
        if ((gray[y2][x2] - gray[y1][x1]).abs() > 20) circularEdges++;
      }
    }
    int totalRectEdges = horizontalEdges + verticalEdges;
    if (totalRectEdges == 0) return circularEdges > 10;
    return circularEdges / totalRectEdges > 0.25 && totalRectEdges < (w * h / 100);
  }

  String _getCheckDescription(String checkName) {
    switch (checkName) {
      case 'aspectRatio': return 'aspect ratio';
      case 'hasCircle': return 'circular iris boundary';
      case 'hasDarkCenter': return 'dark pupil center';
      case 'hasTexture': return 'iris texture patterns';
      case 'hasConcentricCircles': return 'pupil-iris structure';
      case 'colorDistribution': return 'natural eye colors';
      case 'edgeDensity': return 'edge pattern';
      default: return checkName;
    }
  }
}

// ============================================================================
// IMAGE COMPRESSOR (unchanged)
// ============================================================================

class ImageCompressor {
  static const int highQuality = 95, mediumQuality = 90, lowQuality = 80;
  static const int largeWidth = 2000, mediumWidth = 1600, smallWidth = 1200;

  static Future<Uint8List> compressForPdf(File imageFile, {int maxWidth = 2000, int quality = 85}) async {
    final bytes = await imageFile.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return bytes;
    img.Image resized = image.width > maxWidth ? img.copyResize(image, width: maxWidth, interpolation: img.Interpolation.linear) : image;
    return Uint8List.fromList(img.encodeJpg(resized, quality: quality));
  }

  static Uint8List compressBytes(Uint8List bytes, {int maxWidth = 1600, int quality = 92}) {
    final image = img.decodeImage(bytes);
    if (image == null) return bytes;
    img.Image resized = image.width > maxWidth ? img.copyResize(image, width: maxWidth, interpolation: img.Interpolation.linear) : image;
    return Uint8List.fromList(img.encodeJpg(resized, quality: quality));
  }

  static Future<Uint8List> compressHighQuality(File f) => compressForPdf(f, maxWidth: largeWidth, quality: highQuality);
  static Future<Uint8List> compressMediumQuality(File f) => compressForPdf(f, maxWidth: mediumWidth, quality: mediumQuality);
  static Future<Uint8List> compressLowQuality(File f) => compressForPdf(f, maxWidth: smallWidth, quality: lowQuality);
}

// ============================================================================
// END OF pupil_analyzer_fixed.dart v5.3.0
// ============================================================================