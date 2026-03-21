// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'CNRI Capture Oculaire';

  @override
  String get analyzeButton => 'Analyser';

  @override
  String get plrModes => 'Modes RPL';

  @override
  String get captureInstructions => 'Positionnez l\'œil dans le cercle guide';

  @override
  String get scanHistory => 'Historique des Scans';

  @override
  String get selectCameraMode => 'Sélectionner le Mode Caméra';

  @override
  String get loadFromGallery => 'Charger depuis la Galerie';

  @override
  String get rightEyePhoto => 'Photo Œil Droit';

  @override
  String get leftEyePhoto => 'Photo Œil Gauche';

  @override
  String get autoCapture => 'Capture Automatique';

  @override
  String get autoCaptureDesc => 'Détection oculaire + capture auto 5 secondes';

  @override
  String get manualCapture => 'Capture Manuelle';

  @override
  String get manualCaptureDesc =>
      'Détection oculaire + capture manuelle (caméra arrière)';

  @override
  String get selfieMode => 'Mode Selfie';

  @override
  String get selfieModeDesc =>
      'Détection oculaire + capture auto 5 sec (caméra frontale)';

  @override
  String get plrVideoRear => 'Vidéo RPL (Arrière)';

  @override
  String get plrVideoRearDesc => 'Caméra arrière • capture 10 sec';

  @override
  String get plrVideoSelfie => 'Vidéo RPL (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Caméra frontale • capture 10 sec';

  @override
  String get plrVideoCapture => 'Capture Vidéo RPL';

  @override
  String get frontCamera => 'Caméra Frontale';

  @override
  String get rearCamera => 'Caméra Arrière';

  @override
  String get selectEyeToAssess => 'Sélectionnez l\'œil à évaluer';

  @override
  String get rightEyeOD => 'Œil Droit (OD)';

  @override
  String get leftEyeOS => 'Œil Gauche (OS)';

  @override
  String get recordPlrRightEye => 'Enregistrer RPL œil droit';

  @override
  String get recordPlrLeftEye => 'Enregistrer RPL œil gauche';

  @override
  String get loadRightEyeImage => 'Charger image œil droit';

  @override
  String get loadLeftEyeImage => 'Charger image œil gauche';

  @override
  String get bothEyes => 'Les Deux Yeux';

  @override
  String get loadBothEyesDesc => 'Charger œil droit, puis gauche';

  @override
  String get selectEyeImageFromDevice =>
      'Sélectionnez une image oculaire depuis votre appareil';

  @override
  String get selectRightEyeFirst =>
      'Sélectionnez d\'abord l\'image de l\'œil DROIT (OD)';

  @override
  String get rightEyeSaved =>
      'Œil droit enregistré. Sélectionnez maintenant l\'image de l\'œil GAUCHE (OS)';

  @override
  String get cancelledNoRightEye => 'Annulé - aucun œil droit sélectionné';

  @override
  String get cancelledNoLeftEye => 'Annulé - aucun œil gauche sélectionné';

  @override
  String errorLoadingImages(String error) {
    return 'Erreur de chargement des images : $error';
  }

  @override
  String get crop43 => 'Recadrer (4:3)';

  @override
  String get success => 'Succès';

  @override
  String get imageCroppedSuccess => 'Image recadrée avec succès !';

  @override
  String get error => 'Erreur';

  @override
  String get cropFailed => 'Échec du recadrage. Veuillez réessayer.';

  @override
  String get crop => 'Recadrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get saved => 'Enregistré ! ✅';

  @override
  String get imageSavedToGallery => 'Image enregistrée dans la galerie';

  @override
  String get exposure => 'Exposition';

  @override
  String get flash => 'Flash';

  @override
  String get eye => 'Œil';

  @override
  String get center => 'centre';

  @override
  String get light => 'Lumière';

  @override
  String get ready => 'Prêt';

  @override
  String get on => 'OUI';

  @override
  String get off => 'NON';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUEL';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPILLE';

  @override
  String get plrHistory => 'Historique RPL';

  @override
  String get searchByName => 'Rechercher par nom...';

  @override
  String get totalScans => 'Total Scans';

  @override
  String get thisWeek => 'Cette Semaine';

  @override
  String get patients => 'Patients';

  @override
  String get detected => 'Détecté';

  @override
  String get noPlrRecordsYet => 'Aucun enregistrement RPL';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Enregistrez une vidéo RPL pour voir l\'historique ici';

  @override
  String get deleteRecord => 'Supprimer l\'Enregistrement ?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Supprimer l\'analyse RPL de $name ($eye) ?\n\nCette action est irréversible.';
  }

  @override
  String get delete => 'Supprimer';

  @override
  String get recordDeleted => 'Enregistrement supprimé';

  @override
  String plrAnalysis(String eye) {
    return 'Analyse RPL - $eye';
  }

  @override
  String get patient => 'Patient';

  @override
  String get date => 'Date';

  @override
  String get frames => 'Images';

  @override
  String get baselinePiRatio => 'P/I Base';

  @override
  String get minPiRatio => 'P/I Min';

  @override
  String get plrMagnitude => 'Amplitude RPL';

  @override
  String get constriction => 'Constriction';

  @override
  String get plrDetected => 'RPL Détecté';

  @override
  String get confidence => 'Confiance';

  @override
  String get grade => 'Grade';

  @override
  String get close => 'fermer';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get na => 'N/D';

  @override
  String get takeLeftEyePhoto => 'Photographier l\'Œil Gauche';

  @override
  String get takeRightEyePhoto => 'Photographier l\'Œil Droit';

  @override
  String get nowTakingLeftEye => 'Capture de l\'œil GAUCHE (OS)';

  @override
  String get startingWithRightEye => 'Début avec l\'œil DROIT (OD)';

  @override
  String get captured => 'Capturé ✓';

  @override
  String get useSameDistanceLighting =>
      'Utilisez la même distance et le même éclairage que pour l\'œil droit pour une comparaison précise.';

  @override
  String get step1of2 => 'Étape 1 sur 2';

  @override
  String get step2of2 => 'Étape 2 sur 2';

  @override
  String get bothEyesCaptured => 'Les deux yeux capturés ✓';

  @override
  String get continueToLeftEye => 'Continuer vers l\'Œil Gauche';

  @override
  String get retakeOD => 'Reprendre OD';

  @override
  String get retakeOS => 'Reprendre OS';

  @override
  String get retakeRightEye => 'Reprendre Œil Droit';

  @override
  String get analyzeBothEyes => 'Analyser les Deux Yeux';

  @override
  String get patientInfoMissing => 'Info Patient Manquante';

  @override
  String get rightEyePhotoMissing => 'Photo de l\'œil droit manquante !';

  @override
  String get patientInfoMissingRestart =>
      'Info patient manquante. Veuillez recommencer.';

  @override
  String get exitApp => 'Quitter l\'App';

  @override
  String get tipsForBestResults => 'CONSEILS POUR DE MEILLEURS RÉSULTATS';

  @override
  String get followGuidelinesForQuality =>
      'Suivez ces directives pour une qualité d\'image optimale';

  @override
  String get cameraDistance => 'Distance de la Caméra';

  @override
  String get cameraDistanceDesc =>
      'Gardez la caméra à 10-15 cm de votre œil. Maintenez la même distance pour les deux yeux.';

  @override
  String get lightingPosition => 'Position de l\'Éclairage';

  @override
  String get lightingPositionDesc =>
      'Positionnez la source lumineuse à l\'intérieur ou à l\'extérieur des bords de la pupille. Essayez de regarder vers le flash.';

  @override
  String get avoidReflections => 'Évitez les Reflets';

  @override
  String get avoidReflectionsDesc =>
      'Réduisez les reflets en évitant l\'éblouissement des fenêtres, les miroirs et les lampes directes.';

  @override
  String get centerYourEye => 'Centrez Votre Œil';

  @override
  String get centerYourEyeDesc =>
      'Assurez-vous que l\'œil entier, y compris la sclère (partie blanche), est centré et remplit le cadre.';

  @override
  String get cropProperly => 'Recadrez Correctement';

  @override
  String get cropProperlyDesc =>
      'Recadrez l\'image avec l\'œil au centre. L\'image sera automatiquement enregistrée au format 4:3.';

  @override
  String get importantInformation => 'Information Importante';

  @override
  String get imageRatio43 => 'Format 4:3 pour le standard d\'imagerie médicale';

  @override
  String get forClinicalUseCnri => 'Pour usage clinique avec CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Ne fournit pas de diagnostic médical';

  @override
  String get eyeWideOpenClear =>
      'Assurez-vous que votre œil est grand ouvert et que l\'image est nette';

  @override
  String get personalInfo => 'Info Personnelle';

  @override
  String get personInformation => 'Information de la Personne';

  @override
  String get enterPersonDetails => 'Entrer les Détails de la Personne';

  @override
  String get infoIncludedInReport =>
      'Ces informations seront incluses dans le rapport d\'analyse';

  @override
  String get fullName => 'Nom Complet';

  @override
  String get enterPersonName => 'Entrez le nom de la personne';

  @override
  String get nameRequired => 'Le nom est requis';

  @override
  String get sex => 'Sexe';

  @override
  String get male => 'Masculin';

  @override
  String get female => 'Féminin';

  @override
  String get ageYears => 'Âge (années)';

  @override
  String get enterAge => 'Entrez l\'âge';

  @override
  String get ageRequired => 'L\'âge est requis';

  @override
  String get enterValidNumber => 'Entrez un nombre valide';

  @override
  String get enterValidAge => 'Entrez un âge valide (0-120)';

  @override
  String get mainComplaints => 'Plaintes Principales';

  @override
  String get mainComplaintsOptional => 'Plaintes Principales (optionnel)';

  @override
  String get complaintsHint =>
      'ex. maux de tête, problèmes de vision, fatigue...';

  @override
  String get continueToCaptire => 'Continuer vers la Capture';

  @override
  String get ageImportantNote =>
      'L\'âge est important pour une évaluation précise de la taille pupillaire car les plages normales varient selon l\'âge.';

  @override
  String get submit => 'Soumettre';

  @override
  String get pleaseSelectGender => 'Veuillez sélectionner le sexe !';

  @override
  String get applicationSubmitted => 'Votre demande a été soumise avec succès.';

  @override
  String get type => 'Type :';

  @override
  String get gender => 'Sexe :';

  @override
  String get rightHanded => 'Droitier';

  @override
  String get leftHanded => 'Gaucher';

  @override
  String get partialLeftHandedness => 'Gaucherie partielle';

  @override
  String get retrainedLeftHandedness => 'Gaucherie rééduquée';

  @override
  String get bilateralUseBothHands => 'Utilisation bilatérale des deux mains';

  @override
  String get splashTitle => 'PupilMetrics Capture Oculaire';

  @override
  String get splashDeveloper => 'Développeur - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Outil de Recherche/Éducation';

  @override
  String get startNewAnalysis => 'Nouvelle Analyse';

  @override
  String get viewHistory => 'Voir l\'Historique';

  @override
  String get viewResearchDisclaimer => 'Voir l\'Avertissement de Recherche';

  @override
  String get researchDisclaimerTitle => 'Outil de Recherche/Éducation';

  @override
  String get researchDisclaimerNotMedical => 'N\'est PAS un dispositif médical';

  @override
  String get researchDisclaimerNotClinical =>
      'N\'est PAS destiné au diagnostic clinique';

  @override
  String get researchDisclaimerResults =>
      'Les résultats sont des observations de recherche';

  @override
  String get researchDisclaimerConsult =>
      'Consultez toujours des professionnels de santé';

  @override
  String get researchDisclaimerAcknowledge =>
      'En continuant, vous reconnaissez qu\'il s\'agit d\'un outil de recherche et qu\'il ne doit pas être utilisé pour des décisions médicales.';

  @override
  String get researchDisclaimerWarning =>
      'Cette application est UNIQUEMENT à des fins de RECHERCHE et d\'ÉDUCATION.';

  @override
  String get iUnderstand => 'Je Comprends';

  @override
  String get plrAnalysisTest => 'Test d\'Analyse RPL';

  @override
  String get checkingVideoFile => 'Vérification du fichier vidéo...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Traitement image $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Analyse terminée !';

  @override
  String get errorVideoNotFound => 'Erreur : Fichier vidéo introuvable';

  @override
  String get waitingForResults => 'En attente des résultats...';

  @override
  String get baseline => 'Base';

  @override
  String get flashPhase => 'Flash';

  @override
  String get constrictionPhase => 'Constriction';

  @override
  String get recovery => 'Récupération';

  @override
  String get plrDetectedExclaim => 'RPL DÉTECTÉ !';

  @override
  String get plrWeakNotDetected => 'RPL Faible/Non Détecté';

  @override
  String get min => 'Min';

  @override
  String get plr => 'RPL';

  @override
  String get constrLabel => 'Constr.';

  @override
  String get saveToHistory => 'Sauvegarder dans l\'Historique';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Sauvegarder les Images';

  @override
  String get share => 'Partager';

  @override
  String get frameSavedToGallery => 'Image sauvegardée dans la galerie !';

  @override
  String get failedToSaveFrame => 'Échec de sauvegarde de l\'image';

  @override
  String framesSavedToGallery(int count) {
    return '$count images sauvegardées dans la galerie !';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON copié dans le presse-papiers !';

  @override
  String get reportCopiedToClipboard =>
      'Rapport copié dans le presse-papiers !';

  @override
  String shareFailedError(String error) {
    return 'Échec du partage : $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Sauvegardé dans l\'historique ! (ID : $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Échec de sauvegarde : $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'Aucune image réussie à sauvegarder';

  @override
  String get saveAllFrames => 'Sauvegarder Toutes les Images';

  @override
  String get shareReport => 'Partager le Rapport';

  @override
  String get shareJson => 'Partager JSON';

  @override
  String get rerunTest => 'Relancer le Test';

  @override
  String videoCaptureTitle(String eye) {
    return 'RPL - $eye';
  }

  @override
  String get initializingCamera => 'Initialisation de la caméra...';

  @override
  String usingCamera(String camera) {
    return 'Utilisation de la caméra $camera';
  }

  @override
  String cameraError(String error) {
    return 'Erreur caméra : $error';
  }

  @override
  String get noCamerasFound => 'Aucune caméra trouvée';

  @override
  String get retry => 'Réessayer';

  @override
  String get startPlrRecording => 'Démarrer l\'Enregistrement RPL';

  @override
  String get stopRecording => 'Arrêter l\'Enregistrement';

  @override
  String get phaseReady => 'Prêt';

  @override
  String get phaseStarting => 'Démarrage...';

  @override
  String phaseBaseline(int sec) {
    return 'Base (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'FLASH !';

  @override
  String phaseConstriction(int start, int end) {
    return 'Constriction ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Récupération ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Terminé !';

  @override
  String get readyDesc =>
      'Positionnez l\'œil dans le cercle, puis appuyez sur Démarrer';

  @override
  String get holdSteady => 'Restez stable...';

  @override
  String get recordingBaselinePupil =>
      'Enregistrement de la taille pupillaire de base';

  @override
  String lightStimulus(int ms) {
    return 'Stimulus lumineux (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Mesure de la constriction pupillaire';

  @override
  String get measuringRecovery => 'Mesure de la récupération pupillaire';

  @override
  String get plrRecordingComplete => 'Enregistrement RPL terminé';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Positionnez l\'œil $eye dans le cercle.\nRestez stable pendant l\'enregistrement de $seconds secondes.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Gardez l\'œil stable. Le flash se produira à $sec secondes.';
  }

  @override
  String get recordingComplete => 'Enregistrement Terminé';

  @override
  String get plrVideoCapturedSuccess => 'Vidéo RPL capturée avec succès !';

  @override
  String get duration => 'Durée';

  @override
  String get seconds => 'secondes';

  @override
  String get frameRate => 'Fréquence d\'Images';

  @override
  String get camera => 'Caméra';

  @override
  String flashAt(int sec, int ms) {
    return 'À ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Phases';

  @override
  String get phasesFlow => 'Base → Flash → Constriction → Récupération';

  @override
  String get expectedNormalValues => 'Valeurs Normales Attendues :';

  @override
  String get latency => 'Latence';

  @override
  String get velocity => 'Vitesse';

  @override
  String get testFrameAnalysis => '🧪 Test d\'Analyse d\'Images';

  @override
  String get retake => 'Reprendre';

  @override
  String get done => 'Terminé';

  @override
  String get plrVideoModeTitle => 'Mode Vidéo RPL';

  @override
  String get plrAssessmentTitle =>
      'Évaluation du Réflexe Pupillaire à la Lumière (RPL)';

  @override
  String get plrInstructions =>
      '1. Positionnez l\'œil dans le cercle guide\n2. Appuyez sur \"Démarrer l\'Enregistrement RPL\"\n3. Restez stable pendant 10 secondes\n4. Un flash se produira à 3 secondes\n5. L\'app enregistre la réponse pupillaire';

  @override
  String get recordingPhases => 'Phases d\'Enregistrement :';

  @override
  String get baselinePhaseDesc => 'Taille pupillaire initiale';

  @override
  String get flashPhaseDesc => 'Stimulus lumineux';

  @override
  String get constrictionPhaseDesc => 'La pupille se contracte';

  @override
  String get recoveryPhaseDesc => 'La pupille revient';

  @override
  String get normalPlrValues => 'Valeurs RPL Normales :';

  @override
  String get gotIt => 'Compris';

  @override
  String get pupilAnalysis => 'Analyse Pupillaire';

  @override
  String scansLeft(int count) {
    return '$count restants';
  }

  @override
  String get validatingRightEye => 'Validation de l\'œil droit...';

  @override
  String get validatingLeftEye => 'Validation de l\'œil gauche...';

  @override
  String get analyzingRightEye => 'Analyse de l\'œil droit (OD)...';

  @override
  String get analyzingLeftEye => 'Analyse de l\'œil gauche (OS)...';

  @override
  String get comparingPupils => 'Comparaison des pupilles...';

  @override
  String person(String name) {
    return 'Personne : $name';
  }

  @override
  String get invalidEyeImage => 'Image Oculaire Invalide';

  @override
  String analysisFailed(String error) {
    return 'Analyse échouée : $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'OUTIL DE RECHERCHE/ÉDUCATION UNIQUEMENT';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Cette application est uniquement à des fins de recherche et d\'éducation. Les résultats NE SONT PAS des diagnostics médicaux et N\'ONT PAS été validés pour un usage clinique. Les associations de motifs proviennent de la littérature de recherche historique. Consultez un professionnel de santé pour toute préoccupation de santé.';

  @override
  String get pupilSizeDifference => 'Différence de Taille Pupillaire Détectée';

  @override
  String get significantPupilSizeDiff =>
      'DIFFÉRENCE SIGNIFICATIVE DE TAILLE PUPILLAIRE';

  @override
  String get diff => 'diff';

  @override
  String get researchObservationConsult =>
      'Observation de recherche - Consultez un professionnel de santé pour l\'interprétation';

  @override
  String get ageBasedResearchBaseline =>
      'Référence de Recherche Basée sur l\'Âge';

  @override
  String group(String group) {
    return 'Groupe : $group';
  }

  @override
  String get researchRange => 'Plage de Recherche';

  @override
  String get measuredEst => 'Mesuré (est.)';

  @override
  String get pupilForm => 'Forme Pupillaire';

  @override
  String get decentrationPattern => 'Motif de Décentration';

  @override
  String get flattenings => 'Aplatissements';

  @override
  String get protrusions => 'Protrusions';

  @override
  String zonesCount(int count) {
    return '$count zones';
  }

  @override
  String get bilateralComparison => 'Comparaison Bilatérale';

  @override
  String get parameter => 'Paramètre';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Ratio P/I';

  @override
  String get ellipseness => 'Ellipticité';

  @override
  String get circularity => 'Circularité';

  @override
  String get decentralization => 'Décentration';

  @override
  String get anwRatio => 'Verhältnis';

  @override
  String get normal => 'normal';

  @override
  String get elliptical => 'Elliptique';

  @override
  String get circular => 'Circulaire';

  @override
  String get irregular => 'Irrégulier';

  @override
  String get centered => 'Centré';

  @override
  String get offset => 'Décalé';

  @override
  String get miosis => 'Myosis';

  @override
  String get constricted => 'Contracté';

  @override
  String get dilated => 'Dilaté';

  @override
  String get mydriasis => 'Mydriase';

  @override
  String get inner => 'Interne';

  @override
  String get outer => 'Externe';

  @override
  String get high => 'Élevé';

  @override
  String get moderate => 'Modéré';

  @override
  String get savePdf => 'Sauvegarder PDF';

  @override
  String get sharePdf => 'Partager PDF';

  @override
  String get retakePhotos => 'Reprendre les Photos';

  @override
  String scansLeftBanner(int count) {
    return '$count scans restants';
  }

  @override
  String get upgrade => 'Améliorer';

  @override
  String get unlockUnlimited => 'Débloquer l\'Illimité';

  @override
  String get usedAllFreeScans => 'Vous avez utilisé tous les scans gratuits.';

  @override
  String get unlimitedScans => 'Scans illimités';

  @override
  String get pdfReports => 'Rapports PDF';

  @override
  String get scanHistoryFeature => 'Historique des scans';

  @override
  String get bilateralAnalysis => 'Analyse bilatérale';

  @override
  String get monthly => 'Mensuel';

  @override
  String get perMonth => '/mois';

  @override
  String get annual => 'Annuel';

  @override
  String get perYear => '/an';

  @override
  String get tenCredits => '10 Crédits';

  @override
  String get oneTime => 'unique';

  @override
  String get best => 'MEILLEUR';

  @override
  String get purchaseCancelled => 'Achat annulé';

  @override
  String purchaseFailed(String error) {
    return 'Achat échoué : $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT sauvegardé : $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON sauvegardé : $path';
  }

  @override
  String get pdfSaved => 'PDF Sauvegardé !';

  @override
  String pdfFailed(String error) {
    return 'PDF Échoué : $error';
  }

  @override
  String get open => 'OUVRIR';

  @override
  String failed(String error) {
    return 'Échec : $error';
  }

  @override
  String get staticScans => 'Statique';

  @override
  String get plrScans => 'RPL';

  @override
  String get searchByNameOrComplaints => 'Rechercher par nom ou plaintes...';

  @override
  String get searchPlrRecords => 'Rechercher les enregistrements RPL...';

  @override
  String get noScansYet => 'Aucun scan encore';

  @override
  String get completedScansAppearHere => 'Les scans terminés apparaîtront ici';

  @override
  String get deleteScan => 'Supprimer le Scan ?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Supprimer le scan de $name du $date ?';
  }

  @override
  String get scanDeleted => 'Scan supprimé';

  @override
  String get originalImagesNotFound =>
      'Images oculaires originales introuvables.';

  @override
  String get viewResults => 'Voir les Résultats';

  @override
  String get avgPlr => 'RPL Moy';

  @override
  String get years => 'ans';

  @override
  String get anisocoria => 'Anisocorie';

  @override
  String get none => 'Aucun';

  @override
  String get mild => 'Léger';

  @override
  String get severe => 'Sévère';

  @override
  String zoneLabel(String zone) {
    return 'Zone : $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Associé à $organ';
  }

  @override
  String get significant => 'Significatif';

  @override
  String get fair => 'Moyen';

  @override
  String get low => 'Faible';

  @override
  String get good => 'Bon';

  @override
  String get zones => 'Zones';

  @override
  String get significanceWithinLimits => 'dans les limites acceptables';

  @override
  String get significanceMild => 'léger';

  @override
  String get significanceModerate => 'modéré';

  @override
  String get significanceSignificant => 'significatif';

  @override
  String get formTypeCircle => 'Cercle (Normal)';

  @override
  String get formTypeOval => 'Ovale';

  @override
  String get formTypeOvalVertical => 'Ovale-vertical';

  @override
  String get formTypeOvalHorizontal => 'Ovale-horizontal';

  @override
  String get formTypeOvalDiagonal => 'Ovale-diagonal';

  @override
  String get formTypeLeftObliqueEllipse => 'Ellipse Oblique Gauche';

  @override
  String get formTypeUnilateralEllipse => 'Ellipse Unilatérale';

  @override
  String get formTypeVentralDivergingEllipse => 'Ellipse Divergente Ventrale';

  @override
  String get formTypeFrontalDivergingEllipse => 'Ellipse Divergente Frontale';

  @override
  String get formTypeEllipse => 'Ellipse';

  @override
  String get formTypeChord => 'Corde';

  @override
  String get formTypeIrregular => 'Irrégulier';

  @override
  String get pupilFormCircleDesc =>
      'Forme pupillaire circulaire normale. Aucune variation de motif détectée.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Motif ovale horizontal. La recherche historique a associé cela aux motifs du système nerveux autonome affectant les zones de fonction respiratoire et glandulaire.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Motif ovale vertical. La recherche historique a lié ce motif aux zones de circulation cérébrale dans les études de réflexes autonomes.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Motif ovale diagonal. La littérature de recherche a associé cela aux réflexes de zone urogénitale dans les études autonomes.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Motif d\'ellipse oblique gauche. Les observations historiques ont lié cela aux zones autonomes urogénitales et des membres inférieurs.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Motif d\'ellipse unilatérale. La recherche a indiqué des associations avec les zones autonomes respiratoires et bronchiques.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Ellipse divergente ventrale. Les études historiques ont associé cela aux zones autonomes du bas du corps et aux motifs de fonction motrice.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Ellipse divergente frontale. La littérature de recherche a lié ce motif aux zones autonomes cérébrales et supérieures.';

  @override
  String get pupilFormOvalDesc =>
      'Motif de déformation ovale légère. Surveiller la progression dans les observations de recherche.';

  @override
  String get pupilFormEllipseDesc =>
      'Motif pupillaire elliptique indiquant des variations du système autonome dans les études historiques.';

  @override
  String get pupilFormChordDesc =>
      'Motif de déformation en corde indiquant des influences autonomes localisées dans la littérature de recherche.';

  @override
  String get pupilFormIrregularDesc =>
      'Forme irrégulière suggérant de multiples influences de motifs autonomes basées sur les observations historiques.';

  @override
  String get patternCentered => 'Centré (Normal)';

  @override
  String get patternFrontal => 'Décentralisation frontale';

  @override
  String get patternBasal => 'Décentralisation basale';

  @override
  String get patternNasal => 'Décentralisation nasale';

  @override
  String get patternTemporal => 'Décentralisation temporale';

  @override
  String get patternMiddleNasal => 'Décentralisation nasale moyenne';

  @override
  String get patternMiddleTemporal => 'Décentralisation temporale moyenne';

  @override
  String get patternUpperNasal => 'Décentralisation nasale supérieure';

  @override
  String get patternUpperTemporal => 'Décentralisation temporale supérieure';

  @override
  String get patternLowerNasal => 'Décentralisation nasale inférieure';

  @override
  String get patternLowerTemporal => 'Décentralisation temporale inférieure';

  @override
  String get patternUpwards => 'Décentration - Vers le haut';

  @override
  String get patternDownwards => 'Décentration - Vers le bas';

  @override
  String get patternUpwardsInwards => 'Décentration - Haut-Intérieur';

  @override
  String get patternUpwardsOutwards => 'Décentration - Haut-Extérieur';

  @override
  String get decentrationCenteredDesc =>
      'Positionnement pupillaire normal dans les limites physiologiques.';

  @override
  String get decentrationNasalRightDesc =>
      'Motif nasal (Droit). La recherche historique a associé cette zone aux réflexes autonomes pulmonaires.';

  @override
  String get decentrationNasalLeftDesc =>
      'Motif nasal (Gauche). La littérature de recherche a lié cette zone aux motifs de fonction autonome cardiaque.';

  @override
  String get decentrationTemporalDesc =>
      'Motif temporal. Les observations historiques ont associé cette zone aux réflexes autonomes rénaux et reproductifs.';

  @override
  String get decentrationFrontalRightDesc =>
      'Motif frontal (Droit). La recherche a associé cette zone aux motifs de fonction cognitive et cérébrale.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Motif frontal (Gauche). Les études historiques ont lié cette zone aux motifs autonomes cérébraux.';

  @override
  String get decentrationBasalRightDesc =>
      'Motif basal (Droit). La recherche a indiqué des associations avec les réflexes de pression intracrânienne.';

  @override
  String get decentrationBasalLeftDesc =>
      'Motif basal (Gauche). Les observations historiques ont lié cela aux motifs de zone inflammatoire cérébrale.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Motif nasal supérieur (Droit). La recherche a associé cette zone aux réflexes autonomes hépatobiliaires.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Motif nasal supérieur (Gauche). Les études historiques ont lié cela aux zones spléniques et diaphragmatiques.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Motif temporal supérieur. La recherche a indiqué des associations avec les zones autonomes rénales et reproductives.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Motif nasal moyen (Droit). Les observations historiques ont lié cela aux zones d\'utilisation de l\'oxygène et cardiaques.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Motif nasal moyen (Gauche). La recherche a associé cela aux motifs autonomes neurologiques et cardiaques.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Motif temporal moyen (Droit). La recherche a lié cela aux zones de régulation autonome cardiaque.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Motif temporal moyen (Gauche). Les études historiques ont associé cela aux zones pulmonaires et cardiaques.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Motif nasal supérieur (Droit). La recherche a indiqué des associations avec les zones cognitives et les réflexes de la colonne cervicale.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Motif nasal supérieur (Gauche). Les observations historiques ont lié cela aux motifs cognitifs et zones cervicales.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Motif temporal supérieur (Droit). La recherche a associé cette zone aux réflexes des nerfs crâniens et auditifs.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Motif temporal supérieur (Gauche). Les études historiques ont lié cela aux zones neurovégétatives et de la parole.';

  @override
  String get decentrationLowerNasalDesc =>
      'Motif nasal inférieur. La recherche a indiqué des associations avec les zones autonomes urogénitales et lombo-sacrées.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Motif temporal inférieur (Droit). Les observations historiques ont associé cela aux zones métaboliques et hépatiques.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Motif temporal inférieur (Gauche). La recherche a lié cela aux motifs autonomes cardiaques et spléniques.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Motif associé à la zone centrale supérieure. La recherche historique a lié cela aux réflexes autonomes de régulation de l\'humeur et de l\'énergie.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Motif associé à la zone temporale supérieure. La recherche a indiqué des associations avec les réflexes autonomes des nerfs crâniens et auditifs.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Motif associé à la zone temporale moyenne. Les observations historiques ont lié cela aux motifs autonomes respiratoires et cardiaques.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Motif associé à la zone temporale inférieure. La littérature de recherche a associé cela aux zones autonomes hépatiques et métaboliques.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Motif associé à la zone basale inférieure. Les études historiques ont lié cela aux réflexes autonomes rénaux et des membres inférieurs.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Motif associé à la zone nasale inférieure. La recherche a indiqué des associations avec les zones autonomes urogénitales et pelviennes.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Motif associé à la zone nasale moyenne. Les observations historiques ont lié cela aux motifs autonomes d\'utilisation de l\'oxygène et respiratoires.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Motif associé à la zone nasale supérieure. La littérature de recherche a associé cela aux réflexes autonomes cognitifs et cervicaux.';

  @override
  String get flatteningDefaultRightDesc =>
      'Variation de motif du système nerveux autonome détectée dans cette zone basée sur la recherche historique.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Motif associé à la zone centrale supérieure. La recherche historique a lié cela aux motifs autonomes de régulation de l\'humeur et neurologiques.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Motif associé à la zone temporale supérieure. La recherche a indiqué des associations avec les zones autonomes neurovégétatives et de la parole.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Motif associé à la zone temporale moyenne. Les observations historiques ont lié cela aux réflexes autonomes pulmonaires et cardiaques.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Motif associé à la zone temporale inférieure. La littérature de recherche a associé cela aux motifs autonomes cardiaques et spléniques.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Motif associé à la zone basale inférieure. Les études historiques ont lié cela aux zones autonomes rénales et éliminatoires.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Motif associé à la zone nasale inférieure. La recherche a indiqué des associations avec les réflexes autonomes urogénitaux et lombo-sacrés.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Motif associé à la zone nasale moyenne. Les observations historiques ont lié cela aux motifs autonomes cardiaques et respiratoires.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Motif associé à la zone nasale supérieure. La littérature de recherche a associé cela aux zones autonomes cognitives et cervicales.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Variation de motif du système nerveux autonome détectée dans cette zone basée sur la recherche historique.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Motif de protrusion dans la zone centrale supérieure. La recherche a associé cela aux motifs d\'hyperactivation sympathique affectant les zones cérébrales.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Motif de protrusion dans la zone temporale supérieure. Les observations historiques ont lié cela aux motifs d\'hyperactivité du système des nerfs crâniens et auditif.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Motif de protrusion dans la zone temporale moyenne. La recherche a indiqué des associations avec les motifs sympathiques cardiaques et respiratoires.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Motif de protrusion dans la zone temporale inférieure. Les études historiques ont lié cela aux zones sympathiques hépatobiliaires et métaboliques.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Motif de protrusion dans la zone basale inférieure. La recherche a associé cela aux motifs d\'hyperactivité sympathique rénale et pelvienne.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Motif de protrusion dans la zone nasale inférieure. Les observations historiques ont lié cela aux zones d\'activation sympathique urogénitale.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Motif de protrusion dans la zone nasale moyenne. La recherche a indiqué des associations avec les motifs sympathiques gastriques et pancréatiques.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Motif de protrusion dans la zone nasale supérieure. Les études historiques ont lié cela aux zones d\'hyperactivation sympathique cognitive et visuelle.';

  @override
  String get protrusionDefaultRightDesc =>
      'Motif d\'hyperactivité du système nerveux sympathique détecté dans cette zone basé sur les observations de recherche.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Motif de protrusion dans la zone centrale supérieure. La recherche a associé cela aux motifs sympathiques psychomoteurs et cérébraux.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Motif de protrusion dans la zone temporale supérieure. Les observations historiques ont lié cela aux zones d\'hyperactivité sympathique neurovégétative.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Motif de protrusion dans la zone temporale moyenne. La recherche a indiqué des associations avec les motifs sympathiques pulmonaires et cardiaques.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Motif de protrusion dans la zone temporale inférieure. Les études historiques ont lié cela aux zones d\'activation sympathique splénique et cardiaque.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Motif de protrusion dans la zone basale inférieure. La recherche a associé cela aux motifs d\'hyperactivité sympathique pelvienne et rénale.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Motif de protrusion dans la zone nasale inférieure. Les observations historiques ont lié cela aux zones d\'activation sympathique lombo-sacrée.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Motif de protrusion dans la zone nasale moyenne. La recherche a indiqué des associations avec les motifs sympathiques anxiété-cardiaques.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Motif de protrusion dans la zone nasale supérieure. Les études historiques ont lié cela aux zones d\'hyperactivation sympathique cognitive et visuelle.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Motif d\'hyperactivité du système nerveux sympathique détecté dans cette zone basé sur les observations de recherche.';

  @override
  String get anisocoriaNone =>
      'Tailles pupillaires dans les limites normales. Aucune anisocorie significative détectée.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisocorie détectée : $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'G>D';

  @override
  String get anisocoriaDirectionDS => 'D>G';

  @override
  String get anisocoriaSeverityNone => 'Dans les limites normales.';

  @override
  String get anisocoriaSeverityMild =>
      'Différence légère observée. Peut être physiologique.';

  @override
  String get anisocoriaSeverityModerate =>
      'Asymétrie modérée. Observation de recherche notée.';

  @override
  String get anisocoriaSeveritySevere =>
      'Asymétrie significative. Observation de recherche signalée.';

  @override
  String get largerPupilEqual => 'égal';

  @override
  String get largerPupilOS => 'OG (Gauche)';

  @override
  String get largerPupilOD => 'OD (Droit)';

  @override
  String get decentrationWithinLimits => 'Dans les limites normales.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Décalage : $offset%';
  }

  @override
  String get zoneUpperCentral => 'Central-Supérieur';

  @override
  String get zoneUpperNasal => 'Nasal-Supérieur';

  @override
  String get zoneMiddleNasal => 'Nasal-Moyen';

  @override
  String get zoneLowerNasal => 'Nasal-Inférieur';

  @override
  String get zoneLowerBasal => 'Basal-Inférieur';

  @override
  String get zoneLowerTemporal => 'Temporal-Inférieur';

  @override
  String get zoneMiddleTemporal => 'Temporal-Moyen';

  @override
  String get zoneUpperTemporal => 'Temporal-Supérieur';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Basal';

  @override
  String get zoneUnknown => 'Inconnu';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Aplatissement $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Protrusion $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Mode Iriscope USB';

  @override
  String get iriscopeExternal => 'Iriscope / Externe';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'Utiliser la caméra USB ou l\'iriscope connecté';

  @override
  String get detectedCameras => 'Caméras Détectées';

  @override
  String get externalCamera => 'Caméra Externe';

  @override
  String cameraIndex(int index) {
    return 'Caméra $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Aucune caméra externe détectée.\nConnectez un iriscope USB pour activer.';

  @override
  String get refresh => 'Actualiser';

  @override
  String get selectCameraSource => 'Sélectionner la Source de Caméra';

  @override
  String camerasDetected(int count) {
    return '$count caméras détectées';
  }

  @override
  String camerasAvailable(int count) {
    return '$count caméras disponibles';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Caméra Externe $index';
  }

  @override
  String get qualityGatedRear =>
      'Capture auto avec contrôle qualité (caméra arrière)';

  @override
  String get qualityGatedFront =>
      'Capture auto avec contrôle qualité (caméra avant)';

  @override
  String get usbCameraInfo => 'Info Caméra USB';

  @override
  String get connected => 'Connecté';

  @override
  String get waiting => 'En attente...';

  @override
  String get disconnected => 'Déconnecté';

  @override
  String get waitingForUsbCamera => 'En Attente de Caméra USB';

  @override
  String get connectIriscopePrompt =>
      'Connectez votre iriscope via adaptateur USB OTG.\nAccordez la permission lorsque demandé.';

  @override
  String get usbCameraIssue => 'Problème de Caméra USB';

  @override
  String get pleaseConnectIriscope =>
      'Veuillez connecter votre iriscope ou caméra USB.';

  @override
  String get retryConnection => 'Réessayer la Connexion';

  @override
  String get troubleshootingTips => 'Conseils de Dépannage';

  @override
  String get tipUsbOtgAdapter =>
      'Assurez-vous que l\'adaptateur USB OTG est correctement connecté';

  @override
  String get tipUsbHostMode =>
      'Vérifiez si l\'appareil prend en charge le mode USB Host';

  @override
  String get tipReconnectCamera =>
      'Essayez de déconnecter et reconnecter la caméra';

  @override
  String get tipGrantPermissions =>
      'Accordez les permissions USB lorsque demandé';

  @override
  String get tipUnlockDevice => 'Certains appareils doivent être déverrouillés';

  @override
  String get back => 'Retour';

  @override
  String get switchEye => 'Changer d\'Œil';

  @override
  String get state => 'État';

  @override
  String get status => 'Statut';

  @override
  String get usingFlutterUvcPlugin =>
      'Utilisation du plugin flutter_uvc_camera\npour la prise en charge des appareils USB Video Class.';

  @override
  String get initialized => 'Initialisé';

  @override
  String get notReady => 'Non Prêt';

  @override
  String get captureDistanceMatch => 'Correspondance de Distance';

  @override
  String get irisSize => 'Taille de l\'Iris';

  @override
  String get distanceMatched => 'Distance Correspondante';

  @override
  String get distanceMismatch => 'Distance Non Correspondante';

  @override
  String get excellentMatch => 'Excellente correspondance';

  @override
  String get goodMatch => 'Bonne correspondance';

  @override
  String get acceptableMatch => 'Correspondance acceptable';

  @override
  String get considerRetaking =>
      'Distance non correspondante - envisagez de reprendre';

  @override
  String get qualityReady => 'Prêt ! Restez stable...';

  @override
  String get qualityTooBlurry => 'Maintenez l\'appareil stable';

  @override
  String get qualityTooDark => 'Plus de lumière nécessaire';

  @override
  String get qualityTooBright => 'Trop lumineux - réduisez la lumière';

  @override
  String get qualityNoContrast => 'Ajustez l\'angle d\'éclairage';

  @override
  String get qualityNoPupil => 'Centrez la pupille dans le cadre';

  @override
  String get qualityNotCentered => 'Déplacez l\'œil au centre';

  @override
  String get qualityNotAnEye => 'Aucun œil détecté';

  @override
  String get qualityProcessing => 'Traitement...';

  @override
  String get distanceMatchedCheck => '✓ Distance correspondante';

  @override
  String get distanceGoodMatchCheck => '✓ Bonne correspondance';

  @override
  String get distanceSlightlyBack => 'Légèrement en arrière ↔';

  @override
  String get distanceSlightlyCloser => 'Légèrement plus près ↔';

  @override
  String get distanceAlmostThere => 'Presque...';

  @override
  String get distanceMoveBack => 'Reculez ←←';

  @override
  String get distanceMoveCloser => 'Approchez-vous →→';

  @override
  String get distanceTooClose => 'Trop proche ! Reculez';

  @override
  String get distanceTooFar => 'Trop loin ! Approchez-vous';

  @override
  String get distanceStabilizing => 'Stabilisation...';

  @override
  String distanceLabel(int percent) {
    return 'Distance : $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD : ${odSize}px → OS : ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Caméra Frontale';

  @override
  String get rearCameraLabel => 'Caméra Arrière';

  @override
  String get startingCamera => 'Démarrage de la caméra...';

  @override
  String get eyeNotDetected => 'Œil Non Détecté';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get indicatorEye => 'Œil';

  @override
  String get indicatorSharp => 'Netteté';

  @override
  String get indicatorLight => 'Lumière';

  @override
  String get indicatorFocus => 'Mise au point';

  @override
  String get indicatorPupil => 'Pupille';

  @override
  String get indicatorIris => 'Iris';

  @override
  String get indicatorMatch => 'Corresp.';

  @override
  String get checkImageShape => 'Forme de l\'Image';

  @override
  String get checkCircularIris => 'Iris Circulaire';

  @override
  String get checkDarkPupil => 'Pupille Sombre';

  @override
  String get checkIrisTexture => 'Texture de l\'Iris';

  @override
  String get checkPupilIrisStructure => 'Structure Pupille-Iris';

  @override
  String get checkNaturalColors => 'Couleurs Naturelles';

  @override
  String get checkEdgePattern => 'Motif des Bords';

  @override
  String get errorImageShapeIncorrect =>
      'Forme incorrecte - assurez-vous que l\'œil remplit le cadre';

  @override
  String get errorNoEyeDetected =>
      'Aucun œil détecté - centrez l\'iris dans le cadre';

  @override
  String get errorNoPupilDetected =>
      'Aucune pupille détectée - assurez un bon éclairage';

  @override
  String get errorNoIrisTexture =>
      'Pas de texture d\'iris - rapprochez-vous de l\'œil';

  @override
  String get errorUnusualColors =>
      'Couleurs inhabituelles - évitez les écrans/reflets';

  @override
  String get errorTooManyEdges =>
      'Trop de bords droits - ce n\'est peut-être pas un œil';

  @override
  String get errorNotValidEye => 'Image d\'œil non valide - veuillez réessayer';

  @override
  String get holdStillCapturing => 'Ne bougez pas - capture...';

  @override
  String get adjustDistanceFirst => 'Ajustez d\'abord la distance';

  @override
  String get stabilizingReading => 'Stabilisation...';

  @override
  String get autoCaptureWhenReady => 'Capture auto quand prêt';

  @override
  String get tapOrWaitAutoCapture => 'Appuyez ou attendez la capture auto';

  @override
  String get validatingImage => 'Validation...';

  @override
  String get capturingStatus => 'Capture...';

  @override
  String get adjustPositionStatus => 'Ajustez la position';

  @override
  String get validationTip =>
      'Conseil : Assurez un bon éclairage, tenez l\'appareil à 10-15cm de l\'œil, évitez les reflets';

  @override
  String get validationChecksTitle => 'Vérifications de Validation :';

  @override
  String confidenceLabel(int percent) {
    return 'Confiance :';
  }

  @override
  String get incompleteData => 'Données incomplètes';

  @override
  String get irisDiameterLabel => 'iris ø';

  @override
  String get plrResponseCurve => 'Courbe de Réponse PLR';

  @override
  String get plrLatency => 'Latence';

  @override
  String get plrVelocity => 'Vélocité';

  @override
  String get plrRecoveryTime => 'Récupération';

  @override
  String get plrRecoveryRatio => 'Ratio Réc.';

  @override
  String get plrEnhancedMetrics => 'Métriques PLR Avancées';

  @override
  String get plrNormalLatency => 'Normal : 200-500ms';

  @override
  String get plrNormalConstriction => 'Normal : 10-30%';

  @override
  String get plrNormalVelocity => 'Normal : 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'Valeurs de Référence PLR Normales';

  @override
  String get plrSubjectInfo => 'Information du Sujet';

  @override
  String get plrTestType => 'Réflexe Pupillaire à la Lumière';

  @override
  String get plrAnalysisSummary => 'Résumé de l\'Analyse';

  @override
  String get plrTotalFrames => 'Total d\'Images Analysées';

  @override
  String get plrSuccessRate => 'Taux de Réussite';

  @override
  String get plrMaxConstriction => 'Constriction Maximale';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => 'Autonomer Nervenkranz (ANW)';

  @override
  String get anwAbnormal => 'Abnormal';

  @override
  String get anwDiameter => 'Durchmesser';

  @override
  String get anwPerimeter => 'Umfang';

  @override
  String get anwAsymmetry => 'Asymmetrie';

  @override
  String get anwElevated => 'Erhöht';

  @override
  String get anwFormType => 'Formtyp';

  @override
  String get anwRegular => 'Regulär';

  @override
  String get anwDrawnIn => 'Eingezogen';

  @override
  String get anwIndented => 'Eingekerbt';

  @override
  String get anwLacerated => 'Zerrissen';

  @override
  String get anwSpastic => 'Spastisch';

  @override
  String get anwAtonic => 'Atonisch';

  @override
  String get anwTonicState => 'Schema Tonique Historique';

  @override
  String get anwParasympathotonic => 'Schema parasympathicotonique';

  @override
  String get anwSympathotonicState => 'Schema sympathicotonique';

  @override
  String get anwShiftDetected => 'Schema Historique de Decalage';

  @override
  String get anwConstrictionDetected => 'Verengung Erkannt';

  @override
  String get anwFindings => 'Befunde';

  @override
  String get anwRatioComparison => 'ANW-Verhältnis';

  @override
  String get bilateralANWComparison => 'Bilateraler ANW-Vergleich';

  @override
  String get anwSymmetryNormal => 'ANW-Symmetrie innerhalb normaler Grenzen.';

  @override
  String get anwAsymmetryDetected =>
      'ANW-Asymmetrie zwischen den Augen erkannt.';

  @override
  String get functionalFrustration =>
      'Funktionelle Frustration in der Korrelation zwischen sympathischem und parasympathischem Nervensystem.';

  @override
  String get anwParasympathotonicDesc =>
      'Des observations historiques ont associe cela a une sensibilite liminale accrue, une activite reflexe acceleree et des fonctions secretrices/evacuatrices gastro-intestinales augmentees.';

  @override
  String get anwSympathotonicDesc =>
      'Des observations historiques ont associe cela a une sensibilite liminale diminuee, une activite reflexe ralentie et des fonctions secretrices/evacuatrices gastro-intestinales reduites.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Des etudes historiques selon Velchover ont associe cela a des profils de surcharge ventriculaire gauche et de stress cardiaque.';

  @override
  String get anwFrontalConstricted =>
      'Frontalzone des Pupillengürtels ist verengt.';

  @override
  String get anwBasalConstricted =>
      'Basalzone des Pupillengürtels ist verengt.';

  @override
  String get anwFrontalBasalConstricted =>
      'Frontal- und Basalzonen des Pupillengürtels sind verengt.';

  @override
  String get helpTitle => 'Aide et Guide Utilisateur';

  @override
  String get helpTabQuickStart => 'Démarrage Rapide';

  @override
  String get helpTabCnriAnalysis => 'Analyse CNRI';

  @override
  String get helpTabShortcuts => 'Raccourcis';

  @override
  String get helpTabTroubleshooting => 'Dépannage';

  @override
  String get helpOnlineDocs => 'Documentation En Ligne';

  @override
  String get helpContactSupport => 'Contacter Support';

  @override
  String get helpGettingStarted => 'Pour Commencer';

  @override
  String get helpStep1Title => 'Connectez Votre Iriscope';

  @override
  String get helpStep1Desc =>
      'Connectez votre Dino-Lite ou iriscope USB compatible.';

  @override
  String get helpStep2Title => 'Entrez les Informations Patient';

  @override
  String get helpStep2Desc =>
      'Remplissez nom, âge, sexe et plaintes principales du patient.';

  @override
  String get helpStep3Title => 'Capturez l\'Œil Droit (OD)';

  @override
  String get helpStep3Desc =>
      'Positionnez l\'iriscope et capturez l\'image de l\'œil droit.';

  @override
  String get helpStep4Title => 'Capturez l\'Œil Gauche (OS)';

  @override
  String get helpStep4Desc =>
      'Répétez pour l\'œil gauche avec un éclairage constant.';

  @override
  String get helpStep5Title => 'Examinez l\'Analyse';

  @override
  String get helpStep5Desc =>
      'L\'app analyse le ratio P/I, la forme pupillaire et les caractéristiques ANW.';

  @override
  String get helpStep6Title => 'Exportez le Rapport';

  @override
  String get helpStep6Desc => 'Sauvegardez en format PDF, TXT ou JSON.';

  @override
  String get helpTipBestResults =>
      'Pour de meilleurs résultats : Utilisez un éclairage constant et maintenez 2-3cm de distance de l\'iriscope.';

  @override
  String get helpCnriProtocolFeatures => 'Caractéristiques du Protocole CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Ratio Pupille/Iris (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal : 20-30%. Les valeurs en dehors peuvent indiquer un déséquilibre autonome.';

  @override
  String get helpFeaturePupilFormTitle => 'Analyse de Forme Pupillaire';

  @override
  String get helpFeaturePupilFormDesc =>
      'Détecte les motifs ovales, direction de décentration et excentricité.';

  @override
  String get helpFeatureAnwTitle => 'Évaluation ANW (Collerette)';

  @override
  String get helpFeatureAnwDesc =>
      'Analyse le ratio, régularité de forme, déplacements sectoriels et état tonique.';

  @override
  String get helpFeatureZoneTitle => 'Analyse des Zones';

  @override
  String get helpFeatureZoneDesc =>
      'Cartographie les aplatissements/protrusions vers les zones d\'organes CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Comparaison Bilatérale';

  @override
  String get helpFeatureBilateralDesc =>
      'Compare OD vs OS pour détecter les asymétries.';

  @override
  String get helpFeatureMlTitle => 'Comparaison ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'Le modèle ONNX CNN fournit des mesures secondaires à des fins de comparaison.';

  @override
  String get helpKeyboardShortcuts => 'Raccourcis Clavier';

  @override
  String get helpCameraControls => 'Contrôles Caméra';

  @override
  String get helpShortcutSpace => 'Capturer image';

  @override
  String get helpShortcutCtrlS => 'Sauvegarder rapport PDF';

  @override
  String get helpShortcutCtrlO => 'Ouvrir image galerie';

  @override
  String get helpShortcutCtrlH => 'Voir historique examens';

  @override
  String get helpShortcutF11 => 'Basculer plein écran';

  @override
  String get helpShortcutEsc => 'Retour / Annuler';

  @override
  String get helpShortcutScroll => 'Zoom avant/arrière';

  @override
  String get helpShortcutDoubleClick => 'Réinitialiser zoom';

  @override
  String get helpCommonIssues => 'Problèmes Courants';

  @override
  String get helpIssueCameraNotDetected => 'Caméra non détectée';

  @override
  String get helpIssueCameraSolution1 => 'Vérifiez la connexion USB';

  @override
  String get helpIssueCameraSolution2 => 'Essayez un autre port USB';

  @override
  String get helpIssueCameraSolution3 => 'Installez les pilotes Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Redémarrez l\'application';

  @override
  String get helpIssuePupilDetectionFails => 'Échec détection pupille';

  @override
  String get helpIssuePupilSolution1 => 'Assurez un éclairage adéquat';

  @override
  String get helpIssuePupilSolution2 => 'Centrez la pupille dans le cadre';

  @override
  String get helpIssuePupilSolution3 => 'Nettoyez la lentille de l\'iriscope';

  @override
  String get helpIssuePupilSolution4 => 'Ajustez la mise au point manuellement';

  @override
  String get helpIssuePdfExportFails => 'Échec export PDF';

  @override
  String get helpIssuePdfSolution1 => 'Vérifiez les permissions du dossier';

  @override
  String get helpIssuePdfSolution2 => 'Assurez l\'espace disque disponible';

  @override
  String get helpIssuePdfSolution3 => 'Fermez les fichiers PDF ouverts';

  @override
  String get helpIssuePdfSolution4 => 'Essayez d\'abord l\'export TXT';

  @override
  String get helpCaptureChecklistTitle => 'Checklist de Capture';

  @override
  String get helpCaptureChecklist1 =>
      'Gardez la pupille centrée et entièrement visible dans le cadre.';

  @override
  String get helpCaptureChecklist2 =>
      'Utilisez un éclairage uniforme et réduisez l\'éblouissement ou les reflets sur la cornée.';

  @override
  String get helpCaptureChecklist3 =>
      'Conservez une distance d\'iriscopie similaire pour l\'œil droit et l\'œil gauche.';

  @override
  String get helpCaptureChecklist4 =>
      'Refaites la mise au point ou reprenez la photo si le bord pupillaire paraît flou.';

  @override
  String get helpExportSettingsTitle => 'Paramètres d\'Export';

  @override
  String get helpExportSettingsDesc =>
      'Auto-sauvegarde PDF peut enregistrer un rapport après l\'analyse, Inclure Images contrôle l\'affichage des photos dans le PDF, et Comparaison ONNX CNN ajoute des valeurs comparatives au rapport.';

  @override
  String get helpHybridScoreTitle => 'Confiance et Grade Hybrides';

  @override
  String get helpHybridScoreDesc =>
      'La confiance et le grade affichés combinent la qualité géométrique classique avec l\'accord ML et reflètent donc la fiabilité de la mesure plutôt qu\'un diagnostic.';

  @override
  String get helpAnomalyGuideTitle => 'Lire les Aplatissements et Protrusions';

  @override
  String get helpAnomalyGuideDesc =>
      'Les aplatissements indiquent un tirage vers l\'intérieur et les protrusions un tirage vers l\'extérieur le long du bord pupillaire ; chaque carte indique la zone, l\'ampleur et l\'association cartographiée.';

  @override
  String get helpZoneOverlayGuideTitle => 'Superposition de Zones';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Utilisez la superposition de zones pour inspecter visuellement les positions sectorielles et vérifier où se situent les anomalies détectées autour de la pupille et de l\'iris.';

  @override
  String get helpContactSupportTip =>
      'Contactez helpdesk@cnri.edu pour assistance.';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsCameraIriscope => 'CAMÉRA / IRISCOPE';

  @override
  String get settingsPreferredCamera => 'Caméra Préférée :';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'Caméra USB';

  @override
  String get settingsCameraAutoDetect => 'Auto-détection';

  @override
  String get settingsDefaultZoom => 'Zoom Par Défaut :';

  @override
  String get settingsAnalysis => 'ANALYSE';

  @override
  String get settingsShowMlComparison => 'Afficher Comparaison ML';

  @override
  String get settingsShowZoneOverlay => 'Afficher Superposition Zones';

  @override
  String get settingsExportReports => 'EXPORT ET RAPPORTS';

  @override
  String get settingsAutoSavePdf => 'Auto-sauvegarde PDF';

  @override
  String get settingsIncludeImages => 'Inclure Images';

  @override
  String get settingsSaved => 'Paramètres sauvegardés';

  @override
  String get aboutResearchEdition => 'Édition Recherche';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutLicense => 'Licence';

  @override
  String get aboutLicensedTo => 'Licencié à :';

  @override
  String get aboutExpires => 'Expire :';

  @override
  String get aboutManageLicense => 'Gérer Licence';

  @override
  String get aboutBasedOnCnri => 'Basé sur le Protocole CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Site Web';

  @override
  String get aboutPrivacy => 'Confidentialité';

  @override
  String get languageSelectTitle => 'Sélectionner Langue';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get languageChanged => 'Langue Changée';

  @override
  String languageChangedMessage(String language) {
    return 'Langue de l\'app définie sur $language';
  }

  @override
  String get languageSystemNotAvailable => 'Système de langue non disponible';

  @override
  String get licenseLoading => 'Chargement...';

  @override
  String get licenseWelcome => 'Bienvenue sur PupilMetrics !';

  @override
  String get licenseTrialFeatures =>
      'Essai gratuit de 14 jours • Fonctionnalités complètes';

  @override
  String get licenseStartTrial => 'Démarrer Essai Gratuit';

  @override
  String get licenseEnterKey => 'Entrer Licence';

  @override
  String get licenseFreeTrial => 'Essai Gratuit';

  @override
  String licenseDaysRemaining(int count) {
    return '$count jours restants';
  }

  @override
  String get licenseTrialEnded => 'Essai Terminé';

  @override
  String get licenseEnterToContinue => 'Entrez licence pour continuer';

  @override
  String get licenseStandard => 'Licence Standard';

  @override
  String get licenseProfessional => 'Licence Professionnelle';

  @override
  String get licenseEnterprise => 'Licence Entreprise';

  @override
  String get licenseLicensed => 'Licencié';

  @override
  String get licenseActive => 'Actif';

  @override
  String get licenseTrialUser => 'Utilisateur Essai';

  @override
  String get licenseLifetime => 'À Vie';

  @override
  String get licenseNotSetUp => 'Non Configurée';

  @override
  String get trialExpiredTitle => 'Période d\'Essai Terminée';

  @override
  String get trialExpiredMessage =>
      'Votre essai de 14 jours est terminé. Pour continuer à analyser les images d\'iris, veuillez acheter une licence.';

  @override
  String get trialExpiredCanStill => 'Vous pouvez encore :';

  @override
  String get trialExpiredViewAnalyses => 'Voir vos analyses précédentes';

  @override
  String get trialExpiredExportReports => 'Exporter les rapports existants';

  @override
  String get trialExpiredAccessHistory => 'Accéder à l\'historique des examens';

  @override
  String get trialExpiredMaybeLater => 'Peut-être Plus Tard';

  @override
  String get licenseRegistration => 'Enregistrement de Licence';

  @override
  String get licenseStatusValid => 'Licencié';

  @override
  String get licenseStatusTrialActive => 'Essai Gratuit';

  @override
  String get licenseStatusTrialExpired => 'Essai Terminé';

  @override
  String get licenseStatusExpired => 'Licence Expirée';

  @override
  String get licenseStatusInvalid => 'Licence Invalide';

  @override
  String get licenseStatusUnregistered => 'Non Configurée';

  @override
  String get licenseStatusMachineMismatch => 'Ordinateur Différent';

  @override
  String get licenseStatusNetworkError => 'Erreur de Connexion';

  @override
  String get licenseEnterKeyTitle => 'Entrer Clé de Licence';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Votre Nom';

  @override
  String get licenseEmailAddress => 'Adresse E-mail';

  @override
  String get licenseMachineId => 'ID Machine';

  @override
  String get licenseCopyMachineId => 'Copier ID Machine';

  @override
  String get licenseMachineIdCopied =>
      'ID machine copié dans le presse-papiers';

  @override
  String get licenseValidationKeyRequired =>
      'Veuillez entrer votre clé de licence';

  @override
  String get licenseValidationKeyFormat =>
      'La clé doit avoir 20 caractères (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Veuillez entrer votre nom';

  @override
  String get licenseValidationEmailRequired => 'Veuillez entrer votre e-mail';

  @override
  String get licenseValidationEmailInvalid =>
      'Veuillez entrer un e-mail valide';

  @override
  String get licenseActivate => 'Activer Licence';

  @override
  String get licenseContinueTrial => 'Continuer Essai';

  @override
  String get licenseBuyLicense => 'Acheter Licence';

  @override
  String get licenseNeedHelp => 'Besoin d\'aide ?';

  @override
  String get licenseLicenseAgreement => 'Contrat de Licence';

  @override
  String get licenseActivatedSuccess => 'Licence Activée avec Succès !';

  @override
  String get licenseMsgMachineMismatch =>
      'Cette licence est enregistrée sur un autre ordinateur. Veuillez utiliser votre appareil original ou contacter le support.';

  @override
  String get licenseMsgTrialEnded =>
      'Votre essai gratuit est terminé. Entrez une clé de licence pour continuer à utiliser toutes les fonctionnalités.';

  @override
  String get licenseMsgExpired =>
      'Votre licence a expiré. Veuillez renouveler pour continuer.';

  @override
  String get licenseMsgNeedsSetup =>
      'La licence doit être configurée. Démarrez votre essai gratuit ou entrez une clé de licence.';

  @override
  String get licenseMsgCheckFormat =>
      'Veuillez vérifier le format de votre clé. Elle doit ressembler à : CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Cette clé de licence n\'a pas été reconnue. Veuillez vérifier et réessayer.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Cette clé est déjà enregistrée sur un autre ordinateur.';

  @override
  String get licenseMsgContactSupport =>
      'Cette licence a expiré. Veuillez contacter le support pour renouvellement.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Licence activée avec succès ! Merci pour votre achat.';

  @override
  String get licenseMsgUnableToActivate =>
      'Impossible d\'activer la licence. Veuillez vérifier votre connexion internet et réessayer.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Bienvenue ! Votre essai gratuit de $days jours a commencé.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Essai actif : $days jours restants.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Essai gratuit actif';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Licence active - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Impossible d\'activer cette clé de licence.';

  @override
  String get licenseMsgNoLongerValid => 'La licence n\'est plus valide.';

  @override
  String get licenseMsgUnableToVerify =>
      'Impossible de vérifier cette clé de licence. Veuillez contacter le support.';

  @override
  String get trialStartedSnackbar => 'Essai Démarré !';

  @override
  String get trialStartedMessage => 'Profitez de 14 jours d\'accès complet';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'Mode de thème';

  @override
  String get methods => 'MÉTHODES';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => 'focus / flou';

  @override
  String get showHide => 'afficher / masquer';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => 'maximiser / restaurer';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => 'minimiser / restaurer';

  @override
  String get dockUndock => 'ancrer / désancrer';

  @override
  String get dockLeft => 'ancrer gauche';

  @override
  String get dockRight => 'ancrer droite';

  @override
  String get undock => 'désancrer';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'réinitialiser';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'transparent';

  @override
  String get red => 'rouge';

  @override
  String get green => 'vert';

  @override
  String get blue => 'bleu';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'haut gauche';

  @override
  String get topCenter => 'haut centre';

  @override
  String get topRight => 'haut droite';

  @override
  String get centerLeft => 'centre gauche';

  @override
  String get centerRight => 'centre droite';

  @override
  String get bottomLeft => 'bas gauche';

  @override
  String get bottomCenter => 'bas centre';

  @override
  String get bottomRight => 'bas droite';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Définir';

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
  String get hidden => 'masqué';

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
  String get defaultIcon => 'Par défaut';

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
  String get dragToMoveArea => 'Glisser pour déplacer';

  @override
  String get dragToResizeArea => 'Glisser pour redimensionner';

  @override
  String get dragToResizeAreaExample => 'Exemple de zone redimensionnable';

  @override
  String get closeWindowConfirmation =>
      'Êtes-vous sûr de vouloir fermer cette fenêtre?';

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
  String get plrReportTitle => 'Rapport d\'analyse PLR';

  @override
  String get plrResearchOnlyTitle =>
      'POUR LA RECHERCHE/L\'EDUCATION UNIQUEMENT';

  @override
  String get plrResearchDisclaimer =>
      'Les resultats NE sont PAS des diagnostics medicaux. Consultez un professionnel de sante.';

  @override
  String get plrNameLabel => 'Nom';

  @override
  String plrAgeYears(int age) {
    return 'Age : $age ans';
  }

  @override
  String get plrTestLabel => 'Test';

  @override
  String get plrSummaryTitle => 'Resume PLR';

  @override
  String plrGradeValue(String grade) {
    return 'Niveau $grade';
  }

  @override
  String get plrStatusLabel => 'Statut';

  @override
  String get plrDetectedStatus => 'PLR DETECTE';

  @override
  String get plrWeakNotDetectedStatus => 'FAIBLE/NON DETECTE';

  @override
  String get plrRecoveryTimeLabel => 'Temps de recuperation';

  @override
  String get plrRecoveryRatioLabel => 'Ratio de recuperation';

  @override
  String get plrChartDescription =>
      'Representation visuelle de la reponse pupillaire au fil du temps';

  @override
  String plrPiRange(String min, String max) {
    return 'Plage P/I : $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min : $value%';
  }

  @override
  String get plrFrameDataTitle => 'Donnees image par image';

  @override
  String get plrTableTime => 'Temps';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Phase';

  @override
  String get plrTableConfidenceShort => 'Conf';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Reussies : $success | Echecs : $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latence : 200-500 ms (temps jusqu\'a la reponse initiale)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Constriction : reduction de 10-30 % par rapport a la base';

  @override
  String get plrReferenceVelocityLine => '• Vitesse : 1,5-4,0 %/seconde';

  @override
  String get plrReferenceRecoveryLine =>
      '• Recuperation : >75 % de retour a la base en 5 secondes';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Recuperation : >75 % de retour a la base en 5 s';

  @override
  String plrShareSubject(String eye) {
    return 'Rapport d\'analyse PLR - $eye';
  }

  @override
  String get plrTextReportTitle => 'RAPPORT D\'ANALYSE VIDEO PLR';

  @override
  String get plrTextDisclaimerTitle =>
      'AVERTISSEMENT : outil de recherche/education uniquement';

  @override
  String get plrTextDisclaimerBody =>
      'Les resultats NE sont PAS des diagnostics medicaux.';

  @override
  String get plrOverallGradeLabel => 'Note globale';

  @override
  String get plrEndOfReport => 'FIN DU RAPPORT';

  @override
  String get zoneOverlay => 'Superposition de Zones';

  @override
  String get tipDragImage =>
      'Astuce: faites glisser l\'image pour aligner le limbe avec les cercles.';

  @override
  String get overlayMetrics => 'Métriques de Superposition';

  @override
  String get piRatioLabel => 'Rapport P/I :';

  @override
  String get ellipsenessLabel => 'Ellipticité :';

  @override
  String get decentralizationLabel => 'Décentration :';

  @override
  String get detectedFindings => 'Résultats détectés';

  @override
  String get anwCollarette => 'ANW / COLLERETTE';

  @override
  String get observerNotes => 'Notes de l\'observateur';

  @override
  String get observerNotesHint =>
      'Saisissez les observations cliniques, résultats de zone, motifs…';

  @override
  String get autoCenter => 'Auto-centrer';

  @override
  String get anwRing => 'Anneau ANW';

  @override
  String get axisGrid => 'Axe/Grille';

  @override
  String get chart => 'Graphique';

  @override
  String get hoverToIdentify => 'Survolez ou touchez une zone pour identifier';

  @override
  String get organsMode => 'Mode organes — survolez l\'iris pour identifier';

  @override
  String get mildSizeDiff =>
      'Légère différence de taille. Variation physiologique possible.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Dans la plage de référence pour l\'âge $age ($group)';
  }

  @override
  String get formLabel => 'Forme :';

  @override
  String get flatteningLabel => 'Aplatissement :';

  @override
  String get protrusionLabel => 'Protrusion :';

  @override
  String get decentrationLabel => 'Décentration :';

  @override
  String get pupilSizeLabel => 'Taille pupillaire :';

  @override
  String get anwRatioLabel => 'Rapport ANW :';

  @override
  String get anwToneLabel => 'Tonus ANW :';

  @override
  String get noMajorODAnomalies => 'Pas d\'anomalies pupillaires OD majeures.';

  @override
  String get noMajorOSAnomalies => 'Pas d\'anomalies pupillaires OS majeures.';

  @override
  String get anwNotAssessed => 'ANW : non évalué';

  @override
  String get manualAlignmentAid =>
      'Aide d\'alignement manuel pour révision uniquement. Glissez l\'image ou utilisez Auto-centrer.';

  @override
  String get frontalShift => 'S : Schema de decalage frontal.';

  @override
  String get cerebralCirculation =>
      'Des etudes historiques selon Velchover ont associe cela a des profils de circulation cerebrale.';

  @override
  String get middleTemporalShift => 'D : Schema de decalage temporo-median.';

  @override
  String get respiratoryCardiac =>
      'Des etudes historiques selon Velchover ont associe cela a des profils autonomes respiratoires et cardiaques.';

  @override
  String get findings => 'Résultats :';

  @override
  String get analysisReportTitle => 'Rapport d analyse pupillaire';

  @override
  String get reportResearchVersion => 'Version de recherche';

  @override
  String get reportDisclaimerTitle =>
      'AVERTISSEMENT : outil de recherche/education uniquement';

  @override
  String get reportDisclaimerBody =>
      'Les resultats sont des observations de recherche et NON des diagnostics medicaux.';

  @override
  String get reportPersonInformationTitle => 'Informations sur la personne';

  @override
  String get reportAgeGroupLabel => 'Groupe d age';

  @override
  String get reportPupilSizeComparisonTitle =>
      'Comparaison de la taille pupillaire';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Metriques de distance de capture';

  @override
  String get reportResearchObservationsTitle => 'Observations de recherche';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Notes de l observateur (superposition de zones)';

  @override
  String get reportEndOfReport => 'FIN DU RAPPORT';

  @override
  String get reportGradeLabel => 'Niveau';

  @override
  String get reportPupilFormTitle => 'Forme pupillaire';

  @override
  String get reportDecentrationTitle => 'Decentration';

  @override
  String get reportFlatteningsTitle => 'Aplatissements';

  @override
  String get reportProtrusionsTitle => 'Protrusions';

  @override
  String get reportAnwParametersTitle => 'Couronne nerveuse autonome (ANW)';

  @override
  String get reportTonicStateLabel => 'Schema Tonique Historique';

  @override
  String get reportShiftDetectedTitle => 'Schema Historique de Decalage';

  @override
  String get reportClinicalLabel => 'Note Historique';

  @override
  String get reportConstrictionDetectedTitle => 'Constriction detectee';

  @override
  String get reportSeverityLabel => 'Severite';

  @override
  String get reportReferenceValuesTitle =>
      'Valeurs de reference (Protocole de recherche CNRI)';

  @override
  String get reportMatchLabel => 'Correspondance';

  @override
  String get reportValueLabel => 'Valeur';

  @override
  String get reportNormalPupilForm => 'Forme pupillaire normale';

  @override
  String reportPageXofY(int page, int total) {
    return 'Page $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Rapport d analyse pupillaire - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Ci-joint le rapport d analyse pupillaire pour $patientName, genere le $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'En dessous de la plage de recherche pour l age $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Au dessus de la plage de recherche pour l age $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Nourrisson';

  @override
  String get ageGroupChild15 => 'Enfant (1-5)';

  @override
  String get ageGroupChild611 => 'Enfant (6-11)';

  @override
  String get ageGroupTeen => 'Adolescent';

  @override
  String get ageGroupAdult2039 => 'Adulte (20-39)';

  @override
  String get ageGroupAdult4059 => 'Adulte (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Senior (60+)';

  @override
  String get middleNasalShift => 'Schema de decalage naso-median.';

  @override
  String get upperTemporalShift => 'Schema de decalage temporo-superieur.';

  @override
  String get lowerTemporalShift => 'Schema de decalage temporo-inferieur.';

  @override
  String get basalShift => 'Schema de decalage basal.';

  @override
  String get vagusStellateAssociation =>
      'Des etudes historiques selon Velchover ont associe cela a des profils d hypofonction du nerf vague ou du ganglion stellaire.';

  @override
  String get venaCavaInferiorAssociation =>
      'Des etudes historiques selon Velchover ont associe cela a des profils de perturbation hemodynamique dans la veine cave inferieure.';

  @override
  String get vertebralArteryAssociation =>
      'Des etudes historiques selon Velchover ont associe cela a des profils de circulation de l artere vertebrale.';

  @override
  String get smallPelvisAssociation =>
      'Des etudes historiques selon Velchover ont associe cela a des profils congestifs du petit bassin.';

  @override
  String get openZoneOverlay => 'Ouvrir la superposition des zones';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'Opacite du graphique';

  @override
  String get irisSizeNotAvailable =>
      'Donnees de taille de l iris non disponibles';

  @override
  String get ratio => 'Rapport';

  @override
  String get reportRefPiRatio => 'Rapport Pupille/Iris: Normal 20-30%';

  @override
  String get reportRefEllipseness => 'Ellipticite: Normal >95%';

  @override
  String get reportRefDecentralization => 'Decentralisation: Normal <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Diff. Taille Pupille: <2% Normal, 2-4% Leger, >4% Significatif';

  @override
  String get enterPatientInfoAnalysis =>
      'Saisir les infos du patient → Analyse';

  @override
  String get chooseCaptureMethod => 'Choisir la méthode de capture :';

  @override
  String get usbCamera => 'Caméra USB';

  @override
  String get selectExistingImage => 'Sélectionner une image existante';

  @override
  String get detectingCameras => 'Détection des caméras...';

  @override
  String get retryDetection => 'Réessayer la détection';

  @override
  String get connectUvcCameraViaUsb => 'Connecter la caméra UVC via USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Vérifier que les pilotes sont installés';

  @override
  String get tapRefreshToDetect =>
      'Appuyez sur Actualiser pour détecter les caméras';

  @override
  String get connectUsbCameraToBegin =>
      'Connecter la caméra USB pour commencer';

  @override
  String get noExternalCameraTitle => 'Aucune caméra externe détectée';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Connectez votre iridoscope USB et assurez-vous qu\'il est branché';

  @override
  String get languagesAvailable => 'Langues disponibles';

  @override
  String get validationChecks => 'Vérifications de validation :';

  @override
  String get eyeQualityTip =>
      'Conseil : Assurez un bon éclairage et gardez l\'œil stable';

  @override
  String get validatingEye => 'Validation de l\'œil...';

  @override
  String get initializing => 'Initialisation...';

  @override
  String get nameLabel => 'Nom :';

  @override
  String get ageLabel => 'Âge :';

  @override
  String get typeLabel => 'Type :';

  @override
  String get pleaseEnterName => 'Veuillez entrer le nom';

  @override
  String get pleaseEnterAge => 'Veuillez entrer l\'âge';

  @override
  String get ageMustBe2Digits => 'L\'âge doit contenir 1 ou 2 chiffres';

  @override
  String get optional => '(Facultatif)';

  @override
  String get bilateralBothHands => 'Utilisation bilatérale des deux mains';

  @override
  String get zoom => 'Zoom';

  @override
  String get zoomSliderTip =>
      'Utilisez le curseur de zoom à droite pour ajuster le grossissement avant l\'enregistrement.';

  @override
  String get aboutProgramDeveloper =>
      'Développeur du Programme - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Taille du graphique';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Opacité du graphique (0 = survol uniquement / Mode organes)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Terminer et retour';

  @override
  String get errorImageShape =>
      'Forme de l\'image incorrecte - assurez-vous que l\'œil remplit le cadre';

  @override
  String get cameraConnected => 'Caméra connectée';

  @override
  String get cameraDisconnected => 'Caméra déconnectée';

  @override
  String get cameraPermissionDenied => 'Permission de caméra refusée';

  @override
  String get cameraFailedInit => 'Échec de l\'initialisation de la caméra';

  @override
  String get cameraInUse => 'La caméra est utilisée par une autre application';

  @override
  String get cameraFormatNotSupported => 'Format de caméra non pris en charge';

  @override
  String get capturedImageNotFound => 'Fichier image capturé introuvable';

  @override
  String get failedToCaptureImage => 'Échec de la capture d\'image';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Une erreur de caméra s\'est produite';

  @override
  String get connectingToUsbIriscope => 'Connexion au irisscope USB...';

  @override
  String get noCamerasDetectedMessage =>
      'Aucune caméra détectée. Assurez-vous que votre caméra USB est connectée et reconnue par votre système.';

  @override
  String get failedToAccessCameras => 'Échec de l\'accès aux caméras';

  @override
  String get notAnEyeImageTitle => 'Pas une image d\'œil';

  @override
  String get notAnEyeImageBody =>
      'L\'image sélectionnée ne semble pas être un œil.\n\nVeuillez choisir une photo claire de l\'iris/pupille et réessayer.';

  @override
  String get notAnEyeImageBodyCapture =>
      'L\'image capturée ne semble pas être un œil.\n\nVeuillez positionner l\'iriscope directement sur l\'œil et reprendre.';

  @override
  String get anisocoriaObservationSymmetrical => 'Symétrique';

  @override
  String get anisocoriaObservationSlight => 'Légère variation';

  @override
  String get anisocoriaObservationModerate => 'Variation modérée';

  @override
  String get anisocoriaObservationMarked => 'Variation marquée';
}
