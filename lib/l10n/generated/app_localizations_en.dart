// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics Research';

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
  String get center => 'Center';

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
    return 'Delete PLR analysis for $name ($eye)?\n\nThis cannot be undone.';
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
  String get close => 'Close';

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
    return 'Position the $eye eye within the circle.\nKeep steady during the $seconds-second recording.';
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
      '1. Position the eye within the guide circle\n2. Tap \"Start PLR Recording\"\n3. Hold steady for 10 seconds\n4. A flash will occur at 3 seconds\n5. The app records pupil response';

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
  String get anwRatio => 'ANW Ratio';

  @override
  String get normal => 'Normal';

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
}
