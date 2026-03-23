// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => 'Analiz Et';

  @override
  String get plrModes => 'PLR Modları';

  @override
  String get captureInstructions => 'Gözü kılavuz çemberin içine konumlandırın';

  @override
  String get scanHistory => 'Tarama Geçmişi';

  @override
  String get selectCameraMode => 'Kamera Modunu Seçin';

  @override
  String get loadFromGallery => 'Galeriden Yükle';

  @override
  String get rightEyePhoto => 'Sağ Göz Fotoğrafı';

  @override
  String get leftEyePhoto => 'Sol Göz Fotoğrafı';

  @override
  String get autoCapture => 'Otomatik Çekim';

  @override
  String get autoCaptureDesc => 'Göz algılama + 5 saniyelik otomatik çekim';

  @override
  String get manualCapture => 'Manuel Çekim';

  @override
  String get manualCaptureDesc => 'Göz algılama + manuel çekim (arka kamera)';

  @override
  String get selfieMode => 'Selfie Modu';

  @override
  String get selfieModeDesc =>
      'Göz algılama + 5 saniyelik otomatik çekim (ön kamera)';

  @override
  String get plrVideoRear => 'PLR Video (Arka)';

  @override
  String get plrVideoRearDesc => 'Arka kamera • 10 saniyelik çekim';

  @override
  String get plrVideoSelfie => 'PLR Video (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Ön kamera • 10 saniyelik çekim';

  @override
  String get plrVideoCapture => 'PLR Video Çekimi';

  @override
  String get frontCamera => 'Ön Kamera';

  @override
  String get rearCamera => 'Arka Kamera';

  @override
  String get selectEyeToAssess => 'Değerlendirilecek gözü seçin';

  @override
  String get rightEyeOD => 'Sağ Göz (OD)';

  @override
  String get leftEyeOS => 'Sol Göz (OS)';

  @override
  String get recordPlrRightEye => 'Sağ göz için PLR kaydet';

  @override
  String get recordPlrLeftEye => 'Sol göz için PLR kaydet';

  @override
  String get loadRightEyeImage => 'Sağ göz görüntüsünü yükle';

  @override
  String get loadLeftEyeImage => 'Sol göz görüntüsünü yükle';

  @override
  String get bothEyes => 'Her İki Göz';

  @override
  String get loadBothEyesDesc => 'Önce sağ göz, ardından sol göz yükle';

  @override
  String get selectEyeImageFromDevice => 'Cihazınızdan bir göz görüntüsü seçin';

  @override
  String get selectRightEyeFirst => 'Önce SAĞ göz (OD) görüntüsünü seçin';

  @override
  String get rightEyeSaved =>
      'Sağ göz kaydedildi. Şimdi SOL göz (OS) görüntüsünü seçin';

  @override
  String get cancelledNoRightEye => 'İptal edildi - sağ göz seçilmedi';

  @override
  String get cancelledNoLeftEye => 'İptal edildi - sol göz seçilmedi';

  @override
  String errorLoadingImages(String error) {
    return 'Görüntüler yüklenirken hata oluştu: $error';
  }

  @override
  String get crop43 => 'Kırp (4:3)';

  @override
  String get success => 'Başarılı';

  @override
  String get imageCroppedSuccess => 'Görüntü başarıyla kırpıldı!';

  @override
  String get error => 'Hata';

  @override
  String get cropFailed => 'Görüntü kırpılamadı. Lütfen tekrar deneyin.';

  @override
  String get crop => 'Kırp';

  @override
  String get cancel => 'İptal';

  @override
  String get saved => 'Kaydedildi! ✅';

  @override
  String get imageSavedToGallery => 'Görüntü galeride başarıyla kaydedildi';

  @override
  String get exposure => 'Pozlama';

  @override
  String get flash => 'Flaş';

  @override
  String get eye => 'Göz';

  @override
  String get center => 'merkez';

  @override
  String get light => 'Işık';

  @override
  String get ready => 'Hazır';

  @override
  String get on => 'AÇIK';

  @override
  String get off => 'KAPALI';

  @override
  String get auto => 'OTO';

  @override
  String get manual => 'MANUEL';

  @override
  String get selfie => 'SELFİE';

  @override
  String get pupil => 'GÖZ BEBEĞİ';

  @override
  String get plrHistory => 'PLR Geçmişi';

  @override
  String get searchByName => 'Ada göre ara...';

  @override
  String get totalScans => 'Toplam Tarama';

  @override
  String get thisWeek => 'Bu Hafta';

  @override
  String get patients => 'Hastalar';

  @override
  String get detected => 'Algılandı';

  @override
  String get noPlrRecordsYet => 'Henüz PLR kaydı yok';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Geçmişi görmek için bir PLR videosu kaydedin';

  @override
  String get deleteRecord => 'Kayıt Silinsin mi?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return '$name ($eye) için PLR analizi silinsin mi?\\n\\nBu işlem geri alınamaz.';
  }

  @override
  String get delete => 'Sil';

  @override
  String get recordDeleted => 'Kayıt silindi';

  @override
  String plrAnalysis(String eye) {
    return 'PLR Analizi - $eye';
  }

  @override
  String get patient => 'Hasta';

  @override
  String get date => 'Tarih';

  @override
  String get frames => 'Kareler';

  @override
  String get baselinePiRatio => 'Başlangıç G/İ';

  @override
  String get minPiRatio => 'Min G/İ';

  @override
  String get plrMagnitude => 'PLR Büyüklüğü';

  @override
  String get constriction => 'Konstrüksiyon';

  @override
  String get plrDetected => 'PLR Algılandı';

  @override
  String get confidence => 'Güvenilirlik';

  @override
  String get grade => 'Derece';

  @override
  String get close => 'kapat';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayır';

  @override
  String get na => 'N/A';

  @override
  String get takeLeftEyePhoto => 'Sol Göz Fotoğrafı Çek';

  @override
  String get takeRightEyePhoto => 'Sağ Göz Fotoğrafı Çek';

  @override
  String get nowTakingLeftEye => 'Şu an SOL göz (OS) çekiliyor';

  @override
  String get startingWithRightEye => 'SAĞ göz (OD) ile başlanıyor';

  @override
  String get captured => 'Yakalandı ✓';

  @override
  String get useSameDistanceLighting =>
      'Doğru karşılaştırma için sağ göz ile aynı mesafe ve aydınlatmayı kullanın.';

  @override
  String get step1of2 => 'Adım 1 / 2';

  @override
  String get step2of2 => 'Adım 2 / 2';

  @override
  String get bothEyesCaptured => 'Her iki göz yakalandı ✓';

  @override
  String get continueToLeftEye => 'Sol Göze Devam Et';

  @override
  String get retakeOD => 'OD\'yi Yeniden Çek';

  @override
  String get retakeOS => 'OS\'yi Yeniden Çek';

  @override
  String get retakeRightEye => 'Sağ Gözü Yeniden Çek';

  @override
  String get analyzeBothEyes => 'Her İki Gözü Analiz Et';

  @override
  String get patientInfoMissing => 'Hasta Bilgisi Eksik';

  @override
  String get rightEyePhotoMissing => 'Sağ göz fotoğrafı eksik!';

  @override
  String get patientInfoMissingRestart =>
      'Hasta bilgisi eksik. Lütfen yeniden başlatın.';

  @override
  String get exitApp => 'Uygulamadan Çık';

  @override
  String get tipsForBestResults => 'EN İYİ SONUÇLAR İÇİN İPUÇLARI';

  @override
  String get followGuidelinesForQuality =>
      'Optimum görüntü kalitesi için bu kılavuzu izleyin';

  @override
  String get cameraDistance => 'Kamera Mesafesi';

  @override
  String get cameraDistanceDesc =>
      'Kamerayı gözünüzden 10-15 cm uzakta tutun. Her iki göz için aynı mesafeyi koruyun.';

  @override
  String get lightingPosition => 'Işık Kaynağı Konumu';

  @override
  String get lightingPositionDesc =>
      'Işık kaynağını göz bebeği sınırlarının içine veya dışına konumlandırın. Kamera flaşına doğru bakmayı deneyin.';

  @override
  String get avoidReflections => 'Yansımalardan Kaçının';

  @override
  String get avoidReflectionsDesc =>
      'Pencere parlamasından, aynalardan ve doğrudan lambalardan kaçınarak yansımaları azaltın.';

  @override
  String get centerYourEye => 'Gözünüzü Ortala';

  @override
  String get centerYourEyeDesc =>
      'Sklerayı (beyaz kısım) da içeren gözün tamamının ortalandığından ve kareyi doldurduğundan emin olun.';

  @override
  String get cropProperly => 'Düzgün Kırpın';

  @override
  String get cropProperlyDesc =>
      'Görüntüyü göz ortada olacak şekilde kırpın. Görüntü otomatik olarak 4:3 en-boy oranında kaydedilecektir.';

  @override
  String get importantInformation => 'Önemli Bilgi';

  @override
  String get imageRatio43 =>
      'Tıbbi görüntüleme standardı için 4:3 görüntü oranı';

  @override
  String get forClinicalUseCnri => 'CNRI (cnri.edu) ile klinik kullanım için';

  @override
  String get noMedicalDiagnosis => 'Tıbbi tanı sağlamaz';

  @override
  String get eyeWideOpenClear =>
      'Gözünüzün tamamen açık ve görüntünün net olduğundan emin olun';

  @override
  String get personalInfo => 'Kişisel Bilgiler';

  @override
  String get personInformation => 'Kişi Bilgileri';

  @override
  String get enterPersonDetails => 'Kişi Bilgilerini Girin';

  @override
  String get infoIncludedInReport =>
      'Bu bilgiler analiz raporuna dahil edilecektir';

  @override
  String get fullName => 'Ad Soyad';

  @override
  String get enterPersonName => 'Kişi adını girin';

  @override
  String get nameRequired => 'Ad zorunludur';

  @override
  String get sex => 'Cinsiyet';

  @override
  String get male => 'Erkek';

  @override
  String get female => 'Kadın';

  @override
  String get ageYears => 'Yaş (yıl)';

  @override
  String get enterAge => 'Yaşı girin';

  @override
  String get ageRequired => 'Yaş zorunludur';

  @override
  String get enterValidNumber => 'Geçerli bir sayı girin';

  @override
  String get enterValidAge => 'Geçerli bir yaş girin (0-120)';

  @override
  String get mainComplaints => 'Ana Şikayetler';

  @override
  String get mainComplaintsOptional => 'Ana Şikayetler (isteğe bağlı)';

  @override
  String get complaintsHint => 'örn. baş ağrısı, görme sorunları, yorgunluk...';

  @override
  String get continueToCaptire => 'Çekime Devam Et';

  @override
  String get ageImportantNote =>
      'Normal aralıklar yaşa göre değiştiğinden göz bebeği boyutunun doğru değerlendirilebilmesi için yaş önemlidir.';

  @override
  String get submit => 'Gönder';

  @override
  String get pleaseSelectGender => 'Lütfen cinsiyet seçin!';

  @override
  String get applicationSubmitted => 'Başvurunuz başarıyla gönderildi.';

  @override
  String get type => 'Tür:';

  @override
  String get gender => 'Cinsiyet:';

  @override
  String get rightHanded => 'Sağ elini kullanan';

  @override
  String get leftHanded => 'Sol elini kullanan';

  @override
  String get partialLeftHandedness => 'Kısmi sol el kullanımı';

  @override
  String get retrainedLeftHandedness => 'Yeniden eğitilmiş sol el kullanımı';

  @override
  String get bilateralUseBothHands => 'İki elli kullanım';

  @override
  String get splashTitle => 'PupilMetrics Göz Çekimi';

  @override
  String get splashDeveloper =>
      'Program Geliştiricisi - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Araştırma/Eğitim Aracı';

  @override
  String get startNewAnalysis => 'Yeni Analiz Başlat';

  @override
  String get viewHistory => 'Geçmişi Görüntüle';

  @override
  String get viewResearchDisclaimer => 'Araştırma Feragatnamesini Görüntüle';

  @override
  String get researchDisclaimerTitle => 'Araştırma/Eğitim Aracı';

  @override
  String get researchDisclaimerNotMedical => 'Tıbbi cihaz DEĞİLDİR';

  @override
  String get researchDisclaimerNotClinical => 'Klinik tanı için DEĞİLDİR';

  @override
  String get researchDisclaimerResults => 'Sonuçlar araştırma gözlemleridir';

  @override
  String get researchDisclaimerConsult =>
      'Her zaman sağlık uzmanlarına danışın';

  @override
  String get researchDisclaimerAcknowledge =>
      'Devam ederek, bu uygulamanın bir araştırma aracı olduğunu ve tıbbi kararlar için kullanılmaması gerektiğini kabul etmiş olursunuz.';

  @override
  String get researchDisclaimerWarning =>
      'Bu uygulama yalnızca ARAŞTIRMA ve EĞİTİM amaçlıdır.';

  @override
  String get iUnderstand => 'Anladım';

  @override
  String get plrAnalysisTest => 'PLR Analiz Testi';

  @override
  String get checkingVideoFile => 'Video dosyası kontrol ediliyor...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Kare işleniyor $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Analiz tamamlandı!';

  @override
  String get errorVideoNotFound => 'Hata: Video dosyası bulunamadı';

  @override
  String get waitingForResults => 'Sonuçlar bekleniyor...';

  @override
  String get baseline => 'Başlangıç Değeri';

  @override
  String get flashPhase => 'Flaş';

  @override
  String get constrictionPhase => 'Konstrüksiyon';

  @override
  String get recovery => 'İyileşme';

  @override
  String get plrDetectedExclaim => 'PLR ALGILANDI!';

  @override
  String get plrWeakNotDetected => 'PLR Zayıf/Algılanamadı';

  @override
  String get min => 'Min';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'Konstr.';

  @override
  String get saveToHistory => 'Geçmişe Kaydet';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Kareleri Kaydet';

  @override
  String get share => 'Paylaş';

  @override
  String get frameSavedToGallery => 'Kare galeriye kaydedildi!';

  @override
  String get failedToSaveFrame => 'Kare kaydedilemedi';

  @override
  String framesSavedToGallery(int count) {
    return '$count kare galeriye kaydedildi!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON panoya kopyalandı!';

  @override
  String get reportCopiedToClipboard => 'Rapor panoya kopyalandı!';

  @override
  String shareFailedError(String error) {
    return 'Paylaşım başarısız: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Geçmişe kaydedildi! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'Kaydedilecek başarılı kare yok';

  @override
  String get saveAllFrames => 'Tüm Kareleri Kaydet';

  @override
  String get shareReport => 'Raporu Paylaş';

  @override
  String get shareJson => 'JSON\'ı Paylaş';

  @override
  String get rerunTest => 'Testi Yeniden Çalıştır';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'Kamera başlatılıyor...';

  @override
  String usingCamera(String camera) {
    return '$camera kamera kullanılıyor';
  }

  @override
  String cameraError(String error) {
    return 'Kamera hatası: $error';
  }

  @override
  String get noCamerasFound => 'Kamera bulunamadı';

  @override
  String get retry => 'Yeniden Dene';

  @override
  String get startPlrRecording => 'PLR Kaydını Başlat';

  @override
  String get stopRecording => 'Kaydı Durdur';

  @override
  String get phaseReady => 'Hazır';

  @override
  String get phaseStarting => 'Başlatılıyor...';

  @override
  String phaseBaseline(int sec) {
    return 'Başlangıç Değeri (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'FLAŞ!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Konstrüksiyon ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'İyileşme ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Tamamlandı!';

  @override
  String get readyDesc =>
      'Gözü çemberin içine konumlandırın, ardından Başlat\'a dokunun';

  @override
  String get holdSteady => 'Sabit tutun...';

  @override
  String get recordingBaselinePupil =>
      'Başlangıç göz bebeği boyutu kaydediliyor';

  @override
  String lightStimulus(int ms) {
    return 'Işık uyarısı (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Göz bebeği konstrüksiyonu ölçülüyor';

  @override
  String get measuringRecovery => 'Göz bebeği iyileşmesi ölçülüyor';

  @override
  String get plrRecordingComplete => 'PLR kaydı tamamlandı';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return '$eye gözü çemberin içine konumlandırın.\\n$seconds saniyelik kayıt süresince sabit tutun.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Gözü sabit tutun. Flaş $sec. saniyede gerçekleşecek.';
  }

  @override
  String get recordingComplete => 'Kayıt Tamamlandı';

  @override
  String get plrVideoCapturedSuccess => 'PLR videosu başarıyla çekildi!';

  @override
  String get duration => 'Süre';

  @override
  String get seconds => 'saniye';

  @override
  String get frameRate => 'Kare Hızı';

  @override
  String get camera => 'Kamera';

  @override
  String flashAt(int sec, int ms) {
    return '${sec}s\'de (${ms}ms)';
  }

  @override
  String get phases => 'Aşamalar';

  @override
  String get phasesFlow => 'Başlangıç Değeri → Flaş → Konstrüksiyon → İyileşme';

  @override
  String get expectedNormalValues => 'Beklenen Normal Değerler:';

  @override
  String get latency => 'Gecikme';

  @override
  String get velocity => 'Hız';

  @override
  String get testFrameAnalysis => '🧪 Test Kare Analizi';

  @override
  String get retake => 'Yeniden Çek';

  @override
  String get done => 'Tamam';

  @override
  String get plrVideoModeTitle => 'PLR Video Modu';

  @override
  String get plrAssessmentTitle => 'Işığa Pupil Refleksi (PLR) Değerlendirmesi';

  @override
  String get plrInstructions =>
      '1. Gözü kılavuz çemberin içine konumlandırın\\n2. \'PLR Kaydını Başlat\'a dokunun\\n3. 10 saniye boyunca sabit tutun\\n4. 3. saniyede flaş gerçekleşecek\\n5. Uygulama göz bebeği tepkisini kaydeder';

  @override
  String get recordingPhases => 'Kayıt Aşamaları:';

  @override
  String get baselinePhaseDesc => 'Başlangıç göz bebeği boyutu';

  @override
  String get flashPhaseDesc => 'Işık uyarısı';

  @override
  String get constrictionPhaseDesc => 'Göz bebeği küçülür';

  @override
  String get recoveryPhaseDesc => 'Göz bebeği normale döner';

  @override
  String get normalPlrValues => 'Normal PLR Değerleri:';

  @override
  String get gotIt => 'Anladım';

  @override
  String get pupilAnalysis => 'Göz Bebeği Analizi';

  @override
  String scansLeft(int count) {
    return '$count kaldı';
  }

  @override
  String get validatingRightEye => 'Sağ göz doğrulanıyor...';

  @override
  String get validatingLeftEye => 'Sol göz doğrulanıyor...';

  @override
  String get analyzingRightEye => 'Sağ göz (OD) analiz ediliyor...';

  @override
  String get analyzingLeftEye => 'Sol göz (OS) analiz ediliyor...';

  @override
  String get comparingPupils => 'Göz bebekleri karşılaştırılıyor...';

  @override
  String person(String name) {
    return 'Kişi: $name';
  }

  @override
  String get invalidEyeImage => 'Geçersiz Göz Görüntüsü';

  @override
  String analysisFailed(String error) {
    return 'Analiz başarısız: $error';
  }

  @override
  String get researchEducationalToolOnly => 'YALNIZCA ARAŞTIRMA/EĞİTİM ARACI';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Bu uygulama yalnızca araştırma ve eğitim amaçlıdır. Sonuçlar tıbbi tanı DEĞİLDİR ve klinik kullanım için doğrulanmamıştır. Örüntü ilişkilendirmeleri tarihsel araştırma literatüründen alınmıştır. Herhangi bir sağlık sorunu için bir sağlık uzmanına danışın.';

  @override
  String get pupilSizeDifference => 'Göz Bebeği Boyut Farkı Tespit Edildi';

  @override
  String get significantPupilSizeDiff => 'ANLAMLI GÖZ BEBEĞİ BOYUT FARKI';

  @override
  String get diff => 'fark';

  @override
  String get researchObservationConsult =>
      'Araştırma gözlemi - Yorum için bir sağlık uzmanına danışın';

  @override
  String get ageBasedResearchBaseline =>
      'Yaşa Dayalı Araştırma Referans Değeri';

  @override
  String group(String group) {
    return 'Grup: $group';
  }

  @override
  String get researchRange => 'Araştırma Aralığı';

  @override
  String get measuredEst => 'Ölçülen (tah.)';

  @override
  String get pupilForm => 'Göz Bebeği Formu';

  @override
  String get decentrationPattern => 'Merkez Dışılık Örüntüsü';

  @override
  String get flattenings => 'Düzleşmeler';

  @override
  String get protrusions => 'Çıkıntılar';

  @override
  String zonesCount(int count) {
    return '$count bölge';
  }

  @override
  String get bilateralComparison => 'Bilateral Karşılaştırma';

  @override
  String get parameter => 'Parametre';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'G/İ Oranı';

  @override
  String get ellipseness => 'Eliptiklik';

  @override
  String get circularity => 'Dairesellik';

  @override
  String get decentralization => 'Merkez Dışılık';

  @override
  String get anwRatio => 'Oran';

  @override
  String get normal => 'normal';

  @override
  String get elliptical => 'Eliptik';

  @override
  String get circular => 'Dairesel';

  @override
  String get irregular => 'Düzensiz';

  @override
  String get centered => 'Ortalanmış';

  @override
  String get offset => 'Sapma';

  @override
  String get miosis => 'Miyozis';

  @override
  String get constricted => 'Konstrükte';

  @override
  String get dilated => 'Dilate';

  @override
  String get mydriasis => 'Midriyazis';

  @override
  String get inner => 'İç';

  @override
  String get outer => 'Dış';

  @override
  String get high => 'Yüksek';

  @override
  String get moderate => 'Orta';

  @override
  String get savePdf => 'PDF Kaydet';

  @override
  String get sharePdf => 'PDF Paylaş';

  @override
  String get retakePhotos => 'Fotoğrafları Yeniden Çek';

  @override
  String scansLeftBanner(int count) {
    return '$count tarama kaldı';
  }

  @override
  String get upgrade => 'Yükselt';

  @override
  String get unlockUnlimited => 'Sınırsızı Aç';

  @override
  String get usedAllFreeScans => 'Tüm ücretsiz taramalarınızı kullandınız.';

  @override
  String get unlimitedScans => 'Sınırsız tarama';

  @override
  String get pdfReports => 'PDF raporlar';

  @override
  String get scanHistoryFeature => 'Tarama geçmişi';

  @override
  String get bilateralAnalysis => 'Bilateral analiz';

  @override
  String get monthly => 'Aylık';

  @override
  String get perMonth => '/ay';

  @override
  String get annual => 'Yıllık';

  @override
  String get perYear => '/yıl';

  @override
  String get tenCredits => '10 Kredi';

  @override
  String get oneTime => 'tek seferlik';

  @override
  String get best => 'EN İYİ';

  @override
  String get purchaseCancelled => 'Satın alma iptal edildi';

  @override
  String purchaseFailed(String error) {
    return 'Satın alma başarısız: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT kaydedildi: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON kaydedildi: $path';
  }

  @override
  String get pdfSaved => 'PDF Kaydedildi!';

  @override
  String pdfFailed(String error) {
    return 'PDF Başarısız: $error';
  }

  @override
  String get open => 'AÇ';

  @override
  String failed(String error) {
    return 'Başarısız: $error';
  }

  @override
  String get staticScans => 'Statik';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => 'Ada veya şikayete göre ara...';

  @override
  String get searchPlrRecords => 'PLR kayıtlarında ara...';

  @override
  String get noScansYet => 'Henüz tarama yok';

  @override
  String get completedScansAppearHere =>
      'Tamamlanan taramalar burada görünecek';

  @override
  String get deleteScan => 'Tarama Silinsin mi?';

  @override
  String deleteScanConfirm(String name, String date) {
    return '$name adlı kişiye ait $date tarihli tarama silinsin mi?';
  }

  @override
  String get scanDeleted => 'Tarama silindi';

  @override
  String get originalImagesNotFound => 'Orijinal göz görüntüleri bulunamadı.';

  @override
  String get viewResults => 'Sonuçları Görüntüle';

  @override
  String get avgPlr => 'Ort. PLR';

  @override
  String get years => 'yıl';

  @override
  String get anisocoria => 'Anizokori';

  @override
  String get none => 'Yok';

  @override
  String get mild => 'Hafif';

  @override
  String get severe => 'Ciddi';

  @override
  String zoneLabel(String zone) {
    return 'Bölge: $zone';
  }

  @override
  String associatedWith(String organ) {
    return '$organ ile ilişkilendirilmiş';
  }

  @override
  String get significant => 'Anlamlı';

  @override
  String get fair => 'Orta';

  @override
  String get low => 'Düşük';

  @override
  String get good => 'İyi';

  @override
  String get zones => 'bölge';

  @override
  String get significanceWithinLimits => 'kabul edilebilir sınırlar içinde';

  @override
  String get significanceMild => 'hafif';

  @override
  String get significanceModerate => 'orta';

  @override
  String get significanceSignificant => 'anlamlı';

  @override
  String get formTypeCircle => 'Daire (Normal)';

  @override
  String get formTypeOval => 'Oval';

  @override
  String get formTypeOvalVertical => 'Dikey Oval';

  @override
  String get formTypeOvalHorizontal => 'Yatay Oval';

  @override
  String get formTypeOvalDiagonal => 'Diyagonal Oval';

  @override
  String get formTypeLeftObliqueEllipse => 'Sol Eğik Elips';

  @override
  String get formTypeUnilateralEllipse => 'Tek Taraflı Elips';

  @override
  String get formTypeVentralDivergingEllipse => 'Ventral Iraksak Elips';

  @override
  String get formTypeFrontalDivergingEllipse => 'Frontal Iraksak Elips';

  @override
  String get formTypeEllipse => 'Elips';

  @override
  String get formTypeChord => 'Kiriş';

  @override
  String get formTypeIrregular => 'Düzensiz';

  @override
  String get pupilFormCircleDesc =>
      'Normal dairesel göz bebeği formu. Herhangi bir örüntü varyasyonu tespit edilmedi.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Yatay oval örüntü. Tarihsel araştırmalar bu örüntüyü solunum ve bez fonksiyon bölgelerini etkileyen otonom sinir sistemi örüntüleriyle ilişkilendirmiştir.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Dikey oval örüntü. Tarihsel araştırmalar bu örüntüyü otonom refleks çalışmalarında serebral dolaşım bölgeleriyle ilişkilendirmiştir.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Diyagonal oval örüntü. Araştırma literatürü bu örüntüyü otonom çalışmalarda ürogenital bölge refleksleriyle ilişkilendirmiştir.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Sol eğik elips örüntüsü. Tarihsel gözlemler bu örüntüyü ürogenital ve alt ekstremite otonom bölgeleriyle ilişkilendirmiştir.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Tek taraflı elips örüntüsü. Araştırmalar solunum ve bronşiyal otonom bölgelerle ilişkiler olduğunu göstermiştir.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Ventral ıraksak elips. Tarihsel çalışmalar bu örüntüyü alt vücut otonom bölgeleri ve motor fonksiyon örüntüleriyle ilişkilendirmiştir.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Frontal ıraksak elips. Araştırma literatürü bu örüntüyü serebral ve üst otonom bölgelerle ilişkilendirmiştir.';

  @override
  String get pupilFormOvalDesc =>
      'Hafif oval deformasyon örüntüsü. Araştırma gözlemlerinde ilerleme için izleyin.';

  @override
  String get pupilFormEllipseDesc =>
      'Tarihsel çalışmalarda otonom sistem varyasyonlarını gösteren eliptik göz bebeği örüntüsü.';

  @override
  String get pupilFormChordDesc =>
      'Araştırma literatüründe lokalize otonom etkileri gösteren kiriş benzeri deformasyon örüntüsü.';

  @override
  String get pupilFormIrregularDesc =>
      'Tarihsel gözlemlere dayanarak birden fazla otonom örüntü etkisini düşündüren düzensiz form.';

  @override
  String get patternCentered => 'Ortalanmış (Normal)';

  @override
  String get patternFrontal => 'Frontal merkez dışılık';

  @override
  String get patternBasal => 'Bazal merkez dışılık';

  @override
  String get patternNasal => 'Nazal merkez dışılık';

  @override
  String get patternTemporal => 'Temporal merkez dışılık';

  @override
  String get patternMiddleNasal => 'Orta-nazal merkez dışılık';

  @override
  String get patternMiddleTemporal => 'Orta-temporal merkez dışılık';

  @override
  String get patternUpperNasal => 'Üst-nazal merkez dışılık';

  @override
  String get patternUpperTemporal => 'Üst-temporal merkez dışılık';

  @override
  String get patternLowerNasal => 'Alt-nazal merkez dışılık';

  @override
  String get patternLowerTemporal => 'Alt-temporal merkez dışılık';

  @override
  String get patternUpwards => 'Merkez Dışılık - Yukarı';

  @override
  String get patternDownwards => 'Merkez Dışılık - Aşağı';

  @override
  String get patternUpwardsInwards => 'Merkez Dışılık - Yukarı-İçe';

  @override
  String get patternUpwardsOutwards => 'Merkez Dışılık - Yukarı-Dışa';

  @override
  String get decentrationCenteredDesc =>
      'Fizyolojik sınırlar içinde normal göz bebeği konumlanması.';

  @override
  String get decentrationNasalRightDesc =>
      'Nazal örüntü (Sağ). Tarihsel araştırmalar bu bölgeyi pulmoner otonom reflekslerle ilişkilendirmiştir.';

  @override
  String get decentrationNasalLeftDesc =>
      'Nazal örüntü (Sol). Araştırma literatürü bu bölgeyi kardiyak otonom fonksiyon örüntüleriyle ilişkilendirmiştir.';

  @override
  String get decentrationTemporalDesc =>
      'Temporal örüntü. Tarihsel gözlemler bu bölgeyi renal ve üreme otonom refleksleriyle ilişkilendirmiştir.';

  @override
  String get decentrationFrontalRightDesc =>
      'Frontal örüntü (Sağ). Araştırmalar bu bölgeyi bilişsel ve serebral fonksiyon örüntüleriyle ilişkilendirmiştir.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Frontal örüntü (Sol). Tarihsel çalışmalar bu bölgeyi serebral otonom örüntülerle ilişkilendirmiştir.';

  @override
  String get decentrationBasalRightDesc =>
      'Bazal örüntü (Sağ). Araştırmalar intrakraniyal basınç refleksleriyle ilişkiler olduğunu göstermiştir.';

  @override
  String get decentrationBasalLeftDesc =>
      'Bazal örüntü (Sol). Tarihsel gözlemler bu bölgeyi serebral enflamatuvar bölge örüntüleriyle ilişkilendirmiştir.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Üst-nazal örüntü (Sağ). Araştırmalar bu bölgeyi hepatobiliyer otonom reflekslerle ilişkilendirmiştir.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Üst-nazal örüntü (Sol). Tarihsel çalışmalar bu bölgeyi splenik ve diyafragmatik bölgelerle ilişkilendirmiştir.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Üst-temporal örüntü. Araştırmalar renal ve üreme otonom bölgeleriyle ilişkiler olduğunu göstermiştir.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Orta-nazal örüntü (Sağ). Tarihsel gözlemler bu bölgeyi oksijen kullanımı ve kardiyak bölgelerle ilişkilendirmiştir.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Orta-nazal örüntü (Sol). Araştırmalar bu bölgeyi nörolojik ve kardiyak otonom örüntülerle ilişkilendirmiştir.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Orta-temporal örüntü (Sağ). Araştırmalar bu bölgeyi kardiyak otonom düzenleme bölgeleriyle ilişkilendirmiştir.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Orta-temporal örüntü (Sol). Tarihsel çalışmalar bu bölgeyi pulmoner ve kardiyak bölgelerle ilişkilendirmiştir.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Üst-nazal örüntü (Sağ). Araştırmalar bilişsel bölgeler ve servikal omurga refleksleriyle ilişkiler olduğunu göstermiştir.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Üst-nazal örüntü (Sol). Tarihsel gözlemler bu bölgeyi bilişsel örüntüler ve servikal bölgelerle ilişkilendirmiştir.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Üst-temporal örüntü (Sağ). Araştırmalar bu bölgeyi kraniyal sinir ve işitsel reflekslerle ilişkilendirmiştir.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Üst-temporal örüntü (Sol). Tarihsel çalışmalar bu bölgeyi nörovejetatif ve konuşma bölgeleriyle ilişkilendirmiştir.';

  @override
  String get decentrationLowerNasalDesc =>
      'Alt-nazal örüntü. Araştırmalar ürogenital ve lumbosakral otonom bölgelerle ilişkiler olduğunu göstermiştir.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Alt-temporal örüntü (Sağ). Tarihsel gözlemler bu bölgeyi metabolik ve hepatik bölgelerle ilişkilendirmiştir.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Alt-temporal örüntü (Sol). Araştırmalar bu bölgeyi kardiyak ve splenik otonom örüntülerle ilişkilendirmiştir.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Üst-merkezi bölge ile ilişkili örüntü. Tarihsel araştırmalar bu bölgeyi ruh hali düzenlemesi ve enerji otonom refleksleriyle ilişkilendirmiştir.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Üst-temporal bölge ile ilişkili örüntü. Araştırmalar kraniyal sinir ve işitsel otonom reflekslerle ilişkiler olduğunu göstermiştir.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Orta-temporal bölge ile ilişkili örüntü. Tarihsel gözlemler bu bölgeyi solunum ve kardiyak otonom örüntülerle ilişkilendirmiştir.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Alt-temporal bölge ile ilişkili örüntü. Araştırma literatürü bu bölgeyi hepatik ve metabolik otonom bölgelerle ilişkilendirmiştir.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Alt-bazal bölge ile ilişkili örüntü. Tarihsel çalışmalar bu bölgeyi renal ve alt ekstremite otonom refleksleriyle ilişkilendirmiştir.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Alt-nazal bölge ile ilişkili örüntü. Araştırmalar ürogenital ve pelvik otonom bölgelerle ilişkiler olduğunu göstermiştir.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Orta-nazal bölge ile ilişkili örüntü. Tarihsel gözlemler bu bölgeyi oksijen kullanımı ve solunum otonom örüntüleriyle ilişkilendirmiştir.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Üst-nazal bölge ile ilişkili örüntü. Araştırma literatürü bu bölgeyi bilişsel ve servikal otonom reflekslerle ilişkilendirmiştir.';

  @override
  String get flatteningDefaultRightDesc =>
      'Tarihsel araştırmalara dayanarak bu bölgede otonom sinir sistemi örüntü varyasyonu tespit edildi.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Üst-merkezi bölge ile ilişkili örüntü. Tarihsel araştırmalar bu bölgeyi ruh hali düzenlemesi ve nörolojik otonom örüntülerle ilişkilendirmiştir.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Üst-temporal bölge ile ilişkili örüntü. Araştırmalar nörovejetatif ve konuşma otonom bölgeleriyle ilişkiler olduğunu göstermiştir.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Orta-temporal bölge ile ilişkili örüntü. Tarihsel gözlemler bu bölgeyi pulmoner ve kardiyak otonom reflekslerle ilişkilendirmiştir.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Alt-temporal bölge ile ilişkili örüntü. Araştırma literatürü bu bölgeyi kardiyak ve splenik otonom örüntülerle ilişkilendirmiştir.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Alt-bazal bölge ile ilişkili örüntü. Tarihsel çalışmalar bu bölgeyi renal ve eliminatif otonom bölgelerle ilişkilendirmiştir.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Alt-nazal bölge ile ilişkili örüntü. Araştırmalar ürogenital ve lumbosakral otonom reflekslerle ilişkiler olduğunu göstermiştir.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Orta-nazal bölge ile ilişkili örüntü. Tarihsel gözlemler bu bölgeyi kardiyak ve solunum otonom örüntüleriyle ilişkilendirmiştir.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Üst-nazal bölge ile ilişkili örüntü. Araştırma literatürü bu bölgeyi bilişsel ve servikal otonom bölgelerle ilişkilendirmiştir.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Tarihsel araştırmalara dayanarak bu bölgede otonom sinir sistemi örüntü varyasyonu tespit edildi.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Üst-merkezi bölge çıkıntı örüntüsü. Araştırmalar bu bölgeyi serebral bölgeleri etkileyen sempatik hiperaruzal örüntüleriyle ilişkilendirmiştir.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Üst-temporal bölge çıkıntı örüntüsü. Tarihsel gözlemler bu bölgeyi kraniyal sinir ve işitsel sistem hiperaktivite örüntüleriyle ilişkilendirmiştir.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Orta-temporal bölge çıkıntı örüntüsü. Araştırmalar kardiyak ve solunum sempatik örüntüleriyle ilişkiler olduğunu göstermiştir.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Alt-temporal bölge çıkıntı örüntüsü. Tarihsel çalışmalar bu bölgeyi hepatobiliyer ve metabolik sempatik bölgelerle ilişkilendirmiştir.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Alt-bazal bölge çıkıntı örüntüsü. Araştırmalar bu bölgeyi renal ve pelvik sempatik hiperaktivite örüntüleriyle ilişkilendirmiştir.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Alt-nazal bölge çıkıntı örüntüsü. Tarihsel gözlemler bu bölgeyi ürogenital sempatik aktivasyon bölgeleriyle ilişkilendirmiştir.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Orta-nazal bölge çıkıntı örüntüsü. Araştırmalar gastrik ve pankreatik sempatik örüntülerle ilişkiler olduğunu göstermiştir.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Üst-nazal bölge çıkıntı örüntüsü. Tarihsel çalışmalar bu bölgeyi bilişsel ve görsel sempatik hiperaruzal bölgelerle ilişkilendirmiştir.';

  @override
  String get protrusionDefaultRightDesc =>
      'Araştırma gözlemlerine dayanarak bu bölgede sempatik sinir sistemi hiperaktivite örüntüsü tespit edildi.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Üst-merkezi bölge çıkıntı örüntüsü. Araştırmalar bu bölgeyi psikomotor ve serebral sempatik örüntülerle ilişkilendirmiştir.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Üst-temporal bölge çıkıntı örüntüsü. Tarihsel gözlemler bu bölgeyi nörovejetatif sempatik hiperaktivite bölgeleriyle ilişkilendirmiştir.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Orta-temporal bölge çıkıntı örüntüsü. Araştırmalar pulmoner ve kardiyak sempatik örüntülerle ilişkiler olduğunu göstermiştir.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Alt-temporal bölge çıkıntı örüntüsü. Tarihsel çalışmalar bu bölgeyi splenik ve kardiyak sempatik aktivasyon bölgeleriyle ilişkilendirmiştir.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Alt-bazal bölge çıkıntı örüntüsü. Araştırmalar bu bölgeyi pelvik ve renal sempatik hiperaktivite örüntüleriyle ilişkilendirmiştir.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Alt-nazal bölge çıkıntı örüntüsü. Tarihsel gözlemler bu bölgeyi lumbosakral sempatik aktivasyon bölgeleriyle ilişkilendirmiştir.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Orta-nazal bölge çıkıntı örüntüsü. Araştırmalar anksiyete-kardiyak sempatik örüntülerle ilişkiler olduğunu göstermiştir.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Üst-nazal bölge çıkıntı örüntüsü. Tarihsel çalışmalar bu bölgeyi bilişsel ve görsel sempatik hiperaruzal bölgelerle ilişkilendirmiştir.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Araştırma gözlemlerine dayanarak bu bölgede sempatik sinir sistemi hiperaktivite örüntüsü tespit edildi.';

  @override
  String get anisocoriaNone =>
      'Göz bebeği boyutları normal sınırlar içinde. Anlamlı anizokori tespit edilmedi.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anizokori tespit edildi: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'Normal sınırlar içinde.';

  @override
  String get anisocoriaSeverityMild =>
      'Hafif fark gözlemlendi. Fizyolojik olabilir.';

  @override
  String get anisocoriaSeverityModerate =>
      'Orta asimetri. Araştırma gözlemi kaydedildi.';

  @override
  String get anisocoriaSeveritySevere =>
      'Anlamlı asimetri. Araştırma gözlemi işaretlendi.';

  @override
  String get largerPupilEqual => 'eşit';

  @override
  String get largerPupilOS => 'OS (Sol)';

  @override
  String get largerPupilOD => 'OD (Sağ)';

  @override
  String get decentrationWithinLimits => 'Normal sınırlar içinde.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Sapma: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Üst-Merkezi';

  @override
  String get zoneUpperNasal => 'Üst-Nazal';

  @override
  String get zoneMiddleNasal => 'Orta-Nazal';

  @override
  String get zoneLowerNasal => 'Alt-Nazal';

  @override
  String get zoneLowerBasal => 'Alt-Bazal';

  @override
  String get zoneLowerTemporal => 'Alt-Temporal';

  @override
  String get zoneMiddleTemporal => 'Orta-Temporal';

  @override
  String get zoneUpperTemporal => 'Üst-Temporal';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Bazal';

  @override
  String get zoneUnknown => 'Bilinmiyor';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '$zone düzleşmesi ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '$zone çıkıntısı ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB İriskop Modu';

  @override
  String get iriscopeExternal => 'İriskop / Harici';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => 'Bağlı USB kamera veya iriskop kullan';

  @override
  String get detectedCameras => 'Algılanan Kameralar';

  @override
  String get externalCamera => 'Harici Kamera';

  @override
  String cameraIndex(int index) {
    return 'Kamera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Harici kamera algılanamadı.\\nEtkinleştirmek için bir USB iriskop bağlayın.';

  @override
  String get refresh => 'Yenile';

  @override
  String get selectCameraSource => 'Kamera Kaynağı Seçin';

  @override
  String camerasDetected(int count) {
    return '$count kamera algılandı';
  }

  @override
  String camerasAvailable(int count) {
    return '$count kamera mevcut';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Harici Kamera $index';
  }

  @override
  String get qualityGatedRear =>
      'Kalite kontrollü otomatik çekim (arka kamera)';

  @override
  String get qualityGatedFront => 'Kalite kontrollü otomatik çekim (ön kamera)';

  @override
  String get usbCameraInfo => 'USB Kamera Bilgisi';

  @override
  String get connected => 'Bağlı';

  @override
  String get waiting => 'Bekleniyor...';

  @override
  String get disconnected => 'Bağlantı Kesildi';

  @override
  String get waitingForUsbCamera => 'USB Kamera Bekleniyor';

  @override
  String get connectIriscopePrompt =>
      'İriskopunuzu USB OTG adaptörü ile bağlayın.\\nİstendiğinde izin verin.';

  @override
  String get usbCameraIssue => 'USB Kamera Sorunu';

  @override
  String get pleaseConnectIriscope =>
      'Lütfen iriskopunuzu veya USB kameranızı bağlayın.';

  @override
  String get retryConnection => 'Bağlantıyı Yeniden Dene';

  @override
  String get troubleshootingTips => 'Sorun Giderme İpuçları';

  @override
  String get tipUsbOtgAdapter =>
      'USB OTG adaptörünün düzgün bağlandığından emin olun';

  @override
  String get tipUsbHostMode =>
      'Cihazın USB Ana bilgisayar modunu destekleyip desteklemediğini kontrol edin';

  @override
  String get tipReconnectCamera =>
      'Kameranın bağlantısını kesip yeniden bağlamayı deneyin';

  @override
  String get tipGrantPermissions => 'İstendiğinde USB izinlerini verin';

  @override
  String get tipUnlockDevice =>
      'Bazı cihazların kilidinin açılması gerekebilir';

  @override
  String get back => 'Geri';

  @override
  String get switchEye => 'Gözü Değiştir';

  @override
  String get state => 'Durum';

  @override
  String get status => 'Statü';

  @override
  String get usingFlutterUvcPlugin =>
      'flutter_uvc_camera eklentisi kullanılıyor\\nUSB Video Class cihaz desteği için eklenti.';

  @override
  String get initialized => 'Başlatıldı';

  @override
  String get notReady => 'Hazır Değil';

  @override
  String get captureDistanceMatch => 'Çekim Mesafesi Eşleşmesi';

  @override
  String get irisSize => 'İris Boyutu';

  @override
  String get distanceMatched => 'Mesafe Eşleşti';

  @override
  String get distanceMismatch => 'Mesafe Uyuşmazlığı';

  @override
  String get excellentMatch => 'Mükemmel eşleşme';

  @override
  String get goodMatch => 'İyi eşleşme';

  @override
  String get acceptableMatch => 'Kabul edilebilir eşleşme';

  @override
  String get considerRetaking => 'Mesafe uyuşmazlığı - yeniden çekmeyi düşünün';

  @override
  String get qualityReady => 'Hazır! Sabit tutun...';

  @override
  String get qualityTooBlurry => 'Kamerayı sabit tutun';

  @override
  String get qualityTooDark => 'Daha fazla ışık gerekiyor';

  @override
  String get qualityTooBright => 'Çok parlak - ışığı azaltın';

  @override
  String get qualityNoContrast => 'Aydınlatma açısını ayarlayın';

  @override
  String get qualityNoPupil => 'Göz bebeğini kareye ortala';

  @override
  String get qualityNotCentered => 'Gözü merkeze taşıyın';

  @override
  String get qualityNotAnEye => 'Göz algılanamadı';

  @override
  String get qualityProcessing => 'İşleniyor...';

  @override
  String get distanceMatchedCheck => '✓ Mesafe eşleşti';

  @override
  String get distanceGoodMatchCheck => '✓ İyi eşleşme';

  @override
  String get distanceSlightlyBack => 'Biraz geri ↔';

  @override
  String get distanceSlightlyCloser => 'Biraz yakın ↔';

  @override
  String get distanceAlmostThere => 'Neredeyse tamam...';

  @override
  String get distanceMoveBack => 'Geri git ←←';

  @override
  String get distanceMoveCloser => 'Yaklaş →→';

  @override
  String get distanceTooClose => 'Çok yakın! Geri git';

  @override
  String get distanceTooFar => 'Çok uzak! Yaklaş';

  @override
  String get distanceStabilizing => 'Sabitleniyor...';

  @override
  String distanceLabel(int percent) {
    return 'Mesafe: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Ön Kamera';

  @override
  String get rearCameraLabel => 'Arka Kamera';

  @override
  String get startingCamera => 'Kamera başlatılıyor...';

  @override
  String get eyeNotDetected => 'Göz Algılanamadı';

  @override
  String get tryAgain => 'Tekrar Dene';

  @override
  String get indicatorEye => 'Göz';

  @override
  String get indicatorSharp => 'Keskinlik';

  @override
  String get indicatorLight => 'Işık';

  @override
  String get indicatorFocus => 'Odak';

  @override
  String get indicatorPupil => 'Pupil';

  @override
  String get indicatorIris => 'İris';

  @override
  String get indicatorMatch => 'Eşleşme';

  @override
  String get checkImageShape => 'Görüntü Şekli';

  @override
  String get checkCircularIris => 'Yuvarlak İris';

  @override
  String get checkDarkPupil => 'Koyu Pupil';

  @override
  String get checkIrisTexture => 'İris Dokusu';

  @override
  String get checkPupilIrisStructure => 'Pupil-İris Yapısı';

  @override
  String get checkNaturalColors => 'Doğal Renkler';

  @override
  String get checkEdgePattern => 'Kenar Deseni';

  @override
  String get errorImageShapeIncorrect =>
      'Görüntü şekli hatalı - gözün çerçeveyi doldurduğundan emin olun';

  @override
  String get errorNoEyeDetected =>
      'Göz algılanamadı - irisi çerçeve ortasına getirin';

  @override
  String get errorNoPupilDetected =>
      'Pupil algılanamadı - iyi aydınlatma sağlayın';

  @override
  String get errorNoIrisTexture => 'İris dokusu yok - gözünüze yaklaşın';

  @override
  String get errorUnusualColors =>
      'Alışılmadık renkler algılandı - ekranlardan/yansımalardan kaçının';

  @override
  String get errorTooManyEdges =>
      'Çok fazla düz kenar - bu bir göz olmayabilir';

  @override
  String get errorNotValidEye =>
      'Geçerli bir göz görüntüsü değil - lütfen tekrar deneyin';

  @override
  String get holdStillCapturing => 'Hareketsiz durun - yakalanıyor...';

  @override
  String get adjustDistanceFirst => 'Önce mesafeyi ayarlayın';

  @override
  String get stabilizingReading => 'Sabitleniyor...';

  @override
  String get autoCaptureWhenReady => 'Hazır olduğunda otomatik yakalama';

  @override
  String get tapOrWaitAutoCapture =>
      'Dokunun veya otomatik yakalama için bekleyin';

  @override
  String get validatingImage => 'Doğrulanıyor...';

  @override
  String get capturingStatus => 'Yakalanıyor...';

  @override
  String get adjustPositionStatus => 'Konumu ayarlayın';

  @override
  String get validationTip =>
      'İpucu: İyi aydınlatma sağlayın, kamerayı gözden 10-15 cm uzakta tutun, yansımalardan kaçının';

  @override
  String get validationChecksTitle => 'Doğrulama Kontrolleri:';

  @override
  String confidenceLabel(int percent) {
    return 'Güven: $percent%';
  }

  @override
  String get incompleteData => 'Eksik veri';

  @override
  String get irisDiameterLabel => 'iris ø';

  @override
  String get plrResponseCurve => 'PLR Yanıt Eğrisi';

  @override
  String get plrLatency => 'Gecikme';

  @override
  String get plrVelocity => 'Hız';

  @override
  String get plrRecoveryTime => 'İyil. Süresi';

  @override
  String get plrRecoveryRatio => 'İyil. %';

  @override
  String get plrEnhancedMetrics => 'Gelişmiş PLR Ölçümleri';

  @override
  String get plrNormalLatency => 'Normal: 200-500 ms';

  @override
  String get plrNormalConstriction => 'Normal: %10-30';

  @override
  String get plrNormalVelocity => 'Normal: %1,5-4,0/sn';

  @override
  String get plrReferenceValues => 'Normal PLR Referans Değerleri';

  @override
  String get plrSubjectInfo => 'Kişi Bilgileri';

  @override
  String get plrTestType => 'Pupilla Işık Refleksi';

  @override
  String get plrAnalysisSummary => 'Analiz Özeti';

  @override
  String get plrTotalFrames => 'Analiz Edilen Toplam Kare';

  @override
  String get plrSuccessRate => 'Başarı Oranı';

  @override
  String get plrMaxConstriction => 'Maks. Daralma';

  @override
  String get plrResponseCurveLabels => 'PLR Yanıt Eğrisi';

  @override
  String get anwTitle => 'Otonom Sinir Çemberi (ANW)';

  @override
  String get anwAbnormal => 'Anormal';

  @override
  String get anwDiameter => 'Çap';

  @override
  String get anwPerimeter => 'Çevre';

  @override
  String get anwAsymmetry => 'Asimetri';

  @override
  String get anwElevated => 'Yüksek';

  @override
  String get anwFormType => 'Form Türü';

  @override
  String get anwRegular => 'Düzenli';

  @override
  String get anwDrawnIn => 'İçe Çekilmiş';

  @override
  String get anwIndented => 'Girintili';

  @override
  String get anwLacerated => 'Yırtık';

  @override
  String get anwSpastic => 'Spastik';

  @override
  String get anwAtonic => 'Atonik';

  @override
  String get anwTonicState => 'Tarihsel Tonus Deseni';

  @override
  String get anwParasympathotonic => 'Parasimpatotonik desen';

  @override
  String get anwSympathotonicState => 'Simpatotonik desen';

  @override
  String get anwShiftDetected => 'Tarihsel Kayma Deseni';

  @override
  String get anwConstrictionDetected => 'Daralma Tespit Edildi';

  @override
  String get anwFindings => 'Bulgular';

  @override
  String get anwRatioComparison => 'ANW Oranı';

  @override
  String get bilateralANWComparison => 'İki Taraflı ANW Karşılaştırması';

  @override
  String get anwSymmetryNormal => 'ANW simetrisi normal sınırlar içinde.';

  @override
  String get anwAsymmetryDetected =>
      'Gözler arasında ANW asimetrisi tespit edildi.';

  @override
  String get functionalFrustration =>
      'Sempatik ve parasempatik sinir sistemleri arasındaki korelasyonda işlevsel bozukluk.';

  @override
  String get anwParasympathotonicDesc =>
      'Tarihsel gözlemler bunu artan eşik hassasiyetiyle ilişkilendirmiştir. Refleks aktivitesi hızlanmıştır. GI salgı/boşaltım fonksiyonları yükselmiştir.';

  @override
  String get anwSympathotonicDesc =>
      'Tarihsel gözlemler bunu azalmış eşik hassasiyetiyle ilişkilendirmiştir. Refleks aktivitesi yavaşlamıştır. GI salgı/boşaltım fonksiyonları azalmıştır.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Velchover\'a göre tarihsel çalışmalar bunu sol ventrikül aşırı yüklenmesi desenleri ve kardiyak stresle ilişkilendirmiştir.';

  @override
  String get anwFrontalConstricted =>
      'Pupilla kuşağının frontal bölgesi daralmıştır.';

  @override
  String get anwBasalConstricted =>
      'Pupilla kuşağının bazal bölgesi daralmıştır.';

  @override
  String get anwFrontalBasalConstricted =>
      'Pupilla kuşağının frontal ve bazal bölgeleri daralmıştır.';

  @override
  String get helpTitle => 'Yardım ve Kullanıcı Kılavuzu';

  @override
  String get helpTabQuickStart => 'Hızlı Başlangıç';

  @override
  String get helpTabCnriAnalysis => 'CNRI Analizi';

  @override
  String get helpTabShortcuts => 'Kısayollar';

  @override
  String get helpTabTroubleshooting => 'Sorun Giderme';

  @override
  String get helpOnlineDocs => 'Çevrimiçi Belgeler';

  @override
  String get helpContactSupport => 'Destek ile İletişim';

  @override
  String get helpGettingStarted => 'Başlarken';

  @override
  String get helpStep1Title => 'İriskopunuzu Bağlayın';

  @override
  String get helpStep1Desc => 'Dino-Lite veya uyumlu bir USB iriskop bağlayın.';

  @override
  String get helpStep2Title => 'Hasta Bilgilerini Girin';

  @override
  String get helpStep2Desc =>
      'Hasta adı, yaşı, cinsiyeti ve başlıca şikayetleri doldurun.';

  @override
  String get helpStep3Title => 'Sağ Gözü Yakalayın (OD)';

  @override
  String get helpStep3Desc =>
      'İriskopun konumunu ayarlayın ve sağ göz görüntüsünü yakalayın.';

  @override
  String get helpStep4Title => 'Sol Gözü Yakalayın (OS)';

  @override
  String get helpStep4Desc =>
      'Tutarlı aydınlatma ile sol göz için tekrarlayın.';

  @override
  String get helpStep5Title => 'Analizi İnceleyin';

  @override
  String get helpStep5Desc =>
      'Uygulama P/I oranını, pupil formunu ve ANW özelliklerini analiz eder.';

  @override
  String get helpStep6Title => 'Raporu Dışa Aktar';

  @override
  String get helpStep6Desc => 'PDF, TXT veya JSON formatında kaydedin.';

  @override
  String get helpTipBestResults =>
      'En iyi sonuçlar için: Tutarlı aydınlatma kullanın ve iriskop mesafesini 2-3 cm olarak koruyun.';

  @override
  String get helpCnriProtocolFeatures => 'CNRI Protokol Özellikleri';

  @override
  String get helpFeaturePiRatioTitle => 'Pupil/İris Oranı (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal: %20-30. Bu aralık dışındaki değerler otonom dengesizliğe işaret edebilir.';

  @override
  String get helpFeaturePupilFormTitle => 'Pupil Form Analizi';

  @override
  String get helpFeaturePupilFormDesc =>
      'Oval desenleri, yerinden kayma yönünü ve eksantrikliği tespit eder.';

  @override
  String get helpFeatureAnwTitle => 'ANW (Kolar) Değerlendirmesi';

  @override
  String get helpFeatureAnwDesc =>
      'Oranı, form düzenliliğini, sektör kaymalarını ve tonik durumu analiz eder.';

  @override
  String get helpFeatureZoneTitle => 'Bölge Analizi';

  @override
  String get helpFeatureZoneDesc =>
      'Düzleşmeleri/çıkıntıları CNRI organ bölgelerine eşler.';

  @override
  String get helpFeatureBilateralTitle => 'İki Taraflı Karşılaştırma';

  @override
  String get helpFeatureBilateralDesc =>
      'Asimetrileri tespit etmek için OD - OS karşılaştırması yapar.';

  @override
  String get helpFeatureMlTitle => 'ONNX CNN Karşılaştırması';

  @override
  String get helpFeatureMlDesc =>
      'ONNX CNN modeli karşılaştırma için ikincil ölçümler sağlar.';

  @override
  String get helpKeyboardShortcuts => 'Klavye Kısayolları';

  @override
  String get helpCameraControls => 'Kamera Kontrolleri';

  @override
  String get helpShortcutSpace => 'Görüntü yakala';

  @override
  String get helpShortcutCtrlS => 'PDF raporu kaydet';

  @override
  String get helpShortcutCtrlO => 'Galeri görüntüsü aç';

  @override
  String get helpShortcutCtrlH => 'Tarama geçmişini görüntüle';

  @override
  String get helpShortcutF11 => 'Tam ekranı aç/kapat';

  @override
  String get helpShortcutEsc => 'Geri git / İptal';

  @override
  String get helpShortcutScroll => 'Yakınlaştır/Uzaklaştır';

  @override
  String get helpShortcutDoubleClick => 'Yakınlaştırmayı sıfırla';

  @override
  String get helpCommonIssues => 'Sık Karşılaşılan Sorunlar';

  @override
  String get helpIssueCameraNotDetected => 'Kamera algılanamıyor';

  @override
  String get helpIssueCameraSolution1 => 'USB bağlantısını kontrol edin';

  @override
  String get helpIssueCameraSolution2 => 'Farklı USB portu deneyin';

  @override
  String get helpIssueCameraSolution3 => 'Dino-Lite sürücülerini yükleyin';

  @override
  String get helpIssueCameraSolution4 => 'Uygulamayı yeniden başlatın';

  @override
  String get helpIssuePupilDetectionFails => 'Pupil tespiti başarısız';

  @override
  String get helpIssuePupilSolution1 => 'Yeterli aydınlatma sağlayın';

  @override
  String get helpIssuePupilSolution2 => 'Pupili çerçeve ortasına getirin';

  @override
  String get helpIssuePupilSolution3 => 'İriskop lensini temizleyin';

  @override
  String get helpIssuePupilSolution4 => 'Odağı manuel olarak ayarlayın';

  @override
  String get helpIssuePdfExportFails => 'PDF dışa aktarma başarısız';

  @override
  String get helpIssuePdfSolution1 => 'Klasör izinlerini kontrol edin';

  @override
  String get helpIssuePdfSolution2 =>
      'Disk alanının yeterli olduğundan emin olun';

  @override
  String get helpIssuePdfSolution3 => 'Açık PDF dosyalarını kapatın';

  @override
  String get helpIssuePdfSolution4 => 'Önce TXT dışa aktarmayı deneyin';

  @override
  String get helpCaptureChecklistTitle => 'Yakalama Kontrol Listesi';

  @override
  String get helpCaptureChecklist1 =>
      'Pupili ortalanmış ve çerçeve içinde tamamen görünür tutun.';

  @override
  String get helpCaptureChecklist2 =>
      'Düzgün aydınlatma kullanın ve kornea üzerindeki yansımayı azaltın.';

  @override
  String get helpCaptureChecklist3 =>
      'Sağ ve sol göz için iriskop mesafesini benzer tutun.';

  @override
  String get helpCaptureChecklist4 =>
      'Pupil kenarı yumuşak veya bulanık görünüyorsa yeniden odaklayın ya da yeniden çekin.';

  @override
  String get helpExportSettingsTitle => 'Dışa Aktarma Ayarları';

  @override
  String get helpExportSettingsDesc =>
      'PDF otomatik kaydet, analizden sonra bir raporu kaydedebilir; Görüntüleri Dahil Et, PDF\'de göz fotoğraflarının görünüp görünmeyeceğini kontrol eder; ML Karşılaştırmasını Göster ise ONNX CNN karşılaştırma değerlerini raporlara ekler.';

  @override
  String get helpHybridScoreTitle => 'Hibrit Güven ve Derece';

  @override
  String get helpHybridScoreDesc =>
      'Görüntülenen güven ve derece, klasik geometri kalitesini ML uyumuyla birleştirir; bu nedenle ölçüm güvenilirliğini yansıtır, tanı niteliği taşımaz.';

  @override
  String get helpAnomalyGuideTitle => 'Düzleşmeler ve Çıkıntıları Okuma';

  @override
  String get helpAnomalyGuideDesc =>
      'Düzleşmeler pupil sınırı boyunca görece içe çekilmeyi, çıkıntılar ise dışa çekilmeyi gösterir; her kart bölgeyi, büyüklüğü ve eşlenen ilişkiyi listeler.';

  @override
  String get helpZoneOverlayGuideTitle => 'Bölge Katmanı';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Sektör konumlarını görsel olarak incelemek ve tespit edilen anomalilerin pupil ve iris çevresinde nereye düştüğünü çapraz kontrol etmek için bölge katmanını kullanın.';

  @override
  String get helpContactSupportTip =>
      'Yardım için helpdesk@cnri.edu ile iletişime geçin.';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsCameraIriscope => 'KAMERA / İRİSKOP';

  @override
  String get settingsPreferredCamera => 'Tercih Edilen Kamera:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB Kamera';

  @override
  String get settingsCameraAutoDetect => 'Otomatik algıla';

  @override
  String get settingsDefaultZoom => 'Varsayılan Yakınlaştırma:';

  @override
  String get settingsAnalysis => 'ANALİZ';

  @override
  String get settingsShowMlComparison => 'ML Karşılaştırmasını Göster';

  @override
  String get settingsShowZoneOverlay => 'Bölge Katmanını Göster';

  @override
  String get settingsExportReports => 'DIŞA AKTARMA VE RAPORLAR';

  @override
  String get settingsAutoSavePdf => 'PDF Otomatik Kaydet';

  @override
  String get settingsIncludeImages => 'Görüntüleri Dahil Et';

  @override
  String get settingsSaved => 'Ayarlar kaydedildi';

  @override
  String get aboutResearchEdition => 'Araştırma Sürümü';

  @override
  String aboutVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get aboutLicense => 'Lisans';

  @override
  String get aboutLicensedTo => 'Lisanslanan Kişi:';

  @override
  String get aboutExpires => 'Bitiş Tarihi:';

  @override
  String get aboutManageLicense => 'Lisansı Yönet';

  @override
  String get aboutBasedOnCnri => 'CNRI Protokolüne Dayalı';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Web Sitesi';

  @override
  String get aboutPrivacy => 'Gizlilik';

  @override
  String get languageSelectTitle => 'Dil Seçin';

  @override
  String get selectLanguage => 'Dil Seçin';

  @override
  String get languageChanged => 'Dil Değiştirildi';

  @override
  String languageChangedMessage(String language) {
    return 'Uygulama dili $language olarak ayarlandı';
  }

  @override
  String get languageSystemNotAvailable => 'Dil sistemi kullanılamıyor';

  @override
  String get licenseLoading => 'Yükleniyor...';

  @override
  String get licenseWelcome => 'PupilMetrics\'e Hoş Geldiniz!';

  @override
  String get licenseTrialFeatures =>
      '14 günlük ücretsiz deneme • Tüm özellikler';

  @override
  String get licenseStartTrial => 'Ücretsiz Denemeyi Başlat';

  @override
  String get licenseEnterKey => 'Lisans Girin';

  @override
  String get licenseFreeTrial => 'Ücretsiz Deneme';

  @override
  String licenseDaysRemaining(int count) {
    return '$count gün kaldı';
  }

  @override
  String get licenseTrialEnded => 'Deneme Süresi Sona Erdi';

  @override
  String get licenseEnterToContinue => 'Devam etmek için lisans girin';

  @override
  String get licenseStandard => 'Standart Lisans';

  @override
  String get licenseProfessional => 'Profesyonel Lisans';

  @override
  String get licenseEnterprise => 'Kurumsal Lisans';

  @override
  String get licenseLicensed => 'Lisanslı';

  @override
  String get licenseActive => 'Aktif';

  @override
  String get licenseTrialUser => 'Deneme Kullanıcısı';

  @override
  String get licenseLifetime => 'Ömür Boyu';

  @override
  String get licenseNotSetUp => 'Kurulmadı';

  @override
  String get trialExpiredTitle => 'Deneme Süresi Sona Erdi';

  @override
  String get trialExpiredMessage =>
      '14 günlük denemeniz sona erdi. İris görüntülerini analiz etmeye devam etmek için lütfen bir lisans satın alın.';

  @override
  String get trialExpiredCanStill => 'Hâlâ yapabilecekleriniz:';

  @override
  String get trialExpiredViewAnalyses => 'Önceki analizlerinizi görüntüleyin';

  @override
  String get trialExpiredExportReports => 'Mevcut raporları dışa aktarın';

  @override
  String get trialExpiredAccessHistory => 'Tarama geçmişine erişin';

  @override
  String get trialExpiredMaybeLater => 'Belki Daha Sonra';

  @override
  String get licenseRegistration => 'Lisans Kaydı';

  @override
  String get licenseStatusValid => 'Lisanslı';

  @override
  String get licenseStatusTrialActive => 'Ücretsiz Deneme';

  @override
  String get licenseStatusTrialExpired => 'Deneme Sona Erdi';

  @override
  String get licenseStatusExpired => 'Lisans Süresi Doldu';

  @override
  String get licenseStatusInvalid => 'Geçersiz Lisans';

  @override
  String get licenseStatusUnregistered => 'Kurulmadı';

  @override
  String get licenseStatusMachineMismatch => 'Farklı Bilgisayar';

  @override
  String get licenseStatusNetworkError => 'Bağlantı Hatası';

  @override
  String get licenseEnterKeyTitle => 'Lisans Anahtarı Girin';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Adınız';

  @override
  String get licenseEmailAddress => 'E-posta Adresi';

  @override
  String get licenseMachineId => 'Makine Kimliği';

  @override
  String get licenseCopyMachineId => 'Makine Kimliğini Kopyala';

  @override
  String get licenseMachineIdCopied => 'Makine kimliği panoya kopyalandı';

  @override
  String get licenseValidationKeyRequired => 'Lütfen lisans anahtarınızı girin';

  @override
  String get licenseValidationKeyFormat =>
      'Lisans anahtarı 20 karakter olmalıdır (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Lütfen adınızı girin';

  @override
  String get licenseValidationEmailRequired => 'Lütfen e-postanızı girin';

  @override
  String get licenseValidationEmailInvalid =>
      'Lütfen geçerli bir e-posta girin';

  @override
  String get licenseActivate => 'Lisansı Etkinleştir';

  @override
  String get licenseContinueTrial => 'Denemeye Devam Et';

  @override
  String get licenseBuyLicense => 'Lisans Satın Al';

  @override
  String get licenseNeedHelp => 'Yardıma mı ihtiyacınız var?';

  @override
  String get licenseLicenseAgreement => 'Lisans Sözleşmesi';

  @override
  String get licenseActivatedSuccess => 'Lisans Başarıyla Etkinleştirildi!';

  @override
  String get licenseMsgMachineMismatch =>
      'Bu lisans farklı bir bilgisayara kayıtlıdır. Lütfen orijinal cihazınızı kullanın veya destekle iletişime geçin.';

  @override
  String get licenseMsgTrialEnded =>
      'Ücretsiz deneme süreniz sona erdi. Tüm özellikleri kullanmaya devam etmek için bir lisans anahtarı girin.';

  @override
  String get licenseMsgExpired =>
      'Lisansınızın süresi doldu. Devam etmek için lütfen yenileyin.';

  @override
  String get licenseMsgNeedsSetup =>
      'Lisans kurulması gerekiyor. Ücretsiz denemenizi başlatın veya bir lisans anahtarı girin.';

  @override
  String get licenseMsgCheckFormat =>
      'Lütfen lisans anahtarı formatınızı kontrol edin. Şu şekilde görünmelidir: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Bu lisans anahtarı tanınmadı. Lütfen tekrar kontrol edip deneyin.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Bu anahtar zaten farklı bir bilgisayara kayıtlıdır.';

  @override
  String get licenseMsgContactSupport =>
      'Bu lisansın süresi dolmuştur. Yenileme için lütfen destekle iletişime geçin.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Lisans başarıyla etkinleştirildi! Satın alımınız için teşekkür ederiz.';

  @override
  String get licenseMsgUnableToActivate =>
      'Lisans etkinleştirilemiyor. Lütfen internet bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Hoş geldiniz! $days günlük ücretsiz denemeniz başladı.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Deneme aktif: $days gün kaldı.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Ücretsiz deneme aktif';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Lisans aktif - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Bu lisans anahtarı etkinleştirilemiyor.';

  @override
  String get licenseMsgNoLongerValid => 'Lisans artık geçerli değil.';

  @override
  String get licenseMsgUnableToVerify =>
      'Bu lisans anahtarı doğrulanamıyor. Lütfen destekle iletişime geçin.';

  @override
  String get trialStartedSnackbar => 'Deneme Başladı!';

  @override
  String get trialStartedMessage => '14 günlük tam erişimin keyfini çıkarın';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'ThemeMode';

  @override
  String get methods => 'YÖNTEMLER';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => 'focus / blur';

  @override
  String get showHide => 'show / hide';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => 'maximize / unmaximize';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => 'minimize / restore';

  @override
  String get dockUndock => 'dock / undock';

  @override
  String get dockLeft => 'sola yerleştir';

  @override
  String get dockRight => 'sağa yerleştir';

  @override
  String get undock => 'undock';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'sıfırla';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'şeffaf';

  @override
  String get red => 'kırmızı';

  @override
  String get green => 'yeşil';

  @override
  String get blue => 'mavi';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'topLeft';

  @override
  String get topCenter => 'topCenter';

  @override
  String get topRight => 'topRight';

  @override
  String get centerLeft => 'centerLeft';

  @override
  String get centerRight => 'centerRight';

  @override
  String get bottomLeft => 'bottomLeft';

  @override
  String get bottomCenter => 'bottomCenter';

  @override
  String get bottomRight => 'bottomRight';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Ayarla';

  @override
  String get getMinimumSizeSetMinimumSize => 'getMinimumSize / setMinimumSize';

  @override
  String get getMaximumSizeSetMaximumSize => 'getMaximumSize / setMaximumSize';

  @override
  String get isResizableSetResizable => 'isResizable / setResizable';

  @override
  String get isMovableSetMovable => 'isMovable / setMovable';

  @override
  String get isMinimizableSetMinimizable => 'isMinimizable / setMinimizable';

  @override
  String get isMaximizableSetMaximizable => 'isMaximizable / setMaximizable';

  @override
  String get isClosableSetClosable => 'isClosable / setClosable';

  @override
  String get isAlwaysOnTopSetAlwaysOnTop => 'isAlwaysOnTop / setAlwaysOnTop';

  @override
  String get isAlwaysOnBottomSetAlwaysOnBottom =>
      'isAlwaysOnBottom / setAlwaysOnBottom';

  @override
  String get getTitleSetTitle => 'getTitle / setTitle';

  @override
  String get setTitleBarStyle => 'setTitleBarStyle';

  @override
  String get hidden => 'gizli';

  @override
  String get getTitleBarHeight => 'getTitleBarHeight';

  @override
  String get isSkipTaskbar => 'isSkipTaskbar';

  @override
  String get setSkipTaskbar => 'setSkipTaskbar';

  @override
  String get setProgressBar => 'setProgressBar';

  @override
  String get setIcon => 'setIcon';

  @override
  String get defaultIcon => 'Varsayılan';

  @override
  String get original => 'Orijinal';

  @override
  String get isVisibleOnAllWorkspacesSetVisibleOnAllWorkspaces =>
      'isVisibleOnAllWorkspaces / setVisibleOnAllWorkspaces';

  @override
  String get setBadgeLabel => 'setBadgeLabel';

  @override
  String get hasShadowSetHasShadow => 'hasShadow / setHasShadow';

  @override
  String get getOpacitySetOpacity => 'getOpacity / setOpacity';

  @override
  String get setIgnoreMouseEvents => 'setIgnoreMouseEvents';

  @override
  String get popUpWindowMenu => 'popUpWindowMenu';

  @override
  String get grabKeyboard => 'grabKeyboard';

  @override
  String get ungrabKeyboard => 'ungrabKeyboard';

  @override
  String get dragToMoveArea => 'DragToMoveArea';

  @override
  String get dragToResizeArea => 'DragToResizeArea';

  @override
  String get dragToResizeAreaExample => 'DragToResizeArea örneği';

  @override
  String get closeWindowConfirmation =>
      'Bu pencereyi kapatmak istediğinizden emin misiniz?';

  @override
  String get licenseChecking => 'Lisans kontrol ediliyor...';

  @override
  String get licenseRequiredTitle => 'Lisans Gerekli';

  @override
  String get licenseActivateValidMessage =>
      'Devam etmek için lütfen geçerli bir lisans etkinleştirin.';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro şunları içerir:';

  @override
  String get licenseFeatureUnlimitedAnalysis => 'Sınırsız pupil-kolar analizi';

  @override
  String get licenseFeaturePdfReports => 'PDF rapor oluşturma';

  @override
  String get licenseFeatureBilateralComparison => 'İki taraflı karşılaştırma';

  @override
  String get licenseFeatureAnwAnalysis => 'ANW kolar analizi';

  @override
  String get licenseFeatureScanHistory => 'Tarama geçmişi veritabanı';

  @override
  String get licenseFeatureUpdates => '1 yıl ücretsiz güncelleme';

  @override
  String get licensePurchase => 'Lisans Satın Al';

  @override
  String get licenseExitApplication => 'Uygulamadan Çık';

  @override
  String get windowCompactView => 'Kompakt Görünüm';

  @override
  String get windowExpandedView => 'Genişletilmiş Görünüm';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return 'Deneme ($count gün kaldı)';
  }

  @override
  String get licenseNotLicensed => 'Lisanslanmamış';

  @override
  String get licenseStatusTitle => 'Lisans Durumu';

  @override
  String get unknown => 'Bilinmiyor';

  @override
  String get plrReportTitle => 'PLR Analiz Raporu';

  @override
  String get plrResearchOnlyTitle => 'YALNIZCA ARAŞTIRMA/EĞİTİM ARACI';

  @override
  String get plrResearchDisclaimer =>
      'Sonuçlar tıbbi tanı DEĞİLDİR. Sağlık uzmanına danışın.';

  @override
  String get plrNameLabel => 'Ad';

  @override
  String plrAgeYears(int age) {
    return 'Yaş: $age yıl';
  }

  @override
  String get plrTestLabel => 'Test';

  @override
  String get plrSummaryTitle => 'PLR Özeti';

  @override
  String plrGradeValue(String grade) {
    return 'Derece $grade';
  }

  @override
  String get plrStatusLabel => 'Durum';

  @override
  String get plrDetectedStatus => 'PLR TESPİT EDİLDİ';

  @override
  String get plrWeakNotDetectedStatus => 'ZAYIF/TESPİT EDİLEMEDİ';

  @override
  String get plrRecoveryTimeLabel => 'İyileşme Süresi';

  @override
  String get plrRecoveryRatioLabel => 'İyileşme Oranı';

  @override
  String get plrChartDescription =>
      'Zaman içinde pupil yanıtının görsel gösterimi';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I Aralığı: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Kare Verileri';

  @override
  String get plrTableTime => 'Süre';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Faz';

  @override
  String get plrTableConfidenceShort => 'Güv.';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Başarılı: $success | Başarısız: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Gecikme: 200-500 ms (ilk yanıt süresi)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Daralma: Başlangıç değerinden %10-30 azalma';

  @override
  String get plrReferenceVelocityLine => '• Hız: %1,5-4,0/saniye';

  @override
  String get plrReferenceRecoveryLine =>
      '• İyileşme: 5 saniye içinde başlangıç değerinin >%75\'ine dönüş';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• İyileşme: 5 sn içinde başlangıç değerinin >%75\'ine dönüş';

  @override
  String plrShareSubject(String eye) {
    return 'PLR Analiz Raporu - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR VİDEO ANALİZ RAPORU';

  @override
  String get plrTextDisclaimerTitle =>
      'SORUMLULUK REDDİ: Yalnızca Araştırma/Eğitim Aracı';

  @override
  String get plrTextDisclaimerBody => 'Sonuçlar tıbbi tanı DEĞİLDİR.';

  @override
  String get plrOverallGradeLabel => 'Genel Derece';

  @override
  String get plrEndOfReport => 'RAPORUN SONU';

  @override
  String get zoneOverlay => 'Bölge Katmanı';

  @override
  String get tipDragImage =>
      'İpucu: limbusu katman çemberleriyle hizalamak için görüntüyü sürükleyin.';

  @override
  String get overlayMetrics => 'Katman Metrikleri';

  @override
  String get piRatioLabel => 'P/I Oranı:';

  @override
  String get ellipsenessLabel => 'Elipslik:';

  @override
  String get decentralizationLabel => 'Merkezden Sapma:';

  @override
  String get detectedFindings => 'Tespit edilen bulgular';

  @override
  String get anwCollarette => 'ANW / KOLAR';

  @override
  String get observerNotes => 'Gözlemci notları';

  @override
  String get observerNotesHint =>
      'Klinik gözlemleri, bölge bulgularını, desenleri girin...';

  @override
  String get autoCenter => 'Otomatik ortala';

  @override
  String get anwRing => 'ANW Halkası';

  @override
  String get axisGrid => 'Eksen/Izgara';

  @override
  String get chart => 'Grafik';

  @override
  String get hoverToIdentify =>
      'Bir bölgeyi tanımlamak için üzerine gelin veya dokunun';

  @override
  String get organsMode => 'Organ modu - bölgeleri tanımlamak için irise gelin';

  @override
  String get mildSizeDiff =>
      'Hafif boyut farkı. Fizyolojik varyasyon olabilir.';

  @override
  String withinBaseline(Object age, Object group) {
    return '$age yaş ($group) için araştırma referans değeri içinde';
  }

  @override
  String get formLabel => 'Form:';

  @override
  String get flatteningLabel => 'Düzleşme:';

  @override
  String get protrusionLabel => 'Çıkıntı:';

  @override
  String get decentrationLabel => 'Merkezden Sapma:';

  @override
  String get pupilSizeLabel => 'Pupil boyutu:';

  @override
  String get anwRatioLabel => 'ANW oranı:';

  @override
  String get anwToneLabel => 'ANW tonu:';

  @override
  String get noMajorODAnomalies => 'Önemli OD pupil anomalisi yok.';

  @override
  String get noMajorOSAnomalies => 'Önemli OS pupil anomalisi yok.';

  @override
  String get anwNotAssessed => 'ANW: değerlendirilmedi';

  @override
  String get manualAlignmentAid =>
      'Yalnızca inceleme için manuel hizalama yardımı (yakalama sonrası). Görüntüyü sürükleyin veya Otomatik ortala\'yı kullanın.';

  @override
  String get frontalShift => 'S: Frontal kayma deseni.';

  @override
  String get cerebralCirculation =>
      'Velchover\'a göre tarihsel çalışmalar bunu serebral dolaşım desenleriyle ilişkilendirmiştir.';

  @override
  String get middleTemporalShift => 'D: Orta-temporal kayma deseni.';

  @override
  String get respiratoryCardiac =>
      'Velchover\'a göre tarihsel çalışmalar bunu solunum ve kardiyak otonom desenleriyle ilişkilendirmiştir.';

  @override
  String get findings => 'Bulgular:';

  @override
  String get analysisReportTitle => 'Pupil Analiz Raporu';

  @override
  String get reportResearchVersion => 'Araştırma Sürümü';

  @override
  String get reportDisclaimerTitle =>
      'SORUMLULUK REDDİ: Yalnızca Araştırma/Eğitim Aracı';

  @override
  String get reportDisclaimerBody =>
      'Sonuçlar araştırma gözlemleridir, tıbbi tanı DEĞİLDİR.';

  @override
  String get reportPersonInformationTitle => 'Kişi Bilgileri';

  @override
  String get reportAgeGroupLabel => 'Yaş Grubu';

  @override
  String get reportPupilSizeComparisonTitle => 'Pupil Boyutu Karşılaştırması';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Yakalama Mesafesi Metrikleri';

  @override
  String get reportResearchObservationsTitle => 'Araştırma Gözlemleri';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Gözlemci Notları (Bölge Katmanı)';

  @override
  String get reportEndOfReport => 'RAPORUN SONU';

  @override
  String get reportGradeLabel => 'Derece';

  @override
  String get reportPupilFormTitle => 'Pupil Formu';

  @override
  String get reportDecentrationTitle => 'Merkezden Sapma';

  @override
  String get reportFlatteningsTitle => 'Düzleşmeler';

  @override
  String get reportProtrusionsTitle => 'Çıkıntılar';

  @override
  String get reportAnwParametersTitle => 'Otonom Sinir Çemberi (ANW)';

  @override
  String get reportTonicStateLabel => 'Tarihsel Tonus Deseni';

  @override
  String get reportShiftDetectedTitle => 'Tarihsel Kayma Deseni';

  @override
  String get reportClinicalLabel => 'Tarihsel Not';

  @override
  String get reportConstrictionDetectedTitle => 'Daralma Tespit Edildi';

  @override
  String get reportSeverityLabel => 'Şiddet';

  @override
  String get reportReferenceValuesTitle =>
      'Referans Değerleri (CNRI Araştırma Protokolü)';

  @override
  String get reportMatchLabel => 'Eşleşme';

  @override
  String get reportValueLabel => 'Değer';

  @override
  String get reportNormalPupilForm => 'Normal pupil formu';

  @override
  String reportPageXofY(int page, int total) {
    return 'Sayfa $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Pupil Analiz Raporu - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return '$patientName için $date tarihinde oluşturulan pupil analiz raporu ektedir.';
  }

  @override
  String belowBaseline(int age, String group) {
    return '$age yaş ($group) için araştırma referans değerinin altında';
  }

  @override
  String aboveBaseline(int age, String group) {
    return '$age yaş ($group) için araştırma referans değerinin üstünde';
  }

  @override
  String get ageGroupInfant => 'Bebek';

  @override
  String get ageGroupChild15 => 'Çocuk (1-5)';

  @override
  String get ageGroupChild611 => 'Çocuk (6-11)';

  @override
  String get ageGroupTeen => 'Genç';

  @override
  String get ageGroupAdult2039 => 'Yetişkin (20-39)';

  @override
  String get ageGroupAdult4059 => 'Yetişkin (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Yaşlı (60+)';

  @override
  String get middleNasalShift => 'Orta-nazal kayma deseni.';

  @override
  String get upperTemporalShift => 'Üst-temporal kayma deseni.';

  @override
  String get lowerTemporalShift => 'Alt-temporal kayma deseni.';

  @override
  String get basalShift => 'Bazal kayma deseni.';

  @override
  String get vagusStellateAssociation =>
      'Velchover\'a göre tarihsel çalışmalar bunu vagus siniri veya stellat ganglionun hipofonksiyon desenleriyle ilişkilendirmiştir.';

  @override
  String get venaCavaInferiorAssociation =>
      'Velchover\'a göre tarihsel çalışmalar bunu inferior vena kavadaki hemodinamik bozukluk desenleriyle ilişkilendirmiştir.';

  @override
  String get vertebralArteryAssociation =>
      'Velchover\'a göre tarihsel çalışmalar bunu vertebral arter dolaşım desenleriyle ilişkilendirmiştir.';

  @override
  String get smallPelvisAssociation =>
      'Velchover\'a göre tarihsel çalışmalar bunu küçük pelvisteki konjesyon desenleriyle ilişkilendirmiştir.';

  @override
  String get openZoneOverlay => 'Bölge katmanını aç';

  @override
  String get iris => 'İris';

  @override
  String get chartOpacity => 'Grafik saydamlığı';

  @override
  String get irisSizeNotAvailable => 'İris boyutu verisi mevcut değil';

  @override
  String get ratio => 'Oran';

  @override
  String get reportRefPiRatio => 'Pupil/İris Oranı: Normal %20-30';

  @override
  String get reportRefEllipseness => 'Elipslik: Normal >%95';

  @override
  String get reportRefDecentralization => 'Merkezden Sapma: Normal <%5';

  @override
  String get reportRefPupilSizeDiff =>
      'Pupil Boyutu Farkı: <%2 Normal, %2-4 Hafif, >%4 Önemli';

  @override
  String get enterPatientInfoAnalysis => 'Hasta Bilgisi Girin → Analiz';

  @override
  String get chooseCaptureMethod => 'Yakalama yöntemini seçin:';

  @override
  String get usbCamera => 'USB Kamera';

  @override
  String get selectExistingImage => 'Mevcut görüntüyü seçin';

  @override
  String get detectingCameras => 'Kameralar algılanıyor...';

  @override
  String get retryDetection => 'Algılamayı Yeniden Dene';

  @override
  String get connectUvcCameraViaUsb => 'UVC kamerayı USB ile bağlayın';

  @override
  String get ensureCameraDriversInstalled =>
      'Kamera sürücülerinin yüklendiğinden emin olun';

  @override
  String get tapRefreshToDetect =>
      'Kameraları algılamak için Yenile\'ye dokunun';

  @override
  String get connectUsbCameraToBegin => 'Başlamak için USB kamerayı bağlayın';

  @override
  String get noExternalCameraTitle => 'Harici Kamera Algılanamadı';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'USB iriskopunuzu bağlayın ve takılı olduğundan emin olun';

  @override
  String get languagesAvailable => 'Mevcut Diller';

  @override
  String get validationChecks => 'Doğrulama Kontrolleri:';

  @override
  String get eyeQualityTip =>
      'İpucu: İyi aydınlatma sağlayın ve gözü sabit tutun';

  @override
  String get validatingEye => 'Göz doğrulanıyor...';

  @override
  String get initializing => 'Başlatılıyor...';

  @override
  String get nameLabel => 'Ad:';

  @override
  String get ageLabel => 'Yaş:';

  @override
  String get typeLabel => 'Tür:';

  @override
  String get pleaseEnterName => 'Lütfen adı girin';

  @override
  String get pleaseEnterAge => 'Lütfen yaşı girin';

  @override
  String get ageMustBe2Digits => 'Yaş 1 veya 2 basamaklı olmalıdır';

  @override
  String get optional => '(İsteğe Bağlı)';

  @override
  String get bilateralBothHands => 'Her iki elin iki taraflı kullanımı';

  @override
  String get zoom => 'Yakınlaştırma';

  @override
  String get zoomSliderTip =>
      'Kayıt öncesinde büyütmeyi ayarlamak için sağdaki yakınlaştırma kaydırıcısını kullanın.';

  @override
  String get aboutProgramDeveloper =>
      'Program Geliştiricisi - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Grafik boyutu';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Grafik saydamlığı (0 = yalnızca üzerine gelindiğinde / Organ modu)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Bitti ve Geri Dön';

  @override
  String get errorImageShape =>
      'Görüntü şekli hatalı - gözün çerçeveyi doldurduğundan emin olun';

  @override
  String get cameraConnected => 'Kamera bağlandı';

  @override
  String get cameraDisconnected => 'Kamera bağlantısı kesildi';

  @override
  String get cameraPermissionDenied => 'Kamera izni reddedildi';

  @override
  String get cameraFailedInit => 'Kamera başlatılamadı';

  @override
  String get cameraInUse => 'Kamera başka bir uygulama tarafından kullanılıyor';

  @override
  String get cameraFormatNotSupported => 'Kamera formatı desteklenmiyor';

  @override
  String get capturedImageNotFound => 'Yakalanan görüntü dosyası bulunamadı';

  @override
  String get failedToCaptureImage => 'Görüntü yakalanamadı';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Kamera hatası oluştu';

  @override
  String get connectingToUsbIriscope => 'USB iriskopa bağlanılıyor...';

  @override
  String get noCamerasDetectedMessage =>
      'Hiçbir kamera algılanamadı. Lütfen USB kameranızın bağlı olduğundan ve sisteminiz tarafından tanındığından emin olun.';

  @override
  String get failedToAccessCameras => 'Kameralara erişilemedi';

  @override
  String get notAnEyeImageTitle => 'Göz Görüntüsü Değil';

  @override
  String get notAnEyeImageBody =>
      'Seçilen görüntü bir göz gibi görünmüyor.\n\nLütfen iris/pupil\'in net bir fotoğrafını seçin ve tekrar deneyin.';

  @override
  String get notAnEyeImageBodyCapture =>
      'Çekilen görüntü bir göz gibi görünmüyor.\n\nLütfen iriskop\'u doğrudan gözün üzerine konumlandırın ve yeniden çekin.';

  @override
  String get anisocoriaObservationSymmetrical => 'Simetrik';

  @override
  String get anisocoriaObservationSlight => 'Hafif farklılık';

  @override
  String get anisocoriaObservationModerate => 'Orta düzeyde farklılık';

  @override
  String get anisocoriaObservationMarked => 'Belirgin farklılık';

  @override
  String get settingsNaturalMedicineSection => 'Doğal Tıp';

  @override
  String get settingsHerbalToggle => 'Bitkisel Öneriler (iris bölgesi tabanlı)';

  @override
  String get settingsNutritionToggle =>
      '7 Renk Diyet Beslenme (iris bölgesi tabanlı)';

  @override
  String get settingsChiropracticToggle =>
      'Kiroprakter / Omurga Değerlendirmesi';

  @override
  String get settingsTcmToggle => 'Geleneksel Çin Tıbbı (GÇT)';

  @override
  String get therapyHerbalTitle => 'Bitkisel Öneriler';

  @override
  String get therapyHerbalSubtitle =>
      'İris bölgesi bulguları — kanıt ağırlığına göre sıralı';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count referans';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'Bitkisel öneriler yalnızca eğitim amaçlıdır. Kullanmadan önce nitelikli bir sağlık uzmanına danışın.';

  @override
  String get therapyNutritionTitle => '7 Renk Diyet Beslenme';

  @override
  String get therapyNutritionSubtitle =>
      'İris bölgesi organları için gıdalar ve besinler';

  @override
  String get therapyNutritionFoodsByColor => 'Renge Göre Önerilen Gıdalar';

  @override
  String get therapyNutritionKeyNutrients => 'Temel Besinler';

  @override
  String get therapyNutritionHerbs => 'Destekleyici Bitkiler ve Baharatlar';

  @override
  String get therapyNutritionNotes => 'Beslenme Notları';

  @override
  String get therapyNutritionTonifying => 'Güçlendirici gıdalar:';

  @override
  String get therapyNutritionAvoid => 'Azalt / kaçın:';

  @override
  String get therapyNutritionDisclaimer =>
      'Beslenme önerileri 7 Renk Diyet çerçevesine dayanmakta olup yalnızca eğitim amaçlıdır. Diyet değişikliği yapmadan önce bir uzmanla görüşün.';

  @override
  String get therapyChiroTitle => 'Kiropraktik Değerlendirme';

  @override
  String get therapyChiroSubtitle =>
      'İris bölgesi bulgularının işaret ettiği omurga segmentleri';

  @override
  String get therapyChiroVertebrae => 'Omurlar';

  @override
  String get therapyChiroNerveRoots => 'Sinir Kökleri';

  @override
  String get therapyChiroInnervated => 'İnnervasyonlu Yapılar';

  @override
  String get therapyChiroSubluxation => 'Olası Subluksasyon Göstergeleri';

  @override
  String get therapyChiroMuscles => 'Sıklıkla Etkilenen Kaslar';

  @override
  String get therapyChiroAdjusting => 'Kiropraktik Düzeltme Yaklaşımı';

  @override
  String get therapyChiroExercises => 'Ev Egzersizleri ve Germe';

  @override
  String get therapyChiroPostural => 'Postür Notu';

  @override
  String get therapyChiroDisclaimer =>
      'Kiropraktik bilgiler eğitim amaçlıdır. Tanı ve tedavi için lisanslı bir kiropraktöre başvurun.';

  @override
  String get therapyTcmTitle => 'Geleneksel Çin Tıbbı';

  @override
  String get therapyTcmSubtitle => 'Meridyen · Organ Saati · Beş Element';

  @override
  String get therapyTcmMeridianFunctions => 'Meridyen İşlevleri';

  @override
  String get therapyTcmGoverns => 'Yönetir';

  @override
  String get therapyTcmPatterns => 'Dengesizlik Örüntüleri';

  @override
  String get therapyTcmSymptoms => 'Belirtiler';

  @override
  String get therapyTcmFormulas => 'Klasik Formüller';

  @override
  String get therapyTcmKeyPoints => 'Bu Örüntü için Kilit Noktalar';

  @override
  String get therapyTcmAcupoints => 'Temel Akupresür Noktaları';

  @override
  String get therapyTcmDiet => 'GÇT Diyet Terapisi';

  @override
  String get therapyTcmTonifying => 'Güçlendirici gıdalar:';

  @override
  String get therapyTcmAvoid => 'Azalt / kaçın:';

  @override
  String get therapyTcmDisclaimer =>
      'GÇT bilgileri eğitim amaçlıdır. Lisanslı bir akupunkturist veya GÇT uzmanına danışın.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'Öneri oluşturmak için anlamlı iris bölgesi bulgusu tespit edilmedi.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'Mevsim';

  @override
  String get therapyClimateLabel => 'İklim';

  @override
  String get therapyEmotionLabel => 'Duygu';

  @override
  String get therapyTasteLabel => 'Tat';

  @override
  String get therapyNatureLabel => 'Doğa';

  @override
  String therapyPairedOrgan(String organ) {
    return 'çift: $organ';
  }
}
