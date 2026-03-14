// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => 'Analyze';

  @override
  String get plrModes => 'PLR Modes';

  @override
  String get captureInstructions => 'Position eye within the guide circle';

  @override
  String get scanHistory => 'Scan History';

  @override
  String get selectCameraMode => 'Select Camera Mode';

  @override
  String get loadFromGallery => 'Load from Gallery';

  @override
  String get rightEyePhoto => 'Right Eye Photo';

  @override
  String get leftEyePhoto => 'Left Eye Photo';

  @override
  String get autoCapture => 'Auto-Capture';

  @override
  String get autoCaptureDesc => 'Eye detection + 5-second auto-capture';

  @override
  String get manualCapture => 'Manual Capture';

  @override
  String get manualCaptureDesc =>
      'Eye detection + manual capture (back camera)';

  @override
  String get selfieMode => 'Selfie Mode';

  @override
  String get selfieModeDesc =>
      'Eye detection + 5-sec auto-capture (front camera)';

  @override
  String get plrVideoRear => 'PLR Video (Rear)';

  @override
  String get plrVideoRearDesc => 'Back camera • 10-sec capture';

  @override
  String get plrVideoSelfie => 'PLR Video (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Front camera • 10-sec capture';

  @override
  String get plrVideoCapture => 'PLR Video Capture';

  @override
  String get frontCamera => 'Front Camera';

  @override
  String get rearCamera => 'Rear Camera';

  @override
  String get selectEyeToAssess => 'Select which eye to assess';

  @override
  String get rightEyeOD => 'Right Eye (OD)';

  @override
  String get leftEyeOS => 'Left Eye (OS)';

  @override
  String get recordPlrRightEye => 'Record PLR for right eye';

  @override
  String get recordPlrLeftEye => 'Record PLR for left eye';

  @override
  String get loadRightEyeImage => 'Load right eye image';

  @override
  String get loadLeftEyeImage => 'Load left eye image';

  @override
  String get bothEyes => 'Both Eyes';

  @override
  String get loadBothEyesDesc => 'Load right eye, then left eye';

  @override
  String get selectEyeImageFromDevice => 'Select an eye image from your device';

  @override
  String get selectRightEyeFirst => 'Select RIGHT eye (OD) image first';

  @override
  String get rightEyeSaved => 'Right eye saved. Now select LEFT eye (OS) image';

  @override
  String get cancelledNoRightEye => 'Cancelled - no right eye selected';

  @override
  String get cancelledNoLeftEye => 'Cancelled - no left eye selected';

  @override
  String errorLoadingImages(String error) {
    return 'Error loading images: $error';
  }

  @override
  String get crop43 => 'Crop (4:3)';

  @override
  String get success => 'Success';

  @override
  String get imageCroppedSuccess => 'Image cropped successfully!';

  @override
  String get error => 'Error';

  @override
  String get cropFailed => 'Failed to crop image. Please try again.';

  @override
  String get crop => 'Crop';

  @override
  String get cancel => 'Cancel';

  @override
  String get saved => 'Saved! ✅';

  @override
  String get imageSavedToGallery => 'Image saved successfully in gallery';

  @override
  String get exposure => 'Exposure';

  @override
  String get flash => 'Flash';

  @override
  String get eye => 'Eye';

  @override
  String get center => 'center';

  @override
  String get light => 'Light';

  @override
  String get ready => 'Ready';

  @override
  String get on => 'ON';

  @override
  String get off => 'OFF';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUAL';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPIL';

  @override
  String get plrHistory => 'PLR History';

  @override
  String get searchByName => 'Search by name...';

  @override
  String get totalScans => 'Total Scans';

  @override
  String get thisWeek => 'This Week';

  @override
  String get patients => 'Patients';

  @override
  String get detected => 'Detected';

  @override
  String get noPlrRecordsYet => 'No PLR records yet';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Record a PLR video to see history here';

  @override
  String get deleteRecord => 'Delete Record?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Delete PLR analysis for $name ($eye)?\\n\\nThis cannot be undone.';
  }

  @override
  String get delete => 'Delete';

  @override
  String get recordDeleted => 'Record deleted';

  @override
  String plrAnalysis(String eye) {
    return 'PLR Analysis - $eye';
  }

  @override
  String get patient => 'Patient';

  @override
  String get date => 'Date';

  @override
  String get frames => 'Frames';

  @override
  String get baselinePiRatio => 'Baseline P/I';

  @override
  String get minPiRatio => 'Min P/I';

  @override
  String get plrMagnitude => 'PLR Magnitude';

  @override
  String get constriction => 'Constriction';

  @override
  String get plrDetected => 'PLR Detected';

  @override
  String get confidence => 'Confidence';

  @override
  String get grade => 'Grade';

  @override
  String get close => 'close';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get na => 'N/A';

  @override
  String get takeLeftEyePhoto => 'Take Left Eye Photo';

  @override
  String get takeRightEyePhoto => 'Take Right Eye Photo';

  @override
  String get nowTakingLeftEye => 'Now taking LEFT eye (OS)';

  @override
  String get startingWithRightEye => 'Starting with RIGHT eye (OD)';

  @override
  String get captured => 'Captured ✓';

  @override
  String get useSameDistanceLighting =>
      'Use the same distance and lighting as the right eye for accurate comparison.';

  @override
  String get step1of2 => 'Step 1 of 2';

  @override
  String get step2of2 => 'Step 2 of 2';

  @override
  String get bothEyesCaptured => 'Both eyes captured ✓';

  @override
  String get continueToLeftEye => 'Continue to Left Eye';

  @override
  String get retakeOD => 'Retake OD';

  @override
  String get retakeOS => 'Retake OS';

  @override
  String get retakeRightEye => 'Retake Right Eye';

  @override
  String get analyzeBothEyes => 'Analyze Both Eyes';

  @override
  String get patientInfoMissing => 'Patient Info Missing';

  @override
  String get rightEyePhotoMissing => 'Right eye photo missing!';

  @override
  String get patientInfoMissingRestart =>
      'Patient info missing. Please restart.';

  @override
  String get exitApp => 'Exit App';

  @override
  String get tipsForBestResults => 'TIPS FOR BEST RESULTS';

  @override
  String get followGuidelinesForQuality =>
      'Follow these guidelines for optimal image quality';

  @override
  String get cameraDistance => 'Camera Distance';

  @override
  String get cameraDistanceDesc =>
      'Keep camera 4-6 inches from your eye. Maintain same distance for both eyes.';

  @override
  String get lightingPosition => 'Lighting Position';

  @override
  String get lightingPositionDesc =>
      'Position light source inside or outside pupil borders. Try gazing toward camera flash.';

  @override
  String get avoidReflections => 'Avoid Reflections';

  @override
  String get avoidReflectionsDesc =>
      'Reduce reflections by avoiding window glare, mirrors, and direct lamps.';

  @override
  String get centerYourEye => 'Center Your Eye';

  @override
  String get centerYourEyeDesc =>
      'Ensure entire eye including sclera (white part) is centered and fills the frame.';

  @override
  String get cropProperly => 'Crop Properly';

  @override
  String get cropProperlyDesc =>
      'Crop image with eye in center. Image will auto-save in 4:3 aspect ratio.';

  @override
  String get importantInformation => 'Important Information';

  @override
  String get imageRatio43 => '4:3 image ratio for medical imaging standard';

  @override
  String get forClinicalUseCnri => 'For clinical use with CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Does not provide medical diagnosis';

  @override
  String get eyeWideOpenClear =>
      'Make sure your eye is wide open and the picture is clear';

  @override
  String get personalInfo => 'Personal Info';

  @override
  String get personInformation => 'Person Information';

  @override
  String get enterPersonDetails => 'Enter Person Details';

  @override
  String get infoIncludedInReport =>
      'This information will be included in the analysis report';

  @override
  String get fullName => 'Full Name';

  @override
  String get enterPersonName => 'Enter person name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get sex => 'Sex';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get ageYears => 'Age (years)';

  @override
  String get enterAge => 'Enter age';

  @override
  String get ageRequired => 'Age is required';

  @override
  String get enterValidNumber => 'Enter a valid number';

  @override
  String get enterValidAge => 'Enter a valid age (0-120)';

  @override
  String get mainComplaints => 'Main Complaints';

  @override
  String get mainComplaintsOptional => 'Main Complaints (optional)';

  @override
  String get complaintsHint => 'e.g., headaches, vision problems, fatigue...';

  @override
  String get continueToCaptire => 'Continue to Capture';

  @override
  String get ageImportantNote =>
      'Age is important for accurate pupil size assessment as normal ranges vary by age.';

  @override
  String get submit => 'Submit';

  @override
  String get pleaseSelectGender => 'Please select gender!';

  @override
  String get applicationSubmitted =>
      'Your application has been successfully submitted.';

  @override
  String get type => 'Type:';

  @override
  String get gender => 'Gender:';

  @override
  String get rightHanded => 'Right-handed';

  @override
  String get leftHanded => 'Left-handed';

  @override
  String get partialLeftHandedness => 'Partial Left-handedness';

  @override
  String get retrainedLeftHandedness => 'Retrained Left-handedness';

  @override
  String get bilateralUseBothHands => 'Bilateral use of both hands';

  @override
  String get splashTitle => 'PupilMetrics Eye Capture';

  @override
  String get splashDeveloper => 'Program Developer - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Research/Educational Tool';

  @override
  String get startNewAnalysis => 'Start New Analysis';

  @override
  String get viewHistory => 'View History';

  @override
  String get viewResearchDisclaimer => 'View Research Disclaimer';

  @override
  String get researchDisclaimerTitle => 'Research/Educational Tool';

  @override
  String get researchDisclaimerNotMedical => 'NOT a medical device';

  @override
  String get researchDisclaimerNotClinical => 'NOT for clinical diagnosis';

  @override
  String get researchDisclaimerResults => 'Results are research observations';

  @override
  String get researchDisclaimerConsult =>
      'Always consult healthcare professionals';

  @override
  String get researchDisclaimerAcknowledge =>
      'By continuing, you acknowledge this is a research tool and should not be used for medical decisions.';

  @override
  String get researchDisclaimerWarning =>
      'This app is for RESEARCH and EDUCATIONAL purposes only.';

  @override
  String get iUnderstand => 'I Understand';

  @override
  String get plrAnalysisTest => 'PLR Analysis Test';

  @override
  String get checkingVideoFile => 'Checking video file...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Processing frame $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Analysis complete!';

  @override
  String get errorVideoNotFound => 'Error: Video file not found';

  @override
  String get waitingForResults => 'Waiting for results...';

  @override
  String get baseline => 'Baseline';

  @override
  String get flashPhase => 'Flash';

  @override
  String get constrictionPhase => 'Constrict';

  @override
  String get recovery => 'Recovery';

  @override
  String get plrDetectedExclaim => 'PLR DETECTED!';

  @override
  String get plrWeakNotDetected => 'PLR Weak/Not Detected';

  @override
  String get min => 'Min';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'Constr.';

  @override
  String get saveToHistory => 'Save to History';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Save Frames';

  @override
  String get share => 'Share';

  @override
  String get frameSavedToGallery => 'Frame saved to gallery!';

  @override
  String get failedToSaveFrame => 'Failed to save frame';

  @override
  String framesSavedToGallery(int count) {
    return '$count frames saved to gallery!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON copied to clipboard!';

  @override
  String get reportCopiedToClipboard => 'Report copied to clipboard!';

  @override
  String shareFailedError(String error) {
    return 'Share failed: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Saved to history! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'No successful frames to save';

  @override
  String get saveAllFrames => 'Save All Frames';

  @override
  String get shareReport => 'Share Report';

  @override
  String get shareJson => 'Share JSON';

  @override
  String get rerunTest => 'Re-run test';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'Initializing camera...';

  @override
  String usingCamera(String camera) {
    return 'Using $camera camera';
  }

  @override
  String cameraError(String error) {
    return 'Camera error: $error';
  }

  @override
  String get noCamerasFound => 'No cameras found';

  @override
  String get retry => 'Retry';

  @override
  String get startPlrRecording => 'Start PLR Recording';

  @override
  String get stopRecording => 'Stop Recording';

  @override
  String get phaseReady => 'Ready';

  @override
  String get phaseStarting => 'Starting...';

  @override
  String phaseBaseline(int sec) {
    return 'Baseline (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'FLASH!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Constriction ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Recovery ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Complete!';

  @override
  String get readyDesc => 'Position eye in the circle, then tap Start';

  @override
  String get holdSteady => 'Hold steady...';

  @override
  String get recordingBaselinePupil => 'Recording baseline pupil size';

  @override
  String lightStimulus(int ms) {
    return 'Light stimulus (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Measuring pupil constriction';

  @override
  String get measuringRecovery => 'Measuring pupil recovery';

  @override
  String get plrRecordingComplete => 'PLR recording complete';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Position the $eye eye within the circle.\\nKeep steady during the $seconds-second recording.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Keep eye steady. Flash will occur at $sec seconds.';
  }

  @override
  String get recordingComplete => 'Recording Complete';

  @override
  String get plrVideoCapturedSuccess => 'PLR video captured successfully!';

  @override
  String get duration => 'Duration';

  @override
  String get seconds => 'seconds';

  @override
  String get frameRate => 'Frame Rate';

  @override
  String get camera => 'Camera';

  @override
  String flashAt(int sec, int ms) {
    return 'At ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Phases';

  @override
  String get phasesFlow => 'Baseline → Flash → Constriction → Recovery';

  @override
  String get expectedNormalValues => 'Expected Normal Values:';

  @override
  String get latency => 'Latency';

  @override
  String get velocity => 'Velocity';

  @override
  String get testFrameAnalysis => '🧪 Test Frame Analysis';

  @override
  String get retake => 'Retake';

  @override
  String get done => 'Done';

  @override
  String get plrVideoModeTitle => 'PLR Video Mode';

  @override
  String get plrAssessmentTitle => 'Pupillary Light Reflex (PLR) Assessment';

  @override
  String get plrInstructions =>
      '1. Position the eye within the guide circle\\n2. Tap \"Start PLR Recording\"\\n3. Hold steady for 10 seconds\\n4. A flash will occur at 3 seconds\\n5. The app records pupil response';

  @override
  String get recordingPhases => 'Recording Phases:';

  @override
  String get baselinePhaseDesc => 'Initial pupil size';

  @override
  String get flashPhaseDesc => 'Light stimulus';

  @override
  String get constrictionPhaseDesc => 'Pupil shrinks';

  @override
  String get recoveryPhaseDesc => 'Pupil returns';

  @override
  String get normalPlrValues => 'Normal PLR Values:';

  @override
  String get gotIt => 'Got it';

  @override
  String get pupilAnalysis => 'Pupil Analysis';

  @override
  String scansLeft(int count) {
    return '$count left';
  }

  @override
  String get validatingRightEye => 'Validating right eye...';

  @override
  String get validatingLeftEye => 'Validating left eye...';

  @override
  String get analyzingRightEye => 'Analyzing right eye (OD)...';

  @override
  String get analyzingLeftEye => 'Analyzing left eye (OS)...';

  @override
  String get comparingPupils => 'Comparing pupils...';

  @override
  String person(String name) {
    return 'Person: $name';
  }

  @override
  String get invalidEyeImage => 'Invalid Eye Image';

  @override
  String analysisFailed(String error) {
    return 'Analysis failed: $error';
  }

  @override
  String get researchEducationalToolOnly => 'RESEARCH/EDUCATIONAL TOOL ONLY';

  @override
  String get resultsNotMedicalDiagnoses =>
      'This application is for research and educational purposes only. Results are NOT medical diagnoses and have NOT been validated for clinical use. Pattern associations are from historical research literature. Consult a healthcare professional for any health concerns.';

  @override
  String get pupilSizeDifference => 'Pupil Size Difference Detected';

  @override
  String get significantPupilSizeDiff => 'SIGNIFICANT PUPIL SIZE DIFFERENCE';

  @override
  String get diff => 'diff';

  @override
  String get researchObservationConsult =>
      'Research observation - Consult a healthcare professional for interpretation';

  @override
  String get ageBasedResearchBaseline => 'Age-Based Research Baseline';

  @override
  String group(String group) {
    return 'Group: $group';
  }

  @override
  String get researchRange => 'Research Range';

  @override
  String get measuredEst => 'Measured (est.)';

  @override
  String get pupilForm => 'Pupil Form';

  @override
  String get decentrationPattern => 'Decentration Pattern';

  @override
  String get flattenings => 'Flattenings';

  @override
  String get protrusions => 'Protrusions';

  @override
  String zonesCount(int count) {
    return '$count zones';
  }

  @override
  String get bilateralComparison => 'Bilateral Comparison';

  @override
  String get parameter => 'Parameter';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'P/I Ratio';

  @override
  String get ellipseness => 'Ellipseness';

  @override
  String get circularity => 'Circularity';

  @override
  String get decentralization => 'Decentralization';

  @override
  String get anwRatio => 'Ratio';

  @override
  String get normal => 'normal';

  @override
  String get elliptical => 'Elliptical';

  @override
  String get circular => 'Circular';

  @override
  String get irregular => 'Irregular';

  @override
  String get centered => 'Centered';

  @override
  String get offset => 'Offset';

  @override
  String get miosis => 'Miosis';

  @override
  String get constricted => 'Constricted';

  @override
  String get dilated => 'Dilated';

  @override
  String get mydriasis => 'Mydriasis';

  @override
  String get inner => 'Inner';

  @override
  String get outer => 'Outer';

  @override
  String get high => 'High';

  @override
  String get moderate => 'Moderate';

  @override
  String get savePdf => 'Save PDF';

  @override
  String get sharePdf => 'Share PDF';

  @override
  String get retakePhotos => 'Retake Photos';

  @override
  String scansLeftBanner(int count) {
    return '$count scans left';
  }

  @override
  String get upgrade => 'Upgrade';

  @override
  String get unlockUnlimited => 'Unlock Unlimited';

  @override
  String get usedAllFreeScans => 'You\'ve used all free scans.';

  @override
  String get unlimitedScans => 'Unlimited scans';

  @override
  String get pdfReports => 'PDF reports';

  @override
  String get scanHistoryFeature => 'Scan history';

  @override
  String get bilateralAnalysis => 'Bilateral analysis';

  @override
  String get monthly => 'Monthly';

  @override
  String get perMonth => '/mo';

  @override
  String get annual => 'Annual';

  @override
  String get perYear => '/yr';

  @override
  String get tenCredits => '10 Credits';

  @override
  String get oneTime => 'one-time';

  @override
  String get best => 'BEST';

  @override
  String get purchaseCancelled => 'Purchase cancelled';

  @override
  String purchaseFailed(String error) {
    return 'Purchase failed: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT saved: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON saved: $path';
  }

  @override
  String get pdfSaved => 'PDF Saved!';

  @override
  String pdfFailed(String error) {
    return 'PDF Failed: $error';
  }

  @override
  String get open => 'OPEN';

  @override
  String failed(String error) {
    return 'Failed: $error';
  }

  @override
  String get staticScans => 'Static';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => 'Search by name or complaints...';

  @override
  String get searchPlrRecords => 'Search PLR records...';

  @override
  String get noScansYet => 'No scans yet';

  @override
  String get completedScansAppearHere => 'Completed scans will appear here';

  @override
  String get deleteScan => 'Delete Scan?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Delete scan for $name from $date?';
  }

  @override
  String get scanDeleted => 'Scan deleted';

  @override
  String get originalImagesNotFound => 'Original eye images not found.';

  @override
  String get viewResults => 'View Results';

  @override
  String get avgPlr => 'Avg PLR';

  @override
  String get years => 'years';

  @override
  String get anisocoria => 'Anisocoria';

  @override
  String get none => 'None';

  @override
  String get mild => 'Mild';

  @override
  String get severe => 'Severe';

  @override
  String zoneLabel(String zone) {
    return 'Zone: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Associated with $organ';
  }

  @override
  String get significant => 'Significant';

  @override
  String get fair => 'Fair';

  @override
  String get low => 'Low';

  @override
  String get good => 'Good';

  @override
  String get zones => 'zones';

  @override
  String get significanceWithinLimits => 'within acceptable limits';

  @override
  String get significanceMild => 'mild';

  @override
  String get significanceModerate => 'moderate';

  @override
  String get significanceSignificant => 'significant';

  @override
  String get formTypeCircle => 'Circle (Normal)';

  @override
  String get formTypeOval => 'Oval';

  @override
  String get formTypeOvalVertical => 'Oval-vertical';

  @override
  String get formTypeOvalHorizontal => 'Oval-horizontal';

  @override
  String get formTypeOvalDiagonal => 'Oval-diagonal';

  @override
  String get formTypeLeftObliqueEllipse => 'Left Oblique Ellipse';

  @override
  String get formTypeUnilateralEllipse => 'Unilateral Ellipse';

  @override
  String get formTypeVentralDivergingEllipse => 'Ventral Diverging Ellipse';

  @override
  String get formTypeFrontalDivergingEllipse => 'Frontal Diverging Ellipse';

  @override
  String get formTypeEllipse => 'Ellipse';

  @override
  String get formTypeChord => 'Chord';

  @override
  String get formTypeIrregular => 'Irregular';

  @override
  String get pupilFormCircleDesc =>
      'Normal circular pupil form. No pattern variations detected.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Horizontal oval pattern. Historical research associated this with autonomic nervous system patterns affecting respiratory and glandular function zones.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Vertical oval pattern. Historical research linked this pattern to cerebral circulation zones in autonomic reflex studies.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Diagonal oval pattern. Research literature associated this with urogenital zone reflexes in autonomic studies.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Left oblique ellipse pattern. Historical observations linked this to urogenital and lower extremity autonomic zones.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Unilateral ellipse pattern. Research indicated associations with respiratory and bronchial autonomic zones.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Ventral diverging ellipse. Historical studies associated this with lower body autonomic zones and motor function patterns.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Frontal diverging ellipse. Research literature linked this pattern to cerebral and upper autonomic zones.';

  @override
  String get pupilFormOvalDesc =>
      'Mild oval deformation pattern. Monitor for progression in research observations.';

  @override
  String get pupilFormEllipseDesc =>
      'Elliptical pupil pattern indicating autonomic system variations in historical studies.';

  @override
  String get pupilFormChordDesc =>
      'Chord-like deformation pattern indicating localized autonomic influences in research literature.';

  @override
  String get pupilFormIrregularDesc =>
      'Irregular form suggesting multiple autonomic pattern influences based on historical observations.';

  @override
  String get patternCentered => 'Centered (Normal)';

  @override
  String get patternFrontal => 'Frontal decentralization';

  @override
  String get patternBasal => 'Basal decentralization';

  @override
  String get patternNasal => 'Nasal decentralization';

  @override
  String get patternTemporal => 'Temporal decentralization';

  @override
  String get patternMiddleNasal => 'Middle-nasal decentralization';

  @override
  String get patternMiddleTemporal => 'Middle-temporal decentralization';

  @override
  String get patternUpperNasal => 'Upper-nasal decentralization';

  @override
  String get patternUpperTemporal => 'Upper-temporal decentralization';

  @override
  String get patternLowerNasal => 'Lower-nasal decentralization';

  @override
  String get patternLowerTemporal => 'Lower-temporal decentralization';

  @override
  String get patternUpwards => 'Decentration - Upwards';

  @override
  String get patternDownwards => 'Decentration - Downwards';

  @override
  String get patternUpwardsInwards => 'Decentration - Upwards-Inwards';

  @override
  String get patternUpwardsOutwards => 'Decentration - Upwards-Outwards';

  @override
  String get decentrationCenteredDesc =>
      'Normal pupil positioning within physiological limits.';

  @override
  String get decentrationNasalRightDesc =>
      'Nasal pattern (Right). Historical research associated this zone with pulmonary autonomic reflexes.';

  @override
  String get decentrationNasalLeftDesc =>
      'Nasal pattern (Left). Research literature linked this zone to cardiac autonomic function patterns.';

  @override
  String get decentrationTemporalDesc =>
      'Temporal pattern. Historical observations associated this zone with renal and reproductive autonomic reflexes.';

  @override
  String get decentrationFrontalRightDesc =>
      'Frontal pattern (Right). Research associated this zone with cognitive and cerebral function patterns.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Frontal pattern (Left). Historical studies linked this zone to cerebral autonomic patterns.';

  @override
  String get decentrationBasalRightDesc =>
      'Basal pattern (Right). Research indicated associations with intracranial pressure reflexes.';

  @override
  String get decentrationBasalLeftDesc =>
      'Basal pattern (Left). Historical observations linked this to cerebral inflammatory zone patterns.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Upper-nasal pattern (Right). Research associated this zone with hepatobiliary autonomic reflexes.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Upper-nasal pattern (Left). Historical studies linked this to splenic and diaphragmatic zones.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Upper-temporal pattern. Research indicated associations with renal and reproductive autonomic zones.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Middle-nasal pattern (Right). Historical observations linked this to oxygen utilization and cardiac zones.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Middle-nasal pattern (Left). Research associated this with neurological and cardiac autonomic patterns.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Middle-temporal pattern (Right). Research linked this to cardiac autonomic regulation zones.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Middle-temporal pattern (Left). Historical studies associated this with pulmonary and cardiac zones.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Upper-nasal pattern (Right). Research indicated associations with cognitive zones and cervical spine reflexes.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Upper-nasal pattern (Left). Historical observations linked this to cognitive patterns and cervical zones.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Upper-temporal pattern (Right). Research associated this zone with cranial nerve and auditory reflexes.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Upper-temporal pattern (Left). Historical studies linked this to neurovegetative and speech zones.';

  @override
  String get decentrationLowerNasalDesc =>
      'Lower-nasal pattern. Research indicated associations with urogenital and lumbosacral autonomic zones.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Lower-temporal pattern (Right). Historical observations associated this with metabolic and hepatic zones.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Lower-temporal pattern (Left). Research linked this to cardiac and splenic autonomic patterns.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Pattern associated with upper-central zone. Historical research linked this to mood regulation and energy autonomic reflexes.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Pattern associated with upper-temporal zone. Research indicated associations with cranial nerve and auditory autonomic reflexes.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Pattern associated with middle-temporal zone. Historical observations linked this to respiratory and cardiac autonomic patterns.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Pattern associated with lower-temporal zone. Research literature associated this with hepatic and metabolic autonomic zones.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Pattern associated with lower-basal zone. Historical studies linked this to renal and lower extremity autonomic reflexes.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Pattern associated with lower-nasal zone. Research indicated associations with urogenital and pelvic autonomic zones.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Pattern associated with middle-nasal zone. Historical observations linked this to oxygen utilization and respiratory autonomic patterns.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Pattern associated with upper-nasal zone. Research literature associated this with cognitive and cervical autonomic reflexes.';

  @override
  String get flatteningDefaultRightDesc =>
      'Autonomic nervous system pattern variation detected in this zone based on historical research.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Pattern associated with upper-central zone. Historical research linked this to mood regulation and neurological autonomic patterns.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Pattern associated with upper-temporal zone. Research indicated associations with neurovegetative and speech autonomic zones.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Pattern associated with middle-temporal zone. Historical observations linked this to pulmonary and cardiac autonomic reflexes.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Pattern associated with lower-temporal zone. Research literature associated this with cardiac and splenic autonomic patterns.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Pattern associated with lower-basal zone. Historical studies linked this to renal and eliminative autonomic zones.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Pattern associated with lower-nasal zone. Research indicated associations with urogenital and lumbosacral autonomic reflexes.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Pattern associated with middle-nasal zone. Historical observations linked this to cardiac and respiratory autonomic patterns.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Pattern associated with upper-nasal zone. Research literature associated this with cognitive and cervical autonomic zones.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Autonomic nervous system pattern variation detected in this zone based on historical research.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Upper-central zone protrusion pattern. Research associated this with sympathetic hyperarousal patterns affecting cerebral zones.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Upper-temporal zone protrusion pattern. Historical observations linked this to cranial nerve and auditory system hyperactivity patterns.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Middle-temporal zone protrusion pattern. Research indicated associations with cardiac and respiratory sympathetic patterns.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Lower-temporal zone protrusion pattern. Historical studies linked this to hepatobiliary and metabolic sympathetic zones.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Lower-basal zone protrusion pattern. Research associated this with renal and pelvic sympathetic hyperactivity patterns.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Lower-nasal zone protrusion pattern. Historical observations linked this to urogenital sympathetic activation zones.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Middle-nasal zone protrusion pattern. Research indicated associations with gastric and pancreatic sympathetic patterns.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Upper-nasal zone protrusion pattern. Historical studies linked this to cognitive and visual sympathetic hyperarousal zones.';

  @override
  String get protrusionDefaultRightDesc =>
      'Sympathetic nervous system hyperactivity pattern detected in this zone based on research observations.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Upper-central zone protrusion pattern. Research associated this with psychomotor and cerebral sympathetic patterns.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Upper-temporal zone protrusion pattern. Historical observations linked this to neurovegetative sympathetic hyperactivity zones.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Middle-temporal zone protrusion pattern. Research indicated associations with pulmonary and cardiac sympathetic patterns.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Lower-temporal zone protrusion pattern. Historical studies linked this to splenic and cardiac sympathetic activation zones.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Lower-basal zone protrusion pattern. Research associated this with pelvic and renal sympathetic hyperactivity patterns.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Lower-nasal zone protrusion pattern. Historical observations linked this to lumbosacral sympathetic activation zones.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Middle-nasal zone protrusion pattern. Research indicated associations with anxiety-cardiac sympathetic patterns.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Upper-nasal zone protrusion pattern. Historical studies linked this to cognitive and visual sympathetic hyperarousal zones.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Sympathetic nervous system hyperactivity pattern detected in this zone based on research observations.';

  @override
  String get anisocoriaNone =>
      'Pupil sizes within normal limits. No significant anisocoria detected.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisocoria detected: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'Within normal limits.';

  @override
  String get anisocoriaSeverityMild =>
      'Mild difference observed. May be physiological.';

  @override
  String get anisocoriaSeverityModerate =>
      'Moderate asymmetry. Research observation noted.';

  @override
  String get anisocoriaSeveritySevere =>
      'Significant asymmetry. Research observation flagged.';

  @override
  String get largerPupilEqual => 'equal';

  @override
  String get largerPupilOS => 'OS (Left)';

  @override
  String get largerPupilOD => 'OD (Right)';

  @override
  String get decentrationWithinLimits => 'Within normal limits.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Offset: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Upper-Central';

  @override
  String get zoneUpperNasal => 'Upper-Nasal';

  @override
  String get zoneMiddleNasal => 'Middle-Nasal';

  @override
  String get zoneLowerNasal => 'Lower-Nasal';

  @override
  String get zoneLowerBasal => 'Lower-Basal';

  @override
  String get zoneLowerTemporal => 'Lower-Temporal';

  @override
  String get zoneMiddleTemporal => 'Middle-Temporal';

  @override
  String get zoneUpperTemporal => 'Upper-Temporal';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Basal';

  @override
  String get zoneUnknown => 'Unknown';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '$zone flatness ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '$zone protrusion ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB Iriscope Mode';

  @override
  String get iriscopeExternal => 'Iriscope / External';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => 'Use connected USB camera or iriscope';

  @override
  String get detectedCameras => 'Detected Cameras';

  @override
  String get externalCamera => 'External Camera';

  @override
  String cameraIndex(int index) {
    return 'Camera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'No external camera detected.\\nConnect a USB iriscope to enable.';

  @override
  String get refresh => 'Refresh';

  @override
  String get selectCameraSource => 'Select Camera Source';

  @override
  String camerasDetected(int count) {
    return '$count cameras detected';
  }

  @override
  String camerasAvailable(int count) {
    return '$count cameras available';
  }

  @override
  String externalCameraIndex(int index) {
    return 'External Camera $index';
  }

  @override
  String get qualityGatedRear => 'Quality-gated auto-capture (rear camera)';

  @override
  String get qualityGatedFront => 'Quality-gated auto-capture (front camera)';

  @override
  String get usbCameraInfo => 'USB Camera Info';

  @override
  String get connected => 'Connected';

  @override
  String get waiting => 'Waiting...';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get waitingForUsbCamera => 'Waiting for USB Camera';

  @override
  String get connectIriscopePrompt =>
      'Connect your iriscope via USB OTG adapter.\\nGrant permission when prompted.';

  @override
  String get usbCameraIssue => 'USB Camera Issue';

  @override
  String get pleaseConnectIriscope =>
      'Please connect your iriscope or USB camera.';

  @override
  String get retryConnection => 'Retry Connection';

  @override
  String get troubleshootingTips => 'Troubleshooting Tips';

  @override
  String get tipUsbOtgAdapter => 'Ensure USB OTG adapter is properly connected';

  @override
  String get tipUsbHostMode => 'Check if device supports USB Host mode';

  @override
  String get tipReconnectCamera =>
      'Try disconnecting and reconnecting the camera';

  @override
  String get tipGrantPermissions => 'Grant USB permissions when prompted';

  @override
  String get tipUnlockDevice => 'Some devices may need to be unlocked';

  @override
  String get back => 'Back';

  @override
  String get switchEye => 'Switch Eye';

  @override
  String get state => 'State';

  @override
  String get status => 'Status';

  @override
  String get usingFlutterUvcPlugin =>
      'Using flutter_uvc_camera plugin\\Plugin for USB Video Class device support.';

  @override
  String get initialized => 'Initialized';

  @override
  String get notReady => 'Not Ready';

  @override
  String get captureDistanceMatch => 'Capture Distance Match';

  @override
  String get irisSize => 'Iris Size';

  @override
  String get distanceMatched => 'Distance Matched';

  @override
  String get distanceMismatch => 'Distance Mismatch';

  @override
  String get excellentMatch => 'Excellent match';

  @override
  String get goodMatch => 'Good match';

  @override
  String get acceptableMatch => 'Acceptable match';

  @override
  String get considerRetaking => 'Distance mismatch - consider retaking';

  @override
  String get qualityReady => 'Ready! Hold steady...';

  @override
  String get qualityTooBlurry => 'Hold camera steady';

  @override
  String get qualityTooDark => 'Need more light';

  @override
  String get qualityTooBright => 'Too bright - reduce light';

  @override
  String get qualityNoContrast => 'Adjust lighting angle';

  @override
  String get qualityNoPupil => 'Center pupil in frame';

  @override
  String get qualityNotCentered => 'Move eye to center';

  @override
  String get qualityNotAnEye => 'No eye detected';

  @override
  String get qualityProcessing => 'Processing...';

  @override
  String get distanceMatchedCheck => '✓ Distance matched';

  @override
  String get distanceGoodMatchCheck => '✓ Good match';

  @override
  String get distanceSlightlyBack => 'Slightly back ↔';

  @override
  String get distanceSlightlyCloser => 'Slightly closer ↔';

  @override
  String get distanceAlmostThere => 'Almost there...';

  @override
  String get distanceMoveBack => 'Move back ←←';

  @override
  String get distanceMoveCloser => 'Move closer →→';

  @override
  String get distanceTooClose => 'Too close! Move back';

  @override
  String get distanceTooFar => 'Too far! Move closer';

  @override
  String get distanceStabilizing => 'Stabilizing...';

  @override
  String distanceLabel(int percent) {
    return 'Distance: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Front Camera';

  @override
  String get rearCameraLabel => 'Back Camera';

  @override
  String get startingCamera => 'Starting camera...';

  @override
  String get eyeNotDetected => 'Eye Not Detected';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get indicatorEye => 'Eye';

  @override
  String get indicatorSharp => 'Sharp';

  @override
  String get indicatorLight => 'Light';

  @override
  String get indicatorFocus => 'Focus';

  @override
  String get indicatorPupil => 'Pupil';

  @override
  String get indicatorIris => 'Iris';

  @override
  String get indicatorMatch => 'Match';

  @override
  String get checkImageShape => 'Image Shape';

  @override
  String get checkCircularIris => 'Circular Iris';

  @override
  String get checkDarkPupil => 'Dark Pupil';

  @override
  String get checkIrisTexture => 'Iris Texture';

  @override
  String get checkPupilIrisStructure => 'Pupil-Iris Structure';

  @override
  String get checkNaturalColors => 'Natural Colors';

  @override
  String get checkEdgePattern => 'Edge Pattern';

  @override
  String get errorImageShapeIncorrect =>
      'Image shape incorrect - ensure eye fills frame';

  @override
  String get errorNoEyeDetected => 'No eye detected - center iris in frame';

  @override
  String get errorNoPupilDetected => 'No pupil detected - ensure good lighting';

  @override
  String get errorNoIrisTexture => 'No iris texture - move closer to eye';

  @override
  String get errorUnusualColors =>
      'Unusual colors detected - avoid screens/reflections';

  @override
  String get errorTooManyEdges =>
      'Too many straight edges - this may not be an eye';

  @override
  String get errorNotValidEye => 'Not a valid eye image - please try again';

  @override
  String get holdStillCapturing => 'Hold still - capturing...';

  @override
  String get adjustDistanceFirst => 'Adjust distance first';

  @override
  String get stabilizingReading => 'Stabilizing...';

  @override
  String get autoCaptureWhenReady => 'Auto-capture when ready';

  @override
  String get tapOrWaitAutoCapture => 'Tap or wait for auto-capture';

  @override
  String get validatingImage => 'Validating...';

  @override
  String get capturingStatus => 'Capturing...';

  @override
  String get adjustPositionStatus => 'Adjust position';

  @override
  String get validationTip =>
      'Tip: Ensure good lighting, hold camera 10-15cm from eye, avoid reflections';

  @override
  String get validationChecksTitle => 'Validation Checks:';

  @override
  String confidenceLabel(int percent) {
    return 'Confidence: $percent%';
  }

  @override
  String get incompleteData => 'Incomplete data';

  @override
  String get irisDiameterLabel => 'iris ø';

  @override
  String get plrResponseCurve => 'PLR Response Curve';

  @override
  String get plrLatency => 'Latency';

  @override
  String get plrVelocity => 'Velocity';

  @override
  String get plrRecoveryTime => 'Rec. Time';

  @override
  String get plrRecoveryRatio => 'Rec. %';

  @override
  String get plrEnhancedMetrics => 'Enhanced PLR Metrics';

  @override
  String get plrNormalLatency => 'Normal: 200-500ms';

  @override
  String get plrNormalConstriction => 'Normal: 10-30%';

  @override
  String get plrNormalVelocity => 'Normal: 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'Normal PLR Reference Values';

  @override
  String get plrSubjectInfo => 'Subject Information';

  @override
  String get plrTestType => 'Pupillary Light Reflex';

  @override
  String get plrAnalysisSummary => 'Analysis Summary';

  @override
  String get plrTotalFrames => 'Total Frames Analyzed';

  @override
  String get plrSuccessRate => 'Success Rate';

  @override
  String get plrMaxConstriction => 'Max Constriction';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => 'Autonomic Nerve Wreath (ANW)';

  @override
  String get anwAbnormal => 'Abnormal';

  @override
  String get anwDiameter => 'Diameter';

  @override
  String get anwPerimeter => 'Perimeter';

  @override
  String get anwAsymmetry => 'Asymmetry';

  @override
  String get anwElevated => 'Elevated';

  @override
  String get anwFormType => 'Form Type';

  @override
  String get anwRegular => 'Regular';

  @override
  String get anwDrawnIn => 'Drawn In';

  @override
  String get anwIndented => 'Indented';

  @override
  String get anwLacerated => 'Lacerated';

  @override
  String get anwSpastic => 'Spastic';

  @override
  String get anwAtonic => 'Atonic';

  @override
  String get anwTonicState => 'Historical Tone Pattern';

  @override
  String get anwParasympathotonic => 'Parasympathotonic pattern';

  @override
  String get anwSympathotonicState => 'Sympathotonic pattern';

  @override
  String get anwShiftDetected => 'Historical Shift Pattern';

  @override
  String get anwConstrictionDetected => 'Constriction Detected';

  @override
  String get anwFindings => 'Findings';

  @override
  String get anwRatioComparison => 'ANW Ratio';

  @override
  String get bilateralANWComparison => 'Bilateral ANW Comparison';

  @override
  String get anwSymmetryNormal => 'ANW symmetry within normal limits.';

  @override
  String get anwAsymmetryDetected => 'ANW asymmetry detected between eyes.';

  @override
  String get functionalFrustration =>
      'Functional frustration in correlation between sympathetic and parasympathetic nervous systems.';

  @override
  String get anwParasympathotonicDesc =>
      'Historical observations linked this to increased liminal sensitivity. Reflex activity accelerated. GI secretory/evacuation functions heightened.';

  @override
  String get anwSympathotonicDesc =>
      'Historical observations linked this to decreased liminal sensitivity. Reflex activity decelerated. GI secretory/evacuation functions reduced.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Historical studies according to Velchover linked this to left-ventricular overload patterns and cardiac stress.';

  @override
  String get anwFrontalConstricted =>
      'Frontal zone of pupillary belt is constricted.';

  @override
  String get anwBasalConstricted =>
      'Basal zone of pupillary belt is constricted.';

  @override
  String get anwFrontalBasalConstricted =>
      'Frontal and basal zones of pupillary belt are constricted.';

  @override
  String get helpTitle => 'Help & User Guide';

  @override
  String get helpTabQuickStart => 'Quick Start';

  @override
  String get helpTabCnriAnalysis => 'CNRI Analysis';

  @override
  String get helpTabShortcuts => 'Shortcuts';

  @override
  String get helpTabTroubleshooting => 'Troubleshooting';

  @override
  String get helpOnlineDocs => 'Online Docs';

  @override
  String get helpContactSupport => 'Contact Support';

  @override
  String get helpGettingStarted => 'Getting Started';

  @override
  String get helpStep1Title => 'Connect Your Iriscope';

  @override
  String get helpStep1Desc =>
      'Connect your Dino-Lite or compatible USB iriscope.';

  @override
  String get helpStep2Title => 'Enter Patient Information';

  @override
  String get helpStep2Desc =>
      'Fill in patient name, age, sex, and chief complaints.';

  @override
  String get helpStep3Title => 'Capture Right Eye (OD)';

  @override
  String get helpStep3Desc =>
      'Position the iriscope and capture the right eye image.';

  @override
  String get helpStep4Title => 'Capture Left Eye (OS)';

  @override
  String get helpStep4Desc =>
      'Repeat for the left eye with consistent lighting.';

  @override
  String get helpStep5Title => 'Review Analysis';

  @override
  String get helpStep5Desc =>
      'The app analyzes P/I ratio, pupil form, and ANW characteristics.';

  @override
  String get helpStep6Title => 'Export Report';

  @override
  String get helpStep6Desc => 'Save as PDF, TXT, or JSON format.';

  @override
  String get helpTipBestResults =>
      'For best results: Use consistent lighting and maintain 2-3cm iriscope distance.';

  @override
  String get helpCnriProtocolFeatures => 'CNRI Protocol Features';

  @override
  String get helpFeaturePiRatioTitle => 'Pupil/Iris Ratio (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal: 20-30%. Values outside may indicate autonomic imbalance.';

  @override
  String get helpFeaturePupilFormTitle => 'Pupil Form Analysis';

  @override
  String get helpFeaturePupilFormDesc =>
      'Detects oval patterns, decentration direction, and eccentricity.';

  @override
  String get helpFeatureAnwTitle => 'ANW (Collarette) Assessment';

  @override
  String get helpFeatureAnwDesc =>
      'Analyzes ratio, form regularity, sector shifts, and tonic state.';

  @override
  String get helpFeatureZoneTitle => 'Zone Analysis';

  @override
  String get helpFeatureZoneDesc =>
      'Maps flattenings/protrusions to CNRI organ zones.';

  @override
  String get helpFeatureBilateralTitle => 'Bilateral Comparison';

  @override
  String get helpFeatureBilateralDesc =>
      'Compares OD vs OS to detect asymmetries.';

  @override
  String get helpFeatureMlTitle => 'ONNX CNN Comparison';

  @override
  String get helpFeatureMlDesc =>
      'ONNX CNN model provides secondary measurements for comparison.';

  @override
  String get helpKeyboardShortcuts => 'Keyboard Shortcuts';

  @override
  String get helpCameraControls => 'Camera Controls';

  @override
  String get helpShortcutSpace => 'Capture image';

  @override
  String get helpShortcutCtrlS => 'Save PDF report';

  @override
  String get helpShortcutCtrlO => 'Open gallery image';

  @override
  String get helpShortcutCtrlH => 'View scan history';

  @override
  String get helpShortcutF11 => 'Toggle fullscreen';

  @override
  String get helpShortcutEsc => 'Go back / Cancel';

  @override
  String get helpShortcutScroll => 'Zoom in/out';

  @override
  String get helpShortcutDoubleClick => 'Reset zoom';

  @override
  String get helpCommonIssues => 'Common Issues';

  @override
  String get helpIssueCameraNotDetected => 'Camera not detected';

  @override
  String get helpIssueCameraSolution1 => 'Check USB connection';

  @override
  String get helpIssueCameraSolution2 => 'Try different USB port';

  @override
  String get helpIssueCameraSolution3 => 'Install Dino-Lite drivers';

  @override
  String get helpIssueCameraSolution4 => 'Restart application';

  @override
  String get helpIssuePupilDetectionFails => 'Pupil detection fails';

  @override
  String get helpIssuePupilSolution1 => 'Ensure adequate lighting';

  @override
  String get helpIssuePupilSolution2 => 'Center pupil in frame';

  @override
  String get helpIssuePupilSolution3 => 'Clean iriscope lens';

  @override
  String get helpIssuePupilSolution4 => 'Adjust focus manually';

  @override
  String get helpIssuePdfExportFails => 'PDF export fails';

  @override
  String get helpIssuePdfSolution1 => 'Check folder permissions';

  @override
  String get helpIssuePdfSolution2 => 'Ensure disk space available';

  @override
  String get helpIssuePdfSolution3 => 'Close open PDF files';

  @override
  String get helpIssuePdfSolution4 => 'Try TXT export first';

  @override
  String get helpCaptureChecklistTitle => 'Capture Checklist';

  @override
  String get helpCaptureChecklist1 =>
      'Keep the pupil centered and fully visible inside the frame.';

  @override
  String get helpCaptureChecklist2 =>
      'Use even lighting and reduce glare or reflections on the cornea.';

  @override
  String get helpCaptureChecklist3 =>
      'Keep similar iriscope distance for right and left eyes.';

  @override
  String get helpCaptureChecklist4 =>
      'Refocus or retake if the pupil edge looks soft or blurred.';

  @override
  String get helpExportSettingsTitle => 'Export Settings';

  @override
  String get helpExportSettingsDesc =>
      'Auto-save PDF can save a report after analysis, Include Images controls whether eye photos appear in the PDF, and Show ML Comparison adds the ONNX CNN comparison values to reports.';

  @override
  String get helpHybridScoreTitle => 'Hybrid Confidence & Grade';

  @override
  String get helpHybridScoreDesc =>
      'Displayed confidence and grade combine classical geometry quality with ML agreement, so they reflect measurement reliability rather than a diagnosis.';

  @override
  String get helpAnomalyGuideTitle => 'Reading Flattenings & Protrusions';

  @override
  String get helpAnomalyGuideDesc =>
      'Flattenings indicate relative inward drawing and protrusions indicate outward drawing along the pupil boundary; each card lists the zone, magnitude, and mapped association.';

  @override
  String get helpZoneOverlayGuideTitle => 'Zone Overlay';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Use the zone overlay to inspect sector positions visually and cross-check where detected anomalies fall around the pupil and iris.';

  @override
  String get helpContactSupportTip =>
      'Contact helpdesk@cnri.edu for assistance.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsCameraIriscope => 'CAMERA / IRISCOPE';

  @override
  String get settingsPreferredCamera => 'Preferred Camera:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB Camera';

  @override
  String get settingsCameraAutoDetect => 'Auto-detect';

  @override
  String get settingsDefaultZoom => 'Default Zoom:';

  @override
  String get settingsAnalysis => 'ANALYSIS';

  @override
  String get settingsShowMlComparison => 'Show ML Comparison';

  @override
  String get settingsShowZoneOverlay => 'Show Zone Overlay';

  @override
  String get settingsExportReports => 'EXPORT & REPORTS';

  @override
  String get settingsAutoSavePdf => 'Auto-save PDF';

  @override
  String get settingsIncludeImages => 'Include Images';

  @override
  String get settingsSaved => 'Settings saved';

  @override
  String get aboutResearchEdition => 'Research Edition';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutLicense => 'License';

  @override
  String get aboutLicensedTo => 'Licensed To:';

  @override
  String get aboutExpires => 'Expires:';

  @override
  String get aboutManageLicense => 'Manage License';

  @override
  String get aboutBasedOnCnri => 'Based on CNRI Protocol';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Website';

  @override
  String get aboutPrivacy => 'Privacy';

  @override
  String get languageSelectTitle => 'Select Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get languageChanged => 'Language Changed';

  @override
  String languageChangedMessage(String language) {
    return 'App language set to $language';
  }

  @override
  String get languageSystemNotAvailable => 'Language system not available';

  @override
  String get licenseLoading => 'Loading...';

  @override
  String get licenseWelcome => 'Welcome to PupilMetrics!';

  @override
  String get licenseTrialFeatures => '14-day free trial • Full features';

  @override
  String get licenseStartTrial => 'Start Free Trial';

  @override
  String get licenseEnterKey => 'Enter License';

  @override
  String get licenseFreeTrial => 'Free Trial';

  @override
  String licenseDaysRemaining(int count) {
    return '$count days remaining';
  }

  @override
  String get licenseTrialEnded => 'Trial Ended';

  @override
  String get licenseEnterToContinue => 'Enter license to continue';

  @override
  String get licenseStandard => 'Standard License';

  @override
  String get licenseProfessional => 'Professional License';

  @override
  String get licenseEnterprise => 'Enterprise License';

  @override
  String get licenseLicensed => 'Licensed';

  @override
  String get licenseActive => 'Active';

  @override
  String get licenseTrialUser => 'Trial User';

  @override
  String get licenseLifetime => 'Lifetime';

  @override
  String get licenseNotSetUp => 'Not Set Up';

  @override
  String get trialExpiredTitle => 'Trial Period Ended';

  @override
  String get trialExpiredMessage =>
      'Your 14-day trial has ended. To continue analyzing iris images, please purchase a license.';

  @override
  String get trialExpiredCanStill => 'You can still:';

  @override
  String get trialExpiredViewAnalyses => 'View your previous analyses';

  @override
  String get trialExpiredExportReports => 'Export existing reports';

  @override
  String get trialExpiredAccessHistory => 'Access scan history';

  @override
  String get trialExpiredMaybeLater => 'Maybe Later';

  @override
  String get licenseRegistration => 'License Registration';

  @override
  String get licenseStatusValid => 'Licensed';

  @override
  String get licenseStatusTrialActive => 'Free Trial';

  @override
  String get licenseStatusTrialExpired => 'Trial Ended';

  @override
  String get licenseStatusExpired => 'License Expired';

  @override
  String get licenseStatusInvalid => 'Invalid License';

  @override
  String get licenseStatusUnregistered => 'Not Set Up';

  @override
  String get licenseStatusMachineMismatch => 'Different Computer';

  @override
  String get licenseStatusNetworkError => 'Connection Error';

  @override
  String get licenseEnterKeyTitle => 'Enter License Key';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Your Name';

  @override
  String get licenseEmailAddress => 'Email Address';

  @override
  String get licenseMachineId => 'Machine ID';

  @override
  String get licenseCopyMachineId => 'Copy Machine ID';

  @override
  String get licenseMachineIdCopied => 'Machine ID copied to clipboard';

  @override
  String get licenseValidationKeyRequired => 'Please enter your license key';

  @override
  String get licenseValidationKeyFormat =>
      'License key should be 20 characters (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Please enter your name';

  @override
  String get licenseValidationEmailRequired => 'Please enter your email';

  @override
  String get licenseValidationEmailInvalid => 'Please enter a valid email';

  @override
  String get licenseActivate => 'Activate License';

  @override
  String get licenseContinueTrial => 'Continue Trial';

  @override
  String get licenseBuyLicense => 'Buy License';

  @override
  String get licenseNeedHelp => 'Need help?';

  @override
  String get licenseLicenseAgreement => 'License Agreement';

  @override
  String get licenseActivatedSuccess => 'License Activated Successfully!';

  @override
  String get licenseMsgMachineMismatch =>
      'This license is registered to a different computer. Please use your original device or contact support.';

  @override
  String get licenseMsgTrialEnded =>
      'Your free trial has ended. Enter a license key to continue using all features.';

  @override
  String get licenseMsgExpired =>
      'Your license has expired. Please renew to continue.';

  @override
  String get licenseMsgNeedsSetup =>
      'License needs to be set up. Start your free trial or enter a license key.';

  @override
  String get licenseMsgCheckFormat =>
      'Please check your license key format. It should look like: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'This license key was not recognized. Please double-check and try again.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'This key is already registered to a different computer.';

  @override
  String get licenseMsgContactSupport =>
      'This license has expired. Please contact support for renewal.';

  @override
  String get licenseMsgActivatedThankYou =>
      'License activated successfully! Thank you for your purchase.';

  @override
  String get licenseMsgUnableToActivate =>
      'Unable to activate license. Please check your internet connection and try again.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Welcome! Your $days-day free trial has started.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Trial active: $days days remaining.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Free trial active';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'License active - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Unable to activate this license key.';

  @override
  String get licenseMsgNoLongerValid => 'License is no longer valid.';

  @override
  String get licenseMsgUnableToVerify =>
      'Unable to verify this license key. Please contact support.';

  @override
  String get trialStartedSnackbar => 'Trial Started!';

  @override
  String get trialStartedMessage => 'Enjoy 14 days of full access';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'ThemeMode';

  @override
  String get methods => 'METHODS';

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
  String get set => 'Set';

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
  String get defaultIcon => 'Default';

  @override
  String get original => 'Original';

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
  String get dragToResizeAreaExample => 'DragToResizeArea example';

  @override
  String get closeWindowConfirmation =>
      'Are you sure you want to close this window?';

  @override
  String get licenseChecking => 'Checking license...';

  @override
  String get licenseRequiredTitle => 'License Required';

  @override
  String get licenseActivateValidMessage =>
      'Please activate a valid license to continue.';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro includes:';

  @override
  String get licenseFeatureUnlimitedAnalysis =>
      'Unlimited pupil-collarette analysis';

  @override
  String get licenseFeaturePdfReports => 'PDF report generation';

  @override
  String get licenseFeatureBilateralComparison => 'Bilateral comparison';

  @override
  String get licenseFeatureAnwAnalysis => 'ANW collarette analysis';

  @override
  String get licenseFeatureScanHistory => 'Scan history database';

  @override
  String get licenseFeatureUpdates => 'Free updates for 1 year';

  @override
  String get licensePurchase => 'Purchase License';

  @override
  String get licenseExitApplication => 'Exit Application';

  @override
  String get windowCompactView => 'Compact View';

  @override
  String get windowExpandedView => 'Expanded View';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return 'Trial ($count days left)';
  }

  @override
  String get licenseNotLicensed => 'Not Licensed';

  @override
  String get licenseStatusTitle => 'License Status';

  @override
  String get unknown => 'Unknown';

  @override
  String get plrReportTitle => 'PLR Analysis Report';

  @override
  String get plrResearchOnlyTitle => 'RESEARCH/EDUCATIONAL TOOL ONLY';

  @override
  String get plrResearchDisclaimer =>
      'Results are NOT medical diagnoses. Consult healthcare professional.';

  @override
  String get plrNameLabel => 'Name';

  @override
  String plrAgeYears(int age) {
    return 'Age: $age years';
  }

  @override
  String get plrTestLabel => 'Test';

  @override
  String get plrSummaryTitle => 'PLR Summary';

  @override
  String plrGradeValue(String grade) {
    return 'Grade $grade';
  }

  @override
  String get plrStatusLabel => 'Status';

  @override
  String get plrDetectedStatus => 'PLR DETECTED';

  @override
  String get plrWeakNotDetectedStatus => 'WEAK/NOT DETECTED';

  @override
  String get plrRecoveryTimeLabel => 'Recovery Time';

  @override
  String get plrRecoveryRatioLabel => 'Recovery Ratio';

  @override
  String get plrChartDescription =>
      'Visual representation of pupil response over time';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I Range: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Frame Data';

  @override
  String get plrTableTime => 'Time';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Phase';

  @override
  String get plrTableConfidenceShort => 'Conf';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Successful: $success | Failed: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latency: 200-500ms (time to initial response)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Constriction: 10-30% reduction from baseline';

  @override
  String get plrReferenceVelocityLine => '• Velocity: 1.5-4.0%/second';

  @override
  String get plrReferenceRecoveryLine =>
      '• Recovery: >75% return to baseline within 5 seconds';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Recovery: >75% return to baseline within 5s';

  @override
  String plrShareSubject(String eye) {
    return 'PLR Analysis Report - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR VIDEO ANALYSIS REPORT';

  @override
  String get plrTextDisclaimerTitle =>
      'DISCLAIMER: Research/Educational Tool Only';

  @override
  String get plrTextDisclaimerBody => 'Results are NOT medical diagnoses.';

  @override
  String get plrOverallGradeLabel => 'Overall Grade';

  @override
  String get plrEndOfReport => 'END OF REPORT';

  @override
  String get zoneOverlay => 'Zone Overlay';

  @override
  String get tipDragImage =>
      'Tip: drag image to align limbus with overlay circles.';

  @override
  String get overlayMetrics => 'Overlay Metrics';

  @override
  String get piRatioLabel => 'P/I Ratio:';

  @override
  String get ellipsenessLabel => 'Ellipseness:';

  @override
  String get decentralizationLabel => 'Decentralization:';

  @override
  String get detectedFindings => 'Detected findings';

  @override
  String get anwCollarette => 'ANW / COLLARETTE';

  @override
  String get observerNotes => 'Observer notes';

  @override
  String get observerNotesHint =>
      'Enter clinical observations, zone findings, patterns…';

  @override
  String get autoCenter => 'Auto-center';

  @override
  String get anwRing => 'ANW Ring';

  @override
  String get axisGrid => 'Axis/Grid';

  @override
  String get chart => 'Chart';

  @override
  String get hoverToIdentify => 'Hover or tap a zone to identify';

  @override
  String get organsMode => 'Organs mode — hover iris to identify zones';

  @override
  String get mildSizeDiff =>
      'Mild size difference. May be physiological variation.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Within research baseline for age $age ($group)';
  }

  @override
  String get formLabel => 'Form:';

  @override
  String get flatteningLabel => 'Flattening:';

  @override
  String get protrusionLabel => 'Protrusion:';

  @override
  String get decentrationLabel => 'Decentration:';

  @override
  String get pupilSizeLabel => 'Pupil size:';

  @override
  String get anwRatioLabel => 'ANW ratio:';

  @override
  String get anwToneLabel => 'ANW tone:';

  @override
  String get noMajorODAnomalies => 'No major OD pupil anomalies.';

  @override
  String get noMajorOSAnomalies => 'No major OS pupil anomalies.';

  @override
  String get anwNotAssessed => 'ANW: not assessed';

  @override
  String get manualAlignmentAid =>
      'Manual alignment aid for review only (post-capture). Drag image or use Auto-center.';

  @override
  String get frontalShift => 'S: Frontal shift pattern.';

  @override
  String get cerebralCirculation =>
      'Historical studies according to Velchover linked this to cerebral circulation patterns.';

  @override
  String get middleTemporalShift => 'D: Middle-temporal shift pattern.';

  @override
  String get respiratoryCardiac =>
      'Historical studies according to Velchover linked this to respiratory and cardiac autonomic patterns.';

  @override
  String get findings => 'Findings:';

  @override
  String get analysisReportTitle => 'Pupil Analysis Report';

  @override
  String get reportResearchVersion => 'Research Version';

  @override
  String get reportDisclaimerTitle =>
      'DISCLAIMER: Research/Educational Tool Only';

  @override
  String get reportDisclaimerBody =>
      'Results are research observations, NOT medical diagnoses.';

  @override
  String get reportPersonInformationTitle => 'Person Information';

  @override
  String get reportAgeGroupLabel => 'Age Group';

  @override
  String get reportPupilSizeComparisonTitle => 'Pupil Size Comparison';

  @override
  String get reportCaptureDistanceMetricsTitle => 'Capture Distance Metrics';

  @override
  String get reportResearchObservationsTitle => 'Research Observations';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Observer Notes (Zone Overlay)';

  @override
  String get reportEndOfReport => 'END OF REPORT';

  @override
  String get reportGradeLabel => 'Grade';

  @override
  String get reportPupilFormTitle => 'Pupil Form';

  @override
  String get reportDecentrationTitle => 'Decentration';

  @override
  String get reportFlatteningsTitle => 'Flattenings';

  @override
  String get reportProtrusionsTitle => 'Protrusions';

  @override
  String get reportAnwParametersTitle => 'Autonomic Nerve Wreath (ANW)';

  @override
  String get reportTonicStateLabel => 'Historical Tone Pattern';

  @override
  String get reportShiftDetectedTitle => 'Historical Shift Pattern';

  @override
  String get reportClinicalLabel => 'Historical Note';

  @override
  String get reportConstrictionDetectedTitle => 'Constriction Detected';

  @override
  String get reportSeverityLabel => 'Severity';

  @override
  String get reportReferenceValuesTitle =>
      'Reference Values (CNRI Research Protocol)';

  @override
  String get reportMatchLabel => 'Match';

  @override
  String get reportValueLabel => 'Value';

  @override
  String get reportNormalPupilForm => 'Normal pupil form';

  @override
  String reportPageXofY(int page, int total) {
    return 'Page $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Pupil Analysis Report - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Attached is the pupil analysis report for $patientName, generated on $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Below research baseline for age $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Above research baseline for age $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Infant';

  @override
  String get ageGroupChild15 => 'Child (1-5)';

  @override
  String get ageGroupChild611 => 'Child (6-11)';

  @override
  String get ageGroupTeen => 'Teen';

  @override
  String get ageGroupAdult2039 => 'Adult (20-39)';

  @override
  String get ageGroupAdult4059 => 'Adult (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Senior (60+)';

  @override
  String get middleNasalShift => 'Middle-nasal shift pattern.';

  @override
  String get upperTemporalShift => 'Upper-temporal shift pattern.';

  @override
  String get lowerTemporalShift => 'Lower-temporal shift pattern.';

  @override
  String get basalShift => 'Basal shift pattern.';

  @override
  String get vagusStellateAssociation =>
      'Historical studies according to Velchover linked this to hypofunction patterns of the vagus nerve or stellate ganglion.';

  @override
  String get venaCavaInferiorAssociation =>
      'Historical studies according to Velchover linked this to hemodynamic disturbance patterns in the inferior vena cava.';

  @override
  String get vertebralArteryAssociation =>
      'Historical studies according to Velchover linked this to vertebral artery circulation patterns.';

  @override
  String get smallPelvisAssociation =>
      'Historical studies according to Velchover linked this to congestive patterns in the small pelvis.';

  @override
  String get openZoneOverlay => 'Open zone overlay';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'Chart opacity';

  @override
  String get irisSizeNotAvailable => 'Iris size data not available';

  @override
  String get ratio => 'Ratio';

  @override
  String get reportRefPiRatio => 'Pupil/Iris Ratio: Normal 20-30%';

  @override
  String get reportRefEllipseness => 'Ellipseness: Normal >95%';

  @override
  String get reportRefDecentralization => 'Decentralization: Normal <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Pupil Size Diff: <2% Normal, 2-4% Mild, >4% Significant';
}
