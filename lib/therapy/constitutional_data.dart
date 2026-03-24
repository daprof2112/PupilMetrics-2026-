// lib/therapy/constitutional_data.dart
// Constitutional Iridology data — Dr. Josef Deck's system
// Based on manuscript by Dr. Bryan K. Marcia / CNRI

class ConstitutionalType {
  final String id;
  final String name;
  final String group;
  final String irisDescription;
  final List<String> predispositions;
  final List<String> homeopathicRemedies;

  const ConstitutionalType({
    required this.id,
    required this.name,
    required this.group,
    required this.irisDescription,
    required this.predispositions,
    required this.homeopathicRemedies,
  });
}

/// All constitutional groups
const kConstitutionalGroups = [
  'Lymphatic',
  'Haematogenic',
  'Biliary / Mixed',
  'Pathological',
  'Syndrome',
  'Pre-Cancerous',
];

/// Full dataset — 34 constitutional types
const List<ConstitutionalType> kConstitutionalTypes = [
  // ── LYMPHATIC ────────────────────────────────────────────────────────────────
  ConstitutionalType(
    id: 'pure_lymphatic',
    name: 'Pure Lymphatic Constitution',
    group: 'Lymphatic',
    irisDescription:
        'Light blue-grey iris with white blood, collarette and lymph region. '
        'Iris fibers are definite, mostly uninterrupted, silk-like or slightly wavy to '
        'somewhat spaced or openly arranged with distinct radials. Pigmentation layer is sparse.',
    predispositions: [
      'Predisposed to catarrhal (mucus) distress from congested lymph',
      'Slight rheumatic tendency with inclination to acute rheumatism',
      'Predisposition to overactive immune system, allergies, over-acidity, lymphatic congestion',
      'Chronic swelling of lymph glands in head and neck; excess mucous production',
      'Prevalent reaction sites: upper respiratory tract, lungs, bronchials, ear, sinus, tonsils',
      'Specific dispositions: allergic reactions, arthritis, rheumatoid disorders, eczema, psoriasis',
      'Inclination to corneal opacity, arteriosclerosis and cardio-renal difficulty',
      'Tendency towards re-absorption of uric acid with accumulation of body fluids',
    ],
    homeopathicRemedies: ['Scrophularia', 'Calcivitan'],
  ),

  ConstitutionalType(
    id: 'neurogenic_sensitive',
    name: 'Neurogenic Sensitive (Neurolymphatic)',
    group: 'Lymphatic',
    irisDescription:
        'Lymphatic sub-type with delicately arranged iris stroma. Bright white blood and lymph region. '
        'Thin, tight, uniform and stretched trabeculae. Exceptional fiber density showing good resistance. '
        '"Combed hair-like" fiber bundles in sectors corresponding to pleura, genitals and bladder.',
    predispositions: [
      'Sensitivity of central and autonomic nervous systems',
      'Nervous disposition and autonomic dysfunction; neuralgias, nervous breakdown, exhaustion',
      'Multiple sclerosis, Parkinson\'s disease risk; weak blood mineral formation',
      'Headaches, migraine from vascular spasm; risk for cerebral vessels (stroke)',
      'Nervous hypersensitivity; skin eruptions (herpes, shingles) correlated with nervous system',
      'Manic-depressive mood swings; over-burdened nervous system from stress',
      'Thin, reactive types; easily distracted and forgetful; sensitive to feedback',
    ],
    homeopathicRemedies: ['Calcium Phosphoricum', 'Zincum', 'Gelsemium', 'Avena Sativa'],
  ),

  ConstitutionalType(
    id: 'neurogenic_robust',
    name: 'Neurogenic Robust Constitution',
    group: 'Lymphatic',
    irisDescription:
        'Relaxed blue iris with boisterous radial markings on two levels. Thick bright radials on upper '
        'level; finer, closely massed radials at lower level. Single and multiple transversals. '
        'Wavy radials (combed hair). Rarefaction in lung and kidney sectors.',
    predispositions: [
      'Good vitality of central and autonomic nervous system',
      'Transversals suggest tendency to serous membranes (TB, pleurisy, chronic lung disease)',
      'String frill indicates spastic tendencies in gastro-intestinal tract',
      'Diligence and purposefulness can result in overstrain and nervous exhaustion',
      'Irritative fatigue; nervous asthmatic attacks; gastric ulcer of nervous etiology possible',
      'Functional changes of pancreas; spastic coronary reactions after neuro-psychic overloads',
    ],
    homeopathicRemedies: ['Phosphorus'],
  ),

  ConstitutionalType(
    id: 'lymphatic_hypoplastic',
    name: 'Lymphatic-Hypoplastic Diathesis',
    group: 'Lymphatic',
    irisDescription:
        'Characteristic lymphatic sub-type with inferior fiber texture. Pigment distributed throughout iris '
        'with raised, thickened collarette and increased shading of white clouds in pupillary zone. '
        'Crypts and lacunae present, may penetrate collarette border.',
    predispositions: [
      'Nutritional deficiency in body cells (hypo = insufficiency, plasia = structure/cells)',
      'Predisposition to impaired digestion/assimilation, food hypersensitivities, gastro-intestinal dysfunction',
      'Gastric insufficiency with irritation or inflammation of gastric mucosa',
      'Crypts and lacunae indicate organ weakness; deep, dark lacunae indicate chronic degenerative processes',
      'Insufficiency of circulatory system; heart and kidney problems prevalent',
      'Lowered resistance; inclined to chronic slow illness processes and difficult catarrhal conditions',
    ],
    homeopathicRemedies: ['Carbo'],
  ),

  ConstitutionalType(
    id: 'hydrogenoid_hydrogenic',
    name: 'Hydrogenoid-Hydrogenic Constitution',
    group: 'Lymphatic',
    irisDescription:
        'Lymphatic sub-type with condensed, rounded, well-defined, often white to off-white tophi. '
        'Tophi are connective tissue bundles in outer ciliary zone, ranging from clear to poorly defined. '
        'Frequently emerge in mucous membrane zones of lung, breast, neck, groin, sinus and nasal areas.',
    predispositions: [
      'Medium to strong rheumatic inclination; acute rheumatic illnesses invading joints',
      'Disposition to catarrh with exudative diathesis; latent or active antigen-antibody reactions (allergy)',
      'Exogenous substances (foods, pollens, dust) can trigger eczema, bronchial asthma, arthritis',
      'Predisposition to lymphatic hyperplasia of nasopharynx (adenoids)',
      'Bronchial mucous membrane weakness with predisposition to allergic exudative processes',
      'Physical dispositions: swollen lymph glands, food allergies, allergic asthma, eczema, weather-related rheumatism',
    ],
    homeopathicRemedies: ['Eupatorium', 'Ranunculus'],
  ),

  ConstitutionalType(
    id: 'hydrogenoid_rheumatic',
    name: 'Hydrogenoid-Rheumatic Constitution',
    group: 'Lymphatic',
    irisDescription:
        'Collection of distinct or less defined tophi with string-like connections to the lymph region. '
        'Emergence of pigmentation in the pupillary zone; tophi can exist revealing metabolic disorder.',
    predispositions: [
      'Rheumatic predisposition with tendency towards acute rheumatism and catarrh of the joints',
      'Rheumatic tendency more characterized than the base Hydrogenic constitution',
      'Disorders due to inadequate lymphatic drainage, reduced resistance, poor kidney detoxification',
      'Dysbiosis frequently exists',
    ],
    homeopathicRemedies: ['Eupatorium', 'Ranunculus', 'Berberis', 'Ledum'],
  ),

  ConstitutionalType(
    id: 'classic_rheumatic',
    name: 'Classic Rheumatic Constitution',
    group: 'Lymphatic',
    irisDescription:
        'White blue iris with increased whiteness in blood and lymph region. Many partially translucent, '
        'fewer defined converging tophi appearing as wisps and plaques. Dark ring inside outer iris edge '
        '(scurf rim) verifies catarrhal disturbances.',
    predispositions: [
      'Exudative diathesis with various catarrhal eliminations: eczema, asthma, diarrhea',
      'Diseases of rheumatic group traced to streptococci with symptomatic pains in muscles, tendons, joints',
      'Tendency toward rheumatism in respiratory tract, gastric mucosa, skin, joints and connective tissue',
      'Chronic metabolic irregularities of stomach, intestines, liver, pancreas and spleen',
      'Inadequate renal function (uric gout); insufficient liver function (lipoid gout)',
      'Physical dispositions: joint pain, constipation, chronic allergies',
    ],
    homeopathicRemedies: ['Berberis', 'Clematis', 'Dioscorea', 'Juniperus', 'Ledum'],
  ),

  ConstitutionalType(
    id: 'rheumatic_uric_acidic',
    name: 'Rheumatic-Uric Acidic Diathesis',
    group: 'Lymphatic',
    irisDescription:
        'Characteristic lymphatic iris with enhanced plaques and wisps more profuse in stroma. '
        'Fewer clearly defined tophi. Beginning signs of pigmentation. Severe form displays increased '
        'plaques spread over whole stroma forming condensed clouds.',
    predispositions: [
      'Rheumatic inclination with uric acidic diathesis; tendency toward urate stone formations',
      'Disturbance of uric acid metabolism in liver and kidneys',
      'Inadequate lymphatic drainage; poor resistance; toxically stressed mesenchyme',
      'Peripheral circulatory disorders; liver and uric acid metabolism disorders',
      'Enhanced plaques indicate stronger disposition to uric acidic diathesis',
    ],
    homeopathicRemedies: ['Berberis', 'Colchicum', 'Ledum'],
  ),

  // ── HAEMATOGENIC ────────────────────────────────────────────────────────────
  ConstitutionalType(
    id: 'haematogenic_i',
    name: 'Haematogenic I',
    group: 'Haematogenic',
    irisDescription:
        'Dark brown iris displaying velvet-like textures and thickly pigmented surface layer. '
        'Light patches may appear comparable to a sanded-down wooden surface. Bright and dark contraction '
        'furrows often exist. Heavy pigmentation diminishes visibility of individual fiber variations.',
    predispositions: [
      'Predisposed to blood anomalies and disturbance of blood serum composition (dyscrasia)',
      'Poor lymphatic drainage and sluggishness of lymphoid tissue',
      'Metabolic disorders of liver and pancreas resulting in dysbiosis',
      'Brightened areas (sandpaper effect) may associate with organic diseases of heart and kidneys',
      'Pathological dispositions: arteriosclerosis, dyspepsia, gall stones, hemorrhoids, varicose veins',
    ],
    homeopathicRemedies: ['Quassia', 'Lycopodium'],
  ),

  ConstitutionalType(
    id: 'haematogenic_ii',
    name: 'Haematogenic II',
    group: 'Haematogenic',
    irisDescription:
        'Brown pigment existing in sclera is common for this iris constitution. '
        'Dark brown iris with velvet-like texture and endocrine disturbance signs.',
    predispositions: [
      '"Haema" means blood; predisposed to blood anomalies with inclination to dyscrasia',
      'Blood making components and circulation issues with metabolic disorders of liver and pancreas',
      'Thyroid function often disturbed; inadequacy to store essential minerals and trace elements',
      'Predisposition to colon tumors; gastrointestinal disorders',
      'Lowering enzymatic and disintoxic functions of liver; predisposition to cholelithic disease',
      'Decreased reactivity of lymphatic system; microelement deficiency; predisposition to lymphadenitis',
    ],
    homeopathicRemedies: ['Quassia', 'Lycopodium'],
  ),

  // ── BILIARY / MIXED ──────────────────────────────────────────────────────────
  ConstitutionalType(
    id: 'classic_biliary',
    name: 'Classic Biliary Constitution (Mixed Iris)',
    group: 'Biliary / Mixed',
    irisDescription:
        'Slight to modest dispersed brown pigmentation of superior iris layers with underlying layers '
        'reflecting light or whitish-yellow plaques. Overall appearance is a light brown iris with visible '
        'underlying stroma fibers reflecting a blue-green tint. Frequently nutritive zone is heavily pigmented '
        'with stomach zone darkest (central heterochromia).',
    predispositions: [
      'General tendency towards damage of liver parenchyma, gallbladder and biliary tract',
      'Gastrointestinal disturbances often aggravated by dietary errors',
      'Congestive tendencies recurrently aggravated by digestive errors',
      'Stagnation from liver, gallbladder and gastrointestinal tract',
      'Physical dispositions: constipation, diarrhea, flatulence, blood sugar highs and lows, gallbladder problems',
    ],
    homeopathicRemedies: ['Nux Vomica', 'Lycopodium', 'Berberis'],
  ),

  ConstitutionalType(
    id: 'ferrum_chromotosis',
    name: 'Ferrum Chromotosis',
    group: 'Biliary / Mixed',
    irisDescription:
        'Frequently occurring brands of small golden-brown or red-brown pigmentation encircling collarette '
        'and radiating outward through iris ciliary area. Deck categorized as haemochromatosis subtype, '
        'suggesting pigment dynamics submissive to pathological change in body.',
    predispositions: [
      'Predisposed to hepatic pathology, liver and digestive irregularities, endocrine disturbances',
      'Damage of liver parenchyma; difficulty with fat metabolism; enzymatic disturbances; enlarged liver',
      'Patients feel tired, indisposed to work, pale skin; serum iron raised from liver damage',
      'May experience depression, hypochondria, hepatic hypersensitivity',
      'Secondary intestinal enzymatic insufficiency of congenital etiology',
    ],
    homeopathicRemedies: ['Cistus', 'Berberis', 'Lycopodium'],
  ),

  ConstitutionalType(
    id: 'rua_dyscratic_gr1',
    name: 'Rheumatic-Uric Acidic-Dyscratic Gr.1',
    group: 'Biliary / Mixed',
    irisDescription:
        'Characteristic lymphatic constitution with increased pigmentation of blood and lymph section '
        '(Central Heterochromia). Plaques and tophi present revealing metabolic disorder. '
        'Flattened cramp rings in liver reaction area.',
    predispositions: [
      'Predisposition towards rheumatic illnesses; disorders of uric acid metabolism (liver, pancreas, kidneys)',
      'Predisposition to secondary degenerative disease in musculoskeletal and lymphatic systems',
      'Poor lymphatic drainage and kidney detoxification; metabolic disorders in liver and stomach',
      'Hyper-hypo acidic disorders of gastric secretions; dysbiosis',
    ],
    homeopathicRemedies: ['Berberis', 'Colchicum'],
  ),

  ConstitutionalType(
    id: 'rua_dyscratic_gr2',
    name: 'Rheumatic-Uric Acidic-Dyscratic Gr.2',
    group: 'Biliary / Mixed',
    irisDescription:
        'Strong pigmentation transformation to mixed iris. Scurf rim present. '
        'Dispersed liver pigments throughout iris.',
    predispositions: [
      'Increased rheumatic inclination with uric acidic dyscratic diathesis',
      'Increased predisposition to chronic inflammatory processes in kidneys',
      'Severe irregularities of uric acid metabolism; poor skin elimination function',
      'Tendency toward various "itis" complaints (sinusitis, chronic appendicitis, tonsillitis)',
      'Faulty resistance; possible dysbiosis; toxically stressed mesenchyme and connective tissue',
    ],
    homeopathicRemedies: ['Berberis', 'Colchicum', 'Jaborandi'],
  ),

  ConstitutionalType(
    id: 'rheumatic_dyscratic_hepatic',
    name: 'Rheumatic-Dyscratic-Hepatic Diathesis',
    group: 'Biliary / Mixed',
    irisDescription:
        'Mixed iris with central heterochromia. Distinct pigmentation of tophi and plaques. '
        'Dark pigmentation coinciding with liver dysfunction; lighter pigmentation indicating internal toxic disorder.',
    predispositions: [
      'Predisposition to chronic rheumatism and liver dysfunction',
      'Chronic metabolic disorders affecting stomach and intestines',
      'Metabolic disorders (liver, kidneys, pancreas, intestines); subsequent dysbiosis',
      'Reduced resistance; inadequate kidney detoxification',
    ],
    homeopathicRemedies: ['Berberis', 'Quassia', 'Lycopodium', 'Colchicum'],
  ),

  ConstitutionalType(
    id: 'rua_dyscratic_hepatic',
    name: 'Rheumatic-Uric Acidic-Dyscratic-Hepatic Diathesis',
    group: 'Biliary / Mixed',
    irisDescription:
        'Mixed iris with pigmentation distributed over whole iris. Increased uric acid clouds. '
        'Progression of plaques and tophi.',
    predispositions: [
      'Inclination to chronic rheumatism with uric acidic complications and liver dysfunction',
      'Disposition towards chronic metabolic disorders (stomach and intestines)',
      'Metabolic disorders (liver, bile ducts, pancreas, intestines); toxic blood and lymph',
      'Reduced resistance; inadequate kidney detoxification; often resulting in dysbiosis',
    ],
    homeopathicRemedies: ['Berberis', 'Dioscorea', 'Lycopodium', 'Colchicum'],
  ),

  ConstitutionalType(
    id: 'rheumatic_arthrotic',
    name: 'Rheumatic-Arthrotic Diathesis',
    group: 'Biliary / Mixed',
    irisDescription:
        'Characteristic mixed iris with central heterochromia. Pigmentation of the tophi. '
        'Brown and yellow pigment in blood, tophi and lymph region. Brownish pigments on iris border.',
    predispositions: [
      'Arthrotic inclination to chronic rheumatic illness, especially in joints',
      'Metabolic irregularity of liver, gall bladder, bile ducts, kidneys; resultant dysbiosis',
      'Insufficient lymphatic drainage; chronic degenerative illness tendency particularly in joint tissues',
      'Peripheral circulatory disorders; reduced connective tissue function with mesenchymal toxic stress',
    ],
    homeopathicRemedies: ['Berberis', 'Quassia'],
  ),

  ConstitutionalType(
    id: 'rheumatic_arthrotic_dyscratic',
    name: 'Rheumatic-Arthrotic-Dyscratic Diathesis',
    group: 'Biliary / Mixed',
    irisDescription:
        'Mixed iris with central heterochromia. Stronger pigmentation of tophi, plaques and lymph chords. '
        'Increased toxic blood and lymphatic disorder. Brown granules suggesting uric acid diathesis, '
        'gout, kidney function disorders.',
    predispositions: [
      'Chronic degenerative rheumatic illness, particularly in joints',
      'Inclination to dysfermentia and dyspepsia of stomach and intestines',
      'Metabolic irregularity (liver, gall bladder, pancreas, kidneys); dysbiosis',
      'Deficient lymphatic drainage; diminished resistance; insufficient kidney detoxification',
    ],
    homeopathicRemedies: ['Cistus', 'Berberis', 'Quassia', 'Nux Vomica'],
  ),

  ConstitutionalType(
    id: 'arthrotic_dyscratic_dysenzymatic',
    name: 'Arthrotic-Dyscratic-Dysenzymatic Diathesis',
    group: 'Biliary / Mixed',
    irisDescription:
        'Mixed iris accompanied by Haematogenic transition with central heterochromia. '
        'Overlay of rheumatic plaques and other rheumatic iris stroma formations. '
        'Fine outline in stomach field.',
    predispositions: [
      'Predisposition to disorders of liver, pancreas and gastro-intestinal tract including dyscrasia',
      'Arthrotic diathesis from metabolic functional disorders including dyspeptic disorders of gastric secretion',
      'Metabolic disorders of liver, pancreas and bile duct system with resultant dysbiosis',
      'Diseases traced to altered blood chemistry: raised uric acid, blood lipid, and blood sugar levels',
    ],
    homeopathicRemedies: ['Cistus', 'Dioscorea'],
  ),

  // ── PATHOLOGICAL ─────────────────────────────────────────────────────────────
  ConstitutionalType(
    id: 'glandular_pathological',
    name: 'Glandular Pathological Constitution',
    group: 'Pathological',
    irisDescription:
        'Also termed polyglandular, glandular iris or endocrine type. Iris displays small and large '
        'lacunae in petal pattern around collarette. Frequently shows distended collarette, indicating '
        'tendency to prolapsed intestines and atonic constipation.',
    predispositions: [
      'Inclination towards glandular and pluriglandular endocrine and exocrine weakness',
      'Weakness of digestive (pancreas, gallbladder) and hormonal (adrenal, pituitary, thyroid) glands',
      'Associated to diabetes and pre-diabetes shown through defects in pancreas and adrenal glands',
      'Anxiety, melancholy and depression psychologically present',
      'Inclinations: pancreatic enzyme deficiency, adrenal-thyroid weakness, hyperlipidaemias, premature aging',
    ],
    homeopathicRemedies: ['Arsenum Jodatum'],
  ),

  ConstitutionalType(
    id: 'immuno_pathological',
    name: 'Immuno-Pathological Constitution',
    group: 'Pathological',
    irisDescription:
        'Main indications include open or closed defect markings throughout ciliary area. '
        'Grey and black points from wide-meshed upper layer with diminished second and third layers. '
        'Frill frequently absent or broken. Often associated with mesenchymal and glandular-pathological constitutions.',
    predispositions: [
      'Poor resistance (immune system) accompanied by irregularity with coexisting mesenchymal and glandular defects',
      'Illness such as frequent infections common; generally poor physical endurance',
      'Singular organ weaknesses predominate',
    ],
    homeopathicRemedies: ['Silicea', 'Arsenum Jodatum', 'Thuja'],
  ),

  ConstitutionalType(
    id: 'cardio_pathological',
    name: 'Cardio-Pathological Diathesis',
    group: 'Pathological',
    irisDescription:
        'Characteristic open defect markings at 3 o\'clock in heart region on frill. '
        'Frill zone interrupted by dark defect marking with thick whitish trabeculae. '
        'Open-heart sign can appear at 2:30 and 3:30, always associated to frill.',
    predispositions: [
      'Inborn inclination towards cardiac problems, particularly left-sided myocardial insufficiencies',
      'Heart defects and cardiac irregularities may appear together',
      'Weak heart often primary focus for endocarditis, myocarditis, pericarditis',
      'Early signs: shortness of breath, abrupt wakening between 3–5 A.M., red colored face, hypertension, anxiety',
    ],
    homeopathicRemedies: ['Arnica', 'Spigelia', 'Kalmia'],
  ),

  ConstitutionalType(
    id: 'vegetative_spastic',
    name: 'Vegetative-Spastic Pathological (Larvate Tetanic)',
    group: 'Pathological',
    irisDescription:
        'Radial fold formations in upper and lower lateral quadrants (congestion furrows). '
        'Circular fold formations (light rings called "cramp rings") in nasal area. '
        'Numerous bright or dark contraction furrows; lighter rings indicate acute nature, '
        'dark rings indicate chronic manifestations.',
    predispositions: [
      'Spasmodic tendencies; elevated neuromuscular tension and potential spinal subluxations',
      'Nervous tension with psychosomatic tendency; peripheral circulatory disturbances',
      'Thyroid and parathyroid disturbances, vertigo, arrhythmias, angina pectoris',
      'Spastic conditions disturbing circulation and blood sugar metabolism',
      'Gastrointestinal disorders: nervous stomach, intestinal spasms, colitis, ulcers',
      'Psychological manifestations: compulsive weeping, agoraphobia, depression, anxiety, excitability',
      'Inherent hypocalcemia; greater need for calcium, magnesium, vitamin B complex',
    ],
    homeopathicRemedies: ['Secale Cornutum', 'Lobelia', 'Avena Sativa', 'Nux Vomica'],
  ),

  ConstitutionalType(
    id: 'mesenchymal_pathological',
    name: 'Mesenchymal Pathological (Weak Connective Tissue)',
    group: 'Pathological',
    irisDescription:
        'Iris displays profuse abundantly woven increased stroma with large open weakness signs. '
        'Large numerous lacunae despite crypts not being basically definite. Weakness markings may extend '
        'from collarette to iris edge. Frequently high-level central heterochromia with oval pupils. '
        'Collarette irregular and often troublesome to observe due to numerous lacunae.',
    predispositions: [
      'Inborn weakness of connective tissue; weakness of ligaments and tendons with tendency to ptosis and prolapse',
      'Weakness of arterial walls with inclination towards varicose veins, hemorrhoids and phlebitis',
      'Every human cell contingent on function of connective tissue — genetic weakness affects all organs',
      'Hernias and varicose veins frequently present; structural problems: knees and ankles',
      'Minerals do not hold efficiently — especially calcium and magnesium',
      'Disposition towards organ prolapse, fracture, uro-genital anomalies, spinal anomalies (subluxations)',
    ],
    homeopathicRemedies: ['Arsenum Jodatum', 'Aletris', 'Silicea'],
  ),

  // ── DIATHESIS / SYNDROME ────────────────────────────────────────────────────
  ConstitutionalType(
    id: 'lipaemic_pathological',
    name: 'Lipaemic Pathological Diathesis',
    group: 'Pathological',
    irisDescription:
        'Corneal sign (not iris sign): opaque circular band or arc over iris (Arcus Senilis / Lipaemic Ring / '
        'Cholesterol Ring / Sodium Ring). Combination of fatty degeneration of corneal cells with calcium '
        'deposits. Prevalent throughout all iris types.',
    predispositions: [
      'Arcus indicates tendency towards raised blood lipids and premature fatty deterioration',
      'Chiefly found in people 30+; in coronary sclerosis fine radial irritation marks appear in heart zone',
      'Specific dispositions: arteriosclerosis, high lipid count, angina pectoris, stroke, venous thrombosis',
      'Poor digestion and absorption of fats; liver congestion and metabolic disorders',
      'Cholesterol ring can indicate reduced defense against infections and potential carcinoma',
      'Location of arcus reveals which vascular structures are obstructed',
    ],
    homeopathicRemedies: ['Cholesterinum', 'Carduus Marianus', 'Ruta', 'Quassia', 'Lycopodium'],
  ),

  ConstitutionalType(
    id: 'cardio_renal_syndrome',
    name: 'Cardio-Renal Syndrome',
    group: 'Syndrome',
    irisDescription:
        'Classified by lacunae in both heart and kidney reaction fields of left iris. '
        'Scurf rim often present.',
    predispositions: [
      'Disposition toward left cardiac insufficiency and renal insufficiency',
      'Other indications: peripheral or central edema and cardiac dyspnea',
      'Indications usually begin in middle age or later in people who lived particularly stressful lives',
      'Diverse physiological tendencies: fatigue, shortness of breath, water retention, palpitations, faintness',
    ],
    homeopathicRemedies: ['Spigelia', 'Juniperus'],
  ),

  ConstitutionalType(
    id: 'cardio_abdominal_syndrome',
    name: 'Cardio-Abdominal Syndrome',
    group: 'Syndrome',
    irisDescription:
        'Sub-division of Weak Connective Type. Distinguished by large lacuna in heart region with or without '
        'defect markings. Left colon remarkably illustrated by lacunae. Substantial distention of collarette '
        'exists in splenic flexure or descending colon section.',
    predispositions: [
      'Dysentery and various forms; abdominal distention; weak connective tissue; flatulence; heartburn',
      'Constricting sensation in chest; anxiety felt in chest; cardiac dyspnea and faintness',
      'Inclination to pancreas insufficiency may exist',
    ],
    homeopathicRemedies: ['Chamomilla'],
  ),

  ConstitutionalType(
    id: 'pancreatic_syndrome',
    name: 'Pancreatic Syndrome',
    group: 'Syndrome',
    irisDescription:
        'Sub-division of weak connective tissue type. Dispersed and loose radial fibers indicating weak '
        'connective tissue. Honeycombs and lacunae in pancreatic sector and pulmonary bronchial zone. '
        'Hereditary weakness of both pancreas and bronchi.',
    predispositions: [
      'Multi-glandular insufficiency with disturbed metabolism and increased toxin formation',
      'Tonsil hyperplasia; bronchial weakness in infancy (primarily hereditary)',
      'Frequently linked with pancreas fibrosis; detectable in young children',
      'Diseases such as measles, whooping cough, recurrent infections; can lead to bronchi-pneumonia',
      'Anxiety and depression predominate psychologically',
    ],
    homeopathicRemedies: ['Arsenum Jodatum', 'Silicea', 'Drosera'],
  ),

  ConstitutionalType(
    id: 'hepato_gastric_syndrome',
    name: 'Hepato-Gastric Syndrome',
    group: 'Syndrome',
    irisDescription:
        'Main constituents include brown (liver) pigment over liver zone, bright radial irritation fiber '
        'or vascularized transverse line running from pylorus zone to liver zone with defect marking '
        'in pyloric zone. Primarily indicates erosive ulcer with possible latent cancer settings.',
    predispositions: [
      'Inclination towards full range of liver disturbances including cirrhosis, jaundice, cholecystitis',
      'Possible Hepato-renal syndrome; severe itching accompanying jaundice',
      'Often big eaters; yellow coating on tongue with red edge; pre-existing hypotension',
    ],
    homeopathicRemedies: ['Lycopodium', 'Quassia', 'Cholesterin'],
  ),

  ConstitutionalType(
    id: 'hepato_lienal_syndrome',
    name: 'Hepato-Lienal Syndrome',
    group: 'Syndrome',
    irisDescription:
        'Characterized by dirty yellow colored pigment in ciliary zone with brownish-red hypertrophic '
        'central heterochromia. Dark spleen field (splenic triad). Bright signs can also be found in '
        'spleen sector. Often dark kidney signs. Frequently associated with Hepato-Renal Syndrome.',
    predispositions: [
      'Spleen enlargement with stabbing pains; diarrhea',
      'Venous congestion with tendency to sludge formation',
      'Viral infections; pancreatic excretory dysfunction',
    ],
    homeopathicRemedies: ['China', 'Myrtillus'],
  ),

  ConstitutionalType(
    id: 'hepato_renal_syndrome',
    name: 'Hepato-Renal Syndrome',
    group: 'Syndrome',
    irisDescription:
        'Predominantly green-brown-yellow iris ("liver irises"). Melanin pigments (may shift location) '
        'with potential transversals in lower iris sectors, especially liver-kidney zones. '
        'Reddish-yellow central heterochromia; collarette lacunae; yellowish sclera possible.',
    predispositions: [
      'Inclination towards full range of liver and kidney disorders including cirrhosis, jaundice, nephritis',
      'Poor food tolerance and pre-existing hypotension',
    ],
    homeopathicRemedies: ['Quassia', 'Lycopodium', 'Juniperus'],
  ),

  // ── PRE-CANCEROUS ──────────────────────────────────────────────────────────
  ConstitutionalType(
    id: 'psoric',
    name: 'Psoric (Pre-Cancerous)',
    group: 'Pre-Cancerous',
    irisDescription:
        'Blue-grey iris (may appear brown due to central heterochromia and pigmentation). '
        'Frequently unequal pupils. Loose main ciliary zone filled with crypts and somewhat cloudy. '
        'Open or closed lacunae on or next to collarette. Ciliary zone contains brown melanin type pigments. '
        'One type of hereditary miasma.',
    predispositions: [
      'Insomnia, heart palpitations, sensitivity to environmental stimuli; night sweats',
      'Skin eruptions, boils, eruptive fevers; hardness of lymph nodes, oily skin, allergies',
      'Mucous membrane inflammations; diseases of digestive tract mucosa and genitals',
      'Immune system pathology: allergic diseases, reduced resistance to infections',
      'Increased sensitivity to chemical and drug influences',
      'Potential for tumor building involving endocrine system or intestinal glands',
    ],
    homeopathicRemedies: ['Cistus', 'Scrophularia', 'Quassia', 'Thuja'],
  ),

  ConstitutionalType(
    id: 'sycotic',
    name: 'Sycotic (Pre-Cancerous)',
    group: 'Pre-Cancerous',
    irisDescription:
        'Darker pupillary zone than ciliary zone. Ciliary zone appears brighter from contraction furrows '
        'reflecting light. Scurf rim with light tophi or clouds visible in periphery. Pupillary zone shows '
        'crypts or lacunae with dark brown or black pigments. Classified as miasmic; '
        '"excess" formation of new tissue characteristic.',
    predispositions: [
      'Weakness in immune system including sensitivity to viral, bacterial, environmental stimulation',
      'Behavioral and emotional excess possible; inclination towards endocrine and exocrine disturbances',
      'Nervous system exhaustion; mucous membrane disturbances; heart disease; chronic arthritis',
      'Chronic urethritis, condyloma, diabetes, arteriosclerosis',
      'Family history significant for accurate constitutional determination',
    ],
    homeopathicRemedies: ['Lobelia', 'Secale Cornutum', 'Cimicifuga', 'Thuja'],
  ),

  ConstitutionalType(
    id: 'carbon_nitrogen',
    name: 'Carbon Nitrogen (Pre-Cancerous)',
    group: 'Pre-Cancerous',
    irisDescription:
        'Predominantly blue-grey iris although light to dark mixed pigmentation can exist. Pupillary '
        'region dark in periphery; usually contains crypts. Humoral region discolored shifting from '
        'yellow-brown to dark brown-grey. Middle of ciliary zone light initially; darkens at periphery '
        'forming scurf rim. Pigmentation or dark triangular shadow in spleen area (splenic triad) '
        'indicating compromised immune dysfunction. Flattening of pupils may be a good indicator.',
    predispositions: [
      'Tendency to accumulate carbonic and nitrogen wastes with inclination for development of neoplasm',
      'Cancer developing from this type results from retained toxicosis',
      'Tendencies: sclerosis, tissues hardening or shrinking, formation of stones, arthritis, circulatory weaknesses',
      'Blood low in fibrin with increased carbon dioxide content',
      'Poor nutritional supply to tissues; retained toxins with tendency to neoplasm',
      'Pathogenic development always shown in three phases: genetic, pre-clinical, clinical stage',
    ],
    homeopathicRemedies: ['Conium', 'China', 'Thuja'],
  ),
];

/// Look up a constitutional type by its id.
ConstitutionalType? findConstitution(String id) {
  try {
    return kConstitutionalTypes.firstWhere((t) => t.id == id);
  } catch (_) {
    return null;
  }
}
