import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
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
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'CNRI Eye Capture'**
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
  /// **'Center'**
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
  /// **'Delete PLR analysis for {name} ({eye})?\n\nThis cannot be undone.'**
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
  /// **'Close'**
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
  /// **'Position the {eye} eye within the circle.\nKeep steady during the {seconds}-second recording.'**
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
  /// **'1. Position the eye within the guide circle\n2. Tap \"Start PLR Recording\"\n3. Hold steady for 10 seconds\n4. A flash will occur at 3 seconds\n5. The app records pupil response'**
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
  /// **'ANW Ratio'**
  String get anwRatio;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
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
