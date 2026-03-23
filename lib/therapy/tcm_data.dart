// lib/therapy/tcm_data.dart
// Traditional Chinese Medicine (TCM) iris zone data.
//
// Sources drawn upon:
//   • Maciocia G. "The Foundations of Chinese Medicine" (2nd ed., 2005)
//   • Deadman P, Al-Khafaji M. "A Manual of Acupuncture" (2007)
//   • Flaws B. "The Secret of Chinese Pulse Diagnosis" (Blue Poppy Press)
//   • Pitchford P. "Healing with Whole Foods — Asian Traditions & Modern Nutrition"
//   • WHO Standard Acupuncture Point Locations (2008)
//   • Lu H. "Chinese Natural Cures" (Sterling Publishing)
//   • Jilin University / Shanghai College of TCM compiled texts
//
// Five Elements: Wood · Fire · Earth · Metal · Water
// Organ pairs:   Liver/GB · Heart-PC/SI-TW · Spleen/ST · Lung/LI · Kidney/BL

// ── Five Element colors (hex values) ─────────────────────────────────────────
// Use these with Color(0xFF______) in the UI layer.
class TcmElement {
  final String name;
  final int colorHex;
  final String season;
  final String climate;
  final String taste;
  final String emotion;
  final String sensoryOrgan;
  final String color;       // TCM color correspondence

  const TcmElement({
    required this.name,
    required this.colorHex,
    required this.season,
    required this.climate,
    required this.taste,
    required this.emotion,
    required this.sensoryOrgan,
    required this.color,
  });

  static const wood = TcmElement(
    name: 'Wood', colorHex: 0xFF388E3C,
    season: 'Spring', climate: 'Wind',
    taste: 'Sour', emotion: 'Anger / Frustration',
    sensoryOrgan: 'Eyes', color: 'Green',
  );
  static const fire = TcmElement(
    name: 'Fire', colorHex: 0xFFD32F2F,
    season: 'Summer', climate: 'Heat',
    taste: 'Bitter', emotion: 'Joy / Anxiety',
    sensoryOrgan: 'Tongue', color: 'Red',
  );
  static const earth = TcmElement(
    name: 'Earth', colorHex: 0xFFF9A825,
    season: 'Late Summer', climate: 'Dampness',
    taste: 'Sweet', emotion: 'Worry / Overthinking',
    sensoryOrgan: 'Mouth', color: 'Yellow',
  );
  static const metal = TcmElement(
    name: 'Metal', colorHex: 0xFF78909C,
    season: 'Autumn', climate: 'Dryness',
    taste: 'Pungent / Spicy', emotion: 'Grief / Sadness',
    sensoryOrgan: 'Nose', color: 'White',
  );
  static const water = TcmElement(
    name: 'Water', colorHex: 0xFF1565C0,
    season: 'Winter', climate: 'Cold',
    taste: 'Salty', emotion: 'Fear / Will-power',
    sensoryOrgan: 'Ears', color: 'Blue / Black',
  );
}

// ── TCM Imbalance Pattern ─────────────────────────────────────────────────────
class TcmPattern {
  final String name;
  final List<String> symptoms;
  final List<String> classicFormulas; // classic herbal formula names
  final List<String> acupoints;       // key points for this pattern

  const TcmPattern({
    required this.name,
    required this.symptoms,
    required this.classicFormulas,
    required this.acupoints,
  });
}

// ── TCM Organ Zone Data ───────────────────────────────────────────────────────
class TcmZoneData {
  final String primaryOrgan;
  final String pairedOrgan;
  final TcmElement element;
  final String yinYang;         // 'Yin' or 'Yang' (for primary organ)
  final String organClockTime;  // peak 2-hour energy window
  final String meridianAbbr;    // e.g. 'LV', 'HT', 'KD'
  final List<String> meridianFunctions;
  final List<String> governsTissue;  // body tissues governed
  final List<TcmPattern> patterns;
  final List<String> keyAcupoints;  // top acupressure/acupoints with descriptions
  final List<String> tonifyingFoods;
  final List<String> avoidFoods;
  final String herbalCategory;    // brief note on herbal direction
  final String clinicalNote;

  const TcmZoneData({
    required this.primaryOrgan,
    required this.pairedOrgan,
    required this.element,
    required this.yinYang,
    required this.organClockTime,
    required this.meridianAbbr,
    required this.meridianFunctions,
    required this.governsTissue,
    required this.patterns,
    required this.keyAcupoints,
    required this.tonifyingFoods,
    required this.avoidFoods,
    required this.herbalCategory,
    required this.clinicalNote,
  });
}

// =============================================================================
// TCM ZONE MAP — iris zone name → TcmZoneData
// Both eyes share the same organ-clock framework (bilateral meridians);
// the few zone differences (Heart on left, Lung R vs L) are noted below.
// =============================================================================

