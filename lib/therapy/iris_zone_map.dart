// lib/therapy/iris_zone_map.dart
// Maps iris zone names + eye side to organ systems and herbal DB condition keywords.
// Based on: Integrative Iridology Chart — Bryan K. Marcia, Ph.D. (CNRI)
//
// Zone names match those produced by _getZoneNameFromHour() in pupil_analyzer_fixed.dart:
//   upper-central, upper-temporal, middle-temporal, lower-temporal,
//   lower-basal, lower-nasal, middle-nasal, upper-nasal

class IrisZoneOrgan {
  final String displayName;
  final List<String> organs;
  /// Prefix keywords used to match conditions in herbal_database.json
  final List<String> conditionKeywords;

  const IrisZoneOrgan({
    required this.displayName,
    required this.organs,
    required this.conditionKeywords,
  });
}

class IrisZoneMap {
  // ── RIGHT EYE ──────────────────────────────────────────────────────────────
  static const Map<String, IrisZoneOrgan> rightEye = {
    'upper-central': IrisZoneOrgan(
      displayName: 'Upper-Central (12 o\'clock)',
      organs: ['Brain', 'Pituitary', 'Pineal'],
      conditionKeywords: [
        'BRAIN', 'CEREBRAL', 'MEMORY', 'COGNITIVE', 'MENTAL',
        'PITUITARY', 'NEUROLOG', 'NEURALGIA', 'NEURITIS',
        'DEPRESSION', 'ANXIETY', 'FATIGUE', 'HEADACHE', 'MIGRAINE',
        'INSOMNIA', 'CONCENTRATION',
      ],
    ),
    'upper-temporal': IrisZoneOrgan(
      displayName: 'Upper-Temporal (10-11 o\'clock)',
      organs: ['Neck', 'Clavicle', 'Subclavian Artery', 'Carotid'],
      conditionKeywords: [
        'NECK', 'CERVICAL', 'CAROTID', 'VASCULAR', 'LYMPH',
        'HEARING', 'EAR', 'TINNITUS', 'SWALLOWING',
        'CRANIAL NERVE', 'ANEURYSM',
      ],
    ),
    'middle-temporal': IrisZoneOrgan(
      displayName: 'Middle-Temporal (9 o\'clock)',
      organs: ['Lung (R)', 'Pleura', 'Mammary', 'Diaphragm'],
      conditionKeywords: [
        'LUNG', 'PULMONARY', 'BRONCHI', 'ASTHMA', 'RESPIR',
        'PLEURIS', 'EMPHYSEM', 'PNEUMON', 'BREAST', 'MAMMARY',
        'BREATHIN', 'COUGH', 'TUBERCULOSIS', 'OXYGEN',
      ],
    ),
    'lower-temporal': IrisZoneOrgan(
      displayName: 'Lower-Temporal (7-8 o\'clock)',
      organs: ['Liver', 'Gallbladder', 'Portal Vein'],
      conditionKeywords: [
        'LIVER', 'HEPAT', 'GALLBLADDER', 'BILE', 'CHOLESTEROL',
        'JAUNDICE', 'CIRRHOS', 'PORTAL', 'GALL STONE', 'GALLSTONE',
        'CHOLECYST', 'BILIRUBIN',
      ],
    ),
    'lower-basal': IrisZoneOrgan(
      displayName: 'Lower-Basal (6 o\'clock)',
      organs: ['Kidney (R)', 'Adrenal', 'Leg'],
      conditionKeywords: [
        'KIDNEY', 'RENAL', 'NEPHRIT', 'ADRENAL', 'UREMIA',
        'GOUT', 'LEG', 'EDEMA', 'DROPSY', 'LITHIASIS', 'KIDNEY STONE',
      ],
    ),
    'lower-nasal': IrisZoneOrgan(
      displayName: 'Lower-Nasal (4-5 o\'clock)',
      organs: ['Bladder', 'Uterus', 'Prostate', 'Rectum'],
      conditionKeywords: [
        'BLADDER', 'UTERUS', 'UTERINE', 'PROSTATE', 'RECTUM',
        'HAEMORRHOID', 'HEMORRHOID', 'PELVIS', 'URINARY', 'CYSTIT',
        'MENSTRUAT', 'MENOPAUS', 'OVARI', 'FIBROID', 'CERVIX',
      ],
    ),
    'middle-nasal': IrisZoneOrgan(
      displayName: 'Middle-Nasal (3 o\'clock)',
      organs: ['Back', 'Pleura', 'Mediastinum', 'Diaphragm', 'Breast'],
      conditionKeywords: [
        'BACK', 'SPINE', 'SPINAL', 'DISC', 'LUMBAR', 'SCIATICA',
        'VERTEBR', 'DIAPHRAGM', 'MEDIASTIN', 'LUMBAGO', 'SCOLIOSIS',
      ],
    ),
    'upper-nasal': IrisZoneOrgan(
      displayName: 'Upper-Nasal (2 o\'clock)',
      organs: ['Thyroid', 'Esophagus', 'Larynx', 'Eye', 'Nose', 'Ear'],
      conditionKeywords: [
        'THYROID', 'GOITER', 'HYPERTHYR', 'HYPOTHYR', 'THYROX',
        'ESOPHAG', 'LARYNX', 'TONSIL', 'EYE', 'VISION', 'SINUS',
        'NOSE', 'THROAT', 'PHARYNX',
      ],
    ),
  };

