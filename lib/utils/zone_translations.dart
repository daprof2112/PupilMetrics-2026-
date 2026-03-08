// =============================================================================
// ZONE TRANSLATIONS — Maps English zone/system names to all app languages
// Place at: lib/utils/zone_translations.dart
// =============================================================================
// Usage: ZoneTranslations.translate('LIVER', 'de') → 'Leber'
//        ZoneTranslations.translateSystem('HEPATO-BILIARY', 'ja') → '肝胆系'
// =============================================================================

class ZoneTranslations {
  /// Translate a zone name from English to the target locale
  static String translate(String englishName, String locale) {
    final key = englishName.toUpperCase().trim();
    final langMap = _zoneNames[key];
    if (langMap == null) return englishName; // fallback to English
    return langMap[locale] ?? langMap['en'] ?? englishName;
  }

  /// Translate a system name from English to the target locale
  static String translateSystem(String englishSystem, String locale) {
    final key = englishSystem.toUpperCase().trim();
    final langMap = _systemNames[key];
    if (langMap == null) return englishSystem;
    return langMap[locale] ?? langMap['en'] ?? englishSystem;
  }

  // =========================================================================
  // SYSTEM NAMES
  // =========================================================================
  static const Map<String, Map<String, String>> _systemNames = {
    'CARDIOVASCULAR': {
      'en': 'Cardiovascular', 'de': 'Herz-Kreislauf', 'es': 'Cardiovascular',
      'fr': 'Cardiovasculaire', 'it': 'Cardiovascolare', 'ja': '心血管系',
      'ko': '심혈관계', 'pt': 'Cardiovascular',
    },
    'CENTRAL NERVOUS': {
      'en': 'Central Nervous', 'de': 'Zentrales Nervensystem', 'es': 'Sistema Nervioso Central',
      'fr': 'Système Nerveux Central', 'it': 'Sistema Nervoso Centrale', 'ja': '中枢神経系',
      'ko': '중추신경계', 'pt': 'Sistema Nervoso Central',
    },
    'DIGESTIVE': {
      'en': 'Digestive', 'de': 'Verdauungssystem', 'es': 'Digestivo',
      'fr': 'Digestif', 'it': 'Digerente', 'ja': '消化器系',
      'ko': '소화기계', 'pt': 'Digestivo',
    },
    'ENDOCRINE': {
      'en': 'Endocrine', 'de': 'Endokrines System', 'es': 'Endocrino',
      'fr': 'Endocrinien', 'it': 'Endocrino', 'ja': '内分泌系',
      'ko': '내분비계', 'pt': 'Endócrino',
    },
    'EXCRETORY': {
      'en': 'Excretory', 'de': 'Ausscheidungssystem', 'es': 'Excretor',
      'fr': 'Excréteur', 'it': 'Escretore', 'ja': '排泄系',
      'ko': '배설계', 'pt': 'Excretor',
    },
    'HEPATO-BILIARY': {
      'en': 'Hepato-Biliary', 'de': 'Hepatobiliär', 'es': 'Hepatobiliar',
      'fr': 'Hépatobiliaire', 'it': 'Epatobiliare', 'ja': '肝胆系',
      'ko': '간담도계', 'pt': 'Hepatobiliar',
    },
    'IMMUNE': {
      'en': 'Immune', 'de': 'Immunsystem', 'es': 'Inmunológico',
      'fr': 'Immunitaire', 'it': 'Immunitario', 'ja': '免疫系',
      'ko': '면역계', 'pt': 'Imunológico',
    },
    'OTOLARYNGOLOGIC': {
      'en': 'Otolaryngologic', 'de': 'HNO', 'es': 'Otorrinolaringológico',
      'fr': 'Oto-Rhino-Laryngologique', 'it': 'Otorinolaringoiatrico', 'ja': '耳鼻咽喉科系',
      'ko': '이비인후과계', 'pt': 'Otorrinolaringológico',
    },
    'PULMONARY': {
      'en': 'Pulmonary', 'de': 'Lungensystem', 'es': 'Pulmonar',
      'fr': 'Pulmonaire', 'it': 'Polmonare', 'ja': '呼吸器系',
      'ko': '호흡기계', 'pt': 'Pulmonar',
    },
    'SUPPORT OSTEAL': {
      'en': 'Musculoskeletal', 'de': 'Bewegungsapparat', 'es': 'Musculoesquelético',
      'fr': 'Musculosquelettique', 'it': 'Muscoloscheletrico', 'ja': '筋骨格系',
      'ko': '근골격계', 'pt': 'Musculoesquelético',
    },
    'UROGENITAL': {
      'en': 'Urogenital', 'de': 'Urogenitalsystem', 'es': 'Urogenital',
      'fr': 'Urogénital', 'it': 'Urogenitale', 'ja': '泌尿生殖器系',
      'ko': '비뇨생식기계', 'pt': 'Urogenital',
    },
  };

