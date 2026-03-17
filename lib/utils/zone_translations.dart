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
      'ru': 'Сердечно-сосудистая', 'zh': '心血管系统', 'ar': 'القلب والأوعية الدموية',
      'hi': 'हृदय-वाहिका तंत्र', 'tr': 'Kardiyovasküler', 'pl': 'Sercowo-naczyniowy',
    },
    'CENTRAL NERVOUS': {
      'en': 'Central Nervous', 'de': 'Zentrales Nervensystem', 'es': 'Sistema Nervioso Central',
      'fr': 'Système Nerveux Central', 'it': 'Sistema Nervoso Centrale', 'ja': '中枢神経系',
      'ko': '중추신경계', 'pt': 'Sistema Nervoso Central',
      'ru': 'Центральная нервная система', 'zh': '中枢神经系统', 'ar': 'الجهاز العصبي المركزي',
      'hi': 'केंद्रीय तंत्रिका तंत्र', 'tr': 'Merkezi Sinir Sistemi', 'pl': 'Ośrodkowy układ nerwowy',
    },
    'DIGESTIVE': {
      'en': 'Digestive', 'de': 'Verdauungssystem', 'es': 'Digestivo',
      'fr': 'Digestif', 'it': 'Digerente', 'ja': '消化器系',
      'ko': '소화기계', 'pt': 'Digestivo',
      'ru': 'Пищеварительная', 'zh': '消化系统', 'ar': 'الجهاز الهضمي',
      'hi': 'पाचन तंत्र', 'tr': 'Sindirim Sistemi', 'pl': 'Trawienny',
    },
    'ENDOCRINE': {
      'en': 'Endocrine', 'de': 'Endokrines System', 'es': 'Endocrino',
      'fr': 'Endocrinien', 'it': 'Endocrino', 'ja': '内分泌系',
      'ko': '내분비계', 'pt': 'Endócrino',
      'ru': 'Эндокринная', 'zh': '内分泌系统', 'ar': 'الجهاز الصماوي',
      'hi': 'अंतःस्रावी तंत्र', 'tr': 'Endokrin Sistem', 'pl': 'Endokrynny',
    },
    'EXCRETORY': {
      'en': 'Excretory', 'de': 'Ausscheidungssystem', 'es': 'Excretor',
      'fr': 'Excréteur', 'it': 'Escretore', 'ja': '排泄系',
      'ko': '배설계', 'pt': 'Excretor',
      'ru': 'Выделительная', 'zh': '排泄系统', 'ar': 'الجهاز الإخراجي',
      'hi': 'उत्सर्जन तंत्र', 'tr': 'Boşaltım Sistemi', 'pl': 'Wydalniczy',
    },
    'HEPATO-BILIARY': {
      'en': 'Hepato-Biliary', 'de': 'Hepatobiliär', 'es': 'Hepatobiliar',
      'fr': 'Hépatobiliaire', 'it': 'Epatobiliare', 'ja': '肝胆系',
      'ko': '간담도계', 'pt': 'Hepatobiliar',
      'ru': 'Гепатобилиарная', 'zh': '肝胆系统', 'ar': 'الكبد والمرارة',
      'hi': 'यकृत-पित्त तंत्र', 'tr': 'Hepato-Biliyer', 'pl': 'Wątrobowo-żółciowy',
    },
    'IMMUNE': {
      'en': 'Immune', 'de': 'Immunsystem', 'es': 'Inmunológico',
      'fr': 'Immunitaire', 'it': 'Immunitario', 'ja': '免疫系',
      'ko': '면역계', 'pt': 'Imunológico',
      'ru': 'Иммунная', 'zh': '免疫系统', 'ar': 'جهاز المناعة',
      'hi': 'प्रतिरक्षा तंत्र', 'tr': 'Bağışıklık Sistemi', 'pl': 'Odpornościowy',
    },
    'OTOLARYNGOLOGIC': {
      'en': 'Otolaryngologic', 'de': 'HNO', 'es': 'Otorrinolaringológico',
      'fr': 'Oto-Rhino-Laryngologique', 'it': 'Otorinolaringoiatrico', 'ja': '耳鼻咽喉科系',
      'ko': '이비인후과계', 'pt': 'Otorrinolaringológico',
      'ru': 'ЛОР', 'zh': '耳鼻喉科', 'ar': 'الأنف والأذن والحنجرة',
      'hi': 'कान-नाक-गला', 'tr': 'Kulak-Burun-Boğaz', 'pl': 'Laryngologiczny',
    },
    'PULMONARY': {
      'en': 'Pulmonary', 'de': 'Lungensystem', 'es': 'Pulmonar',
      'fr': 'Pulmonaire', 'it': 'Polmonare', 'ja': '呼吸器系',
      'ko': '호흡기계', 'pt': 'Pulmonar',
      'ru': 'Дыхательная', 'zh': '呼吸系统', 'ar': 'الجهاز التنفسي',
      'hi': 'फुफ्फुसीय तंत्र', 'tr': 'Solunum Sistemi', 'pl': 'Płucny',
    },
    'SUPPORT OSTEAL': {
      'en': 'Musculoskeletal', 'de': 'Bewegungsapparat', 'es': 'Musculoesquelético',
      'fr': 'Musculosquelettique', 'it': 'Muscoloscheletrico', 'ja': '筋骨格系',
      'ko': '근골격계', 'pt': 'Musculoesquelético',
      'ru': 'Опорно-двигательная', 'zh': '肌肉骨骼系统', 'ar': 'الجهاز العضلي الهيكلي',
      'hi': 'पेशी-अस्थि तंत्र', 'tr': 'Kas-İskelet Sistemi', 'pl': 'Mięśniowo-szkieletowy',
    },
    'UROGENITAL': {
      'en': 'Urogenital', 'de': 'Urogenitalsystem', 'es': 'Urogenital',
      'fr': 'Urogénital', 'it': 'Urogenitale', 'ja': '泌尿生殖器系',
      'ko': '비뇨생식기계', 'pt': 'Urogenital',
      'ru': 'Мочеполовая', 'zh': '泌尿生殖系统', 'ar': 'الجهاز البولي التناسلي',
      'hi': 'मूत्र-जनन तंत्र', 'tr': 'Ürogenital Sistem', 'pl': 'Moczowo-płciowy',
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
      'ru': 'Кожа', 'zh': '皮肤', 'ar': 'الجلد',
      'hi': 'त्वचा', 'tr': 'Deri', 'pl': 'Skóra',
    },
    'LYMPHATIC & CIRCULATORY': {
      'en': 'Lymphatic & Circulatory', 'de': 'Lymph- & Kreislaufsystem', 'es': 'Linfático y Circulatorio',
      'fr': 'Lymphatique & Circulatoire', 'it': 'Linfatico e Circolatorio', 'ja': 'リンパ・循環系',
      'ko': '림프 및 순환계', 'pt': 'Linfático e Circulatório',
      'ru': 'Лимфатическая и кровеносная', 'zh': '淋巴与循环系统', 'ar': 'الجهاز الليمفاوي والدوري',
      'hi': 'लसिका एवं परिसंचरण तंत्र', 'tr': 'Lenfatik ve Dolaşım', 'pl': 'Limfatyczny i krwionośny',
    },

    // === PUPILLARY ZONE ===
    'STOMACH': {
      'en': 'Stomach', 'de': 'Magen', 'es': 'Estómago',
      'fr': 'Estomac', 'it': 'Stomaco', 'ja': '胃',
      'ko': '위', 'pt': 'Estômago',
      'ru': 'Желудок', 'zh': '胃', 'ar': 'المعدة',
      'hi': 'आमाशय', 'tr': 'Mide', 'pl': 'Żołądek',
    },
    'SMALL INTESTINE': {
      'en': 'Small Intestine', 'de': 'Dünndarm', 'es': 'Intestino Delgado',
      'fr': 'Intestin Grêle', 'it': 'Intestino Tenue', 'ja': '小腸',
      'ko': '소장', 'pt': 'Intestino Delgado',
      'ru': 'Тонкий кишечник', 'zh': '小肠', 'ar': 'الأمعاء الدقيقة',
      'hi': 'छोटी आंत', 'tr': 'İnce Bağırsak', 'pl': 'Jelito cienkie',
    },
    'DUODENUM': {
      'en': 'Duodenum', 'de': 'Zwölffingerdarm', 'es': 'Duodeno',
      'fr': 'Duodénum', 'it': 'Duodeno', 'ja': '十二指腸',
      'ko': '십이지장', 'pt': 'Duodeno',
      'ru': 'Двенадцатиперстная кишка', 'zh': '十二指肠', 'ar': 'الاثني عشر',
      'hi': 'ग्रहणी', 'tr': 'Onikiparmak Bağırsağı', 'pl': 'Dwunastnica',
    },
    'ASCENDING COLON': {
      'en': 'Ascending Colon', 'de': 'Aufsteigender Dickdarm', 'es': 'Colon Ascendente',
      'fr': 'Côlon Ascendant', 'it': 'Colon Ascendente', 'ja': '上行結腸',
      'ko': '상행결장', 'pt': 'Cólon Ascendente',
      'ru': 'Восходящая ободочная кишка', 'zh': '升结肠', 'ar': 'القولون الصاعد',
      'hi': 'आरोही बृहदान्त्र', 'tr': 'Çıkan Kolon', 'pl': 'Okrężnica wstępująca',
    },
    'TRANSVERSE COLON': {
      'en': 'Transverse Colon', 'de': 'Querdarm', 'es': 'Colon Transverso',
      'fr': 'Côlon Transverse', 'it': 'Colon Trasverso', 'ja': '横行結腸',
      'ko': '횡행결장', 'pt': 'Cólon Transverso',
      'ru': 'Поперечная ободочная кишка', 'zh': '横结肠', 'ar': 'القولون المستعرض',
      'hi': 'अनुप्रस्थ बृहदान्त्र', 'tr': 'Enine Kolon', 'pl': 'Okrężnica poprzeczna',
    },
    'DESCENDING COLON': {
      'en': 'Descending Colon', 'de': 'Absteigender Dickdarm', 'es': 'Colon Descendente',
      'fr': 'Côlon Descendant', 'it': 'Colon Discendente', 'ja': '下行結腸',
      'ko': '하행결장', 'pt': 'Cólon Descendente',
      'ru': 'Нисходящая ободочная кишка', 'zh': '降结肠', 'ar': 'القولون النازل',
      'hi': 'अवरोही बृहदान्त्र', 'tr': 'İnen Kolon', 'pl': 'Okrężnica zstępująca',
    },
    'SIGMOID COLON': {
      'en': 'Sigmoid Colon', 'de': 'Sigmadarm', 'es': 'Colon Sigmoide',
      'fr': 'Côlon Sigmoïde', 'it': 'Colon Sigmoideo', 'ja': 'S状結腸',
      'ko': 'S자 결장', 'pt': 'Cólon Sigmoide',
      'ru': 'Сигмовидная кишка', 'zh': '乙状结肠', 'ar': 'القولون السيني',
      'hi': 'सिग्मॉइड बृहदान्त्र', 'tr': 'Sigmoid Kolon', 'pl': 'Esica',
    },
    'CECUM': {
      'en': 'Cecum', 'de': 'Blinddarm', 'es': 'Ciego',
      'fr': 'Cæcum', 'it': 'Cieco', 'ja': '盲腸',
      'ko': '맹장', 'pt': 'Ceco',
      'ru': 'Слепая кишка', 'zh': '盲肠', 'ar': 'الأعور',
      'hi': 'अंधान्त्र', 'tr': 'Kör Bağırsak', 'pl': 'Kątnica',
    },
    'AUTONOMIC NERVE WREATH': {
      'en': 'Autonomic Nerve Wreath', 'de': 'Autonomer Nervenkranz', 'es': 'Corona del Nervio Autónomo',
      'fr': 'Couronne Nerveuse Autonome', 'it': 'Corona Nervosa Autonoma', 'ja': '自律神経環',
      'ko': '자율신경환', 'pt': 'Coroa Nervosa Autônoma',
      'ru': 'Венец вегетативных нервов', 'zh': '自主神经环', 'ar': 'تاج الأعصاب الذاتية',
      'hi': 'स्वायत्त तंत्रिका वलय', 'tr': 'Otonom Sinir Çelengi', 'pl': 'Wieniec nerwów autonomicznych',
    },
    'PUPIL': {
      'en': 'Pupil', 'de': 'Pupille', 'es': 'Pupila',
      'fr': 'Pupille', 'it': 'Pupilla', 'ja': '瞳孔',
      'ko': '동공', 'pt': 'Pupila',
      'ru': 'Зрачок', 'zh': '瞳孔', 'ar': 'بؤبؤ العين',
      'hi': 'पुतली', 'tr': 'Göz Bebeği', 'pl': 'Źrenica',
    },

    // === BRAIN (12 O'CLOCK) ===
    'BRAIN': {
      'en': 'Brain', 'de': 'Gehirn', 'es': 'Cerebro',
      'fr': 'Cerveau', 'it': 'Cervello', 'ja': '脳',
      'ko': '뇌', 'pt': 'Cérebro',
      'ru': 'Мозг', 'zh': '大脑', 'ar': 'المخ',
      'hi': 'मस्तिष्क', 'tr': 'Beyin', 'pl': 'Mózg',
    },
    'VERTEX-TEMPLE': {
      'en': 'Vertex-Temple', 'de': 'Scheitel-Schläfe', 'es': 'Vértice-Sien',
      'fr': 'Vertex-Tempe', 'it': 'Vertice-Tempia', 'ja': '頭頂-側頭部',
      'ko': '두정-측두부', 'pt': 'Vértice-Têmpora',
      'ru': 'Темя-Висок', 'zh': '顶颞区', 'ar': 'قمة الرأس والصدغ',
      'hi': 'कपाल-कनपटी', 'tr': 'Tepe-Şakak', 'pl': 'Ciemię-Skroń',
    },
    'FRONTAL LOBE': {
      'en': 'Frontal Lobe', 'de': 'Frontallappen', 'es': 'Lóbulo Frontal',
      'fr': 'Lobe Frontal', 'it': 'Lobo Frontale', 'ja': '前頭葉',
      'ko': '전두엽', 'pt': 'Lobo Frontal',
      'ru': 'Лобная доля', 'zh': '额叶', 'ar': 'الفص الجبهي',
      'hi': 'ललाट पालि', 'tr': 'Frontal Lob', 'pl': 'Płat czołowy',
    },
    'OCCIPITAL LOBE': {
      'en': 'Occipital Lobe', 'de': 'Okzipitallappen', 'es': 'Lóbulo Occipital',
      'fr': 'Lobe Occipital', 'it': 'Lobo Occipitale', 'ja': '後頭葉',
      'ko': '후두엽', 'pt': 'Lobo Occipital',
      'ru': 'Затылочная доля', 'zh': '枕叶', 'ar': 'الفص القذالي',
      'hi': 'पश्चकपाल पालि', 'tr': 'Oksipital Lob', 'pl': 'Płat potyliczny',
    },
    'CEREBRAL VESSELS': {
      'en': 'Cerebral Vessels', 'de': 'Hirngefäße', 'es': 'Vasos Cerebrales',
      'fr': 'Vaisseaux Cérébraux', 'it': 'Vasi Cerebrali', 'ja': '脳血管',
      'ko': '뇌혈관', 'pt': 'Vasos Cerebrais',
      'ru': 'Мозговые сосуды', 'zh': '脑血管', 'ar': 'الأوعية الدماغية',
      'hi': 'मस्तिष्क वाहिकाएं', 'tr': 'Beyin Damarları', 'pl': 'Naczynia mózgowe',
    },
    'MEDULLA': {
      'en': 'Medulla', 'de': 'Medulla', 'es': 'Médula',
      'fr': 'Moelle', 'it': 'Midollo', 'ja': '延髄',
      'ko': '연수', 'pt': 'Medula',
      'ru': 'Продолговатый мозг', 'zh': '延髓', 'ar': 'النخاع المستطيل',
      'hi': 'मेडुला', 'tr': 'Medulla', 'pl': 'Rdzeń przedłużony',
    },
    'LIFE ENERGY': {
      'en': 'Life Energy', 'de': 'Lebensenergie', 'es': 'Energía Vital',
      'fr': 'Énergie Vitale', 'it': 'Energia Vitale', 'ja': '生命エネルギー',
      'ko': '생명 에너지', 'pt': 'Energia Vital',
      'ru': 'Жизненная энергия', 'zh': '生命能量', 'ar': 'طاقة الحياة',
      'hi': 'जीवन ऊर्जा', 'tr': 'Yaşam Enerjisi', 'pl': 'Energia życia',
    },
    '5 SENSE AREA': {
      'en': '5 Sense Area', 'de': '5-Sinne-Bereich', 'es': 'Área de los 5 Sentidos',
      'fr': 'Zone des 5 Sens', 'it': 'Area dei 5 Sensi', 'ja': '五感領域',
      'ko': '오감 영역', 'pt': 'Área dos 5 Sentidos',
      'ru': 'Область 5 чувств', 'zh': '五感区', 'ar': 'منطقة الحواس الخمس',
      'hi': 'पंच इंद्रिय क्षेत्र', 'tr': '5 Duyu Bölgesi', 'pl': 'Strefa 5 zmysłów',
    },
    'EGO PRESSURE': {
      'en': 'Ego Pressure', 'de': 'Ego-Druck', 'es': 'Presión del Ego',
      'fr': 'Pression de l\'Ego', 'it': 'Pressione dell\'Ego', 'ja': '自我圧力',
      'ko': '자아 압력', 'pt': 'Pressão do Ego',
      'ru': 'Эго-давление', 'zh': '自我压力', 'ar': 'ضغط الأنا',
      'hi': 'अहं दबाव', 'tr': 'Ego Baskısı', 'pl': 'Presja ego',
    },
    'MENTAL ABILITY': {
      'en': 'Mental Ability', 'de': 'Geistige Fähigkeit', 'es': 'Capacidad Mental',
      'fr': 'Capacité Mentale', 'it': 'Capacità Mentale', 'ja': '精神能力',
      'ko': '정신 능력', 'pt': 'Capacidade Mental',
      'ru': 'Умственные способности', 'zh': '心智能力', 'ar': 'القدرة العقلية',
      'hi': 'मानसिक क्षमता', 'tr': 'Zihinsel Yetenek', 'pl': 'Zdolności umysłowe',
    },
    'SENSORY LOCOMOTION': {
      'en': 'Sensory Locomotion', 'de': 'Sensorische Bewegung', 'es': 'Locomoción Sensorial',
      'fr': 'Locomotion Sensorielle', 'it': 'Locomozione Sensoriale', 'ja': '感覚運動',
      'ko': '감각 운동', 'pt': 'Locomoção Sensorial',
      'ru': 'Сенсорная моторика', 'zh': '感觉运动', 'ar': 'الحركة الحسية',
      'hi': 'संवेदी गतिशीलता', 'tr': 'Duyusal Hareket', 'pl': 'Motoryka sensoryczna',
    },
    'INHERENT MENTAL': {
      'en': 'Inherent Mental', 'de': 'Angeborene Mentalität', 'es': 'Mental Inherente',
      'fr': 'Mental Inhérent', 'it': 'Mentale Inerente', 'ja': '先天的精神',
      'ko': '선천적 정신', 'pt': 'Mental Inerente',
      'ru': 'Врождённые способности', 'zh': '先天心智', 'ar': 'القدرة الذهنية الفطرية',
      'hi': 'सहज मानसिक', 'tr': 'Doğuştan Zihinsel', 'pl': 'Wrodzone zdolności',
    },

    // === FACE / SENSES ===
    'EYE, NOSE, EAR': {
      'en': 'Eye, Nose, Ear', 'de': 'Auge, Nase, Ohr', 'es': 'Ojo, Nariz, Oído',
      'fr': 'Œil, Nez, Oreille', 'it': 'Occhio, Naso, Orecchio', 'ja': '目・鼻・耳',
      'ko': '눈, 코, 귀', 'pt': 'Olho, Nariz, Ouvido',
      'ru': 'Глаз, нос, ухо', 'zh': '眼、鼻、耳', 'ar': 'العين والأنف والأذن',
      'hi': 'आंख, नाक, कान', 'tr': 'Göz, Burun, Kulak', 'pl': 'Oko, Nos, Ucho',
    },
    'FOREHEAD': {
      'en': 'Forehead', 'de': 'Stirn', 'es': 'Frente',
      'fr': 'Front', 'it': 'Fronte', 'ja': '額',
      'ko': '이마', 'pt': 'Testa',
      'ru': 'Лоб', 'zh': '额头', 'ar': 'الجبهة',
      'hi': 'माथा', 'tr': 'Alın', 'pl': 'Czoło',
    },
    'LARYNX, PHARYNX': {
      'en': 'Larynx, Pharynx', 'de': 'Kehlkopf, Rachen', 'es': 'Laringe, Faringe',
      'fr': 'Larynx, Pharynx', 'it': 'Laringe, Faringe', 'ja': '喉頭・咽頭',
      'ko': '후두, 인두', 'pt': 'Laringe, Faringe',
      'ru': 'Гортань, глотка', 'zh': '喉、咽', 'ar': 'الحنجرة والبلعوم',
      'hi': 'स्वरयंत्र, ग्रसनी', 'tr': 'Gırtlak, Yutak', 'pl': 'Krtań, Gardło',
    },
    'VERTEBRAL ARTERIES': {
      'en': 'Vertebral Arteries', 'de': 'Wirbelarterien', 'es': 'Arterias Vertebrales',
      'fr': 'Artères Vertébrales', 'it': 'Arterie Vertebrali', 'ja': '椎骨動脈',
      'ko': '추골동맥', 'pt': 'Artérias Vertebrais',
      'ru': 'Позвоночные артерии', 'zh': '椎动脉', 'ar': 'الشرايين الفقرية',
      'hi': 'कशेरुका धमनियां', 'tr': 'Vertebral Arterler', 'pl': 'Tętnice kręgowe',
    },

    // === CERVICAL / THYROID ===
    'CERVICAL': {
      'en': 'Cervical', 'de': 'Halswirbelsäule', 'es': 'Cervical',
      'fr': 'Cervical', 'it': 'Cervicale', 'ja': '頸椎',
      'ko': '경추', 'pt': 'Cervical',
      'ru': 'Шейный отдел', 'zh': '颈椎', 'ar': 'الفقرات العنقية',
      'hi': 'ग्रीवा', 'tr': 'Servikal', 'pl': 'Szyjny',
    },
    'THYROID GLAND': {
      'en': 'Thyroid Gland', 'de': 'Schilddrüse', 'es': 'Glándula Tiroides',
      'fr': 'Glande Thyroïde', 'it': 'Ghiandola Tiroidea', 'ja': '甲状腺',
      'ko': '갑상선', 'pt': 'Glândula Tireoide',
      'ru': 'Щитовидная железа', 'zh': '甲状腺', 'ar': 'الغدة الدرقية',
      'hi': 'थायरॉइड ग्रंथि', 'tr': 'Tiroid Bezi', 'pl': 'Gruczoł tarczowy',
    },

    // === MEDIASTINUM ===
    'MEDIASTINUM & ESOPHAGUS': {
      'en': 'Mediastinum & Esophagus', 'de': 'Mediastinum & Speiseröhre', 'es': 'Mediastino y Esófago',
      'fr': 'Médiastin & Œsophage', 'it': 'Mediastino ed Esofago', 'ja': '縦隔・食道',
      'ko': '종격동 및 식도', 'pt': 'Mediastino e Esôfago',
      'ru': 'Средостение и пищевод', 'zh': '纵隔与食道', 'ar': 'المنصف والمريء',
      'hi': 'मध्यस्थानिका एवं ग्रासनली', 'tr': 'Mediastinum ve Yemek Borusu', 'pl': 'Śródpiersie i przełyk',
    },
    'MEDIASTINUM': {
      'en': 'Mediastinum', 'de': 'Mediastinum', 'es': 'Mediastino',
      'fr': 'Médiastin', 'it': 'Mediastino', 'ja': '縦隔',
      'ko': '종격동', 'pt': 'Mediastino',
      'ru': 'Средостение', 'zh': '纵隔', 'ar': 'المنصف',
      'hi': 'मध्यस्थानिका', 'tr': 'Mediastinum', 'pl': 'Śródpiersie',
    },
    'DIAPHRAGM': {
      'en': 'Diaphragm', 'de': 'Zwerchfell', 'es': 'Diafragma',
      'fr': 'Diaphragme', 'it': 'Diaframma', 'ja': '横隔膜',
      'ko': '횡격막', 'pt': 'Diafragma',
      'ru': 'Диафрагма', 'zh': '膈肌', 'ar': 'الحجاب الحاجز',
      'hi': 'डायाफ्राम', 'tr': 'Diyafram', 'pl': 'Przepona',
    },

    // === BACK / SPINE ===
    'BACK, PLEURA, BREAST': {
      'en': 'Back, Pleura, Breast', 'de': 'Rücken, Pleura, Brust', 'es': 'Espalda, Pleura, Mama',
      'fr': 'Dos, Plèvre, Sein', 'it': 'Schiena, Pleura, Seno', 'ja': '背部・胸膜・乳房',
      'ko': '등, 흉막, 유방', 'pt': 'Costas, Pleura, Mama',
      'ru': 'Спина, плевра, грудь', 'zh': '背部、胸膜、乳房', 'ar': 'الظهر والجنبة والثدي',
      'hi': 'पीठ, फुफ्फुसावरण, स्तन', 'tr': 'Sırt, Plevra, Meme', 'pl': 'Plecy, Opłucna, Pierś',
    },
    'VERTEBRAL COLUMN': {
      'en': 'Vertebral Column', 'de': 'Wirbelsäule', 'es': 'Columna Vertebral',
      'fr': 'Colonne Vertébrale', 'it': 'Colonna Vertebrale', 'ja': '脊柱',
      'ko': '척추', 'pt': 'Coluna Vertebral',
      'ru': 'Позвоночник', 'zh': '脊柱', 'ar': 'العمود الفقري',
      'hi': 'मेरुदंड', 'tr': 'Omurga', 'pl': 'Kręgosłup',
    },
    'BLADDER': {
      'en': 'Bladder', 'de': 'Blase', 'es': 'Vejiga',
      'fr': 'Vessie', 'it': 'Vescica', 'ja': '膀胱',
      'ko': '방광', 'pt': 'Bexiga',
      'ru': 'Мочевой пузырь', 'zh': '膀胱', 'ar': 'المثانة',
      'hi': 'मूत्राशय', 'tr': 'Mesane', 'pl': 'Pęcherz moczowy',
    },

    // === KIDNEY ===
    'KIDNEY': {
      'en': 'Kidney', 'de': 'Niere', 'es': 'Riñón',
      'fr': 'Rein', 'it': 'Rene', 'ja': '腎臓',
      'ko': '신장', 'pt': 'Rim',
      'ru': 'Почка', 'zh': '肾脏', 'ar': 'الكلية',
      'hi': 'गुर्दा', 'tr': 'Böbrek', 'pl': 'Nerka',
    },
    'ADRENAL GLAND': {
      'en': 'Adrenal Gland', 'de': 'Nebenniere', 'es': 'Glándula Suprarrenal',
      'fr': 'Glande Surrénale', 'it': 'Ghiandola Surrenale', 'ja': '副腎',
      'ko': '부신', 'pt': 'Glândula Adrenal',
      'ru': 'Надпочечник', 'zh': '肾上腺', 'ar': 'الغدة الكظرية',
      'hi': 'अधिवृक्क ग्रंथि', 'tr': 'Böbrek Üstü Bezi', 'pl': 'Nadnercze',
    },
    'LEG & KNEE': {
      'en': 'Leg & Knee', 'de': 'Bein & Knie', 'es': 'Pierna y Rodilla',
      'fr': 'Jambe & Genou', 'it': 'Gamba e Ginocchio', 'ja': '脚・膝',
      'ko': '다리 및 무릎', 'pt': 'Perna e Joelho',
      'ru': 'Нога и колено', 'zh': '腿与膝', 'ar': 'الساق والركبة',
      'hi': 'टांग एवं घुटना', 'tr': 'Bacak ve Diz', 'pl': 'Noga i kolano',
    },

    // === PELVIC / REPRODUCTIVE ===
    'PROSTATE/UTERUS': {
      'en': 'Prostate/Uterus', 'de': 'Prostata/Gebärmutter', 'es': 'Próstata/Útero',
      'fr': 'Prostate/Utérus', 'it': 'Prostata/Utero', 'ja': '前立腺/子宮',
      'ko': '전립선/자궁', 'pt': 'Próstata/Útero',
      'ru': 'Простата/Матка', 'zh': '前列腺/子宫', 'ar': 'البروستاتا/الرحم',
      'hi': 'प्रोस्टेट/गर्भाशय', 'tr': 'Prostat/Rahim', 'pl': 'Prostata/Macica',
    },
    'OVARY/TESTIS': {
      'en': 'Ovary/Testis', 'de': 'Eierstock/Hoden', 'es': 'Ovario/Testículo',
      'fr': 'Ovaire/Testicule', 'it': 'Ovaio/Testicolo', 'ja': '卵巣/精巣',
      'ko': '난소/고환', 'pt': 'Ovário/Testículo',
      'ru': 'Яичник/Яичко', 'zh': '卵巢/睾丸', 'ar': 'المبيض/الخصية',
      'hi': 'अंडाशय/वृषण', 'tr': 'Yumurtalık/Testis', 'pl': 'Jajnik/Jądro',
    },
    'RECTUM': {
      'en': 'Rectum', 'de': 'Rektum', 'es': 'Recto',
      'fr': 'Rectum', 'it': 'Retto', 'ja': '直腸',
      'ko': '직장', 'pt': 'Reto',
      'ru': 'Прямая кишка', 'zh': '直肠', 'ar': 'المستقيم',
      'hi': 'मलाशय', 'tr': 'Rektum', 'pl': 'Odbytnica',
    },

    // === LIVER / SPLEEN ===
    'LIVER': {
      'en': 'Liver', 'de': 'Leber', 'es': 'Hígado',
      'fr': 'Foie', 'it': 'Fegato', 'ja': '肝臓',
      'ko': '간', 'pt': 'Fígado',
      'ru': 'Печень', 'zh': '肝脏', 'ar': 'الكبد',
      'hi': 'यकृत', 'tr': 'Karaciğer', 'pl': 'Wątroba',
    },
    'GALLBLADDER': {
      'en': 'Gallbladder', 'de': 'Gallenblase', 'es': 'Vesícula Biliar',
      'fr': 'Vésicule Biliaire', 'it': 'Cistifellea', 'ja': '胆嚢',
      'ko': '담낭', 'pt': 'Vesícula Biliar',
      'ru': 'Желчный пузырь', 'zh': '胆囊', 'ar': 'المرارة',
      'hi': 'पित्ताशय', 'tr': 'Safra Kesesi', 'pl': 'Pęcherzyk żółciowy',
    },
    'PANCREAS': {
      'en': 'Pancreas', 'de': 'Bauchspeicheldrüse', 'es': 'Páncreas',
      'fr': 'Pancréas', 'it': 'Pancreas', 'ja': '膵臓',
      'ko': '췌장', 'pt': 'Pâncreas',
      'ru': 'Поджелудочная железа', 'zh': '胰腺', 'ar': 'البنكرياس',
      'hi': 'अग्न्याशय', 'tr': 'Pankreas', 'pl': 'Trzustka',
    },
    'SPLEEN': {
      'en': 'Spleen', 'de': 'Milz', 'es': 'Bazo',
      'fr': 'Rate', 'it': 'Milza', 'ja': '脾臓',
      'ko': '비장', 'pt': 'Baço',
      'ru': 'Селезёнка', 'zh': '脾脏', 'ar': 'الطحال',
      'hi': 'तिल्ली', 'tr': 'Dalak', 'pl': 'Śledziona',
    },

    // === CHEST ===
    'MAMMARY': {
      'en': 'Mammary', 'de': 'Brustdrüse', 'es': 'Mama',
      'fr': 'Mammaire', 'it': 'Mammario', 'ja': '乳腺',
      'ko': '유선', 'pt': 'Mamário',
      'ru': 'Молочная железа', 'zh': '乳腺', 'ar': 'الثدي',
      'hi': 'स्तन ग्रंथि', 'tr': 'Meme Bezi', 'pl': 'Gruczoł piersiowy',
    },
    'PLEURA': {
      'en': 'Pleura', 'de': 'Pleura', 'es': 'Pleura',
      'fr': 'Plèvre', 'it': 'Pleura', 'ja': '胸膜',
      'ko': '흉막', 'pt': 'Pleura',
      'ru': 'Плевра', 'zh': '胸膜', 'ar': 'الجنبة',
      'hi': 'फुफ्फुसावरण', 'tr': 'Plevra', 'pl': 'Opłucna',
    },
    'THORAX': {
      'en': 'Thorax', 'de': 'Thorax', 'es': 'Tórax',
      'fr': 'Thorax', 'it': 'Torace', 'ja': '胸部',
      'ko': '흉부', 'pt': 'Tórax',
      'ru': 'Грудная клетка', 'zh': '胸腔', 'ar': 'الصدر',
      'hi': 'वक्ष', 'tr': 'Göğüs Kafesi', 'pl': 'Klatka piersiowa',
    },

    // === LUNG / HEART ===
    'LUNG': {
      'en': 'Lung', 'de': 'Lunge', 'es': 'Pulmón',
      'fr': 'Poumon', 'it': 'Polmone', 'ja': '肺',
      'ko': '폐', 'pt': 'Pulmão',
      'ru': 'Лёгкое', 'zh': '肺', 'ar': 'الرئة',
      'hi': 'फेफड़ा', 'tr': 'Akciğer', 'pl': 'Płuco',
    },
    'HEART': {
      'en': 'Heart', 'de': 'Herz', 'es': 'Corazón',
      'fr': 'Cœur', 'it': 'Cuore', 'ja': '心臓',
      'ko': '심장', 'pt': 'Coração',
      'ru': 'Сердце', 'zh': '心脏', 'ar': 'القلب',
      'hi': 'हृदय', 'tr': 'Kalp', 'pl': 'Serce',
    },
    'BRONCHIALS': {
      'en': 'Bronchials', 'de': 'Bronchien', 'es': 'Bronquios',
      'fr': 'Bronches', 'it': 'Bronchi', 'ja': '気管支',
      'ko': '기관지', 'pt': 'Brônquios',
      'ru': 'Бронхи', 'zh': '支气管', 'ar': 'الشعب الهوائية',
      'hi': 'श्वसनी', 'tr': 'Bronşlar', 'pl': 'Oskrzela',
    },

    // === NECK / SHOULDER ===
    'NECK': {
      'en': 'Neck', 'de': 'Hals', 'es': 'Cuello',
      'fr': 'Cou', 'it': 'Collo', 'ja': '首',
      'ko': '목', 'pt': 'Pescoço',
      'ru': 'Шея', 'zh': '颈部', 'ar': 'الرقبة',
      'hi': 'गर्दन', 'tr': 'Boyun', 'pl': 'Szyja',
    },
    'SHOULDER': {
      'en': 'Shoulder', 'de': 'Schulter', 'es': 'Hombro',
      'fr': 'Épaule', 'it': 'Spalla', 'ja': '肩',
      'ko': '어깨', 'pt': 'Ombro',
      'ru': 'Плечо', 'zh': '肩部', 'ar': 'الكتف',
      'hi': 'कंधा', 'tr': 'Omuz', 'pl': 'Ramię',
    },
    'SUBCLAVOID': {
      'en': 'Subclavoid', 'de': 'Subklavikular', 'es': 'Subclavicular',
      'fr': 'Sous-Claviculaire', 'it': 'Sottoclavicolare', 'ja': '鎖骨下',
      'ko': '쇄골하', 'pt': 'Subclavicular',
      'ru': 'Подключичная область', 'zh': '锁骨下区', 'ar': 'تحت الترقوة',
      'hi': 'उपहंसली', 'tr': 'Subklaviküler', 'pl': 'Podobojczykowy',
    },
    'CLAVICLE ARTERY': {
      'en': 'Clavicle Artery', 'de': 'Schlüsselbeinarterie', 'es': 'Arteria Clavicular',
      'fr': 'Artère Claviculaire', 'it': 'Arteria Clavicolare', 'ja': '鎖骨動脈',
      'ko': '쇄골동맥', 'pt': 'Artéria Clavicular',
      'ru': 'Подключичная артерия', 'zh': '锁骨动脉', 'ar': 'شريان الترقوة',
      'hi': 'हंसली धमनी', 'tr': 'Klavikula Arteri', 'pl': 'Tętnica podobojczykowa',
    },
    'EAR': {
      'en': 'Ear', 'de': 'Ohr', 'es': 'Oído',
      'fr': 'Oreille', 'it': 'Orecchio', 'ja': '耳',
      'ko': '귀', 'pt': 'Ouvido',
      'ru': 'Ухо', 'zh': '耳', 'ar': 'الأذن',
      'hi': 'कान', 'tr': 'Kulak', 'pl': 'Ucho',
    },
  };
}