  // ── LEFT EYE ───────────────────────────────────────────────────────────────
  static const Map<String, IrisZoneOrgan> leftEye = {
    'upper-central': IrisZoneOrgan(
      displayName: 'Upper-Central (12 o\'clock)',
      organs: ['Brain', 'Pituitary', 'Pineal'],
      conditionKeywords: [
        'BRAIN', 'CEREBRAL', 'MEMORY', 'COGNITIVE', 'MENTAL',
        'PITUITARY', 'NEUROLOG', 'NEURALGIA', 'NEURITIS',
        'DEPRESSION', 'ANXIETY', 'FATIGUE', 'HEADACHE', 'MIGRAINE',
        'INSOMNIA', 'CONCENTRATION',
      ],
    ),
    'upper-temporal': IrisZoneOrgan(
      displayName: 'Upper-Temporal (1-2 o\'clock)',
      organs: ['Eye', 'Nose', 'Ear', 'Thyroid', 'Larynx'],
      conditionKeywords: [
        'EAR', 'HEARING', 'TINNITUS', 'EYE', 'VISION', 'THYROID',
        'GOITER', 'LARYNX', 'THROAT', 'TONSIL', 'SINUS', 'NOSE',
        'PHARYNX', 'HYPERTHYR', 'HYPOTHYR',
      ],
    ),
    'middle-temporal': IrisZoneOrgan(
      displayName: 'Middle-Temporal (3 o\'clock) — Heart',
      organs: ['Heart', 'Liver (L lobe)', 'Pericardium'],
      conditionKeywords: [
        'HEART', 'CARDIAC', 'ANGINA', 'PALPITAT', 'ARTERIOSCLEROSIS',
        'CORONARY', 'MYOCARD', 'ARRHYTHM', 'ENDOCARD', 'CIRCULATION',
        'HYPERTENSION', 'BLOOD PRESSURE', 'CARDIOM', 'TACHYCARD',
      ],
    ),
    'lower-temporal': IrisZoneOrgan(
      displayName: 'Lower-Temporal (4-5 o\'clock)',
      organs: ['Spleen', 'Pancreas', 'Pancreatic Body'],
      conditionKeywords: [
        'SPLEEN', 'PANCREAS', 'PANCREATI', 'DIABETES', 'BLOOD SUGAR',
        'HYPOGLYCEM', 'HYPERGLYCE', 'INSULIN', 'SPLENIC',
        'DAMP COLD SPLEEN', 'SPLEEN DEFIC',
      ],
    ),
    'lower-basal': IrisZoneOrgan(
      displayName: 'Lower-Basal (6 o\'clock)',
      organs: ['Kidney (L)', 'Adrenal', 'Leg'],
      conditionKeywords: [
        'KIDNEY', 'RENAL', 'NEPHRIT', 'ADRENAL', 'UREMIA',
        'GOUT', 'LEG', 'EDEMA', 'DROPSY', 'LITHIASIS', 'KIDNEY STONE',
      ],
    ),
    'lower-nasal': IrisZoneOrgan(
      displayName: 'Lower-Nasal (7-8 o\'clock)',
      organs: ['Rectum', 'Bladder', 'Back', 'Lumbar Spine'],
      conditionKeywords: [
        'RECTUM', 'HAEMORRHOID', 'HEMORRHOID', 'BLADDER', 'CYSTIT',
        'BACK', 'LUMBAR', 'LUMBAGO', 'SCIATICA', 'SACRUM', 'COCCYX',
      ],
    ),
    'middle-nasal': IrisZoneOrgan(
      displayName: 'Middle-Nasal (9 o\'clock) — Lung L',
      organs: ['Lung (L)', 'Mediastinum', 'Diaphragm'],
      conditionKeywords: [
        'LUNG', 'PULMONARY', 'BRONCHI', 'ASTHMA', 'RESPIR',
        'PLEURIS', 'EMPHYSEM', 'PNEUMON', 'BREATHIN', 'COUGH',
        'TUBERCULOSIS', 'OXYGEN', 'DIAPHRAGM', 'MEDIASTIN',
      ],
    ),
    'upper-nasal': IrisZoneOrgan(
      displayName: 'Upper-Nasal (10 o\'clock)',
      organs: ['Neck', 'Clavicle', 'Subclavian', 'Lymphatics'],
      conditionKeywords: [
        'NECK', 'CERVICAL', 'CAROTID', 'VASCULAR', 'LYMPH',
        'CLAVICLE', 'SUBCLAVIAN', 'SHOULDER', 'TINNITUS',
      ],
    ),
  };

  /// Get organ info for a given zone + eye. Returns null for unknown zones.
  static IrisZoneOrgan? get(String zoneName, bool isRightEye) {
    final map = isRightEye ? rightEye : leftEye;
    return map[zoneName];
  }
}
