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
  String get center => 'Centre';

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
  String get close => 'Fermer';

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
  String get anwRatio => 'Ratio ANW';

  @override
  String get normal => 'Normal';

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
}