  // =========================================================================
  // ZONE NAMES — All zones from Integrative Iridology Chart (OD + OS)
  // =========================================================================
  static const Map<String, Map<String, String>> _zoneNames = {
    // === OUTER RINGS ===
    'SKIN': {
      'en': 'Skin', 'de': 'Haut', 'es': 'Piel',
      'fr': 'Peau', 'it': 'Pelle', 'ja': '皮膚',
      'ko': '피부', 'pt': 'Pele',
    },
    'LYMPHATIC & CIRCULATORY': {
      'en': 'Lymphatic & Circulatory', 'de': 'Lymph- & Kreislaufsystem', 'es': 'Linfático y Circulatorio',
      'fr': 'Lymphatique & Circulatoire', 'it': 'Linfatico e Circolatorio', 'ja': 'リンパ・循環系',
      'ko': '림프 및 순환계', 'pt': 'Linfático e Circulatório',
    },

    // === PUPILLARY ZONE ===
    'STOMACH': {
      'en': 'Stomach', 'de': 'Magen', 'es': 'Estómago',
      'fr': 'Estomac', 'it': 'Stomaco', 'ja': '胃',
      'ko': '위', 'pt': 'Estômago',
    },
    'SMALL INTESTINE': {
      'en': 'Small Intestine', 'de': 'Dünndarm', 'es': 'Intestino Delgado',
      'fr': 'Intestin Grêle', 'it': 'Intestino Tenue', 'ja': '小腸',
      'ko': '소장', 'pt': 'Intestino Delgado',
    },
    'DUODENUM': {
      'en': 'Duodenum', 'de': 'Zwölffingerdarm', 'es': 'Duodeno',
      'fr': 'Duodénum', 'it': 'Duodeno', 'ja': '十二指腸',
      'ko': '십이지장', 'pt': 'Duodeno',
    },
    'ASCENDING COLON': {
      'en': 'Ascending Colon', 'de': 'Aufsteigender Dickdarm', 'es': 'Colon Ascendente',
      'fr': 'Côlon Ascendant', 'it': 'Colon Ascendente', 'ja': '上行結腸',
      'ko': '상행결장', 'pt': 'Cólon Ascendente',
    },
    'TRANSVERSE COLON': {
      'en': 'Transverse Colon', 'de': 'Querdarm', 'es': 'Colon Transverso',
      'fr': 'Côlon Transverse', 'it': 'Colon Trasverso', 'ja': '横行結腸',
      'ko': '횡행결장', 'pt': 'Cólon Transverso',
    },
    'DESCENDING COLON': {
      'en': 'Descending Colon', 'de': 'Absteigender Dickdarm', 'es': 'Colon Descendente',
      'fr': 'Côlon Descendant', 'it': 'Colon Discendente', 'ja': '下行結腸',
      'ko': '하행결장', 'pt': 'Cólon Descendente',
    },
    'SIGMOID COLON': {
      'en': 'Sigmoid Colon', 'de': 'Sigmadarm', 'es': 'Colon Sigmoide',
      'fr': 'Côlon Sigmoïde', 'it': 'Colon Sigmoideo', 'ja': 'S状結腸',
      'ko': 'S자 결장', 'pt': 'Cólon Sigmoide',
    },
    'CECUM': {
      'en': 'Cecum', 'de': 'Blinddarm', 'es': 'Ciego',
      'fr': 'Cæcum', 'it': 'Cieco', 'ja': '盲腸',
      'ko': '맹장', 'pt': 'Ceco',
    },
    'AUTONOMIC NERVE WREATH': {
      'en': 'Autonomic Nerve Wreath', 'de': 'Autonomer Nervenkranz', 'es': 'Corona del Nervio Autónomo',
      'fr': 'Couronne Nerveuse Autonome', 'it': 'Corona Nervosa Autonoma', 'ja': '自律神経環',
      'ko': '자율신경환', 'pt': 'Coroa Nervosa Autônoma',
    },
    'PUPIL': {
      'en': 'Pupil', 'de': 'Pupille', 'es': 'Pupila',
      'fr': 'Pupille', 'it': 'Pupilla', 'ja': '瞳孔',
      'ko': '동공', 'pt': 'Pupila',
    },

    // === BRAIN (12 O'CLOCK) ===
    'BRAIN': {
      'en': 'Brain', 'de': 'Gehirn', 'es': 'Cerebro',
      'fr': 'Cerveau', 'it': 'Cervello', 'ja': '脳',
      'ko': '뇌', 'pt': 'Cérebro',
    },
    'VERTEX-TEMPLE': {
      'en': 'Vertex-Temple', 'de': 'Scheitel-Schläfe', 'es': 'Vértice-Sien',
      'fr': 'Vertex-Tempe', 'it': 'Vertice-Tempia', 'ja': '頭頂-側頭部',
      'ko': '두정-측두부', 'pt': 'Vértice-Têmpora',
    },
    'FRONTAL LOBE': {
      'en': 'Frontal Lobe', 'de': 'Frontallappen', 'es': 'Lóbulo Frontal',
      'fr': 'Lobe Frontal', 'it': 'Lobo Frontale', 'ja': '前頭葉',
      'ko': '전두엽', 'pt': 'Lobo Frontal',
    },
    'OCCIPITAL LOBE': {
      'en': 'Occipital Lobe', 'de': 'Okzipitallappen', 'es': 'Lóbulo Occipital',
      'fr': 'Lobe Occipital', 'it': 'Lobo Occipitale', 'ja': '後頭葉',
      'ko': '후두엽', 'pt': 'Lobo Occipital',
    },
    'CEREBRAL VESSELS': {
      'en': 'Cerebral Vessels', 'de': 'Hirngefäße', 'es': 'Vasos Cerebrales',
      'fr': 'Vaisseaux Cérébraux', 'it': 'Vasi Cerebrali', 'ja': '脳血管',
      'ko': '뇌혈관', 'pt': 'Vasos Cerebrais',
    },
    'MEDULLA': {
      'en': 'Medulla', 'de': 'Medulla', 'es': 'Médula',
      'fr': 'Moelle', 'it': 'Midollo', 'ja': '延髄',
      'ko': '연수', 'pt': 'Medula',
    },
    'LIFE ENERGY': {
      'en': 'Life Energy', 'de': 'Lebensenergie', 'es': 'Energía Vital',
      'fr': 'Énergie Vitale', 'it': 'Energia Vitale', 'ja': '生命エネルギー',
      'ko': '생명 에너지', 'pt': 'Energia Vital',
    },
    '5 SENSE AREA': {
      'en': '5 Sense Area', 'de': '5-Sinne-Bereich', 'es': 'Área de los 5 Sentidos',
      'fr': 'Zone des 5 Sens', 'it': 'Area dei 5 Sensi', 'ja': '五感領域',
      'ko': '오감 영역', 'pt': 'Área dos 5 Sentidos',
    },
    'EGO PRESSURE': {
      'en': 'Ego Pressure', 'de': 'Ego-Druck', 'es': 'Presión del Ego',
      'fr': 'Pression de l\'Ego', 'it': 'Pressione dell\'Ego', 'ja': '自我圧力',
      'ko': '자아 압력', 'pt': 'Pressão do Ego',
    },
    'MENTAL ABILITY': {
      'en': 'Mental Ability', 'de': 'Geistige Fähigkeit', 'es': 'Capacidad Mental',
      'fr': 'Capacité Mentale', 'it': 'Capacità Mentale', 'ja': '精神能力',
      'ko': '정신 능력', 'pt': 'Capacidade Mental',
    },
    'SENSORY LOCOMOTION': {
      'en': 'Sensory Locomotion', 'de': 'Sensorische Bewegung', 'es': 'Locomoción Sensorial',
      'fr': 'Locomotion Sensorielle', 'it': 'Locomozione Sensoriale', 'ja': '感覚運動',
      'ko': '감각 운동', 'pt': 'Locomoção Sensorial',
    },
    'INHERENT MENTAL': {
      'en': 'Inherent Mental', 'de': 'Angeborene Mentalität', 'es': 'Mental Inherente',
      'fr': 'Mental Inhérent', 'it': 'Mentale Inerente', 'ja': '先天的精神',
      'ko': '선천적 정신', 'pt': 'Mental Inerente',
    },

    // === FACE / SENSES ===
    'EYE, NOSE, EAR': {
      'en': 'Eye, Nose, Ear', 'de': 'Auge, Nase, Ohr', 'es': 'Ojo, Nariz, Oído',
      'fr': 'Œil, Nez, Oreille', 'it': 'Occhio, Naso, Orecchio', 'ja': '目・鼻・耳',
      'ko': '눈, 코, 귀', 'pt': 'Olho, Nariz, Ouvido',
    },
    'FOREHEAD': {
      'en': 'Forehead', 'de': 'Stirn', 'es': 'Frente',
      'fr': 'Front', 'it': 'Fronte', 'ja': '額',
      'ko': '이마', 'pt': 'Testa',
    },
    'LARYNX, PHARYNX': {
      'en': 'Larynx, Pharynx', 'de': 'Kehlkopf, Rachen', 'es': 'Laringe, Faringe',
      'fr': 'Larynx, Pharynx', 'it': 'Laringe, Faringe', 'ja': '喉頭・咽頭',
      'ko': '후두, 인두', 'pt': 'Laringe, Faringe',
    },
    'VERTEBRAL ARTERIES': {
      'en': 'Vertebral Arteries', 'de': 'Wirbelarterien', 'es': 'Arterias Vertebrales',
      'fr': 'Artères Vertébrales', 'it': 'Arterie Vertebrali', 'ja': '椎骨動脈',
      'ko': '추골동맥', 'pt': 'Artérias Vertebrais',
    },

    // === CERVICAL / THYROID ===
    'CERVICAL': {
      'en': 'Cervical', 'de': 'Halswirbelsäule', 'es': 'Cervical',
      'fr': 'Cervical', 'it': 'Cervicale', 'ja': '頸椎',
      'ko': '경추', 'pt': 'Cervical',
    },
    'THYROID GLAND': {
      'en': 'Thyroid Gland', 'de': 'Schilddrüse', 'es': 'Glándula Tiroides',
      'fr': 'Glande Thyroïde', 'it': 'Ghiandola Tiroidea', 'ja': '甲状腺',
      'ko': '갑상선', 'pt': 'Glândula Tireoide',
    },

    // === MEDIASTINUM ===
    'MEDIASTINUM & ESOPHAGUS': {
      'en': 'Mediastinum & Esophagus', 'de': 'Mediastinum & Speiseröhre', 'es': 'Mediastino y Esófago',
      'fr': 'Médiastin & Œsophage', 'it': 'Mediastino ed Esofago', 'ja': '縦隔・食道',
      'ko': '종격동 및 식도', 'pt': 'Mediastino e Esôfago',
    },
    'MEDIASTINUM': {
      'en': 'Mediastinum', 'de': 'Mediastinum', 'es': 'Mediastino',
      'fr': 'Médiastin', 'it': 'Mediastino', 'ja': '縦隔',
      'ko': '종격동', 'pt': 'Mediastino',
    },
    'DIAPHRAGM': {
      'en': 'Diaphragm', 'de': 'Zwerchfell', 'es': 'Diafragma',
      'fr': 'Diaphragme', 'it': 'Diaframma', 'ja': '横隔膜',
      'ko': '횡격막', 'pt': 'Diafragma',
    },

    // === BACK / SPINE ===
    'BACK, PLEURA, BREAST': {
      'en': 'Back, Pleura, Breast', 'de': 'Rücken, Pleura, Brust', 'es': 'Espalda, Pleura, Mama',
      'fr': 'Dos, Plèvre, Sein', 'it': 'Schiena, Pleura, Seno', 'ja': '背部・胸膜・乳房',
      'ko': '등, 흉막, 유방', 'pt': 'Costas, Pleura, Mama',
    },
    'VERTEBRAL COLUMN': {
      'en': 'Vertebral Column', 'de': 'Wirbelsäule', 'es': 'Columna Vertebral',
      'fr': 'Colonne Vertébrale', 'it': 'Colonna Vertebrale', 'ja': '脊柱',
      'ko': '척추', 'pt': 'Coluna Vertebral',
    },
    'BLADDER': {
      'en': 'Bladder', 'de': 'Blase', 'es': 'Vejiga',
      'fr': 'Vessie', 'it': 'Vescica', 'ja': '膀胱',
      'ko': '방광', 'pt': 'Bexiga',
    },

    // === KIDNEY ===
    'KIDNEY': {
      'en': 'Kidney', 'de': 'Niere', 'es': 'Riñón',
      'fr': 'Rein', 'it': 'Rene', 'ja': '腎臓',
      'ko': '신장', 'pt': 'Rim',
    },
    'ADRENAL GLAND': {
      'en': 'Adrenal Gland', 'de': 'Nebenniere', 'es': 'Glándula Suprarrenal',
      'fr': 'Glande Surrénale', 'it': 'Ghiandola Surrenale', 'ja': '副腎',
      'ko': '부신', 'pt': 'Glândula Adrenal',
    },
    'LEG & KNEE': {
      'en': 'Leg & Knee', 'de': 'Bein & Knie', 'es': 'Pierna y Rodilla',
      'fr': 'Jambe & Genou', 'it': 'Gamba e Ginocchio', 'ja': '脚・膝',
      'ko': '다리 및 무릎', 'pt': 'Perna e Joelho',
    },

    // === PELVIC / REPRODUCTIVE ===
    'PROSTATE/UTERUS': {
      'en': 'Prostate/Uterus', 'de': 'Prostata/Gebärmutter', 'es': 'Próstata/Útero',
      'fr': 'Prostate/Utérus', 'it': 'Prostata/Utero', 'ja': '前立腺/子宮',
      'ko': '전립선/자궁', 'pt': 'Próstata/Útero',
    },
    'OVARY/TESTIS': {
      'en': 'Ovary/Testis', 'de': 'Eierstock/Hoden', 'es': 'Ovario/Testículo',
      'fr': 'Ovaire/Testicule', 'it': 'Ovaio/Testicolo', 'ja': '卵巣/精巣',
      'ko': '난소/고환', 'pt': 'Ovário/Testículo',
    },
    'RECTUM': {
      'en': 'Rectum', 'de': 'Rektum', 'es': 'Recto',
      'fr': 'Rectum', 'it': 'Retto', 'ja': '直腸',
      'ko': '직장', 'pt': 'Reto',
    },

    // === LIVER / SPLEEN ===
    'LIVER': {
      'en': 'Liver', 'de': 'Leber', 'es': 'Hígado',
      'fr': 'Foie', 'it': 'Fegato', 'ja': '肝臓',
      'ko': '간', 'pt': 'Fígado',
    },
    'GALLBLADDER': {
      'en': 'Gallbladder', 'de': 'Gallenblase', 'es': 'Vesícula Biliar',
      'fr': 'Vésicule Biliaire', 'it': 'Cistifellea', 'ja': '胆嚢',
      'ko': '담낭', 'pt': 'Vesícula Biliar',
    },
    'PANCREAS': {
      'en': 'Pancreas', 'de': 'Bauchspeicheldrüse', 'es': 'Páncreas',
      'fr': 'Pancréas', 'it': 'Pancreas', 'ja': '膵臓',
      'ko': '췌장', 'pt': 'Pâncreas',
    },
    'SPLEEN': {
      'en': 'Spleen', 'de': 'Milz', 'es': 'Bazo',
      'fr': 'Rate', 'it': 'Milza', 'ja': '脾臓',
      'ko': '비장', 'pt': 'Baço',
    },

    // === CHEST ===
    'MAMMARY': {
      'en': 'Mammary', 'de': 'Brustdrüse', 'es': 'Mama',
      'fr': 'Mammaire', 'it': 'Mammario', 'ja': '乳腺',
      'ko': '유선', 'pt': 'Mamário',
    },
    'PLEURA': {
      'en': 'Pleura', 'de': 'Pleura', 'es': 'Pleura',
      'fr': 'Plèvre', 'it': 'Pleura', 'ja': '胸膜',
      'ko': '흉막', 'pt': 'Pleura',
    },
    'THORAX': {
      'en': 'Thorax', 'de': 'Thorax', 'es': 'Tórax',
      'fr': 'Thorax', 'it': 'Torace', 'ja': '胸部',
      'ko': '흉부', 'pt': 'Tórax',
    },

    // === LUNG / HEART ===
    'LUNG': {
      'en': 'Lung', 'de': 'Lunge', 'es': 'Pulmón',
      'fr': 'Poumon', 'it': 'Polmone', 'ja': '肺',
      'ko': '폐', 'pt': 'Pulmão',
    },
    'HEART': {
      'en': 'Heart', 'de': 'Herz', 'es': 'Corazón',
      'fr': 'Cœur', 'it': 'Cuore', 'ja': '心臓',
      'ko': '심장', 'pt': 'Coração',
    },
    'BRONCHIALS': {
      'en': 'Bronchials', 'de': 'Bronchien', 'es': 'Bronquios',
      'fr': 'Bronches', 'it': 'Bronchi', 'ja': '気管支',
      'ko': '기관지', 'pt': 'Brônquios',
    },

    // === NECK / SHOULDER ===
    'NECK': {
      'en': 'Neck', 'de': 'Hals', 'es': 'Cuello',
      'fr': 'Cou', 'it': 'Collo', 'ja': '首',
      'ko': '목', 'pt': 'Pescoço',
    },
    'SHOULDER': {
      'en': 'Shoulder', 'de': 'Schulter', 'es': 'Hombro',
      'fr': 'Épaule', 'it': 'Spalla', 'ja': '肩',
      'ko': '어깨', 'pt': 'Ombro',
    },
    'SUBCLAVOID': {
      'en': 'Subclavoid', 'de': 'Subklavikular', 'es': 'Subclavicular',
      'fr': 'Sous-Claviculaire', 'it': 'Sottoclavicolare', 'ja': '鎖骨下',
      'ko': '쇄골하', 'pt': 'Subclavicular',
    },
    'CLAVICLE ARTERY': {
      'en': 'Clavicle Artery', 'de': 'Schlüsselbeinarterie', 'es': 'Arteria Clavicular',
      'fr': 'Artère Claviculaire', 'it': 'Arteria Clavicolare', 'ja': '鎖骨動脈',
      'ko': '쇄골동맥', 'pt': 'Artéria Clavicular',
    },
    'EAR': {
      'en': 'Ear', 'de': 'Ohr', 'es': 'Oído',
      'fr': 'Oreille', 'it': 'Orecchio', 'ja': '耳',
      'ko': '귀', 'pt': 'Ouvido',
    },
  };
}
