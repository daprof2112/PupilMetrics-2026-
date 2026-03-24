// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => 'विश्लेषण करें';

  @override
  String get plrModes => 'PLR मोड';

  @override
  String get captureInstructions => 'आँख को गाइड सर्कल के अंदर रखें';

  @override
  String get scanHistory => 'स्कैन इतिहास';

  @override
  String get selectCameraMode => 'कैमरा मोड चुनें';

  @override
  String get loadFromGallery => 'गैलरी से लोड करें';

  @override
  String get rightEyePhoto => 'दाईं आँख की फोटो';

  @override
  String get leftEyePhoto => 'बाईं आँख की फोटो';

  @override
  String get autoCapture => 'स्वतः-कैप्चर';

  @override
  String get autoCaptureDesc => 'आँख पहचान + 5 सेकंड स्वतः-कैप्चर';

  @override
  String get manualCapture => 'मैन्युअल कैप्चर';

  @override
  String get manualCaptureDesc => 'आँख पहचान + मैन्युअल कैप्चर (पिछला कैमरा)';

  @override
  String get selfieMode => 'सेल्फी मोड';

  @override
  String get selfieModeDesc => 'आँख पहचान + 5 सेकंड स्वतः-कैप्चर (फ्रंट कैमरा)';

  @override
  String get plrVideoRear => 'PLR वीडियो (रियर)';

  @override
  String get plrVideoRearDesc => 'पिछला कैमरा • 10 सेकंड कैप्चर';

  @override
  String get plrVideoSelfie => 'PLR वीडियो (सेल्फी)';

  @override
  String get plrVideoSelfieDesc => 'फ्रंट कैमरा • 10 सेकंड कैप्चर';

  @override
  String get plrVideoCapture => 'PLR वीडियो कैप्चर';

  @override
  String get frontCamera => 'फ्रंट कैमरा';

  @override
  String get rearCamera => 'रियर कैमरा';

  @override
  String get selectEyeToAssess => 'जाँचने के लिए आँख चुनें';

  @override
  String get rightEyeOD => 'दाईं आँख (OD)';

  @override
  String get leftEyeOS => 'बाईं आँख (OS)';

  @override
  String get recordPlrRightEye => 'दाईं आँख के लिए PLR रिकॉर्ड करें';

  @override
  String get recordPlrLeftEye => 'बाईं आँख के लिए PLR रिकॉर्ड करें';

  @override
  String get loadRightEyeImage => 'दाईं आँख की छवि लोड करें';

  @override
  String get loadLeftEyeImage => 'बाईं आँख की छवि लोड करें';

  @override
  String get bothEyes => 'दोनों आँखें';

  @override
  String get loadBothEyesDesc => 'पहले दाईं आँख, फिर बाईं आँख लोड करें';

  @override
  String get selectEyeImageFromDevice => 'अपने डिवाइस से एक आँख की छवि चुनें';

  @override
  String get selectRightEyeFirst => 'पहले दाईं आँख (OD) की छवि चुनें';

  @override
  String get rightEyeSaved =>
      'दाईं आँख सहेजी गई। अब बाईं आँख (OS) की छवि चुनें';

  @override
  String get cancelledNoRightEye => 'रद्द किया गया - कोई दाईं आँख नहीं चुनी गई';

  @override
  String get cancelledNoLeftEye => 'रद्द किया गया - कोई बाईं आँख नहीं चुनी गई';

  @override
  String errorLoadingImages(String error) {
    return 'छवियाँ लोड करने में त्रुटि: $error';
  }

  @override
  String get crop43 => 'क्रॉप (4:3)';

  @override
  String get success => 'सफलता';

  @override
  String get imageCroppedSuccess => 'छवि सफलतापूर्वक क्रॉप की गई!';

  @override
  String get error => 'त्रुटि';

  @override
  String get cropFailed => 'छवि क्रॉप करने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get crop => 'क्रॉप';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get saved => 'सहेजा गया! ✅';

  @override
  String get imageSavedToGallery => 'छवि गैलरी में सफलतापूर्वक सहेजी गई';

  @override
  String get exposure => 'एक्सपोजर';

  @override
  String get flash => 'फ्लैश';

  @override
  String get eye => 'आँख';

  @override
  String get center => 'केंद्र';

  @override
  String get light => 'प्रकाश';

  @override
  String get ready => 'तैयार';

  @override
  String get on => 'चालू';

  @override
  String get off => 'बंद';

  @override
  String get auto => 'स्वतः';

  @override
  String get manual => 'मैन्युअल';

  @override
  String get selfie => 'सेल्फी';

  @override
  String get pupil => 'पुतली';

  @override
  String get plrHistory => 'PLR इतिहास';

  @override
  String get searchByName => 'नाम से खोजें...';

  @override
  String get totalScans => 'कुल स्कैन';

  @override
  String get thisWeek => 'इस सप्ताह';

  @override
  String get patients => 'मरीज़';

  @override
  String get detected => 'पता चला';

  @override
  String get noPlrRecordsYet => 'अभी तक कोई PLR रिकॉर्ड नहीं';

  @override
  String get recordPlrVideoToSeeHistory =>
      'इतिहास देखने के लिए PLR वीडियो रिकॉर्ड करें';

  @override
  String get deleteRecord => 'रिकॉर्ड हटाएं?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return '$name ($eye) का PLR विश्लेषण हटाएं?\\n\\nयह पूर्ववत नहीं किया जा सकता।';
  }

  @override
  String get delete => 'हटाएं';

  @override
  String get recordDeleted => 'रिकॉर्ड हटाया गया';

  @override
  String plrAnalysis(String eye) {
    return 'PLR विश्लेषण - $eye';
  }

  @override
  String get patient => 'मरीज़';

  @override
  String get date => 'तारीख';

  @override
  String get frames => 'फ्रेम';

  @override
  String get baselinePiRatio => 'आधारभूत P/I';

  @override
  String get minPiRatio => 'न्यूनतम P/I';

  @override
  String get plrMagnitude => 'PLR परिमाण';

  @override
  String get constriction => 'संकुचन';

  @override
  String get plrDetected => 'PLR पता चला';

  @override
  String get confidence => 'विश्वसनीयता';

  @override
  String get grade => 'श्रेणी';

  @override
  String get close => 'बंद करें';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get na => 'N/A';

  @override
  String get takeLeftEyePhoto => 'बाईं आँख की फोटो लें';

  @override
  String get takeRightEyePhoto => 'दाईं आँख की फोटो लें';

  @override
  String get nowTakingLeftEye => 'अब बाईं आँख (OS) ली जा रही है';

  @override
  String get startingWithRightEye => 'दाईं आँख (OD) से शुरू हो रहे हैं';

  @override
  String get captured => 'कैप्चर किया ✓';

  @override
  String get useSameDistanceLighting =>
      'सटीक तुलना के लिए दाईं आँख जैसी दूरी और रोशनी का उपयोग करें।';

  @override
  String get step1of2 => 'चरण 1 / 2';

  @override
  String get step2of2 => 'चरण 2 / 2';

  @override
  String get bothEyesCaptured => 'दोनों आँखें कैप्चर की गईं ✓';

  @override
  String get continueToLeftEye => 'बाईं आँख की ओर जारी रखें';

  @override
  String get retakeOD => 'OD पुनः लें';

  @override
  String get retakeOS => 'OS पुनः लें';

  @override
  String get retakeRightEye => 'दाईं आँख पुनः लें';

  @override
  String get analyzeBothEyes => 'दोनों आँखों का विश्लेषण करें';

  @override
  String get patientInfoMissing => 'मरीज़ की जानकारी अनुपलब्ध';

  @override
  String get rightEyePhotoMissing => 'दाईं आँख की फोटो अनुपलब्ध!';

  @override
  String get patientInfoMissingRestart =>
      'मरीज़ की जानकारी अनुपलब्ध। कृपया पुनः आरंभ करें।';

  @override
  String get exitApp => 'ऐप बंद करें';

  @override
  String get tipsForBestResults => 'सर्वोत्तम परिणामों के लिए सुझाव';

  @override
  String get followGuidelinesForQuality =>
      'इष्टतम छवि गुणवत्ता के लिए इन दिशानिर्देशों का पालन करें';

  @override
  String get cameraDistance => 'कैमरा दूरी';

  @override
  String get cameraDistanceDesc =>
      'कैमरे को आँख से 4-6 इंच दूर रखें। दोनों आँखों के लिए समान दूरी बनाए रखें।';

  @override
  String get lightingPosition => 'रोशनी की स्थिति';

  @override
  String get lightingPositionDesc =>
      'प्रकाश स्रोत को पुतली की सीमाओं के अंदर या बाहर रखें। कैमरे के फ्लैश की ओर देखने का प्रयास करें।';

  @override
  String get avoidReflections => 'प्रतिबिंबों से बचें';

  @override
  String get avoidReflectionsDesc =>
      'खिड़की की चमक, दर्पण और सीधी लैंप से बचकर प्रतिबिंब कम करें।';

  @override
  String get centerYourEye => 'आँख को केंद्रित करें';

  @override
  String get centerYourEyeDesc =>
      'सुनिश्चित करें कि श्वेतपटल (सफेद भाग) सहित पूरी आँख केंद्रित हो और फ्रेम भर जाए।';

  @override
  String get cropProperly => 'सही तरह से क्रॉप करें';

  @override
  String get cropProperlyDesc =>
      'आँख को केंद्र में रखकर छवि क्रॉप करें। छवि 4:3 अनुपात में स्वतः सहेजी जाएगी।';

  @override
  String get importantInformation => 'महत्वपूर्ण जानकारी';

  @override
  String get imageRatio43 => 'चिकित्सा इमेजिंग मानक के लिए 4:3 छवि अनुपात';

  @override
  String get forClinicalUseCnri =>
      'CNRI (cnri.edu) के साथ नैदानिक उपयोग के लिए';

  @override
  String get noMedicalDiagnosis => 'कोई चिकित्सीय निदान प्रदान नहीं करता';

  @override
  String get eyeWideOpenClear =>
      'सुनिश्चित करें कि आपकी आँख पूरी तरह खुली हो और तस्वीर स्पष्ट हो';

  @override
  String get personalInfo => 'व्यक्तिगत जानकारी';

  @override
  String get personInformation => 'व्यक्ति की जानकारी';

  @override
  String get enterPersonDetails => 'व्यक्ति का विवरण दर्ज करें';

  @override
  String get infoIncludedInReport =>
      'यह जानकारी विश्लेषण रिपोर्ट में शामिल की जाएगी';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get enterPersonName => 'व्यक्ति का नाम दर्ज करें';

  @override
  String get nameRequired => 'नाम आवश्यक है';

  @override
  String get sex => 'लिंग';

  @override
  String get male => 'पुरुष';

  @override
  String get female => 'महिला';

  @override
  String get ageYears => 'उम्र (वर्ष)';

  @override
  String get enterAge => 'उम्र दर्ज करें';

  @override
  String get ageRequired => 'उम्र आवश्यक है';

  @override
  String get enterValidNumber => 'एक वैध संख्या दर्ज करें';

  @override
  String get enterValidAge => 'एक वैध उम्र दर्ज करें (0-120)';

  @override
  String get mainComplaints => 'मुख्य शिकायतें';

  @override
  String get mainComplaintsOptional => 'मुख्य शिकायतें (वैकल्पिक)';

  @override
  String get complaintsHint => 'जैसे, सिरदर्द, दृष्टि समस्याएं, थकान...';

  @override
  String get continueToCaptire => 'कैप्चर की ओर जारी रखें';

  @override
  String get ageImportantNote =>
      'पुतली के आकार के सटीक मूल्यांकन के लिए उम्र महत्वपूर्ण है क्योंकि सामान्य सीमाएं उम्र के अनुसार बदलती हैं।';

  @override
  String get submit => 'सबमिट करें';

  @override
  String get pleaseSelectGender => 'कृपया लिंग चुनें!';

  @override
  String get applicationSubmitted => 'आपका आवेदन सफलतापूर्वक सबमिट किया गया।';

  @override
  String get type => 'प्रकार:';

  @override
  String get gender => 'लिंग:';

  @override
  String get rightHanded => 'दाहिने हाथ का';

  @override
  String get leftHanded => 'बाएं हाथ का';

  @override
  String get partialLeftHandedness => 'आंशिक बाएं हाथ का उपयोग';

  @override
  String get retrainedLeftHandedness => 'पुनः प्रशिक्षित बाएं हाथ का उपयोग';

  @override
  String get bilateralUseBothHands => 'दोनों हाथों का द्विपक्षीय उपयोग';

  @override
  String get splashTitle => 'PupilMetrics Eye Capture';

  @override
  String get splashDeveloper => 'प्रोग्राम डेवलपर - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'शोध/शैक्षणिक उपकरण';

  @override
  String get startNewAnalysis => 'नया विश्लेषण शुरू करें';

  @override
  String get viewHistory => 'इतिहास देखें';

  @override
  String get viewResearchDisclaimer => 'शोध अस्वीकरण देखें';

  @override
  String get researchDisclaimerTitle => 'शोध/शैक्षणिक उपकरण';

  @override
  String get researchDisclaimerNotMedical => 'चिकित्सा उपकरण नहीं है';

  @override
  String get researchDisclaimerNotClinical => 'नैदानिक निदान के लिए नहीं';

  @override
  String get researchDisclaimerResults => 'परिणाम शोध अवलोकन हैं';

  @override
  String get researchDisclaimerConsult =>
      'हमेशा स्वास्थ्य पेशेवरों से परामर्श करें';

  @override
  String get researchDisclaimerAcknowledge =>
      'जारी रखकर, आप स्वीकार करते हैं कि यह एक शोध उपकरण है और इसे चिकित्सीय निर्णयों के लिए उपयोग नहीं किया जाना चाहिए।';

  @override
  String get researchDisclaimerWarning =>
      'यह ऐप केवल शोध और शैक्षणिक उद्देश्यों के लिए है।';

  @override
  String get iUnderstand => 'मैं समझता/समझती हूँ';

  @override
  String get plrAnalysisTest => 'PLR विश्लेषण परीक्षण';

  @override
  String get checkingVideoFile => 'वीडियो फ़ाइल की जाँच हो रही है...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'फ्रेम $current/$total (${timestamp}ms) प्रोसेस हो रहा है...';
  }

  @override
  String get analysisComplete => 'विश्लेषण पूरा हुआ!';

  @override
  String get errorVideoNotFound => 'त्रुटि: वीडियो फ़ाइल नहीं मिली';

  @override
  String get waitingForResults => 'परिणामों की प्रतीक्षा हो रही है...';

  @override
  String get baseline => 'आधारभूत';

  @override
  String get flashPhase => 'फ्लैश';

  @override
  String get constrictionPhase => 'संकुचन';

  @override
  String get recovery => 'पुनर्प्राप्ति';

  @override
  String get plrDetectedExclaim => 'PLR पता चला!';

  @override
  String get plrWeakNotDetected => 'PLR कमज़ोर/पता नहीं चला';

  @override
  String get min => 'न्यूनतम';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'संकुचन';

  @override
  String get saveToHistory => 'इतिहास में सहेजें';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'फ्रेम सहेजें';

  @override
  String get share => 'शेयर करें';

  @override
  String get frameSavedToGallery => 'फ्रेम गैलरी में सहेजा गया!';

  @override
  String get failedToSaveFrame => 'फ्रेम सहेजने में विफल';

  @override
  String framesSavedToGallery(int count) {
    return '$count फ्रेम गैलरी में सहेजे गए!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON क्लिपबोर्ड में कॉपी किया गया!';

  @override
  String get reportCopiedToClipboard => 'रिपोर्ट क्लिपबोर्ड में कॉपी की गई!';

  @override
  String shareFailedError(String error) {
    return 'शेयर विफल: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'इतिहास में सहेजा गया! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'सहेजने में विफल: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'सहेजने के लिए कोई सफल फ्रेम नहीं';

  @override
  String get saveAllFrames => 'सभी फ्रेम सहेजें';

  @override
  String get shareReport => 'रिपोर्ट शेयर करें';

  @override
  String get shareJson => 'JSON शेयर करें';

  @override
  String get rerunTest => 'परीक्षण फिर से चलाएं';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'कैमरा प्रारंभ हो रहा है...';

  @override
  String usingCamera(String camera) {
    return '$camera कैमरा उपयोग में है';
  }

  @override
  String cameraError(String error) {
    return 'कैमरा त्रुटि: $error';
  }

  @override
  String get noCamerasFound => 'कोई कैमरा नहीं मिला';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get startPlrRecording => 'PLR रिकॉर्डिंग शुरू करें';

  @override
  String get stopRecording => 'रिकॉर्डिंग रोकें';

  @override
  String get phaseReady => 'तैयार';

  @override
  String get phaseStarting => 'शुरू हो रहा है...';

  @override
  String phaseBaseline(int sec) {
    return 'आधारभूत (0-$sec सेकंड)';
  }

  @override
  String get phaseFlash => 'फ्लैश!';

  @override
  String phaseConstriction(int start, int end) {
    return 'संकुचन ($start-$end सेकंड)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'पुनर्प्राप्ति ($start-$end सेकंड)';
  }

  @override
  String get phaseComplete => 'पूर्ण!';

  @override
  String get readyDesc => 'आँख को सर्कल में रखें, फिर स्टार्ट दबाएं';

  @override
  String get holdSteady => 'स्थिर रहें...';

  @override
  String get recordingBaselinePupil =>
      'आधारभूत पुतली का आकार रिकॉर्ड हो रहा है';

  @override
  String lightStimulus(int ms) {
    return 'प्रकाश उत्तेजना (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'पुतली संकुचन मापा जा रहा है';

  @override
  String get measuringRecovery => 'पुतली पुनर्प्राप्ति मापी जा रही है';

  @override
  String get plrRecordingComplete => 'PLR रिकॉर्डिंग पूरी हुई';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return '$eye आँख को सर्कल के अंदर रखें।\\n$seconds सेकंड की रिकॉर्डिंग के दौरान स्थिर रहें।';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'आँख स्थिर रखें। $sec सेकंड पर फ्लैश होगा।';
  }

  @override
  String get recordingComplete => 'रिकॉर्डिंग पूरी हुई';

  @override
  String get plrVideoCapturedSuccess =>
      'PLR वीडियो सफलतापूर्वक कैप्चर किया गया!';

  @override
  String get duration => 'अवधि';

  @override
  String get seconds => 'सेकंड';

  @override
  String get frameRate => 'फ्रेम दर';

  @override
  String get camera => 'कैमरा';

  @override
  String flashAt(int sec, int ms) {
    return '$sec सेकंड पर (${ms}ms)';
  }

  @override
  String get phases => 'चरण';

  @override
  String get phasesFlow => 'आधारभूत → फ्लैश → संकुचन → पुनर्प्राप्ति';

  @override
  String get expectedNormalValues => 'अपेक्षित सामान्य मान:';

  @override
  String get latency => 'विलंबता';

  @override
  String get velocity => 'वेग';

  @override
  String get testFrameAnalysis => '🧪 परीक्षण फ्रेम विश्लेषण';

  @override
  String get retake => 'पुनः लें';

  @override
  String get done => 'हो गया';

  @override
  String get plrVideoModeTitle => 'PLR वीडियो मोड';

  @override
  String get plrAssessmentTitle => 'पुतलीय प्रकाश प्रतिवर्त (PLR) मूल्यांकन';

  @override
  String get plrInstructions =>
      '1. आँख को गाइड सर्कल के अंदर रखें\\n2. \'PLR रिकॉर्डिंग शुरू करें\' दबाएं\\n3. 10 सेकंड तक स्थिर रहें\\n4. 3 सेकंड पर फ्लैश होगा\\n5. ऐप पुतली की प्रतिक्रिया रिकॉर्ड करता है';

  @override
  String get recordingPhases => 'रिकॉर्डिंग चरण:';

  @override
  String get baselinePhaseDesc => 'प्रारंभिक पुतली का आकार';

  @override
  String get flashPhaseDesc => 'प्रकाश उत्तेजना';

  @override
  String get constrictionPhaseDesc => 'पुतली सिकुड़ती है';

  @override
  String get recoveryPhaseDesc => 'पुतली वापस आती है';

  @override
  String get normalPlrValues => 'सामान्य PLR मान:';

  @override
  String get gotIt => 'समझ गया';

  @override
  String get pupilAnalysis => 'पुतली विश्लेषण';

  @override
  String scansLeft(int count) {
    return '$count शेष';
  }

  @override
  String get validatingRightEye => 'दाईं आँख को मान्य किया जा रहा है...';

  @override
  String get validatingLeftEye => 'बाईं आँख को मान्य किया जा रहा है...';

  @override
  String get analyzingRightEye => 'दाईं आँख (OD) का विश्लेषण हो रहा है...';

  @override
  String get analyzingLeftEye => 'बाईं आँख (OS) का विश्लेषण हो रहा है...';

  @override
  String get comparingPupils => 'पुतलियों की तुलना हो रही है...';

  @override
  String person(String name) {
    return 'व्यक्ति: $name';
  }

  @override
  String get invalidEyeImage => 'अमान्य आँख की छवि';

  @override
  String analysisFailed(String error) {
    return 'विश्लेषण विफल: $error';
  }

  @override
  String get researchEducationalToolOnly => 'केवल शोध/शैक्षणिक उपकरण';

  @override
  String get resultsNotMedicalDiagnoses =>
      'यह एप्लिकेशन केवल शोध और शैक्षणिक उद्देश्यों के लिए है। परिणाम चिकित्सीय निदान नहीं हैं और नैदानिक उपयोग के लिए मान्य नहीं किए गए हैं। पैटर्न संबद्धताएं ऐतिहासिक शोध साहित्य से हैं। किसी भी स्वास्थ्य चिंता के लिए स्वास्थ्य पेशेवर से परामर्श करें।';

  @override
  String get pupilSizeDifference => 'पुतली के आकार में अंतर पाया गया';

  @override
  String get significantPupilSizeDiff => 'पुतली के आकार में महत्वपूर्ण अंतर';

  @override
  String get diff => 'अंतर';

  @override
  String get researchObservationConsult =>
      'शोध अवलोकन - व्याख्या के लिए स्वास्थ्य पेशेवर से परामर्श करें';

  @override
  String get ageBasedResearchBaseline => 'आयु-आधारित शोध आधारभूत';

  @override
  String group(String group) {
    return 'समूह: $group';
  }

  @override
  String get researchRange => 'शोध सीमा';

  @override
  String get measuredEst => 'मापा गया (अनुमानित)';

  @override
  String get pupilForm => 'पुतली का रूप';

  @override
  String get decentrationPattern => 'विकेंद्रीकरण पैटर्न';

  @override
  String get flattenings => 'चपटापन';

  @override
  String get protrusions => 'उभार';

  @override
  String zonesCount(int count) {
    return '$count क्षेत्र';
  }

  @override
  String get bilateralComparison => 'द्विपक्षीय तुलना';

  @override
  String get parameter => 'पैरामीटर';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'P/I अनुपात';

  @override
  String get ellipseness => 'दीर्घवृत्तता';

  @override
  String get circularity => 'वृत्ताकारिता';

  @override
  String get decentralization => 'विकेंद्रीकरण';

  @override
  String get anwRatio => 'अनुपात';

  @override
  String get normal => 'सामान्य';

  @override
  String get elliptical => 'दीर्घवृत्ताकार';

  @override
  String get circular => 'वृत्ताकार';

  @override
  String get irregular => 'अनियमित';

  @override
  String get centered => 'केंद्रित';

  @override
  String get offset => 'विस्थापन';

  @override
  String get miosis => 'मायोसिस';

  @override
  String get constricted => 'संकुचित';

  @override
  String get dilated => 'फैला हुआ';

  @override
  String get mydriasis => 'मायड्रियासिस';

  @override
  String get inner => 'आंतरिक';

  @override
  String get outer => 'बाहरी';

  @override
  String get high => 'उच्च';

  @override
  String get moderate => 'मध्यम';

  @override
  String get savePdf => 'PDF सहेजें';

  @override
  String get sharePdf => 'PDF शेयर करें';

  @override
  String get retakePhotos => 'फोटो पुनः लें';

  @override
  String scansLeftBanner(int count) {
    return '$count स्कैन शेष';
  }

  @override
  String get upgrade => 'अपग्रेड करें';

  @override
  String get unlockUnlimited => 'असीमित अनलॉक करें';

  @override
  String get usedAllFreeScans => 'आपने सभी मुफ्त स्कैन उपयोग कर लिए हैं।';

  @override
  String get unlimitedScans => 'असीमित स्कैन';

  @override
  String get pdfReports => 'PDF रिपोर्ट';

  @override
  String get scanHistoryFeature => 'स्कैन इतिहास';

  @override
  String get bilateralAnalysis => 'द्विपक्षीय विश्लेषण';

  @override
  String get monthly => 'मासिक';

  @override
  String get perMonth => '/माह';

  @override
  String get annual => 'वार्षिक';

  @override
  String get perYear => '/वर्ष';

  @override
  String get tenCredits => '10 क्रेडिट';

  @override
  String get oneTime => 'एकमुश्त';

  @override
  String get best => 'सर्वोत्तम';

  @override
  String get purchaseCancelled => 'खरीद रद्द की गई';

  @override
  String purchaseFailed(String error) {
    return 'खरीद विफल: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT सहेजा गया: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON सहेजा गया: $path';
  }

  @override
  String get pdfSaved => 'PDF सहेजी गई!';

  @override
  String pdfFailed(String error) {
    return 'PDF विफल: $error';
  }

  @override
  String get open => 'खोलें';

  @override
  String failed(String error) {
    return 'विफल: $error';
  }

  @override
  String get staticScans => 'स्थैतिक';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => 'नाम या शिकायतों से खोजें...';

  @override
  String get searchPlrRecords => 'PLR रिकॉर्ड खोजें...';

  @override
  String get noScansYet => 'अभी तक कोई स्कैन नहीं';

  @override
  String get completedScansAppearHere => 'पूर्ण स्कैन यहाँ दिखाई देंगे';

  @override
  String get deleteScan => 'स्कैन हटाएं?';

  @override
  String deleteScanConfirm(String name, String date) {
    return '$name का $date का स्कैन हटाएं?';
  }

  @override
  String get scanDeleted => 'स्कैन हटाया गया';

  @override
  String get originalImagesNotFound => 'मूल आँख की छवियाँ नहीं मिलीं।';

  @override
  String get viewResults => 'परिणाम देखें';

  @override
  String get avgPlr => 'औसत PLR';

  @override
  String get years => 'वर्ष';

  @override
  String get anisocoria => 'एनीसोकोरिया';

  @override
  String get none => 'कोई नहीं';

  @override
  String get mild => 'हल्का';

  @override
  String get severe => 'गंभीर';

  @override
  String zoneLabel(String zone) {
    return 'क्षेत्र: $zone';
  }

  @override
  String associatedWith(String organ) {
    return '$organ से संबद्ध';
  }

  @override
  String get significant => 'महत्वपूर्ण';

  @override
  String get fair => 'उचित';

  @override
  String get low => 'निम्न';

  @override
  String get good => 'अच्छा';

  @override
  String get zones => 'क्षेत्र';

  @override
  String get significanceWithinLimits => 'स्वीकार्य सीमाओं के भीतर';

  @override
  String get significanceMild => 'हल्का';

  @override
  String get significanceModerate => 'मध्यम';

  @override
  String get significanceSignificant => 'महत्वपूर्ण';

  @override
  String get formTypeCircle => 'वृत्त (सामान्य)';

  @override
  String get formTypeOval => 'अंडाकार';

  @override
  String get formTypeOvalVertical => 'ऊर्ध्वाधर अंडाकार';

  @override
  String get formTypeOvalHorizontal => 'क्षैतिज अंडाकार';

  @override
  String get formTypeOvalDiagonal => 'विकर्ण अंडाकार';

  @override
  String get formTypeLeftObliqueEllipse => 'बाईं तिरछी दीर्घवृत्त';

  @override
  String get formTypeUnilateralEllipse => 'एकपक्षीय दीर्घवृत्त';

  @override
  String get formTypeVentralDivergingEllipse => 'उदर-विचलित दीर्घवृत्त';

  @override
  String get formTypeFrontalDivergingEllipse => 'अग्र-विचलित दीर्घवृत्त';

  @override
  String get formTypeEllipse => 'दीर्घवृत्त';

  @override
  String get formTypeChord => 'जीवा';

  @override
  String get formTypeIrregular => 'अनियमित';

  @override
  String get pupilFormCircleDesc =>
      'सामान्य वृत्ताकार पुतली रूप। कोई पैटर्न विविधता नहीं पाई गई।';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'क्षैतिज अंडाकार पैटर्न। ऐतिहासिक शोध ने इसे श्वसन और ग्रंथि संबंधी क्षेत्रों को प्रभावित करने वाले स्वायत्त तंत्रिका तंत्र के पैटर्न से जोड़ा है।';

  @override
  String get pupilFormOvalVerticalDesc =>
      'ऊर्ध्वाधर अंडाकार पैटर्न। ऐतिहासिक शोध ने इस पैटर्न को स्वायत्त प्रतिवर्त अध्ययनों में मस्तिष्क परिसंचरण क्षेत्रों से जोड़ा है।';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'विकर्ण अंडाकार पैटर्न। शोध साहित्य ने इसे स्वायत्त अध्ययनों में मूत्रजनन क्षेत्र प्रतिवर्त से जोड़ा है।';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'बाईं तिरछी दीर्घवृत्त पैटर्न। ऐतिहासिक अवलोकनों ने इसे मूत्रजनन और निचले अंग के स्वायत्त क्षेत्रों से जोड़ा है।';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'एकपक्षीय दीर्घवृत्त पैटर्न। शोध ने श्वसन और ब्रोन्कियल स्वायत्त क्षेत्रों से संबद्धता दर्शाई है।';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'उदर-विचलित दीर्घवृत्त। ऐतिहासिक अध्ययनों ने इसे निचले शरीर के स्वायत्त क्षेत्रों और मोटर फंक्शन पैटर्न से जोड़ा है।';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'अग्र-विचलित दीर्घवृत्त। शोध साहित्य ने इस पैटर्न को मस्तिष्क और ऊपरी स्वायत्त क्षेत्रों से जोड़ा है।';

  @override
  String get pupilFormOvalDesc =>
      'हल्का अंडाकार विरूपण पैटर्न। शोध अवलोकनों में प्रगति की निगरानी करें।';

  @override
  String get pupilFormEllipseDesc =>
      'ऐतिहासिक अध्ययनों में स्वायत्त तंत्रिका तंत्र विविधताओं को दर्शाने वाला दीर्घवृत्ताकार पुतली पैटर्न।';

  @override
  String get pupilFormChordDesc =>
      'शोध साहित्य में स्थानीयकृत स्वायत्त प्रभावों को दर्शाने वाला जीवा-जैसा विरूपण पैटर्न।';

  @override
  String get pupilFormIrregularDesc =>
      'ऐतिहासिक अवलोकनों के आधार पर कई स्वायत्त पैटर्न प्रभावों को सुझाने वाला अनियमित रूप।';

  @override
  String get patternCentered => 'केंद्रित (सामान्य)';

  @override
  String get patternFrontal => 'अग्र विकेंद्रीकरण';

  @override
  String get patternBasal => 'आधारीय विकेंद्रीकरण';

  @override
  String get patternNasal => 'नासिका विकेंद्रीकरण';

  @override
  String get patternTemporal => 'कनपटी विकेंद्रीकरण';

  @override
  String get patternMiddleNasal => 'मध्य-नासिका विकेंद्रीकरण';

  @override
  String get patternMiddleTemporal => 'मध्य-कनपटी विकेंद्रीकरण';

  @override
  String get patternUpperNasal => 'ऊपरी-नासिका विकेंद्रीकरण';

  @override
  String get patternUpperTemporal => 'ऊपरी-कनपटी विकेंद्रीकरण';

  @override
  String get patternLowerNasal => 'निचली-नासिका विकेंद्रीकरण';

  @override
  String get patternLowerTemporal => 'निचली-कनपटी विकेंद्रीकरण';

  @override
  String get patternUpwards => 'विकेंद्रण - ऊपर की ओर';

  @override
  String get patternDownwards => 'विकेंद्रण - नीचे की ओर';

  @override
  String get patternUpwardsInwards => 'विकेंद्रण - ऊपर-अंदर की ओर';

  @override
  String get patternUpwardsOutwards => 'विकेंद्रण - ऊपर-बाहर की ओर';

  @override
  String get decentrationCenteredDesc =>
      'शारीरिक सीमाओं के भीतर सामान्य पुतली स्थिति।';

  @override
  String get decentrationNasalRightDesc =>
      'नासिका पैटर्न (दाईं)। ऐतिहासिक शोध ने इस क्षेत्र को फुफ्फुसीय स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get decentrationNasalLeftDesc =>
      'नासिका पैटर्न (बाईं)। शोध साहित्य ने इस क्षेत्र को हृदय स्वायत्त कार्य पैटर्न से जोड़ा है।';

  @override
  String get decentrationTemporalDesc =>
      'कनपटी पैटर्न। ऐतिहासिक अवलोकनों ने इस क्षेत्र को वृक्क और प्रजनन स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get decentrationFrontalRightDesc =>
      'अग्र पैटर्न (दाईं)। शोध ने इस क्षेत्र को संज्ञानात्मक और मस्तिष्क कार्य पैटर्न से जोड़ा है।';

  @override
  String get decentrationFrontalLeftDesc =>
      'अग्र पैटर्न (बाईं)। ऐतिहासिक अध्ययनों ने इस क्षेत्र को मस्तिष्क स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get decentrationBasalRightDesc =>
      'आधारीय पैटर्न (दाईं)। शोध ने इंट्राक्रानियल दबाव प्रतिवर्त से संबद्धता दर्शाई है।';

  @override
  String get decentrationBasalLeftDesc =>
      'आधारीय पैटर्न (बाईं)। ऐतिहासिक अवलोकनों ने इसे मस्तिष्क सूजन क्षेत्र पैटर्न से जोड़ा है।';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'ऊपरी-नासिका पैटर्न (दाईं)। शोध ने इस क्षेत्र को यकृत-पित्त स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'ऊपरी-नासिका पैटर्न (बाईं)। ऐतिहासिक अध्ययनों ने इसे प्लीहा और डायाफ्राम क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'ऊपरी-कनपटी पैटर्न। शोध ने वृक्क और प्रजनन स्वायत्त क्षेत्रों से संबद्धता दर्शाई है।';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'मध्य-नासिका पैटर्न (दाईं)। ऐतिहासिक अवलोकनों ने इसे ऑक्सीजन उपयोग और हृदय क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'मध्य-नासिका पैटर्न (बाईं)। शोध ने इसे तंत्रिका संबंधी और हृदय स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'मध्य-कनपटी पैटर्न (दाईं)। शोध ने इसे हृदय स्वायत्त नियमन क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'मध्य-कनपटी पैटर्न (बाईं)। ऐतिहासिक अध्ययनों ने इसे फुफ्फुसीय और हृदय क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationUpperNasalRightDesc =>
      'ऊपरी-नासिका पैटर्न (दाईं)। शोध ने संज्ञानात्मक क्षेत्रों और ग्रीवा रीढ़ प्रतिवर्त से संबद्धता दर्शाई है।';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'ऊपरी-नासिका पैटर्न (बाईं)। ऐतिहासिक अवलोकनों ने इसे संज्ञानात्मक पैटर्न और ग्रीवा क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'ऊपरी-कनपटी पैटर्न (दाईं)। शोध ने इस क्षेत्र को कपाल तंत्रिका और श्रवण प्रतिवर्त से जोड़ा है।';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'ऊपरी-कनपटी पैटर्न (बाईं)। ऐतिहासिक अध्ययनों ने इसे तंत्रिकावानस्पतिक और वाक् क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationLowerNasalDesc =>
      'निचली-नासिका पैटर्न। शोध ने मूत्रजनन और काठ-त्रिकास्थि स्वायत्त क्षेत्रों से संबद्धता दर्शाई है।';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'निचली-कनपटी पैटर्न (दाईं)। ऐतिहासिक अवलोकनों ने इसे चयापचय और यकृत क्षेत्रों से जोड़ा है।';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'निचली-कनपटी पैटर्न (बाईं)। शोध ने इसे हृदय और प्लीहा स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get flatteningUpperCentralRightDesc =>
      'ऊपरी-केंद्रीय क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक शोध ने इसे मनोदशा नियमन और ऊर्जा स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'ऊपरी-कनपटी क्षेत्र से संबद्ध पैटर्न। शोध ने कपाल तंत्रिका और श्रवण स्वायत्त प्रतिवर्त से संबद्धता दर्शाई है।';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'मध्य-कनपटी क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक अवलोकनों ने इसे श्वसन और हृदय स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'निचले-कनपटी क्षेत्र से संबद्ध पैटर्न। शोध साहित्य ने इसे यकृत और चयापचय स्वायत्त क्षेत्रों से जोड़ा है।';

  @override
  String get flatteningLowerBasalRightDesc =>
      'निचले-आधारीय क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक अध्ययनों ने इसे वृक्क और निचले अंग स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get flatteningLowerNasalRightDesc =>
      'निचले-नासिका क्षेत्र से संबद्ध पैटर्न। शोध ने मूत्रजनन और श्रोणि स्वायत्त क्षेत्रों से संबद्धता दर्शाई है।';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'मध्य-नासिका क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक अवलोकनों ने इसे ऑक्सीजन उपयोग और श्वसन स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get flatteningUpperNasalRightDesc =>
      'ऊपरी-नासिका क्षेत्र से संबद्ध पैटर्न। शोध साहित्य ने इसे संज्ञानात्मक और ग्रीवा स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get flatteningDefaultRightDesc =>
      'इस क्षेत्र में ऐतिहासिक शोध के आधार पर स्वायत्त तंत्रिका तंत्र पैटर्न विविधता पाई गई।';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'ऊपरी-केंद्रीय क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक शोध ने इसे मनोदशा नियमन और तंत्रिका संबंधी स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'ऊपरी-कनपटी क्षेत्र से संबद्ध पैटर्न। शोध ने तंत्रिकावानस्पतिक और वाक् स्वायत्त क्षेत्रों से संबद्धता दर्शाई है।';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'मध्य-कनपटी क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक अवलोकनों ने इसे फुफ्फुसीय और हृदय स्वायत्त प्रतिवर्त से जोड़ा है।';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'निचले-कनपटी क्षेत्र से संबद्ध पैटर्न। शोध साहित्य ने इसे हृदय और प्लीहा स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'निचले-आधारीय क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक अध्ययनों ने इसे वृक्क और उत्सर्जन स्वायत्त क्षेत्रों से जोड़ा है।';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'निचले-नासिका क्षेत्र से संबद्ध पैटर्न। शोध ने मूत्रजनन और काठ-त्रिकास्थि स्वायत्त प्रतिवर्त से संबद्धता दर्शाई है।';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'मध्य-नासिका क्षेत्र से संबद्ध पैटर्न। ऐतिहासिक अवलोकनों ने इसे हृदय और श्वसन स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'ऊपरी-नासिका क्षेत्र से संबद्ध पैटर्न। शोध साहित्य ने इसे संज्ञानात्मक और ग्रीवा स्वायत्त क्षेत्रों से जोड़ा है।';

  @override
  String get flatteningDefaultLeftDesc =>
      'इस क्षेत्र में ऐतिहासिक शोध के आधार पर स्वायत्त तंत्रिका तंत्र पैटर्न विविधता पाई गई।';

  @override
  String get protrusionUpperCentralRightDesc =>
      'ऊपरी-केंद्रीय क्षेत्र उभार पैटर्न। शोध ने इसे मस्तिष्क क्षेत्रों को प्रभावित करने वाले सहानुभूति अतिसक्रियता पैटर्न से जोड़ा है।';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'ऊपरी-कनपटी क्षेत्र उभार पैटर्न। ऐतिहासिक अवलोकनों ने इसे कपाल तंत्रिका और श्रवण तंत्र अतिसक्रियता पैटर्न से जोड़ा है।';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'मध्य-कनपटी क्षेत्र उभार पैटर्न। शोध ने हृदय और श्वसन सहानुभूति पैटर्न से संबद्धता दर्शाई है।';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'निचले-कनपटी क्षेत्र उभार पैटर्न। ऐतिहासिक अध्ययनों ने इसे यकृत-पित्त और चयापचय सहानुभूति क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionLowerBasalRightDesc =>
      'निचले-आधारीय क्षेत्र उभार पैटर्न। शोध ने इसे वृक्क और श्रोणि सहानुभूति अतिसक्रियता पैटर्न से जोड़ा है।';

  @override
  String get protrusionLowerNasalRightDesc =>
      'निचले-नासिका क्षेत्र उभार पैटर्न। ऐतिहासिक अवलोकनों ने इसे मूत्रजनन सहानुभूति सक्रियण क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'मध्य-नासिका क्षेत्र उभार पैटर्न। शोध ने आमाशय और अग्नाशय सहानुभूति पैटर्न से संबद्धता दर्शाई है।';

  @override
  String get protrusionUpperNasalRightDesc =>
      'ऊपरी-नासिका क्षेत्र उभार पैटर्न। ऐतिहासिक अध्ययनों ने इसे संज्ञानात्मक और दृश्य सहानुभूति अतिसक्रियता क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionDefaultRightDesc =>
      'शोध अवलोकनों के आधार पर इस क्षेत्र में सहानुभूति तंत्रिका तंत्र अतिसक्रियता पैटर्न पाया गया।';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'ऊपरी-केंद्रीय क्षेत्र उभार पैटर्न। शोध ने इसे साइकोमोटर और मस्तिष्क सहानुभूति पैटर्न से जोड़ा है।';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'ऊपरी-कनपटी क्षेत्र उभार पैटर्न। ऐतिहासिक अवलोकनों ने इसे तंत्रिकावानस्पतिक सहानुभूति अतिसक्रियता क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'मध्य-कनपटी क्षेत्र उभार पैटर्न। शोध ने फुफ्फुसीय और हृदय सहानुभूति पैटर्न से संबद्धता दर्शाई है।';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'निचले-कनपटी क्षेत्र उभार पैटर्न। ऐतिहासिक अध्ययनों ने इसे प्लीहा और हृदय सहानुभूति सक्रियण क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'निचले-आधारीय क्षेत्र उभार पैटर्न। शोध ने इसे श्रोणि और वृक्क सहानुभूति अतिसक्रियता पैटर्न से जोड़ा है।';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'निचले-नासिका क्षेत्र उभार पैटर्न। ऐतिहासिक अवलोकनों ने इसे काठ-त्रिकास्थि सहानुभूति सक्रियण क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'मध्य-नासिका क्षेत्र उभार पैटर्न। शोध ने चिंता-हृदय सहानुभूति पैटर्न से संबद्धता दर्शाई है।';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'ऊपरी-नासिका क्षेत्र उभार पैटर्न। ऐतिहासिक अध्ययनों ने इसे संज्ञानात्मक और दृश्य सहानुभूति अतिसक्रियता क्षेत्रों से जोड़ा है।';

  @override
  String get protrusionDefaultLeftDesc =>
      'शोध अवलोकनों के आधार पर इस क्षेत्र में सहानुभूति तंत्रिका तंत्र अतिसक्रियता पैटर्न पाया गया।';

  @override
  String get anisocoriaNone =>
      'पुतली का आकार सामान्य सीमाओं के भीतर है। कोई महत्वपूर्ण एनीसोकोरिया नहीं पाया गया।';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'एनीसोकोरिया पाया गया: $difference% ($direction)। $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'सामान्य सीमाओं के भीतर।';

  @override
  String get anisocoriaSeverityMild =>
      'हल्का अंतर देखा गया। शारीरिक हो सकता है।';

  @override
  String get anisocoriaSeverityModerate =>
      'मध्यम असमानता। शोध अवलोकन नोट किया गया।';

  @override
  String get anisocoriaSeveritySevere =>
      'महत्वपूर्ण असमानता। शोध अवलोकन ध्वजांकित किया गया।';

  @override
  String get largerPupilEqual => 'समान';

  @override
  String get largerPupilOS => 'OS (बाईं)';

  @override
  String get largerPupilOD => 'OD (दाईं)';

  @override
  String get decentrationWithinLimits => 'सामान्य सीमाओं के भीतर।';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName। विस्थापन: $offset%';
  }

  @override
  String get zoneUpperCentral => 'ऊपरी-केंद्रीय';

  @override
  String get zoneUpperNasal => 'ऊपरी-नासिका';

  @override
  String get zoneMiddleNasal => 'मध्य-नासिका';

  @override
  String get zoneLowerNasal => 'निचली-नासिका';

  @override
  String get zoneLowerBasal => 'निचला-आधारीय';

  @override
  String get zoneLowerTemporal => 'निचली-कनपटी';

  @override
  String get zoneMiddleTemporal => 'मध्य-कनपटी';

  @override
  String get zoneUpperTemporal => 'ऊपरी-कनपटी';

  @override
  String get zoneFrontal => 'अग्र';

  @override
  String get zoneBasal => 'आधारीय';

  @override
  String get zoneUnknown => 'अज्ञात';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '$zone चपटापन ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '$zone उभार ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB इरिस्कोप मोड';

  @override
  String get iriscopeExternal => 'इरिस्कोप / बाहरी';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'जुड़े हुए USB कैमरा या इरिस्कोप का उपयोग करें';

  @override
  String get detectedCameras => 'पता चले कैमरे';

  @override
  String get externalCamera => 'बाहरी कैमरा';

  @override
  String cameraIndex(int index) {
    return 'कैमरा $index';
  }

  @override
  String get noExternalCameraDetected =>
      'कोई बाहरी कैमरा नहीं पाया गया।\\nसक्षम करने के लिए USB इरिस्कोप कनेक्ट करें।';

  @override
  String get refresh => 'ताज़ा करें';

  @override
  String get selectCameraSource => 'कैमरा स्रोत चुनें';

  @override
  String camerasDetected(int count) {
    return '$count कैमरे पाए गए';
  }

  @override
  String camerasAvailable(int count) {
    return '$count कैमरे उपलब्ध';
  }

  @override
  String externalCameraIndex(int index) {
    return 'बाहरी कैमरा $index';
  }

  @override
  String get qualityGatedRear =>
      'गुणवत्ता-नियंत्रित स्वतः-कैप्चर (पिछला कैमरा)';

  @override
  String get qualityGatedFront =>
      'गुणवत्ता-नियंत्रित स्वतः-कैप्चर (फ्रंट कैमरा)';

  @override
  String get usbCameraInfo => 'USB कैमरा जानकारी';

  @override
  String get connected => 'जुड़ा हुआ';

  @override
  String get waiting => 'प्रतीक्षा कर रहा है...';

  @override
  String get disconnected => 'डिस्कनेक्ट किया गया';

  @override
  String get waitingForUsbCamera => 'USB कैमरे की प्रतीक्षा हो रही है';

  @override
  String get connectIriscopePrompt =>
      'अपना इरिस्कोप USB OTG अडेप्टर से कनेक्ट करें।\\nसंकेत मिलने पर अनुमति दें।';

  @override
  String get usbCameraIssue => 'USB कैमरा समस्या';

  @override
  String get pleaseConnectIriscope =>
      'कृपया अपना इरिस्कोप या USB कैमरा कनेक्ट करें।';

  @override
  String get retryConnection => 'कनेक्शन पुनः प्रयास करें';

  @override
  String get troubleshootingTips => 'समस्या निवारण सुझाव';

  @override
  String get tipUsbOtgAdapter =>
      'सुनिश्चित करें कि USB OTG अडेप्टर सही तरह से जुड़ा है';

  @override
  String get tipUsbHostMode =>
      'जाँचें कि डिवाइस USB होस्ट मोड का समर्थन करता है';

  @override
  String get tipReconnectCamera => 'कैमरा डिस्कनेक्ट करके पुनः कनेक्ट करें';

  @override
  String get tipGrantPermissions => 'संकेत मिलने पर USB अनुमतियाँ दें';

  @override
  String get tipUnlockDevice => 'कुछ डिवाइसों को अनलॉक करना पड़ सकता है';

  @override
  String get back => 'वापस';

  @override
  String get switchEye => 'आँख बदलें';

  @override
  String get state => 'स्थिति';

  @override
  String get status => 'स्टेटस';

  @override
  String get usingFlutterUvcPlugin =>
      'flutter_uvc_camera प्लगइन का उपयोग हो रहा है\\USB Video Class डिवाइस समर्थन के लिए प्लगइन।';

  @override
  String get initialized => 'प्रारंभ किया गया';

  @override
  String get notReady => 'तैयार नहीं';

  @override
  String get captureDistanceMatch => 'कैप्चर दूरी मिलान';

  @override
  String get irisSize => 'आइरिस आकार';

  @override
  String get distanceMatched => 'दूरी मिली';

  @override
  String get distanceMismatch => 'दूरी बेमेल';

  @override
  String get excellentMatch => 'उत्कृष्ट मिलान';

  @override
  String get goodMatch => 'अच्छा मिलान';

  @override
  String get acceptableMatch => 'स्वीकार्य मिलान';

  @override
  String get considerRetaking => 'दूरी बेमेल - पुनः लेने पर विचार करें';

  @override
  String get qualityReady => 'तैयार! स्थिर रहें...';

  @override
  String get qualityTooBlurry => 'कैमरा स्थिर रखें';

  @override
  String get qualityTooDark => 'अधिक प्रकाश चाहिए';

  @override
  String get qualityTooBright => 'बहुत तेज रोशनी - कम करें';

  @override
  String get qualityNoContrast => 'रोशनी का कोण बदलें';

  @override
  String get qualityNoPupil => 'पुतली को फ्रेम में केंद्रित करें';

  @override
  String get qualityNotCentered => 'आँख को केंद्र में लाएं';

  @override
  String get qualityNotAnEye => 'कोई आँख नहीं पाई गई';

  @override
  String get qualityProcessing => 'प्रोसेस हो रहा है...';

  @override
  String get distanceMatchedCheck => '✓ दूरी मिली';

  @override
  String get distanceGoodMatchCheck => '✓ अच्छा मिलान';

  @override
  String get distanceSlightlyBack => 'थोड़ा पीछे ↔';

  @override
  String get distanceSlightlyCloser => 'थोड़ा करीब ↔';

  @override
  String get distanceAlmostThere => 'लगभग सही...';

  @override
  String get distanceMoveBack => 'पीछे जाएं ←←';

  @override
  String get distanceMoveCloser => 'करीब आएं →→';

  @override
  String get distanceTooClose => 'बहुत करीब! पीछे जाएं';

  @override
  String get distanceTooFar => 'बहुत दूर! करीब आएं';

  @override
  String get distanceStabilizing => 'स्थिर हो रहा है...';

  @override
  String distanceLabel(int percent) {
    return 'दूरी: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'फ्रंट कैमरा';

  @override
  String get rearCameraLabel => 'बैक कैमरा';

  @override
  String get startingCamera => 'कैमरा शुरू हो रहा है...';

  @override
  String get eyeNotDetected => 'आंख नहीं मिली';

  @override
  String get tryAgain => 'फिर कोशिश करें';

  @override
  String get indicatorEye => 'आंख';

  @override
  String get indicatorSharp => 'तेज़';

  @override
  String get indicatorLight => 'रोशनी';

  @override
  String get indicatorFocus => 'फोकस';

  @override
  String get indicatorPupil => 'पुतली';

  @override
  String get indicatorIris => 'Iris';

  @override
  String get indicatorMatch => 'मिलान';

  @override
  String get checkImageShape => 'छवि आकार';

  @override
  String get checkCircularIris => 'गोलाकार Iris';

  @override
  String get checkDarkPupil => 'गहरी पुतली';

  @override
  String get checkIrisTexture => 'Iris बनावट';

  @override
  String get checkPupilIrisStructure => 'पुतली-Iris संरचना';

  @override
  String get checkNaturalColors => 'प्राकृतिक रंग';

  @override
  String get checkEdgePattern => 'किनारे का पैटर्न';

  @override
  String get errorImageShapeIncorrect =>
      'छवि का आकार गलत है - सुनिश्चित करें कि आंख फ्रेम भरे';

  @override
  String get errorNoEyeDetected =>
      'कोई आंख नहीं मिली - Iris को फ्रेम के बीच में रखें';

  @override
  String get errorNoPupilDetected =>
      'पुतली नहीं मिली - अच्छी रोशनी सुनिश्चित करें';

  @override
  String get errorNoIrisTexture => 'Iris बनावट नहीं मिली - आंख के करीब जाएं';

  @override
  String get errorUnusualColors =>
      'असामान्य रंग पाए गए - स्क्रीन/परावर्तन से बचें';

  @override
  String get errorTooManyEdges => 'बहुत अधिक सीधे किनारे - यह आंख नहीं हो सकती';

  @override
  String get errorNotValidEye =>
      'मान्य आंख की छवि नहीं है - कृपया फिर कोशिश करें';

  @override
  String get holdStillCapturing => 'स्थिर रहें - कैप्चर हो रहा है...';

  @override
  String get adjustDistanceFirst => 'पहले दूरी समायोजित करें';

  @override
  String get stabilizingReading => 'स्थिर हो रहा है...';

  @override
  String get autoCaptureWhenReady => 'तैयार होने पर स्वतः कैप्चर';

  @override
  String get tapOrWaitAutoCapture =>
      'टैप करें या स्वतः कैप्चर की प्रतीक्षा करें';

  @override
  String get validatingImage => 'जांच हो रही है...';

  @override
  String get capturingStatus => 'कैप्चर हो रहा है...';

  @override
  String get adjustPositionStatus => 'स्थिति समायोजित करें';

  @override
  String get validationTip =>
      'सुझाव: अच्छी रोशनी सुनिश्चित करें, कैमरा आंख से 10-15 सेमी दूर रखें, परावर्तन से बचें';

  @override
  String get validationChecksTitle => 'जांच सूची:';

  @override
  String confidenceLabel(int percent) {
    return 'विश्वास: $percent%';
  }

  @override
  String get incompleteData => 'अधूरा डेटा';

  @override
  String get irisDiameterLabel => 'iris व्यास';

  @override
  String get plrResponseCurve => 'PLR प्रतिक्रिया वक्र';

  @override
  String get plrLatency => 'विलंब';

  @override
  String get plrVelocity => 'गति';

  @override
  String get plrRecoveryTime => 'ठीक होने का समय';

  @override
  String get plrRecoveryRatio => 'ठीक होने का %';

  @override
  String get plrEnhancedMetrics => 'उन्नत PLR माप';

  @override
  String get plrNormalLatency => 'सामान्य: 200-500ms';

  @override
  String get plrNormalConstriction => 'सामान्य: 10-30%';

  @override
  String get plrNormalVelocity => 'सामान्य: 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'सामान्य PLR संदर्भ मान';

  @override
  String get plrSubjectInfo => 'विषय की जानकारी';

  @override
  String get plrTestType => 'पुतली प्रकाश प्रतिवर्त';

  @override
  String get plrAnalysisSummary => 'विश्लेषण सारांश';

  @override
  String get plrTotalFrames => 'कुल विश्लेषित फ्रेम';

  @override
  String get plrSuccessRate => 'सफलता दर';

  @override
  String get plrMaxConstriction => 'अधिकतम संकुचन';

  @override
  String get plrResponseCurveLabels => 'PLR प्रतिक्रिया वक्र';

  @override
  String get anwTitle => 'स्वायत्त तंत्रिका पुष्पांजलि (ANW)';

  @override
  String get anwAbnormal => 'असामान्य';

  @override
  String get anwDiameter => 'व्यास';

  @override
  String get anwPerimeter => 'परिधि';

  @override
  String get anwAsymmetry => 'असमानता';

  @override
  String get anwElevated => 'उभरी हुई';

  @override
  String get anwFormType => 'आकार प्रकार';

  @override
  String get anwRegular => 'नियमित';

  @override
  String get anwDrawnIn => 'अंदर खिंची';

  @override
  String get anwIndented => 'दंतुरित';

  @override
  String get anwLacerated => 'विदीर्ण';

  @override
  String get anwSpastic => 'ऐंठनयुक्त';

  @override
  String get anwAtonic => 'शिथिल';

  @override
  String get anwTonicState => 'ऐतिहासिक स्वर पैटर्न';

  @override
  String get anwParasympathotonic => 'परानुकंपी स्वर पैटर्न';

  @override
  String get anwSympathotonicState => 'अनुकंपी स्वर पैटर्न';

  @override
  String get anwShiftDetected => 'ऐतिहासिक विस्थापन पैटर्न';

  @override
  String get anwConstrictionDetected => 'संकुचन पाया गया';

  @override
  String get anwFindings => 'निष्कर्ष';

  @override
  String get anwRatioComparison => 'ANW अनुपात';

  @override
  String get bilateralANWComparison => 'द्विपक्षीय ANW तुलना';

  @override
  String get anwSymmetryNormal => 'ANW समरूपता सामान्य सीमा के भीतर है।';

  @override
  String get anwAsymmetryDetected => 'आंखों के बीच ANW असमानता पाई गई।';

  @override
  String get functionalFrustration =>
      'सहानुभूति और परानुकंपी तंत्रिका तंत्र के बीच कार्यात्मक असंतुलन।';

  @override
  String get anwParasympathotonicDesc =>
      'ऐतिहासिक अवलोकनों के अनुसार यह बढ़ी हुई लिमिनल संवेदनशीलता से जुड़ा है। प्रतिवर्त क्रिया त्वरित। GI स्रावी/निष्कासन कार्य बढ़े हुए।';

  @override
  String get anwSympathotonicDesc =>
      'ऐतिहासिक अवलोकनों के अनुसार यह घटी हुई लिमिनल संवेदनशीलता से जुड़ा है। प्रतिवर्त क्रिया धीमी। GI स्रावी/निष्कासन कार्य कम।';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे बाएं वेंट्रिकुलर अधिभार पैटर्न और हृदय तनाव से जोड़ा है।';

  @override
  String get anwFrontalConstricted => 'पुतली पट्टी का ललाट क्षेत्र संकुचित है।';

  @override
  String get anwBasalConstricted => 'पुतली पट्टी का आधार क्षेत्र संकुचित है।';

  @override
  String get anwFrontalBasalConstricted =>
      'पुतली पट्टी के ललाट और आधार क्षेत्र संकुचित हैं।';

  @override
  String get helpTitle => 'सहायता और उपयोगकर्ता मार्गदर्शिका';

  @override
  String get helpTabQuickStart => 'त्वरित शुरुआत';

  @override
  String get helpTabCnriAnalysis => 'CNRI विश्लेषण';

  @override
  String get helpTabShortcuts => 'शॉर्टकट';

  @override
  String get helpTabTroubleshooting => 'समस्या निवारण';

  @override
  String get helpOnlineDocs => 'ऑनलाइन दस्तावेज़';

  @override
  String get helpContactSupport => 'सहायता से संपर्क करें';

  @override
  String get helpGettingStarted => 'शुरुआत कैसे करें';

  @override
  String get helpStep1Title => 'अपना Iriscope कनेक्ट करें';

  @override
  String get helpStep1Desc =>
      'अपना Dino-Lite या संगत USB iriscope कनेक्ट करें।';

  @override
  String get helpStep2Title => 'रोगी की जानकारी दर्ज करें';

  @override
  String get helpStep2Desc => 'रोगी का नाम, आयु, लिंग और मुख्य शिकायतें भरें।';

  @override
  String get helpStep3Title => 'दाहिनी आंख (OD) कैप्चर करें';

  @override
  String get helpStep3Desc =>
      'Iriscope को स्थिति दें और दाहिनी आंख की छवि कैप्चर करें।';

  @override
  String get helpStep4Title => 'बाईं आंख (OS) कैप्चर करें';

  @override
  String get helpStep4Desc => 'समान रोशनी के साथ बाईं आंख के लिए दोहराएं।';

  @override
  String get helpStep5Title => 'विश्लेषण देखें';

  @override
  String get helpStep5Desc =>
      'ऐप P/I अनुपात, पुतली रूप और ANW विशेषताओं का विश्लेषण करता है।';

  @override
  String get helpStep6Title => 'रिपोर्ट निर्यात करें';

  @override
  String get helpStep6Desc => 'PDF, TXT, या JSON प्रारूप में सहेजें।';

  @override
  String get helpTipBestResults =>
      'सर्वोत्तम परिणामों के लिए: समान रोशनी का उपयोग करें और 2-3 सेमी iriscope दूरी बनाए रखें।';

  @override
  String get helpCnriProtocolFeatures => 'CNRI प्रोटोकॉल विशेषताएं';

  @override
  String get helpFeaturePiRatioTitle => 'पुतली/Iris अनुपात (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'सामान्य: 20-30%। इससे बाहर के मान स्वायत्त असंतुलन का संकेत दे सकते हैं।';

  @override
  String get helpFeaturePupilFormTitle => 'पुतली रूप विश्लेषण';

  @override
  String get helpFeaturePupilFormDesc =>
      'अंडाकार पैटर्न, विकेंद्रीकरण दिशा और विकेंद्रता का पता लगाता है।';

  @override
  String get helpFeatureAnwTitle => 'ANW (Collarette) आकलन';

  @override
  String get helpFeatureAnwDesc =>
      'अनुपात, रूप नियमितता, क्षेत्र विस्थापन और स्वर स्थिति का विश्लेषण करता है।';

  @override
  String get helpFeatureZoneTitle => 'क्षेत्र विश्लेषण';

  @override
  String get helpFeatureZoneDesc =>
      'CNRI अंग क्षेत्रों में चपटेपन/उभारों को मैप करता है।';

  @override
  String get helpFeatureBilateralTitle => 'द्विपक्षीय तुलना';

  @override
  String get helpFeatureBilateralDesc =>
      'असमानता पता लगाने के लिए OD बनाम OS की तुलना करता है।';

  @override
  String get helpFeatureMlTitle => 'ONNX CNN तुलना';

  @override
  String get helpFeatureMlDesc =>
      'ONNX CNN मॉडल तुलना के लिए द्वितीयक माप प्रदान करता है।';

  @override
  String get helpKeyboardShortcuts => 'कीबोर्ड शॉर्टकट';

  @override
  String get helpCameraControls => 'कैमरा नियंत्रण';

  @override
  String get helpShortcutSpace => 'छवि कैप्चर करें';

  @override
  String get helpShortcutCtrlS => 'PDF रिपोर्ट सहेजें';

  @override
  String get helpShortcutCtrlO => 'गैलरी छवि खोलें';

  @override
  String get helpShortcutCtrlH => 'स्कैन इतिहास देखें';

  @override
  String get helpShortcutF11 => 'पूर्ण स्क्रीन टॉगल करें';

  @override
  String get helpShortcutEsc => 'वापस जाएं / रद्द करें';

  @override
  String get helpShortcutScroll => 'ज़ूम इन/आउट';

  @override
  String get helpShortcutDoubleClick => 'ज़ूम रीसेट करें';

  @override
  String get helpCommonIssues => 'सामान्य समस्याएं';

  @override
  String get helpIssueCameraNotDetected => 'कैमरा नहीं मिला';

  @override
  String get helpIssueCameraSolution1 => 'USB कनेक्शन जांचें';

  @override
  String get helpIssueCameraSolution2 => 'भिन्न USB पोर्ट आज़माएं';

  @override
  String get helpIssueCameraSolution3 => 'Dino-Lite ड्राइवर इंस्टॉल करें';

  @override
  String get helpIssueCameraSolution4 => 'एप्लिकेशन पुनः शुरू करें';

  @override
  String get helpIssuePupilDetectionFails => 'पुतली का पता लगाने में विफलता';

  @override
  String get helpIssuePupilSolution1 => 'पर्याप्त रोशनी सुनिश्चित करें';

  @override
  String get helpIssuePupilSolution2 => 'फ्रेम में पुतली केंद्रित करें';

  @override
  String get helpIssuePupilSolution3 => 'Iriscope लेंस साफ करें';

  @override
  String get helpIssuePupilSolution4 => 'फोकस मैन्युअल रूप से समायोजित करें';

  @override
  String get helpIssuePdfExportFails => 'PDF निर्यात विफल';

  @override
  String get helpIssuePdfSolution1 => 'फ़ोल्डर अनुमतियां जांचें';

  @override
  String get helpIssuePdfSolution2 => 'डिस्क स्थान उपलब्धता सुनिश्चित करें';

  @override
  String get helpIssuePdfSolution3 => 'खुली PDF फ़ाइलें बंद करें';

  @override
  String get helpIssuePdfSolution4 => 'पहले TXT निर्यात आज़माएं';

  @override
  String get helpCaptureChecklistTitle => 'कैप्चर जांच सूची';

  @override
  String get helpCaptureChecklist1 =>
      'पुतली को केंद्रित और फ्रेम के अंदर पूरी तरह दृश्यमान रखें।';

  @override
  String get helpCaptureChecklist2 =>
      'समान रोशनी का उपयोग करें और कॉर्निया पर चकाचौंध या परावर्तन कम करें।';

  @override
  String get helpCaptureChecklist3 =>
      'दाहिनी और बाईं आंखों के लिए समान iriscope दूरी बनाए रखें।';

  @override
  String get helpCaptureChecklist4 =>
      'यदि पुतली का किनारा धुंधला दिखे तो फिर से फोकस करें या पुनः लें।';

  @override
  String get helpExportSettingsTitle => 'निर्यात सेटिंग';

  @override
  String get helpExportSettingsDesc =>
      'स्वतः-सहेजें PDF विश्लेषण के बाद रिपोर्ट सहेज सकता है, छवियां शामिल करें PDF में आंख की तस्वीरें दिखाने को नियंत्रित करता है, और ML तुलना दिखाएं रिपोर्ट में ONNX CNN तुलना मान जोड़ता है।';

  @override
  String get helpHybridScoreTitle => 'हाइब्रिड विश्वास और ग्रेड';

  @override
  String get helpHybridScoreDesc =>
      'प्रदर्शित विश्वास और ग्रेड शास्त्रीय ज्यामिति गुणवत्ता को ML सहमति के साथ जोड़ते हैं, इसलिए वे निदान की बजाय माप की विश्वसनीयता दर्शाते हैं।';

  @override
  String get helpAnomalyGuideTitle => 'चपटेपन और उभारों को पढ़ना';

  @override
  String get helpAnomalyGuideDesc =>
      'चपटेपन पुतली सीमा के साथ सापेक्ष अंदर की ओर खिंचाव को और उभार बाहर की ओर खिंचाव को दर्शाते हैं; प्रत्येक कार्ड क्षेत्र, परिमाण और मैप किए गए संबंध को सूचीबद्ध करता है।';

  @override
  String get helpZoneOverlayGuideTitle => 'ज़ोन ओवरले';

  @override
  String get helpZoneOverlayGuideDesc =>
      'ज़ोन ओवरले का उपयोग करके क्षेत्र स्थितियों को दृश्य रूप से जांचें और पुतली और Iris के चारों ओर पाई गई विसंगतियां कहां पड़ती हैं यह सत्यापित करें।';

  @override
  String get helpContactSupportTip =>
      'सहायता के लिए helpdesk@cnri.edu से संपर्क करें।';

  @override
  String get settingsTitle => 'सेटिंग';

  @override
  String get settingsCameraIriscope => 'कैमरा / IRISCOPE';

  @override
  String get settingsPreferredCamera => 'पसंदीदा कैमरा:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB कैमरा';

  @override
  String get settingsCameraAutoDetect => 'स्वतः-पता लगाएं';

  @override
  String get settingsDefaultZoom => 'डिफ़ॉल्ट ज़ूम:';

  @override
  String get settingsAnalysis => 'विश्लेषण';

  @override
  String get settingsShowMlComparison => 'ML तुलना दिखाएं';

  @override
  String get settingsShowZoneOverlay => 'ज़ोन ओवरले दिखाएं';

  @override
  String get settingsExportReports => 'निर्यात और रिपोर्ट';

  @override
  String get settingsAutoSavePdf => 'PDF स्वतः-सहेजें';

  @override
  String get settingsIncludeImages => 'छवियां शामिल करें';

  @override
  String get settingsSaved => 'सेटिंग सहेजी गई';

  @override
  String get aboutResearchEdition => 'शोध संस्करण';

  @override
  String aboutVersion(String version) {
    return 'संस्करण $version';
  }

  @override
  String get aboutLicense => 'लाइसेंस';

  @override
  String get aboutLicensedTo => 'लाइसेंस प्राप्तकर्ता:';

  @override
  String get aboutExpires => 'समाप्ति:';

  @override
  String get aboutManageLicense => 'लाइसेंस प्रबंधित करें';

  @override
  String get aboutBasedOnCnri => 'CNRI प्रोटोकॉल पर आधारित';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'वेबसाइट';

  @override
  String get aboutPrivacy => 'गोपनीयता';

  @override
  String get languageSelectTitle => 'भाषा चुनें';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get languageChanged => 'भाषा बदली गई';

  @override
  String languageChangedMessage(String language) {
    return 'ऐप की भाषा $language पर सेट की गई';
  }

  @override
  String get languageSystemNotAvailable => 'भाषा प्रणाली उपलब्ध नहीं है';

  @override
  String get licenseLoading => 'लोड हो रहा है...';

  @override
  String get licenseWelcome => 'PupilMetrics में आपका स्वागत है!';

  @override
  String get licenseTrialFeatures => '14 दिन का मुफ्त परीक्षण • पूर्ण सुविधाएं';

  @override
  String get licenseStartTrial => 'मुफ्त परीक्षण शुरू करें';

  @override
  String get licenseEnterKey => 'लाइसेंस दर्ज करें';

  @override
  String get licenseFreeTrial => 'मुफ्त परीक्षण';

  @override
  String licenseDaysRemaining(int count) {
    return '$count दिन शेष';
  }

  @override
  String get licenseTrialEnded => 'परीक्षण समाप्त';

  @override
  String get licenseEnterToContinue => 'जारी रखने के लिए लाइसेंस दर्ज करें';

  @override
  String get licenseStandard => 'मानक लाइसेंस';

  @override
  String get licenseProfessional => 'व्यावसायिक लाइसेंस';

  @override
  String get licenseEnterprise => 'एंटरप्राइज़ लाइसेंस';

  @override
  String get licenseLicensed => 'लाइसेंस प्राप्त';

  @override
  String get licenseActive => 'सक्रिय';

  @override
  String get licenseTrialUser => 'परीक्षण उपयोगकर्ता';

  @override
  String get licenseLifetime => 'आजीवन';

  @override
  String get licenseNotSetUp => 'सेट अप नहीं';

  @override
  String get trialExpiredTitle => 'परीक्षण अवधि समाप्त';

  @override
  String get trialExpiredMessage =>
      'आपका 14 दिन का परीक्षण समाप्त हो गया। Iris छवियों का विश्लेषण जारी रखने के लिए कृपया लाइसेंस खरीदें।';

  @override
  String get trialExpiredCanStill => 'आप अभी भी कर सकते हैं:';

  @override
  String get trialExpiredViewAnalyses => 'अपने पिछले विश्लेषण देखें';

  @override
  String get trialExpiredExportReports => 'मौजूदा रिपोर्ट निर्यात करें';

  @override
  String get trialExpiredAccessHistory => 'स्कैन इतिहास देखें';

  @override
  String get trialExpiredMaybeLater => 'शायद बाद में';

  @override
  String get licenseRegistration => 'लाइसेंस पंजीकरण';

  @override
  String get licenseStatusValid => 'लाइसेंस प्राप्त';

  @override
  String get licenseStatusTrialActive => 'मुफ्त परीक्षण';

  @override
  String get licenseStatusTrialExpired => 'परीक्षण समाप्त';

  @override
  String get licenseStatusExpired => 'लाइसेंस समाप्त';

  @override
  String get licenseStatusInvalid => 'अमान्य लाइसेंस';

  @override
  String get licenseStatusUnregistered => 'सेट अप नहीं';

  @override
  String get licenseStatusMachineMismatch => 'भिन्न कंप्यूटर';

  @override
  String get licenseStatusNetworkError => 'कनेक्शन त्रुटि';

  @override
  String get licenseEnterKeyTitle => 'लाइसेंस कुंजी दर्ज करें';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'आपका नाम';

  @override
  String get licenseEmailAddress => 'ईमेल पता';

  @override
  String get licenseMachineId => 'मशीन ID';

  @override
  String get licenseCopyMachineId => 'मशीन ID कॉपी करें';

  @override
  String get licenseMachineIdCopied => 'मशीन ID क्लिपबोर्ड पर कॉपी की गई';

  @override
  String get licenseValidationKeyRequired =>
      'कृपया अपनी लाइसेंस कुंजी दर्ज करें';

  @override
  String get licenseValidationKeyFormat =>
      'लाइसेंस कुंजी 20 अक्षर की होनी चाहिए (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'कृपया अपना नाम दर्ज करें';

  @override
  String get licenseValidationEmailRequired => 'कृपया अपना ईमेल दर्ज करें';

  @override
  String get licenseValidationEmailInvalid => 'कृपया एक वैध ईमेल दर्ज करें';

  @override
  String get licenseActivate => 'लाइसेंस सक्रिय करें';

  @override
  String get licenseContinueTrial => 'परीक्षण जारी रखें';

  @override
  String get licenseBuyLicense => 'लाइसेंस खरीदें';

  @override
  String get licenseNeedHelp => 'सहायता चाहिए?';

  @override
  String get licenseLicenseAgreement => 'लाइसेंस समझौता';

  @override
  String get licenseActivatedSuccess => 'लाइसेंस सफलतापूर्वक सक्रिय हुआ!';

  @override
  String get licenseMsgMachineMismatch =>
      'यह लाइसेंस किसी अन्य कंप्यूटर पर पंजीकृत है। कृपया अपने मूल डिवाइस का उपयोग करें या सहायता से संपर्क करें।';

  @override
  String get licenseMsgTrialEnded =>
      'आपका मुफ्त परीक्षण समाप्त हो गया। सभी सुविधाओं का उपयोग जारी रखने के लिए लाइसेंस कुंजी दर्ज करें।';

  @override
  String get licenseMsgExpired =>
      'आपका लाइसेंस समाप्त हो गया है। जारी रखने के लिए कृपया नवीकरण करें।';

  @override
  String get licenseMsgNeedsSetup =>
      'लाइसेंस सेट अप की आवश्यकता है। मुफ्त परीक्षण शुरू करें या लाइसेंस कुंजी दर्ज करें।';

  @override
  String get licenseMsgCheckFormat =>
      'कृपया अपनी लाइसेंस कुंजी का प्रारूप जांचें। यह इस तरह दिखनी चाहिए: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'यह लाइसेंस कुंजी पहचानी नहीं गई। कृपया दोबारा जांचें और फिर कोशिश करें।';

  @override
  String get licenseMsgAlreadyRegistered =>
      'यह कुंजी पहले से किसी अन्य कंप्यूटर पर पंजीकृत है।';

  @override
  String get licenseMsgContactSupport =>
      'यह लाइसेंस समाप्त हो गया है। नवीकरण के लिए कृपया सहायता से संपर्क करें।';

  @override
  String get licenseMsgActivatedThankYou =>
      'लाइसेंस सफलतापूर्वक सक्रिय हुआ! आपकी खरीद के लिए धन्यवाद।';

  @override
  String get licenseMsgUnableToActivate =>
      'लाइसेंस सक्रिय करने में असमर्थ। कृपया अपना इंटरनेट कनेक्शन जांचें और फिर कोशिश करें।';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'आपका स्वागत है! आपका $days-दिन का मुफ्त परीक्षण शुरू हो गया।';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'परीक्षण सक्रिय: $days दिन शेष।';
  }

  @override
  String get licenseMsgFreeTrialActive => 'मुफ्त परीक्षण सक्रिय';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'लाइसेंस सक्रिय - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'इस लाइसेंस कुंजी को सक्रिय करने में असमर्थ।';

  @override
  String get licenseMsgNoLongerValid => 'लाइसेंस अब मान्य नहीं है।';

  @override
  String get licenseMsgUnableToVerify =>
      'इस लाइसेंस कुंजी को सत्यापित करने में असमर्थ। कृपया सहायता से संपर्क करें।';

  @override
  String get trialStartedSnackbar => 'परीक्षण शुरू हुआ!';

  @override
  String get trialStartedMessage => '14 दिनों की पूर्ण पहुंच का आनंद लें';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'ThemeMode';

  @override
  String get methods => 'विधियां';

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
  String get dockLeft => 'dock left';

  @override
  String get dockRight => 'dock right';

  @override
  String get undock => 'undock';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'reset';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'transparent';

  @override
  String get red => 'red';

  @override
  String get green => 'green';

  @override
  String get blue => 'blue';

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
  String get set => 'सेट करें';

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
  String get hidden => 'hidden';

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
  String get defaultIcon => 'डिफ़ॉल्ट';

  @override
  String get original => 'मूल';

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
  String get dragToResizeAreaExample => 'DragToResizeArea उदाहरण';

  @override
  String get closeWindowConfirmation =>
      'क्या आप वाकई इस विंडो को बंद करना चाहते हैं?';

  @override
  String get licenseChecking => 'लाइसेंस जांच हो रही है...';

  @override
  String get licenseRequiredTitle => 'लाइसेंस आवश्यक';

  @override
  String get licenseActivateValidMessage =>
      'जारी रखने के लिए कृपया एक वैध लाइसेंस सक्रिय करें।';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro में शामिल है:';

  @override
  String get licenseFeatureUnlimitedAnalysis =>
      'असीमित पुतली-collarette विश्लेषण';

  @override
  String get licenseFeaturePdfReports => 'PDF रिपोर्ट निर्माण';

  @override
  String get licenseFeatureBilateralComparison => 'द्विपक्षीय तुलना';

  @override
  String get licenseFeatureAnwAnalysis => 'ANW collarette विश्लेषण';

  @override
  String get licenseFeatureScanHistory => 'स्कैन इतिहास डेटाबेस';

  @override
  String get licenseFeatureUpdates => '1 वर्ष के लिए मुफ्त अपडेट';

  @override
  String get licensePurchase => 'लाइसेंस खरीदें';

  @override
  String get licenseExitApplication => 'एप्लिकेशन बंद करें';

  @override
  String get windowCompactView => 'संक्षिप्त दृश्य';

  @override
  String get windowExpandedView => 'विस्तृत दृश्य';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return 'परीक्षण ($count दिन शेष)';
  }

  @override
  String get licenseNotLicensed => 'लाइसेंस प्राप्त नहीं';

  @override
  String get licenseStatusTitle => 'लाइसेंस स्थिति';

  @override
  String get unknown => 'अज्ञात';

  @override
  String get plrReportTitle => 'PLR विश्लेषण रिपोर्ट';

  @override
  String get plrResearchOnlyTitle => 'केवल शोध/शैक्षिक उपकरण';

  @override
  String get plrResearchDisclaimer =>
      'परिणाम चिकित्सा निदान नहीं हैं। स्वास्थ्य पेशेवर से परामर्श करें।';

  @override
  String get plrNameLabel => 'नाम';

  @override
  String plrAgeYears(int age) {
    return 'आयु: $age वर्ष';
  }

  @override
  String get plrTestLabel => 'परीक्षण';

  @override
  String get plrSummaryTitle => 'PLR सारांश';

  @override
  String plrGradeValue(String grade) {
    return 'ग्रेड $grade';
  }

  @override
  String get plrStatusLabel => 'स्थिति';

  @override
  String get plrDetectedStatus => 'PLR पाया गया';

  @override
  String get plrWeakNotDetectedStatus => 'कमज़ोर/नहीं पाया गया';

  @override
  String get plrRecoveryTimeLabel => 'ठीक होने का समय';

  @override
  String get plrRecoveryRatioLabel => 'ठीक होने का अनुपात';

  @override
  String get plrChartDescription =>
      'समय के साथ पुतली प्रतिक्रिया का दृश्य प्रतिनिधित्व';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I रेंज: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'न्यूनतम: $value%';
  }

  @override
  String get plrFrameDataTitle => 'फ्रेम डेटा';

  @override
  String get plrTableTime => 'समय';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'चरण';

  @override
  String get plrTableConfidenceShort => 'विश्वास';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'सफल: $success | विफल: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• विलंब: 200-500ms (प्रारंभिक प्रतिक्रिया का समय)';

  @override
  String get plrReferenceConstrictionLine =>
      '• संकुचन: आधार रेखा से 10-30% कमी';

  @override
  String get plrReferenceVelocityLine => '• गति: 1.5-4.0%/सेकंड';

  @override
  String get plrReferenceRecoveryLine =>
      '• पुनः प्राप्ति: 5 सेकंड के भीतर आधार रेखा पर >75% वापसी';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• पुनः प्राप्ति: 5s के भीतर आधार रेखा पर >75% वापसी';

  @override
  String plrShareSubject(String eye) {
    return 'PLR विश्लेषण रिपोर्ट - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR वीडियो विश्लेषण रिपोर्ट';

  @override
  String get plrTextDisclaimerTitle => 'अस्वीकरण: केवल शोध/शैक्षिक उपकरण';

  @override
  String get plrTextDisclaimerBody => 'परिणाम चिकित्सा निदान नहीं हैं।';

  @override
  String get plrOverallGradeLabel => 'समग्र ग्रेड';

  @override
  String get plrEndOfReport => 'रिपोर्ट समाप्त';

  @override
  String get zoneOverlay => 'ज़ोन ओवरले';

  @override
  String get tipDragImage =>
      'सुझाव: limbus को ओवरले वृत्तों के साथ संरेखित करने के लिए छवि खींचें।';

  @override
  String get overlayMetrics => 'ओवरले माप';

  @override
  String get piRatioLabel => 'P/I अनुपात:';

  @override
  String get ellipsenessLabel => 'अंडाकारता:';

  @override
  String get decentralizationLabel => 'विकेंद्रीकरण:';

  @override
  String get detectedFindings => 'पाए गए निष्कर्ष';

  @override
  String get anwCollarette => 'ANW / COLLARETTE';

  @override
  String get observerNotes => 'पर्यवेक्षक नोट';

  @override
  String get observerNotesHint =>
      'नैदानिक अवलोकन, क्षेत्र निष्कर्ष, पैटर्न दर्ज करें...';

  @override
  String get autoCenter => 'स्वतः-केंद्रित';

  @override
  String get anwRing => 'ANW रिंग';

  @override
  String get axisGrid => 'अक्ष/ग्रिड';

  @override
  String get chart => 'चार्ट';

  @override
  String get hoverToIdentify => 'पहचानने के लिए होवर करें या ज़ोन टैप करें';

  @override
  String get organsMode => 'अंग मोड — ज़ोन पहचानने के लिए iris पर होवर करें';

  @override
  String get mildSizeDiff => 'हल्का आकार अंतर। यह शारीरिक भिन्नता हो सकती है।';

  @override
  String withinBaseline(Object age, Object group) {
    return 'आयु $age ($group) के लिए शोध आधार रेखा के भीतर';
  }

  @override
  String get formLabel => 'रूप:';

  @override
  String get flatteningLabel => 'चपटापन:';

  @override
  String get protrusionLabel => 'उभार:';

  @override
  String get decentrationLabel => 'विकेंद्रीकरण:';

  @override
  String get pupilSizeLabel => 'पुतली का आकार:';

  @override
  String get anwRatioLabel => 'ANW अनुपात:';

  @override
  String get anwToneLabel => 'ANW स्वर:';

  @override
  String get noMajorODAnomalies => 'कोई प्रमुख OD पुतली विसंगति नहीं।';

  @override
  String get noMajorOSAnomalies => 'कोई प्रमुख OS पुतली विसंगति नहीं।';

  @override
  String get anwNotAssessed => 'ANW: मूल्यांकन नहीं किया गया';

  @override
  String get manualAlignmentAid =>
      'केवल समीक्षा के लिए मैन्युअल संरेखण सहायता (कैप्चर के बाद)। छवि खींचें या स्वतः-केंद्रित का उपयोग करें।';

  @override
  String get frontalShift => 'S: ललाट विस्थापन पैटर्न।';

  @override
  String get cerebralCirculation =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे मस्तिष्क परिसंचरण पैटर्न से जोड़ा है।';

  @override
  String get middleTemporalShift => 'D: मध्य-अस्थायी विस्थापन पैटर्न।';

  @override
  String get respiratoryCardiac =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे श्वसन और हृदय स्वायत्त पैटर्न से जोड़ा है।';

  @override
  String get findings => 'निष्कर्ष:';

  @override
  String get analysisReportTitle => 'पुतली विश्लेषण रिपोर्ट';

  @override
  String get reportResearchVersion => 'शोध संस्करण';

  @override
  String get reportDisclaimerTitle => 'अस्वीकरण: केवल शोध/शैक्षिक उपकरण';

  @override
  String get reportDisclaimerBody =>
      'परिणाम शोध अवलोकन हैं, चिकित्सा निदान नहीं।';

  @override
  String get reportPersonInformationTitle => 'व्यक्ति की जानकारी';

  @override
  String get reportAgeGroupLabel => 'आयु समूह';

  @override
  String get reportPupilSizeComparisonTitle => 'पुतली आकार तुलना';

  @override
  String get reportCaptureDistanceMetricsTitle => 'कैप्चर दूरी माप';

  @override
  String get reportResearchObservationsTitle => 'शोध अवलोकन';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'पर्यवेक्षक नोट (ज़ोन ओवरले)';

  @override
  String get reportEndOfReport => 'रिपोर्ट समाप्त';

  @override
  String get reportGradeLabel => 'ग्रेड';

  @override
  String get reportPupilFormTitle => 'पुतली रूप';

  @override
  String get reportDecentrationTitle => 'विकेंद्रीकरण';

  @override
  String get reportFlatteningsTitle => 'चपटेपन';

  @override
  String get reportProtrusionsTitle => 'उभार';

  @override
  String get reportAnwParametersTitle => 'स्वायत्त तंत्रिका पुष्पांजलि (ANW)';

  @override
  String get reportTonicStateLabel => 'ऐतिहासिक स्वर पैटर्न';

  @override
  String get reportShiftDetectedTitle => 'ऐतिहासिक विस्थापन पैटर्न';

  @override
  String get reportClinicalLabel => 'ऐतिहासिक नोट';

  @override
  String get reportConstrictionDetectedTitle => 'संकुचन पाया गया';

  @override
  String get reportSeverityLabel => 'गंभीरता';

  @override
  String get reportReferenceValuesTitle => 'संदर्भ मान (CNRI शोध प्रोटोकॉल)';

  @override
  String get reportMatchLabel => 'मिलान';

  @override
  String get reportValueLabel => 'मान';

  @override
  String get reportNormalPupilForm => 'सामान्य पुतली रूप';

  @override
  String reportPageXofY(int page, int total) {
    return 'पृष्ठ $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'पुतली विश्लेषण रिपोर्ट - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return '$patientName की पुतली विश्लेषण रिपोर्ट संलग्न है, $date को तैयार की गई।';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'आयु $age ($group) के लिए शोध आधार रेखा से नीचे';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'आयु $age ($group) के लिए शोध आधार रेखा से ऊपर';
  }

  @override
  String get ageGroupInfant => 'शिशु';

  @override
  String get ageGroupChild15 => 'बच्चा (1-5)';

  @override
  String get ageGroupChild611 => 'बच्चा (6-11)';

  @override
  String get ageGroupTeen => 'किशोर';

  @override
  String get ageGroupAdult2039 => 'वयस्क (20-39)';

  @override
  String get ageGroupAdult4059 => 'वयस्क (40-59)';

  @override
  String get ageGroupSenior60Plus => 'वरिष्ठ (60+)';

  @override
  String get middleNasalShift => 'मध्य-नासिका विस्थापन पैटर्न।';

  @override
  String get upperTemporalShift => 'ऊपरी-अस्थायी विस्थापन पैटर्न।';

  @override
  String get lowerTemporalShift => 'निचला-अस्थायी विस्थापन पैटर्न।';

  @override
  String get basalShift => 'आधार विस्थापन पैटर्न।';

  @override
  String get vagusStellateAssociation =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे वेगस तंत्रिका या स्टेलेट गैंग्लियन के अल्पक्रिया पैटर्न से जोड़ा है।';

  @override
  String get venaCavaInferiorAssociation =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे अवर वेना कावा में हेमोडायनामिक गड़बड़ी के पैटर्न से जोड़ा है।';

  @override
  String get vertebralArteryAssociation =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे कशेरुका धमनी परिसंचरण पैटर्न से जोड़ा है।';

  @override
  String get smallPelvisAssociation =>
      'Velchover के अनुसार ऐतिहासिक अध्ययनों ने इसे छोटी श्रोणि में जमाव के पैटर्न से जोड़ा है।';

  @override
  String get openZoneOverlay => 'ज़ोन ओवरले खोलें';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'चार्ट अपारदर्शिता';

  @override
  String get irisSizeNotAvailable => 'Iris आकार डेटा उपलब्ध नहीं';

  @override
  String get ratio => 'अनुपात';

  @override
  String get reportRefPiRatio => 'पुतली/Iris अनुपात: सामान्य 20-30%';

  @override
  String get reportRefEllipseness => 'अंडाकारता: सामान्य >95%';

  @override
  String get reportRefDecentralization => 'विकेंद्रीकरण: सामान्य <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'पुतली आकार अंतर: <2% सामान्य, 2-4% हल्का, >4% महत्वपूर्ण';

  @override
  String get enterPatientInfoAnalysis => 'रोगी जानकारी दर्ज करें → विश्लेषण';

  @override
  String get chooseCaptureMethod => 'कैप्चर विधि चुनें:';

  @override
  String get usbCamera => 'USB कैमरा';

  @override
  String get selectExistingImage => 'मौजूदा छवि चुनें';

  @override
  String get detectingCameras => 'कैमरे का पता लगाया जा रहा है...';

  @override
  String get retryDetection => 'पुनः पता लगाएं';

  @override
  String get connectUvcCameraViaUsb => 'USB के माध्यम से UVC कैमरा कनेक्ट करें';

  @override
  String get ensureCameraDriversInstalled =>
      'सुनिश्चित करें कि कैमरा ड्राइवर इंस्टॉल हैं';

  @override
  String get tapRefreshToDetect => 'कैमरे का पता लगाने के लिए Refresh टैप करें';

  @override
  String get connectUsbCameraToBegin =>
      'शुरू करने के लिए USB कैमरा कनेक्ट करें';

  @override
  String get noExternalCameraTitle => 'कोई बाहरी कैमरा नहीं मिला';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'अपना USB iriscope कनेक्ट करें और सुनिश्चित करें कि यह प्लग इन है';

  @override
  String get languagesAvailable => 'उपलब्ध भाषाएं';

  @override
  String get validationChecks => 'जांच सूची:';

  @override
  String get eyeQualityTip =>
      'सुझाव: अच्छी रोशनी सुनिश्चित करें और आंख को स्थिर रखें';

  @override
  String get validatingEye => 'आंख की जांच हो रही है...';

  @override
  String get initializing => 'आरंभ हो रहा है...';

  @override
  String get nameLabel => 'नाम:';

  @override
  String get ageLabel => 'आयु:';

  @override
  String get typeLabel => 'प्रकार:';

  @override
  String get pleaseEnterName => 'कृपया नाम दर्ज करें';

  @override
  String get pleaseEnterAge => 'कृपया आयु दर्ज करें';

  @override
  String get ageMustBe2Digits => 'आयु में 1 या 2 अंक होने चाहिए';

  @override
  String get optional => '(वैकल्पिक)';

  @override
  String get bilateralBothHands => 'दोनों हाथों का द्विपक्षीय उपयोग';

  @override
  String get zoom => 'ज़ूम';

  @override
  String get zoomSliderTip =>
      'रिकॉर्डिंग से पहले आवर्धन समायोजित करने के लिए दाईं ओर ज़ूम स्लाइडर का उपयोग करें।';

  @override
  String get aboutProgramDeveloper =>
      'प्रोग्राम डेवलपर - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'चार्ट का आकार';

  @override
  String get chartOpacityAdvancedTooltip =>
      'चार्ट अपारदर्शिता (0 = केवल होवर / अंग मोड)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'हो गया और वापस जाएं';

  @override
  String get errorImageShape =>
      'छवि का आकार गलत है - सुनिश्चित करें कि आंख फ्रेम भरे';

  @override
  String get cameraConnected => 'कैमरा जुड़ा हुआ है';

  @override
  String get cameraDisconnected => 'कैमरा डिस्कनेक्ट हुआ';

  @override
  String get cameraPermissionDenied => 'कैमरा अनुमति अस्वीकृत';

  @override
  String get cameraFailedInit => 'कैमरा आरंभ करने में विफल';

  @override
  String get cameraInUse => 'कैमरा किसी अन्य ऐप द्वारा उपयोग में है';

  @override
  String get cameraFormatNotSupported => 'कैमरा प्रारूप समर्थित नहीं';

  @override
  String get capturedImageNotFound => 'कैप्चर की गई छवि फ़ाइल नहीं मिली';

  @override
  String get failedToCaptureImage => 'छवि कैप्चर करने में विफल';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'कैमरा त्रुटि हुई';

  @override
  String get connectingToUsbIriscope => 'USB iriscope से जुड़ रहे हैं...';

  @override
  String get noCamerasDetectedMessage =>
      'कोई कैमरा नहीं मिला। कृपया सुनिश्चित करें कि आपका USB कैमरा कनेक्ट है और आपके सिस्टम द्वारा पहचाना गया है।';

  @override
  String get failedToAccessCameras => 'कैमरों तक पहुंचने में विफल';

  @override
  String get notAnEyeImageTitle => 'आँख की छवि नहीं है';

  @override
  String get notAnEyeImageBody =>
      'चयनित छवि आँख नहीं लगती है।\n\nकृपया आईरिस/पुतली की स्पष्ट फोटो चुनें और पुनः प्रयास करें।';

  @override
  String get notAnEyeImageBodyCapture =>
      'कैप्चर की गई छवि आँख नहीं लगती है।\n\nकृपया आइरिसस्कोप को सीधे आँख के ऊपर रखें और दोबारा कैप्चर करें।';

  @override
  String get anisocoriaObservationSymmetrical => 'सममित';

  @override
  String get anisocoriaObservationSlight => 'हल्का अंतर';

  @override
  String get anisocoriaObservationModerate => 'मध्यम अंतर';

  @override
  String get anisocoriaObservationMarked => 'स्पष्ट अंतर';

  @override
  String get settingsNaturalMedicineSection => 'प्राकृतिक चिकित्सा';

  @override
  String get settingsHerbalToggle => 'हर्बल सिफारिशें (आइरिस ज़ोन आधारित)';

  @override
  String get settingsNutritionToggle => '7-रंग आहार पोषण (आइरिस ज़ोन आधारित)';

  @override
  String get settingsChiropracticToggle => 'कायरोप्रैक्टिक / रीढ़ मूल्यांकन';

  @override
  String get settingsTcmToggle => 'पारंपरिक चीनी चिकित्सा (TCM)';

  @override
  String get therapyHerbalTitle => 'हर्बल सिफारिशें';

  @override
  String get therapyHerbalSubtitle =>
      'आइरिस ज़ोन परिणाम — साक्ष्य भार के अनुसार क्रमबद्ध';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count संदर्भ';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'हर्बल सुझाव केवल शैक्षणिक उद्देश्यों के लिए प्रदान किए जाते हैं। उपयोग से पहले एक योग्य स्वास्थ्य पेशेवर से परामर्श करें।';

  @override
  String get therapyNutritionTitle => '7-रंग आहार पोषण';

  @override
  String get therapyNutritionSubtitle =>
      'आइरिस ज़ोन अंगों के लिए खाद्य पदार्थ और पोषक तत्व';

  @override
  String get therapyNutritionFoodsByColor =>
      'रंग के अनुसार अनुशंसित खाद्य पदार्थ';

  @override
  String get therapyNutritionKeyNutrients => 'प्रमुख पोषक तत्व';

  @override
  String get therapyNutritionHerbs => 'सहायक जड़ी-बूटियाँ और मसाले';

  @override
  String get therapyNutritionNotes => 'पोषण संबंधी नोट्स';

  @override
  String get therapyNutritionTonifying => 'टोनिफाइंग खाद्य पदार्थ:';

  @override
  String get therapyNutritionAvoid => 'कम करें / बचें:';

  @override
  String get therapyNutritionDisclaimer =>
      'पोषण संबंधी सुझाव 7-रंग आहार ढांचे पर आधारित हैं और केवल शैक्षणिक उद्देश्यों के लिए हैं। आहार में बदलाव से पहले किसी विशेषज्ञ से परामर्श करें।';

  @override
  String get therapyChiroTitle => 'कायरोप्रैक्टिक मूल्यांकन';

  @override
  String get therapyChiroSubtitle =>
      'आइरिस ज़ोन परिणामों द्वारा इंगित रीढ़ खंड';

  @override
  String get therapyChiroVertebrae => 'कशेरुकाएँ';

  @override
  String get therapyChiroNerveRoots => 'तंत्रिका जड़ें';

  @override
  String get therapyChiroInnervated => 'संक्रमित संरचनाएँ';

  @override
  String get therapyChiroSubluxation => 'संभावित उपभ्रंश संकेतक';

  @override
  String get therapyChiroMuscles => 'सामान्यतः प्रभावित मांसपेशियाँ';

  @override
  String get therapyChiroAdjusting => 'कायरोप्रैक्टिक समायोजन दृष्टिकोण';

  @override
  String get therapyChiroExercises => 'घरेलू व्यायाम और स्ट्रेच';

  @override
  String get therapyChiroPostural => 'आसन नोट';

  @override
  String get therapyChiroDisclaimer =>
      'कायरोप्रैक्टिक जानकारी शैक्षणिक उद्देश्यों के लिए प्रदान की जाती है। निदान और उपचार के लिए लाइसेंस प्राप्त कायरोप्रैक्टर से परामर्श करें।';

  @override
  String get therapyTcmTitle => 'पारंपरिक चीनी चिकित्सा';

  @override
  String get therapyTcmSubtitle => 'मेरिडियन · अंग घड़ी · पाँच तत्व';

  @override
  String get therapyTcmMeridianFunctions => 'मेरिडियन कार्य';

  @override
  String get therapyTcmGoverns => 'शासन करता है';

  @override
  String get therapyTcmPatterns => 'असंतुलन पैटर्न';

  @override
  String get therapyTcmSymptoms => 'लक्षण';

  @override
  String get therapyTcmFormulas => 'क्लासिक फार्मूले';

  @override
  String get therapyTcmKeyPoints => 'इस पैटर्न के प्रमुख बिंदु';

  @override
  String get therapyTcmAcupoints => 'प्रमुख एक्यूप्रेशर बिंदु';

  @override
  String get therapyTcmDiet => 'TCM आहार चिकित्सा';

  @override
  String get therapyTcmTonifying => 'टोनिफाइंग खाद्य पदार्थ:';

  @override
  String get therapyTcmAvoid => 'कम करें / बचें:';

  @override
  String get therapyTcmDisclaimer =>
      'TCM जानकारी शैक्षणिक उद्देश्यों के लिए है। लाइसेंस प्राप्त एक्यूपंक्चरिस्ट या TCM प्रैक्टिशनर से परामर्श करें।';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'सिफारिशें उत्पन्न करने के लिए कोई महत्वपूर्ण आइरिस ज़ोन परिणाम नहीं मिले।';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'मौसम';

  @override
  String get therapyClimateLabel => 'जलवायु';

  @override
  String get therapyEmotionLabel => 'भावना';

  @override
  String get therapyTasteLabel => 'स्वाद';

  @override
  String get therapyNatureLabel => 'प्रकृति';

  @override
  String therapyPairedOrgan(String organ) {
    return 'युग्मित: $organ';
  }

  @override
  String get bothEyesCapturedTitle => 'दोनों आंखें कैप्चर हुईं';

  @override
  String get constitutionalType => 'संवैधानिक प्रकार';

  @override
  String get constitutionalTypeOptional => 'संवैधानिक प्रकार (वैकल्पिक)';

  @override
  String get selectConstitutionalType => 'संवैधानिक प्रकार चुनें…';

  @override
  String get constitutionalTypeNone => 'कोई नहीं (मूल्यांकन नहीं)';

  @override
  String get constitutionalIridology => 'संवैधानिक आइरिडोलॉजी';

  @override
  String get constitutionalIrisDescription => 'आइरिस विवरण';

  @override
  String get constitutionalPredispositions => 'स्वास्थ्य पूर्वाग्रह';

  @override
  String get constitutionalHomeopathicRemedies => 'होम्योपैथिक उपचार';

  @override
  String get constitutionalTypeBy =>
      'डॉ. जोसेफ डेक की संवैधानिक आइरिडोलॉजी पर आधारित';
}
