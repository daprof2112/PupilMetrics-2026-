// lib/therapy/chiropractic_data.dart
// Static spinal segment data for the chiropractic iris-zone module.
//
// Spinal segment–organ–symptom relationships are drawn from:
//   • Winsor H. "Sympathetic segmental disturbances" Medical Times, 1921
//   • Cleveland CS. The Chiropractic Nerve/Organ Chart, Cleveland Chiropractic College
//   • Palmer DD / Palmer BJ. Textbook of Chiropractic Principles
//   • Jensen B. Iridology: The Science and Practice in the Healing Arts (Vol.I)
//   • Angerer J. Handbook of Iris Diagnosis
//
// Pupillary-border zone → spinal column mapping follows iridology convention:
//   12 o'clock (upper)  → upper cervical (C1–C4)
//   Moving toward 6     → descending the spine
//   6 o'clock (lower)   → lumbar / sacral

class SpinalSegmentData {
  /// Human-readable label, e.g. "Upper Cervical C1–C4"
  final String segmentLabel;

  /// Individual vertebrae, e.g. ["C1","C2","C3","C4"]
  final List<String> vertebrae;

  /// Nerve roots exiting at this level
  final List<String> nerveRoots;

  /// Organs/tissues innervated (from classic nerve-organ charts)
  final List<String> innervatedStructures;

  /// Classic subluxation symptoms at this level
  final List<String> subluxationSymptoms;

  /// Muscles commonly affected by nerve compromise at this level
  final List<String> affectedMuscles;

  /// Standard chiropractic approaches for this region
  final List<String> adjustingApproach;

  /// Corrective exercises / stretches / lifestyle recommendations
  final List<String> exercises;

  /// Postural / ergonomic notes
  final String posturalNote;

  const SpinalSegmentData({
    required this.segmentLabel,
    required this.vertebrae,
    required this.nerveRoots,
    required this.innervatedStructures,
    required this.subluxationSymptoms,
    required this.affectedMuscles,
    required this.adjustingApproach,
    required this.exercises,
    required this.posturalNote,
  });
}

// ── Zone → segment map ────────────────────────────────────────────────────────
// Key = iris zone name (matches pupil_analyzer_fixed.dart zone conventions).
// Both eyes map to the SAME spinal column (spine is midline).

