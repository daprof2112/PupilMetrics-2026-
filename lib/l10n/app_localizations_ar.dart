// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => 'تحليل';

  @override
  String get plrModes => 'أوضاع PLR';

  @override
  String get captureInstructions => 'ضع العين داخل دائرة الإرشاد';

  @override
  String get scanHistory => 'سجل الفحوصات';

  @override
  String get selectCameraMode => 'اختر وضع الكاميرا';

  @override
  String get loadFromGallery => 'تحميل من المعرض';

  @override
  String get rightEyePhoto => 'صورة العين اليمنى';

  @override
  String get leftEyePhoto => 'صورة العين اليسرى';

  @override
  String get autoCapture => 'التقاط تلقائي';

  @override
  String get autoCaptureDesc => 'كشف العين + التقاط تلقائي بعد 5 ثوانٍ';

  @override
  String get manualCapture => 'التقاط يدوي';

  @override
  String get manualCaptureDesc => 'كشف العين + التقاط يدوي (الكاميرا الخلفية)';

  @override
  String get selfieMode => 'وضع السيلفي';

  @override
  String get selfieModeDesc =>
      'كشف العين + التقاط تلقائي بعد 5 ثوانٍ (الكاميرا الأمامية)';

  @override
  String get plrVideoRear => 'فيديو PLR (خلفي)';

  @override
  String get plrVideoRearDesc => 'الكاميرا الخلفية • التقاط 10 ثوانٍ';

  @override
  String get plrVideoSelfie => 'فيديو PLR (سيلفي)';

  @override
  String get plrVideoSelfieDesc => 'الكاميرا الأمامية • التقاط 10 ثوانٍ';

  @override
  String get plrVideoCapture => 'التقاط فيديو PLR';

  @override
  String get frontCamera => 'الكاميرا الأمامية';

  @override
  String get rearCamera => 'الكاميرا الخلفية';

  @override
  String get selectEyeToAssess => 'اختر العين المراد تقييمها';

  @override
  String get rightEyeOD => 'العين اليمنى (OD)';

  @override
  String get leftEyeOS => 'العين اليسرى (OS)';

  @override
  String get recordPlrRightEye => 'تسجيل PLR للعين اليمنى';

  @override
  String get recordPlrLeftEye => 'تسجيل PLR للعين اليسرى';

  @override
  String get loadRightEyeImage => 'تحميل صورة العين اليمنى';

  @override
  String get loadLeftEyeImage => 'تحميل صورة العين اليسرى';

  @override
  String get bothEyes => 'كلتا العينين';

  @override
  String get loadBothEyesDesc => 'تحميل العين اليمنى ثم العين اليسرى';

  @override
  String get selectEyeImageFromDevice => 'اختر صورة عين من جهازك';

  @override
  String get selectRightEyeFirst => 'اختر صورة العين اليمنى (OD) أولاً';

  @override
  String get rightEyeSaved =>
      'تم حفظ العين اليمنى. اختر الآن صورة العين اليسرى (OS)';

  @override
  String get cancelledNoRightEye => 'تم الإلغاء - لم تُختر عين يمنى';

  @override
  String get cancelledNoLeftEye => 'تم الإلغاء - لم تُختر عين يسرى';

  @override
  String errorLoadingImages(String error) {
    return 'خطأ في تحميل الصور: $error';
  }

  @override
  String get crop43 => 'قص (4:3)';

  @override
  String get success => 'نجاح';

  @override
  String get imageCroppedSuccess => 'تم قص الصورة بنجاح!';

  @override
  String get error => 'خطأ';

  @override
  String get cropFailed => 'فشل قص الصورة. يرجى المحاولة مرة أخرى.';

  @override
  String get crop => 'قص';

  @override
  String get cancel => 'إلغاء';

  @override
  String get saved => 'تم الحفظ! ✅';

  @override
  String get imageSavedToGallery => 'تم حفظ الصورة بنجاح في المعرض';

  @override
  String get exposure => 'التعرض';

  @override
  String get flash => 'الفلاش';

  @override
  String get eye => 'العين';

  @override
  String get center => 'المركز';

  @override
  String get light => 'الضوء';

  @override
  String get ready => 'جاهز';

  @override
  String get on => 'تشغيل';

  @override
  String get off => 'إيقاف';

  @override
  String get auto => 'تلقائي';

  @override
  String get manual => 'يدوي';

  @override
  String get selfie => 'سيلفي';

  @override
  String get pupil => 'بؤبؤ العين';

  @override
  String get plrHistory => 'سجل PLR';

  @override
  String get searchByName => 'البحث بالاسم...';

  @override
  String get totalScans => 'إجمالي الفحوصات';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String get patients => 'المرضى';

  @override
  String get detected => 'تم الكشف';

  @override
  String get noPlrRecordsYet => 'لا توجد سجلات PLR بعد';

  @override
  String get recordPlrVideoToSeeHistory => 'سجّل فيديو PLR لعرض السجل هنا';

  @override
  String get deleteRecord => 'حذف السجل؟';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'حذف تحليل PLR لـ $name ($eye)؟\\n\\nلا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get delete => 'حذف';

  @override
  String get recordDeleted => 'تم حذف السجل';

  @override
  String plrAnalysis(String eye) {
    return 'تحليل PLR - $eye';
  }

  @override
  String get patient => 'المريض';

  @override
  String get date => 'التاريخ';

  @override
  String get frames => 'الإطارات';

  @override
  String get baselinePiRatio => 'نسبة P/I الأساسية';

  @override
  String get minPiRatio => 'أدنى نسبة P/I';

  @override
  String get plrMagnitude => 'شدة PLR';

  @override
  String get constriction => 'الانقباض';

  @override
  String get plrDetected => 'تم كشف PLR';

  @override
  String get confidence => 'الثقة';

  @override
  String get grade => 'الدرجة';

  @override
  String get close => 'إغلاق';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get na => 'غير متاح';

  @override
  String get takeLeftEyePhoto => 'التقط صورة العين اليسرى';

  @override
  String get takeRightEyePhoto => 'التقط صورة العين اليمنى';

  @override
  String get nowTakingLeftEye => 'يتم الآن التقاط العين اليسرى (OS)';

  @override
  String get startingWithRightEye => 'البدء بالعين اليمنى (OD)';

  @override
  String get captured => 'تم الالتقاط ✓';

  @override
  String get useSameDistanceLighting =>
      'استخدم نفس المسافة والإضاءة كالعين اليمنى للحصول على مقارنة دقيقة.';

  @override
  String get step1of2 => 'الخطوة 1 من 2';

  @override
  String get step2of2 => 'الخطوة 2 من 2';

  @override
  String get bothEyesCaptured => 'تم التقاط كلتا العينين ✓';

  @override
  String get continueToLeftEye => 'المتابعة إلى العين اليسرى';

  @override
  String get retakeOD => 'إعادة التقاط OD';

  @override
  String get retakeOS => 'إعادة التقاط OS';

  @override
  String get retakeRightEye => 'إعادة التقاط العين اليمنى';

  @override
  String get analyzeBothEyes => 'تحليل كلتا العينين';

  @override
  String get patientInfoMissing => 'بيانات المريض مفقودة';

  @override
  String get rightEyePhotoMissing => 'صورة العين اليمنى مفقودة!';

  @override
  String get patientInfoMissingRestart =>
      'بيانات المريض مفقودة. يرجى إعادة التشغيل.';

  @override
  String get exitApp => 'إنهاء التطبيق';

  @override
  String get tipsForBestResults => 'نصائح للحصول على أفضل النتائج';

  @override
  String get followGuidelinesForQuality =>
      'اتبع هذه الإرشادات للحصول على جودة صورة مثلى';

  @override
  String get cameraDistance => 'مسافة الكاميرا';

  @override
  String get cameraDistanceDesc =>
      'أبقِ الكاميرا على بُعد 4-6 بوصات من عينك. احتفظ بنفس المسافة لكلتا العينين.';

  @override
  String get lightingPosition => 'موضع الإضاءة';

  @override
  String get lightingPositionDesc =>
      'ضع مصدر الضوء داخل حدود بؤبؤ العين أو خارجها. جرّب التحديق نحو فلاش الكاميرا.';

  @override
  String get avoidReflections => 'تجنب الانعكاسات';

  @override
  String get avoidReflectionsDesc =>
      'قلّل الانعكاسات بتجنب الوهج من النوافذ والمرايا والمصابيح المباشرة.';

  @override
  String get centerYourEye => 'توسيط عينك';

  @override
  String get centerYourEyeDesc =>
      'تأكد من أن العين بأكملها بما فيها الصلبة (الجزء الأبيض) متمركزة وتملأ الإطار.';

  @override
  String get cropProperly => 'القص بشكل صحيح';

  @override
  String get cropProperlyDesc =>
      'اقص الصورة مع وضع العين في المركز. سيتم حفظ الصورة تلقائياً بنسبة 4:3.';

  @override
  String get importantInformation => 'معلومات مهمة';

  @override
  String get imageRatio43 => 'نسبة الصورة 4:3 وفق معيار التصوير الطبي';

  @override
  String get forClinicalUseCnri => 'للاستخدام السريري مع CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'لا يُقدم تشخيصاً طبياً';

  @override
  String get eyeWideOpenClear =>
      'تأكد من أن عينك مفتوحة على نطاق واسع والصورة واضحة';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get personInformation => 'معلومات الشخص';

  @override
  String get enterPersonDetails => 'أدخل بيانات الشخص';

  @override
  String get infoIncludedInReport => 'ستُدرج هذه المعلومات في تقرير التحليل';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get enterPersonName => 'أدخل اسم الشخص';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get sex => 'الجنس';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get ageYears => 'العمر (بالسنوات)';

  @override
  String get enterAge => 'أدخل العمر';

  @override
  String get ageRequired => 'العمر مطلوب';

  @override
  String get enterValidNumber => 'أدخل رقماً صحيحاً';

  @override
  String get enterValidAge => 'أدخل عمراً صحيحاً (0-120)';

  @override
  String get mainComplaints => 'الشكاوى الرئيسية';

  @override
  String get mainComplaintsOptional => 'الشكاوى الرئيسية (اختياري)';

  @override
  String get complaintsHint => 'مثال: صداع، مشاكل في الرؤية، إرهاق...';

  @override
  String get continueToCaptire => 'المتابعة إلى الالتقاط';

  @override
  String get ageImportantNote =>
      'العمر مهم لتقييم حجم بؤبؤ العين بدقة إذ تتفاوت النطاقات الطبيعية حسب العمر.';

  @override
  String get submit => 'إرسال';

  @override
  String get pleaseSelectGender => 'يرجى اختيار الجنس!';

  @override
  String get applicationSubmitted => 'تم إرسال طلبك بنجاح.';

  @override
  String get type => 'النوع:';

  @override
  String get gender => 'الجنس:';

  @override
  String get rightHanded => 'أيمن';

  @override
  String get leftHanded => 'أيسر';

  @override
  String get partialLeftHandedness => 'يسارية جزئية';

  @override
  String get retrainedLeftHandedness => 'يسارية معاد تدريبها';

  @override
  String get bilateralUseBothHands => 'استخدام ثنائي لكلتا اليدين';

  @override
  String get splashTitle => 'PupilMetrics لالتقاط صور العين';

  @override
  String get splashDeveloper => 'مطور البرنامج - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'أداة بحثية/تعليمية';

  @override
  String get startNewAnalysis => 'بدء تحليل جديد';

  @override
  String get viewHistory => 'عرض السجل';

  @override
  String get viewResearchDisclaimer => 'عرض إخلاء مسؤولية البحث';

  @override
  String get researchDisclaimerTitle => 'أداة بحثية/تعليمية';

  @override
  String get researchDisclaimerNotMedical => 'ليس جهازاً طبياً';

  @override
  String get researchDisclaimerNotClinical => 'غير مخصص للتشخيص السريري';

  @override
  String get researchDisclaimerResults => 'النتائج ملاحظات بحثية';

  @override
  String get researchDisclaimerConsult =>
      'استشر دائماً المختصين في الرعاية الصحية';

  @override
  String get researchDisclaimerAcknowledge =>
      'بالمتابعة، تُقرّ بأن هذا التطبيق أداة بحثية ولا ينبغي استخدامه لاتخاذ قرارات طبية.';

  @override
  String get researchDisclaimerWarning =>
      'هذا التطبيق للأغراض البحثية والتعليمية فقط.';

  @override
  String get iUnderstand => 'أفهم ذلك';

  @override
  String get plrAnalysisTest => 'اختبار تحليل PLR';

  @override
  String get checkingVideoFile => 'جارٍ التحقق من ملف الفيديو...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'معالجة الإطار $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'اكتمل التحليل!';

  @override
  String get errorVideoNotFound => 'خطأ: لم يُعثر على ملف الفيديو';

  @override
  String get waitingForResults => 'في انتظار النتائج...';

  @override
  String get baseline => 'القياس الأساسي';

  @override
  String get flashPhase => 'الفلاش';

  @override
  String get constrictionPhase => 'الانقباض';

  @override
  String get recovery => 'الاسترداد';

  @override
  String get plrDetectedExclaim => 'تم كشف PLR!';

  @override
  String get plrWeakNotDetected => 'PLR ضعيف/لم يُكشف';

  @override
  String get min => 'أدنى';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'انقباض';

  @override
  String get saveToHistory => 'حفظ في السجل';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'حفظ الإطارات';

  @override
  String get share => 'مشاركة';

  @override
  String get frameSavedToGallery => 'تم حفظ الإطار في المعرض!';

  @override
  String get failedToSaveFrame => 'فشل حفظ الإطار';

  @override
  String framesSavedToGallery(int count) {
    return 'تم حفظ $count إطار في المعرض!';
  }

  @override
  String get jsonCopiedToClipboard => 'تم نسخ JSON إلى الحافظة!';

  @override
  String get reportCopiedToClipboard => 'تم نسخ التقرير إلى الحافظة!';

  @override
  String shareFailedError(String error) {
    return 'فشلت المشاركة: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'تم الحفظ في السجل! (المعرّف: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'فشل الحفظ: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'لا توجد إطارات ناجحة للحفظ';

  @override
  String get saveAllFrames => 'حفظ جميع الإطارات';

  @override
  String get shareReport => 'مشاركة التقرير';

  @override
  String get shareJson => 'مشاركة JSON';

  @override
  String get rerunTest => 'إعادة الاختبار';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'جارٍ تهيئة الكاميرا...';

  @override
  String usingCamera(String camera) {
    return 'استخدام كاميرا $camera';
  }

  @override
  String cameraError(String error) {
    return 'خطأ في الكاميرا: $error';
  }

  @override
  String get noCamerasFound => 'لم يُعثر على كاميرات';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get startPlrRecording => 'بدء تسجيل PLR';

  @override
  String get stopRecording => 'إيقاف التسجيل';

  @override
  String get phaseReady => 'جاهز';

  @override
  String get phaseStarting => 'جارٍ البدء...';

  @override
  String phaseBaseline(int sec) {
    return 'القياس الأساسي (0-$secث)';
  }

  @override
  String get phaseFlash => 'الفلاش!';

  @override
  String phaseConstriction(int start, int end) {
    return 'الانقباض ($start-$endث)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'الاسترداد ($start-$endث)';
  }

  @override
  String get phaseComplete => 'مكتمل!';

  @override
  String get readyDesc => 'ضع العين في الدائرة ثم اضغط ابدأ';

  @override
  String get holdSteady => 'ثبّت الكاميرا...';

  @override
  String get recordingBaselinePupil => 'تسجيل الحجم الأساسي لبؤبؤ العين';

  @override
  String lightStimulus(int ms) {
    return 'منبّه ضوئي (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'قياس انقباض بؤبؤ العين';

  @override
  String get measuringRecovery => 'قياس استرداد بؤبؤ العين';

  @override
  String get plrRecordingComplete => 'اكتمل تسجيل PLR';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'ضع عين $eye داخل الدائرة.\\nحافظ على الثبات طوال فترة التسجيل البالغة $seconds ثانية.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'أبقِ العين ثابتة. سيُطلق الفلاش عند $sec ثوانٍ.';
  }

  @override
  String get recordingComplete => 'اكتمل التسجيل';

  @override
  String get plrVideoCapturedSuccess => 'تم التقاط فيديو PLR بنجاح!';

  @override
  String get duration => 'المدة';

  @override
  String get seconds => 'ثوانٍ';

  @override
  String get frameRate => 'معدل الإطارات';

  @override
  String get camera => 'الكاميرا';

  @override
  String flashAt(int sec, int ms) {
    return 'عند $secث (${ms}ms)';
  }

  @override
  String get phases => 'المراحل';

  @override
  String get phasesFlow => 'القياس الأساسي → الفلاش → الانقباض → الاسترداد';

  @override
  String get expectedNormalValues => 'القيم الطبيعية المتوقعة:';

  @override
  String get latency => 'الكمون';

  @override
  String get velocity => 'السرعة';

  @override
  String get testFrameAnalysis => '🧪 تحليل إطار اختباري';

  @override
  String get retake => 'إعادة الالتقاط';

  @override
  String get done => 'تم';

  @override
  String get plrVideoModeTitle => 'وضع فيديو PLR';

  @override
  String get plrAssessmentTitle => 'تقييم رد فعل البؤبؤ للضوء (PLR)';

  @override
  String get plrInstructions =>
      '1. ضع العين داخل دائرة الإرشاد\\n2. اضغط \'بدء تسجيل PLR\'\\n3. حافظ على الثبات لمدة 10 ثوانٍ\\n4. سيُطلق الفلاش عند 3 ثوانٍ\\n5. يسجّل التطبيق استجابة بؤبؤ العين';

  @override
  String get recordingPhases => 'مراحل التسجيل:';

  @override
  String get baselinePhaseDesc => 'الحجم الأولي لبؤبؤ العين';

  @override
  String get flashPhaseDesc => 'منبّه ضوئي';

  @override
  String get constrictionPhaseDesc => 'انكماش بؤبؤ العين';

  @override
  String get recoveryPhaseDesc => 'عودة بؤبؤ العين';

  @override
  String get normalPlrValues => 'قيم PLR الطبيعية:';

  @override
  String get gotIt => 'حسناً';

  @override
  String get pupilAnalysis => 'تحليل بؤبؤ العين';

  @override
  String scansLeft(int count) {
    return 'تبقّى $count';
  }

  @override
  String get validatingRightEye => 'جارٍ التحقق من العين اليمنى...';

  @override
  String get validatingLeftEye => 'جارٍ التحقق من العين اليسرى...';

  @override
  String get analyzingRightEye => 'جارٍ تحليل العين اليمنى (OD)...';

  @override
  String get analyzingLeftEye => 'جارٍ تحليل العين اليسرى (OS)...';

  @override
  String get comparingPupils => 'جارٍ مقارنة البؤبؤين...';

  @override
  String person(String name) {
    return 'الشخص: $name';
  }

  @override
  String get invalidEyeImage => 'صورة عين غير صالحة';

  @override
  String analysisFailed(String error) {
    return 'فشل التحليل: $error';
  }

  @override
  String get researchEducationalToolOnly => 'أداة بحثية/تعليمية فقط';

  @override
  String get resultsNotMedicalDiagnoses =>
      'هذا التطبيق للأغراض البحثية والتعليمية فقط. النتائج ليست تشخيصات طبية ولم يتم التحقق منها للاستخدام السريري. ارتباطات الأنماط مستمدة من أدبيات البحث التاريخية. استشر مختصاً في الرعاية الصحية لأي مخاوف صحية.';

  @override
  String get pupilSizeDifference => 'تم كشف فرق في حجم بؤبؤ العين';

  @override
  String get significantPupilSizeDiff => 'فرق ملحوظ في حجم بؤبؤ العين';

  @override
  String get diff => 'فرق';

  @override
  String get researchObservationConsult =>
      'ملاحظة بحثية - استشر مختصاً في الرعاية الصحية للتفسير';

  @override
  String get ageBasedResearchBaseline => 'القياس الأساسي البحثي حسب العمر';

  @override
  String group(String group) {
    return 'المجموعة: $group';
  }

  @override
  String get researchRange => 'النطاق البحثي';

  @override
  String get measuredEst => 'المقاس (تقريبي)';

  @override
  String get pupilForm => 'شكل بؤبؤ العين';

  @override
  String get decentrationPattern => 'نمط الإزاحة المركزية';

  @override
  String get flattenings => 'التسطيحات';

  @override
  String get protrusions => 'النتوءات';

  @override
  String zonesCount(int count) {
    return '$count مناطق';
  }

  @override
  String get bilateralComparison => 'المقارنة الثنائية';

  @override
  String get parameter => 'المعامل';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'نسبة P/I';

  @override
  String get ellipseness => 'الاستطالة البيضاوية';

  @override
  String get circularity => 'الاستدارة';

  @override
  String get decentralization => 'اللامركزية';

  @override
  String get anwRatio => 'النسبة';

  @override
  String get normal => 'طبيعي';

  @override
  String get elliptical => 'بيضاوي';

  @override
  String get circular => 'دائري';

  @override
  String get irregular => 'غير منتظم';

  @override
  String get centered => 'متمركز';

  @override
  String get offset => 'إزاحة';

  @override
  String get miosis => 'انقباض البؤبؤ';

  @override
  String get constricted => 'مُنقبض';

  @override
  String get dilated => 'مُتسع';

  @override
  String get mydriasis => 'اتساع البؤبؤ';

  @override
  String get inner => 'داخلي';

  @override
  String get outer => 'خارجي';

  @override
  String get high => 'عالٍ';

  @override
  String get moderate => 'متوسط';

  @override
  String get savePdf => 'حفظ PDF';

  @override
  String get sharePdf => 'مشاركة PDF';

  @override
  String get retakePhotos => 'إعادة التقاط الصور';

  @override
  String scansLeftBanner(int count) {
    return 'تبقّى $count فحص';
  }

  @override
  String get upgrade => 'ترقية';

  @override
  String get unlockUnlimited => 'فتح نسخة غير محدودة';

  @override
  String get usedAllFreeScans => 'لقد استخدمت جميع الفحوصات المجانية.';

  @override
  String get unlimitedScans => 'فحوصات غير محدودة';

  @override
  String get pdfReports => 'تقارير PDF';

  @override
  String get scanHistoryFeature => 'سجل الفحوصات';

  @override
  String get bilateralAnalysis => 'التحليل الثنائي';

  @override
  String get monthly => 'شهري';

  @override
  String get perMonth => '/شهر';

  @override
  String get annual => 'سنوي';

  @override
  String get perYear => '/سنة';

  @override
  String get tenCredits => '10 رصيد';

  @override
  String get oneTime => 'مرة واحدة';

  @override
  String get best => 'الأفضل';

  @override
  String get purchaseCancelled => 'تم إلغاء الشراء';

  @override
  String purchaseFailed(String error) {
    return 'فشل الشراء: $error';
  }

  @override
  String txtSaved(String path) {
    return 'تم حفظ TXT: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'تم حفظ JSON: $path';
  }

  @override
  String get pdfSaved => 'تم حفظ PDF!';

  @override
  String pdfFailed(String error) {
    return 'فشل PDF: $error';
  }

  @override
  String get open => 'فتح';

  @override
  String failed(String error) {
    return 'فشل: $error';
  }

  @override
  String get staticScans => 'ثابت';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => 'البحث بالاسم أو الشكاوى...';

  @override
  String get searchPlrRecords => 'البحث في سجلات PLR...';

  @override
  String get noScansYet => 'لا توجد فحوصات بعد';

  @override
  String get completedScansAppearHere => 'ستظهر الفحوصات المكتملة هنا';

  @override
  String get deleteScan => 'حذف الفحص؟';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'حذف فحص $name بتاريخ $date؟';
  }

  @override
  String get scanDeleted => 'تم حذف الفحص';

  @override
  String get originalImagesNotFound => 'لم يُعثر على صور العين الأصلية.';

  @override
  String get viewResults => 'عرض النتائج';

  @override
  String get avgPlr => 'متوسط PLR';

  @override
  String get years => 'سنوات';

  @override
  String get anisocoria => 'تفاوت حدقتي العين';

  @override
  String get none => 'لا شيء';

  @override
  String get mild => 'خفيف';

  @override
  String get severe => 'شديد';

  @override
  String zoneLabel(String zone) {
    return 'المنطقة: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'مرتبط بـ $organ';
  }

  @override
  String get significant => 'ملحوظ';

  @override
  String get fair => 'مقبول';

  @override
  String get low => 'منخفض';

  @override
  String get good => 'جيد';

  @override
  String get zones => 'مناطق';

  @override
  String get significanceWithinLimits => 'ضمن الحدود المقبولة';

  @override
  String get significanceMild => 'خفيف';

  @override
  String get significanceModerate => 'متوسط';

  @override
  String get significanceSignificant => 'ملحوظ';

  @override
  String get formTypeCircle => 'دائري (طبيعي)';

  @override
  String get formTypeOval => 'بيضاوي';

  @override
  String get formTypeOvalVertical => 'بيضاوي رأسي';

  @override
  String get formTypeOvalHorizontal => 'بيضاوي أفقي';

  @override
  String get formTypeOvalDiagonal => 'بيضاوي قطري';

  @override
  String get formTypeLeftObliqueEllipse => 'إهليلج مائل يساري';

  @override
  String get formTypeUnilateralEllipse => 'إهليلج أحادي الجانب';

  @override
  String get formTypeVentralDivergingEllipse => 'إهليلج متباعد بطني';

  @override
  String get formTypeFrontalDivergingEllipse => 'إهليلج متباعد أمامي';

  @override
  String get formTypeEllipse => 'إهليلج';

  @override
  String get formTypeChord => 'وتري';

  @override
  String get formTypeIrregular => 'غير منتظم';

  @override
  String get pupilFormCircleDesc =>
      'شكل بؤبؤ دائري طبيعي. لم تُكشف أي تغيرات في النمط.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'نمط بيضاوي أفقي. يرتبط في أبحاث تاريخية بأنماط الجهاز العصبي اللاإرادي المؤثرة على مناطق الجهاز التنفسي والوظائف الغدية.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'نمط بيضاوي رأسي. ربطت أبحاث تاريخية هذا النمط بمناطق الدورة الدموية الدماغية في دراسات المنعكس اللاإرادي.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'نمط بيضاوي قطري. ربطت أدبيات البحث هذا النمط بمنعكسات المنطقة التناسلية البولية في الدراسات اللاإرادية.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'نمط إهليلج مائل يساري. ربطت ملاحظات تاريخية هذا النمط بمناطق لاإرادية تناسلية بولية وأطراف سفلية.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'نمط إهليلج أحادي الجانب. أشارت أبحاث إلى ارتباطات بمناطق لاإرادية تنفسية وشعبية.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'إهليلج متباعد بطني. ربطت دراسات تاريخية هذا النمط بمناطق لاإرادية للجسم السفلي وأنماط الوظيفة الحركية.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'إهليلج متباعد أمامي. ربطت أدبيات البحث هذا النمط بمناطق دماغية ولاإرادية علوية.';

  @override
  String get pupilFormOvalDesc =>
      'نمط تشوه بيضاوي خفيف. تابع أي تطور في الملاحظات البحثية.';

  @override
  String get pupilFormEllipseDesc =>
      'نمط إهليلجي يدل على تغيرات في الجهاز اللاإرادي وفق دراسات تاريخية.';

  @override
  String get pupilFormChordDesc =>
      'نمط تشوه وتري يدل على تأثيرات لاإرادية موضعية في أدبيات البحث.';

  @override
  String get pupilFormIrregularDesc =>
      'شكل غير منتظم يُشير إلى تأثيرات أنماط لاإرادية متعددة بناءً على ملاحظات تاريخية.';

  @override
  String get patternCentered => 'متمركز (طبيعي)';

  @override
  String get patternFrontal => 'إزاحة أمامية';

  @override
  String get patternBasal => 'إزاحة قاعدية';

  @override
  String get patternNasal => 'إزاحة أنفية';

  @override
  String get patternTemporal => 'إزاحة صدغية';

  @override
  String get patternMiddleNasal => 'إزاحة أنفية وسطية';

  @override
  String get patternMiddleTemporal => 'إزاحة صدغية وسطية';

  @override
  String get patternUpperNasal => 'إزاحة أنفية علوية';

  @override
  String get patternUpperTemporal => 'إزاحة صدغية علوية';

  @override
  String get patternLowerNasal => 'إزاحة أنفية سفلية';

  @override
  String get patternLowerTemporal => 'إزاحة صدغية سفلية';

  @override
  String get patternUpwards => 'إزاحة مركزية - للأعلى';

  @override
  String get patternDownwards => 'إزاحة مركزية - للأسفل';

  @override
  String get patternUpwardsInwards => 'إزاحة مركزية - للأعلى والداخل';

  @override
  String get patternUpwardsOutwards => 'إزاحة مركزية - للأعلى والخارج';

  @override
  String get decentrationCenteredDesc =>
      'وضع بؤبؤ طبيعي ضمن الحدود الفيزيولوجية.';

  @override
  String get decentrationNasalRightDesc =>
      'نمط أنفي (يمين). ربطت أبحاث تاريخية هذه المنطقة بمنعكسات لاإرادية رئوية.';

  @override
  String get decentrationNasalLeftDesc =>
      'نمط أنفي (يسار). ربطت أدبيات البحث هذه المنطقة بأنماط الوظيفة اللاإرادية للقلب.';

  @override
  String get decentrationTemporalDesc =>
      'نمط صدغي. ربطت ملاحظات تاريخية هذه المنطقة بمنعكسات لاإرادية كلوية وتناسلية.';

  @override
  String get decentrationFrontalRightDesc =>
      'نمط أمامي (يمين). ربطت أبحاث هذه المنطقة بأنماط الوظيفة المعرفية والدماغية.';

  @override
  String get decentrationFrontalLeftDesc =>
      'نمط أمامي (يسار). ربطت دراسات تاريخية هذه المنطقة بالأنماط اللاإرادية الدماغية.';

  @override
  String get decentrationBasalRightDesc =>
      'نمط قاعدي (يمين). أشارت أبحاث إلى ارتباطات بمنعكسات الضغط داخل الجمجمة.';

  @override
  String get decentrationBasalLeftDesc =>
      'نمط قاعدي (يسار). ربطت ملاحظات تاريخية هذا النمط بأنماط المنطقة الالتهابية الدماغية.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'نمط أنفي علوي (يمين). ربطت أبحاث هذه المنطقة بمنعكسات لاإرادية كبدية صفراوية.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'نمط أنفي علوي (يسار). ربطت دراسات تاريخية هذا النمط بمناطق الطحال والحجاب الحاجز.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'نمط صدغي علوي. أشارت أبحاث إلى ارتباطات بمناطق لاإرادية كلوية وتناسلية.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'نمط أنفي وسطي (يمين). ربطت ملاحظات تاريخية هذا النمط بمناطق استخدام الأكسجين والقلب.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'نمط أنفي وسطي (يسار). ربطت أبحاث هذا النمط بأنماط لاإرادية عصبية وقلبية.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'نمط صدغي وسطي (يمين). ربطت أبحاث هذا النمط بمناطق تنظيم لاإرادي للقلب.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'نمط صدغي وسطي (يسار). ربطت دراسات تاريخية هذا النمط بمناطق رئوية وقلبية.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'نمط أنفي علوي (يمين). أشارت أبحاث إلى ارتباطات بمناطق معرفية ومنعكسات العمود الفقري العنقي.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'نمط أنفي علوي (يسار). ربطت ملاحظات تاريخية هذا النمط بأنماط معرفية ومناطق عنقية.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'نمط صدغي علوي (يمين). ربطت أبحاث هذه المنطقة بمنعكسات الأعصاب القحفية والسمعية.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'نمط صدغي علوي (يسار). ربطت دراسات تاريخية هذا النمط بمناطق نباتية عصبية وكلامية.';

  @override
  String get decentrationLowerNasalDesc =>
      'نمط أنفي سفلي. أشارت أبحاث إلى ارتباطات بمناطق لاإرادية تناسلية بولية وعجزية قطنية.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'نمط صدغي سفلي (يمين). ربطت ملاحظات تاريخية هذا النمط بمناطق أيضية وكبدية.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'نمط صدغي سفلي (يسار). ربطت أبحاث هذا النمط بأنماط لاإرادية قلبية وطحالية.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'نمط مرتبط بالمنطقة المركزية العلوية. ربطت أبحاث تاريخية هذا النمط بمنعكسات لاإرادية تنظيمية للمزاج والطاقة.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'نمط مرتبط بالمنطقة الصدغية العلوية. أشارت أبحاث إلى ارتباطات بمنعكسات لاإرادية للأعصاب القحفية والجهاز السمعي.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'نمط مرتبط بالمنطقة الصدغية الوسطية. ربطت ملاحظات تاريخية هذا النمط بأنماط لاإرادية تنفسية وقلبية.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'نمط مرتبط بالمنطقة الصدغية السفلية. ربطت أدبيات البحث هذا النمط بمناطق لاإرادية كبدية وأيضية.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'نمط مرتبط بالمنطقة القاعدية السفلية. ربطت دراسات تاريخية هذا النمط بمنعكسات لاإرادية كلوية وأطراف سفلية.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'نمط مرتبط بالمنطقة الأنفية السفلية. أشارت أبحاث إلى ارتباطات بمناطق لاإرادية تناسلية بولية وحوضية.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'نمط مرتبط بالمنطقة الأنفية الوسطية. ربطت ملاحظات تاريخية هذا النمط بأنماط لاإرادية لاستخدام الأكسجين والجهاز التنفسي.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'نمط مرتبط بالمنطقة الأنفية العلوية. ربطت أدبيات البحث هذا النمط بمنعكسات لاإرادية معرفية وعنقية.';

  @override
  String get flatteningDefaultRightDesc =>
      'تم كشف تغير في نمط الجهاز العصبي اللاإرادي في هذه المنطقة بناءً على أبحاث تاريخية.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'نمط مرتبط بالمنطقة المركزية العلوية. ربطت أبحاث تاريخية هذا النمط بأنماط لاإرادية نفسحركية وعصبية.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'نمط مرتبط بالمنطقة الصدغية العلوية. أشارت أبحاث إلى ارتباطات بمناطق لاإرادية نباتية عصبية وكلامية.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'نمط مرتبط بالمنطقة الصدغية الوسطية. ربطت ملاحظات تاريخية هذا النمط بمنعكسات لاإرادية رئوية وقلبية.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'نمط مرتبط بالمنطقة الصدغية السفلية. ربطت أدبيات البحث هذا النمط بأنماط لاإرادية قلبية وطحالية.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'نمط مرتبط بالمنطقة القاعدية السفلية. ربطت دراسات تاريخية هذا النمط بمناطق لاإرادية كلوية وإطراحية.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'نمط مرتبط بالمنطقة الأنفية السفلية. أشارت أبحاث إلى ارتباطات بمنعكسات لاإرادية تناسلية بولية وعجزية قطنية.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'نمط مرتبط بالمنطقة الأنفية الوسطية. ربطت ملاحظات تاريخية هذا النمط بأنماط لاإرادية قلبية وتنفسية.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'نمط مرتبط بالمنطقة الأنفية العلوية. ربطت أدبيات البحث هذا النمط بمناطق لاإرادية معرفية وعنقية.';

  @override
  String get flatteningDefaultLeftDesc =>
      'تم كشف تغير في نمط الجهاز العصبي اللاإرادي في هذه المنطقة بناءً على أبحاث تاريخية.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'نمط نتوء في المنطقة المركزية العلوية. ربطت أبحاث هذا النمط بأنماط فرط نشاط سمبثاوي تؤثر على المناطق الدماغية.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'نمط نتوء في المنطقة الصدغية العلوية. ربطت ملاحظات تاريخية هذا النمط بأنماط فرط نشاط الأعصاب القحفية والجهاز السمعي.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'نمط نتوء في المنطقة الصدغية الوسطية. أشارت أبحاث إلى ارتباطات بأنماط سمبثاوية قلبية وتنفسية.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'نمط نتوء في المنطقة الصدغية السفلية. ربطت دراسات تاريخية هذا النمط بمناطق سمبثاوية كبدية صفراوية وأيضية.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'نمط نتوء في المنطقة القاعدية السفلية. ربطت أبحاث هذا النمط بأنماط فرط نشاط سمبثاوي كلوي وحوضي.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'نمط نتوء في المنطقة الأنفية السفلية. ربطت ملاحظات تاريخية هذا النمط بمناطق تنشيط سمبثاوي تناسلي بولي.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'نمط نتوء في المنطقة الأنفية الوسطية. أشارت أبحاث إلى ارتباطات بأنماط سمبثاوية معدية وبنكرياسية.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'نمط نتوء في المنطقة الأنفية العلوية. ربطت دراسات تاريخية هذا النمط بمناطق فرط نشاط سمبثاوي معرفي وبصري.';

  @override
  String get protrusionDefaultRightDesc =>
      'تم كشف نمط فرط نشاط في الجهاز العصبي السمبثاوي في هذه المنطقة بناءً على ملاحظات بحثية.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'نمط نتوء في المنطقة المركزية العلوية. ربطت أبحاث هذا النمط بأنماط سمبثاوية نفسحركية ودماغية.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'نمط نتوء في المنطقة الصدغية العلوية. ربطت ملاحظات تاريخية هذا النمط بمناطق فرط نشاط سمبثاوي نباتي عصبي.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'نمط نتوء في المنطقة الصدغية الوسطية. أشارت أبحاث إلى ارتباطات بأنماط سمبثاوية رئوية وقلبية.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'نمط نتوء في المنطقة الصدغية السفلية. ربطت دراسات تاريخية هذا النمط بمناطق تنشيط سمبثاوي طحالي وقلبي.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'نمط نتوء في المنطقة القاعدية السفلية. ربطت أبحاث هذا النمط بأنماط فرط نشاط سمبثاوي حوضي وكلوي.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'نمط نتوء في المنطقة الأنفية السفلية. ربطت ملاحظات تاريخية هذا النمط بمناطق تنشيط سمبثاوي عجزي قطني.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'نمط نتوء في المنطقة الأنفية الوسطية. أشارت أبحاث إلى ارتباطات بأنماط سمبثاوية قلق-قلبية.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'نمط نتوء في المنطقة الأنفية العلوية. ربطت دراسات تاريخية هذا النمط بمناطق فرط نشاط سمبثاوي معرفي وبصري.';

  @override
  String get protrusionDefaultLeftDesc =>
      'تم كشف نمط فرط نشاط في الجهاز العصبي السمبثاوي في هذه المنطقة بناءً على ملاحظات بحثية.';

  @override
  String get anisocoriaNone =>
      'أحجام البؤبؤين ضمن الحدود الطبيعية. لم يُكشف تفاوت ملحوظ في حدقتي العين.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'تم كشف تفاوت حدقتي العين: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'ضمن الحدود الطبيعية.';

  @override
  String get anisocoriaSeverityMild => 'فرق خفيف ملحوظ. قد يكون فيزيولوجياً.';

  @override
  String get anisocoriaSeverityModerate => 'عدم تماثل متوسط. تمت ملاحظة بحثية.';

  @override
  String get anisocoriaSeveritySevere =>
      'عدم تماثل ملحوظ. تم تسجيل ملاحظة بحثية.';

  @override
  String get largerPupilEqual => 'متساوٍ';

  @override
  String get largerPupilOS => 'OS (يسار)';

  @override
  String get largerPupilOD => 'OD (يمين)';

  @override
  String get decentrationWithinLimits => 'ضمن الحدود الطبيعية.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. الإزاحة: $offset%';
  }

  @override
  String get zoneUpperCentral => 'علوي-مركزي';

  @override
  String get zoneUpperNasal => 'علوي-أنفي';

  @override
  String get zoneMiddleNasal => 'وسطي-أنفي';

  @override
  String get zoneLowerNasal => 'سفلي-أنفي';

  @override
  String get zoneLowerBasal => 'سفلي-قاعدي';

  @override
  String get zoneLowerTemporal => 'سفلي-صدغي';

  @override
  String get zoneMiddleTemporal => 'وسطي-صدغي';

  @override
  String get zoneUpperTemporal => 'علوي-صدغي';

  @override
  String get zoneFrontal => 'أمامي';

  @override
  String get zoneBasal => 'قاعدي';

  @override
  String get zoneUnknown => 'غير معروف';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'تسطيح $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'نتوء $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'وضع مجهر القزحية USB';

  @override
  String get iriscopeExternal => 'مجهر القزحية / خارجي';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'استخدم كاميرا USB أو مجهر القزحية المتصل';

  @override
  String get detectedCameras => 'الكاميرات المكتشفة';

  @override
  String get externalCamera => 'كاميرا خارجية';

  @override
  String cameraIndex(int index) {
    return 'الكاميرا $index';
  }

  @override
  String get noExternalCameraDetected =>
      'لم تُكتشف كاميرا خارجية.\\nوصّل مجهر القزحية عبر USB لتفعيلها.';

  @override
  String get refresh => 'تحديث';

  @override
  String get selectCameraSource => 'اختر مصدر الكاميرا';

  @override
  String camerasDetected(int count) {
    return 'تم اكتشاف $count كاميرا';
  }

  @override
  String camerasAvailable(int count) {
    return '$count كاميرا متاحة';
  }

  @override
  String externalCameraIndex(int index) {
    return 'كاميرا خارجية $index';
  }

  @override
  String get qualityGatedRear =>
      'التقاط تلقائي بوابة الجودة (الكاميرا الخلفية)';

  @override
  String get qualityGatedFront =>
      'التقاط تلقائي بوابة الجودة (الكاميرا الأمامية)';

  @override
  String get usbCameraInfo => 'معلومات كاميرا USB';

  @override
  String get connected => 'متصل';

  @override
  String get waiting => 'في الانتظار...';

  @override
  String get disconnected => 'غير متصل';

  @override
  String get waitingForUsbCamera => 'في انتظار كاميرا USB';

  @override
  String get connectIriscopePrompt =>
      'وصّل مجهر القزحية عبر محوّل USB OTG.\\nامنح الإذن عند المطالبة.';

  @override
  String get usbCameraIssue => 'مشكلة في كاميرا USB';

  @override
  String get pleaseConnectIriscope => 'يرجى توصيل مجهر القزحية أو كاميرا USB.';

  @override
  String get retryConnection => 'إعادة محاولة الاتصال';

  @override
  String get troubleshootingTips => 'نصائح استكشاف الأخطاء';

  @override
  String get tipUsbOtgAdapter => 'تأكد من توصيل محوّل USB OTG بشكل صحيح';

  @override
  String get tipUsbHostMode => 'تحقق من دعم الجهاز لوضع USB Host';

  @override
  String get tipReconnectCamera => 'جرّب فصل الكاميرا وإعادة توصيلها';

  @override
  String get tipGrantPermissions => 'امنح أذونات USB عند المطالبة';

  @override
  String get tipUnlockDevice => 'قد تحتاج بعض الأجهزة إلى إلغاء القفل';

  @override
  String get back => 'رجوع';

  @override
  String get switchEye => 'تبديل العين';

  @override
  String get state => 'الحالة';

  @override
  String get status => 'الوضع';

  @override
  String get usingFlutterUvcPlugin =>
      'استخدام إضافة flutter_uvc_camera\\إضافة لدعم أجهزة فئة USB Video Class.';

  @override
  String get initialized => 'تمت التهيئة';

  @override
  String get notReady => 'غير جاهز';

  @override
  String get captureDistanceMatch => 'تطابق مسافة الالتقاط';

  @override
  String get irisSize => 'حجم القزحية';

  @override
  String get distanceMatched => 'المسافة متطابقة';

  @override
  String get distanceMismatch => 'عدم تطابق المسافة';

  @override
  String get excellentMatch => 'تطابق ممتاز';

  @override
  String get goodMatch => 'تطابق جيد';

  @override
  String get acceptableMatch => 'تطابق مقبول';

  @override
  String get considerRetaking => 'عدم تطابق المسافة - يُنصح بإعادة الالتقاط';

  @override
  String get qualityReady => 'جاهز! حافظ على الثبات...';

  @override
  String get qualityTooBlurry => 'ثبّت الكاميرا';

  @override
  String get qualityTooDark => 'تحتاج إلى مزيد من الضوء';

  @override
  String get qualityTooBright => 'ساطع جداً - قلّل الضوء';

  @override
  String get qualityNoContrast => 'اضبط زاوية الإضاءة';

  @override
  String get qualityNoPupil => 'توسّط بؤبؤ العين في الإطار';

  @override
  String get qualityNotCentered => 'حرّك العين إلى المركز';

  @override
  String get qualityNotAnEye => 'لم تُكشف عين';

  @override
  String get qualityProcessing => 'جارٍ المعالجة...';

  @override
  String get distanceMatchedCheck => '✓ المسافة متطابقة';

  @override
  String get distanceGoodMatchCheck => '✓ تطابق جيد';

  @override
  String get distanceSlightlyBack => 'تراجع قليلاً ↔';

  @override
  String get distanceSlightlyCloser => 'اقترب قليلاً ↔';

  @override
  String get distanceAlmostThere => 'تكاد تصل...';

  @override
  String get distanceMoveBack => 'تراجع للخلف ←←';

  @override
  String get distanceMoveCloser => 'اقترب أكثر →→';

  @override
  String get distanceTooClose => 'قريب جداً! تراجع للخلف';

  @override
  String get distanceTooFar => 'بعيد جداً! اقترب أكثر';

  @override
  String get distanceStabilizing => 'جارٍ التثبيت...';

  @override
  String distanceLabel(int percent) {
    return 'المسافة: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD (العين اليمنى): ${odSize}px → OS (العين اليسرى): ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'الكاميرا الأمامية';

  @override
  String get rearCameraLabel => 'الكاميرا الخلفية';

  @override
  String get startingCamera => 'جارٍ تشغيل الكاميرا...';

  @override
  String get eyeNotDetected => 'لم يتم اكتشاف العين';

  @override
  String get tryAgain => 'حاول مجدداً';

  @override
  String get indicatorEye => 'العين';

  @override
  String get indicatorSharp => 'حدة';

  @override
  String get indicatorLight => 'إضاءة';

  @override
  String get indicatorFocus => 'تركيز';

  @override
  String get indicatorPupil => 'بؤبؤ العين';

  @override
  String get indicatorIris => 'القزحية';

  @override
  String get indicatorMatch => 'تطابق';

  @override
  String get checkImageShape => 'شكل الصورة';

  @override
  String get checkCircularIris => 'القزحية الدائرية';

  @override
  String get checkDarkPupil => 'بؤبؤ العين الداكن';

  @override
  String get checkIrisTexture => 'نسيج القزحية';

  @override
  String get checkPupilIrisStructure => 'بنية بؤبؤ العين والقزحية';

  @override
  String get checkNaturalColors => 'الألوان الطبيعية';

  @override
  String get checkEdgePattern => 'نمط الحواف';

  @override
  String get errorImageShapeIncorrect =>
      'شكل الصورة غير صحيح - تأكد من ملء العين للإطار';

  @override
  String get errorNoEyeDetected =>
      'لم يتم اكتشاف عين - ضع القزحية في وسط الإطار';

  @override
  String get errorNoPupilDetected =>
      'لم يتم اكتشاف بؤبؤ العين - تأكد من الإضاءة الجيدة';

  @override
  String get errorNoIrisTexture => 'لا يوجد نسيج قزحية - اقترب من العين';

  @override
  String get errorUnusualColors =>
      'ألوان غير اعتيادية - تجنب الشاشات والانعكاسات';

  @override
  String get errorTooManyEdges =>
      'حواف مستقيمة كثيرة جداً - قد لا تكون هذه عيناً';

  @override
  String get errorNotValidEye => 'ليست صورة عين صالحة - يرجى المحاولة مجدداً';

  @override
  String get holdStillCapturing => 'لا تتحرك - جارٍ الالتقاط...';

  @override
  String get adjustDistanceFirst => 'اضبط المسافة أولاً';

  @override
  String get stabilizingReading => 'جارٍ التثبيت...';

  @override
  String get autoCaptureWhenReady => 'الالتقاط التلقائي عند الاستعداد';

  @override
  String get tapOrWaitAutoCapture => 'انقر أو انتظر الالتقاط التلقائي';

  @override
  String get validatingImage => 'جارٍ التحقق...';

  @override
  String get capturingStatus => 'جارٍ الالتقاط...';

  @override
  String get adjustPositionStatus => 'اضبط الموضع';

  @override
  String get validationTip =>
      'نصيحة: تأكد من إضاءة جيدة، وأمسك الكاميرا على بُعد 10-15 سم من العين، وتجنب الانعكاسات';

  @override
  String get validationChecksTitle => 'فحوصات التحقق:';

  @override
  String confidenceLabel(int percent) {
    return 'الثقة: $percent%';
  }

  @override
  String get incompleteData => 'بيانات غير مكتملة';

  @override
  String get irisDiameterLabel => 'قطر القزحية ø';

  @override
  String get plrResponseCurve => 'منحنى استجابة PLR';

  @override
  String get plrLatency => 'الكمون';

  @override
  String get plrVelocity => 'السرعة';

  @override
  String get plrRecoveryTime => 'وقت الاسترداد';

  @override
  String get plrRecoveryRatio => 'نسبة الاسترداد %';

  @override
  String get plrEnhancedMetrics => 'مقاييس PLR المتقدمة';

  @override
  String get plrNormalLatency => 'الطبيعي: 200-500 مللي ثانية';

  @override
  String get plrNormalConstriction => 'الطبيعي: 10-30%';

  @override
  String get plrNormalVelocity => 'الطبيعي: 1.5-4.0%/ث';

  @override
  String get plrReferenceValues => 'القيم المرجعية الطبيعية لـ PLR';

  @override
  String get plrSubjectInfo => 'معلومات الشخص';

  @override
  String get plrTestType => 'منعكس الضوء الحدقي';

  @override
  String get plrAnalysisSummary => 'ملخص التحليل';

  @override
  String get plrTotalFrames => 'إجمالي الإطارات المحللة';

  @override
  String get plrSuccessRate => 'معدل النجاح';

  @override
  String get plrMaxConstriction => 'أقصى انقباض';

  @override
  String get plrResponseCurveLabels => 'منحنى استجابة PLR';

  @override
  String get anwTitle => 'الحلقة العصبية اللاإرادية (ANW)';

  @override
  String get anwAbnormal => 'غير طبيعي';

  @override
  String get anwDiameter => 'القطر';

  @override
  String get anwPerimeter => 'المحيط';

  @override
  String get anwAsymmetry => 'عدم التناسق';

  @override
  String get anwElevated => 'مرتفع';

  @override
  String get anwFormType => 'نوع الشكل';

  @override
  String get anwRegular => 'منتظم';

  @override
  String get anwDrawnIn => 'مسحوب للداخل';

  @override
  String get anwIndented => 'مُعضَّن';

  @override
  String get anwLacerated => 'ممزق';

  @override
  String get anwSpastic => 'تشنجي';

  @override
  String get anwAtonic => 'وهني';

  @override
  String get anwTonicState => 'نمط النغمة التاريخي';

  @override
  String get anwParasympathotonic => 'نمط باراسيمباثوتوني';

  @override
  String get anwSympathotonicState => 'نمط سيمباثوتوني';

  @override
  String get anwShiftDetected => 'نمط الانزياح التاريخي';

  @override
  String get anwConstrictionDetected => 'تم اكتشاف انقباض';

  @override
  String get anwFindings => 'النتائج';

  @override
  String get anwRatioComparison => 'نسبة ANW';

  @override
  String get bilateralANWComparison => 'مقارنة ANW الثنائية';

  @override
  String get anwSymmetryNormal => 'تناسق ANW ضمن الحدود الطبيعية.';

  @override
  String get anwAsymmetryDetected => 'تم اكتشاف عدم تناسق ANW بين العينين.';

  @override
  String get functionalFrustration =>
      'اضطراب وظيفي في الارتباط بين الجهازين العصبيين الودي واللاودي.';

  @override
  String get anwParasympathotonicDesc =>
      'ربطت الدراسات التاريخية هذا بزيادة الحساسية العتبية. تسارع النشاط الانعكاسي. ارتفعت وظائف الإفراز والإخلاء في الجهاز الهضمي.';

  @override
  String get anwSympathotonicDesc =>
      'ربطت الدراسات التاريخية هذا بانخفاض الحساسية العتبية. تباطأ النشاط الانعكاسي. انخفضت وظائف الإفراز والإخلاء في الجهاز الهضمي.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط الحمل الزائد على البطين الأيسر والإجهاد القلبي.';

  @override
  String get anwFrontalConstricted => 'منطقة الجبهة في الحزام الحدقي منقبضة.';

  @override
  String get anwBasalConstricted => 'المنطقة القاعدية في الحزام الحدقي منقبضة.';

  @override
  String get anwFrontalBasalConstricted =>
      'منطقتا الجبهة والقاعدة في الحزام الحدقي منقبضتان.';

  @override
  String get helpTitle => 'المساعدة ودليل المستخدم';

  @override
  String get helpTabQuickStart => 'البدء السريع';

  @override
  String get helpTabCnriAnalysis => 'تحليل CNRI';

  @override
  String get helpTabShortcuts => 'الاختصارات';

  @override
  String get helpTabTroubleshooting => 'استكشاف الأخطاء';

  @override
  String get helpOnlineDocs => 'الوثائق عبر الإنترنت';

  @override
  String get helpContactSupport => 'الاتصال بالدعم';

  @override
  String get helpGettingStarted => 'البدء';

  @override
  String get helpStep1Title => 'توصيل جهاز الإيريسكوب';

  @override
  String get helpStep1Desc => 'وصّل جهاز Dino-Lite أو أي إيريسكوب USB متوافق.';

  @override
  String get helpStep2Title => 'إدخال معلومات المريض';

  @override
  String get helpStep2Desc =>
      'أدخل اسم المريض والعمر والجنس والشكاوى الرئيسية.';

  @override
  String get helpStep3Title => 'التقاط العين اليمنى OD (العين اليمنى)';

  @override
  String get helpStep3Desc => 'ضع الإيريسكوب والتقط صورة العين اليمنى.';

  @override
  String get helpStep4Title => 'التقاط العين اليسرى OS (العين اليسرى)';

  @override
  String get helpStep4Desc => 'كرر العملية للعين اليسرى مع إضاءة متسقة.';

  @override
  String get helpStep5Title => 'مراجعة التحليل';

  @override
  String get helpStep5Desc =>
      'يحلل التطبيق نسبة P/I وشكل بؤبؤ العين وخصائص ANW.';

  @override
  String get helpStep6Title => 'تصدير التقرير';

  @override
  String get helpStep6Desc => 'احفظ بصيغة PDF أو TXT أو JSON.';

  @override
  String get helpTipBestResults =>
      'للحصول على أفضل النتائج: استخدم إضاءة ثابتة وحافظ على مسافة 2-3 سم للإيريسكوب.';

  @override
  String get helpCnriProtocolFeatures => 'ميزات بروتوكول CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'نسبة بؤبؤ العين/القزحية (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'الطبيعي: 20-30%. القيم خارج النطاق قد تدل على خلل في الجهاز العصبي اللاإرادي.';

  @override
  String get helpFeaturePupilFormTitle => 'تحليل شكل بؤبؤ العين';

  @override
  String get helpFeaturePupilFormDesc =>
      'يكتشف الأنماط البيضاوية واتجاه اللامركزية والانحراف.';

  @override
  String get helpFeatureAnwTitle => 'تقييم ANW (الطوق)';

  @override
  String get helpFeatureAnwDesc =>
      'يحلل النسبة وانتظام الشكل وانزياحات القطاعات والحالة النغمية.';

  @override
  String get helpFeatureZoneTitle => 'تحليل المناطق';

  @override
  String get helpFeatureZoneDesc =>
      'يربط التسطيحات والنتوءات بمناطق الأعضاء في CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'المقارنة الثنائية';

  @override
  String get helpFeatureBilateralDesc =>
      'تقارن OD (العين اليمنى) مع OS (العين اليسرى) لاكتشاف عدم التناسق.';

  @override
  String get helpFeatureMlTitle => 'مقارنة ONNX CNN';

  @override
  String get helpFeatureMlDesc => 'يوفر نموذج ONNX CNN قياسات ثانوية للمقارنة.';

  @override
  String get helpKeyboardShortcuts => 'اختصارات لوحة المفاتيح';

  @override
  String get helpCameraControls => 'أدوات التحكم بالكاميرا';

  @override
  String get helpShortcutSpace => 'التقاط صورة';

  @override
  String get helpShortcutCtrlS => 'حفظ تقرير PDF';

  @override
  String get helpShortcutCtrlO => 'فتح صورة من المعرض';

  @override
  String get helpShortcutCtrlH => 'عرض سجل الفحوصات';

  @override
  String get helpShortcutF11 => 'تبديل وضع ملء الشاشة';

  @override
  String get helpShortcutEsc => 'رجوع / إلغاء';

  @override
  String get helpShortcutScroll => 'تكبير/تصغير';

  @override
  String get helpShortcutDoubleClick => 'إعادة ضبط التكبير';

  @override
  String get helpCommonIssues => 'المشكلات الشائعة';

  @override
  String get helpIssueCameraNotDetected => 'لم يتم اكتشاف الكاميرا';

  @override
  String get helpIssueCameraSolution1 => 'تحقق من توصيل USB';

  @override
  String get helpIssueCameraSolution2 => 'جرب منفذ USB مختلفاً';

  @override
  String get helpIssueCameraSolution3 => 'قم بتثبيت برامج تشغيل Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'أعد تشغيل التطبيق';

  @override
  String get helpIssuePupilDetectionFails => 'فشل اكتشاف بؤبؤ العين';

  @override
  String get helpIssuePupilSolution1 => 'تأكد من كفاية الإضاءة';

  @override
  String get helpIssuePupilSolution2 => 'ضع بؤبؤ العين في وسط الإطار';

  @override
  String get helpIssuePupilSolution3 => 'نظّف عدسة الإيريسكوب';

  @override
  String get helpIssuePupilSolution4 => 'اضبط التركيز يدوياً';

  @override
  String get helpIssuePdfExportFails => 'فشل تصدير PDF';

  @override
  String get helpIssuePdfSolution1 => 'تحقق من أذونات المجلد';

  @override
  String get helpIssuePdfSolution2 => 'تأكد من توفر مساحة القرص';

  @override
  String get helpIssuePdfSolution3 => 'أغلق ملفات PDF المفتوحة';

  @override
  String get helpIssuePdfSolution4 => 'جرب تصدير TXT أولاً';

  @override
  String get helpCaptureChecklistTitle => 'قائمة مراجعة الالتقاط';

  @override
  String get helpCaptureChecklist1 =>
      'أبقِ بؤبؤ العين في المركز ومرئياً بالكامل داخل الإطار.';

  @override
  String get helpCaptureChecklist2 =>
      'استخدم إضاءة متسوية وقلل الوهج والانعكاسات على القرنية.';

  @override
  String get helpCaptureChecklist3 =>
      'حافظ على مسافة متشابهة للإيريسكوب من العينين اليمنى واليسرى.';

  @override
  String get helpCaptureChecklist4 =>
      'أعد التركيز أو أعد الالتقاط إذا بدت حافة بؤبؤ العين ناعمة أو ضبابية.';

  @override
  String get helpExportSettingsTitle => 'إعدادات التصدير';

  @override
  String get helpExportSettingsDesc =>
      'يحفظ PDF تلقائياً التقرير بعد التحليل، ويتحكم تضمين الصور في ظهور صور العين في PDF، ويُضاف إظهار مقارنة ML قيم مقارنة ONNX CNN إلى التقارير.';

  @override
  String get helpHybridScoreTitle => 'الثقة المدمجة والدرجة';

  @override
  String get helpHybridScoreDesc =>
      'تجمع الثقة والدرجة المعروضتان جودة الهندسة الكلاسيكية مع توافق ML، وبالتالي تعكسان موثوقية القياس لا تشخيصاً.';

  @override
  String get helpAnomalyGuideTitle => 'قراءة التسطيحات والنتوءات';

  @override
  String get helpAnomalyGuideDesc =>
      'تشير التسطيحات إلى السحب النسبي للداخل وتشير النتوءات إلى السحب للخارج على طول حدود بؤبؤ العين؛ كل بطاقة تسرد المنطقة والحجم والارتباط المحدد.';

  @override
  String get helpZoneOverlayGuideTitle => 'تراكب المناطق';

  @override
  String get helpZoneOverlayGuideDesc =>
      'استخدم تراكب المناطق لفحص مواضع القطاعات بصرياً والتحقق من مكان وقوع الحالات الشاذة المكتشفة حول بؤبؤ العين والقزحية.';

  @override
  String get helpContactSupportTip =>
      'تواصل مع helpdesk@cnri.edu للحصول على المساعدة.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsCameraIriscope => 'الكاميرا / الإيريسكوب';

  @override
  String get settingsPreferredCamera => 'الكاميرا المفضلة:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'كاميرا USB';

  @override
  String get settingsCameraAutoDetect => 'اكتشاف تلقائي';

  @override
  String get settingsDefaultZoom => 'التكبير الافتراضي:';

  @override
  String get settingsAnalysis => 'التحليل';

  @override
  String get settingsShowMlComparison => 'إظهار مقارنة ML';

  @override
  String get settingsShowZoneOverlay => 'إظهار تراكب المناطق';

  @override
  String get settingsExportReports => 'التصدير والتقارير';

  @override
  String get settingsAutoSavePdf => 'حفظ PDF تلقائياً';

  @override
  String get settingsIncludeImages => 'تضمين الصور';

  @override
  String get settingsSaved => 'تم حفظ الإعدادات';

  @override
  String get aboutResearchEdition => 'إصدار البحث';

  @override
  String aboutVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get aboutLicense => 'الترخيص';

  @override
  String get aboutLicensedTo => 'مرخص لـ:';

  @override
  String get aboutExpires => 'ينتهي في:';

  @override
  String get aboutManageLicense => 'إدارة الترخيص';

  @override
  String get aboutBasedOnCnri => 'مستند إلى بروتوكول CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'الموقع الإلكتروني';

  @override
  String get aboutPrivacy => 'الخصوصية';

  @override
  String get languageSelectTitle => 'اختر اللغة';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get languageChanged => 'تم تغيير اللغة';

  @override
  String languageChangedMessage(String language) {
    return 'تم ضبط لغة التطبيق على $language';
  }

  @override
  String get languageSystemNotAvailable => 'نظام اللغة غير متاح';

  @override
  String get licenseLoading => 'جارٍ التحميل...';

  @override
  String get licenseWelcome => 'مرحباً بك في PupilMetrics!';

  @override
  String get licenseTrialFeatures => 'تجربة مجانية 14 يوماً • ميزات كاملة';

  @override
  String get licenseStartTrial => 'ابدأ التجربة المجانية';

  @override
  String get licenseEnterKey => 'إدخال ترخيص';

  @override
  String get licenseFreeTrial => 'تجربة مجانية';

  @override
  String licenseDaysRemaining(int count) {
    return 'متبقي $count يوم';
  }

  @override
  String get licenseTrialEnded => 'انتهت التجربة';

  @override
  String get licenseEnterToContinue => 'أدخل الترخيص للمتابعة';

  @override
  String get licenseStandard => 'ترخيص قياسي';

  @override
  String get licenseProfessional => 'ترخيص احترافي';

  @override
  String get licenseEnterprise => 'ترخيص مؤسسي';

  @override
  String get licenseLicensed => 'مرخص';

  @override
  String get licenseActive => 'نشط';

  @override
  String get licenseTrialUser => 'مستخدم تجريبي';

  @override
  String get licenseLifetime => 'مدى الحياة';

  @override
  String get licenseNotSetUp => 'غير مُعدّ';

  @override
  String get trialExpiredTitle => 'انتهت فترة التجربة';

  @override
  String get trialExpiredMessage =>
      'انتهت تجربتك المجانية لمدة 14 يوماً. للاستمرار في تحليل صور القزحية، يرجى شراء ترخيص.';

  @override
  String get trialExpiredCanStill => 'لا يزال بإمكانك:';

  @override
  String get trialExpiredViewAnalyses => 'عرض تحليلاتك السابقة';

  @override
  String get trialExpiredExportReports => 'تصدير التقارير الموجودة';

  @override
  String get trialExpiredAccessHistory => 'الوصول إلى سجل الفحوصات';

  @override
  String get trialExpiredMaybeLater => 'ربما لاحقاً';

  @override
  String get licenseRegistration => 'تسجيل الترخيص';

  @override
  String get licenseStatusValid => 'مرخص';

  @override
  String get licenseStatusTrialActive => 'تجربة مجانية';

  @override
  String get licenseStatusTrialExpired => 'انتهت التجربة';

  @override
  String get licenseStatusExpired => 'انتهى صلاحية الترخيص';

  @override
  String get licenseStatusInvalid => 'ترخيص غير صالح';

  @override
  String get licenseStatusUnregistered => 'غير مُعدّ';

  @override
  String get licenseStatusMachineMismatch => 'جهاز مختلف';

  @override
  String get licenseStatusNetworkError => 'خطأ في الاتصال';

  @override
  String get licenseEnterKeyTitle => 'أدخل مفتاح الترخيص';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'اسمك';

  @override
  String get licenseEmailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get licenseMachineId => 'معرف الجهاز';

  @override
  String get licenseCopyMachineId => 'نسخ معرف الجهاز';

  @override
  String get licenseMachineIdCopied => 'تم نسخ معرف الجهاز إلى الحافظة';

  @override
  String get licenseValidationKeyRequired => 'يرجى إدخال مفتاح الترخيص';

  @override
  String get licenseValidationKeyFormat =>
      'يجب أن يتكون مفتاح الترخيص من 20 حرفاً (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'يرجى إدخال اسمك';

  @override
  String get licenseValidationEmailRequired => 'يرجى إدخال بريدك الإلكتروني';

  @override
  String get licenseValidationEmailInvalid => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get licenseActivate => 'تفعيل الترخيص';

  @override
  String get licenseContinueTrial => 'متابعة التجربة';

  @override
  String get licenseBuyLicense => 'شراء ترخيص';

  @override
  String get licenseNeedHelp => 'تحتاج مساعدة؟';

  @override
  String get licenseLicenseAgreement => 'اتفاقية الترخيص';

  @override
  String get licenseActivatedSuccess => 'تم تفعيل الترخيص بنجاح!';

  @override
  String get licenseMsgMachineMismatch =>
      'هذا الترخيص مسجل لجهاز مختلف. يرجى استخدام جهازك الأصلي أو التواصل مع الدعم.';

  @override
  String get licenseMsgTrialEnded =>
      'انتهت تجربتك المجانية. أدخل مفتاح ترخيص لمتابعة استخدام جميع الميزات.';

  @override
  String get licenseMsgExpired => 'انتهى صلاحية ترخيصك. يرجى التجديد للمتابعة.';

  @override
  String get licenseMsgNeedsSetup =>
      'يحتاج الترخيص إلى إعداد. ابدأ تجربتك المجانية أو أدخل مفتاح ترخيص.';

  @override
  String get licenseMsgCheckFormat =>
      'يرجى التحقق من تنسيق مفتاح الترخيص. يجب أن يبدو هكذا: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'لم يتم التعرف على مفتاح الترخيص هذا. يرجى التحقق منه والمحاولة مجدداً.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'هذا المفتاح مسجل بالفعل لجهاز مختلف.';

  @override
  String get licenseMsgContactSupport =>
      'انتهى صلاحية هذا الترخيص. يرجى التواصل مع الدعم للتجديد.';

  @override
  String get licenseMsgActivatedThankYou =>
      'تم تفعيل الترخيص بنجاح! شكراً لشرائك.';

  @override
  String get licenseMsgUnableToActivate =>
      'تعذّر تفعيل الترخيص. يرجى التحقق من اتصالك بالإنترنت والمحاولة مجدداً.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'مرحباً! بدأت تجربتك المجانية لمدة $days يوماً.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'التجربة نشطة: متبقي $days يوم.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'التجربة المجانية نشطة';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'الترخيص نشط - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey => 'تعذّر تفعيل مفتاح الترخيص هذا.';

  @override
  String get licenseMsgNoLongerValid => 'الترخيص لم يعد صالحاً.';

  @override
  String get licenseMsgUnableToVerify =>
      'تعذّر التحقق من مفتاح الترخيص هذا. يرجى التواصل مع الدعم.';

  @override
  String get trialStartedSnackbar => 'بدأت التجربة!';

  @override
  String get trialStartedMessage => 'استمتع بـ 14 يوماً من الوصول الكامل';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'وضع السمة';

  @override
  String get methods => 'الأساليب';

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
  String get dockLeft => 'إرساء يساراً';

  @override
  String get dockRight => 'إرساء يميناً';

  @override
  String get undock => 'إلغاء الإرساء';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'شفاف';

  @override
  String get red => 'أحمر';

  @override
  String get green => 'أخضر';

  @override
  String get blue => 'أزرق';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'أعلى اليسار';

  @override
  String get topCenter => 'أعلى الوسط';

  @override
  String get topRight => 'أعلى اليمين';

  @override
  String get centerLeft => 'وسط اليسار';

  @override
  String get centerRight => 'وسط اليمين';

  @override
  String get bottomLeft => 'أسفل اليسار';

  @override
  String get bottomCenter => 'أسفل الوسط';

  @override
  String get bottomRight => 'أسفل اليمين';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'ضبط';

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
  String get hidden => 'مخفي';

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
  String get defaultIcon => 'افتراضي';

  @override
  String get original => 'أصلي';

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
  String get dragToResizeAreaExample => 'مثال على DragToResizeArea';

  @override
  String get closeWindowConfirmation =>
      'هل أنت متأكد أنك تريد إغلاق هذه النافذة؟';

  @override
  String get licenseChecking => 'جارٍ التحقق من الترخيص...';

  @override
  String get licenseRequiredTitle => 'الترخيص مطلوب';

  @override
  String get licenseActivateValidMessage => 'يرجى تفعيل ترخيص صالح للمتابعة.';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro يشمل:';

  @override
  String get licenseFeatureUnlimitedAnalysis =>
      'تحليل غير محدود لبؤبؤ العين والطوق';

  @override
  String get licenseFeaturePdfReports => 'إنشاء تقارير PDF';

  @override
  String get licenseFeatureBilateralComparison => 'مقارنة ثنائية';

  @override
  String get licenseFeatureAnwAnalysis => 'تحليل طوق ANW';

  @override
  String get licenseFeatureScanHistory => 'قاعدة بيانات سجل الفحوصات';

  @override
  String get licenseFeatureUpdates => 'تحديثات مجانية لمدة سنة';

  @override
  String get licensePurchase => 'شراء ترخيص';

  @override
  String get licenseExitApplication => 'إنهاء التطبيق';

  @override
  String get windowCompactView => 'عرض مضغوط';

  @override
  String get windowExpandedView => 'عرض موسّع';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return 'تجربة ($count يوم متبقٍ)';
  }

  @override
  String get licenseNotLicensed => 'غير مرخص';

  @override
  String get licenseStatusTitle => 'حالة الترخيص';

  @override
  String get unknown => 'غير معروف';

  @override
  String get plrReportTitle => 'تقرير تحليل PLR';

  @override
  String get plrResearchOnlyTitle => 'أداة بحثية/تعليمية فقط';

  @override
  String get plrResearchDisclaimer =>
      'النتائج ليست تشخيصات طبية. استشر متخصصاً في الرعاية الصحية.';

  @override
  String get plrNameLabel => 'الاسم';

  @override
  String plrAgeYears(int age) {
    return 'العمر: $age سنة';
  }

  @override
  String get plrTestLabel => 'الاختبار';

  @override
  String get plrSummaryTitle => 'ملخص PLR';

  @override
  String plrGradeValue(String grade) {
    return 'الدرجة $grade';
  }

  @override
  String get plrStatusLabel => 'الحالة';

  @override
  String get plrDetectedStatus => 'تم اكتشاف PLR';

  @override
  String get plrWeakNotDetectedStatus => 'ضعيف/غير مكتشف';

  @override
  String get plrRecoveryTimeLabel => 'وقت الاسترداد';

  @override
  String get plrRecoveryRatioLabel => 'نسبة الاسترداد';

  @override
  String get plrChartDescription => 'تمثيل بصري لاستجابة بؤبؤ العين عبر الزمن';

  @override
  String plrPiRange(String min, String max) {
    return 'نطاق P/I: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'الأدنى: $value%';
  }

  @override
  String get plrFrameDataTitle => 'بيانات الإطارات';

  @override
  String get plrTableTime => 'الوقت';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'المرحلة';

  @override
  String get plrTableConfidenceShort => 'ثقة';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'ناجح: $success | فاشل: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• الكمون: 200-500 مللي ثانية (الوقت للاستجابة الأولية)';

  @override
  String get plrReferenceConstrictionLine =>
      '• الانقباض: انخفاض 10-30% من الخط الأساسي';

  @override
  String get plrReferenceVelocityLine => '• السرعة: 1.5-4.0% في الثانية';

  @override
  String get plrReferenceRecoveryLine =>
      '• الاسترداد: >75% عودة إلى الخط الأساسي خلال 5 ثوانٍ';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• الاسترداد: >75% عودة إلى الأساس خلال 5 ث';

  @override
  String plrShareSubject(String eye) {
    return 'تقرير تحليل PLR - $eye';
  }

  @override
  String get plrTextReportTitle => 'تقرير تحليل فيديو PLR';

  @override
  String get plrTextDisclaimerTitle =>
      'إخلاء المسؤولية: أداة بحثية/تعليمية فقط';

  @override
  String get plrTextDisclaimerBody => 'النتائج ليست تشخيصات طبية.';

  @override
  String get plrOverallGradeLabel => 'الدرجة الإجمالية';

  @override
  String get plrEndOfReport => 'نهاية التقرير';

  @override
  String get zoneOverlay => 'تراكب المناطق';

  @override
  String get tipDragImage =>
      'نصيحة: اسحب الصورة لمحاذاة الحوف مع دوائر التراكب.';

  @override
  String get overlayMetrics => 'مقاييس التراكب';

  @override
  String get piRatioLabel => 'نسبة P/I:';

  @override
  String get ellipsenessLabel => 'الانحراف البيضاوي:';

  @override
  String get decentralizationLabel => 'اللامركزية:';

  @override
  String get detectedFindings => 'النتائج المكتشفة';

  @override
  String get anwCollarette => 'ANW / الطوق';

  @override
  String get observerNotes => 'ملاحظات المراقب';

  @override
  String get observerNotesHint =>
      'أدخل الملاحظات السريرية ونتائج المناطق والأنماط...';

  @override
  String get autoCenter => 'توسيط تلقائي';

  @override
  String get anwRing => 'حلقة ANW';

  @override
  String get axisGrid => 'المحور/الشبكة';

  @override
  String get chart => 'مخطط';

  @override
  String get hoverToIdentify =>
      'مرر المؤشر فوق منطقة أو انقر عليها للتعرف عليها';

  @override
  String get organsMode =>
      'وضع الأعضاء — مرر المؤشر فوق القزحية لتحديد المناطق';

  @override
  String get mildSizeDiff => 'فارق حجم طفيف. قد يكون تغيراً فسيولوجياً.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'ضمن الخط الأساسي البحثي للعمر $age ($group)';
  }

  @override
  String get formLabel => 'الشكل:';

  @override
  String get flatteningLabel => 'التسطيح:';

  @override
  String get protrusionLabel => 'النتوء:';

  @override
  String get decentrationLabel => 'اللامركزية:';

  @override
  String get pupilSizeLabel => 'حجم بؤبؤ العين:';

  @override
  String get anwRatioLabel => 'نسبة ANW:';

  @override
  String get anwToneLabel => 'نغمة ANW:';

  @override
  String get noMajorODAnomalies =>
      'لا توجد حالات شاذة رئيسية في بؤبؤ عين OD (العين اليمنى).';

  @override
  String get noMajorOSAnomalies =>
      'لا توجد حالات شاذة رئيسية في بؤبؤ عين OS (العين اليسرى).';

  @override
  String get anwNotAssessed => 'ANW: لم يتم التقييم';

  @override
  String get manualAlignmentAid =>
      'أداة محاذاة يدوية للمراجعة فقط (بعد الالتقاط). اسحب الصورة أو استخدم التوسيط التلقائي.';

  @override
  String get frontalShift => 'S: نمط الانزياح الأمامي.';

  @override
  String get cerebralCirculation =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط الدورة الدموية الدماغية.';

  @override
  String get middleTemporalShift => 'D: نمط الانزياح الصدغي الأوسط.';

  @override
  String get respiratoryCardiac =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط اللاإرادي التنفسية والقلبية.';

  @override
  String get findings => 'النتائج:';

  @override
  String get analysisReportTitle => 'تقرير تحليل بؤبؤ العين';

  @override
  String get reportResearchVersion => 'إصدار البحث';

  @override
  String get reportDisclaimerTitle => 'إخلاء المسؤولية: أداة بحثية/تعليمية فقط';

  @override
  String get reportDisclaimerBody =>
      'النتائج ملاحظات بحثية، وليست تشخيصات طبية.';

  @override
  String get reportPersonInformationTitle => 'معلومات الشخص';

  @override
  String get reportAgeGroupLabel => 'الفئة العمرية';

  @override
  String get reportPupilSizeComparisonTitle => 'مقارنة حجم بؤبؤ العين';

  @override
  String get reportCaptureDistanceMetricsTitle => 'مقاييس مسافة الالتقاط';

  @override
  String get reportResearchObservationsTitle => 'الملاحظات البحثية';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'ملاحظات المراقب (تراكب المناطق)';

  @override
  String get reportEndOfReport => 'نهاية التقرير';

  @override
  String get reportGradeLabel => 'الدرجة';

  @override
  String get reportPupilFormTitle => 'شكل بؤبؤ العين';

  @override
  String get reportDecentrationTitle => 'اللامركزية';

  @override
  String get reportFlatteningsTitle => 'التسطيحات';

  @override
  String get reportProtrusionsTitle => 'النتوءات';

  @override
  String get reportAnwParametersTitle => 'الحلقة العصبية اللاإرادية (ANW)';

  @override
  String get reportTonicStateLabel => 'نمط النغمة التاريخي';

  @override
  String get reportShiftDetectedTitle => 'نمط الانزياح التاريخي';

  @override
  String get reportClinicalLabel => 'ملاحظة تاريخية';

  @override
  String get reportConstrictionDetectedTitle => 'تم اكتشاف انقباض';

  @override
  String get reportSeverityLabel => 'الشدة';

  @override
  String get reportReferenceValuesTitle =>
      'القيم المرجعية (بروتوكول CNRI البحثي)';

  @override
  String get reportMatchLabel => 'تطابق';

  @override
  String get reportValueLabel => 'القيمة';

  @override
  String get reportNormalPupilForm => 'شكل بؤبؤ عين طبيعي';

  @override
  String reportPageXofY(int page, int total) {
    return 'الصفحة $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'تقرير تحليل بؤبؤ العين - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'مرفق تقرير تحليل بؤبؤ العين لـ $patientName، المُولَّد بتاريخ $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'أدنى من الخط الأساسي البحثي للعمر $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'أعلى من الخط الأساسي البحثي للعمر $age ($group)';
  }

  @override
  String get ageGroupInfant => 'رضيع';

  @override
  String get ageGroupChild15 => 'طفل (1-5)';

  @override
  String get ageGroupChild611 => 'طفل (6-11)';

  @override
  String get ageGroupTeen => 'مراهق';

  @override
  String get ageGroupAdult2039 => 'بالغ (20-39)';

  @override
  String get ageGroupAdult4059 => 'بالغ (40-59)';

  @override
  String get ageGroupSenior60Plus => 'مسن (60+)';

  @override
  String get middleNasalShift => 'نمط الانزياح الأنفي الأوسط.';

  @override
  String get upperTemporalShift => 'نمط الانزياح الصدغي العلوي.';

  @override
  String get lowerTemporalShift => 'نمط الانزياح الصدغي السفلي.';

  @override
  String get basalShift => 'نمط الانزياح القاعدي.';

  @override
  String get vagusStellateAssociation =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط خمول العصب المبهم أو العقدة النجمية.';

  @override
  String get venaCavaInferiorAssociation =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط الاضطراب الديناميكي الدموي في الوريد الأجوف السفلي.';

  @override
  String get vertebralArteryAssociation =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط دوران الشريان الفقري.';

  @override
  String get smallPelvisAssociation =>
      'ربطت الدراسات التاريخية وفقاً لفيلشوفر هذا بأنماط الاحتقان في الحوض الصغير.';

  @override
  String get openZoneOverlay => 'فتح تراكب المناطق';

  @override
  String get iris => 'القزحية';

  @override
  String get chartOpacity => 'شفافية المخطط';

  @override
  String get irisSizeNotAvailable => 'بيانات حجم القزحية غير متاحة';

  @override
  String get ratio => 'النسبة';

  @override
  String get reportRefPiRatio => 'نسبة بؤبؤ العين/القزحية: الطبيعي 20-30%';

  @override
  String get reportRefEllipseness => 'الانحراف البيضاوي: الطبيعي >95%';

  @override
  String get reportRefDecentralization => 'اللامركزية: الطبيعي <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'فارق حجم بؤبؤ العين: <2% طبيعي، 2-4% طفيف، >4% ملحوظ';

  @override
  String get enterPatientInfoAnalysis => 'أدخل معلومات المريض → التحليل';

  @override
  String get chooseCaptureMethod => 'اختر طريقة الالتقاط:';

  @override
  String get usbCamera => 'كاميرا USB';

  @override
  String get selectExistingImage => 'اختر صورة موجودة';

  @override
  String get detectingCameras => 'جارٍ اكتشاف الكاميرات...';

  @override
  String get retryDetection => 'إعادة الاكتشاف';

  @override
  String get connectUvcCameraViaUsb => 'وصّل كاميرا UVC عبر USB';

  @override
  String get ensureCameraDriversInstalled =>
      'تأكد من تثبيت برامج تشغيل الكاميرا';

  @override
  String get tapRefreshToDetect => 'انقر على تحديث لاكتشاف الكاميرات';

  @override
  String get connectUsbCameraToBegin => 'وصّل كاميرا USB للبدء';

  @override
  String get noExternalCameraTitle => 'لم يتم اكتشاف كاميرا خارجية';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'وصّل إيريسكوب USB وتأكد من توصيله';

  @override
  String get languagesAvailable => 'اللغات المتاحة';

  @override
  String get validationChecks => 'فحوصات التحقق:';

  @override
  String get eyeQualityTip => 'نصيحة: تأكد من إضاءة جيدة وأبقِ العين ثابتة';

  @override
  String get validatingEye => 'جارٍ التحقق من العين...';

  @override
  String get initializing => 'جارٍ التهيئة...';

  @override
  String get nameLabel => 'الاسم:';

  @override
  String get ageLabel => 'العمر:';

  @override
  String get typeLabel => 'النوع:';

  @override
  String get pleaseEnterName => 'يرجى إدخال الاسم';

  @override
  String get pleaseEnterAge => 'يرجى إدخال العمر';

  @override
  String get ageMustBe2Digits => 'يجب أن يحتوي العمر على 1 أو 2 رقم';

  @override
  String get optional => '(اختياري)';

  @override
  String get bilateralBothHands => 'الاستخدام الثنائي لكلتا اليدين';

  @override
  String get zoom => 'تكبير';

  @override
  String get zoomSliderTip =>
      'استخدم شريط التكبير على اليمين لضبط التكبير قبل التسجيل.';

  @override
  String get aboutProgramDeveloper => 'مطور البرنامج - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'حجم المخطط';

  @override
  String get chartOpacityAdvancedTooltip =>
      'شفافية المخطط (0 = عند التمرير فقط / وضع الأعضاء)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'تم والعودة';

  @override
  String get errorImageShape =>
      'شكل الصورة غير صحيح - تأكد من ملء العين للإطار';

  @override
  String get cameraConnected => 'تم توصيل الكاميرا';

  @override
  String get cameraDisconnected => 'تم قطع اتصال الكاميرا';

  @override
  String get cameraPermissionDenied => 'تم رفض إذن الكاميرا';

  @override
  String get cameraFailedInit => 'فشل تهيئة الكاميرا';

  @override
  String get cameraInUse => 'الكاميرا قيد الاستخدام من تطبيق آخر';

  @override
  String get cameraFormatNotSupported => 'تنسيق الكاميرا غير مدعوم';

  @override
  String get capturedImageNotFound => 'ملف الصورة الملتقطة غير موجود';

  @override
  String get failedToCaptureImage => 'فشل التقاط الصورة';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'حدث خطأ في الكاميرا';

  @override
  String get connectingToUsbIriscope => 'جارٍ الاتصال بالإيريسكوب USB...';

  @override
  String get noCamerasDetectedMessage =>
      'لم يتم اكتشاف أي كاميرات. يرجى التأكد من توصيل كاميرا USB وتعرّف النظام عليها.';

  @override
  String get failedToAccessCameras => 'فشل الوصول إلى الكاميرات';

  @override
  String get notAnEyeImageTitle => 'ليست صورة عين';

  @override
  String get notAnEyeImageBody =>
      'الصورة المختارة لا تبدو عيناً.\n\nالرجاء اختيار صورة واضحة للقزحية/الحدقة والمحاولة مجدداً.';

  @override
  String get notAnEyeImageBodyCapture =>
      'الصورة الملتقطة لا تبدو عيناً.\n\nيرجى وضع الإيريسكوب مباشرة فوق العين والتقاط الصورة مجدداً.';

  @override
  String get anisocoriaObservationSymmetrical => 'متماثل';

  @override
  String get anisocoriaObservationSlight => 'اختلاف طفيف';

  @override
  String get anisocoriaObservationModerate => 'اختلاف متوسط';

  @override
  String get anisocoriaObservationMarked => 'اختلاف واضح';

  @override
  String get settingsNaturalMedicineSection => 'الطب الطبيعي';

  @override
  String get settingsHerbalToggle => 'توصيات عشبية (قائمة على مناطق القزحية)';

  @override
  String get settingsNutritionToggle =>
      'تغذية نظام 7 ألوان (قائمة على مناطق القزحية)';

  @override
  String get settingsChiropracticToggle =>
      'تقويم العمود الفقري / التقييم الشوكي';

  @override
  String get settingsTcmToggle => 'الطب الصيني التقليدي (TCM)';

  @override
  String get therapyHerbalTitle => 'التوصيات العشبية';

  @override
  String get therapyHerbalSubtitle =>
      'نتائج مناطق القزحية — مرتبة حسب وزن الأدلة';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count مراجع';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'الاقتراحات العشبية مقدمة لأغراض تعليمية فقط. استشر متخصصاً صحياً مؤهلاً قبل الاستخدام.';

  @override
  String get therapyNutritionTitle => 'تغذية نظام 7 ألوان';

  @override
  String get therapyNutritionSubtitle =>
      'الأطعمة والمغذيات لأعضاء مناطق القزحية';

  @override
  String get therapyNutritionFoodsByColor => 'الأطعمة الموصى بها حسب اللون';

  @override
  String get therapyNutritionKeyNutrients => 'المغذيات الرئيسية';

  @override
  String get therapyNutritionHerbs => 'الأعشاب والتوابل الداعمة';

  @override
  String get therapyNutritionNotes => 'ملاحظات غذائية';

  @override
  String get therapyNutritionTonifying => 'أطعمة مقوية:';

  @override
  String get therapyNutritionAvoid => 'تقليل / تجنب:';

  @override
  String get therapyNutritionDisclaimer =>
      'تستند اقتراحات التغذية إلى إطار نظام 7 ألوان وتُقدم لأغراض تعليمية فقط. استشر متخصصاً قبل إجراء تغييرات غذائية.';

  @override
  String get therapyChiroTitle => 'التقييم العلاجي للعمود الفقري';

  @override
  String get therapyChiroSubtitle =>
      'المقاطع الفقرية المشار إليها بنتائج مناطق القزحية';

  @override
  String get therapyChiroVertebrae => 'الفقرات';

  @override
  String get therapyChiroNerveRoots => 'جذور الأعصاب';

  @override
  String get therapyChiroInnervated => 'الهياكل المعصبة';

  @override
  String get therapyChiroSubluxation => 'مؤشرات احتمالية للخلع الجزئي';

  @override
  String get therapyChiroMuscles => 'العضلات المتأثرة في الغالب';

  @override
  String get therapyChiroAdjusting => 'نهج التعديل التقويمي';

  @override
  String get therapyChiroExercises => 'تمارين وتمطيطات منزلية';

  @override
  String get therapyChiroPostural => 'ملاحظة وضعية';

  @override
  String get therapyChiroDisclaimer =>
      'المعلومات التقويمية مقدمة لأغراض تعليمية. استشر معالجاً تقويمياً مرخصاً للتشخيص والعلاج.';

  @override
  String get therapyTcmTitle => 'الطب الصيني التقليدي';

  @override
  String get therapyTcmSubtitle => 'الميريديان · ساعة الأعضاء · العناصر الخمسة';

  @override
  String get therapyTcmMeridianFunctions => 'وظائف الميريديان';

  @override
  String get therapyTcmGoverns => 'يتحكم في';

  @override
  String get therapyTcmPatterns => 'أنماط الاختلال';

  @override
  String get therapyTcmSymptoms => 'الأعراض';

  @override
  String get therapyTcmFormulas => 'التركيبات الكلاسيكية';

  @override
  String get therapyTcmKeyPoints => 'النقاط الرئيسية لهذا النمط';

  @override
  String get therapyTcmAcupoints => 'نقاط الضغط الرئيسية';

  @override
  String get therapyTcmDiet => 'العلاج الغذائي بالطب الصيني';

  @override
  String get therapyTcmTonifying => 'أطعمة مقوية:';

  @override
  String get therapyTcmAvoid => 'تقليل / تجنب:';

  @override
  String get therapyTcmDisclaimer =>
      'معلومات الطب الصيني مقدمة لأغراض تعليمية. استشر طبيباً مرخصاً في الوخز بالإبر أو الطب الصيني التقليدي.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'لم يتم اكتشاف نتائج مهمة في مناطق القزحية لإنشاء توصيات.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'الموسم';

  @override
  String get therapyClimateLabel => 'المناخ';

  @override
  String get therapyEmotionLabel => 'العاطفة';

  @override
  String get therapyTasteLabel => 'الطعم';

  @override
  String get therapyNatureLabel => 'الطبيعة';

  @override
  String therapyPairedOrgan(String organ) {
    return 'المقترن: $organ';
  }

  @override
  String get bothEyesCapturedTitle => 'تم التقاط كلتي العينين';

  @override
  String get constitutionalType => 'النوع الدستوري';

  @override
  String get constitutionalTypeOptional => 'النوع الدستوري (اختياري)';

  @override
  String get selectConstitutionalType => 'اختر النوع الدستوري…';

  @override
  String get constitutionalTypeNone => 'لا شيء (غير مقيّم)';

  @override
  String get constitutionalIridology => 'علم القزحية الدستوري';

  @override
  String get constitutionalIrisDescription => 'وصف القزحية';

  @override
  String get constitutionalPredispositions => 'الاستعدادات الصحية';

  @override
  String get constitutionalHomeopathicRemedies => 'العلاجات المثلية';

  @override
  String get constitutionalTypeBy =>
      'استناداً إلى علم القزحية الدستوري للدكتور يوزيف ديك';
}
