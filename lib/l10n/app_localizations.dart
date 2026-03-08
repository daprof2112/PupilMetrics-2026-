import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'PupilMetrics'**
  String get appTitle;

  /// No description provided for @analyzeButton.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get analyzeButton;

  /// No description provided for @plrModes.
  ///
  /// In en, this message translates to:
  /// **'PLR Modes'**
  String get plrModes;

  /// No description provided for @captureInstructions.
  ///
  /// In en, this message translates to:
  /// **'Position eye within the guide circle'**
  String get captureInstructions;

  /// No description provided for @scanHistory.
  ///
  /// In en, this message translates to:
  /// **'Scan History'**
  String get scanHistory;

  /// No description provided for @selectCameraMode.
  ///
  /// In en, this message translates to:
  /// **'Select Camera Mode'**
  String get selectCameraMode;

  /// No description provided for @loadFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Load from Gallery'**
  String get loadFromGallery;

  /// No description provided for @rightEyePhoto.
  ///
  /// In en, this message translates to:
  /// **'Right Eye Photo'**
  String get rightEyePhoto;

  /// No description provided for @leftEyePhoto.
  ///
  /// In en, this message translates to:
  /// **'Left Eye Photo'**
  String get leftEyePhoto;

  /// No description provided for @autoCapture.
  ///
  /// In en, this message translates to:
  /// **'Auto-Capture'**
  String get autoCapture;

  /// No description provided for @autoCaptureDesc.
  ///
  /// In en, this message translates to:
  /// **'Eye detection + 5-second auto-capture'**
  String get autoCaptureDesc;

  /// No description provided for @manualCapture.
  ///
  /// In en, this message translates to:
  /// **'Manual Capture'**
  String get manualCapture;

  /// No description provided for @manualCaptureDesc.
  ///
  /// In en, this message translates to:
  /// **'Eye detection + manual capture (back camera)'**
  String get manualCaptureDesc;

  /// No description provided for @selfieMode.
  ///
  /// In en, this message translates to:
  /// **'Selfie Mode'**
  String get selfieMode;

  /// No description provided for @selfieModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Eye detection + 5-sec auto-capture (front camera)'**
  String get selfieModeDesc;

  /// No description provided for @plrVideoRear.
  ///
  /// In en, this message translates to:
  /// **'PLR Video (Rear)'**
  String get plrVideoRear;

  /// No description provided for @plrVideoRearDesc.
  ///
  /// In en, this message translates to:
  /// **'Back camera • 10-sec capture'**
  String get plrVideoRearDesc;

  /// No description provided for @plrVideoSelfie.
  ///
  /// In en, this message translates to:
  /// **'PLR Video (Selfie)'**
  String get plrVideoSelfie;

  /// No description provided for @plrVideoSelfieDesc.
  ///
  /// In en, this message translates to:
  /// **'Front camera • 10-sec capture'**
  String get plrVideoSelfieDesc;

  /// No description provided for @plrVideoCapture.
  ///
  /// In en, this message translates to:
  /// **'PLR Video Capture'**
  String get plrVideoCapture;

  /// No description provided for @frontCamera.
  ///
  /// In en, this message translates to:
  /// **'Front Camera'**
  String get frontCamera;

  /// No description provided for @rearCamera.
  ///
  /// In en, this message translates to:
  /// **'Rear Camera'**
  String get rearCamera;

  /// No description provided for @selectEyeToAssess.
  ///
  /// In en, this message translates to:
  /// **'Select which eye to assess'**
  String get selectEyeToAssess;

  /// No description provided for @rightEyeOD.
  ///
  /// In en, this message translates to:
  /// **'Right Eye (OD)'**
  String get rightEyeOD;

  /// No description provided for @leftEyeOS.
  ///
  /// In en, this message translates to:
  /// **'Left Eye (OS)'**
  String get leftEyeOS;

  /// No description provided for @recordPlrRightEye.
  ///
  /// In en, this message translates to:
  /// **'Record PLR for right eye'**
  String get recordPlrRightEye;

  /// No description provided for @recordPlrLeftEye.
  ///
  /// In en, this message translates to:
  /// **'Record PLR for left eye'**
  String get recordPlrLeftEye;

  /// No description provided for @loadRightEyeImage.
  ///
  /// In en, this message translates to:
  /// **'Load right eye image'**
  String get loadRightEyeImage;

  /// No description provided for @loadLeftEyeImage.
  ///
  /// In en, this message translates to:
  /// **'Load left eye image'**
  String get loadLeftEyeImage;

  /// No description provided for @bothEyes.
  ///
  /// In en, this message translates to:
  /// **'Both Eyes'**
  String get bothEyes;

  /// No description provided for @loadBothEyesDesc.
  ///
  /// In en, this message translates to:
  /// **'Load right eye, then left eye'**
  String get loadBothEyesDesc;

  /// No description provided for @selectEyeImageFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Select an eye image from your device'**
  String get selectEyeImageFromDevice;

  /// No description provided for @selectRightEyeFirst.
  ///
  /// In en, this message translates to:
  /// **'Select RIGHT eye (OD) image first'**
  String get selectRightEyeFirst;

  /// No description provided for @rightEyeSaved.
  ///
  /// In en, this message translates to:
  /// **'Right eye saved. Now select LEFT eye (OS) image'**
  String get rightEyeSaved;

  /// No description provided for @cancelledNoRightEye.
  ///
  /// In en, this message translates to:
  /// **'Cancelled - no right eye selected'**
  String get cancelledNoRightEye;

  /// No description provided for @cancelledNoLeftEye.
  ///
  /// In en, this message translates to:
  /// **'Cancelled - no left eye selected'**
  String get cancelledNoLeftEye;

  /// No description provided for @errorLoadingImages.
  ///
  /// In en, this message translates to:
  /// **'Error loading images: {error}'**
  String errorLoadingImages(String error);

  /// No description provided for @crop43.
  ///
  /// In en, this message translates to:
  /// **'Crop (4:3)'**
  String get crop43;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @imageCroppedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Image cropped successfully!'**
  String get imageCroppedSuccess;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @cropFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to crop image. Please try again.'**
  String get cropFailed;

  /// No description provided for @crop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get crop;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved! ✅'**
  String get saved;

  /// No description provided for @imageSavedToGallery.
  ///
  /// In en, this message translates to:
  /// **'Image saved successfully in gallery'**
  String get imageSavedToGallery;

  /// No description provided for @exposure.
  ///
  /// In en, this message translates to:
  /// **'Exposure'**
  String get exposure;

  /// No description provided for @flash.
  ///
  /// In en, this message translates to:
  /// **'Flash'**
  String get flash;

  /// No description provided for @eye.
  ///
  /// In en, this message translates to:
  /// **'Eye'**
  String get eye;

  /// No description provided for @center.
  ///
  /// In en, this message translates to:
  /// **'center'**
  String get center;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @on.
  ///
  /// In en, this message translates to:
  /// **'ON'**
  String get on;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'OFF'**
  String get off;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'AUTO'**
  String get auto;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'MANUAL'**
  String get manual;

  /// No description provided for @selfie.
  ///
  /// In en, this message translates to:
  /// **'SELFIE'**
  String get selfie;

  /// No description provided for @pupil.
  ///
  /// In en, this message translates to:
  /// **'PUPIL'**
  String get pupil;

  /// No description provided for @plrHistory.
  ///
  /// In en, this message translates to:
  /// **'PLR History'**
  String get plrHistory;

  /// No description provided for @searchByName.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get searchByName;

  /// No description provided for @totalScans.
  ///
  /// In en, this message translates to:
  /// **'Total Scans'**
  String get totalScans;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @patients.
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patients;

  /// No description provided for @detected.
  ///
  /// In en, this message translates to:
  /// **'Detected'**
  String get detected;

  /// No description provided for @noPlrRecordsYet.
  ///
  /// In en, this message translates to:
  /// **'No PLR records yet'**
  String get noPlrRecordsYet;

  /// No description provided for @recordPlrVideoToSeeHistory.
  ///
  /// In en, this message translates to:
  /// **'Record a PLR video to see history here'**
  String get recordPlrVideoToSeeHistory;

  /// No description provided for @deleteRecord.
  ///
  /// In en, this message translates to:
  /// **'Delete Record?'**
  String get deleteRecord;

  /// No description provided for @deleteRecordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete PLR analysis for {name} ({eye})?\\n\\nThis cannot be undone.'**
  String deleteRecordConfirm(String name, String eye);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @recordDeleted.
  ///
  /// In en, this message translates to:
  /// **'Record deleted'**
  String get recordDeleted;

  /// No description provided for @plrAnalysis.
  ///
  /// In en, this message translates to:
  /// **'PLR Analysis - {eye}'**
  String plrAnalysis(String eye);

  /// No description provided for @patient.
  ///
  /// In en, this message translates to:
  /// **'Patient'**
  String get patient;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @frames.
  ///
  /// In en, this message translates to:
  /// **'Frames'**
  String get frames;

  /// No description provided for @baselinePiRatio.
  ///
  /// In en, this message translates to:
  /// **'Baseline P/I'**
  String get baselinePiRatio;

  /// No description provided for @minPiRatio.
  ///
  /// In en, this message translates to:
  /// **'Min P/I'**
  String get minPiRatio;

  /// No description provided for @plrMagnitude.
  ///
  /// In en, this message translates to:
  /// **'PLR Magnitude'**
  String get plrMagnitude;

  /// No description provided for @constriction.
  ///
  /// In en, this message translates to:
  /// **'Constriction'**
  String get constriction;

  /// No description provided for @plrDetected.
  ///
  /// In en, this message translates to:
  /// **'PLR Detected'**
  String get plrDetected;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;

  /// No description provided for @grade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get grade;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @na.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get na;

  /// No description provided for @takeLeftEyePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Left Eye Photo'**
  String get takeLeftEyePhoto;

  /// No description provided for @takeRightEyePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Right Eye Photo'**
  String get takeRightEyePhoto;

  /// No description provided for @nowTakingLeftEye.
  ///
  /// In en, this message translates to:
  /// **'Now taking LEFT eye (OS)'**
  String get nowTakingLeftEye;

  /// No description provided for @startingWithRightEye.
  ///
  /// In en, this message translates to:
  /// **'Starting with RIGHT eye (OD)'**
  String get startingWithRightEye;

  /// No description provided for @captured.
  ///
  /// In en, this message translates to:
  /// **'Captured ✓'**
  String get captured;

  /// No description provided for @useSameDistanceLighting.
  ///
  /// In en, this message translates to:
  /// **'Use the same distance and lighting as the right eye for accurate comparison.'**
  String get useSameDistanceLighting;

  /// No description provided for @step1of2.
  ///
  /// In en, this message translates to:
  /// **'Step 1 of 2'**
  String get step1of2;

  /// No description provided for @step2of2.
  ///
  /// In en, this message translates to:
  /// **'Step 2 of 2'**
  String get step2of2;

  /// No description provided for @bothEyesCaptured.
  ///
  /// In en, this message translates to:
  /// **'Both eyes captured ✓'**
  String get bothEyesCaptured;

  /// No description provided for @continueToLeftEye.
  ///
  /// In en, this message translates to:
  /// **'Continue to Left Eye'**
  String get continueToLeftEye;

  /// No description provided for @retakeOD.
  ///
  /// In en, this message translates to:
  /// **'Retake OD'**
  String get retakeOD;

  /// No description provided for @retakeOS.
  ///
  /// In en, this message translates to:
  /// **'Retake OS'**
  String get retakeOS;

  /// No description provided for @retakeRightEye.
  ///
  /// In en, this message translates to:
  /// **'Retake Right Eye'**
  String get retakeRightEye;

  /// No description provided for @analyzeBothEyes.
  ///
  /// In en, this message translates to:
  /// **'Analyze Both Eyes'**
  String get analyzeBothEyes;

  /// No description provided for @patientInfoMissing.
  ///
  /// In en, this message translates to:
  /// **'Patient Info Missing'**
  String get patientInfoMissing;

  /// No description provided for @rightEyePhotoMissing.
  ///
  /// In en, this message translates to:
  /// **'Right eye photo missing!'**
  String get rightEyePhotoMissing;

  /// No description provided for @patientInfoMissingRestart.
  ///
  /// In en, this message translates to:
  /// **'Patient info missing. Please restart.'**
  String get patientInfoMissingRestart;

  /// No description provided for @exitApp.
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitApp;

  /// No description provided for @tipsForBestResults.
  ///
  /// In en, this message translates to:
  /// **'TIPS FOR BEST RESULTS'**
  String get tipsForBestResults;

  /// No description provided for @followGuidelinesForQuality.
  ///
  /// In en, this message translates to:
  /// **'Follow these guidelines for optimal image quality'**
  String get followGuidelinesForQuality;

  /// No description provided for @cameraDistance.
  ///
  /// In en, this message translates to:
  /// **'Camera Distance'**
  String get cameraDistance;

  /// No description provided for @cameraDistanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep camera 4-6 inches from your eye. Maintain same distance for both eyes.'**
  String get cameraDistanceDesc;

  /// No description provided for @lightingPosition.
  ///
  /// In en, this message translates to:
  /// **'Lighting Position'**
  String get lightingPosition;

  /// No description provided for @lightingPositionDesc.
  ///
  /// In en, this message translates to:
  /// **'Position light source inside or outside pupil borders. Try gazing toward camera flash.'**
  String get lightingPositionDesc;

  /// No description provided for @avoidReflections.
  ///
  /// In en, this message translates to:
  /// **'Avoid Reflections'**
  String get avoidReflections;

  /// No description provided for @avoidReflectionsDesc.
  ///
  /// In en, this message translates to:
  /// **'Reduce reflections by avoiding window glare, mirrors, and direct lamps.'**
  String get avoidReflectionsDesc;

  /// No description provided for @centerYourEye.
  ///
  /// In en, this message translates to:
  /// **'Center Your Eye'**
  String get centerYourEye;

  /// No description provided for @centerYourEyeDesc.
  ///
  /// In en, this message translates to:
  /// **'Ensure entire eye including sclera (white part) is centered and fills the frame.'**
  String get centerYourEyeDesc;

  /// No description provided for @cropProperly.
  ///
  /// In en, this message translates to:
  /// **'Crop Properly'**
  String get cropProperly;

  /// No description provided for @cropProperlyDesc.
  ///
  /// In en, this message translates to:
  /// **'Crop image with eye in center. Image will auto-save in 4:3 aspect ratio.'**
  String get cropProperlyDesc;

  /// No description provided for @importantInformation.
  ///
  /// In en, this message translates to:
  /// **'Important Information'**
  String get importantInformation;

  /// No description provided for @imageRatio43.
  ///
  /// In en, this message translates to:
  /// **'4:3 image ratio for medical imaging standard'**
  String get imageRatio43;

  /// No description provided for @forClinicalUseCnri.
  ///
  /// In en, this message translates to:
  /// **'For clinical use with CNRI (cnri.edu)'**
  String get forClinicalUseCnri;

  /// No description provided for @noMedicalDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Does not provide medical diagnosis'**
  String get noMedicalDiagnosis;

  /// No description provided for @eyeWideOpenClear.
  ///
  /// In en, this message translates to:
  /// **'Make sure your eye is wide open and the picture is clear'**
  String get eyeWideOpenClear;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @personInformation.
  ///
  /// In en, this message translates to:
  /// **'Person Information'**
  String get personInformation;

  /// No description provided for @enterPersonDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter Person Details'**
  String get enterPersonDetails;

  /// No description provided for @infoIncludedInReport.
  ///
  /// In en, this message translates to:
  /// **'This information will be included in the analysis report'**
  String get infoIncludedInReport;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterPersonName.
  ///
  /// In en, this message translates to:
  /// **'Enter person name'**
  String get enterPersonName;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @ageYears.
  ///
  /// In en, this message translates to:
  /// **'Age (years)'**
  String get ageYears;

  /// No description provided for @enterAge.
  ///
  /// In en, this message translates to:
  /// **'Enter age'**
  String get enterAge;

  /// No description provided for @ageRequired.
  ///
  /// In en, this message translates to:
  /// **'Age is required'**
  String get ageRequired;

  /// No description provided for @enterValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get enterValidNumber;

  /// No description provided for @enterValidAge.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid age (0-120)'**
  String get enterValidAge;

  /// No description provided for @mainComplaints.
  ///
  /// In en, this message translates to:
  /// **'Main Complaints'**
  String get mainComplaints;

  /// No description provided for @mainComplaintsOptional.
  ///
  /// In en, this message translates to:
  /// **'Main Complaints (optional)'**
  String get mainComplaintsOptional;

  /// No description provided for @complaintsHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., headaches, vision problems, fatigue...'**
  String get complaintsHint;

  /// No description provided for @continueToCaptire.
  ///
  /// In en, this message translates to:
  /// **'Continue to Capture'**
  String get continueToCaptire;

  /// No description provided for @ageImportantNote.
  ///
  /// In en, this message translates to:
  /// **'Age is important for accurate pupil size assessment as normal ranges vary by age.'**
  String get ageImportantNote;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @pleaseSelectGender.
  ///
  /// In en, this message translates to:
  /// **'Please select gender!'**
  String get pleaseSelectGender;

  /// No description provided for @applicationSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Your application has been successfully submitted.'**
  String get applicationSubmitted;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type:'**
  String get type;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender:'**
  String get gender;

  /// No description provided for @rightHanded.
  ///
  /// In en, this message translates to:
  /// **'Right-handed'**
  String get rightHanded;

  /// No description provided for @leftHanded.
  ///
  /// In en, this message translates to:
  /// **'Left-handed'**
  String get leftHanded;

  /// No description provided for @partialLeftHandedness.
  ///
  /// In en, this message translates to:
  /// **'Partial Left-handedness'**
  String get partialLeftHandedness;

  /// No description provided for @retrainedLeftHandedness.
  ///
  /// In en, this message translates to:
  /// **'Retrained Left-handedness'**
  String get retrainedLeftHandedness;

  /// No description provided for @bilateralUseBothHands.
  ///
  /// In en, this message translates to:
  /// **'Bilateral use of both hands'**
  String get bilateralUseBothHands;

  /// No description provided for @splashTitle.
  ///
  /// In en, this message translates to:
  /// **'PupilMetrics Eye Capture'**
  String get splashTitle;

  /// No description provided for @splashDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Program Developer - Bryan K. Marcia, Ph.D.'**
  String get splashDeveloper;

  /// No description provided for @researchEducationalTool.
  ///
  /// In en, this message translates to:
  /// **'Research/Educational Tool'**
  String get researchEducationalTool;

  /// No description provided for @startNewAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Start New Analysis'**
  String get startNewAnalysis;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistory;

  /// No description provided for @viewResearchDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'View Research Disclaimer'**
  String get viewResearchDisclaimer;

  /// No description provided for @researchDisclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Research/Educational Tool'**
  String get researchDisclaimerTitle;

  /// No description provided for @researchDisclaimerNotMedical.
  ///
  /// In en, this message translates to:
  /// **'NOT a medical device'**
  String get researchDisclaimerNotMedical;

  /// No description provided for @researchDisclaimerNotClinical.
  ///
  /// In en, this message translates to:
  /// **'NOT for clinical diagnosis'**
  String get researchDisclaimerNotClinical;

  /// No description provided for @researchDisclaimerResults.
  ///
  /// In en, this message translates to:
  /// **'Results are research observations'**
  String get researchDisclaimerResults;

  /// No description provided for @researchDisclaimerConsult.
  ///
  /// In en, this message translates to:
  /// **'Always consult healthcare professionals'**
  String get researchDisclaimerConsult;

  /// No description provided for @researchDisclaimerAcknowledge.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you acknowledge this is a research tool and should not be used for medical decisions.'**
  String get researchDisclaimerAcknowledge;

  /// No description provided for @researchDisclaimerWarning.
  ///
  /// In en, this message translates to:
  /// **'This app is for RESEARCH and EDUCATIONAL purposes only.'**
  String get researchDisclaimerWarning;

  /// No description provided for @iUnderstand.
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get iUnderstand;

  /// No description provided for @plrAnalysisTest.
  ///
  /// In en, this message translates to:
  /// **'PLR Analysis Test'**
  String get plrAnalysisTest;

  /// No description provided for @checkingVideoFile.
  ///
  /// In en, this message translates to:
  /// **'Checking video file...'**
  String get checkingVideoFile;

  /// No description provided for @processingFrame.
  ///
  /// In en, this message translates to:
  /// **'Processing frame {current}/{total} ({timestamp}ms)...'**
  String processingFrame(int current, int total, int timestamp);

  /// No description provided for @analysisComplete.
  ///
  /// In en, this message translates to:
  /// **'Analysis complete!'**
  String get analysisComplete;

  /// No description provided for @errorVideoNotFound.
  ///
  /// In en, this message translates to:
  /// **'Error: Video file not found'**
  String get errorVideoNotFound;

  /// No description provided for @waitingForResults.
  ///
  /// In en, this message translates to:
  /// **'Waiting for results...'**
  String get waitingForResults;

  /// No description provided for @baseline.
  ///
  /// In en, this message translates to:
  /// **'Baseline'**
  String get baseline;

  /// No description provided for @flashPhase.
  ///
  /// In en, this message translates to:
  /// **'Flash'**
  String get flashPhase;

  /// No description provided for @constrictionPhase.
  ///
  /// In en, this message translates to:
  /// **'Constrict'**
  String get constrictionPhase;

  /// No description provided for @recovery.
  ///
  /// In en, this message translates to:
  /// **'Recovery'**
  String get recovery;

  /// No description provided for @plrDetectedExclaim.
  ///
  /// In en, this message translates to:
  /// **'PLR DETECTED!'**
  String get plrDetectedExclaim;

  /// No description provided for @plrWeakNotDetected.
  ///
  /// In en, this message translates to:
  /// **'PLR Weak/Not Detected'**
  String get plrWeakNotDetected;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @plr.
  ///
  /// In en, this message translates to:
  /// **'PLR'**
  String get plr;

  /// No description provided for @constrLabel.
  ///
  /// In en, this message translates to:
  /// **'Constr.'**
  String get constrLabel;

  /// No description provided for @saveToHistory.
  ///
  /// In en, this message translates to:
  /// **'Save to History'**
  String get saveToHistory;

  /// No description provided for @txt.
  ///
  /// In en, this message translates to:
  /// **'TXT'**
  String get txt;

  /// No description provided for @json.
  ///
  /// In en, this message translates to:
  /// **'JSON'**
  String get json;

  /// No description provided for @saveFrames.
  ///
  /// In en, this message translates to:
  /// **'Save Frames'**
  String get saveFrames;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @frameSavedToGallery.
  ///
  /// In en, this message translates to:
  /// **'Frame saved to gallery!'**
  String get frameSavedToGallery;

  /// No description provided for @failedToSaveFrame.
  ///
  /// In en, this message translates to:
  /// **'Failed to save frame'**
  String get failedToSaveFrame;

  /// No description provided for @framesSavedToGallery.
  ///
  /// In en, this message translates to:
  /// **'{count} frames saved to gallery!'**
  String framesSavedToGallery(int count);

  /// No description provided for @jsonCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'JSON copied to clipboard!'**
  String get jsonCopiedToClipboard;

  /// No description provided for @reportCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Report copied to clipboard!'**
  String get reportCopiedToClipboard;

  /// No description provided for @shareFailedError.
  ///
  /// In en, this message translates to:
  /// **'Share failed: {error}'**
  String shareFailedError(String error);

  /// No description provided for @savedToHistoryId.
  ///
  /// In en, this message translates to:
  /// **'Saved to history! (ID: {id})'**
  String savedToHistoryId(int id);

  /// No description provided for @failedToSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {error}'**
  String failedToSave(String error);

  /// No description provided for @noSuccessfulFramesToSave.
  ///
  /// In en, this message translates to:
  /// **'No successful frames to save'**
  String get noSuccessfulFramesToSave;

  /// No description provided for @saveAllFrames.
  ///
  /// In en, this message translates to:
  /// **'Save All Frames'**
  String get saveAllFrames;

  /// No description provided for @shareReport.
  ///
  /// In en, this message translates to:
  /// **'Share Report'**
  String get shareReport;

  /// No description provided for @shareJson.
  ///
  /// In en, this message translates to:
  /// **'Share JSON'**
  String get shareJson;

  /// No description provided for @rerunTest.
  ///
  /// In en, this message translates to:
  /// **'Re-run test'**
  String get rerunTest;

  /// No description provided for @videoCaptureTitle.
  ///
  /// In en, this message translates to:
  /// **'PLR - {eye}'**
  String videoCaptureTitle(String eye);

  /// No description provided for @initializingCamera.
  ///
  /// In en, this message translates to:
  /// **'Initializing camera...'**
  String get initializingCamera;

  /// No description provided for @usingCamera.
  ///
  /// In en, this message translates to:
  /// **'Using {camera} camera'**
  String usingCamera(String camera);

  /// No description provided for @cameraError.
  ///
  /// In en, this message translates to:
  /// **'Camera error: {error}'**
  String cameraError(String error);

  /// No description provided for @noCamerasFound.
  ///
  /// In en, this message translates to:
  /// **'No cameras found'**
  String get noCamerasFound;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @startPlrRecording.
  ///
  /// In en, this message translates to:
  /// **'Start PLR Recording'**
  String get startPlrRecording;

  /// No description provided for @stopRecording.
  ///
  /// In en, this message translates to:
  /// **'Stop Recording'**
  String get stopRecording;

  /// No description provided for @phaseReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get phaseReady;

  /// No description provided for @phaseStarting.
  ///
  /// In en, this message translates to:
  /// **'Starting...'**
  String get phaseStarting;

  /// No description provided for @phaseBaseline.
  ///
  /// In en, this message translates to:
  /// **'Baseline (0-{sec}s)'**
  String phaseBaseline(int sec);

  /// No description provided for @phaseFlash.
  ///
  /// In en, this message translates to:
  /// **'FLASH!'**
  String get phaseFlash;

  /// No description provided for @phaseConstriction.
  ///
  /// In en, this message translates to:
  /// **'Constriction ({start}-{end}s)'**
  String phaseConstriction(int start, int end);

  /// No description provided for @phaseRecovery.
  ///
  /// In en, this message translates to:
  /// **'Recovery ({start}-{end}s)'**
  String phaseRecovery(int start, int end);

  /// No description provided for @phaseComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete!'**
  String get phaseComplete;

  /// No description provided for @readyDesc.
  ///
  /// In en, this message translates to:
  /// **'Position eye in the circle, then tap Start'**
  String get readyDesc;

  /// No description provided for @holdSteady.
  ///
  /// In en, this message translates to:
  /// **'Hold steady...'**
  String get holdSteady;

  /// No description provided for @recordingBaselinePupil.
  ///
  /// In en, this message translates to:
  /// **'Recording baseline pupil size'**
  String get recordingBaselinePupil;

  /// No description provided for @lightStimulus.
  ///
  /// In en, this message translates to:
  /// **'Light stimulus ({ms}ms)'**
  String lightStimulus(int ms);

  /// No description provided for @measuringConstriction.
  ///
  /// In en, this message translates to:
  /// **'Measuring pupil constriction'**
  String get measuringConstriction;

  /// No description provided for @measuringRecovery.
  ///
  /// In en, this message translates to:
  /// **'Measuring pupil recovery'**
  String get measuringRecovery;

  /// No description provided for @plrRecordingComplete.
  ///
  /// In en, this message translates to:
  /// **'PLR recording complete'**
  String get plrRecordingComplete;

  /// No description provided for @positionEyeInstruction.
  ///
  /// In en, this message translates to:
  /// **'Position the {eye} eye within the circle.\\nKeep steady during the {seconds}-second recording.'**
  String positionEyeInstruction(String eye, int seconds);

  /// No description provided for @keepEyeSteadyFlash.
  ///
  /// In en, this message translates to:
  /// **'Keep eye steady. Flash will occur at {sec} seconds.'**
  String keepEyeSteadyFlash(int sec);

  /// No description provided for @recordingComplete.
  ///
  /// In en, this message translates to:
  /// **'Recording Complete'**
  String get recordingComplete;

  /// No description provided for @plrVideoCapturedSuccess.
  ///
  /// In en, this message translates to:
  /// **'PLR video captured successfully!'**
  String get plrVideoCapturedSuccess;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @frameRate.
  ///
  /// In en, this message translates to:
  /// **'Frame Rate'**
  String get frameRate;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @flashAt.
  ///
  /// In en, this message translates to:
  /// **'At {sec}s ({ms}ms)'**
  String flashAt(int sec, int ms);

  /// No description provided for @phases.
  ///
  /// In en, this message translates to:
  /// **'Phases'**
  String get phases;

  /// No description provided for @phasesFlow.
  ///
  /// In en, this message translates to:
  /// **'Baseline → Flash → Constriction → Recovery'**
  String get phasesFlow;

  /// No description provided for @expectedNormalValues.
  ///
  /// In en, this message translates to:
  /// **'Expected Normal Values:'**
  String get expectedNormalValues;

  /// No description provided for @latency.
  ///
  /// In en, this message translates to:
  /// **'Latency'**
  String get latency;

  /// No description provided for @velocity.
  ///
  /// In en, this message translates to:
  /// **'Velocity'**
  String get velocity;

  /// No description provided for @testFrameAnalysis.
  ///
  /// In en, this message translates to:
  /// **'🧪 Test Frame Analysis'**
  String get testFrameAnalysis;

  /// No description provided for @retake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retake;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @plrVideoModeTitle.
  ///
  /// In en, this message translates to:
  /// **'PLR Video Mode'**
  String get plrVideoModeTitle;

  /// No description provided for @plrAssessmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Pupillary Light Reflex (PLR) Assessment'**
  String get plrAssessmentTitle;

  /// No description provided for @plrInstructions.
  ///
  /// In en, this message translates to:
  /// **'1. Position the eye within the guide circle\\n2. Tap \"Start PLR Recording\"\\n3. Hold steady for 10 seconds\\n4. A flash will occur at 3 seconds\\n5. The app records pupil response'**
  String get plrInstructions;

  /// No description provided for @recordingPhases.
  ///
  /// In en, this message translates to:
  /// **'Recording Phases:'**
  String get recordingPhases;

  /// No description provided for @baselinePhaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Initial pupil size'**
  String get baselinePhaseDesc;

  /// No description provided for @flashPhaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Light stimulus'**
  String get flashPhaseDesc;

  /// No description provided for @constrictionPhaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Pupil shrinks'**
  String get constrictionPhaseDesc;

  /// No description provided for @recoveryPhaseDesc.
  ///
  /// In en, this message translates to:
  /// **'Pupil returns'**
  String get recoveryPhaseDesc;

  /// No description provided for @normalPlrValues.
  ///
  /// In en, this message translates to:
  /// **'Normal PLR Values:'**
  String get normalPlrValues;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @pupilAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Pupil Analysis'**
  String get pupilAnalysis;

  /// No description provided for @scansLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} left'**
  String scansLeft(int count);

  /// No description provided for @validatingRightEye.
  ///
  /// In en, this message translates to:
  /// **'Validating right eye...'**
  String get validatingRightEye;

  /// No description provided for @validatingLeftEye.
  ///
  /// In en, this message translates to:
  /// **'Validating left eye...'**
  String get validatingLeftEye;

  /// No description provided for @analyzingRightEye.
  ///
  /// In en, this message translates to:
  /// **'Analyzing right eye (OD)...'**
  String get analyzingRightEye;

  /// No description provided for @analyzingLeftEye.
  ///
  /// In en, this message translates to:
  /// **'Analyzing left eye (OS)...'**
  String get analyzingLeftEye;

  /// No description provided for @comparingPupils.
  ///
  /// In en, this message translates to:
  /// **'Comparing pupils...'**
  String get comparingPupils;

  /// No description provided for @person.
  ///
  /// In en, this message translates to:
  /// **'Person: {name}'**
  String person(String name);

  /// No description provided for @invalidEyeImage.
  ///
  /// In en, this message translates to:
  /// **'Invalid Eye Image'**
  String get invalidEyeImage;

  /// No description provided for @analysisFailed.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed: {error}'**
  String analysisFailed(String error);

  /// No description provided for @researchEducationalToolOnly.
  ///
  /// In en, this message translates to:
  /// **'RESEARCH/EDUCATIONAL TOOL ONLY'**
  String get researchEducationalToolOnly;

  /// No description provided for @resultsNotMedicalDiagnoses.
  ///
  /// In en, this message translates to:
  /// **'This application is for research and educational purposes only. Results are NOT medical diagnoses and have NOT been validated for clinical use. Pattern associations are from historical research literature. Consult a healthcare professional for any health concerns.'**
  String get resultsNotMedicalDiagnoses;

  /// No description provided for @pupilSizeDifference.
  ///
  /// In en, this message translates to:
  /// **'Pupil Size Difference Detected'**
  String get pupilSizeDifference;

  /// No description provided for @significantPupilSizeDiff.
  ///
  /// In en, this message translates to:
  /// **'SIGNIFICANT PUPIL SIZE DIFFERENCE'**
  String get significantPupilSizeDiff;

  /// No description provided for @diff.
  ///
  /// In en, this message translates to:
  /// **'diff'**
  String get diff;

  /// No description provided for @researchObservationConsult.
  ///
  /// In en, this message translates to:
  /// **'Research observation - Consult a healthcare professional for interpretation'**
  String get researchObservationConsult;

  /// No description provided for @ageBasedResearchBaseline.
  ///
  /// In en, this message translates to:
  /// **'Age-Based Research Baseline'**
  String get ageBasedResearchBaseline;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group: {group}'**
  String group(String group);

  /// No description provided for @researchRange.
  ///
  /// In en, this message translates to:
  /// **'Research Range'**
  String get researchRange;

  /// No description provided for @measuredEst.
  ///
  /// In en, this message translates to:
  /// **'Measured (est.)'**
  String get measuredEst;

  /// No description provided for @pupilForm.
  ///
  /// In en, this message translates to:
  /// **'Pupil Form'**
  String get pupilForm;

  /// No description provided for @decentrationPattern.
  ///
  /// In en, this message translates to:
  /// **'Decentration Pattern'**
  String get decentrationPattern;

  /// No description provided for @flattenings.
  ///
  /// In en, this message translates to:
  /// **'Flattenings'**
  String get flattenings;

  /// No description provided for @protrusions.
  ///
  /// In en, this message translates to:
  /// **'Protrusions'**
  String get protrusions;

  /// No description provided for @zonesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} zones'**
  String zonesCount(int count);

  /// No description provided for @bilateralComparison.
  ///
  /// In en, this message translates to:
  /// **'Bilateral Comparison'**
  String get bilateralComparison;

  /// No description provided for @parameter.
  ///
  /// In en, this message translates to:
  /// **'Parameter'**
  String get parameter;

  /// No description provided for @od.
  ///
  /// In en, this message translates to:
  /// **'OD'**
  String get od;

  /// No description provided for @os.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get os;

  /// No description provided for @piRatio.
  ///
  /// In en, this message translates to:
  /// **'P/I Ratio'**
  String get piRatio;

  /// No description provided for @ellipseness.
  ///
  /// In en, this message translates to:
  /// **'Ellipseness'**
  String get ellipseness;

  /// No description provided for @circularity.
  ///
  /// In en, this message translates to:
  /// **'Circularity'**
  String get circularity;

  /// No description provided for @decentralization.
  ///
  /// In en, this message translates to:
  /// **'Decentralization'**
  String get decentralization;

  /// No description provided for @anwRatio.
  ///
  /// In en, this message translates to:
  /// **'Ratio'**
  String get anwRatio;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'normal'**
  String get normal;

  /// No description provided for @elliptical.
  ///
  /// In en, this message translates to:
  /// **'Elliptical'**
  String get elliptical;

  /// No description provided for @circular.
  ///
  /// In en, this message translates to:
  /// **'Circular'**
  String get circular;

  /// No description provided for @irregular.
  ///
  /// In en, this message translates to:
  /// **'Irregular'**
  String get irregular;

  /// No description provided for @centered.
  ///
  /// In en, this message translates to:
  /// **'Centered'**
  String get centered;

  /// No description provided for @offset.
  ///
  /// In en, this message translates to:
  /// **'Offset'**
  String get offset;

  /// No description provided for @miosis.
  ///
  /// In en, this message translates to:
  /// **'Miosis'**
  String get miosis;

  /// No description provided for @constricted.
  ///
  /// In en, this message translates to:
  /// **'Constricted'**
  String get constricted;

  /// No description provided for @dilated.
  ///
  /// In en, this message translates to:
  /// **'Dilated'**
  String get dilated;

  /// No description provided for @mydriasis.
  ///
  /// In en, this message translates to:
  /// **'Mydriasis'**
  String get mydriasis;

  /// No description provided for @inner.
  ///
  /// In en, this message translates to:
  /// **'Inner'**
  String get inner;

  /// No description provided for @outer.
  ///
  /// In en, this message translates to:
  /// **'Outer'**
  String get outer;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderate;

  /// No description provided for @savePdf.
  ///
  /// In en, this message translates to:
  /// **'Save PDF'**
  String get savePdf;

  /// No description provided for @sharePdf.
  ///
  /// In en, this message translates to:
  /// **'Share PDF'**
  String get sharePdf;

  /// No description provided for @retakePhotos.
  ///
  /// In en, this message translates to:
  /// **'Retake Photos'**
  String get retakePhotos;

  /// No description provided for @scansLeftBanner.
  ///
  /// In en, this message translates to:
  /// **'{count} scans left'**
  String scansLeftBanner(int count);

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgrade;

  /// No description provided for @unlockUnlimited.
  ///
  /// In en, this message translates to:
  /// **'Unlock Unlimited'**
  String get unlockUnlimited;

  /// No description provided for @usedAllFreeScans.
  ///
  /// In en, this message translates to:
  /// **'You\'ve used all free scans.'**
  String get usedAllFreeScans;

  /// No description provided for @unlimitedScans.
  ///
  /// In en, this message translates to:
  /// **'Unlimited scans'**
  String get unlimitedScans;

  /// No description provided for @pdfReports.
  ///
  /// In en, this message translates to:
  /// **'PDF reports'**
  String get pdfReports;

  /// No description provided for @scanHistoryFeature.
  ///
  /// In en, this message translates to:
  /// **'Scan history'**
  String get scanHistoryFeature;

  /// No description provided for @bilateralAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Bilateral analysis'**
  String get bilateralAnalysis;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/mo'**
  String get perMonth;

  /// No description provided for @annual.
  ///
  /// In en, this message translates to:
  /// **'Annual'**
  String get annual;

  /// No description provided for @perYear.
  ///
  /// In en, this message translates to:
  /// **'/yr'**
  String get perYear;

  /// No description provided for @tenCredits.
  ///
  /// In en, this message translates to:
  /// **'10 Credits'**
  String get tenCredits;

  /// No description provided for @oneTime.
  ///
  /// In en, this message translates to:
  /// **'one-time'**
  String get oneTime;

  /// No description provided for @best.
  ///
  /// In en, this message translates to:
  /// **'BEST'**
  String get best;

  /// No description provided for @purchaseCancelled.
  ///
  /// In en, this message translates to:
  /// **'Purchase cancelled'**
  String get purchaseCancelled;

  /// No description provided for @purchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed: {error}'**
  String purchaseFailed(String error);

  /// No description provided for @txtSaved.
  ///
  /// In en, this message translates to:
  /// **'TXT saved: {path}'**
  String txtSaved(String path);

  /// No description provided for @jsonSaved.
  ///
  /// In en, this message translates to:
  /// **'JSON saved: {path}'**
  String jsonSaved(String path);

  /// No description provided for @pdfSaved.
  ///
  /// In en, this message translates to:
  /// **'PDF Saved!'**
  String get pdfSaved;

  /// No description provided for @pdfFailed.
  ///
  /// In en, this message translates to:
  /// **'PDF Failed: {error}'**
  String pdfFailed(String error);

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'OPEN'**
  String get open;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String failed(String error);

  /// No description provided for @staticScans.
  ///
  /// In en, this message translates to:
  /// **'Static'**
  String get staticScans;

  /// No description provided for @plrScans.
  ///
  /// In en, this message translates to:
  /// **'PLR'**
  String get plrScans;

  /// No description provided for @searchByNameOrComplaints.
  ///
  /// In en, this message translates to:
  /// **'Search by name or complaints...'**
  String get searchByNameOrComplaints;

  /// No description provided for @searchPlrRecords.
  ///
  /// In en, this message translates to:
  /// **'Search PLR records...'**
  String get searchPlrRecords;

  /// No description provided for @noScansYet.
  ///
  /// In en, this message translates to:
  /// **'No scans yet'**
  String get noScansYet;

  /// No description provided for @completedScansAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Completed scans will appear here'**
  String get completedScansAppearHere;

  /// No description provided for @deleteScan.
  ///
  /// In en, this message translates to:
  /// **'Delete Scan?'**
  String get deleteScan;

  /// No description provided for @deleteScanConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete scan for {name} from {date}?'**
  String deleteScanConfirm(String name, String date);

  /// No description provided for @scanDeleted.
  ///
  /// In en, this message translates to:
  /// **'Scan deleted'**
  String get scanDeleted;

  /// No description provided for @originalImagesNotFound.
  ///
  /// In en, this message translates to:
  /// **'Original eye images not found.'**
  String get originalImagesNotFound;

  /// No description provided for @viewResults.
  ///
  /// In en, this message translates to:
  /// **'View Results'**
  String get viewResults;

  /// No description provided for @avgPlr.
  ///
  /// In en, this message translates to:
  /// **'Avg PLR'**
  String get avgPlr;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @anisocoria.
  ///
  /// In en, this message translates to:
  /// **'Anisocoria'**
  String get anisocoria;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @mild.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get mild;

  /// No description provided for @severe.
  ///
  /// In en, this message translates to:
  /// **'Severe'**
  String get severe;

  /// No description provided for @zoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Zone: {zone}'**
  String zoneLabel(String zone);

  /// No description provided for @associatedWith.
  ///
  /// In en, this message translates to:
  /// **'Associated with {organ}'**
  String associatedWith(String organ);

  /// No description provided for @significant.
  ///
  /// In en, this message translates to:
  /// **'Significant'**
  String get significant;

  /// No description provided for @fair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get fair;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @zones.
  ///
  /// In en, this message translates to:
  /// **'zones'**
  String get zones;

  /// No description provided for @significanceWithinLimits.
  ///
  /// In en, this message translates to:
  /// **'within acceptable limits'**
  String get significanceWithinLimits;

  /// No description provided for @significanceMild.
  ///
  /// In en, this message translates to:
  /// **'mild'**
  String get significanceMild;

  /// No description provided for @significanceModerate.
  ///
  /// In en, this message translates to:
  /// **'moderate'**
  String get significanceModerate;

  /// No description provided for @significanceSignificant.
  ///
  /// In en, this message translates to:
  /// **'significant'**
  String get significanceSignificant;

  /// No description provided for @formTypeCircle.
  ///
  /// In en, this message translates to:
  /// **'Circle (Normal)'**
  String get formTypeCircle;

  /// No description provided for @formTypeOval.
  ///
  /// In en, this message translates to:
  /// **'Oval'**
  String get formTypeOval;

  /// No description provided for @formTypeOvalVertical.
  ///
  /// In en, this message translates to:
  /// **'Oval-vertical'**
  String get formTypeOvalVertical;

  /// No description provided for @formTypeOvalHorizontal.
  ///
  /// In en, this message translates to:
  /// **'Oval-horizontal'**
  String get formTypeOvalHorizontal;

  /// No description provided for @formTypeOvalDiagonal.
  ///
  /// In en, this message translates to:
  /// **'Oval-diagonal'**
  String get formTypeOvalDiagonal;

  /// No description provided for @formTypeLeftObliqueEllipse.
  ///
  /// In en, this message translates to:
  /// **'Left Oblique Ellipse'**
  String get formTypeLeftObliqueEllipse;

  /// No description provided for @formTypeUnilateralEllipse.
  ///
  /// In en, this message translates to:
  /// **'Unilateral Ellipse'**
  String get formTypeUnilateralEllipse;

  /// No description provided for @formTypeVentralDivergingEllipse.
  ///
  /// In en, this message translates to:
  /// **'Ventral Diverging Ellipse'**
  String get formTypeVentralDivergingEllipse;

  /// No description provided for @formTypeFrontalDivergingEllipse.
  ///
  /// In en, this message translates to:
  /// **'Frontal Diverging Ellipse'**
  String get formTypeFrontalDivergingEllipse;

  /// No description provided for @formTypeEllipse.
  ///
  /// In en, this message translates to:
  /// **'Ellipse'**
  String get formTypeEllipse;

  /// No description provided for @formTypeChord.
  ///
  /// In en, this message translates to:
  /// **'Chord'**
  String get formTypeChord;

  /// No description provided for @formTypeIrregular.
  ///
  /// In en, this message translates to:
  /// **'Irregular'**
  String get formTypeIrregular;

  /// No description provided for @pupilFormCircleDesc.
  ///
  /// In en, this message translates to:
  /// **'Normal circular pupil form. No pattern variations detected.'**
  String get pupilFormCircleDesc;

  /// No description provided for @pupilFormOvalHorizontalDesc.
  ///
  /// In en, this message translates to:
  /// **'Horizontal oval pattern. Historical research associated this with autonomic nervous system patterns affecting respiratory and glandular function zones.'**
  String get pupilFormOvalHorizontalDesc;

  /// No description provided for @pupilFormOvalVerticalDesc.
  ///
  /// In en, this message translates to:
  /// **'Vertical oval pattern. Historical research linked this pattern to cerebral circulation zones in autonomic reflex studies.'**
  String get pupilFormOvalVerticalDesc;

  /// No description provided for @pupilFormOvalDiagonalDesc.
  ///
  /// In en, this message translates to:
  /// **'Diagonal oval pattern. Research literature associated this with urogenital zone reflexes in autonomic studies.'**
  String get pupilFormOvalDiagonalDesc;

  /// No description provided for @pupilFormLeftObliqueEllipseDesc.
  ///
  /// In en, this message translates to:
  /// **'Left oblique ellipse pattern. Historical observations linked this to urogenital and lower extremity autonomic zones.'**
  String get pupilFormLeftObliqueEllipseDesc;

  /// No description provided for @pupilFormUnilateralEllipseDesc.
  ///
  /// In en, this message translates to:
  /// **'Unilateral ellipse pattern. Research indicated associations with respiratory and bronchial autonomic zones.'**
  String get pupilFormUnilateralEllipseDesc;

  /// No description provided for @pupilFormVentralDivergingEllipseDesc.
  ///
  /// In en, this message translates to:
  /// **'Ventral diverging ellipse. Historical studies associated this with lower body autonomic zones and motor function patterns.'**
  String get pupilFormVentralDivergingEllipseDesc;

  /// No description provided for @pupilFormFrontalDivergingEllipseDesc.
  ///
  /// In en, this message translates to:
  /// **'Frontal diverging ellipse. Research literature linked this pattern to cerebral and upper autonomic zones.'**
  String get pupilFormFrontalDivergingEllipseDesc;

  /// No description provided for @pupilFormOvalDesc.
  ///
  /// In en, this message translates to:
  /// **'Mild oval deformation pattern. Monitor for progression in research observations.'**
  String get pupilFormOvalDesc;

  /// No description provided for @pupilFormEllipseDesc.
  ///
  /// In en, this message translates to:
  /// **'Elliptical pupil pattern indicating autonomic system variations in historical studies.'**
  String get pupilFormEllipseDesc;

  /// No description provided for @pupilFormChordDesc.
  ///
  /// In en, this message translates to:
  /// **'Chord-like deformation pattern indicating localized autonomic influences in research literature.'**
  String get pupilFormChordDesc;

  /// No description provided for @pupilFormIrregularDesc.
  ///
  /// In en, this message translates to:
  /// **'Irregular form suggesting multiple autonomic pattern influences based on historical observations.'**
  String get pupilFormIrregularDesc;

  /// No description provided for @patternCentered.
  ///
  /// In en, this message translates to:
  /// **'Centered (Normal)'**
  String get patternCentered;

  /// No description provided for @patternFrontal.
  ///
  /// In en, this message translates to:
  /// **'Frontal decentralization'**
  String get patternFrontal;

  /// No description provided for @patternBasal.
  ///
  /// In en, this message translates to:
  /// **'Basal decentralization'**
  String get patternBasal;

  /// No description provided for @patternNasal.
  ///
  /// In en, this message translates to:
  /// **'Nasal decentralization'**
  String get patternNasal;

  /// No description provided for @patternTemporal.
  ///
  /// In en, this message translates to:
  /// **'Temporal decentralization'**
  String get patternTemporal;

  /// No description provided for @patternMiddleNasal.
  ///
  /// In en, this message translates to:
  /// **'Middle-nasal decentralization'**
  String get patternMiddleNasal;

  /// No description provided for @patternMiddleTemporal.
  ///
  /// In en, this message translates to:
  /// **'Middle-temporal decentralization'**
  String get patternMiddleTemporal;

  /// No description provided for @patternUpperNasal.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal decentralization'**
  String get patternUpperNasal;

  /// No description provided for @patternUpperTemporal.
  ///
  /// In en, this message translates to:
  /// **'Upper-temporal decentralization'**
  String get patternUpperTemporal;

  /// No description provided for @patternLowerNasal.
  ///
  /// In en, this message translates to:
  /// **'Lower-nasal decentralization'**
  String get patternLowerNasal;

  /// No description provided for @patternLowerTemporal.
  ///
  /// In en, this message translates to:
  /// **'Lower-temporal decentralization'**
  String get patternLowerTemporal;

  /// No description provided for @patternUpwards.
  ///
  /// In en, this message translates to:
  /// **'Decentration - Upwards'**
  String get patternUpwards;

  /// No description provided for @patternDownwards.
  ///
  /// In en, this message translates to:
  /// **'Decentration - Downwards'**
  String get patternDownwards;

  /// No description provided for @patternUpwardsInwards.
  ///
  /// In en, this message translates to:
  /// **'Decentration - Upwards-Inwards'**
  String get patternUpwardsInwards;

  /// No description provided for @patternUpwardsOutwards.
  ///
  /// In en, this message translates to:
  /// **'Decentration - Upwards-Outwards'**
  String get patternUpwardsOutwards;

  /// No description provided for @decentrationCenteredDesc.
  ///
  /// In en, this message translates to:
  /// **'Normal pupil positioning within physiological limits.'**
  String get decentrationCenteredDesc;

  /// No description provided for @decentrationNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Nasal pattern (Right). Historical research associated this zone with pulmonary autonomic reflexes.'**
  String get decentrationNasalRightDesc;

  /// No description provided for @decentrationNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Nasal pattern (Left). Research literature linked this zone to cardiac autonomic function patterns.'**
  String get decentrationNasalLeftDesc;

  /// No description provided for @decentrationTemporalDesc.
  ///
  /// In en, this message translates to:
  /// **'Temporal pattern. Historical observations associated this zone with renal and reproductive autonomic reflexes.'**
  String get decentrationTemporalDesc;

  /// No description provided for @decentrationFrontalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Frontal pattern (Right). Research associated this zone with cognitive and cerebral function patterns.'**
  String get decentrationFrontalRightDesc;

  /// No description provided for @decentrationFrontalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Frontal pattern (Left). Historical studies linked this zone to cerebral autonomic patterns.'**
  String get decentrationFrontalLeftDesc;

  /// No description provided for @decentrationBasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Basal pattern (Right). Research indicated associations with intracranial pressure reflexes.'**
  String get decentrationBasalRightDesc;

  /// No description provided for @decentrationBasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Basal pattern (Left). Historical observations linked this to cerebral inflammatory zone patterns.'**
  String get decentrationBasalLeftDesc;

  /// No description provided for @decentrationUpwardsInwardsRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal pattern (Right). Research associated this zone with hepatobiliary autonomic reflexes.'**
  String get decentrationUpwardsInwardsRightDesc;

  /// No description provided for @decentrationUpwardsInwardsLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal pattern (Left). Historical studies linked this to splenic and diaphragmatic zones.'**
  String get decentrationUpwardsInwardsLeftDesc;

  /// No description provided for @decentrationUpwardsOutwardsDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-temporal pattern. Research indicated associations with renal and reproductive autonomic zones.'**
  String get decentrationUpwardsOutwardsDesc;

  /// No description provided for @decentrationMiddleNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-nasal pattern (Right). Historical observations linked this to oxygen utilization and cardiac zones.'**
  String get decentrationMiddleNasalRightDesc;

  /// No description provided for @decentrationMiddleNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-nasal pattern (Left). Research associated this with neurological and cardiac autonomic patterns.'**
  String get decentrationMiddleNasalLeftDesc;

  /// No description provided for @decentrationMiddleTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-temporal pattern (Right). Research linked this to cardiac autonomic regulation zones.'**
  String get decentrationMiddleTemporalRightDesc;

  /// No description provided for @decentrationMiddleTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-temporal pattern (Left). Historical studies associated this with pulmonary and cardiac zones.'**
  String get decentrationMiddleTemporalLeftDesc;

  /// No description provided for @decentrationUpperNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal pattern (Right). Research indicated associations with cognitive zones and cervical spine reflexes.'**
  String get decentrationUpperNasalRightDesc;

  /// No description provided for @decentrationUpperNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal pattern (Left). Historical observations linked this to cognitive patterns and cervical zones.'**
  String get decentrationUpperNasalLeftDesc;

  /// No description provided for @decentrationUpperTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-temporal pattern (Right). Research associated this zone with cranial nerve and auditory reflexes.'**
  String get decentrationUpperTemporalRightDesc;

  /// No description provided for @decentrationUpperTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-temporal pattern (Left). Historical studies linked this to neurovegetative and speech zones.'**
  String get decentrationUpperTemporalLeftDesc;

  /// No description provided for @decentrationLowerNasalDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-nasal pattern. Research indicated associations with urogenital and lumbosacral autonomic zones.'**
  String get decentrationLowerNasalDesc;

  /// No description provided for @decentrationLowerTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-temporal pattern (Right). Historical observations associated this with metabolic and hepatic zones.'**
  String get decentrationLowerTemporalRightDesc;

  /// No description provided for @decentrationLowerTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-temporal pattern (Left). Research linked this to cardiac and splenic autonomic patterns.'**
  String get decentrationLowerTemporalLeftDesc;

  /// No description provided for @flatteningUpperCentralRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with upper-central zone. Historical research linked this to mood regulation and energy autonomic reflexes.'**
  String get flatteningUpperCentralRightDesc;

  /// No description provided for @flatteningUpperTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with upper-temporal zone. Research indicated associations with cranial nerve and auditory autonomic reflexes.'**
  String get flatteningUpperTemporalRightDesc;

  /// No description provided for @flatteningMiddleTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with middle-temporal zone. Historical observations linked this to respiratory and cardiac autonomic patterns.'**
  String get flatteningMiddleTemporalRightDesc;

  /// No description provided for @flatteningLowerTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with lower-temporal zone. Research literature associated this with hepatic and metabolic autonomic zones.'**
  String get flatteningLowerTemporalRightDesc;

  /// No description provided for @flatteningLowerBasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with lower-basal zone. Historical studies linked this to renal and lower extremity autonomic reflexes.'**
  String get flatteningLowerBasalRightDesc;

  /// No description provided for @flatteningLowerNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with lower-nasal zone. Research indicated associations with urogenital and pelvic autonomic zones.'**
  String get flatteningLowerNasalRightDesc;

  /// No description provided for @flatteningMiddleNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with middle-nasal zone. Historical observations linked this to oxygen utilization and respiratory autonomic patterns.'**
  String get flatteningMiddleNasalRightDesc;

  /// No description provided for @flatteningUpperNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with upper-nasal zone. Research literature associated this with cognitive and cervical autonomic reflexes.'**
  String get flatteningUpperNasalRightDesc;

  /// No description provided for @flatteningDefaultRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Autonomic nervous system pattern variation detected in this zone based on historical research.'**
  String get flatteningDefaultRightDesc;

  /// No description provided for @flatteningUpperCentralLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with upper-central zone. Historical research linked this to mood regulation and neurological autonomic patterns.'**
  String get flatteningUpperCentralLeftDesc;

  /// No description provided for @flatteningUpperTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with upper-temporal zone. Research indicated associations with neurovegetative and speech autonomic zones.'**
  String get flatteningUpperTemporalLeftDesc;

  /// No description provided for @flatteningMiddleTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with middle-temporal zone. Historical observations linked this to pulmonary and cardiac autonomic reflexes.'**
  String get flatteningMiddleTemporalLeftDesc;

  /// No description provided for @flatteningLowerTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with lower-temporal zone. Research literature associated this with cardiac and splenic autonomic patterns.'**
  String get flatteningLowerTemporalLeftDesc;

  /// No description provided for @flatteningLowerBasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with lower-basal zone. Historical studies linked this to renal and eliminative autonomic zones.'**
  String get flatteningLowerBasalLeftDesc;

  /// No description provided for @flatteningLowerNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with lower-nasal zone. Research indicated associations with urogenital and lumbosacral autonomic reflexes.'**
  String get flatteningLowerNasalLeftDesc;

  /// No description provided for @flatteningMiddleNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with middle-nasal zone. Historical observations linked this to cardiac and respiratory autonomic patterns.'**
  String get flatteningMiddleNasalLeftDesc;

  /// No description provided for @flatteningUpperNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Pattern associated with upper-nasal zone. Research literature associated this with cognitive and cervical autonomic zones.'**
  String get flatteningUpperNasalLeftDesc;

  /// No description provided for @flatteningDefaultLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Autonomic nervous system pattern variation detected in this zone based on historical research.'**
  String get flatteningDefaultLeftDesc;

  /// No description provided for @protrusionUpperCentralRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-central zone protrusion pattern. Research associated this with sympathetic hyperarousal patterns affecting cerebral zones.'**
  String get protrusionUpperCentralRightDesc;

  /// No description provided for @protrusionUpperTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-temporal zone protrusion pattern. Historical observations linked this to cranial nerve and auditory system hyperactivity patterns.'**
  String get protrusionUpperTemporalRightDesc;

  /// No description provided for @protrusionMiddleTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-temporal zone protrusion pattern. Research indicated associations with cardiac and respiratory sympathetic patterns.'**
  String get protrusionMiddleTemporalRightDesc;

  /// No description provided for @protrusionLowerTemporalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-temporal zone protrusion pattern. Historical studies linked this to hepatobiliary and metabolic sympathetic zones.'**
  String get protrusionLowerTemporalRightDesc;

  /// No description provided for @protrusionLowerBasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-basal zone protrusion pattern. Research associated this with renal and pelvic sympathetic hyperactivity patterns.'**
  String get protrusionLowerBasalRightDesc;

  /// No description provided for @protrusionLowerNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-nasal zone protrusion pattern. Historical observations linked this to urogenital sympathetic activation zones.'**
  String get protrusionLowerNasalRightDesc;

  /// No description provided for @protrusionMiddleNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-nasal zone protrusion pattern. Research indicated associations with gastric and pancreatic sympathetic patterns.'**
  String get protrusionMiddleNasalRightDesc;

  /// No description provided for @protrusionUpperNasalRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal zone protrusion pattern. Historical studies linked this to cognitive and visual sympathetic hyperarousal zones.'**
  String get protrusionUpperNasalRightDesc;

  /// No description provided for @protrusionDefaultRightDesc.
  ///
  /// In en, this message translates to:
  /// **'Sympathetic nervous system hyperactivity pattern detected in this zone based on research observations.'**
  String get protrusionDefaultRightDesc;

  /// No description provided for @protrusionUpperCentralLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-central zone protrusion pattern. Research associated this with psychomotor and cerebral sympathetic patterns.'**
  String get protrusionUpperCentralLeftDesc;

  /// No description provided for @protrusionUpperTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-temporal zone protrusion pattern. Historical observations linked this to neurovegetative sympathetic hyperactivity zones.'**
  String get protrusionUpperTemporalLeftDesc;

  /// No description provided for @protrusionMiddleTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-temporal zone protrusion pattern. Research indicated associations with pulmonary and cardiac sympathetic patterns.'**
  String get protrusionMiddleTemporalLeftDesc;

  /// No description provided for @protrusionLowerTemporalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-temporal zone protrusion pattern. Historical studies linked this to splenic and cardiac sympathetic activation zones.'**
  String get protrusionLowerTemporalLeftDesc;

  /// No description provided for @protrusionLowerBasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-basal zone protrusion pattern. Research associated this with pelvic and renal sympathetic hyperactivity patterns.'**
  String get protrusionLowerBasalLeftDesc;

  /// No description provided for @protrusionLowerNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Lower-nasal zone protrusion pattern. Historical observations linked this to lumbosacral sympathetic activation zones.'**
  String get protrusionLowerNasalLeftDesc;

  /// No description provided for @protrusionMiddleNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Middle-nasal zone protrusion pattern. Research indicated associations with anxiety-cardiac sympathetic patterns.'**
  String get protrusionMiddleNasalLeftDesc;

  /// No description provided for @protrusionUpperNasalLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Upper-nasal zone protrusion pattern. Historical studies linked this to cognitive and visual sympathetic hyperarousal zones.'**
  String get protrusionUpperNasalLeftDesc;

  /// No description provided for @protrusionDefaultLeftDesc.
  ///
  /// In en, this message translates to:
  /// **'Sympathetic nervous system hyperactivity pattern detected in this zone based on research observations.'**
  String get protrusionDefaultLeftDesc;

  /// No description provided for @anisocoriaNone.
  ///
  /// In en, this message translates to:
  /// **'Pupil sizes within normal limits. No significant anisocoria detected.'**
  String get anisocoriaNone;

  /// No description provided for @anisocoriaDetected.
  ///
  /// In en, this message translates to:
  /// **'Anisocoria detected: {difference}% ({direction}). {description}'**
  String anisocoriaDetected(
      String difference, String direction, String description);

  /// No description provided for @anisocoriaDirectionSD.
  ///
  /// In en, this message translates to:
  /// **'S>D'**
  String get anisocoriaDirectionSD;

  /// No description provided for @anisocoriaDirectionDS.
  ///
  /// In en, this message translates to:
  /// **'D>S'**
  String get anisocoriaDirectionDS;

  /// No description provided for @anisocoriaSeverityNone.
  ///
  /// In en, this message translates to:
  /// **'Within normal limits.'**
  String get anisocoriaSeverityNone;

  /// No description provided for @anisocoriaSeverityMild.
  ///
  /// In en, this message translates to:
  /// **'Mild difference observed. May be physiological.'**
  String get anisocoriaSeverityMild;

  /// No description provided for @anisocoriaSeverityModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate asymmetry. Research observation noted.'**
  String get anisocoriaSeverityModerate;

  /// No description provided for @anisocoriaSeveritySevere.
  ///
  /// In en, this message translates to:
  /// **'Significant asymmetry. Research observation flagged.'**
  String get anisocoriaSeveritySevere;

  /// No description provided for @largerPupilEqual.
  ///
  /// In en, this message translates to:
  /// **'equal'**
  String get largerPupilEqual;

  /// No description provided for @largerPupilOS.
  ///
  /// In en, this message translates to:
  /// **'OS (Left)'**
  String get largerPupilOS;

  /// No description provided for @largerPupilOD.
  ///
  /// In en, this message translates to:
  /// **'OD (Right)'**
  String get largerPupilOD;

  /// No description provided for @decentrationWithinLimits.
  ///
  /// In en, this message translates to:
  /// **'Within normal limits.'**
  String get decentrationWithinLimits;

  /// No description provided for @decentrationClinicalNote.
  ///
  /// In en, this message translates to:
  /// **'{patternName}. Offset: {offset}%'**
  String decentrationClinicalNote(String patternName, String offset);

  /// No description provided for @zoneUpperCentral.
  ///
  /// In en, this message translates to:
  /// **'Upper-Central'**
  String get zoneUpperCentral;

  /// No description provided for @zoneUpperNasal.
  ///
  /// In en, this message translates to:
  /// **'Upper-Nasal'**
  String get zoneUpperNasal;

  /// No description provided for @zoneMiddleNasal.
  ///
  /// In en, this message translates to:
  /// **'Middle-Nasal'**
  String get zoneMiddleNasal;

  /// No description provided for @zoneLowerNasal.
  ///
  /// In en, this message translates to:
  /// **'Lower-Nasal'**
  String get zoneLowerNasal;

  /// No description provided for @zoneLowerBasal.
  ///
  /// In en, this message translates to:
  /// **'Lower-Basal'**
  String get zoneLowerBasal;

  /// No description provided for @zoneLowerTemporal.
  ///
  /// In en, this message translates to:
  /// **'Lower-Temporal'**
  String get zoneLowerTemporal;

  /// No description provided for @zoneMiddleTemporal.
  ///
  /// In en, this message translates to:
  /// **'Middle-Temporal'**
  String get zoneMiddleTemporal;

  /// No description provided for @zoneUpperTemporal.
  ///
  /// In en, this message translates to:
  /// **'Upper-Temporal'**
  String get zoneUpperTemporal;

  /// No description provided for @zoneFrontal.
  ///
  /// In en, this message translates to:
  /// **'Frontal'**
  String get zoneFrontal;

  /// No description provided for @zoneBasal.
  ///
  /// In en, this message translates to:
  /// **'Basal'**
  String get zoneBasal;

  /// No description provided for @zoneUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get zoneUnknown;

  /// No description provided for @flatteningDescription.
  ///
  /// In en, this message translates to:
  /// **'{zone} flatness ({clockRange}) - {percentage}%'**
  String flatteningDescription(
      String zone, String clockRange, String percentage);

  /// No description provided for @protrusionDescription.
  ///
  /// In en, this message translates to:
  /// **'{zone} protrusion ({clockRange}) - {percentage}%'**
  String protrusionDescription(
      String zone, String clockRange, String percentage);

  /// No description provided for @usbIriscopeMode.
  ///
  /// In en, this message translates to:
  /// **'USB Iriscope Mode'**
  String get usbIriscopeMode;

  /// No description provided for @iriscopeExternal.
  ///
  /// In en, this message translates to:
  /// **'Iriscope / External'**
  String get iriscopeExternal;

  /// No description provided for @usbLabel.
  ///
  /// In en, this message translates to:
  /// **'USB'**
  String get usbLabel;

  /// No description provided for @useConnectedUsbCamera.
  ///
  /// In en, this message translates to:
  /// **'Use connected USB camera or iriscope'**
  String get useConnectedUsbCamera;

  /// No description provided for @detectedCameras.
  ///
  /// In en, this message translates to:
  /// **'Detected Cameras'**
  String get detectedCameras;

  /// No description provided for @externalCamera.
  ///
  /// In en, this message translates to:
  /// **'External Camera'**
  String get externalCamera;

  /// No description provided for @cameraIndex.
  ///
  /// In en, this message translates to:
  /// **'Camera {index}'**
  String cameraIndex(int index);

  /// No description provided for @noExternalCameraDetected.
  ///
  /// In en, this message translates to:
  /// **'No external camera detected.\\nConnect a USB iriscope to enable.'**
  String get noExternalCameraDetected;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @selectCameraSource.
  ///
  /// In en, this message translates to:
  /// **'Select Camera Source'**
  String get selectCameraSource;

  /// No description provided for @camerasDetected.
  ///
  /// In en, this message translates to:
  /// **'{count} cameras detected'**
  String camerasDetected(int count);

  /// No description provided for @camerasAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} cameras available'**
  String camerasAvailable(int count);

  /// No description provided for @externalCameraIndex.
  ///
  /// In en, this message translates to:
  /// **'External Camera {index}'**
  String externalCameraIndex(int index);

  /// No description provided for @qualityGatedRear.
  ///
  /// In en, this message translates to:
  /// **'Quality-gated auto-capture (rear camera)'**
  String get qualityGatedRear;

  /// No description provided for @qualityGatedFront.
  ///
  /// In en, this message translates to:
  /// **'Quality-gated auto-capture (front camera)'**
  String get qualityGatedFront;

  /// No description provided for @usbCameraInfo.
  ///
  /// In en, this message translates to:
  /// **'USB Camera Info'**
  String get usbCameraInfo;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @waiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting...'**
  String get waiting;

  /// No description provided for @disconnected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// No description provided for @waitingForUsbCamera.
  ///
  /// In en, this message translates to:
  /// **'Waiting for USB Camera'**
  String get waitingForUsbCamera;

  /// No description provided for @connectIriscopePrompt.
  ///
  /// In en, this message translates to:
  /// **'Connect your iriscope via USB OTG adapter.\\nGrant permission when prompted.'**
  String get connectIriscopePrompt;

  /// No description provided for @usbCameraIssue.
  ///
  /// In en, this message translates to:
  /// **'USB Camera Issue'**
  String get usbCameraIssue;

  /// No description provided for @pleaseConnectIriscope.
  ///
  /// In en, this message translates to:
  /// **'Please connect your iriscope or USB camera.'**
  String get pleaseConnectIriscope;

  /// No description provided for @retryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get retryConnection;

  /// No description provided for @troubleshootingTips.
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting Tips'**
  String get troubleshootingTips;

  /// No description provided for @tipUsbOtgAdapter.
  ///
  /// In en, this message translates to:
  /// **'Ensure USB OTG adapter is properly connected'**
  String get tipUsbOtgAdapter;

  /// No description provided for @tipUsbHostMode.
  ///
  /// In en, this message translates to:
  /// **'Check if device supports USB Host mode'**
  String get tipUsbHostMode;

  /// No description provided for @tipReconnectCamera.
  ///
  /// In en, this message translates to:
  /// **'Try disconnecting and reconnecting the camera'**
  String get tipReconnectCamera;

  /// No description provided for @tipGrantPermissions.
  ///
  /// In en, this message translates to:
  /// **'Grant USB permissions when prompted'**
  String get tipGrantPermissions;

  /// No description provided for @tipUnlockDevice.
  ///
  /// In en, this message translates to:
  /// **'Some devices may need to be unlocked'**
  String get tipUnlockDevice;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @switchEye.
  ///
  /// In en, this message translates to:
  /// **'Switch Eye'**
  String get switchEye;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @usingFlutterUvcPlugin.
  ///
  /// In en, this message translates to:
  /// **'Using flutter_uvc_camera plugin\\Plugin for USB Video Class device support.'**
  String get usingFlutterUvcPlugin;

  /// No description provided for @initialized.
  ///
  /// In en, this message translates to:
  /// **'Initialized'**
  String get initialized;

  /// No description provided for @notReady.
  ///
  /// In en, this message translates to:
  /// **'Not Ready'**
  String get notReady;

  /// Title for the bilateral iris size comparison card
  ///
  /// In en, this message translates to:
  /// **'Capture Distance Match'**
  String get captureDistanceMatch;

  /// Label for iris size measurement
  ///
  /// In en, this message translates to:
  /// **'Iris Size'**
  String get irisSize;

  /// Status when capture distances match well
  ///
  /// In en, this message translates to:
  /// **'Distance Matched'**
  String get distanceMatched;

  /// Status when capture distances don't match
  ///
  /// In en, this message translates to:
  /// **'Distance Mismatch'**
  String get distanceMismatch;

  /// Distance match status 90%+
  ///
  /// In en, this message translates to:
  /// **'Excellent match'**
  String get excellentMatch;

  /// Distance match status 80-90%
  ///
  /// In en, this message translates to:
  /// **'Good match'**
  String get goodMatch;

  /// Distance match status 70-80%
  ///
  /// In en, this message translates to:
  /// **'Acceptable match'**
  String get acceptableMatch;

  /// Warning when distances don't match well
  ///
  /// In en, this message translates to:
  /// **'Distance mismatch - consider retaking'**
  String get considerRetaking;

  /// Camera quality feedback when ready to capture
  ///
  /// In en, this message translates to:
  /// **'Ready! Hold steady...'**
  String get qualityReady;

  /// Camera quality feedback when image is blurry
  ///
  /// In en, this message translates to:
  /// **'Hold camera steady'**
  String get qualityTooBlurry;

  /// Camera quality feedback when too dark
  ///
  /// In en, this message translates to:
  /// **'Need more light'**
  String get qualityTooDark;

  /// Camera quality feedback when too bright
  ///
  /// In en, this message translates to:
  /// **'Too bright - reduce light'**
  String get qualityTooBright;

  /// Camera quality feedback when contrast is low
  ///
  /// In en, this message translates to:
  /// **'Adjust lighting angle'**
  String get qualityNoContrast;

  /// Camera quality feedback when pupil not detected
  ///
  /// In en, this message translates to:
  /// **'Center pupil in frame'**
  String get qualityNoPupil;

  /// Camera quality feedback when eye not centered
  ///
  /// In en, this message translates to:
  /// **'Move eye to center'**
  String get qualityNotCentered;

  /// Camera quality feedback when no eye detected
  ///
  /// In en, this message translates to:
  /// **'No eye detected'**
  String get qualityNotAnEye;

  /// Camera quality feedback during processing
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get qualityProcessing;

  /// Distance guidance when perfectly matched
  ///
  /// In en, this message translates to:
  /// **'✓ Distance matched'**
  String get distanceMatchedCheck;

  /// Distance guidance when good match
  ///
  /// In en, this message translates to:
  /// **'✓ Good match'**
  String get distanceGoodMatchCheck;

  /// Distance guidance to move slightly back
  ///
  /// In en, this message translates to:
  /// **'Slightly back ↔'**
  String get distanceSlightlyBack;

  /// Distance guidance to move slightly closer
  ///
  /// In en, this message translates to:
  /// **'Slightly closer ↔'**
  String get distanceSlightlyCloser;

  /// Distance guidance when nearly matched
  ///
  /// In en, this message translates to:
  /// **'Almost there...'**
  String get distanceAlmostThere;

  /// Distance guidance to move back
  ///
  /// In en, this message translates to:
  /// **'Move back ←←'**
  String get distanceMoveBack;

  /// Distance guidance to move closer
  ///
  /// In en, this message translates to:
  /// **'Move closer →→'**
  String get distanceMoveCloser;

  /// Distance guidance when too close
  ///
  /// In en, this message translates to:
  /// **'Too close! Move back'**
  String get distanceTooClose;

  /// Distance guidance when too far
  ///
  /// In en, this message translates to:
  /// **'Too far! Move closer'**
  String get distanceTooFar;

  /// Distance status while stabilizing reading
  ///
  /// In en, this message translates to:
  /// **'Stabilizing...'**
  String get distanceStabilizing;

  /// Distance match percentage label
  ///
  /// In en, this message translates to:
  /// **'Distance: {percent}%'**
  String distanceLabel(int percent);

  /// Iris size comparison between eyes
  ///
  /// In en, this message translates to:
  /// **'OD: {odSize}px → OS: {osSize}px'**
  String irisSizeComparison(int odSize, int osSize);

  /// Label for front camera
  ///
  /// In en, this message translates to:
  /// **'Front Camera'**
  String get frontCameraLabel;

  /// Label for rear/back camera
  ///
  /// In en, this message translates to:
  /// **'Back Camera'**
  String get rearCameraLabel;

  /// Status when camera is initializing
  ///
  /// In en, this message translates to:
  /// **'Starting camera...'**
  String get startingCamera;

  /// Title for validation failure dialog
  ///
  /// In en, this message translates to:
  /// **'Eye Not Detected'**
  String get eyeNotDetected;

  /// Button text to retry capture
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Quality indicator label for eye detection
  ///
  /// In en, this message translates to:
  /// **'Eye'**
  String get indicatorEye;

  /// Quality indicator label for sharpness
  ///
  /// In en, this message translates to:
  /// **'Sharp'**
  String get indicatorSharp;

  /// Quality indicator label for lighting
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get indicatorLight;

  /// Quality indicator label for focus/contrast
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get indicatorFocus;

  /// Quality indicator label for pupil detection
  ///
  /// In en, this message translates to:
  /// **'Pupil'**
  String get indicatorPupil;

  /// Quality indicator label for iris size
  ///
  /// In en, this message translates to:
  /// **'Iris'**
  String get indicatorIris;

  /// Quality indicator label for distance match
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get indicatorMatch;

  /// Validation check label for aspect ratio
  ///
  /// In en, this message translates to:
  /// **'Image Shape'**
  String get checkImageShape;

  /// Validation check label for circular iris
  ///
  /// In en, this message translates to:
  /// **'Circular Iris'**
  String get checkCircularIris;

  /// Validation check label for dark pupil center
  ///
  /// In en, this message translates to:
  /// **'Dark Pupil'**
  String get checkDarkPupil;

  /// Validation check label for iris texture
  ///
  /// In en, this message translates to:
  /// **'Iris Texture'**
  String get checkIrisTexture;

  /// Validation check label for concentric circles
  ///
  /// In en, this message translates to:
  /// **'Pupil-Iris Structure'**
  String get checkPupilIrisStructure;

  /// Validation check label for color distribution
  ///
  /// In en, this message translates to:
  /// **'Natural Colors'**
  String get checkNaturalColors;

  /// Validation check label for edge density
  ///
  /// In en, this message translates to:
  /// **'Edge Pattern'**
  String get checkEdgePattern;

  /// Validation error for incorrect aspect ratio
  ///
  /// In en, this message translates to:
  /// **'Image shape incorrect - ensure eye fills frame'**
  String get errorImageShapeIncorrect;

  /// Validation error when no eye/iris detected
  ///
  /// In en, this message translates to:
  /// **'No eye detected - center iris in frame'**
  String get errorNoEyeDetected;

  /// Validation error when pupil not detected
  ///
  /// In en, this message translates to:
  /// **'No pupil detected - ensure good lighting'**
  String get errorNoPupilDetected;

  /// Validation error when iris texture not detected
  ///
  /// In en, this message translates to:
  /// **'No iris texture - move closer to eye'**
  String get errorNoIrisTexture;

  /// Validation error for unusual color distribution
  ///
  /// In en, this message translates to:
  /// **'Unusual colors detected - avoid screens/reflections'**
  String get errorUnusualColors;

  /// Validation error for too many straight edges
  ///
  /// In en, this message translates to:
  /// **'Too many straight edges - this may not be an eye'**
  String get errorTooManyEdges;

  /// Generic validation error for invalid eye image
  ///
  /// In en, this message translates to:
  /// **'Not a valid eye image - please try again'**
  String get errorNotValidEye;

  /// Status during countdown capture
  ///
  /// In en, this message translates to:
  /// **'Hold still - capturing...'**
  String get holdStillCapturing;

  /// Status when distance needs adjustment before capture
  ///
  /// In en, this message translates to:
  /// **'Adjust distance first'**
  String get adjustDistanceFirst;

  /// Status while distance reading stabilizes
  ///
  /// In en, this message translates to:
  /// **'Stabilizing...'**
  String get stabilizingReading;

  /// Status indicating auto-capture is enabled
  ///
  /// In en, this message translates to:
  /// **'Auto-capture when ready'**
  String get autoCaptureWhenReady;

  /// Instruction when ready to capture
  ///
  /// In en, this message translates to:
  /// **'Tap or wait for auto-capture'**
  String get tapOrWaitAutoCapture;

  /// Status during image validation
  ///
  /// In en, this message translates to:
  /// **'Validating...'**
  String get validatingImage;

  /// Status during image capture
  ///
  /// In en, this message translates to:
  /// **'Capturing...'**
  String get capturingStatus;

  /// Status when position needs adjustment
  ///
  /// In en, this message translates to:
  /// **'Adjust position'**
  String get adjustPositionStatus;

  /// Helpful tip shown after multiple validation failures
  ///
  /// In en, this message translates to:
  /// **'Tip: Ensure good lighting, hold camera 10-15cm from eye, avoid reflections'**
  String get validationTip;

  /// Title for validation checks list in dialog
  ///
  /// In en, this message translates to:
  /// **'Validation Checks:'**
  String get validationChecksTitle;

  /// Confidence percentage label
  ///
  /// In en, this message translates to:
  /// **'Confidence: {percent}%'**
  String confidenceLabel(int percent);

  /// Status when iris metrics data is incomplete
  ///
  /// In en, this message translates to:
  /// **'Incomplete data'**
  String get incompleteData;

  /// Label for iris diameter measurement
  ///
  /// In en, this message translates to:
  /// **'iris ø'**
  String get irisDiameterLabel;

  /// Title for PLR chart showing pupil response over time
  ///
  /// In en, this message translates to:
  /// **'PLR Response Curve'**
  String get plrResponseCurve;

  /// Time from flash to start of constriction
  ///
  /// In en, this message translates to:
  /// **'Latency'**
  String get plrLatency;

  /// Rate of pupil constriction
  ///
  /// In en, this message translates to:
  /// **'Velocity'**
  String get plrVelocity;

  /// Time for pupil to recover
  ///
  /// In en, this message translates to:
  /// **'Rec. Time'**
  String get plrRecoveryTime;

  /// Final size compared to baseline
  ///
  /// In en, this message translates to:
  /// **'Rec. %'**
  String get plrRecoveryRatio;

  /// Section title for advanced PLR measurements
  ///
  /// In en, this message translates to:
  /// **'Enhanced PLR Metrics'**
  String get plrEnhancedMetrics;

  /// Normal latency reference range
  ///
  /// In en, this message translates to:
  /// **'Normal: 200-500ms'**
  String get plrNormalLatency;

  /// Normal constriction reference range
  ///
  /// In en, this message translates to:
  /// **'Normal: 10-30%'**
  String get plrNormalConstriction;

  /// Normal velocity reference range
  ///
  /// In en, this message translates to:
  /// **'Normal: 1.5-4.0%/s'**
  String get plrNormalVelocity;

  /// Title for reference values section
  ///
  /// In en, this message translates to:
  /// **'Normal PLR Reference Values'**
  String get plrReferenceValues;

  /// Section title for patient/subject info in PLR report
  ///
  /// In en, this message translates to:
  /// **'Subject Information'**
  String get plrSubjectInfo;

  /// Name of the PLR test type
  ///
  /// In en, this message translates to:
  /// **'Pupillary Light Reflex'**
  String get plrTestType;

  /// Section title for analysis summary
  ///
  /// In en, this message translates to:
  /// **'Analysis Summary'**
  String get plrAnalysisSummary;

  /// Label for total frames count
  ///
  /// In en, this message translates to:
  /// **'Total Frames Analyzed'**
  String get plrTotalFrames;

  /// Label for frame analysis success rate
  ///
  /// In en, this message translates to:
  /// **'Success Rate'**
  String get plrSuccessRate;

  /// Label for maximum constriction time
  ///
  /// In en, this message translates to:
  /// **'Max Constriction'**
  String get plrMaxConstriction;

  /// No description provided for @plrResponseCurveLabels.
  ///
  /// In en, this message translates to:
  /// **'PLR Response Curve'**
  String get plrResponseCurveLabels;

  /// No description provided for @anwTitle.
  ///
  /// In en, this message translates to:
  /// **'Autonomic Nerve Wreath (ANW)'**
  String get anwTitle;

  /// No description provided for @anwAbnormal.
  ///
  /// In en, this message translates to:
  /// **'Abnormal'**
  String get anwAbnormal;

  /// No description provided for @anwDiameter.
  ///
  /// In en, this message translates to:
  /// **'Diameter'**
  String get anwDiameter;

  /// No description provided for @anwPerimeter.
  ///
  /// In en, this message translates to:
  /// **'Perimeter'**
  String get anwPerimeter;

  /// No description provided for @anwAsymmetry.
  ///
  /// In en, this message translates to:
  /// **'Asymmetry'**
  String get anwAsymmetry;

  /// No description provided for @anwElevated.
  ///
  /// In en, this message translates to:
  /// **'Elevated'**
  String get anwElevated;

  /// No description provided for @anwFormType.
  ///
  /// In en, this message translates to:
  /// **'Form Type'**
  String get anwFormType;

  /// No description provided for @anwRegular.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get anwRegular;

  /// No description provided for @anwDrawnIn.
  ///
  /// In en, this message translates to:
  /// **'Drawn In'**
  String get anwDrawnIn;

  /// No description provided for @anwIndented.
  ///
  /// In en, this message translates to:
  /// **'Indented'**
  String get anwIndented;

  /// No description provided for @anwLacerated.
  ///
  /// In en, this message translates to:
  /// **'Lacerated'**
  String get anwLacerated;

  /// No description provided for @anwSpastic.
  ///
  /// In en, this message translates to:
  /// **'Spastic'**
  String get anwSpastic;

  /// No description provided for @anwAtonic.
  ///
  /// In en, this message translates to:
  /// **'Atonic'**
  String get anwAtonic;

  /// No description provided for @anwTonicState.
  ///
  /// In en, this message translates to:
  /// **'Tonic State'**
  String get anwTonicState;

  /// No description provided for @anwParasympathotonic.
  ///
  /// In en, this message translates to:
  /// **'Parasympathotonic'**
  String get anwParasympathotonic;

  /// No description provided for @anwSympathotonicState.
  ///
  /// In en, this message translates to:
  /// **'Sympathotonic'**
  String get anwSympathotonicState;

  /// No description provided for @anwShiftDetected.
  ///
  /// In en, this message translates to:
  /// **'Shift Detected'**
  String get anwShiftDetected;

  /// No description provided for @anwConstrictionDetected.
  ///
  /// In en, this message translates to:
  /// **'Constriction Detected'**
  String get anwConstrictionDetected;

  /// No description provided for @anwFindings.
  ///
  /// In en, this message translates to:
  /// **'Findings'**
  String get anwFindings;

  /// No description provided for @anwRatioComparison.
  ///
  /// In en, this message translates to:
  /// **'ANW Ratio'**
  String get anwRatioComparison;

  /// No description provided for @bilateralANWComparison.
  ///
  /// In en, this message translates to:
  /// **'Bilateral ANW Comparison'**
  String get bilateralANWComparison;

  /// No description provided for @anwSymmetryNormal.
  ///
  /// In en, this message translates to:
  /// **'ANW symmetry within normal limits.'**
  String get anwSymmetryNormal;

  /// No description provided for @anwAsymmetryDetected.
  ///
  /// In en, this message translates to:
  /// **'ANW asymmetry detected between eyes.'**
  String get anwAsymmetryDetected;

  /// No description provided for @functionalFrustration.
  ///
  /// In en, this message translates to:
  /// **'Functional frustration in correlation between sympathetic and parasympathetic nervous systems.'**
  String get functionalFrustration;

  /// No description provided for @anwParasympathotonicDesc.
  ///
  /// In en, this message translates to:
  /// **'Liminal sensitivity increased. Reflex activity accelerated. GI secretory/evacuation functions heightened.'**
  String get anwParasympathotonicDesc;

  /// No description provided for @anwSympathotonicDesc.
  ///
  /// In en, this message translates to:
  /// **'Liminal sensitivity decreased. Reflex activity decelerated. GI secretory/evacuation functions reduced.'**
  String get anwSympathotonicDesc;

  /// No description provided for @anwMiddleTemporalShiftCardiac.
  ///
  /// In en, this message translates to:
  /// **'Overloads of the left ventricle. Cardiac stress.'**
  String get anwMiddleTemporalShiftCardiac;

  /// No description provided for @anwFrontalConstricted.
  ///
  /// In en, this message translates to:
  /// **'Frontal zone of pupillary belt is constricted.'**
  String get anwFrontalConstricted;

  /// No description provided for @anwBasalConstricted.
  ///
  /// In en, this message translates to:
  /// **'Basal zone of pupillary belt is constricted.'**
  String get anwBasalConstricted;

  /// No description provided for @anwFrontalBasalConstricted.
  ///
  /// In en, this message translates to:
  /// **'Frontal and basal zones of pupillary belt are constricted.'**
  String get anwFrontalBasalConstricted;

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & User Guide'**
  String get helpTitle;

  /// No description provided for @helpTabQuickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick Start'**
  String get helpTabQuickStart;

  /// No description provided for @helpTabCnriAnalysis.
  ///
  /// In en, this message translates to:
  /// **'CNRI Analysis'**
  String get helpTabCnriAnalysis;

  /// No description provided for @helpTabShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Shortcuts'**
  String get helpTabShortcuts;

  /// No description provided for @helpTabTroubleshooting.
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting'**
  String get helpTabTroubleshooting;

  /// No description provided for @helpOnlineDocs.
  ///
  /// In en, this message translates to:
  /// **'Online Docs'**
  String get helpOnlineDocs;

  /// No description provided for @helpContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get helpContactSupport;

  /// No description provided for @helpGettingStarted.
  ///
  /// In en, this message translates to:
  /// **'Getting Started'**
  String get helpGettingStarted;

  /// No description provided for @helpStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Connect Your Iriscope'**
  String get helpStep1Title;

  /// No description provided for @helpStep1Desc.
  ///
  /// In en, this message translates to:
  /// **'Connect your Dino-Lite or compatible USB iriscope.'**
  String get helpStep1Desc;

  /// No description provided for @helpStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Enter Patient Information'**
  String get helpStep2Title;

  /// No description provided for @helpStep2Desc.
  ///
  /// In en, this message translates to:
  /// **'Fill in patient name, age, sex, and chief complaints.'**
  String get helpStep2Desc;

  /// No description provided for @helpStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Capture Right Eye (OD)'**
  String get helpStep3Title;

  /// No description provided for @helpStep3Desc.
  ///
  /// In en, this message translates to:
  /// **'Position the iriscope and capture the right eye image.'**
  String get helpStep3Desc;

  /// No description provided for @helpStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Capture Left Eye (OS)'**
  String get helpStep4Title;

  /// No description provided for @helpStep4Desc.
  ///
  /// In en, this message translates to:
  /// **'Repeat for the left eye with consistent lighting.'**
  String get helpStep4Desc;

  /// No description provided for @helpStep5Title.
  ///
  /// In en, this message translates to:
  /// **'Review Analysis'**
  String get helpStep5Title;

  /// No description provided for @helpStep5Desc.
  ///
  /// In en, this message translates to:
  /// **'The app analyzes P/I ratio, pupil form, and ANW characteristics.'**
  String get helpStep5Desc;

  /// No description provided for @helpStep6Title.
  ///
  /// In en, this message translates to:
  /// **'Export Report'**
  String get helpStep6Title;

  /// No description provided for @helpStep6Desc.
  ///
  /// In en, this message translates to:
  /// **'Save as PDF, TXT, or JSON format.'**
  String get helpStep6Desc;

  /// No description provided for @helpTipBestResults.
  ///
  /// In en, this message translates to:
  /// **'For best results: Use consistent lighting and maintain 2-3cm iriscope distance.'**
  String get helpTipBestResults;

  /// No description provided for @helpCnriProtocolFeatures.
  ///
  /// In en, this message translates to:
  /// **'CNRI Protocol Features'**
  String get helpCnriProtocolFeatures;

  /// No description provided for @helpFeaturePiRatioTitle.
  ///
  /// In en, this message translates to:
  /// **'Pupil/Iris Ratio (P/I)'**
  String get helpFeaturePiRatioTitle;

  /// No description provided for @helpFeaturePiRatioDesc.
  ///
  /// In en, this message translates to:
  /// **'Normal: 20-30%. Values outside may indicate autonomic imbalance.'**
  String get helpFeaturePiRatioDesc;

  /// No description provided for @helpFeaturePupilFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Pupil Form Analysis'**
  String get helpFeaturePupilFormTitle;

  /// No description provided for @helpFeaturePupilFormDesc.
  ///
  /// In en, this message translates to:
  /// **'Detects oval patterns, decentration direction, and eccentricity.'**
  String get helpFeaturePupilFormDesc;

  /// No description provided for @helpFeatureAnwTitle.
  ///
  /// In en, this message translates to:
  /// **'ANW (Collarette) Assessment'**
  String get helpFeatureAnwTitle;

  /// No description provided for @helpFeatureAnwDesc.
  ///
  /// In en, this message translates to:
  /// **'Analyzes ratio, form regularity, sector shifts, and tonic state.'**
  String get helpFeatureAnwDesc;

  /// No description provided for @helpFeatureZoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Zone Analysis'**
  String get helpFeatureZoneTitle;

  /// No description provided for @helpFeatureZoneDesc.
  ///
  /// In en, this message translates to:
  /// **'Maps flattenings/protrusions to CNRI organ zones.'**
  String get helpFeatureZoneDesc;

  /// No description provided for @helpFeatureBilateralTitle.
  ///
  /// In en, this message translates to:
  /// **'Bilateral Comparison'**
  String get helpFeatureBilateralTitle;

  /// No description provided for @helpFeatureBilateralDesc.
  ///
  /// In en, this message translates to:
  /// **'Compares OD vs OS to detect asymmetries.'**
  String get helpFeatureBilateralDesc;

  /// No description provided for @helpFeatureMlTitle.
  ///
  /// In en, this message translates to:
  /// **'ML Enhancement'**
  String get helpFeatureMlTitle;

  /// No description provided for @helpFeatureMlDesc.
  ///
  /// In en, this message translates to:
  /// **'ResNet18 model provides secondary measurements.'**
  String get helpFeatureMlDesc;

  /// No description provided for @helpKeyboardShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Keyboard Shortcuts'**
  String get helpKeyboardShortcuts;

  /// No description provided for @helpCameraControls.
  ///
  /// In en, this message translates to:
  /// **'Camera Controls'**
  String get helpCameraControls;

  /// No description provided for @helpShortcutSpace.
  ///
  /// In en, this message translates to:
  /// **'Capture image'**
  String get helpShortcutSpace;

  /// No description provided for @helpShortcutCtrlS.
  ///
  /// In en, this message translates to:
  /// **'Save PDF report'**
  String get helpShortcutCtrlS;

  /// No description provided for @helpShortcutCtrlO.
  ///
  /// In en, this message translates to:
  /// **'Open gallery image'**
  String get helpShortcutCtrlO;

  /// No description provided for @helpShortcutCtrlH.
  ///
  /// In en, this message translates to:
  /// **'View scan history'**
  String get helpShortcutCtrlH;

  /// No description provided for @helpShortcutF11.
  ///
  /// In en, this message translates to:
  /// **'Toggle fullscreen'**
  String get helpShortcutF11;

  /// No description provided for @helpShortcutEsc.
  ///
  /// In en, this message translates to:
  /// **'Go back / Cancel'**
  String get helpShortcutEsc;

  /// No description provided for @helpShortcutScroll.
  ///
  /// In en, this message translates to:
  /// **'Zoom in/out'**
  String get helpShortcutScroll;

  /// No description provided for @helpShortcutDoubleClick.
  ///
  /// In en, this message translates to:
  /// **'Reset zoom'**
  String get helpShortcutDoubleClick;

  /// No description provided for @helpCommonIssues.
  ///
  /// In en, this message translates to:
  /// **'Common Issues'**
  String get helpCommonIssues;

  /// No description provided for @helpIssueCameraNotDetected.
  ///
  /// In en, this message translates to:
  /// **'Camera not detected'**
  String get helpIssueCameraNotDetected;

  /// No description provided for @helpIssueCameraSolution1.
  ///
  /// In en, this message translates to:
  /// **'Check USB connection'**
  String get helpIssueCameraSolution1;

  /// No description provided for @helpIssueCameraSolution2.
  ///
  /// In en, this message translates to:
  /// **'Try different USB port'**
  String get helpIssueCameraSolution2;

  /// No description provided for @helpIssueCameraSolution3.
  ///
  /// In en, this message translates to:
  /// **'Install Dino-Lite drivers'**
  String get helpIssueCameraSolution3;

  /// No description provided for @helpIssueCameraSolution4.
  ///
  /// In en, this message translates to:
  /// **'Restart application'**
  String get helpIssueCameraSolution4;

  /// No description provided for @helpIssuePupilDetectionFails.
  ///
  /// In en, this message translates to:
  /// **'Pupil detection fails'**
  String get helpIssuePupilDetectionFails;

  /// No description provided for @helpIssuePupilSolution1.
  ///
  /// In en, this message translates to:
  /// **'Ensure adequate lighting'**
  String get helpIssuePupilSolution1;

  /// No description provided for @helpIssuePupilSolution2.
  ///
  /// In en, this message translates to:
  /// **'Center pupil in frame'**
  String get helpIssuePupilSolution2;

  /// No description provided for @helpIssuePupilSolution3.
  ///
  /// In en, this message translates to:
  /// **'Clean iriscope lens'**
  String get helpIssuePupilSolution3;

  /// No description provided for @helpIssuePupilSolution4.
  ///
  /// In en, this message translates to:
  /// **'Adjust focus manually'**
  String get helpIssuePupilSolution4;

  /// No description provided for @helpIssuePdfExportFails.
  ///
  /// In en, this message translates to:
  /// **'PDF export fails'**
  String get helpIssuePdfExportFails;

  /// No description provided for @helpIssuePdfSolution1.
  ///
  /// In en, this message translates to:
  /// **'Check folder permissions'**
  String get helpIssuePdfSolution1;

  /// No description provided for @helpIssuePdfSolution2.
  ///
  /// In en, this message translates to:
  /// **'Ensure disk space available'**
  String get helpIssuePdfSolution2;

  /// No description provided for @helpIssuePdfSolution3.
  ///
  /// In en, this message translates to:
  /// **'Close open PDF files'**
  String get helpIssuePdfSolution3;

  /// No description provided for @helpIssuePdfSolution4.
  ///
  /// In en, this message translates to:
  /// **'Try TXT export first'**
  String get helpIssuePdfSolution4;

  /// No description provided for @helpContactSupportTip.
  ///
  /// In en, this message translates to:
  /// **'Contact helpdesk@cnri.edu for assistance.'**
  String get helpContactSupportTip;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsCameraIriscope.
  ///
  /// In en, this message translates to:
  /// **'CAMERA / IRISCOPE'**
  String get settingsCameraIriscope;

  /// No description provided for @settingsPreferredCamera.
  ///
  /// In en, this message translates to:
  /// **'Preferred Camera:'**
  String get settingsPreferredCamera;

  /// No description provided for @settingsCameraDinoLite.
  ///
  /// In en, this message translates to:
  /// **'Dino-Lite'**
  String get settingsCameraDinoLite;

  /// No description provided for @settingsCameraUsb.
  ///
  /// In en, this message translates to:
  /// **'USB Camera'**
  String get settingsCameraUsb;

  /// No description provided for @settingsCameraAutoDetect.
  ///
  /// In en, this message translates to:
  /// **'Auto-detect'**
  String get settingsCameraAutoDetect;

  /// No description provided for @settingsDefaultZoom.
  ///
  /// In en, this message translates to:
  /// **'Default Zoom:'**
  String get settingsDefaultZoom;

  /// No description provided for @settingsAnalysis.
  ///
  /// In en, this message translates to:
  /// **'ANALYSIS'**
  String get settingsAnalysis;

  /// No description provided for @settingsShowMlComparison.
  ///
  /// In en, this message translates to:
  /// **'Show ML Comparison'**
  String get settingsShowMlComparison;

  /// No description provided for @settingsShowZoneOverlay.
  ///
  /// In en, this message translates to:
  /// **'Show Zone Overlay'**
  String get settingsShowZoneOverlay;

  /// No description provided for @settingsAutoDetectPupil.
  ///
  /// In en, this message translates to:
  /// **'Auto-detect Pupil'**
  String get settingsAutoDetectPupil;

  /// No description provided for @settingsExportReports.
  ///
  /// In en, this message translates to:
  /// **'EXPORT & REPORTS'**
  String get settingsExportReports;

  /// No description provided for @settingsAutoSavePdf.
  ///
  /// In en, this message translates to:
  /// **'Auto-save PDF'**
  String get settingsAutoSavePdf;

  /// No description provided for @settingsIncludeImages.
  ///
  /// In en, this message translates to:
  /// **'Include Images'**
  String get settingsIncludeImages;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get settingsSaved;

  /// No description provided for @aboutResearchEdition.
  ///
  /// In en, this message translates to:
  /// **'Research Edition'**
  String get aboutResearchEdition;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String aboutVersion(String version);

  /// No description provided for @aboutLicense.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get aboutLicense;

  /// No description provided for @aboutLicensedTo.
  ///
  /// In en, this message translates to:
  /// **'Licensed To:'**
  String get aboutLicensedTo;

  /// No description provided for @aboutExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires:'**
  String get aboutExpires;

  /// No description provided for @aboutManageLicense.
  ///
  /// In en, this message translates to:
  /// **'Manage License'**
  String get aboutManageLicense;

  /// No description provided for @aboutBasedOnCnri.
  ///
  /// In en, this message translates to:
  /// **'Based on CNRI Protocol'**
  String get aboutBasedOnCnri;

  /// No description provided for @aboutCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024-2026 PupilMetrics Research'**
  String get aboutCopyright;

  /// No description provided for @aboutWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get aboutWebsite;

  /// No description provided for @aboutPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get aboutPrivacy;

  /// No description provided for @languageSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get languageSelectTitle;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language Changed'**
  String get languageChanged;

  /// No description provided for @languageChangedMessage.
  ///
  /// In en, this message translates to:
  /// **'App language set to {language}'**
  String languageChangedMessage(String language);

  /// No description provided for @languageSystemNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Language system not available'**
  String get languageSystemNotAvailable;

  /// No description provided for @licenseLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get licenseLoading;

  /// No description provided for @licenseWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to PupilMetrics!'**
  String get licenseWelcome;

  /// No description provided for @licenseTrialFeatures.
  ///
  /// In en, this message translates to:
  /// **'14-day free trial • Full features'**
  String get licenseTrialFeatures;

  /// No description provided for @licenseStartTrial.
  ///
  /// In en, this message translates to:
  /// **'Start Free Trial'**
  String get licenseStartTrial;

  /// No description provided for @licenseEnterKey.
  ///
  /// In en, this message translates to:
  /// **'Enter License'**
  String get licenseEnterKey;

  /// No description provided for @licenseFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'Free Trial'**
  String get licenseFreeTrial;

  /// No description provided for @licenseDaysRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} days remaining'**
  String licenseDaysRemaining(int count);

  /// No description provided for @licenseTrialEnded.
  ///
  /// In en, this message translates to:
  /// **'Trial Ended'**
  String get licenseTrialEnded;

  /// No description provided for @licenseEnterToContinue.
  ///
  /// In en, this message translates to:
  /// **'Enter license to continue'**
  String get licenseEnterToContinue;

  /// No description provided for @licenseStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard License'**
  String get licenseStandard;

  /// No description provided for @licenseProfessional.
  ///
  /// In en, this message translates to:
  /// **'Professional License'**
  String get licenseProfessional;

  /// No description provided for @licenseEnterprise.
  ///
  /// In en, this message translates to:
  /// **'Enterprise License'**
  String get licenseEnterprise;

  /// No description provided for @licenseLicensed.
  ///
  /// In en, this message translates to:
  /// **'Licensed'**
  String get licenseLicensed;

  /// No description provided for @licenseActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get licenseActive;

  /// No description provided for @licenseTrialUser.
  ///
  /// In en, this message translates to:
  /// **'Trial User'**
  String get licenseTrialUser;

  /// No description provided for @licenseLifetime.
  ///
  /// In en, this message translates to:
  /// **'Lifetime'**
  String get licenseLifetime;

  /// No description provided for @licenseNotSetUp.
  ///
  /// In en, this message translates to:
  /// **'Not Set Up'**
  String get licenseNotSetUp;

  /// No description provided for @trialExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Trial Period Ended'**
  String get trialExpiredTitle;

  /// No description provided for @trialExpiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Your 14-day trial has ended. To continue analyzing iris images, please purchase a license.'**
  String get trialExpiredMessage;

  /// No description provided for @trialExpiredCanStill.
  ///
  /// In en, this message translates to:
  /// **'You can still:'**
  String get trialExpiredCanStill;

  /// No description provided for @trialExpiredViewAnalyses.
  ///
  /// In en, this message translates to:
  /// **'View your previous analyses'**
  String get trialExpiredViewAnalyses;

  /// No description provided for @trialExpiredExportReports.
  ///
  /// In en, this message translates to:
  /// **'Export existing reports'**
  String get trialExpiredExportReports;

  /// No description provided for @trialExpiredAccessHistory.
  ///
  /// In en, this message translates to:
  /// **'Access scan history'**
  String get trialExpiredAccessHistory;

  /// No description provided for @trialExpiredMaybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get trialExpiredMaybeLater;

  /// No description provided for @licenseRegistration.
  ///
  /// In en, this message translates to:
  /// **'License Registration'**
  String get licenseRegistration;

  /// No description provided for @licenseStatusValid.
  ///
  /// In en, this message translates to:
  /// **'Licensed'**
  String get licenseStatusValid;

  /// No description provided for @licenseStatusTrialActive.
  ///
  /// In en, this message translates to:
  /// **'Free Trial'**
  String get licenseStatusTrialActive;

  /// No description provided for @licenseStatusTrialExpired.
  ///
  /// In en, this message translates to:
  /// **'Trial Ended'**
  String get licenseStatusTrialExpired;

  /// No description provided for @licenseStatusExpired.
  ///
  /// In en, this message translates to:
  /// **'License Expired'**
  String get licenseStatusExpired;

  /// No description provided for @licenseStatusInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid License'**
  String get licenseStatusInvalid;

  /// No description provided for @licenseStatusUnregistered.
  ///
  /// In en, this message translates to:
  /// **'Not Set Up'**
  String get licenseStatusUnregistered;

  /// No description provided for @licenseStatusMachineMismatch.
  ///
  /// In en, this message translates to:
  /// **'Different Computer'**
  String get licenseStatusMachineMismatch;

  /// No description provided for @licenseStatusNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get licenseStatusNetworkError;

  /// No description provided for @licenseEnterKeyTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter License Key'**
  String get licenseEnterKeyTitle;

  /// No description provided for @licenseKeyPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'CNRI-XXXX-XXXX-XXXX-XXXX'**
  String get licenseKeyPlaceholder;

  /// No description provided for @licenseYourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get licenseYourName;

  /// No description provided for @licenseEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get licenseEmailAddress;

  /// No description provided for @licenseMachineId.
  ///
  /// In en, this message translates to:
  /// **'Machine ID'**
  String get licenseMachineId;

  /// No description provided for @licenseCopyMachineId.
  ///
  /// In en, this message translates to:
  /// **'Copy Machine ID'**
  String get licenseCopyMachineId;

  /// No description provided for @licenseMachineIdCopied.
  ///
  /// In en, this message translates to:
  /// **'Machine ID copied to clipboard'**
  String get licenseMachineIdCopied;

  /// No description provided for @licenseValidationKeyRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your license key'**
  String get licenseValidationKeyRequired;

  /// No description provided for @licenseValidationKeyFormat.
  ///
  /// In en, this message translates to:
  /// **'License key should be 20 characters (CNRI-XXXX-XXXX-XXXX-XXXX)'**
  String get licenseValidationKeyFormat;

  /// No description provided for @licenseValidationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get licenseValidationNameRequired;

  /// No description provided for @licenseValidationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get licenseValidationEmailRequired;

  /// No description provided for @licenseValidationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get licenseValidationEmailInvalid;

  /// No description provided for @licenseActivate.
  ///
  /// In en, this message translates to:
  /// **'Activate License'**
  String get licenseActivate;

  /// No description provided for @licenseContinueTrial.
  ///
  /// In en, this message translates to:
  /// **'Continue Trial'**
  String get licenseContinueTrial;

  /// No description provided for @licenseBuyLicense.
  ///
  /// In en, this message translates to:
  /// **'Buy License'**
  String get licenseBuyLicense;

  /// No description provided for @licenseNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get licenseNeedHelp;

  /// No description provided for @licenseLicenseAgreement.
  ///
  /// In en, this message translates to:
  /// **'License Agreement'**
  String get licenseLicenseAgreement;

  /// No description provided for @licenseActivatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'License Activated Successfully!'**
  String get licenseActivatedSuccess;

  /// No description provided for @licenseMsgMachineMismatch.
  ///
  /// In en, this message translates to:
  /// **'This license is registered to a different computer. Please use your original device or contact support.'**
  String get licenseMsgMachineMismatch;

  /// No description provided for @licenseMsgTrialEnded.
  ///
  /// In en, this message translates to:
  /// **'Your free trial has ended. Enter a license key to continue using all features.'**
  String get licenseMsgTrialEnded;

  /// No description provided for @licenseMsgExpired.
  ///
  /// In en, this message translates to:
  /// **'Your license has expired. Please renew to continue.'**
  String get licenseMsgExpired;

  /// No description provided for @licenseMsgNeedsSetup.
  ///
  /// In en, this message translates to:
  /// **'License needs to be set up. Start your free trial or enter a license key.'**
  String get licenseMsgNeedsSetup;

  /// No description provided for @licenseMsgCheckFormat.
  ///
  /// In en, this message translates to:
  /// **'Please check your license key format. It should look like: CNRI-XXXX-XXXX-XXXX-XXXX'**
  String get licenseMsgCheckFormat;

  /// No description provided for @licenseMsgNotRecognized.
  ///
  /// In en, this message translates to:
  /// **'This license key was not recognized. Please double-check and try again.'**
  String get licenseMsgNotRecognized;

  /// No description provided for @licenseMsgAlreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'This key is already registered to a different computer.'**
  String get licenseMsgAlreadyRegistered;

  /// No description provided for @licenseMsgContactSupport.
  ///
  /// In en, this message translates to:
  /// **'This license has expired. Please contact support for renewal.'**
  String get licenseMsgContactSupport;

  /// No description provided for @licenseMsgActivatedThankYou.
  ///
  /// In en, this message translates to:
  /// **'License activated successfully! Thank you for your purchase.'**
  String get licenseMsgActivatedThankYou;

  /// No description provided for @licenseMsgUnableToActivate.
  ///
  /// In en, this message translates to:
  /// **'Unable to activate license. Please check your internet connection and try again.'**
  String get licenseMsgUnableToActivate;

  /// No description provided for @licenseMsgTrialWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome! Your {days}-day free trial has started.'**
  String licenseMsgTrialWelcome(int days);

  /// No description provided for @licenseMsgTrialActive.
  ///
  /// In en, this message translates to:
  /// **'Trial active: {days} days remaining.'**
  String licenseMsgTrialActive(int days);

  /// No description provided for @licenseMsgFreeTrialActive.
  ///
  /// In en, this message translates to:
  /// **'Free trial active'**
  String get licenseMsgFreeTrialActive;

  /// No description provided for @licenseMsgLicenseActive.
  ///
  /// In en, this message translates to:
  /// **'License active - {type}'**
  String licenseMsgLicenseActive(String type);

  /// No description provided for @licenseMsgUnableToActivateKey.
  ///
  /// In en, this message translates to:
  /// **'Unable to activate this license key.'**
  String get licenseMsgUnableToActivateKey;

  /// No description provided for @licenseMsgNoLongerValid.
  ///
  /// In en, this message translates to:
  /// **'License is no longer valid.'**
  String get licenseMsgNoLongerValid;

  /// No description provided for @licenseMsgUnableToVerify.
  ///
  /// In en, this message translates to:
  /// **'Unable to verify this license key. Please contact support.'**
  String get licenseMsgUnableToVerify;

  /// No description provided for @trialStartedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Trial Started!'**
  String get trialStartedSnackbar;

  /// No description provided for @trialStartedMessage.
  ///
  /// In en, this message translates to:
  /// **'Enjoy 14 days of full access'**
  String get trialStartedMessage;

  /// No description provided for @windowTitle.
  ///
  /// In en, this message translates to:
  /// **'PupilMetrics'**
  String get windowTitle;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'ThemeMode'**
  String get themeMode;

  /// No description provided for @methods.
  ///
  /// In en, this message translates to:
  /// **'METHODS'**
  String get methods;

  /// No description provided for @setAsFrameless.
  ///
  /// In en, this message translates to:
  /// **'setAsFrameless'**
  String get setAsFrameless;

  /// No description provided for @isPreventCloseSetPreventClose.
  ///
  /// In en, this message translates to:
  /// **'isPreventClose / setPreventClose'**
  String get isPreventCloseSetPreventClose;

  /// No description provided for @focusBlur.
  ///
  /// In en, this message translates to:
  /// **'focus / blur'**
  String get focusBlur;

  /// No description provided for @showHide.
  ///
  /// In en, this message translates to:
  /// **'show / hide'**
  String get showHide;

  /// No description provided for @isVisible.
  ///
  /// In en, this message translates to:
  /// **'isVisible'**
  String get isVisible;

  /// No description provided for @isMaximized.
  ///
  /// In en, this message translates to:
  /// **'isMaximized'**
  String get isMaximized;

  /// No description provided for @maximizeUnmaximize.
  ///
  /// In en, this message translates to:
  /// **'maximize / unmaximize'**
  String get maximizeUnmaximize;

  /// No description provided for @isMinimized.
  ///
  /// In en, this message translates to:
  /// **'isMinimized'**
  String get isMinimized;

  /// No description provided for @minimizeRestore.
  ///
  /// In en, this message translates to:
  /// **'minimize / restore'**
  String get minimizeRestore;

  /// No description provided for @dockUndock.
  ///
  /// In en, this message translates to:
  /// **'dock / undock'**
  String get dockUndock;

  /// No description provided for @dockLeft.
  ///
  /// In en, this message translates to:
  /// **'dock left'**
  String get dockLeft;

  /// No description provided for @dockRight.
  ///
  /// In en, this message translates to:
  /// **'dock right'**
  String get dockRight;

  /// No description provided for @undock.
  ///
  /// In en, this message translates to:
  /// **'undock'**
  String get undock;

  /// No description provided for @isFullScreenSetFullScreen.
  ///
  /// In en, this message translates to:
  /// **'isFullScreen / setFullScreen'**
  String get isFullScreenSetFullScreen;

  /// No description provided for @setAspectRatio.
  ///
  /// In en, this message translates to:
  /// **'setAspectRatio'**
  String get setAspectRatio;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'reset'**
  String get reset;

  /// No description provided for @setBackgroundColor.
  ///
  /// In en, this message translates to:
  /// **'setBackgroundColor'**
  String get setBackgroundColor;

  /// No description provided for @transparent.
  ///
  /// In en, this message translates to:
  /// **'transparent'**
  String get transparent;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'red'**
  String get red;

  /// No description provided for @green.
  ///
  /// In en, this message translates to:
  /// **'green'**
  String get green;

  /// No description provided for @blue.
  ///
  /// In en, this message translates to:
  /// **'blue'**
  String get blue;

  /// No description provided for @setBoundsGetBounds.
  ///
  /// In en, this message translates to:
  /// **'setBounds / getBounds'**
  String get setBoundsGetBounds;

  /// No description provided for @setAlignment.
  ///
  /// In en, this message translates to:
  /// **'setAlignment'**
  String get setAlignment;

  /// No description provided for @topLeft.
  ///
  /// In en, this message translates to:
  /// **'topLeft'**
  String get topLeft;

  /// No description provided for @topCenter.
  ///
  /// In en, this message translates to:
  /// **'topCenter'**
  String get topCenter;

  /// No description provided for @topRight.
  ///
  /// In en, this message translates to:
  /// **'topRight'**
  String get topRight;

  /// No description provided for @centerLeft.
  ///
  /// In en, this message translates to:
  /// **'centerLeft'**
  String get centerLeft;

  /// No description provided for @centerRight.
  ///
  /// In en, this message translates to:
  /// **'centerRight'**
  String get centerRight;

  /// No description provided for @bottomLeft.
  ///
  /// In en, this message translates to:
  /// **'bottomLeft'**
  String get bottomLeft;

  /// No description provided for @bottomCenter.
  ///
  /// In en, this message translates to:
  /// **'bottomCenter'**
  String get bottomCenter;

  /// No description provided for @bottomRight.
  ///
  /// In en, this message translates to:
  /// **'bottomRight'**
  String get bottomRight;

  /// No description provided for @getPositionSetPosition.
  ///
  /// In en, this message translates to:
  /// **'getPosition / setPosition'**
  String get getPositionSetPosition;

  /// No description provided for @getSizeSetSize.
  ///
  /// In en, this message translates to:
  /// **'getSize / setSize'**
  String get getSizeSetSize;

  /// No description provided for @set.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get set;

  /// No description provided for @getMinimumSizeSetMinimumSize.
  ///
  /// In en, this message translates to:
  /// **'getMinimumSize / setMinimumSize'**
  String get getMinimumSizeSetMinimumSize;

  /// No description provided for @getMaximumSizeSetMaximumSize.
  ///
  /// In en, this message translates to:
  /// **'getMaximumSize / setMaximumSize'**
  String get getMaximumSizeSetMaximumSize;

  /// No description provided for @isResizableSetResizable.
  ///
  /// In en, this message translates to:
  /// **'isResizable / setResizable'**
  String get isResizableSetResizable;

  /// No description provided for @isMovableSetMovable.
  ///
  /// In en, this message translates to:
  /// **'isMovable / setMovable'**
  String get isMovableSetMovable;

  /// No description provided for @isMinimizableSetMinimizable.
  ///
  /// In en, this message translates to:
  /// **'isMinimizable / setMinimizable'**
  String get isMinimizableSetMinimizable;

  /// No description provided for @isMaximizableSetMaximizable.
  ///
  /// In en, this message translates to:
  /// **'isMaximizable / setMaximizable'**
  String get isMaximizableSetMaximizable;

  /// No description provided for @isClosableSetClosable.
  ///
  /// In en, this message translates to:
  /// **'isClosable / setClosable'**
  String get isClosableSetClosable;

  /// No description provided for @isAlwaysOnTopSetAlwaysOnTop.
  ///
  /// In en, this message translates to:
  /// **'isAlwaysOnTop / setAlwaysOnTop'**
  String get isAlwaysOnTopSetAlwaysOnTop;

  /// No description provided for @isAlwaysOnBottomSetAlwaysOnBottom.
  ///
  /// In en, this message translates to:
  /// **'isAlwaysOnBottom / setAlwaysOnBottom'**
  String get isAlwaysOnBottomSetAlwaysOnBottom;

  /// No description provided for @getTitleSetTitle.
  ///
  /// In en, this message translates to:
  /// **'getTitle / setTitle'**
  String get getTitleSetTitle;

  /// No description provided for @setTitleBarStyle.
  ///
  /// In en, this message translates to:
  /// **'setTitleBarStyle'**
  String get setTitleBarStyle;

  /// No description provided for @hidden.
  ///
  /// In en, this message translates to:
  /// **'hidden'**
  String get hidden;

  /// No description provided for @getTitleBarHeight.
  ///
  /// In en, this message translates to:
  /// **'getTitleBarHeight'**
  String get getTitleBarHeight;

  /// No description provided for @isSkipTaskbar.
  ///
  /// In en, this message translates to:
  /// **'isSkipTaskbar'**
  String get isSkipTaskbar;

  /// No description provided for @setSkipTaskbar.
  ///
  /// In en, this message translates to:
  /// **'setSkipTaskbar'**
  String get setSkipTaskbar;

  /// No description provided for @setProgressBar.
  ///
  /// In en, this message translates to:
  /// **'setProgressBar'**
  String get setProgressBar;

  /// No description provided for @setIcon.
  ///
  /// In en, this message translates to:
  /// **'setIcon'**
  String get setIcon;

  /// No description provided for @defaultIcon.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultIcon;

  /// No description provided for @original.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get original;

  /// No description provided for @isVisibleOnAllWorkspacesSetVisibleOnAllWorkspaces.
  ///
  /// In en, this message translates to:
  /// **'isVisibleOnAllWorkspaces / setVisibleOnAllWorkspaces'**
  String get isVisibleOnAllWorkspacesSetVisibleOnAllWorkspaces;

  /// No description provided for @setBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'setBadgeLabel'**
  String get setBadgeLabel;

  /// No description provided for @hasShadowSetHasShadow.
  ///
  /// In en, this message translates to:
  /// **'hasShadow / setHasShadow'**
  String get hasShadowSetHasShadow;

  /// No description provided for @getOpacitySetOpacity.
  ///
  /// In en, this message translates to:
  /// **'getOpacity / setOpacity'**
  String get getOpacitySetOpacity;

  /// No description provided for @setIgnoreMouseEvents.
  ///
  /// In en, this message translates to:
  /// **'setIgnoreMouseEvents'**
  String get setIgnoreMouseEvents;

  /// No description provided for @popUpWindowMenu.
  ///
  /// In en, this message translates to:
  /// **'popUpWindowMenu'**
  String get popUpWindowMenu;

  /// No description provided for @grabKeyboard.
  ///
  /// In en, this message translates to:
  /// **'grabKeyboard'**
  String get grabKeyboard;

  /// No description provided for @ungrabKeyboard.
  ///
  /// In en, this message translates to:
  /// **'ungrabKeyboard'**
  String get ungrabKeyboard;

  /// No description provided for @dragToMoveArea.
  ///
  /// In en, this message translates to:
  /// **'DragToMoveArea'**
  String get dragToMoveArea;

  /// No description provided for @dragToResizeArea.
  ///
  /// In en, this message translates to:
  /// **'DragToResizeArea'**
  String get dragToResizeArea;

  /// No description provided for @dragToResizeAreaExample.
  ///
  /// In en, this message translates to:
  /// **'DragToResizeArea example'**
  String get dragToResizeAreaExample;

  /// No description provided for @closeWindowConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to close this window?'**
  String get closeWindowConfirmation;

  /// No description provided for @licenseChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking license...'**
  String get licenseChecking;

  /// No description provided for @licenseRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'License Required'**
  String get licenseRequiredTitle;

  /// No description provided for @licenseActivateValidMessage.
  ///
  /// In en, this message translates to:
  /// **'Please activate a valid license to continue.'**
  String get licenseActivateValidMessage;

  /// No description provided for @licenseProIncludes.
  ///
  /// In en, this message translates to:
  /// **'PupilMetrics Pro includes:'**
  String get licenseProIncludes;

  /// No description provided for @licenseFeatureUnlimitedAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Unlimited pupil-collarette analysis'**
  String get licenseFeatureUnlimitedAnalysis;

  /// No description provided for @licenseFeaturePdfReports.
  ///
  /// In en, this message translates to:
  /// **'PDF report generation'**
  String get licenseFeaturePdfReports;

  /// No description provided for @licenseFeatureBilateralComparison.
  ///
  /// In en, this message translates to:
  /// **'Bilateral comparison'**
  String get licenseFeatureBilateralComparison;

  /// No description provided for @licenseFeatureAnwAnalysis.
  ///
  /// In en, this message translates to:
  /// **'ANW collarette analysis'**
  String get licenseFeatureAnwAnalysis;

  /// No description provided for @licenseFeatureScanHistory.
  ///
  /// In en, this message translates to:
  /// **'Scan history database'**
  String get licenseFeatureScanHistory;

  /// No description provided for @licenseFeatureUpdates.
  ///
  /// In en, this message translates to:
  /// **'Free updates for 1 year'**
  String get licenseFeatureUpdates;

  /// No description provided for @licensePurchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase License'**
  String get licensePurchase;

  /// No description provided for @licenseExitApplication.
  ///
  /// In en, this message translates to:
  /// **'Exit Application'**
  String get licenseExitApplication;

  /// No description provided for @windowCompactView.
  ///
  /// In en, this message translates to:
  /// **'Compact View'**
  String get windowCompactView;

  /// No description provided for @windowExpandedView.
  ///
  /// In en, this message translates to:
  /// **'Expanded View'**
  String get windowExpandedView;

  /// No description provided for @licenseStatusTrialDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'Trial ({count} days left)'**
  String licenseStatusTrialDaysLeft(int count);

  /// No description provided for @licenseNotLicensed.
  ///
  /// In en, this message translates to:
  /// **'Not Licensed'**
  String get licenseNotLicensed;

  /// No description provided for @licenseStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'License Status'**
  String get licenseStatusTitle;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @plrReportTitle.
  ///
  /// In en, this message translates to:
  /// **'PLR Analysis Report'**
  String get plrReportTitle;

  /// No description provided for @plrResearchOnlyTitle.
  ///
  /// In en, this message translates to:
  /// **'RESEARCH/EDUCATIONAL TOOL ONLY'**
  String get plrResearchOnlyTitle;

  /// No description provided for @plrResearchDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Results are NOT medical diagnoses. Consult healthcare professional.'**
  String get plrResearchDisclaimer;

  /// No description provided for @plrNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get plrNameLabel;

  /// No description provided for @plrAgeYears.
  ///
  /// In en, this message translates to:
  /// **'Age: {age} years'**
  String plrAgeYears(int age);

  /// No description provided for @plrTestLabel.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get plrTestLabel;

  /// No description provided for @plrSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'PLR Summary'**
  String get plrSummaryTitle;

  /// No description provided for @plrGradeValue.
  ///
  /// In en, this message translates to:
  /// **'Grade {grade}'**
  String plrGradeValue(String grade);

  /// No description provided for @plrStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get plrStatusLabel;

  /// No description provided for @plrDetectedStatus.
  ///
  /// In en, this message translates to:
  /// **'PLR DETECTED'**
  String get plrDetectedStatus;

  /// No description provided for @plrWeakNotDetectedStatus.
  ///
  /// In en, this message translates to:
  /// **'WEAK/NOT DETECTED'**
  String get plrWeakNotDetectedStatus;

  /// No description provided for @plrRecoveryTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Recovery Time'**
  String get plrRecoveryTimeLabel;

  /// No description provided for @plrRecoveryRatioLabel.
  ///
  /// In en, this message translates to:
  /// **'Recovery Ratio'**
  String get plrRecoveryRatioLabel;

  /// No description provided for @plrChartDescription.
  ///
  /// In en, this message translates to:
  /// **'Visual representation of pupil response over time'**
  String get plrChartDescription;

  /// No description provided for @plrPiRange.
  ///
  /// In en, this message translates to:
  /// **'P/I Range: {min}% - {max}%'**
  String plrPiRange(String min, String max);

  /// No description provided for @plrMinValue.
  ///
  /// In en, this message translates to:
  /// **'Min: {value}%'**
  String plrMinValue(String value);

  /// No description provided for @plrFrameDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Frame Data'**
  String get plrFrameDataTitle;

  /// No description provided for @plrTableTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get plrTableTime;

  /// No description provided for @plrTablePiPercent.
  ///
  /// In en, this message translates to:
  /// **'P/I %'**
  String get plrTablePiPercent;

  /// No description provided for @plrTablePhase.
  ///
  /// In en, this message translates to:
  /// **'Phase'**
  String get plrTablePhase;

  /// No description provided for @plrTableConfidenceShort.
  ///
  /// In en, this message translates to:
  /// **'Conf'**
  String get plrTableConfidenceShort;

  /// No description provided for @plrSuccessfulFailed.
  ///
  /// In en, this message translates to:
  /// **'Successful: {success} | Failed: {fail}'**
  String plrSuccessfulFailed(int success, int fail);

  /// No description provided for @plrReferenceLatencyLine.
  ///
  /// In en, this message translates to:
  /// **'• Latency: 200-500ms (time to initial response)'**
  String get plrReferenceLatencyLine;

  /// No description provided for @plrReferenceConstrictionLine.
  ///
  /// In en, this message translates to:
  /// **'• Constriction: 10-30% reduction from baseline'**
  String get plrReferenceConstrictionLine;

  /// No description provided for @plrReferenceVelocityLine.
  ///
  /// In en, this message translates to:
  /// **'• Velocity: 1.5-4.0%/second'**
  String get plrReferenceVelocityLine;

  /// No description provided for @plrReferenceRecoveryLine.
  ///
  /// In en, this message translates to:
  /// **'• Recovery: >75% return to baseline within 5 seconds'**
  String get plrReferenceRecoveryLine;

  /// No description provided for @plrReferenceRecoveryLineShort.
  ///
  /// In en, this message translates to:
  /// **'• Recovery: >75% return to baseline within 5s'**
  String get plrReferenceRecoveryLineShort;

  /// No description provided for @plrShareSubject.
  ///
  /// In en, this message translates to:
  /// **'PLR Analysis Report - {eye}'**
  String plrShareSubject(String eye);

  /// No description provided for @plrTextReportTitle.
  ///
  /// In en, this message translates to:
  /// **'PLR VIDEO ANALYSIS REPORT'**
  String get plrTextReportTitle;

  /// No description provided for @plrTextDisclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'DISCLAIMER: Research/Educational Tool Only'**
  String get plrTextDisclaimerTitle;

  /// No description provided for @plrTextDisclaimerBody.
  ///
  /// In en, this message translates to:
  /// **'Results are NOT medical diagnoses.'**
  String get plrTextDisclaimerBody;

  /// No description provided for @plrOverallGradeLabel.
  ///
  /// In en, this message translates to:
  /// **'Overall Grade'**
  String get plrOverallGradeLabel;

  /// No description provided for @plrEndOfReport.
  ///
  /// In en, this message translates to:
  /// **'END OF REPORT'**
  String get plrEndOfReport;

  /// Zone overlay / analysis: Zone Overlay
  ///
  /// In en, this message translates to:
  /// **'Zone Overlay'**
  String get zoneOverlay;

  /// Zone overlay / analysis: Tip: drag image to align limbus with overlay circl
  ///
  /// In en, this message translates to:
  /// **'Tip: drag image to align limbus with overlay circles.'**
  String get tipDragImage;

  /// Zone overlay / analysis: Overlay Metrics
  ///
  /// In en, this message translates to:
  /// **'Overlay Metrics'**
  String get overlayMetrics;

  /// Zone overlay / analysis: P/I Ratio:
  ///
  /// In en, this message translates to:
  /// **'P/I Ratio:'**
  String get piRatioLabel;

  /// Zone overlay / analysis: Ellipseness:
  ///
  /// In en, this message translates to:
  /// **'Ellipseness:'**
  String get ellipsenessLabel;

  /// Zone overlay / analysis: Decentralization:
  ///
  /// In en, this message translates to:
  /// **'Decentralization:'**
  String get decentralizationLabel;

  /// Zone overlay / analysis: Detected findings
  ///
  /// In en, this message translates to:
  /// **'Detected findings'**
  String get detectedFindings;

  /// Zone overlay / analysis: ANW / COLLARETTE
  ///
  /// In en, this message translates to:
  /// **'ANW / COLLARETTE'**
  String get anwCollarette;

  /// Zone overlay / analysis: Observer notes
  ///
  /// In en, this message translates to:
  /// **'Observer notes'**
  String get observerNotes;

  /// Zone overlay / analysis: Enter clinical observations, zone findings, patter
  ///
  /// In en, this message translates to:
  /// **'Enter clinical observations, zone findings, patterns…'**
  String get observerNotesHint;

  /// Zone overlay / analysis: Auto-center
  ///
  /// In en, this message translates to:
  /// **'Auto-center'**
  String get autoCenter;

  /// Zone overlay / analysis: ANW Ring
  ///
  /// In en, this message translates to:
  /// **'ANW Ring'**
  String get anwRing;

  /// Zone overlay / analysis: Axis/Grid
  ///
  /// In en, this message translates to:
  /// **'Axis/Grid'**
  String get axisGrid;

  /// Zone overlay / analysis: Chart
  ///
  /// In en, this message translates to:
  /// **'Chart'**
  String get chart;

  /// Zone overlay / analysis: Hover or tap a zone to identify
  ///
  /// In en, this message translates to:
  /// **'Hover or tap a zone to identify'**
  String get hoverToIdentify;

  /// Zone overlay / analysis: Organs mode — hover iris to identify zones
  ///
  /// In en, this message translates to:
  /// **'Organs mode — hover iris to identify zones'**
  String get organsMode;

  /// Zone overlay / analysis: Mild size difference. May be physiological variati
  ///
  /// In en, this message translates to:
  /// **'Mild size difference. May be physiological variation.'**
  String get mildSizeDiff;

  /// Zone overlay / analysis: Within research baseline for age {age} ({group})
  ///
  /// In en, this message translates to:
  /// **'Within research baseline for age {age} ({group})'**
  String withinBaseline(Object age, Object group);

  /// Zone overlay / analysis: Form:
  ///
  /// In en, this message translates to:
  /// **'Form:'**
  String get formLabel;

  /// Zone overlay / analysis: Flattening:
  ///
  /// In en, this message translates to:
  /// **'Flattening:'**
  String get flatteningLabel;

  /// Zone overlay / analysis: Protrusion:
  ///
  /// In en, this message translates to:
  /// **'Protrusion:'**
  String get protrusionLabel;

  /// Zone overlay / analysis: Decentration:
  ///
  /// In en, this message translates to:
  /// **'Decentration:'**
  String get decentrationLabel;

  /// Zone overlay / analysis: Pupil size:
  ///
  /// In en, this message translates to:
  /// **'Pupil size:'**
  String get pupilSizeLabel;

  /// Zone overlay / analysis: ANW ratio:
  ///
  /// In en, this message translates to:
  /// **'ANW ratio:'**
  String get anwRatioLabel;

  /// Zone overlay / analysis: ANW tone:
  ///
  /// In en, this message translates to:
  /// **'ANW tone:'**
  String get anwToneLabel;

  /// Zone overlay / analysis: No major OD pupil anomalies.
  ///
  /// In en, this message translates to:
  /// **'No major OD pupil anomalies.'**
  String get noMajorODAnomalies;

  /// Zone overlay / analysis: No major OS pupil anomalies.
  ///
  /// In en, this message translates to:
  /// **'No major OS pupil anomalies.'**
  String get noMajorOSAnomalies;

  /// Zone overlay / analysis: ANW: not assessed
  ///
  /// In en, this message translates to:
  /// **'ANW: not assessed'**
  String get anwNotAssessed;

  /// Zone overlay / analysis: Manual alignment aid for review only (post-capture
  ///
  /// In en, this message translates to:
  /// **'Manual alignment aid for review only (post-capture). Drag image or use Auto-center.'**
  String get manualAlignmentAid;

  /// Zone overlay / analysis: S: Frontal shift.
  ///
  /// In en, this message translates to:
  /// **'S: Frontal shift.'**
  String get frontalShift;

  /// Zone overlay / analysis: Cerebral circulation patterns.
  ///
  /// In en, this message translates to:
  /// **'Cerebral circulation patterns.'**
  String get cerebralCirculation;

  /// Zone overlay / analysis: D: Middle-temporal shift.
  ///
  /// In en, this message translates to:
  /// **'D: Middle-temporal shift.'**
  String get middleTemporalShift;

  /// Zone overlay / analysis: Respiratory and cardiac autonomic patterns.
  ///
  /// In en, this message translates to:
  /// **'Respiratory and cardiac autonomic patterns.'**
  String get respiratoryCardiac;

  /// Zone overlay / analysis: Findings:
  ///
  /// In en, this message translates to:
  /// **'Findings:'**
  String get findings;

  /// No description provided for @analysisReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Pupil Analysis Report'**
  String get analysisReportTitle;

  /// No description provided for @reportResearchVersion.
  ///
  /// In en, this message translates to:
  /// **'Research Version'**
  String get reportResearchVersion;

  /// No description provided for @reportDisclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'DISCLAIMER: Research/Educational Tool Only'**
  String get reportDisclaimerTitle;

  /// No description provided for @reportDisclaimerBody.
  ///
  /// In en, this message translates to:
  /// **'Results are research observations, NOT medical diagnoses.'**
  String get reportDisclaimerBody;

  /// No description provided for @reportPersonInformationTitle.
  ///
  /// In en, this message translates to:
  /// **'Person Information'**
  String get reportPersonInformationTitle;

  /// No description provided for @reportAgeGroupLabel.
  ///
  /// In en, this message translates to:
  /// **'Age Group'**
  String get reportAgeGroupLabel;

  /// No description provided for @reportPupilSizeComparisonTitle.
  ///
  /// In en, this message translates to:
  /// **'Pupil Size Comparison'**
  String get reportPupilSizeComparisonTitle;

  /// No description provided for @reportCaptureDistanceMetricsTitle.
  ///
  /// In en, this message translates to:
  /// **'Capture Distance Metrics'**
  String get reportCaptureDistanceMetricsTitle;

  /// No description provided for @reportResearchObservationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Research Observations'**
  String get reportResearchObservationsTitle;

  /// No description provided for @reportObserverNotesZoneOverlayTitle.
  ///
  /// In en, this message translates to:
  /// **'Observer Notes (Zone Overlay)'**
  String get reportObserverNotesZoneOverlayTitle;

  /// No description provided for @reportEndOfReport.
  ///
  /// In en, this message translates to:
  /// **'END OF REPORT'**
  String get reportEndOfReport;

  /// No description provided for @reportGradeLabel.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get reportGradeLabel;

  /// No description provided for @reportPupilFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Pupil Form'**
  String get reportPupilFormTitle;

  /// No description provided for @reportDecentrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Decentration'**
  String get reportDecentrationTitle;

  /// No description provided for @reportFlatteningsTitle.
  ///
  /// In en, this message translates to:
  /// **'Flattenings'**
  String get reportFlatteningsTitle;

  /// No description provided for @reportProtrusionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Protrusions'**
  String get reportProtrusionsTitle;

  /// No description provided for @reportAnwParametersTitle.
  ///
  /// In en, this message translates to:
  /// **'Autonomic Nerve Wreath (ANW)'**
  String get reportAnwParametersTitle;

  /// No description provided for @reportTonicStateLabel.
  ///
  /// In en, this message translates to:
  /// **'Tonic State'**
  String get reportTonicStateLabel;

  /// No description provided for @reportShiftDetectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Shift Detected'**
  String get reportShiftDetectedTitle;

  /// No description provided for @reportClinicalLabel.
  ///
  /// In en, this message translates to:
  /// **'Clinical'**
  String get reportClinicalLabel;

  /// No description provided for @reportConstrictionDetectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Constriction Detected'**
  String get reportConstrictionDetectedTitle;

  /// No description provided for @reportSeverityLabel.
  ///
  /// In en, this message translates to:
  /// **'Severity'**
  String get reportSeverityLabel;

  /// No description provided for @reportReferenceValuesTitle.
  ///
  /// In en, this message translates to:
  /// **'Reference Values (CNRI Research Protocol)'**
  String get reportReferenceValuesTitle;

  /// No description provided for @reportMatchLabel.
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get reportMatchLabel;

  /// No description provided for @reportValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get reportValueLabel;

  /// No description provided for @reportNormalPupilForm.
  ///
  /// In en, this message translates to:
  /// **'Normal pupil form'**
  String get reportNormalPupilForm;

  /// No description provided for @reportPageXofY.
  ///
  /// In en, this message translates to:
  /// **'Page {page}/{total}'**
  String reportPageXofY(int page, int total);

  /// No description provided for @reportShareSubject.
  ///
  /// In en, this message translates to:
  /// **'Pupil Analysis Report - {patientName}'**
  String reportShareSubject(String patientName);

  /// No description provided for @reportShareBody.
  ///
  /// In en, this message translates to:
  /// **'Attached is the pupil analysis report for {patientName}, generated on {date}.'**
  String reportShareBody(String patientName, String date);

  /// No description provided for @belowBaseline.
  ///
  /// In en, this message translates to:
  /// **'Below research baseline for age {age} ({group})'**
  String belowBaseline(int age, String group);

  /// No description provided for @aboveBaseline.
  ///
  /// In en, this message translates to:
  /// **'Above research baseline for age {age} ({group})'**
  String aboveBaseline(int age, String group);

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Infant'**
  String get ageGroupInfant;

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Child (1-5)'**
  String get ageGroupChild15;

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Child (6-11)'**
  String get ageGroupChild611;

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Teen'**
  String get ageGroupTeen;

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Adult (20-39)'**
  String get ageGroupAdult2039;

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Adult (40-59)'**
  String get ageGroupAdult4059;

  /// Localized age group label
  ///
  /// In en, this message translates to:
  /// **'Senior (60+)'**
  String get ageGroupSenior60Plus;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'ko',
        'pt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