const Map<String, TcmZoneData> kTcmZoneMap = {

  // ─ 12 o'clock — Brain / Shen ─────────────────────────────────────────────
  'upper-central': TcmZoneData(
    primaryOrgan: 'Heart (Shen)',
    pairedOrgan: 'Small Intestine',
    element: TcmElement.fire,
    yinYang: 'Yin',
    organClockTime: '11:00 AM – 1:00 PM',
    meridianAbbr: 'HT',
    meridianFunctions: [
      'Houses the Shen (mind, consciousness, spirit)',
      'Governs Blood and the Blood vessels',
      'Manifests in the complexion',
      'Controls sweat (Blood and fluids share a common source)',
      'Opens into the Tongue — speech, taste, color reflect Heart health',
    ],
    governsTissue: ['Blood vessels', 'Complexion', 'Tongue'],
    patterns: [
      TcmPattern(
        name: 'Heart Qi Deficiency',
        symptoms: ['Palpitations', 'Shortness of breath on exertion', 'Fatigue', 'Spontaneous sweating', 'Pale face'],
        classicFormulas: ['Gui Pi Tang (Restore the Spleen)', 'Yang Xin Tang'],
        acupoints: ['HT7 Shenmen', 'PC6 Neiguan', 'RN17 Shanzhong'],
      ),
      TcmPattern(
        name: 'Heart Blood Deficiency',
        symptoms: ['Palpitations', 'Insomnia', 'Vivid dreams', 'Poor memory', 'Anxiety', 'Dull complexion'],
        classicFormulas: ['Gui Pi Tang', 'Tian Wang Bu Xin Dan'],
        acupoints: ['HT7', 'BL15 Xinshu', 'SP6 Sanyinjiao'],
      ),
      TcmPattern(
        name: 'Heart Fire Blazing',
        symptoms: ['Palpitations', 'Insomnia', 'Red face', 'Thirst', 'Mouth ulcers', 'Dark urine', 'Agitation'],
        classicFormulas: ['Zhu Sha An Shen Wan', 'Dao Chi San'],
        acupoints: ['HT8 Shaofu', 'HT7', 'KD6 Zhaohai'],
      ),
      TcmPattern(
        name: 'Heart Yin Deficiency',
        symptoms: ['Palpitations', 'Insomnia', 'Night sweats', 'Low-grade fever', 'Dry mouth', 'Five-center heat'],
        classicFormulas: ['Tian Wang Bu Xin Dan', 'Zhi Bai Di Huang Wan'],
        acupoints: ['HT6 Yinxi', 'KD6', 'SP6'],
      ),
    ],
    keyAcupoints: [
      'HT7 Shenmen — wrist crease, ulnar side; calms the mind, nourishes Heart Blood',
      'PC6 Neiguan — 2 cun above wrist, between tendons; opens chest, calms palpitations',
      'BL15 Xinshu — 1.5 cun lateral to T5 spinous process; back-shu of Heart',
      'RN14 Juque — 6 cun above umbilicus; front-mu of Heart',
      'SP6 Sanyinjiao — 3 cun above medial malleolus; nourishes Yin, calms mind',
    ],
    tonifyingFoods: [
      'Longan (dragon eye) fruit', 'Jujube red dates', 'Hawthorn berries',
      'Bitter greens (endive, dandelion)', 'Goji berries', 'Lotus seeds',
      'Dark leafy greens', 'Oats', 'Almonds', 'Rose petals (rose tea)',
    ],
    avoidFoods: ['Excessive coffee / stimulants', 'Spicy foods (when Heart Fire)', 'Alcohol', 'Refined sugar'],
    herbalCategory: 'Heart-calming (An Shen) & Blood-nourishing (Bu Xue) herbs',
    clinicalNote:
        'In TCM the brain (Nao) is the "Sea of Marrow" governed by the Kidney, '
        'but all mental-emotional functions (Shen) reside in the Heart. '
        'Upper-central iris findings often reflect the Heart–Kidney axis.',
  ),

  // ─ Mid-temporal RIGHT / upper-temporal LEFT — Lung ───────────────────────
  'middle-temporal': TcmZoneData(
    primaryOrgan: 'Lung',
    pairedOrgan: 'Large Intestine',
    element: TcmElement.metal,
    yinYang: 'Yin',
    organClockTime: '3:00 AM – 5:00 AM',
    meridianAbbr: 'LU',
    meridianFunctions: [
      'Governs Qi and controls respiration — the "Canopy" of organs',
      'Controls the diffusion and descent of Qi and body fluids',
      'Regulates the Water passages (water metabolism)',
      'Governs the skin and body hair — first line of defense (Wei Qi)',
      'Opens into the nose — Lung health shows in nasal passages',
    ],
    governsTissue: ['Skin & body hair', 'Nose', 'Mucous membranes'],
    patterns: [
      TcmPattern(
        name: 'Lung Qi Deficiency',
        symptoms: ['Weak/shallow breathing', 'Weak voice', 'Spontaneous daytime sweating', 'Frequent colds', 'Fatigue', 'Pale face'],
        classicFormulas: ['Bu Fei Tang', 'Yu Ping Feng San (Jade Windscreen)'],
        acupoints: ['LU9 Taiyuan', 'ST36 Zusanli', 'BL13 Feishu'],
      ),
      TcmPattern(
        name: 'Lung Yin Deficiency',
        symptoms: ['Dry cough (little or no phlegm)', 'Dry throat', 'Night sweats', 'Afternoon fever', 'Hoarse voice', 'Blood in sputum'],
        classicFormulas: ['Bai He Gu Jin Tang', 'Yang Yin Qing Fei Tang'],
        acupoints: ['LU9', 'KD6 Zhaohai', 'SP6 Sanyinjiao'],
      ),
      TcmPattern(
        name: 'Wind-Cold Invading Lung',
        symptoms: ['Chills > fever', 'Sneezing', 'Runny nose (clear)', 'Stiff neck', 'Cough', 'No sweating'],
        classicFormulas: ['Ma Huang Tang', 'Gui Zhi Tang'],
        acupoints: ['LU7 Lieque', 'LI4 Hegu', 'BL12 Fengmen'],
      ),
      TcmPattern(
        name: 'Phlegm-Heat in Lung',
        symptoms: ['Cough with yellow/sticky phlegm', 'Chest pain', 'Fever', 'Thirst', 'Constipation'],
        classicFormulas: ['Ma Xing Shi Gan Tang', 'Qing Qi Hua Tan Wan'],
        acupoints: ['LU5 Chize', 'ST40 Fenglong', 'LI11 Quchi'],
      ),
    ],
    keyAcupoints: [
      'LU7 Lieque — 1.5 cun above wrist (radial styloid); opens nose, expels Wind',
      'LU9 Taiyuan — wrist crease radial side; tonifies Lung Qi, source point',
      'LU1 Zhongfu — below clavicle, 6 cun from midline; front-mu of Lung',
      'BL13 Feishu — 1.5 cun lateral to T3; back-shu of Lung',
      'ST40 Fenglong — midpoint of lower leg; resolves Phlegm (all types)',
    ],
    tonifyingFoods: [
      'White pear (moistens Lung)', 'White radish / Daikon', 'Almonds',
      'Lily bulb (Bai He)', 'Honey', 'Tremella mushroom (silver ear)',
      'Coix seed (Job\'s tears)', 'Oats', 'Lotus root', 'Sesame (black & white)',
    ],
    avoidFoods: ['Dairy (creates Phlegm)', 'Raw/cold foods', 'Smoking', 'Excessive pungent spices when Yin deficient'],
    herbalCategory: 'Lung-tonifying (Bu Fei), Phlegm-resolving (Hua Tan), Yin-nourishing herbs',
    clinicalNote:
        'The Lung "Organ Clock" peaks 3–5 AM — waking at this hour regularly '
        'is a classic TCM sign of Lung Qi or Yin deficiency. The Lung-Large '
        'Intestine axis means skin problems often reflect Lung disharmony.',
  ),

  // ─ Upper-temporal RIGHT / upper-nasal LEFT — San Jiao / GB ──────────────
  'upper-temporal': TcmZoneData(
    primaryOrgan: 'Gallbladder',
    pairedOrgan: 'Liver',
    element: TcmElement.wood,
    yinYang: 'Yang',
    organClockTime: '11:00 PM – 1:00 AM',
    meridianAbbr: 'GB',
    meridianFunctions: [
      'Stores and excretes bile to aid digestion',
      'Governs decision-making and courage ("the general who decides")',
      'Controls the sinews together with the Liver',
      'GB meridian traverses the side of the head/neck/shoulder — governs lateral regions',
      'Closely linked with the Liver in smoothing the flow of Qi',
    ],
    governsTissue: ['Tendons & sinews', 'Nails', 'Eyes (indirect)'],
    patterns: [
      TcmPattern(
        name: 'Liver-Gallbladder Damp-Heat',
        symptoms: ['Jaundice', 'Bitter taste in mouth', 'Hypochondriac pain', 'Nausea', 'Yellow sclerae', 'Dark urine'],
        classicFormulas: ['Long Dan Xie Gan Tang', 'Yin Chen Hao Tang'],
        acupoints: ['GB34 Yanglingquan', 'LV3 Taichong', 'SP9 Yinlingquan'],
      ),
      TcmPattern(
        name: 'GB Qi Stagnation',
        symptoms: ['Indecisiveness', 'Sighing', 'Hypochondriac distension', 'Timidity', 'Nausea', 'Bitter taste'],
        classicFormulas: ['Xiao Chai Hu Tang', 'Chai Hu Shu Gan San'],
        acupoints: ['GB34', 'GB21 Jianjing', 'LV14 Qimen'],
      ),
    ],
    keyAcupoints: [
      'GB34 Yanglingquan — below lateral knee; hui-meeting of sinews, moves GB Qi',
      'GB21 Jianjing — midpoint of shoulder; releases tension, moves stagnation',
      'GB20 Fengchi — below occiput, lateral; expels Wind, clears head/eyes',
      'GB41 Zulinqi — dorsum of foot; opens Dai Mai (belt vessel)',
      'TW5 Waiguan — 2 cun above wrist (dorsal); opens Yang Wei Mai, immune support',
    ],
    tonifyingFoods: [
      'Bitter greens (endive, radicchio)', 'Artichoke', 'Dandelion root tea',
      'Lemon water (morning)', 'Turmeric', 'Beets', 'Olive oil',
      'Mild sour foods (plum, small amounts vinegar)', 'Radish',
    ],
    avoidFoods: ['Fried/greasy foods', 'Alcohol', 'Excessive red meat', 'Heavy dairy'],
    herbalCategory: 'Damp-Heat clearing (Qing Re Li Shi), Qi-moving (Xing Qi) herbs',
    clinicalNote:
        'GB organ clock peaks 11 PM–1 AM — the critical window for the '
        'Liver-GB axis to process the day\'s toxins. Going to sleep before '
        '11 PM is essential for GB health in TCM. Lateral headaches, '
        'migraines, and shoulder tension often indicate GB meridian involvement.',
  ),

  'upper-nasal': TcmZoneData(
    primaryOrgan: 'San Jiao (Triple Warmer)',
    pairedOrgan: 'Pericardium',
    element: TcmElement.fire,
    yinYang: 'Yang',
    organClockTime: '9:00 PM – 11:00 PM',
    meridianAbbr: 'TW',
    meridianFunctions: [
      'Regulates water metabolism across all three body cavities (Upper, Middle, Lower Jiao)',
      'Governs Qi transformation and distribution of Yuan Qi (Source Qi)',
      'Regulates body temperature and coordinates organ communication',
      'Upper Jiao: Heart & Lung (like a mist)',
      'Middle Jiao: Spleen & Stomach (like a foam/ferment)',
      'Lower Jiao: Kidney & Bladder (like a drainage ditch)',
    ],
    governsTissue: ['Entire fascial/connective tissue network', 'Lymphatic system (TCM parallel)'],
    patterns: [
      TcmPattern(
        name: 'San Jiao Qi Stagnation',
        symptoms: ['Bloating throughout the torso', 'Difficulty swallowing', 'Tight chest', 'Difficult urination', 'Restlessness 9–11 PM'],
        classicFormulas: ['Xiao Chai Hu Tang', 'Chai Hu Gui Zhi Tang'],
        acupoints: ['TW5 Waiguan', 'TW6 Zhigou', 'GB34'],
      ),
      TcmPattern(
        name: 'Thyroid/Endocrine Imbalance (TCM: Liver-Kidney)',
        symptoms: ['Goiter / throat swelling', 'Emotional instability', 'Heat or Cold sensitivity', 'Fatigue', 'Weight changes'],
        classicFormulas: ['Xia Ku Cao Gao (goiter)', 'Si Hai Shu Yu Wan'],
        acupoints: ['TW5', 'KD3 Taixi', 'RN22 Tiantu', 'ST9 Renying'],
      ),
    ],
    keyAcupoints: [
      'TW5 Waiguan — 2 cun above dorsal wrist; opens Yang Wei Mai, boosts immunity',
      'TW4 Yangchi — dorsal wrist; tonifies Yuan Qi, source point of San Jiao',
      'TW6 Zhigou — 3 cun above dorsal wrist; moves constipation, lateral rib pain',
      'RN22 Tiantu — sternal notch; throat/thyroid issues',
      'KD3 Taixi — medial ankle; tonifies Kidney Yin and Yang',
    ],
    tonifyingFoods: [
      'Seaweed (kelp, nori — for thyroid/iodine)', 'Nettle tea', 'Barley water',
      'Aduki bean soup', 'Pumpkin seeds', 'Schisandra berry (Wu Wei Zi)',
      'Warm broths and soups', 'Mild spices (cumin, fennel)',
    ],
    avoidFoods: ['Iced/cold drinks', 'Excessive raw food', 'Processed foods with additives'],
    herbalCategory: 'Qi-regulating, Phlegm-softening (Hua Tan San Jie) and Lymph-moving herbs',
    clinicalNote:
        'The San Jiao has no physical counterpart in Western anatomy — it is '
        'understood as the connective tissue/fascial network and the integrated '
        'metabolic function of all organs. TW5 is one of the most important '
        'immune-boosting points in all of acupuncture.',
  ),

  // ─ Lower-temporal RIGHT — Liver / Gallbladder ────────────────────────────
  'lower-temporal': TcmZoneData(
    primaryOrgan: 'Liver',
    pairedOrgan: 'Gallbladder',
    element: TcmElement.wood,
    yinYang: 'Yin',
    organClockTime: '1:00 AM – 3:00 AM',
    meridianAbbr: 'LV',
    meridianFunctions: [
      'Stores and regulates the volume of Blood',
      'Ensures the smooth flow of Qi throughout the body',
      'Governs the tendons, ligaments, and smooth muscle',
      'Opens into the eyes — visual health reflects Liver Blood',
      'Controls the "free-coursing" of emotions — key in stress response',
      'Regulates the menstrual cycle (Blood storage and release)',
    ],
    governsTissue: ['Tendons & ligaments', 'Nails', 'Eyes'],
    patterns: [
      TcmPattern(
        name: 'Liver Qi Stagnation',
        symptoms: ['Hypochondriac / rib-side pain', 'Sighing', 'Irritability', 'Premenstrual tension', 'Distension', 'Throat sensation ("plum pit")'],
        classicFormulas: ['Chai Hu Shu Gan San', 'Xiao Yao San (Free & Easy Wanderer)'],
        acupoints: ['LV3 Taichong', 'LV14 Qimen', 'GB34 Yanglingquan'],
      ),
      TcmPattern(
        name: 'Liver Blood Deficiency',
        symptoms: ['Blurred vision', 'Night blindness', 'Dry eyes', 'Pale/dull nails', 'Scanty periods', 'Numbness in limbs', 'Insomnia'],
        classicFormulas: ['Si Wu Tang (Four Substances)', 'Gui Shao Di Huang Wan'],
        acupoints: ['LV8 Ququan', 'SP6 Sanyinjiao', 'BL18 Ganshu'],
      ),
      TcmPattern(
        name: 'Liver Yang Rising',
        symptoms: ['Headache (temporal/vertex)', 'Dizziness', 'Tinnitus', 'Red face', 'Irritability', 'Hypertension'],
        classicFormulas: ['Tian Ma Gou Teng Yin', 'Long Dan Xie Gan Tang'],
        acupoints: ['LV3', 'GB20 Fengchi', 'KD3 Taixi'],
      ),
      TcmPattern(
        name: 'Liver Fire Blazing',
        symptoms: ['Severe headache', 'Red eyes', 'Bitter taste', 'Constipation', 'Dark urine', 'Explosive anger', 'Tinnitus (like rushing water)'],
        classicFormulas: ['Long Dan Xie Gan Tang', 'Zhi Zi Chi Tang'],
        acupoints: ['LV2 Xingjian', 'GB34', 'LI11 Quchi'],
      ),
    ],
    keyAcupoints: [
      'LV3 Taichong — dorsum of foot between 1st & 2nd metatarsals; #1 Liver point, moves Qi and Blood',
      'LV8 Ququan — medial knee crease; tonifies Liver Blood and Yin',
      'LV14 Qimen — 6th intercostal space, front-mu of Liver',
      'BL18 Ganshu — 1.5 cun lateral to T9; back-shu of Liver',
      'GB20 Fengchi — below occiput; clears Liver Wind, relieves headache',
    ],
    tonifyingFoods: [
      'Dark leafy greens (kale, spinach, chard)', 'Beets (Blood building)',
      'Sour foods: lemon, plum, vinegar (in moderation)', 'Goji berries (Gou Qi Zi)',
      'Chlorophyll-rich sprouts', 'Artichoke', 'Walnuts', 'Flaxseed',
      'Chrysanthemum tea (clears Liver Heat)', 'Green tea',
    ],
    avoidFoods: ['Alcohol (directly damages Liver)', 'Fried/greasy foods', 'Excessive spicy food', 'Refined sugar'],
    herbalCategory: 'Liver-soothing (Shu Gan), Blood-nourishing (Yang Xue), Heat-clearing herbs',
    clinicalNote:
        'Liver organ clock peaks 1–3 AM — waking angry or with a racing mind '
        'at this hour is a classic Liver Qi Stagnation sign. The Liver "likes '
        'movement and dislikes constraint" — regular exercise and emotional '
        'expression are as therapeutic as any herb.',
  ),

  // ─ Lower-basal (6 o'clock) — Kidney / Adrenal ────────────────────────────
  'lower-basal': TcmZoneData(
    primaryOrgan: 'Kidney',
    pairedOrgan: 'Bladder',
    element: TcmElement.water,
    yinYang: 'Yin',
    organClockTime: '5:00 PM – 7:00 PM',
    meridianAbbr: 'KD',
    meridianFunctions: [
      'Stores Essence (Jing) — the root of constitutional vitality',
      'Governs birth, growth, reproduction, and aging',
      'Produces Marrow — fills brain, spinal cord, and bone marrow',
      'Governs water metabolism (with Lung and Bladder)',
      'Grasps the Qi sent down by the Lung (anchors respiration)',
      'Opens into the ears — hearing acuity reflects Kidney health',
      'Governs the bones and lower back',
    ],
    governsTissue: ['Bones & teeth', 'Bone marrow & brain', 'Head hair', 'Ears'],
    patterns: [
      TcmPattern(
        name: 'Kidney Yin Deficiency',
        symptoms: ['Night sweats', 'Five-center heat', 'Dizziness', 'Tinnitus', 'Dry mouth at night', 'Scanty dark urine', 'Weak lower back', 'Premature ejaculation'],
        classicFormulas: ['Liu Wei Di Huang Wan (Six Flavor Rehmannia)', 'Zhi Bai Di Huang Wan'],
        acupoints: ['KD3 Taixi', 'KD6 Zhaohai', 'SP6 Sanyinjiao'],
      ),
      TcmPattern(
        name: 'Kidney Yang Deficiency',
        symptoms: ['Cold limbs and lower back', 'Fatigue', 'Frequent pale urination', 'Impotence', 'Infertility', 'Edema', 'Dawn diarrhea', 'Aversion to cold'],
        classicFormulas: ['Jin Gui Shen Qi Wan (Kidney Qi Pill)', 'You Gui Wan (Restore the Right)'],
        acupoints: ['KD3', 'RN4 Guanyuan', 'DU4 Mingmen'],
      ),
      TcmPattern(
        name: 'Kidney Jing Deficiency',
        symptoms: ['Poor development', 'Premature aging', 'Thinning/greying hair', 'Weak bones/teeth', 'Poor memory', 'Infertility', 'Weak knees'],
        classicFormulas: ['He Shou Wu Wan', 'Gui Lu Er Xian Jiao'],
        acupoints: ['KD3', 'SP6', 'BL23 Shenshu'],
      ),
      TcmPattern(
        name: 'Kidney Qi Deficiency',
        symptoms: ['Frequent urination', 'Urinary incontinence', 'Low back ache', 'Tinnitus', 'Deafness', 'Breathlessness (cannot grasp Qi)'],
        classicFormulas: ['Suo Quan Wan', 'Sang Piao Xiao San'],
        acupoints: ['KD3', 'RN6 Qihai', 'BL23'],
      ),
    ],
    keyAcupoints: [
      'KD3 Taixi — medial ankle between malleolus and Achilles; #1 Kidney point, tonifies Yin and Yang',
      'KD1 Yongquan — plantar surface of foot; grounds and calms, clears Heat rising',
      'KD6 Zhaohai — below medial malleolus; nourishes Yin, benefits eyes and throat',
      'BL23 Shenshu — 1.5 cun lateral to L2; back-shu of Kidney, tonifies Kidney',
      'DU4 Mingmen — below L2 spinous; the "Gate of Life" — warms Kidney Yang',
      'RN4 Guanyuan — 3 cun below umbilicus; nourishes Jing, tonifies Yuan Qi',
    ],
    tonifyingFoods: [
      'Black sesame seeds', 'Black beans', 'Black rice', 'Walnuts',
      'Bone broth (marrow tonifying)', 'Kidney beans', 'Seaweed / kelp',
      'Mulberry (Sang Shen)', 'Chestnuts', 'Lamb (warms Kidney Yang)',
      'Goji berries', 'He Shou Wu (Fo-Ti)', 'Royal jelly',
    ],
    avoidFoods: ['Excessive raw/cold foods', 'Excessive salt', 'Coffee (drains Kidney Qi)', 'Alcohol', 'Refined sugar'],
    herbalCategory: 'Kidney Yin-tonifying (Zi Yin), Yang-warming (Wen Yang), Jing-replenishing herbs',
    clinicalNote:
        'The Kidney is the "Root of Life" in TCM — all other organ functions '
        'depend on Kidney Jing. Adrenal fatigue in Western medicine parallels '
        'Kidney Yang/Qi deficiency in TCM. DU4 (Mingmen) moxa is the classic '
        'treatment for Kidney Yang deficiency with cold signs.',
  ),

  // ─ Lower-nasal RIGHT / lower-nasal LEFT — Bladder / Uterus ──────────────
  'lower-nasal': TcmZoneData(
    primaryOrgan: 'Bladder',
    pairedOrgan: 'Kidney',
    element: TcmElement.water,
    yinYang: 'Yang',
    organClockTime: '3:00 PM – 5:00 PM',
    meridianAbbr: 'BL',
    meridianFunctions: [
      'Stores and excretes urine — transformation of fluids in Lower Jiao',
      'BL meridian covers entire posterior body — longest meridian (67 points)',
      'BL back-shu points access every organ — critical for all organ treatments',
      'Governs the lumbar spine and lower back region',
      'Closely paired with Kidney — shares Water element governance',
    ],
    governsTissue: ['Lower back & lumbar region', 'Entire posterior body (BL meridian)'],
    patterns: [
      TcmPattern(
        name: 'Bladder Damp-Heat',
        symptoms: ['Burning urination', 'Frequent urgent urination', 'Dark/cloudy urine', 'Lower abdominal pain', 'Fever'],
        classicFormulas: ['Ba Zheng San (Eight Herb Powder)', 'Zhu Ling Tang'],
        acupoints: ['BL63 Jinmen', 'SP9 Yinlingquan', 'RN3 Zhongji'],
      ),
      TcmPattern(
        name: 'Uterus Cold / Blood Stasis',
        symptoms: ['Dysmenorrhea with clots', 'Cold lower abdomen', 'Delayed periods', 'Dark menstrual blood', 'Infertility'],
        classicFormulas: ['Wen Jing Tang (Warm the Menses)', 'Shao Fu Zhu Yu Tang'],
        acupoints: ['SP8 Diji', 'SP6', 'BL32 Ciliao', 'RN4'],
      ),
      TcmPattern(
        name: 'Bladder Qi Deficiency',
        symptoms: ['Urinary incontinence', 'Weak urine stream', 'Frequent pale urination', 'Lower back weakness'],
        classicFormulas: ['Suo Quan Wan', 'Sang Piao Xiao San'],
        acupoints: ['BL23 Shenshu', 'RN3 Zhongji', 'KD3'],
      ),
    ],
    keyAcupoints: [
      'BL40 Weizhong — back of knee; master point for lumbar back pain',
      'BL23 Shenshu — 1.5 cun lateral to L2; back-shu of Kidney, lumbar pain',
      'BL32 Ciliao — sacral foramen S2; pelvic/gynecological conditions',
      'RN3 Zhongji — 4 cun below umbilicus; front-mu of Bladder',
      'SP9 Yinlingquan — below medial knee; resolves Dampness',
    ],
    tonifyingFoods: [
      'Cranberry', 'Watermelon (clears Bladder Heat)', 'Adzuki beans',
      'Barley water', 'Corn silk tea', 'Pumpkin seeds', 'Cucumber',
      'Parsley (mild diuretic)', 'Celery',
    ],
    avoidFoods: ['Spicy/hot foods (aggravates Damp-Heat)', 'Alcohol', 'Coffee', 'Cold beverages when Yang deficient'],
    herbalCategory: 'Dampness-clearing (Li Shi), Heat-resolving, Blood-moving (Huo Xue) herbs',
    clinicalNote:
        'The BL meridian\'s 67 points span the entire posterior body including '
        'the Jia Ji points alongside the spine. In clinical practice, the BL '
        'back-shu points (BL13–BL28) are used to treat virtually every organ '
        'system — making BL the most therapeutically versatile meridian.',
  ),

  // ─ Middle-nasal RIGHT — Du Mai / Spine ───────────────────────────────────
  'middle-nasal': TcmZoneData(
    primaryOrgan: 'Du Mai (Governing Vessel)',
    pairedOrgan: 'Ren Mai',
    element: TcmElement.water,
    yinYang: 'Yang',
    organClockTime: 'Extraordinary Vessel — no fixed clock hour',
    meridianAbbr: 'DU',
    meridianFunctions: [
      'Governs all Yang meridians — the "Sea of Yang"',
      'Runs along the spine, over the head, to the upper lip',
      'Nourishes the brain and spinal cord (Sea of Marrow)',
      'Regulates spinal Qi and marrow production',
      'DU4 (Mingmen) — the "Gate of Life" for Kidney Yang',
      'Paired with Ren Mai: together they govern all 12 meridians',
    ],
    governsTissue: ['Spine & vertebral column', 'Brain & spinal cord', 'Posterior midline'],
    patterns: [
      TcmPattern(
        name: 'Du Mai Qi Deficiency (Spinal weakness)',
        symptoms: ['Lower back stiffness/weakness', 'Weak spine', 'Brain fog', 'Lack of willpower', 'Knee weakness', 'Fatigue after mental effort'],
        classicFormulas: ['You Gui Wan', 'Jin Gui Shen Qi Wan', 'He Shou Wu preparations'],
        acupoints: ['DU4 Mingmen', 'DU14 Dazhui', 'KD3 Taixi'],
      ),
      TcmPattern(
        name: 'Du Mai Wind Obstruction',
        symptoms: ['Spinal pain and stiffness', 'Neck tension', 'Posterior headache', 'Convulsions (severe)', 'Stiff back'],
        classicFormulas: ['Juan Bi Tang', 'Du Huo Ji Sheng Wan'],
        acupoints: ['DU14', 'BL12 Fengmen', 'GB20 Fengchi'],
      ),
    ],
    keyAcupoints: [
      'DU4 Mingmen — below L2; "Gate of Life", warms Yang, strengthens spine',
      'DU14 Dazhui — below C7; meeting of all Yang meridians, fever, immunity',
      'DU20 Baihui — top of head; lifts Yang, calms mind, raises prolapse',
      'DU16 Fengfu — below occiput; expels Wind from Du Mai',
      'BL40 Weizhong — back of knee; lumbar/sacral pain master point',
    ],
    tonifyingFoods: [
      'Bone marrow broth', 'Walnuts (kidney-shaped, tonify marrow)',
      'Black sesame seeds', 'He Shou Wu (Fo-Ti)', 'Royal jelly',
      'Deer antler velvet (Lu Rong — strong Yang tonic)', 'Black beans',
      'Chestnuts (tonify Kidney, strengthen knees)',
    ],
    avoidFoods: ['Excessive cold/raw foods', 'Iced beverages', 'Sitting or lying still for long periods'],
    herbalCategory: 'Yang-warming (Wen Yang), Marrow-replenishing, Wind-expelling herbs',
    clinicalNote:
        'The Du Mai is the master of all Yang energy in the body. Moxa on '
        'DU4 (Mingmen) is one of the most powerful Yang-tonifying treatments '
        'in all of acupuncture. DU20 (Baihui) at the crown of the head is '
        'used for both physical conditions (prolapse, headache) and mental '
        'conditions (depression, foggy thinking).',
  ),

  // ─ Lower-temporal LEFT — Spleen / Pancreas ───────────────────────────────
  // Note: This entry is shared with lower-temporal for left eye in engine
  'spleen-earth': TcmZoneData(
    primaryOrgan: 'Spleen',
    pairedOrgan: 'Stomach',
    element: TcmElement.earth,
    yinYang: 'Yin',
    organClockTime: '9:00 AM – 11:00 AM',
    meridianAbbr: 'SP',
    meridianFunctions: [
      'Transforms and transports food essence (Gu Qi) — the "root of post-natal Qi"',
      'Governs the muscles and limbs (muscle tone reflects Spleen health)',
      'Holds Blood in the vessels (keeps blood from extravasating)',
      'Governs the rising of clear Yang to the head',
      'Controls thought (Yi) and the capacity for study',
      'Produces Blood from food essence together with the Heart',
    ],
    governsTissue: ['Muscles & flesh', 'Lips & mouth', 'Four limbs'],
    patterns: [
      TcmPattern(
        name: 'Spleen Qi Deficiency',
        symptoms: ['Fatigue after eating', 'Loose stools', 'Bloating', 'Poor appetite', 'Weak limbs', 'Pallor', 'Prolapse'],
        classicFormulas: ['Si Jun Zi Tang (Four Gentlemen)', 'Bu Zhong Yi Qi Tang'],
        acupoints: ['SP6 Sanyinjiao', 'ST36 Zusanli', 'BL20 Pishu'],
      ),
      TcmPattern(
        name: 'Spleen Damp (Phlegm-Dampness)',
        symptoms: ['Heavy sensation in body', 'Muzzy head', 'Nausea', 'Sticky/sweet taste', 'Loose stools with mucus', 'Obesity', 'Edema'],
        classicFormulas: ['Er Chen Tang (Two-Cured Decoction)', 'Ping Wei San'],
        acupoints: ['SP9 Yinlingquan', 'ST40 Fenglong', 'RN12 Zhongwan'],
      ),
      TcmPattern(
        name: 'Spleen Yang Deficiency',
        symptoms: ['Cold sensation in abdomen', 'Undigested food in stools', 'Cold limbs', 'Edema', 'Watery stools'],
        classicFormulas: ['Li Zhong Wan (Regulate the Middle)', 'Fu Zi Li Zhong Wan'],
        acupoints: ['ST36', 'RN4 Guanyuan', 'BL20', 'SP6'],
      ),
      TcmPattern(
        name: 'Blood Sugar Dysregulation (Xiao Ke / Wasting-Thirst)',
        symptoms: ['Excessive thirst', 'Frequent urination', 'Fatigue', 'Blurred vision', 'Weight changes'],
        classicFormulas: ['Yu Quan Wan', 'Bai Hu Jia Ren Shen Tang'],
        acupoints: ['SP6', 'KD3', 'BL20', 'BL23'],
      ),
    ],
    keyAcupoints: [
      'SP6 Sanyinjiao — 3 cun above medial malleolus; meets Liver, Kidney & Spleen meridians — the most important point for women\'s health',
      'SP9 Yinlingquan — below medial knee; resolves Dampness throughout the body',
      'ST36 Zusanli — 3 cun below lateral knee; the great tonification point for Qi and Blood',
      'BL20 Pishu — 1.5 cun lateral to T11; back-shu of Spleen',
      'RN12 Zhongwan — 4 cun above umbilicus; front-mu of Stomach, tonifies Middle Jiao',
    ],
    tonifyingFoods: [
      'Millet (neutral, tonifies Spleen)', 'Sweet potato & yam',
      'Pumpkin & squash', 'Cooked rice congee (gentle and nourishing)',
      'Ginger (warms Spleen)', 'Dates (Jujube)', 'Coix seed (Yi Yi Ren)',
      'Lentils & chickpeas', 'White fish', 'Moderate sweetness (honey, rice syrup)',
    ],
    avoidFoods: ['Raw/cold foods (weaken Spleen Yang)', 'Ice cream', 'Excessive dairy', 'Greasy/fried foods', 'Excessive refined sugar'],
    herbalCategory: 'Spleen-tonifying (Jian Pi), Dampness-transforming (Hua Shi), Qi-raising herbs',
    clinicalNote:
        'In TCM the Spleen is the central organ of digestion and immune function — '
        'far more important than its Western anatomical counterpart. "The Spleen '
        'likes Dryness and dislikes Dampness" — cold, raw, and greasy foods are '
        'its worst enemies. ST36 moxa is the classic longevity treatment.',
  ),

};

// ── Engine-side lookup helper: map zone+eye to TcmZoneData key ───────────────
// Some zones resolve differently per eye (Heart is L middle-temporal).
// This is handled in chiropractic_engine.dart by using overrides.

String tcmZoneKey(String zoneName, bool isRightEye) {
  // Left middle-temporal = Heart zone (handled by normal map entry)
  // Left lower-temporal = Spleen zone
  if (!isRightEye && zoneName == 'lower-temporal') return 'spleen-earth';
  return zoneName;
}