const Map<String, SpinalSegmentData> kChiropracticZoneMap = {

  // ─ 12 o'clock — Upper Cervical ────────────────────────────────────────────
  'upper-central': SpinalSegmentData(
    segmentLabel: 'Upper Cervical  C1 – C4',
    vertebrae: ['C1 (Atlas)', 'C2 (Axis)', 'C3', 'C4'],
    nerveRoots: ['Suboccipital (C1)', 'Greater occipital (C2)', 'C3–C4'],
    innervatedStructures: [
      'Brain & meninges (blood supply)',
      'Pituitary gland',
      'Scalp & facial bones',
      'Inner & middle ear',
      'Sinuses & eyes',
      'Sympathetic chain (cervical ganglia)',
    ],
    subluxationSymptoms: [
      'Headaches & migraines',
      'Dizziness / vertigo',
      'Insomnia & sleep disturbance',
      'High blood pressure',
      'Chronic fatigue',
      'Sinus congestion',
      'Ear pain / tinnitus',
      'Eye pressure / blurred vision',
    ],
    affectedMuscles: [
      'Suboccipital group (rectus capitis, obliquus)',
      'Sternocleidomastoid',
      'Upper trapezius',
      'Splenius capitis',
    ],
    adjustingApproach: [
      'Atlas (C1) specific adjustment — toggle-recoil or knee-chest',
      'Axis (C2) rotary break adjustment',
      'Upper cervical soft-tissue work (suboccipital release)',
      'Cranio-sacral technique for dural tension',
    ],
    exercises: [
      'Chin tucks — 3 sets × 10 reps, seated',
      'Suboccipital self-release: fingertip pressure at base of skull, 60–90 s',
      'Cervical isometric holds: forward/back/lateral, 5 s each',
      'Supine head-lift (longus colli strengthening)',
      'Avoid prolonged forward-head posture (phones, screens)',
      'Sleep on a cervical support pillow (avoid thick pillows)',
    ],
    posturalNote:
        'Forward-head posture adds up to 10 lbs of extra load per inch '
        'of anterior displacement. Ear should align over the shoulder.',
  ),

  // ─ 10-11 / 1-2 o'clock — Mid-Lower Cervical ──────────────────────────────
  'upper-temporal': SpinalSegmentData(
    segmentLabel: 'Mid–Lower Cervical  C5 – C7',
    vertebrae: ['C5', 'C6', 'C7'],
    nerveRoots: ['C5 (axillary)', 'C6 (musculocutaneous)', 'C7 (radial)'],
    innervatedStructures: [
      'Shoulder & rotator cuff',
      'Deltoid & biceps (C5)',
      'Wrist extensors (C6)',
      'Triceps & hand extensors (C7)',
      'Tonsils & pharynx',
      'Thyroid gland (C5–C6)',
    ],
    subluxationSymptoms: [
      'Neck pain & stiffness',
      'Shoulder pain / rotator cuff dysfunction',
      'Upper arm & elbow pain',
      'Tingling or numbness in hands',
      'Thyroid dysfunction',
      'Tonsillitis / throat infections',
      'Bursitis of the shoulder',
    ],
    affectedMuscles: [
      'Deltoid, supraspinatus, infraspinatus',
      'Biceps brachii, brachialis',
      'Triceps, extensor carpi radialis',
      'Levator scapulae, rhomboids',
    ],
    adjustingApproach: [
      'Cervical lateral break adjustment C5–C7',
      'Diversified or Gonstead cervical technique',
      'Prone cervical roll technique',
      'Shoulder mobilization / Codman pendulum exercises',
    ],
    exercises: [
      'Doorway chest stretch: 30 s × 3 sets',
      'Cervical lateral stretch: ear to shoulder, hold 20 s each side',
      'Shoulder blade squeezes (scapular retraction): 15 reps × 3',
      'Wall angels: 10 slow reps',
      'Rotator cuff external rotation with resistance band',
      'Ergonomic: monitor at eye level, keyboard at elbow height',
    ],
    posturalNote:
        'Rounded-shoulder posture (kyphosis) loads C5–C7 and compresses '
        'the brachial plexus. Keep shoulder blades back and down.',
  ),

  'upper-nasal': SpinalSegmentData(
    segmentLabel: 'Mid–Lower Cervical  C5 – C7',
    vertebrae: ['C5', 'C6', 'C7'],
    nerveRoots: ['C5 (axillary)', 'C6 (musculocutaneous)', 'C7 (radial)'],
    innervatedStructures: [
      'Shoulder & rotator cuff',
      'Deltoid & biceps (C5)',
      'Wrist extensors (C6)',
      'Triceps & hand extensors (C7)',
      'Tonsils & pharynx',
      'Thyroid gland (C5–C6)',
    ],
    subluxationSymptoms: [
      'Neck pain & stiffness',
      'Shoulder pain / rotator cuff dysfunction',
      'Upper arm & elbow pain',
      'Tingling or numbness in hands',
      'Thyroid dysfunction',
      'Tonsillitis / throat infections',
      'Bursitis of the shoulder',
    ],
    affectedMuscles: [
      'Deltoid, supraspinatus, infraspinatus',
      'Biceps brachii, brachialis',
      'Triceps, extensor carpi radialis',
      'Levator scapulae, rhomboids',
    ],
    adjustingApproach: [
      'Cervical lateral break adjustment C5–C7',
      'Diversified or Gonstead cervical technique',
      'Prone cervical roll technique',
      'Shoulder mobilization / Codman pendulum exercises',
    ],
    exercises: [
      'Doorway chest stretch: 30 s × 3 sets',
      'Cervical lateral stretch: ear to shoulder, hold 20 s each side',
      'Shoulder blade squeezes (scapular retraction): 15 reps × 3',
      'Wall angels: 10 slow reps',
      'Rotator cuff external rotation with resistance band',
      'Ergonomic: monitor at eye level, keyboard at elbow height',
    ],
    posturalNote:
        'Rounded-shoulder posture (kyphosis) loads C5–C7 and compresses '
        'the brachial plexus. Keep shoulder blades back and down.',
  ),

  // ─ 9 / 3 o'clock — Upper Thoracic ────────────────────────────────────────
  'middle-temporal': SpinalSegmentData(
    segmentLabel: 'Upper Thoracic  T1 – T6',
    vertebrae: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6'],
    nerveRoots: ['T1–T6 anterior & posterior rami', 'Intercostal nerves 1–6'],
    innervatedStructures: [
      'Heart & coronary arteries (T1–T5)',
      'Lungs, bronchial tubes & pleura (T2–T5)',
      'Esophagus & trachea (T1–T2)',
      'Breast & mammary glands (T4–T5)',
      'Upper thoracic musculature',
    ],
    subluxationSymptoms: [
      'Mid-upper back pain & stiffness',
      'Chest tightness / chest pain',
      'Difficulty breathing / asthma',
      'Heart palpitations (T1–T4)',
      'Bronchitis / persistent cough',
      'Intercostal neuralgia',
      'Breast tenderness',
    ],
    affectedMuscles: [
      'Rhomboids major & minor',
      'Middle & lower trapezius',
      'Serratus anterior',
      'Intercostal muscles',
      'Erector spinae (thoracic)',
    ],
    adjustingApproach: [
      'Prone thoracic drop technique (T1–T6)',
      'Diversified thoracic P–A adjustment',
      'Double-thenar thoracic adjustment',
      'Rib mobilization for costovertebral fixations',
      'Activator technique for sensitive patients',
    ],
    exercises: [
      'Thoracic foam roller extension: 45–60 s over each segment',
      'Cat-cow mobility: 10 cycles, slow breathing',
      'Doorway pectoral stretch: 30 s × 3',
      'Prone cobra (thoracic extension): 10 reps × 3',
      'Deep breathing / diaphragmatic breathing: 5 min daily',
      'Avoid prolonged sitting — stand/move every 30–45 min',
    ],
    posturalNote:
        'Thoracic kyphosis ("hunchback") is the most common postural '
        'cause of T1–T6 subluxation. Strengthen mid-back extensors, '
        'open chest musculature.',
  ),

  'middle-nasal': SpinalSegmentData(
    segmentLabel: 'Upper Thoracic  T1 – T6',
    vertebrae: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6'],
    nerveRoots: ['T1–T6 anterior & posterior rami', 'Intercostal nerves 1–6'],
    innervatedStructures: [
      'Heart & coronary arteries (T1–T5)',
      'Lungs, bronchial tubes & pleura (T2–T5)',
      'Esophagus & trachea (T1–T2)',
      'Breast & mammary glands (T4–T5)',
      'Upper thoracic musculature',
    ],
    subluxationSymptoms: [
      'Mid-upper back pain & stiffness',
      'Chest tightness / chest pain',
      'Difficulty breathing / asthma',
      'Heart palpitations (T1–T4)',
      'Bronchitis / persistent cough',
      'Intercostal neuralgia',
      'Breast tenderness',
    ],
    affectedMuscles: [
      'Rhomboids major & minor',
      'Middle & lower trapezius',
      'Serratus anterior',
      'Intercostal muscles',
      'Erector spinae (thoracic)',
    ],
    adjustingApproach: [
      'Prone thoracic drop technique (T1–T6)',
      'Diversified thoracic P–A adjustment',
      'Double-thenar thoracic adjustment',
      'Rib mobilization for costovertebral fixations',
      'Activator technique for sensitive patients',
    ],
    exercises: [
      'Thoracic foam roller extension: 45–60 s over each segment',
      'Cat-cow mobility: 10 cycles, slow breathing',
      'Doorway pectoral stretch: 30 s × 3',
      'Prone cobra (thoracic extension): 10 reps × 3',
      'Deep breathing / diaphragmatic breathing: 5 min daily',
      'Avoid prolonged sitting — stand/move every 30–45 min',
    ],
    posturalNote:
        'Thoracic kyphosis ("hunchback") is the most common postural '
        'cause of T1–T6 subluxation. Strengthen mid-back extensors, '
        'open chest musculature.',
  ),

  // ─ 7-8 / 4-5 o'clock — Lower Thoracic ───────────────────────────────────
  'lower-temporal': SpinalSegmentData(
    segmentLabel: 'Lower Thoracic  T7 – T12',
    vertebrae: ['T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
    nerveRoots: ['Intercostal nerves 7–12', 'Subcostal nerve (T12)'],
    innervatedStructures: [
      'Liver & gallbladder (T7–T9)',
      'Stomach (T6–T9)',
      'Pancreas & spleen (T7–T8)',
      'Adrenal glands (T9–T10)',
      'Kidneys (T10–L1)',
      'Small intestine (T9–T11)',
    ],
    subluxationSymptoms: [
      'Mid-lower back pain',
      'Liver / gallbladder dysfunction',
      'Digestive disorders, bloating, indigestion',
      'Blood sugar dysregulation',
      'Adrenal fatigue / chronic stress response',
      'Kidney dysfunction',
      'Intercostal pain / side stitches',
    ],
    affectedMuscles: [
      'Lower erector spinae (iliocostalis, longissimus)',
      'Quadratus lumborum (upper fibers)',
      'Latissimus dorsi (lower attachment)',
      'Diaphragm (T7–T12)',
    ],
    adjustingApproach: [
      'Prone thoracolumbar P–A adjustment T7–T12',
      'Side-posture lumbar roll (thoracolumbar junction)',
      'Diversified T–L junction adjustment',
      'Soft-tissue release — QL and erector spinae',
    ],
    exercises: [
      'Side-lying thoracic rotation stretch: 30 s each side',
      'Seated trunk rotation: 20 reps each direction',
      'Thoracolumbar foam roller: roll T8–L1 slowly',
      'Bird-dog: 10 reps × 3 (core stability)',
      'Hip flexor stretch (psoas): 30 s each side',
      'Avoid bending + twisting simultaneously (common injury mechanism)',
    ],
    posturalNote:
        'The thoracolumbar junction (T12–L1) is a common fixation site '
        'due to the transition from a rigid thoracic to a mobile lumbar '
        'segment. Pay attention to asymmetric load (bags on one shoulder).',
  ),

  'lower-nasal': SpinalSegmentData(
    segmentLabel: 'Lower Thoracic  T7 – T12',
    vertebrae: ['T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
    nerveRoots: ['Intercostal nerves 7–12', 'Subcostal nerve (T12)'],
    innervatedStructures: [
      'Liver & gallbladder (T7–T9)',
      'Stomach (T6–T9)',
      'Pancreas & spleen (T7–T8)',
      'Adrenal glands (T9–T10)',
      'Kidneys (T10–L1)',
      'Small intestine (T9–T11)',
    ],
    subluxationSymptoms: [
      'Mid-lower back pain',
      'Liver / gallbladder dysfunction',
      'Digestive disorders, bloating, indigestion',
      'Blood sugar dysregulation',
      'Adrenal fatigue / chronic stress response',
      'Kidney dysfunction',
      'Intercostal pain / side stitches',
    ],
    affectedMuscles: [
      'Lower erector spinae (iliocostalis, longissimus)',
      'Quadratus lumborum (upper fibers)',
      'Latissimus dorsi (lower attachment)',
      'Diaphragm (T7–T12)',
    ],
    adjustingApproach: [
      'Prone thoracolumbar P–A adjustment T7–T12',
      'Side-posture lumbar roll (thoracolumbar junction)',
      'Diversified T–L junction adjustment',
      'Soft-tissue release — QL and erector spinae',
    ],
    exercises: [
      'Side-lying thoracic rotation stretch: 30 s each side',
      'Seated trunk rotation: 20 reps each direction',
      'Thoracolumbar foam roller: roll T8–L1 slowly',
      'Bird-dog: 10 reps × 3 (core stability)',
      'Hip flexor stretch (psoas): 30 s each side',
      'Avoid bending + twisting simultaneously (common injury mechanism)',
    ],
    posturalNote:
        'The thoracolumbar junction (T12–L1) is a common fixation site '
        'due to the transition from a rigid thoracic to a mobile lumbar '
        'segment. Pay attention to asymmetric load (bags on one shoulder).',
  ),

  // ─ 6 o'clock — Lumbar / Sacral ───────────────────────────────────────────
  'lower-basal': SpinalSegmentData(
    segmentLabel: 'Lumbar & Sacral  L1 – S3',
    vertebrae: ['L1', 'L2', 'L3', 'L4', 'L5', 'S1', 'S2', 'S3'],
    nerveRoots: [
      'L1–L2 (iliohypogastric, ilioinguinal)',
      'L3–L4 (femoral, obturator)',
      'L4–L5–S1 (sciatic nerve)',
      'S2–S3 (pudendal)',
    ],
    innervatedStructures: [
      'Large intestine & colon (L1–L2)',
      'Bladder & uterus (L3–S2)',
      'Prostate / reproductive organs (L3–S2)',
      'Sciatic nerve & entire lower limb (L4–S1)',
      'Rectum & anus (S2–S4)',
      'Leg & foot muscles',
    ],
    subluxationSymptoms: [
      'Low back pain (most common)',
      'Sciatica — pain radiating down leg',
      'Disc herniation symptoms (L4–L5, L5–S1)',
      'Bladder / urinary dysfunction',
      'Reproductive system dysfunction',
      'Hip pain & sacroiliac dysfunction',
      'Leg cramps, cold feet, poor circulation in legs',
      'Constipation / irritable bowel',
    ],
    affectedMuscles: [
      'Multifidus & lumbar erector spinae',
      'Quadratus lumborum',
      'Psoas major (hip flexor)',
      'Piriformis (L5–S1 compression)',
      'Gluteus maximus, medius, minimus',
      'Hamstrings, quadriceps',
    ],
    adjustingApproach: [
      'Side-posture lumbar roll (standard diversified)',
      'Gonstead lumbar adjustment (specific disc level)',
      'Cox flexion-distraction technique (disc problems)',
      'Sacroiliac joint adjustment (PI ilium / AS ilium)',
      'Thompson drop-table technique for lumbo-sacral',
    ],
    exercises: [
      'Knee-to-chest stretch: hold 30 s × 3 each side',
      'Piriformis / figure-4 stretch: 45 s each side',
      'Dead bug core: 10 reps × 3 (protect disc)',
      'McGill "Big 3": curl-up, side-plank, bird-dog',
      'Hip flexor lunge stretch: 30 s each side',
      'Walking 20–30 min daily (best general lumbar rehabilitation)',
      'Swimming or aquatic therapy for acute disc issues',
    ],
    posturalNote:
        'Anterior pelvic tilt (tight hip flexors + weak glutes) is a '
        'leading cause of lumbar subluxation. Sitting >6 h/day is a '
        'major risk factor — use a lumbar support or sit-stand desk.',
  ),
};
