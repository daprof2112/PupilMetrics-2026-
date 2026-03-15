// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'CNRI Cattura Oculare';

  @override
  String get analyzeButton => 'Analizza';

  @override
  String get plrModes => 'Modalità RFP';

  @override
  String get captureInstructions => 'Posiziona l\'occhio nel cerchio guida';

  @override
  String get scanHistory => 'Cronologia Scansioni';

  @override
  String get selectCameraMode => 'Seleziona Modalità Fotocamera';

  @override
  String get loadFromGallery => 'Carica dalla Galleria';

  @override
  String get rightEyePhoto => 'Foto Occhio Destro';

  @override
  String get leftEyePhoto => 'Foto Occhio Sinistro';

  @override
  String get autoCapture => 'Cattura Automatica';

  @override
  String get autoCaptureDesc => 'Rilevamento occhio + cattura auto 5 secondi';

  @override
  String get manualCapture => 'Cattura Manuale';

  @override
  String get manualCaptureDesc =>
      'Rilevamento occhio + cattura manuale (fotocamera posteriore)';

  @override
  String get selfieMode => 'Modalità Selfie';

  @override
  String get selfieModeDesc =>
      'Rilevamento occhio + cattura auto 5 sec (fotocamera frontale)';

  @override
  String get plrVideoRear => 'Video RFP (Posteriore)';

  @override
  String get plrVideoRearDesc => 'Fotocamera posteriore • cattura 10 sec';

  @override
  String get plrVideoSelfie => 'Video RFP (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Fotocamera frontale • cattura 10 sec';

  @override
  String get plrVideoCapture => 'Cattura Video RFP';

  @override
  String get frontCamera => 'Fotocamera Frontale';

  @override
  String get rearCamera => 'Fotocamera Posteriore';

  @override
  String get selectEyeToAssess => 'Seleziona quale occhio valutare';

  @override
  String get rightEyeOD => 'Occhio Destro (OD)';

  @override
  String get leftEyeOS => 'Occhio Sinistro (OS)';

  @override
  String get recordPlrRightEye => 'Registra RFP occhio destro';

  @override
  String get recordPlrLeftEye => 'Registra RFP occhio sinistro';

  @override
  String get loadRightEyeImage => 'Carica immagine occhio destro';

  @override
  String get loadLeftEyeImage => 'Carica immagine occhio sinistro';

  @override
  String get bothEyes => 'Entrambi gli Occhi';

  @override
  String get loadBothEyesDesc => 'Carica occhio destro, poi sinistro';

  @override
  String get selectEyeImageFromDevice =>
      'Seleziona un\'immagine oculare dal dispositivo';

  @override
  String get selectRightEyeFirst =>
      'Seleziona prima l\'immagine dell\'occhio DESTRO (OD)';

  @override
  String get rightEyeSaved =>
      'Occhio destro salvato. Ora seleziona l\'immagine dell\'occhio SINISTRO (OS)';

  @override
  String get cancelledNoRightEye =>
      'Annullato - nessun occhio destro selezionato';

  @override
  String get cancelledNoLeftEye =>
      'Annullato - nessun occhio sinistro selezionato';

  @override
  String errorLoadingImages(String error) {
    return 'Errore nel caricamento immagini: $error';
  }

  @override
  String get crop43 => 'Ritaglia (4:3)';

  @override
  String get success => 'Successo';

  @override
  String get imageCroppedSuccess => 'Immagine ritagliata con successo!';

  @override
  String get error => 'Errore';

  @override
  String get cropFailed => 'Ritaglio fallito. Riprova.';

  @override
  String get crop => 'Ritaglia';

  @override
  String get cancel => 'Annulla';

  @override
  String get saved => 'Salvato! ✅';

  @override
  String get imageSavedToGallery => 'Immagine salvata nella galleria';

  @override
  String get exposure => 'Esposizione';

  @override
  String get flash => 'Flash';

  @override
  String get eye => 'Occhio';

  @override
  String get center => 'centro';

  @override
  String get light => 'Luce';

  @override
  String get ready => 'Pronto';

  @override
  String get on => 'SÌ';

  @override
  String get off => 'NO';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUALE';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPILLA';

  @override
  String get plrHistory => 'Cronologia RFP';

  @override
  String get searchByName => 'Cerca per nome...';

  @override
  String get totalScans => 'Scansioni Totali';

  @override
  String get thisWeek => 'Questa Settimana';

  @override
  String get patients => 'Pazienti';

  @override
  String get detected => 'Rilevato';

  @override
  String get noPlrRecordsYet => 'Nessun record RFP ancora';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Registra un video RFP per vedere la cronologia qui';

  @override
  String get deleteRecord => 'Eliminare il Record?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Eliminare l\'analisi RFP di $name ($eye)?\n\nQuesta azione non può essere annullata.';
  }

  @override
  String get delete => 'Elimina';

  @override
  String get recordDeleted => 'Record eliminato';

  @override
  String plrAnalysis(String eye) {
    return 'Analisi RFP - $eye';
  }

  @override
  String get patient => 'Paziente';

  @override
  String get date => 'Data';

  @override
  String get frames => 'Fotogrammi';

  @override
  String get baselinePiRatio => 'P/I Base';

  @override
  String get minPiRatio => 'P/I Min';

  @override
  String get plrMagnitude => 'Ampiezza RFP';

  @override
  String get constriction => 'Costrizione';

  @override
  String get plrDetected => 'RFP Rilevato';

  @override
  String get confidence => 'Affidabilità';

  @override
  String get grade => 'Grado';

  @override
  String get close => 'chiudi';

  @override
  String get yes => 'Sì';

  @override
  String get no => 'No';

  @override
  String get na => 'N/D';

  @override
  String get takeLeftEyePhoto => 'Fotografa Occhio Sinistro';

  @override
  String get takeRightEyePhoto => 'Fotografa Occhio Destro';

  @override
  String get nowTakingLeftEye => 'Ora cattura occhio SINISTRO (OS)';

  @override
  String get startingWithRightEye => 'Inizio con occhio DESTRO (OD)';

  @override
  String get captured => 'Catturato ✓';

  @override
  String get useSameDistanceLighting =>
      'Usa la stessa distanza e illuminazione dell\'occhio destro per un confronto accurato.';

  @override
  String get step1of2 => 'Passo 1 di 2';

  @override
  String get step2of2 => 'Passo 2 di 2';

  @override
  String get bothEyesCaptured => 'Entrambi gli occhi catturati ✓';

  @override
  String get continueToLeftEye => 'Continua con l\'Occhio Sinistro';

  @override
  String get retakeOD => 'Rifai OD';

  @override
  String get retakeOS => 'Rifai OS';

  @override
  String get retakeRightEye => 'Rifai Occhio Destro';

  @override
  String get analyzeBothEyes => 'Analizza Entrambi gli Occhi';

  @override
  String get patientInfoMissing => 'Info Paziente Mancanti';

  @override
  String get rightEyePhotoMissing => 'Foto occhio destro mancante!';

  @override
  String get patientInfoMissingRestart => 'Info paziente mancanti. Ricomincia.';

  @override
  String get exitApp => 'Esci dall\'App';

  @override
  String get tipsForBestResults => 'CONSIGLI PER RISULTATI MIGLIORI';

  @override
  String get followGuidelinesForQuality =>
      'Segui queste linee guida per una qualità d\'immagine ottimale';

  @override
  String get cameraDistance => 'Distanza Fotocamera';

  @override
  String get cameraDistanceDesc =>
      'Mantieni la fotocamera a 10-15 cm dall\'occhio. Mantieni la stessa distanza per entrambi gli occhi.';

  @override
  String get lightingPosition => 'Posizione Illuminazione';

  @override
  String get lightingPositionDesc =>
      'Posiziona la fonte luminosa dentro o fuori i bordi della pupilla. Prova a guardare verso il flash.';

  @override
  String get avoidReflections => 'Evita i Riflessi';

  @override
  String get avoidReflectionsDesc =>
      'Riduci i riflessi evitando bagliori da finestre, specchi e lampade dirette.';

  @override
  String get centerYourEye => 'Centra il Tuo Occhio';

  @override
  String get centerYourEyeDesc =>
      'Assicurati che l\'intero occhio, inclusa la sclera (parte bianca), sia centrato e riempia l\'inquadratura.';

  @override
  String get cropProperly => 'Ritaglia Correttamente';

  @override
  String get cropProperlyDesc =>
      'Ritaglia l\'immagine con l\'occhio al centro. L\'immagine verrà salvata automaticamente in formato 4:3.';

  @override
  String get importantInformation => 'Informazioni Importanti';

  @override
  String get imageRatio43 => 'Formato 4:3 per lo standard di imaging medico';

  @override
  String get forClinicalUseCnri => 'Per uso clinico con CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Non fornisce diagnosi mediche';

  @override
  String get eyeWideOpenClear =>
      'Assicurati che l\'occhio sia ben aperto e l\'immagine sia nitida';

  @override
  String get personalInfo => 'Info Personali';

  @override
  String get personInformation => 'Informazioni Persona';

  @override
  String get enterPersonDetails => 'Inserisci Dati Persona';

  @override
  String get infoIncludedInReport =>
      'Queste informazioni saranno incluse nel report di analisi';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get enterPersonName => 'Inserisci nome persona';

  @override
  String get nameRequired => 'Il nome è obbligatorio';

  @override
  String get sex => 'Sesso';

  @override
  String get male => 'Maschio';

  @override
  String get female => 'Femmina';

  @override
  String get ageYears => 'Età (anni)';

  @override
  String get enterAge => 'Inserisci età';

  @override
  String get ageRequired => 'L\'età è obbligatoria';

  @override
  String get enterValidNumber => 'Inserisci un numero valido';

  @override
  String get enterValidAge => 'Inserisci un\'età valida (0-120)';

  @override
  String get mainComplaints => 'Disturbi Principali';

  @override
  String get mainComplaintsOptional => 'Disturbi Principali (opzionale)';

  @override
  String get complaintsHint =>
      'es. mal di testa, problemi di vista, stanchezza...';

  @override
  String get continueToCaptire => 'Continua alla Cattura';

  @override
  String get ageImportantNote =>
      'L\'età è importante per una valutazione accurata della dimensione pupillare poiché i range normali variano con l\'età.';

  @override
  String get submit => 'Invia';

  @override
  String get pleaseSelectGender => 'Seleziona il sesso!';

  @override
  String get applicationSubmitted =>
      'La tua richiesta è stata inviata con successo.';

  @override
  String get type => 'Tipo:';

  @override
  String get gender => 'Sesso:';

  @override
  String get rightHanded => 'Destrorso';

  @override
  String get leftHanded => 'Mancino';

  @override
  String get partialLeftHandedness => 'Mancinismo parziale';

  @override
  String get retrainedLeftHandedness => 'Mancinismo corretto';

  @override
  String get bilateralUseBothHands => 'Uso bilaterale di entrambe le mani';

  @override
  String get splashTitle => 'PupilMetrics Cattura Oculare';

  @override
  String get splashDeveloper => 'Sviluppatore - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Strumento di Ricerca/Educazione';

  @override
  String get startNewAnalysis => 'Nuova Analisi';

  @override
  String get viewHistory => 'Vedi Cronologia';

  @override
  String get viewResearchDisclaimer => 'Vedi Avviso di Ricerca';

  @override
  String get researchDisclaimerTitle => 'Strumento di Ricerca/Educazione';

  @override
  String get researchDisclaimerNotMedical => 'NON è un dispositivo medico';

  @override
  String get researchDisclaimerNotClinical => 'NON è per diagnosi cliniche';

  @override
  String get researchDisclaimerResults =>
      'I risultati sono osservazioni di ricerca';

  @override
  String get researchDisclaimerConsult =>
      'Consulta sempre professionisti sanitari';

  @override
  String get researchDisclaimerAcknowledge =>
      'Continuando, riconosci che questo è uno strumento di ricerca e non deve essere usato per decisioni mediche.';

  @override
  String get researchDisclaimerWarning =>
      'Questa app è SOLO per scopi di RICERCA ed EDUCAZIONE.';

  @override
  String get iUnderstand => 'Ho Capito';

  @override
  String get plrAnalysisTest => 'Test Analisi RFP';

  @override
  String get checkingVideoFile => 'Verifica file video...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Elaborazione fotogramma $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Analisi completata!';

  @override
  String get errorVideoNotFound => 'Errore: File video non trovato';

  @override
  String get waitingForResults => 'In attesa dei risultati...';

  @override
  String get baseline => 'Base';

  @override
  String get flashPhase => 'Flash';

  @override
  String get constrictionPhase => 'Costrizione';

  @override
  String get recovery => 'Recupero';

  @override
  String get plrDetectedExclaim => 'RFP RILEVATO!';

  @override
  String get plrWeakNotDetected => 'RFP Debole/Non Rilevato';

  @override
  String get min => 'Min';

  @override
  String get plr => 'RFP';

  @override
  String get constrLabel => 'Costr.';

  @override
  String get saveToHistory => 'Salva nella Cronologia';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Salva Fotogrammi';

  @override
  String get share => 'Condividi';

  @override
  String get frameSavedToGallery => 'Fotogramma salvato nella galleria!';

  @override
  String get failedToSaveFrame => 'Salvataggio fotogramma fallito';

  @override
  String framesSavedToGallery(int count) {
    return '$count fotogrammi salvati nella galleria!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON copiato negli appunti!';

  @override
  String get reportCopiedToClipboard => 'Report copiato negli appunti!';

  @override
  String shareFailedError(String error) {
    return 'Condivisione fallita: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Salvato nella cronologia! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Salvataggio fallito: $error';
  }

  @override
  String get noSuccessfulFramesToSave =>
      'Nessun fotogramma riuscito da salvare';

  @override
  String get saveAllFrames => 'Salva Tutti i Fotogrammi';

  @override
  String get shareReport => 'Condividi Report';

  @override
  String get shareJson => 'Condividi JSON';

  @override
  String get rerunTest => 'Ripeti Test';

  @override
  String videoCaptureTitle(String eye) {
    return 'RFP - $eye';
  }

  @override
  String get initializingCamera => 'Inizializzazione fotocamera...';

  @override
  String usingCamera(String camera) {
    return 'Uso fotocamera $camera';
  }

  @override
  String cameraError(String error) {
    return 'Errore fotocamera: $error';
  }

  @override
  String get noCamerasFound => 'Nessuna fotocamera trovata';

  @override
  String get retry => 'Riprova';

  @override
  String get startPlrRecording => 'Avvia Registrazione RFP';

  @override
  String get stopRecording => 'Ferma Registrazione';

  @override
  String get phaseReady => 'Pronto';

  @override
  String get phaseStarting => 'Avvio...';

  @override
  String phaseBaseline(int sec) {
    return 'Base (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'FLASH!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Costrizione ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Recupero ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Completato!';

  @override
  String get readyDesc => 'Posiziona l\'occhio nel cerchio, poi tocca Avvia';

  @override
  String get holdSteady => 'Mantieni fermo...';

  @override
  String get recordingBaselinePupil =>
      'Registrazione dimensione pupillare di base';

  @override
  String lightStimulus(int ms) {
    return 'Stimolo luminoso (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Misurazione costrizione pupillare';

  @override
  String get measuringRecovery => 'Misurazione recupero pupillare';

  @override
  String get plrRecordingComplete => 'Registrazione RFP completata';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Posiziona l\'occhio $eye nel cerchio.\nMantieni fermo durante la registrazione di $seconds secondi.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Mantieni l\'occhio fermo. Il flash avverrà a $sec secondi.';
  }

  @override
  String get recordingComplete => 'Registrazione Completata';

  @override
  String get plrVideoCapturedSuccess => 'Video RFP catturato con successo!';

  @override
  String get duration => 'Durata';

  @override
  String get seconds => 'secondi';

  @override
  String get frameRate => 'Frequenza Fotogrammi';

  @override
  String get camera => 'Fotocamera';

  @override
  String flashAt(int sec, int ms) {
    return 'A ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Fasi';

  @override
  String get phasesFlow => 'Base → Flash → Costrizione → Recupero';

  @override
  String get expectedNormalValues => 'Valori Normali Attesi:';

  @override
  String get latency => 'Latenza';

  @override
  String get velocity => 'Velocità';

  @override
  String get testFrameAnalysis => '🧪 Test Analisi Fotogrammi';

  @override
  String get retake => 'Rifai';

  @override
  String get done => 'Fatto';

  @override
  String get plrVideoModeTitle => 'Modalità Video RFP';

  @override
  String get plrAssessmentTitle =>
      'Valutazione Riflesso Fotomotore Pupillare (RFP)';

  @override
  String get plrInstructions =>
      '1. Posiziona l\'occhio nel cerchio guida\n2. Tocca \"Avvia Registrazione RFP\"\n3. Mantieni fermo per 10 secondi\n4. Un flash avverrà a 3 secondi\n5. L\'app registra la risposta pupillare';

  @override
  String get recordingPhases => 'Fasi di Registrazione:';

  @override
  String get baselinePhaseDesc => 'Dimensione pupillare iniziale';

  @override
  String get flashPhaseDesc => 'Stimolo luminoso';

  @override
  String get constrictionPhaseDesc => 'La pupilla si contrae';

  @override
  String get recoveryPhaseDesc => 'La pupilla ritorna';

  @override
  String get normalPlrValues => 'Valori RFP Normali:';

  @override
  String get gotIt => 'Capito';

  @override
  String get pupilAnalysis => 'Analisi Pupillare';

  @override
  String scansLeft(int count) {
    return '$count rimaste';
  }

  @override
  String get validatingRightEye => 'Validazione occhio destro...';

  @override
  String get validatingLeftEye => 'Validazione occhio sinistro...';

  @override
  String get analyzingRightEye => 'Analisi occhio destro (OD)...';

  @override
  String get analyzingLeftEye => 'Analisi occhio sinistro (OS)...';

  @override
  String get comparingPupils => 'Confronto pupille...';

  @override
  String person(String name) {
    return 'Persona: $name';
  }

  @override
  String get invalidEyeImage => 'Immagine Oculare Non Valida';

  @override
  String analysisFailed(String error) {
    return 'Analisi fallita: $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'SOLO STRUMENTO DI RICERCA/EDUCAZIONE';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Questa applicazione è solo per scopi di ricerca ed educazione. I risultati NON sono diagnosi mediche e NON sono stati validati per uso clinico. Le associazioni di pattern provengono dalla letteratura di ricerca storica. Consulta un professionista sanitario per qualsiasi preoccupazione sulla salute.';

  @override
  String get pupilSizeDifference => 'Differenza Dimensione Pupillare Rilevata';

  @override
  String get significantPupilSizeDiff =>
      'DIFFERENZA SIGNIFICATIVA DIMENSIONE PUPILLARE';

  @override
  String get diff => 'diff';

  @override
  String get researchObservationConsult =>
      'Osservazione di ricerca - Consulta un professionista sanitario per l\'interpretazione';

  @override
  String get ageBasedResearchBaseline =>
      'Riferimento di Ricerca Basato sull\'Età';

  @override
  String group(String group) {
    return 'Gruppo: $group';
  }

  @override
  String get researchRange => 'Range di Ricerca';

  @override
  String get measuredEst => 'Misurato (stima)';

  @override
  String get pupilForm => 'Forma Pupillare';

  @override
  String get decentrationPattern => 'Pattern di Decentramento';

  @override
  String get flattenings => 'Appiattimenti';

  @override
  String get protrusions => 'Protrusioni';

  @override
  String zonesCount(int count) {
    return '$count zone';
  }

  @override
  String get bilateralComparison => 'Confronto Bilaterale';

  @override
  String get parameter => 'Parametro';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Rapporto P/I';

  @override
  String get ellipseness => 'Ellitticità';

  @override
  String get circularity => 'Circolarità';

  @override
  String get decentralization => 'Decentramento';

  @override
  String get anwRatio => 'Rapporto';

  @override
  String get normal => 'normale';

  @override
  String get elliptical => 'Ellittica';

  @override
  String get circular => 'Circolare';

  @override
  String get irregular => 'Irregolare';

  @override
  String get centered => 'Centrata';

  @override
  String get offset => 'Spostata';

  @override
  String get miosis => 'Miosi';

  @override
  String get constricted => 'Contratta';

  @override
  String get dilated => 'Dilatata';

  @override
  String get mydriasis => 'Midriasi';

  @override
  String get inner => 'Interna';

  @override
  String get outer => 'Esterna';

  @override
  String get high => 'Alta';

  @override
  String get moderate => 'Moderata';

  @override
  String get savePdf => 'Salva PDF';

  @override
  String get sharePdf => 'Condividi PDF';

  @override
  String get retakePhotos => 'Rifai Foto';

  @override
  String scansLeftBanner(int count) {
    return '$count scansioni rimaste';
  }

  @override
  String get upgrade => 'Aggiorna';

  @override
  String get unlockUnlimited => 'Sblocca Illimitato';

  @override
  String get usedAllFreeScans => 'Hai esaurito le scansioni gratuite.';

  @override
  String get unlimitedScans => 'Scansioni illimitate';

  @override
  String get pdfReports => 'Report PDF';

  @override
  String get scanHistoryFeature => 'Cronologia scansioni';

  @override
  String get bilateralAnalysis => 'Analisi bilaterale';

  @override
  String get monthly => 'Mensile';

  @override
  String get perMonth => '/mese';

  @override
  String get annual => 'Annuale';

  @override
  String get perYear => '/anno';

  @override
  String get tenCredits => '10 Crediti';

  @override
  String get oneTime => 'una tantum';

  @override
  String get best => 'MIGLIORE';

  @override
  String get purchaseCancelled => 'Acquisto annullato';

  @override
  String purchaseFailed(String error) {
    return 'Acquisto fallito: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT salvato: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON salvato: $path';
  }

  @override
  String get pdfSaved => 'PDF Salvato!';

  @override
  String pdfFailed(String error) {
    return 'PDF Fallito: $error';
  }

  @override
  String get open => 'APRI';

  @override
  String failed(String error) {
    return 'Fallito: $error';
  }

  @override
  String get staticScans => 'Statico';

  @override
  String get plrScans => 'RFP';

  @override
  String get searchByNameOrComplaints => 'Cerca per nome o disturbi...';

  @override
  String get searchPlrRecords => 'Cerca record RFP...';

  @override
  String get noScansYet => 'Nessuna scansione ancora';

  @override
  String get completedScansAppearHere =>
      'Le scansioni completate appariranno qui';

  @override
  String get deleteScan => 'Eliminare la Scansione?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Eliminare la scansione di $name del $date?';
  }

  @override
  String get scanDeleted => 'Scansione eliminata';

  @override
  String get originalImagesNotFound =>
      'Immagini oculari originali non trovate.';

  @override
  String get viewResults => 'Vedi Risultati';

  @override
  String get avgPlr => 'RFP Med';

  @override
  String get years => 'anni';

  @override
  String get anisocoria => 'Anisocoria';

  @override
  String get none => 'Nessuno';

  @override
  String get mild => 'Lieve';

  @override
  String get severe => 'Grave';

  @override
  String zoneLabel(String zone) {
    return 'Zona: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Associato a $organ';
  }

  @override
  String get significant => 'Significativo';

  @override
  String get fair => 'Discreto';

  @override
  String get low => 'Bassa';

  @override
  String get good => 'Buono';

  @override
  String get zones => 'zone';

  @override
  String get significanceWithinLimits => 'entro limiti accettabili';

  @override
  String get significanceMild => 'lieve';

  @override
  String get significanceModerate => 'moderato';

  @override
  String get significanceSignificant => 'significativo';

  @override
  String get formTypeCircle => 'Cerchio (Normale)';

  @override
  String get formTypeOval => 'Ovale';

  @override
  String get formTypeOvalVertical => 'Ovale-verticale';

  @override
  String get formTypeOvalHorizontal => 'Ovale-orizzontale';

  @override
  String get formTypeOvalDiagonal => 'Ovale-diagonale';

  @override
  String get formTypeLeftObliqueEllipse => 'Ellisse Obliqua Sinistra';

  @override
  String get formTypeUnilateralEllipse => 'Ellisse Unilaterale';

  @override
  String get formTypeVentralDivergingEllipse => 'Ellisse Divergente Ventrale';

  @override
  String get formTypeFrontalDivergingEllipse => 'Ellisse Divergente Frontale';

  @override
  String get formTypeEllipse => 'Ellisse';

  @override
  String get formTypeChord => 'Corda';

  @override
  String get formTypeIrregular => 'Irregolare';

  @override
  String get pupilFormCircleDesc =>
      'Forma pupillare circolare normale. Nessuna variazione di pattern rilevata.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Pattern ovale orizzontale. La ricerca storica ha associato questo ai pattern del sistema nervoso autonomo che influenzano le zone di funzione respiratoria e ghiandolare.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Pattern ovale verticale. La ricerca storica ha collegato questo pattern alle zone di circolazione cerebrale negli studi sui riflessi autonomi.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Pattern ovale diagonale. La letteratura di ricerca ha associato questo ai riflessi della zona urogenitale negli studi autonomi.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Pattern ellisse obliqua sinistra. Le osservazioni storiche hanno collegato questo alle zone autonome urogenitali e degli arti inferiori.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Pattern ellisse unilaterale. La ricerca ha indicato associazioni con le zone autonome respiratorie e bronchiali.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Ellisse divergente ventrale. Gli studi storici hanno associato questo alle zone autonome del corpo inferiore e ai pattern di funzione motoria.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Ellisse divergente frontale. La letteratura di ricerca ha collegato questo pattern alle zone autonome cerebrali e superiori.';

  @override
  String get pupilFormOvalDesc =>
      'Pattern di deformazione ovale lieve. Monitorare la progressione nelle osservazioni di ricerca.';

  @override
  String get pupilFormEllipseDesc =>
      'Pattern pupillare ellittico che indica variazioni del sistema autonomo negli studi storici.';

  @override
  String get pupilFormChordDesc =>
      'Pattern di deformazione a corda che indica influenze autonome localizzate nella letteratura di ricerca.';

  @override
  String get pupilFormIrregularDesc =>
      'Forma irregolare che suggerisce molteplici influenze di pattern autonomi basate su osservazioni storiche.';

  @override
  String get patternCentered => 'Centrato (Normale)';

  @override
  String get patternFrontal => 'Decentralizzazione frontale';

  @override
  String get patternBasal => 'Decentralizzazione basale';

  @override
  String get patternNasal => 'Decentralizzazione nasale';

  @override
  String get patternTemporal => 'Decentralizzazione temporale';

  @override
  String get patternMiddleNasal => 'Decentralizzazione nasale media';

  @override
  String get patternMiddleTemporal => 'Decentralizzazione temporale media';

  @override
  String get patternUpperNasal => 'Decentralizzazione nasale superiore';

  @override
  String get patternUpperTemporal => 'Decentralizzazione temporale superiore';

  @override
  String get patternLowerNasal => 'Decentralizzazione nasale inferiore';

  @override
  String get patternLowerTemporal => 'Decentralizzazione temporale inferiore';

  @override
  String get patternUpwards => 'Decentrazione - Verso l\'alto';

  @override
  String get patternDownwards => 'Decentrazione - Verso il basso';

  @override
  String get patternUpwardsInwards => 'Decentrazione - Alto-Interno';

  @override
  String get patternUpwardsOutwards => 'Decentrazione - Alto-Esterno';

  @override
  String get decentrationCenteredDesc =>
      'Posizionamento pupillare normale entro i limiti fisiologici.';

  @override
  String get decentrationNasalRightDesc =>
      'Pattern nasale (Destro). La ricerca storica ha associato questa zona ai riflessi autonomi polmonari.';

  @override
  String get decentrationNasalLeftDesc =>
      'Pattern nasale (Sinistro). La letteratura di ricerca ha collegato questa zona ai pattern di funzione autonoma cardiaca.';

  @override
  String get decentrationTemporalDesc =>
      'Pattern temporale. Le osservazioni storiche hanno associato questa zona ai riflessi autonomi renali e riproduttivi.';

  @override
  String get decentrationFrontalRightDesc =>
      'Pattern frontale (Destro). La ricerca ha associato questa zona ai pattern di funzione cognitiva e cerebrale.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Pattern frontale (Sinistro). Gli studi storici hanno collegato questa zona ai pattern autonomi cerebrali.';

  @override
  String get decentrationBasalRightDesc =>
      'Pattern basale (Destro). La ricerca ha indicato associazioni con i riflessi di pressione intracranica.';

  @override
  String get decentrationBasalLeftDesc =>
      'Pattern basale (Sinistro). Le osservazioni storiche hanno collegato questo ai pattern di zona infiammatoria cerebrale.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Pattern nasale superiore (Destro). La ricerca ha associato questa zona ai riflessi autonomi epatobiliari.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Pattern nasale superiore (Sinistro). Gli studi storici hanno collegato questo alle zone spleniche e diaframmatiche.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Pattern temporale superiore. La ricerca ha indicato associazioni con le zone autonome renali e riproduttive.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Pattern nasale medio (Destro). Le osservazioni storiche hanno collegato questo alle zone di utilizzo dell\'ossigeno e cardiache.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Pattern nasale medio (Sinistro). La ricerca ha associato questo ai pattern autonomi neurologici e cardiaci.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Pattern temporale medio (Destro). La ricerca ha collegato questo alle zone di regolazione autonoma cardiaca.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Pattern temporale medio (Sinistro). Gli studi storici hanno associato questo alle zone polmonari e cardiache.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Pattern nasale superiore (Destro). La ricerca ha indicato associazioni con le zone cognitive e i riflessi della colonna cervicale.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Pattern nasale superiore (Sinistro). Le osservazioni storiche hanno collegato questo ai pattern cognitivi e alle zone cervicali.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Pattern temporale superiore (Destro). La ricerca ha associato questa zona ai riflessi dei nervi cranici e uditivi.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Pattern temporale superiore (Sinistro). Gli studi storici hanno collegato questo alle zone neurovegetative e del linguaggio.';

  @override
  String get decentrationLowerNasalDesc =>
      'Pattern nasale inferiore. La ricerca ha indicato associazioni con le zone autonome urogenitali e lombosacrali.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Pattern temporale inferiore (Destro). Le osservazioni storiche hanno associato questo alle zone metaboliche ed epatiche.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Pattern temporale inferiore (Sinistro). La ricerca ha collegato questo ai pattern autonomi cardiaci e splenici.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Pattern associato alla zona centrale superiore. La ricerca storica ha collegato questo ai riflessi autonomi di regolazione dell\'umore e dell\'energia.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Pattern associato alla zona temporale superiore. La ricerca ha indicato associazioni con i riflessi autonomi dei nervi cranici e uditivi.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Pattern associato alla zona temporale media. Le osservazioni storiche hanno collegato questo ai pattern autonomi respiratori e cardiaci.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Pattern associato alla zona temporale inferiore. La letteratura di ricerca ha associato questo alle zone autonome epatiche e metaboliche.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Pattern associato alla zona basale inferiore. Gli studi storici hanno collegato questo ai riflessi autonomi renali e degli arti inferiori.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Pattern associato alla zona nasale inferiore. La ricerca ha indicato associazioni con le zone autonome urogenitali e pelviche.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Pattern associato alla zona nasale media. Le osservazioni storiche hanno collegato questo ai pattern autonomi di utilizzo dell\'ossigeno e respiratori.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Pattern associato alla zona nasale superiore. La letteratura di ricerca ha associato questo ai riflessi autonomi cognitivi e cervicali.';

  @override
  String get flatteningDefaultRightDesc =>
      'Variazione del pattern del sistema nervoso autonomo rilevata in questa zona basata sulla ricerca storica.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Pattern associato alla zona centrale superiore. La ricerca storica ha collegato questo ai pattern autonomi di regolazione dell\'umore e neurologici.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Pattern associato alla zona temporale superiore. La ricerca ha indicato associazioni con le zone autonome neurovegetative e del linguaggio.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Pattern associato alla zona temporale media. Le osservazioni storiche hanno collegato questo ai riflessi autonomi polmonari e cardiaci.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Pattern associato alla zona temporale inferiore. La letteratura di ricerca ha associato questo ai pattern autonomi cardiaci e splenici.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Pattern associato alla zona basale inferiore. Gli studi storici hanno collegato questo alle zone autonome renali ed eliminative.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Pattern associato alla zona nasale inferiore. La ricerca ha indicato associazioni con i riflessi autonomi urogenitali e lombosacrali.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Pattern associato alla zona nasale media. Le osservazioni storiche hanno collegato questo ai pattern autonomi cardiaci e respiratori.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Pattern associato alla zona nasale superiore. La letteratura di ricerca ha associato questo alle zone autonome cognitive e cervicali.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Variazione del pattern del sistema nervoso autonomo rilevata in questa zona basata sulla ricerca storica.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Pattern di protrusione nella zona centrale superiore. La ricerca ha associato questo ai pattern di iperattivazione simpatica che influenzano le zone cerebrali.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Pattern di protrusione nella zona temporale superiore. Le osservazioni storiche hanno collegato questo ai pattern di iperattività del sistema dei nervi cranici e uditivo.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Pattern di protrusione nella zona temporale media. La ricerca ha indicato associazioni con i pattern simpatici cardiaci e respiratori.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Pattern di protrusione nella zona temporale inferiore. Gli studi storici hanno collegato questo alle zone simpatiche epatobiliari e metaboliche.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Pattern di protrusione nella zona basale inferiore. La ricerca ha associato questo ai pattern di iperattività simpatica renale e pelvica.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Pattern di protrusione nella zona nasale inferiore. Le osservazioni storiche hanno collegato questo alle zone di attivazione simpatica urogenitale.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Pattern di protrusione nella zona nasale media. La ricerca ha indicato associazioni con i pattern simpatici gastrici e pancreatici.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Pattern di protrusione nella zona nasale superiore. Gli studi storici hanno collegato questo alle zone di iperattivazione simpatica cognitiva e visiva.';

  @override
  String get protrusionDefaultRightDesc =>
      'Pattern di iperattività del sistema nervoso simpatico rilevato in questa zona basato sulle osservazioni di ricerca.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Pattern di protrusione nella zona centrale superiore. La ricerca ha associato questo ai pattern simpatici psicomotori e cerebrali.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Pattern di protrusione nella zona temporale superiore. Le osservazioni storiche hanno collegato questo alle zone di iperattività simpatica neurovegetativa.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Pattern di protrusione nella zona temporale media. La ricerca ha indicato associazioni con i pattern simpatici polmonari e cardiaci.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Pattern di protrusione nella zona temporale inferiore. Gli studi storici hanno collegato questo alle zone di attivazione simpatica splenica e cardiaca.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Pattern di protrusione nella zona basale inferiore. La ricerca ha associato questo ai pattern di iperattività simpatica pelvica e renale.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Pattern di protrusione nella zona nasale inferiore. Le osservazioni storiche hanno collegato questo alle zone di attivazione simpatica lombosacrale.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Pattern di protrusione nella zona nasale media. La ricerca ha indicato associazioni con i pattern simpatici ansia-cardiaci.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Pattern di protrusione nella zona nasale superiore. Gli studi storici hanno collegato questo alle zone di iperattivazione simpatica cognitiva e visiva.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Pattern di iperattività del sistema nervoso simpatico rilevato in questa zona basato sulle osservazioni di ricerca.';

  @override
  String get anisocoriaNone =>
      'Dimensioni pupillari entro i limiti normali. Nessuna anisocoria significativa rilevata.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisocoria rilevata: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'Entro i limiti normali.';

  @override
  String get anisocoriaSeverityMild =>
      'Differenza lieve osservata. Può essere fisiologica.';

  @override
  String get anisocoriaSeverityModerate =>
      'Asimmetria moderata. Osservazione di ricerca annotata.';

  @override
  String get anisocoriaSeveritySevere =>
      'Asimmetria significativa. Osservazione di ricerca segnalata.';

  @override
  String get largerPupilEqual => 'uguale';

  @override
  String get largerPupilOS => 'OS (Sinistro)';

  @override
  String get largerPupilOD => 'OD (Destro)';

  @override
  String get decentrationWithinLimits => 'Entro i limiti normali.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Spostamento: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Centrale-Superiore';

  @override
  String get zoneUpperNasal => 'Nasale-Superiore';

  @override
  String get zoneMiddleNasal => 'Nasale-Medio';

  @override
  String get zoneLowerNasal => 'Nasale-Inferiore';

  @override
  String get zoneLowerBasal => 'Basale-Inferiore';

  @override
  String get zoneLowerTemporal => 'Temporale-Inferiore';

  @override
  String get zoneMiddleTemporal => 'Temporale-Medio';

  @override
  String get zoneUpperTemporal => 'Temporale-Superiore';

  @override
  String get zoneFrontal => 'Frontale';

  @override
  String get zoneBasal => 'Basale';

  @override
  String get zoneUnknown => 'Sconosciuto';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Appiattimento $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Protrusione $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Modalità Iriscopio USB';

  @override
  String get iriscopeExternal => 'Iriscopio / Esterno';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'Usa fotocamera USB o iriscopio collegato';

  @override
  String get detectedCameras => 'Fotocamere Rilevate';

  @override
  String get externalCamera => 'Fotocamera Esterna';

  @override
  String cameraIndex(int index) {
    return 'Fotocamera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Nessuna fotocamera esterna rilevata.\nCollegare un iriscopio USB per abilitare.';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get selectCameraSource => 'Seleziona Sorgente Fotocamera';

  @override
  String camerasDetected(int count) {
    return '$count fotocamere rilevate';
  }

  @override
  String camerasAvailable(int count) {
    return '$count fotocamere disponibili';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Fotocamera Esterna $index';
  }

  @override
  String get qualityGatedRear =>
      'Acquisizione auto con controllo qualità (fotocamera posteriore)';

  @override
  String get qualityGatedFront =>
      'Acquisizione auto con controllo qualità (fotocamera anteriore)';

  @override
  String get usbCameraInfo => 'Info Fotocamera USB';

  @override
  String get connected => 'Collegato';

  @override
  String get waiting => 'In attesa...';

  @override
  String get disconnected => 'Scollegato';

  @override
  String get waitingForUsbCamera => 'In Attesa della Fotocamera USB';

  @override
  String get connectIriscopePrompt =>
      'Collega il tuo iriscopio tramite adattatore USB OTG.\nConcedi l\'autorizzazione quando richiesto.';

  @override
  String get usbCameraIssue => 'Problema Fotocamera USB';

  @override
  String get pleaseConnectIriscope =>
      'Collega il tuo iriscopio o fotocamera USB.';

  @override
  String get retryConnection => 'Riprova Connessione';

  @override
  String get troubleshootingTips => 'Suggerimenti per la Risoluzione';

  @override
  String get tipUsbOtgAdapter =>
      'Assicurati che l\'adattatore USB OTG sia collegato correttamente';

  @override
  String get tipUsbHostMode =>
      'Verifica se il dispositivo supporta la modalità USB Host';

  @override
  String get tipReconnectCamera =>
      'Prova a scollegare e ricollegare la fotocamera';

  @override
  String get tipGrantPermissions => 'Concedi i permessi USB quando richiesto';

  @override
  String get tipUnlockDevice => 'Alcuni dispositivi devono essere sbloccati';

  @override
  String get back => 'Indietro';

  @override
  String get switchEye => 'Cambia Occhio';

  @override
  String get state => 'Stato';

  @override
  String get status => 'Stato';

  @override
  String get usingFlutterUvcPlugin =>
      'Utilizzo del plugin flutter_uvc_camera\nper il supporto dei dispositivi USB Video Class.';

  @override
  String get initialized => 'Inizializzato';

  @override
  String get notReady => 'Non Pronto';

  @override
  String get captureDistanceMatch => 'Corrispondenza Distanza';

  @override
  String get irisSize => 'Dimensione Iride';

  @override
  String get distanceMatched => 'Distanza Corrispondente';

  @override
  String get distanceMismatch => 'Distanza Non Corrispondente';

  @override
  String get excellentMatch => 'Corrispondenza eccellente';

  @override
  String get goodMatch => 'Buona corrispondenza';

  @override
  String get acceptableMatch => 'Corrispondenza accettabile';

  @override
  String get considerRetaking =>
      'Distanza non corrispondente - considera di ripetere';

  @override
  String get qualityReady => 'Pronto! Tieni fermo...';

  @override
  String get qualityTooBlurry => 'Tieni la fotocamera ferma';

  @override
  String get qualityTooDark => 'Serve più luce';

  @override
  String get qualityTooBright => 'Troppo luminoso - riduci la luce';

  @override
  String get qualityNoContrast => 'Regola l\'angolo della luce';

  @override
  String get qualityNoPupil => 'Centra la pupilla nel riquadro';

  @override
  String get qualityNotCentered => 'Sposta l\'occhio al centro';

  @override
  String get qualityNotAnEye => 'Nessun occhio rilevato';

  @override
  String get qualityProcessing => 'Elaborazione...';

  @override
  String get distanceMatchedCheck => '✓ Distanza corrispondente';

  @override
  String get distanceGoodMatchCheck => '✓ Buona corrispondenza';

  @override
  String get distanceSlightlyBack => 'Leggermente indietro ↔';

  @override
  String get distanceSlightlyCloser => 'Leggermente più vicino ↔';

  @override
  String get distanceAlmostThere => 'Quasi pronto...';

  @override
  String get distanceMoveBack => 'Vai indietro ←←';

  @override
  String get distanceMoveCloser => 'Avvicinati →→';

  @override
  String get distanceTooClose => 'Troppo vicino! Indietreggia';

  @override
  String get distanceTooFar => 'Troppo lontano! Avvicinati';

  @override
  String get distanceStabilizing => 'Stabilizzazione...';

  @override
  String distanceLabel(int percent) {
    return 'Distanza: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Fotocamera Frontale';

  @override
  String get rearCameraLabel => 'Fotocamera Posteriore';

  @override
  String get startingCamera => 'Avvio fotocamera...';

  @override
  String get eyeNotDetected => 'Occhio Non Rilevato';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get indicatorEye => 'Occhio';

  @override
  String get indicatorSharp => 'Nitidezza';

  @override
  String get indicatorLight => 'Luce';

  @override
  String get indicatorFocus => 'Fuoco';

  @override
  String get indicatorPupil => 'Pupilla';

  @override
  String get indicatorIris => 'Iride';

  @override
  String get indicatorMatch => 'Corrisp.';

  @override
  String get checkImageShape => 'Forma Immagine';

  @override
  String get checkCircularIris => 'Iride Circolare';

  @override
  String get checkDarkPupil => 'Pupilla Scura';

  @override
  String get checkIrisTexture => 'Texture dell\'Iride';

  @override
  String get checkPupilIrisStructure => 'Struttura Pupilla-Iride';

  @override
  String get checkNaturalColors => 'Colori Naturali';

  @override
  String get checkEdgePattern => 'Pattern dei Bordi';

  @override
  String get errorImageShapeIncorrect =>
      'Forma errata - assicurati che l\'occhio riempia il riquadro';

  @override
  String get errorNoEyeDetected =>
      'Nessun occhio rilevato - centra l\'iride nel riquadro';

  @override
  String get errorNoPupilDetected =>
      'Nessuna pupilla rilevata - assicura buona illuminazione';

  @override
  String get errorNoIrisTexture =>
      'Nessuna texture dell\'iride - avvicinati all\'occhio';

  @override
  String get errorUnusualColors => 'Colori insoliti - evita schermi/riflessi';

  @override
  String get errorTooManyEdges =>
      'Troppi bordi dritti - potrebbe non essere un occhio';

  @override
  String get errorNotValidEye => 'Immagine occhio non valida - riprova';

  @override
  String get holdStillCapturing => 'Fermo - acquisizione...';

  @override
  String get adjustDistanceFirst => 'Prima regola la distanza';

  @override
  String get stabilizingReading => 'Stabilizzazione...';

  @override
  String get autoCaptureWhenReady => 'Acquisizione auto quando pronto';

  @override
  String get tapOrWaitAutoCapture => 'Tocca o attendi acquisizione auto';

  @override
  String get validatingImage => 'Validazione...';

  @override
  String get capturingStatus => 'Acquisizione...';

  @override
  String get adjustPositionStatus => 'Regola posizione';

  @override
  String get validationTip =>
      'Suggerimento: Assicura buona illuminazione, tieni la fotocamera a 10-15cm dall\'occhio, evita riflessi';

  @override
  String get validationChecksTitle => 'Controlli di Validazione:';

  @override
  String confidenceLabel(int percent) {
    return 'Confidenza:';
  }

  @override
  String get incompleteData => 'Dati incompleti';

  @override
  String get irisDiameterLabel => 'iride ø';

  @override
  String get plrResponseCurve => 'Curva di Risposta PLR';

  @override
  String get plrLatency => 'Latenza';

  @override
  String get plrVelocity => 'Velocità';

  @override
  String get plrRecoveryTime => 'Recupero';

  @override
  String get plrRecoveryRatio => 'Rapporto Rec.';

  @override
  String get plrEnhancedMetrics => 'Metriche PLR Avanzate';

  @override
  String get plrNormalLatency => 'Normale: 200-500ms';

  @override
  String get plrNormalConstriction => 'Normale: 10-30%';

  @override
  String get plrNormalVelocity => 'Normale: 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'Valori di Riferimento PLR Normali';

  @override
  String get plrSubjectInfo => 'Informazioni Soggetto';

  @override
  String get plrTestType => 'Riflesso Pupillare alla Luce';

  @override
  String get plrAnalysisSummary => 'Riepilogo Analisi';

  @override
  String get plrTotalFrames => 'Totale Frame Analizzati';

  @override
  String get plrSuccessRate => 'Tasso di Successo';

  @override
  String get plrMaxConstriction => 'Costrizione Massima';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => 'Corona Nervosa Autonoma (ANW)';

  @override
  String get anwAbnormal => 'Anormale';

  @override
  String get anwDiameter => 'Diametro';

  @override
  String get anwPerimeter => 'Perimetro';

  @override
  String get anwAsymmetry => 'Asimmetria';

  @override
  String get anwElevated => 'Elevato';

  @override
  String get anwFormType => 'Tipo di Forma';

  @override
  String get anwRegular => 'Regolare';

  @override
  String get anwDrawnIn => 'Ritratto';

  @override
  String get anwIndented => 'Frastagliato';

  @override
  String get anwLacerated => 'Lacerato';

  @override
  String get anwSpastic => 'Spastico';

  @override
  String get anwAtonic => 'Atonico';

  @override
  String get anwTonicState => 'Pattern Tonico Storico';

  @override
  String get anwParasympathotonic => 'Pattern parasimpaticotonico';

  @override
  String get anwSympathotonicState => 'Pattern simpaticotonico';

  @override
  String get anwShiftDetected => 'Pattern Storico di Spostamento';

  @override
  String get anwConstrictionDetected => 'Costrizione Rilevata';

  @override
  String get anwFindings => 'Risultati';

  @override
  String get anwRatioComparison => 'Rapporto ANW';

  @override
  String get bilateralANWComparison => 'Confronto Bilaterale ANW';

  @override
  String get anwSymmetryNormal => 'Simmetria ANW entro i limiti normali.';

  @override
  String get anwAsymmetryDetected => 'Asimmetria ANW rilevata tra gli occhi.';

  @override
  String get functionalFrustration =>
      'Frustrazione funzionale nella correlazione tra i sistemi nervosi simpatico e parasimpatico.';

  @override
  String get anwParasympathotonicDesc =>
      'Le osservazioni storiche hanno collegato questo a una maggiore sensibilita liminale, attivita riflessa accelerata e funzioni secretorie/evacuative gastrointestinali aumentate.';

  @override
  String get anwSympathotonicDesc =>
      'Le osservazioni storiche hanno collegato questo a una minore sensibilita liminale, attivita riflessa rallentata e funzioni secretorie/evacuative gastrointestinali ridotte.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern di sovraccarico del ventricolo sinistro e stress cardiaco.';

  @override
  String get anwFrontalConstricted =>
      'Zona frontale della cintura pupillare è costretta.';

  @override
  String get anwBasalConstricted =>
      'Zona basale della cintura pupillare è costretta.';

  @override
  String get anwFrontalBasalConstricted =>
      'Zone frontale e basale della cintura pupillare sono costrette.';

  @override
  String get helpTitle => 'Aiuto e Guida Utente';

  @override
  String get helpTabQuickStart => 'Avvio Rapido';

  @override
  String get helpTabCnriAnalysis => 'Analisi CNRI';

  @override
  String get helpTabShortcuts => 'Scorciatoie';

  @override
  String get helpTabTroubleshooting => 'Risoluzione Problemi';

  @override
  String get helpOnlineDocs => 'Documenti Online';

  @override
  String get helpContactSupport => 'Contatta Supporto';

  @override
  String get helpGettingStarted => 'Per Iniziare';

  @override
  String get helpStep1Title => 'Collega il Tuo Iriscopio';

  @override
  String get helpStep1Desc =>
      'Collega il tuo Dino-Lite o iriscopio USB compatibile.';

  @override
  String get helpStep2Title => 'Inserisci Informazioni Paziente';

  @override
  String get helpStep2Desc =>
      'Compila nome, età, sesso e disturbi principali del paziente.';

  @override
  String get helpStep3Title => 'Cattura Occhio Destro (OD)';

  @override
  String get helpStep3Desc =>
      'Posiziona l\'iriscopio e cattura l\'immagine dell\'occhio destro.';

  @override
  String get helpStep4Title => 'Cattura Occhio Sinistro (OS)';

  @override
  String get helpStep4Desc =>
      'Ripeti per l\'occhio sinistro con illuminazione costante.';

  @override
  String get helpStep5Title => 'Rivedi Analisi';

  @override
  String get helpStep5Desc =>
      'L\'app analizza rapporto P/I, forma pupillare e caratteristiche ANW.';

  @override
  String get helpStep6Title => 'Esporta Report';

  @override
  String get helpStep6Desc => 'Salva in formato PDF, TXT o JSON.';

  @override
  String get helpTipBestResults =>
      'Per migliori risultati: Usa illuminazione costante e mantieni 2-3cm di distanza dall\'iriscopio.';

  @override
  String get helpCnriProtocolFeatures => 'Funzionalità Protocollo CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Rapporto Pupilla/Iride (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normale: 20-30%. Valori esterni possono indicare squilibrio autonomo.';

  @override
  String get helpFeaturePupilFormTitle => 'Analisi Forma Pupillare';

  @override
  String get helpFeaturePupilFormDesc =>
      'Rileva pattern ovali, direzione decentrazione ed eccentricità.';

  @override
  String get helpFeatureAnwTitle => 'Valutazione ANW (Collaretto)';

  @override
  String get helpFeatureAnwDesc =>
      'Analizza rapporto, regolarità forma, spostamenti settoriali e stato tonico.';

  @override
  String get helpFeatureZoneTitle => 'Analisi Zone';

  @override
  String get helpFeatureZoneDesc =>
      'Mappa appiattimenti/protrusioni alle zone organiche CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Confronto Bilaterale';

  @override
  String get helpFeatureBilateralDesc =>
      'Confronta OD vs OS per rilevare asimmetrie.';

  @override
  String get helpFeatureMlTitle => 'Confronto ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'Il modello ONNX CNN fornisce misurazioni secondarie a scopo di confronto.';

  @override
  String get helpKeyboardShortcuts => 'Scorciatoie da Tastiera';

  @override
  String get helpCameraControls => 'Controlli Fotocamera';

  @override
  String get helpShortcutSpace => 'Cattura immagine';

  @override
  String get helpShortcutCtrlS => 'Salva report PDF';

  @override
  String get helpShortcutCtrlO => 'Apri immagine dalla galleria';

  @override
  String get helpShortcutCtrlH => 'Visualizza cronologia scansioni';

  @override
  String get helpShortcutF11 => 'Attiva/disattiva schermo intero';

  @override
  String get helpShortcutEsc => 'Indietro / Annulla';

  @override
  String get helpShortcutScroll => 'Zoom avanti/indietro';

  @override
  String get helpShortcutDoubleClick => 'Reimposta zoom';

  @override
  String get helpCommonIssues => 'Problemi Comuni';

  @override
  String get helpIssueCameraNotDetected => 'Fotocamera non rilevata';

  @override
  String get helpIssueCameraSolution1 => 'Controlla connessione USB';

  @override
  String get helpIssueCameraSolution2 => 'Prova una porta USB diversa';

  @override
  String get helpIssueCameraSolution3 => 'Installa driver Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Riavvia l\'applicazione';

  @override
  String get helpIssuePupilDetectionFails => 'Rilevamento pupilla fallisce';

  @override
  String get helpIssuePupilSolution1 => 'Assicura illuminazione adeguata';

  @override
  String get helpIssuePupilSolution2 => 'Centra la pupilla nel riquadro';

  @override
  String get helpIssuePupilSolution3 => 'Pulisci la lente dell\'iriscopio';

  @override
  String get helpIssuePupilSolution4 => 'Regola la messa a fuoco manualmente';

  @override
  String get helpIssuePdfExportFails => 'Esportazione PDF fallisce';

  @override
  String get helpIssuePdfSolution1 => 'Controlla permessi cartella';

  @override
  String get helpIssuePdfSolution2 => 'Assicura spazio disco disponibile';

  @override
  String get helpIssuePdfSolution3 => 'Chiudi file PDF aperti';

  @override
  String get helpIssuePdfSolution4 => 'Prova prima esportazione TXT';

  @override
  String get helpCaptureChecklistTitle => 'Checklist di Acquisizione';

  @override
  String get helpCaptureChecklist1 =>
      'Mantieni la pupilla centrata e completamente visibile nell\'inquadratura.';

  @override
  String get helpCaptureChecklist2 =>
      'Usa illuminazione uniforme e riduci riflessi o bagliori sulla cornea.';

  @override
  String get helpCaptureChecklist3 =>
      'Mantieni una distanza simile dell\'iriscopio per occhio destro e sinistro.';

  @override
  String get helpCaptureChecklist4 =>
      'Rimetti a fuoco o ripeti lo scatto se il bordo pupillare appare morbido o sfocato.';

  @override
  String get helpExportSettingsTitle => 'Impostazioni di Esportazione';

  @override
  String get helpExportSettingsDesc =>
      'Salvataggio automatico PDF può salvare un report dopo l\'analisi, Includi Immagini controlla la presenza delle foto nel PDF, e Confronto ONNX CNN aggiunge valori comparativi ai report.';

  @override
  String get helpHybridScoreTitle => 'Confidenza e Grado Ibridi';

  @override
  String get helpHybridScoreDesc =>
      'La confidenza e il grado mostrati combinano la qualità geometrica classica con l\'accordo ML, quindi riflettono l\'affidabilità della misurazione e non una diagnosi.';

  @override
  String get helpAnomalyGuideTitle => 'Leggere Appiattimenti e Protrusioni';

  @override
  String get helpAnomalyGuideDesc =>
      'Gli appiattimenti indicano un richiamo verso l\'interno e le protrusioni verso l\'esterno lungo il bordo pupillare; ogni scheda mostra zona, entità e associazione mappata.';

  @override
  String get helpZoneOverlayGuideTitle => 'Overlay delle Zone';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Usa l\'overlay delle zone per controllare visivamente le posizioni dei settori e verificare dove ricadono le anomalie rilevate attorno a pupilla e iride.';

  @override
  String get helpContactSupportTip =>
      'Contatta helpdesk@cnri.edu per assistenza.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get settingsCameraIriscope => 'FOTOCAMERA / IRISCOPIO';

  @override
  String get settingsPreferredCamera => 'Fotocamera Preferita:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'Fotocamera USB';

  @override
  String get settingsCameraAutoDetect => 'Rilevamento auto';

  @override
  String get settingsDefaultZoom => 'Zoom Predefinito:';

  @override
  String get settingsAnalysis => 'ANALISI';

  @override
  String get settingsShowMlComparison => 'Mostra Confronto ML';

  @override
  String get settingsShowZoneOverlay => 'Mostra Sovrapposizione Zone';

  @override
  String get settingsExportReports => 'ESPORTAZIONE E REPORT';

  @override
  String get settingsAutoSavePdf => 'Salvataggio automatico PDF';

  @override
  String get settingsIncludeImages => 'Includi Immagini';

  @override
  String get settingsSaved => 'Impostazioni salvate';

  @override
  String get aboutResearchEdition => 'Edizione Ricerca';

  @override
  String aboutVersion(String version) {
    return 'Versione $version';
  }

  @override
  String get aboutLicense => 'Licenza';

  @override
  String get aboutLicensedTo => 'Licenziato a:';

  @override
  String get aboutExpires => 'Scade:';

  @override
  String get aboutManageLicense => 'Gestisci Licenza';

  @override
  String get aboutBasedOnCnri => 'Basato sul Protocollo CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Sito Web';

  @override
  String get aboutPrivacy => 'Privacy';

  @override
  String get languageSelectTitle => 'Seleziona Lingua';

  @override
  String get selectLanguage => 'Seleziona Lingua';

  @override
  String get languageChanged => 'Lingua Cambiata';

  @override
  String languageChangedMessage(String language) {
    return 'Lingua dell\'app impostata su $language';
  }

  @override
  String get languageSystemNotAvailable => 'Sistema lingua non disponibile';

  @override
  String get licenseLoading => 'Caricamento...';

  @override
  String get licenseWelcome => 'Benvenuto in PupilMetrics!';

  @override
  String get licenseTrialFeatures =>
      '14 giorni di prova gratuita • Funzionalità complete';

  @override
  String get licenseStartTrial => 'Inizia Prova Gratuita';

  @override
  String get licenseEnterKey => 'Inserisci Licenza';

  @override
  String get licenseFreeTrial => 'Prova Gratuita';

  @override
  String licenseDaysRemaining(int count) {
    return '$count giorni rimanenti';
  }

  @override
  String get licenseTrialEnded => 'Prova Terminata';

  @override
  String get licenseEnterToContinue => 'Inserisci licenza per continuare';

  @override
  String get licenseStandard => 'Licenza Standard';

  @override
  String get licenseProfessional => 'Licenza Professionale';

  @override
  String get licenseEnterprise => 'Licenza Enterprise';

  @override
  String get licenseLicensed => 'Licenziato';

  @override
  String get licenseActive => 'Attiva';

  @override
  String get licenseTrialUser => 'Utente in Prova';

  @override
  String get licenseLifetime => 'A vita';

  @override
  String get licenseNotSetUp => 'Non Configurata';

  @override
  String get trialExpiredTitle => 'Periodo di Prova Terminato';

  @override
  String get trialExpiredMessage =>
      'La tua prova di 14 giorni è terminata. Per continuare ad analizzare immagini dell\'iride, acquista una licenza.';

  @override
  String get trialExpiredCanStill => 'Puoi ancora:';

  @override
  String get trialExpiredViewAnalyses =>
      'Visualizzare le tue analisi precedenti';

  @override
  String get trialExpiredExportReports => 'Esportare report esistenti';

  @override
  String get trialExpiredAccessHistory => 'Accedere alla cronologia scansioni';

  @override
  String get trialExpiredMaybeLater => 'Forse Dopo';

  @override
  String get licenseRegistration => 'Registrazione Licenza';

  @override
  String get licenseStatusValid => 'Licenziato';

  @override
  String get licenseStatusTrialActive => 'Prova Gratuita';

  @override
  String get licenseStatusTrialExpired => 'Prova Terminata';

  @override
  String get licenseStatusExpired => 'Licenza Scaduta';

  @override
  String get licenseStatusInvalid => 'Licenza Non Valida';

  @override
  String get licenseStatusUnregistered => 'Non Configurata';

  @override
  String get licenseStatusMachineMismatch => 'Computer Diverso';

  @override
  String get licenseStatusNetworkError => 'Errore di Connessione';

  @override
  String get licenseEnterKeyTitle => 'Inserisci Chiave Licenza';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Il Tuo Nome';

  @override
  String get licenseEmailAddress => 'Indirizzo Email';

  @override
  String get licenseMachineId => 'ID Macchina';

  @override
  String get licenseCopyMachineId => 'Copia ID Macchina';

  @override
  String get licenseMachineIdCopied => 'ID macchina copiato negli appunti';

  @override
  String get licenseValidationKeyRequired => 'Inserisci la tua chiave licenza';

  @override
  String get licenseValidationKeyFormat =>
      'La chiave licenza deve essere di 20 caratteri (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Inserisci il tuo nome';

  @override
  String get licenseValidationEmailRequired => 'Inserisci la tua email';

  @override
  String get licenseValidationEmailInvalid => 'Inserisci un\'email valida';

  @override
  String get licenseActivate => 'Attiva Licenza';

  @override
  String get licenseContinueTrial => 'Continua Prova';

  @override
  String get licenseBuyLicense => 'Acquista Licenza';

  @override
  String get licenseNeedHelp => 'Hai bisogno di aiuto?';

  @override
  String get licenseLicenseAgreement => 'Contratto di Licenza';

  @override
  String get licenseActivatedSuccess => 'Licenza Attivata con Successo!';

  @override
  String get licenseMsgMachineMismatch =>
      'Questa licenza è registrata su un altro computer. Usa il dispositivo originale o contatta il supporto.';

  @override
  String get licenseMsgTrialEnded =>
      'La tua prova gratuita è terminata. Inserisci una chiave licenza per continuare a usare tutte le funzionalità.';

  @override
  String get licenseMsgExpired =>
      'La tua licenza è scaduta. Rinnova per continuare.';

  @override
  String get licenseMsgNeedsSetup =>
      'La licenza deve essere configurata. Inizia la prova gratuita o inserisci una chiave licenza.';

  @override
  String get licenseMsgCheckFormat =>
      'Controlla il formato della chiave licenza. Dovrebbe essere: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Questa chiave licenza non è stata riconosciuta. Ricontrolla e riprova.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Questa chiave è già registrata su un altro computer.';

  @override
  String get licenseMsgContactSupport =>
      'Questa licenza è scaduta. Contatta il supporto per il rinnovo.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Licenza attivata con successo! Grazie per l\'acquisto.';

  @override
  String get licenseMsgUnableToActivate =>
      'Impossibile attivare la licenza. Controlla la connessione internet e riprova.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Benvenuto! La tua prova gratuita di $days giorni è iniziata.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Prova attiva: $days giorni rimanenti.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Prova gratuita attiva';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Licenza attiva - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Impossibile attivare questa chiave licenza.';

  @override
  String get licenseMsgNoLongerValid => 'La licenza non è più valida.';

  @override
  String get licenseMsgUnableToVerify =>
      'Impossibile verificare questa chiave licenza. Contatta il supporto.';

  @override
  String get trialStartedSnackbar => 'Prova Iniziata!';

  @override
  String get trialStartedMessage => 'Goditi 14 giorni di accesso completo';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'Modalità tema';

  @override
  String get methods => 'METODI';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => 'focus / sfocatura';

  @override
  String get showHide => 'mostra / nascondi';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => 'massimizza / ripristina';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => 'minimizza / ripristina';

  @override
  String get dockUndock => 'ancora / sgancia';

  @override
  String get dockLeft => 'ancora sinistra';

  @override
  String get dockRight => 'ancora destra';

  @override
  String get undock => 'sgancia';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'reimposta';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'trasparente';

  @override
  String get red => 'rosso';

  @override
  String get green => 'verde';

  @override
  String get blue => 'blu';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'alto sinistra';

  @override
  String get topCenter => 'alto centro';

  @override
  String get topRight => 'alto destra';

  @override
  String get centerLeft => 'centro sinistra';

  @override
  String get centerRight => 'centro destra';

  @override
  String get bottomLeft => 'basso sinistra';

  @override
  String get bottomCenter => 'basso centro';

  @override
  String get bottomRight => 'basso destra';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Imposta';

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
  String get hidden => 'nascosto';

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
  String get defaultIcon => 'Predefinito';

  @override
  String get original => 'Originale';

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
  String get dragToMoveArea => 'Trascina per spostare';

  @override
  String get dragToResizeArea => 'Trascina per ridimensionare';

  @override
  String get dragToResizeAreaExample => 'Esempio di area ridimensionabile';

  @override
  String get closeWindowConfirmation =>
      'Sei sicuro di voler chiudere questa finestra?';

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
  String get plrReportTitle => 'Rapporto di analisi PLR';

  @override
  String get plrResearchOnlyTitle => 'SOLO PER RICERCA/EDUCAZIONE';

  @override
  String get plrResearchDisclaimer =>
      'I risultati NON sono diagnosi mediche. Consultare un professionista sanitario.';

  @override
  String get plrNameLabel => 'Nome';

  @override
  String plrAgeYears(int age) {
    return 'Eta: $age anni';
  }

  @override
  String get plrTestLabel => 'Test';

  @override
  String get plrSummaryTitle => 'Riepilogo PLR';

  @override
  String plrGradeValue(String grade) {
    return 'Grado $grade';
  }

  @override
  String get plrStatusLabel => 'Stato';

  @override
  String get plrDetectedStatus => 'PLR RILEVATO';

  @override
  String get plrWeakNotDetectedStatus => 'DEBOLE/NON RILEVATO';

  @override
  String get plrRecoveryTimeLabel => 'Tempo di recupero';

  @override
  String get plrRecoveryRatioLabel => 'Rapporto di recupero';

  @override
  String get plrChartDescription =>
      'Rappresentazione visiva della risposta pupillare nel tempo';

  @override
  String plrPiRange(String min, String max) {
    return 'Intervallo P/I: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Dati dei frame';

  @override
  String get plrTableTime => 'Tempo';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Fase';

  @override
  String get plrTableConfidenceShort => 'Conf';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Riusciti: $success | Non riusciti: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latenza: 200-500 ms (tempo fino alla risposta iniziale)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Costrizione: riduzione del 10-30 % rispetto al basale';

  @override
  String get plrReferenceVelocityLine => '• Velocita: 1.5-4.0 %/secondo';

  @override
  String get plrReferenceRecoveryLine =>
      '• Recupero: >75 % di ritorno al basale entro 5 secondi';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Recupero: >75 % di ritorno al basale entro 5 s';

  @override
  String plrShareSubject(String eye) {
    return 'Rapporto di analisi PLR - $eye';
  }

  @override
  String get plrTextReportTitle => 'RAPPORTO DI ANALISI VIDEO PLR';

  @override
  String get plrTextDisclaimerTitle =>
      'AVVISO: solo per ricerca/fini educativi';

  @override
  String get plrTextDisclaimerBody => 'I risultati NON sono diagnosi mediche.';

  @override
  String get plrOverallGradeLabel => 'Valutazione complessiva';

  @override
  String get plrEndOfReport => 'FINE DEL RAPPORTO';

  @override
  String get zoneOverlay => 'Sovrapposizione Zone';

  @override
  String get tipDragImage =>
      'Suggerimento: trascina l\'immagine per allineare il limbo con i cerchi.';

  @override
  String get overlayMetrics => 'Metriche Sovrapposizione';

  @override
  String get piRatioLabel => 'Rapporto P/I:';

  @override
  String get ellipsenessLabel => 'Ellitticità:';

  @override
  String get decentralizationLabel => 'Decentramento:';

  @override
  String get detectedFindings => 'Risultati rilevati';

  @override
  String get anwCollarette => 'ANW / COLLARETTO';

  @override
  String get observerNotes => 'Note dell\'osservatore';

  @override
  String get observerNotesHint =>
      'Inserisci osservazioni cliniche, risultati di zona, pattern…';

  @override
  String get autoCenter => 'Auto-centra';

  @override
  String get anwRing => 'Anello ANW';

  @override
  String get axisGrid => 'Asse/Griglia';

  @override
  String get chart => 'Grafico';

  @override
  String get hoverToIdentify => 'Passa sopra o tocca una zona per identificare';

  @override
  String get organsMode =>
      'Modalità organi — passa sull\'iride per identificare';

  @override
  String get mildSizeDiff =>
      'Lieve differenza di dimensione. Possibile variazione fisiologica.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Entro il range di ricerca per età $age ($group)';
  }

  @override
  String get formLabel => 'Forma:';

  @override
  String get flatteningLabel => 'Appiattimento:';

  @override
  String get protrusionLabel => 'Protrusione:';

  @override
  String get decentrationLabel => 'Decentramento:';

  @override
  String get pupilSizeLabel => 'Dimensione pupilla:';

  @override
  String get anwRatioLabel => 'Rapporto ANW:';

  @override
  String get anwToneLabel => 'Tono ANW:';

  @override
  String get noMajorODAnomalies =>
      'Nessuna anomalia pupillare OD significativa.';

  @override
  String get noMajorOSAnomalies =>
      'Nessuna anomalia pupillare OS significativa.';

  @override
  String get anwNotAssessed => 'ANW: non valutato';

  @override
  String get manualAlignmentAid =>
      'Aiuto allineamento manuale solo per revisione. Trascina immagine o usa Auto-centra.';

  @override
  String get frontalShift => 'S: Pattern di spostamento frontale.';

  @override
  String get cerebralCirculation =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern di circolazione cerebrale.';

  @override
  String get middleTemporalShift =>
      'D: Pattern di spostamento medio-temporale.';

  @override
  String get respiratoryCardiac =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern autonomici respiratori e cardiaci.';

  @override
  String get findings => 'Risultati:';

  @override
  String get analysisReportTitle => 'Rapporto di analisi pupillare';

  @override
  String get reportResearchVersion => 'Versione di ricerca';

  @override
  String get reportDisclaimerTitle => 'AVVISO: solo per ricerca/fini educativi';

  @override
  String get reportDisclaimerBody =>
      'I risultati sono osservazioni di ricerca e NON diagnosi mediche.';

  @override
  String get reportPersonInformationTitle => 'Informazioni sulla persona';

  @override
  String get reportAgeGroupLabel => 'Gruppo di eta';

  @override
  String get reportPupilSizeComparisonTitle => 'Confronto dimensione pupillare';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Metriche di distanza di acquisizione';

  @override
  String get reportResearchObservationsTitle => 'Osservazioni di ricerca';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Note dell osservatore (overlay zone)';

  @override
  String get reportEndOfReport => 'FINE DEL RAPPORTO';

  @override
  String get reportGradeLabel => 'Grado';

  @override
  String get reportPupilFormTitle => 'Forma pupillare';

  @override
  String get reportDecentrationTitle => 'Decentrazione';

  @override
  String get reportFlatteningsTitle => 'Appiattimenti';

  @override
  String get reportProtrusionsTitle => 'Protrusioni';

  @override
  String get reportAnwParametersTitle => 'Corona nervosa autonoma (ANW)';

  @override
  String get reportTonicStateLabel => 'Pattern Tonico Storico';

  @override
  String get reportShiftDetectedTitle => 'Pattern Storico di Spostamento';

  @override
  String get reportClinicalLabel => 'Nota Storica';

  @override
  String get reportConstrictionDetectedTitle => 'Costrizione rilevata';

  @override
  String get reportSeverityLabel => 'Severita';

  @override
  String get reportReferenceValuesTitle =>
      'Valori di riferimento (Protocollo di ricerca CNRI)';

  @override
  String get reportMatchLabel => 'Corrispondenza';

  @override
  String get reportValueLabel => 'Valore';

  @override
  String get reportNormalPupilForm => 'Forma pupillare normale';

  @override
  String reportPageXofY(int page, int total) {
    return 'Pagina $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Rapporto di analisi pupillare - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'In allegato il rapporto di analisi pupillare per $patientName, generato il $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Al di sotto dell intervallo di ricerca per eta $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Al di sopra dell intervallo di ricerca per eta $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Neonato';

  @override
  String get ageGroupChild15 => 'Bambino (1-5)';

  @override
  String get ageGroupChild611 => 'Bambino (6-11)';

  @override
  String get ageGroupTeen => 'Adolescente';

  @override
  String get ageGroupAdult2039 => 'Adulto (20-39)';

  @override
  String get ageGroupAdult4059 => 'Adulto (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Anziano (60+)';

  @override
  String get middleNasalShift => 'Pattern di spostamento medio-nasale.';

  @override
  String get upperTemporalShift =>
      'Pattern di spostamento temporale-superiore.';

  @override
  String get lowerTemporalShift =>
      'Pattern di spostamento temporale-inferiore.';

  @override
  String get basalShift => 'Pattern di spostamento basale.';

  @override
  String get vagusStellateAssociation =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern di ipofunzione del nervo vago o del ganglio stellato.';

  @override
  String get venaCavaInferiorAssociation =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern di disturbo emodinamico nella vena cava inferiore.';

  @override
  String get vertebralArteryAssociation =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern di circolazione dell arteria vertebrale.';

  @override
  String get smallPelvisAssociation =>
      'Gli studi storici secondo Velchover hanno collegato questo a pattern congestizi del piccolo bacino.';

  @override
  String get openZoneOverlay => 'Apri sovrapposizione zone';

  @override
  String get iris => 'Iride';

  @override
  String get chartOpacity => 'Opacita del grafico';

  @override
  String get irisSizeNotAvailable => 'Dati dimensione iride non disponibili';

  @override
  String get ratio => 'Rapporto';

  @override
  String get reportRefPiRatio => 'Rapporto Pupilla/Iride: Normale 20-30%';

  @override
  String get reportRefEllipseness => 'Ellitticita: Normale >95%';

  @override
  String get reportRefDecentralization => 'Decentralizzazione: Normale <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Diff. Dimensione Pupilla: <2% Normale, 2-4% Lieve, >4% Significativo';

  @override
  String get enterPatientInfoAnalysis => 'Inserisci Info Paziente → Analisi';

  @override
  String get chooseCaptureMethod => 'Scegli il metodo di acquisizione:';

  @override
  String get usbCamera => 'Fotocamera USB';

  @override
  String get selectExistingImage => 'Seleziona immagine esistente';

  @override
  String get detectingCameras => 'Rilevamento fotocamere...';

  @override
  String get retryDetection => 'Riprova rilevamento';

  @override
  String get connectUvcCameraViaUsb => 'Collega la fotocamera UVC tramite USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Assicurarsi che i driver siano installati';

  @override
  String get tapRefreshToDetect => 'Tocca Aggiorna per rilevare le fotocamere';

  @override
  String get connectUsbCameraToBegin =>
      'Collega la fotocamera USB per iniziare';

  @override
  String get noExternalCameraTitle => 'Nessuna fotocamera esterna rilevata';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Collega il tuo iridoscopio USB e assicurati che sia inserito';

  @override
  String get languagesAvailable => 'Lingue disponibili';

  @override
  String get validationChecks => 'Controlli di validazione:';

  @override
  String get eyeQualityTip =>
      'Suggerimento: Assicura una buona illuminazione e tieni l\'occhio fermo';

  @override
  String get validatingEye => 'Convalida dell\'occhio...';

  @override
  String get initializing => 'Inizializzazione...';

  @override
  String get nameLabel => 'Nome:';

  @override
  String get ageLabel => 'Età:';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get pleaseEnterName => 'Inserire il nome';

  @override
  String get pleaseEnterAge => 'Inserire l\'età';

  @override
  String get ageMustBe2Digits => 'L\'età deve contenere 1 o 2 cifre';

  @override
  String get optional => '(Facoltativo)';

  @override
  String get bilateralBothHands => 'Uso bilaterale di entrambe le mani';

  @override
  String get zoom => 'Zoom';

  @override
  String get zoomSliderTip =>
      'Usa il cursore dello zoom a destra per regolare l\'ingrandimento prima della registrazione.';

  @override
  String get aboutProgramDeveloper =>
      'Sviluppatore del Programma - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Dimensione del grafico';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Opacità del grafico (0 = solo hover / Modalità organi)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Fatto e torna indietro';

  @override
  String get errorImageShape =>
      'Forma dell\'immagine errata - assicurarsi che l\'occhio riempia il frame';

  @override
  String get cameraConnected => 'Fotocamera connessa';

  @override
  String get cameraDisconnected => 'Fotocamera disconnessa';

  @override
  String get cameraPermissionDenied => 'Autorizzazione fotocamera negata';

  @override
  String get cameraFailedInit => 'Impossibile inizializzare la fotocamera';

  @override
  String get cameraInUse => 'La fotocamera è in uso da un\'altra app';

  @override
  String get cameraFormatNotSupported => 'Formato fotocamera non supportato';

  @override
  String get capturedImageNotFound => 'File immagine acquisita non trovato';

  @override
  String get failedToCaptureImage => 'Impossibile acquisire l\'immagine';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred =>
      'Si è verificato un errore della fotocamera';
}
