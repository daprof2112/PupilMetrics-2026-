// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'CNRI Augenerfassung';

  @override
  String get analyzeButton => 'Analysieren';

  @override
  String get plrModes => 'PLR-Modi';

  @override
  String get captureInstructions =>
      'Positionieren Sie das Auge im Führungskreis';

  @override
  String get scanHistory => 'Scan-Verlauf';

  @override
  String get selectCameraMode => 'Kameramodus Auswählen';

  @override
  String get loadFromGallery => 'Aus Galerie Laden';

  @override
  String get rightEyePhoto => 'Rechtes Auge Foto';

  @override
  String get leftEyePhoto => 'Linkes Auge Foto';

  @override
  String get autoCapture => 'Automatische Aufnahme';

  @override
  String get autoCaptureDesc => 'Augenerkennung + 5-Sekunden Auto-Aufnahme';

  @override
  String get manualCapture => 'Manuelle Aufnahme';

  @override
  String get manualCaptureDesc =>
      'Augenerkennung + manuelle Aufnahme (Rückkamera)';

  @override
  String get selfieMode => 'Selfie-Modus';

  @override
  String get selfieModeDesc =>
      'Augenerkennung + 5-Sek. Auto-Aufnahme (Frontkamera)';

  @override
  String get plrVideoRear => 'PLR-Video (Rück)';

  @override
  String get plrVideoRearDesc => 'Rückkamera • 10-Sek. Aufnahme';

  @override
  String get plrVideoSelfie => 'PLR-Video (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Frontkamera • 10-Sek. Aufnahme';

  @override
  String get plrVideoCapture => 'PLR-Videoaufnahme';

  @override
  String get frontCamera => 'Frontkamera';

  @override
  String get rearCamera => 'Rückkamera';

  @override
  String get selectEyeToAssess => 'Wählen Sie das zu bewertende Auge';

  @override
  String get rightEyeOD => 'Rechtes Auge (OD)';

  @override
  String get leftEyeOS => 'Linkes Auge (OS)';

  @override
  String get recordPlrRightEye => 'PLR für rechtes Auge aufnehmen';

  @override
  String get recordPlrLeftEye => 'PLR für linkes Auge aufnehmen';

  @override
  String get loadRightEyeImage => 'Bild des rechten Auges laden';

  @override
  String get loadLeftEyeImage => 'Bild des linken Auges laden';

  @override
  String get bothEyes => 'Beide Augen';

  @override
  String get loadBothEyesDesc => 'Rechtes Auge laden, dann linkes';

  @override
  String get selectEyeImageFromDevice =>
      'Wählen Sie ein Augenbild von Ihrem Gerät';

  @override
  String get selectRightEyeFirst => 'Wählen Sie zuerst das RECHTE Auge (OD)';

  @override
  String get rightEyeSaved =>
      'Rechtes Auge gespeichert. Wählen Sie nun das LINKE Auge (OS)';

  @override
  String get cancelledNoRightEye =>
      'Abgebrochen - kein rechtes Auge ausgewählt';

  @override
  String get cancelledNoLeftEye => 'Abgebrochen - kein linkes Auge ausgewählt';

  @override
  String errorLoadingImages(String error) {
    return 'Fehler beim Laden der Bilder: $error';
  }

  @override
  String get crop43 => 'Zuschneiden (4:3)';

  @override
  String get success => 'Erfolg';

  @override
  String get imageCroppedSuccess => 'Bild erfolgreich zugeschnitten!';

  @override
  String get error => 'Fehler';

  @override
  String get cropFailed =>
      'Zuschneiden fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get crop => 'Zuschneiden';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get saved => 'Gespeichert! ✅';

  @override
  String get imageSavedToGallery => 'Bild erfolgreich in Galerie gespeichert';

  @override
  String get exposure => 'Belichtung';

  @override
  String get flash => 'Blitz';

  @override
  String get eye => 'Auge';

  @override
  String get center => 'Mitte';

  @override
  String get light => 'Licht';

  @override
  String get ready => 'Bereit';

  @override
  String get on => 'AN';

  @override
  String get off => 'AUS';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUELL';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPILLE';

  @override
  String get plrHistory => 'PLR-Verlauf';

  @override
  String get searchByName => 'Nach Name suchen...';

  @override
  String get totalScans => 'Gesamtscans';

  @override
  String get thisWeek => 'Diese Woche';

  @override
  String get patients => 'Patienten';

  @override
  String get detected => 'Erkannt';

  @override
  String get noPlrRecordsYet => 'Noch keine PLR-Aufzeichnungen';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Nehmen Sie ein PLR-Video auf, um den Verlauf hier zu sehen';

  @override
  String get deleteRecord => 'Aufzeichnung Löschen?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'PLR-Analyse für $name ($eye) löschen?\n\nDies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get delete => 'Löschen';

  @override
  String get recordDeleted => 'Aufzeichnung gelöscht';

  @override
  String plrAnalysis(String eye) {
    return 'PLR-Analyse - $eye';
  }

  @override
  String get patient => 'Patient';

  @override
  String get date => 'Datum';

  @override
  String get frames => 'Frames';

  @override
  String get baselinePiRatio => 'Basis-P/I';

  @override
  String get minPiRatio => 'Min. P/I';

  @override
  String get plrMagnitude => 'PLR-Amplitude';

  @override
  String get constriction => 'Konstriktion';

  @override
  String get plrDetected => 'PLR Erkannt';

  @override
  String get confidence => 'Konfidenz';

  @override
  String get grade => 'Grad';

  @override
  String get close => 'Schließen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get na => 'N/V';

  @override
  String get takeLeftEyePhoto => 'Linkes Auge Fotografieren';

  @override
  String get takeRightEyePhoto => 'Rechtes Auge Fotografieren';

  @override
  String get nowTakingLeftEye => 'Jetzt LINKES Auge (OS) aufnehmen';

  @override
  String get startingWithRightEye => 'Beginne mit RECHTEM Auge (OD)';

  @override
  String get captured => 'Aufgenommen ✓';

  @override
  String get useSameDistanceLighting =>
      'Verwenden Sie denselben Abstand und dieselbe Beleuchtung wie beim rechten Auge für einen genauen Vergleich.';

  @override
  String get step1of2 => 'Schritt 1 von 2';

  @override
  String get step2of2 => 'Schritt 2 von 2';

  @override
  String get bothEyesCaptured => 'Beide Augen aufgenommen ✓';

  @override
  String get continueToLeftEye => 'Weiter zum Linken Auge';

  @override
  String get retakeOD => 'OD Wiederholen';

  @override
  String get retakeOS => 'OS Wiederholen';

  @override
  String get retakeRightEye => 'Rechtes Auge Wiederholen';

  @override
  String get analyzeBothEyes => 'Beide Augen Analysieren';

  @override
  String get patientInfoMissing => 'Patienteninfo Fehlt';

  @override
  String get rightEyePhotoMissing => 'Foto des rechten Auges fehlt!';

  @override
  String get patientInfoMissingRestart =>
      'Patienteninfo fehlt. Bitte neu starten.';

  @override
  String get exitApp => 'App Beenden';

  @override
  String get tipsForBestResults => 'TIPPS FÜR BESTE ERGEBNISSE';

  @override
  String get followGuidelinesForQuality =>
      'Befolgen Sie diese Richtlinien für optimale Bildqualität';

  @override
  String get cameraDistance => 'Kameraabstand';

  @override
  String get cameraDistanceDesc =>
      'Halten Sie die Kamera 10-15 cm vom Auge entfernt. Behalten Sie denselben Abstand für beide Augen bei.';

  @override
  String get lightingPosition => 'Lichtposition';

  @override
  String get lightingPositionDesc =>
      'Positionieren Sie die Lichtquelle innerhalb oder außerhalb der Pupillenränder. Versuchen Sie, zum Kamerablitz zu schauen.';

  @override
  String get avoidReflections => 'Reflexionen Vermeiden';

  @override
  String get avoidReflectionsDesc =>
      'Reduzieren Sie Reflexionen, indem Sie Fensterblendung, Spiegel und direkte Lampen vermeiden.';

  @override
  String get centerYourEye => 'Auge Zentrieren';

  @override
  String get centerYourEyeDesc =>
      'Stellen Sie sicher, dass das gesamte Auge einschließlich der Sklera (weißer Teil) zentriert ist und das Bild ausfüllt.';

  @override
  String get cropProperly => 'Richtig Zuschneiden';

  @override
  String get cropProperlyDesc =>
      'Schneiden Sie das Bild mit dem Auge in der Mitte zu. Das Bild wird automatisch im 4:3-Format gespeichert.';

  @override
  String get importantInformation => 'Wichtige Information';

  @override
  String get imageRatio43 =>
      '4:3-Bildverhältnis für medizinischen Bildstandard';

  @override
  String get forClinicalUseCnri =>
      'Für klinische Verwendung mit CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Bietet keine medizinische Diagnose';

  @override
  String get eyeWideOpenClear =>
      'Stellen Sie sicher, dass Ihr Auge weit geöffnet und das Bild klar ist';

  @override
  String get personalInfo => 'Persönliche Info';

  @override
  String get personInformation => 'Personeninformation';

  @override
  String get enterPersonDetails => 'Personendaten Eingeben';

  @override
  String get infoIncludedInReport =>
      'Diese Information wird im Analysebericht enthalten sein';

  @override
  String get fullName => 'Vollständiger Name';

  @override
  String get enterPersonName => 'Namen eingeben';

  @override
  String get nameRequired => 'Name ist erforderlich';

  @override
  String get sex => 'Geschlecht';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get ageYears => 'Alter (Jahre)';

  @override
  String get enterAge => 'Alter eingeben';

  @override
  String get ageRequired => 'Alter ist erforderlich';

  @override
  String get enterValidNumber => 'Gültige Zahl eingeben';

  @override
  String get enterValidAge => 'Gültiges Alter eingeben (0-120)';

  @override
  String get mainComplaints => 'Hauptbeschwerden';

  @override
  String get mainComplaintsOptional => 'Hauptbeschwerden (optional)';

  @override
  String get complaintsHint => 'z.B. Kopfschmerzen, Sehprobleme, Müdigkeit...';

  @override
  String get continueToCaptire => 'Weiter zur Aufnahme';

  @override
  String get ageImportantNote =>
      'Das Alter ist wichtig für eine genaue Pupillengrößenbewertung, da Normalbereiche nach Alter variieren.';

  @override
  String get submit => 'Absenden';

  @override
  String get pleaseSelectGender => 'Bitte Geschlecht auswählen!';

  @override
  String get applicationSubmitted =>
      'Ihre Anfrage wurde erfolgreich übermittelt.';

  @override
  String get type => 'Typ:';

  @override
  String get gender => 'Geschlecht:';

  @override
  String get rightHanded => 'Rechtshänder';

  @override
  String get leftHanded => 'Linkshänder';

  @override
  String get partialLeftHandedness => 'Partielle Linkshändigkeit';

  @override
  String get retrainedLeftHandedness => 'Umgeschulte Linkshändigkeit';

  @override
  String get bilateralUseBothHands => 'Beidhändiger Gebrauch';

  @override
  String get splashTitle => 'PupilMetrics Augenerfassung';

  @override
  String get splashDeveloper => 'Programmentwickler - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Forschungs-/Bildungswerkzeug';

  @override
  String get startNewAnalysis => 'Neue Analyse Starten';

  @override
  String get viewHistory => 'Verlauf Anzeigen';

  @override
  String get viewResearchDisclaimer => 'Forschungshaftungsausschluss Anzeigen';

  @override
  String get researchDisclaimerTitle => 'Forschungs-/Bildungswerkzeug';

  @override
  String get researchDisclaimerNotMedical => 'KEIN medizinisches Gerät';

  @override
  String get researchDisclaimerNotClinical => 'NICHT für klinische Diagnose';

  @override
  String get researchDisclaimerResults =>
      'Ergebnisse sind Forschungsbeobachtungen';

  @override
  String get researchDisclaimerConsult =>
      'Konsultieren Sie immer medizinisches Fachpersonal';

  @override
  String get researchDisclaimerAcknowledge =>
      'Durch Fortfahren bestätigen Sie, dass dies ein Forschungswerkzeug ist und nicht für medizinische Entscheidungen verwendet werden sollte.';

  @override
  String get researchDisclaimerWarning =>
      'Diese App ist NUR für FORSCHUNGS- und BILDUNGSZWECKE.';

  @override
  String get iUnderstand => 'Ich Verstehe';

  @override
  String get plrAnalysisTest => 'PLR-Analysetest';

  @override
  String get checkingVideoFile => 'Videodatei wird überprüft...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Frame $current/$total verarbeiten (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Analyse abgeschlossen!';

  @override
  String get errorVideoNotFound => 'Fehler: Videodatei nicht gefunden';

  @override
  String get waitingForResults => 'Warte auf Ergebnisse...';

  @override
  String get baseline => 'Basis';

  @override
  String get flashPhase => 'Blitz';

  @override
  String get constrictionPhase => 'Konstriktion';

  @override
  String get recovery => 'Erholung';

  @override
  String get plrDetectedExclaim => 'PLR ERKANNT!';

  @override
  String get plrWeakNotDetected => 'PLR Schwach/Nicht Erkannt';

  @override
  String get min => 'Min';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'Konstr.';

  @override
  String get saveToHistory => 'Im Verlauf Speichern';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Frames Speichern';

  @override
  String get share => 'Teilen';

  @override
  String get frameSavedToGallery => 'Frame in Galerie gespeichert!';

  @override
  String get failedToSaveFrame => 'Frame speichern fehlgeschlagen';

  @override
  String framesSavedToGallery(int count) {
    return '$count Frames in Galerie gespeichert!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON in Zwischenablage kopiert!';

  @override
  String get reportCopiedToClipboard => 'Bericht in Zwischenablage kopiert!';

  @override
  String shareFailedError(String error) {
    return 'Teilen fehlgeschlagen: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Im Verlauf gespeichert! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get noSuccessfulFramesToSave =>
      'Keine erfolgreichen Frames zum Speichern';

  @override
  String get saveAllFrames => 'Alle Frames Speichern';

  @override
  String get shareReport => 'Bericht Teilen';

  @override
  String get shareJson => 'JSON Teilen';

  @override
  String get rerunTest => 'Test Wiederholen';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'Kamera wird initialisiert...';

  @override
  String usingCamera(String camera) {
    return '$camera-Kamera wird verwendet';
  }

  @override
  String cameraError(String error) {
    return 'Kamerafehler: $error';
  }

  @override
  String get noCamerasFound => 'Keine Kameras gefunden';

  @override
  String get retry => 'Wiederholen';

  @override
  String get startPlrRecording => 'PLR-Aufnahme Starten';

  @override
  String get stopRecording => 'Aufnahme Stoppen';

  @override
  String get phaseReady => 'Bereit';

  @override
  String get phaseStarting => 'Startet...';

  @override
  String phaseBaseline(int sec) {
    return 'Basis (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'BLITZ!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Konstriktion ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Erholung ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Abgeschlossen!';

  @override
  String get readyDesc =>
      'Positionieren Sie das Auge im Kreis und tippen Sie auf Start';

  @override
  String get holdSteady => 'Ruhig halten...';

  @override
  String get recordingBaselinePupil => 'Basis-Pupillengröße wird aufgenommen';

  @override
  String lightStimulus(int ms) {
    return 'Lichtreiz (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Pupillenkonstriktion wird gemessen';

  @override
  String get measuringRecovery => 'Pupillenerholung wird gemessen';

  @override
  String get plrRecordingComplete => 'PLR-Aufnahme abgeschlossen';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Positionieren Sie das $eye im Kreis.\nHalten Sie während der $seconds-Sekunden-Aufnahme ruhig.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Halten Sie das Auge ruhig. Blitz erfolgt bei $sec Sekunden.';
  }

  @override
  String get recordingComplete => 'Aufnahme Abgeschlossen';

  @override
  String get plrVideoCapturedSuccess => 'PLR-Video erfolgreich aufgenommen!';

  @override
  String get duration => 'Dauer';

  @override
  String get seconds => 'Sekunden';

  @override
  String get frameRate => 'Bildrate';

  @override
  String get camera => 'Kamera';

  @override
  String flashAt(int sec, int ms) {
    return 'Bei ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Phasen';

  @override
  String get phasesFlow => 'Basis → Blitz → Konstriktion → Erholung';

  @override
  String get expectedNormalValues => 'Erwartete Normalwerte:';

  @override
  String get latency => 'Latenz';

  @override
  String get velocity => 'Geschwindigkeit';

  @override
  String get testFrameAnalysis => '🧪 Frame-Analyse-Test';

  @override
  String get retake => 'Wiederholen';

  @override
  String get done => 'Fertig';

  @override
  String get plrVideoModeTitle => 'PLR-Videomodus';

  @override
  String get plrAssessmentTitle => 'Pupillenlichtreflex (PLR) Bewertung';

  @override
  String get plrInstructions =>
      '1. Positionieren Sie das Auge im Führungskreis\n2. Tippen Sie auf \"PLR-Aufnahme Starten\"\n3. Halten Sie 10 Sekunden ruhig\n4. Ein Blitz erfolgt bei 3 Sekunden\n5. Die App zeichnet die Pupillenreaktion auf';

  @override
  String get recordingPhases => 'Aufnahmephasen:';

  @override
  String get baselinePhaseDesc => 'Anfängliche Pupillengröße';

  @override
  String get flashPhaseDesc => 'Lichtreiz';

  @override
  String get constrictionPhaseDesc => 'Pupille verengt sich';

  @override
  String get recoveryPhaseDesc => 'Pupille kehrt zurück';

  @override
  String get normalPlrValues => 'Normale PLR-Werte:';

  @override
  String get gotIt => 'Verstanden';

  @override
  String get pupilAnalysis => 'Pupillenanalyse';

  @override
  String scansLeft(int count) {
    return '$count übrig';
  }

  @override
  String get validatingRightEye => 'Rechtes Auge validieren...';

  @override
  String get validatingLeftEye => 'Linkes Auge validieren...';

  @override
  String get analyzingRightEye => 'Rechtes Auge analysieren (OD)...';

  @override
  String get analyzingLeftEye => 'Linkes Auge analysieren (OS)...';

  @override
  String get comparingPupils => 'Pupillen vergleichen...';

  @override
  String person(String name) {
    return 'Person: $name';
  }

  @override
  String get invalidEyeImage => 'Ungültiges Augenbild';

  @override
  String analysisFailed(String error) {
    return 'Analyse fehlgeschlagen: $error';
  }

  @override
  String get researchEducationalToolOnly => 'NUR FÜR FORSCHUNG/BILDUNG';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Diese Anwendung dient nur Forschungs- und Bildungszwecken. Die Ergebnisse sind KEINE medizinischen Diagnosen und wurden NICHT für den klinischen Einsatz validiert. Musterassoziationen stammen aus historischer Forschungsliteratur. Konsultieren Sie einen Arzt bei gesundheitlichen Bedenken.';

  @override
  String get pupilSizeDifference => 'Pupillengrößenunterschied Erkannt';

  @override
  String get significantPupilSizeDiff =>
      'SIGNIFIKANTER PUPILLENGRÖSSENUNTERSCHIED';

  @override
  String get diff => 'Diff';

  @override
  String get researchObservationConsult =>
      'Forschungsbeobachtung - Konsultieren Sie einen Arzt zur Interpretation';

  @override
  String get ageBasedResearchBaseline => 'Altersbasierte Forschungsreferenz';

  @override
  String group(String group) {
    return 'Gruppe: $group';
  }

  @override
  String get researchRange => 'Forschungsbereich';

  @override
  String get measuredEst => 'Gemessen (gesch.)';

  @override
  String get pupilForm => 'Pupillenform';

  @override
  String get decentrationPattern => 'Dezentrierungsmuster';

  @override
  String get flattenings => 'Abflachungen';

  @override
  String get protrusions => 'Vorwölbungen';

  @override
  String zonesCount(int count) {
    return '$count Zonen';
  }

  @override
  String get bilateralComparison => 'Bilateraler Vergleich';

  @override
  String get parameter => 'Parameter';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'P/I-Verhältnis';

  @override
  String get ellipseness => 'Elliptizität';

  @override
  String get circularity => 'Zirkularität';

  @override
  String get decentralization => 'Dezentrierung';

  @override
  String get anwRatio => 'ANW-Verhältnis';

  @override
  String get normal => 'Normal';

  @override
  String get elliptical => 'Elliptisch';

  @override
  String get circular => 'Kreisförmig';

  @override
  String get irregular => 'Unregelmäßig';

  @override
  String get centered => 'Zentriert';

  @override
  String get offset => 'Versetzt';

  @override
  String get miosis => 'Miosis';

  @override
  String get constricted => 'Verengt';

  @override
  String get dilated => 'Erweitert';

  @override
  String get mydriasis => 'Mydriasis';

  @override
  String get inner => 'Innen';

  @override
  String get outer => 'Außen';

  @override
  String get high => 'Hoch';

  @override
  String get moderate => 'Moderat';

  @override
  String get savePdf => 'PDF Speichern';

  @override
  String get sharePdf => 'PDF Teilen';

  @override
  String get retakePhotos => 'Fotos Wiederholen';

  @override
  String scansLeftBanner(int count) {
    return '$count Scans übrig';
  }

  @override
  String get upgrade => 'Upgrade';

  @override
  String get unlockUnlimited => 'Unbegrenzt Freischalten';

  @override
  String get usedAllFreeScans =>
      'Sie haben alle kostenlosen Scans aufgebraucht.';

  @override
  String get unlimitedScans => 'Unbegrenzte Scans';

  @override
  String get pdfReports => 'PDF-Berichte';

  @override
  String get scanHistoryFeature => 'Scan-Verlauf';

  @override
  String get bilateralAnalysis => 'Bilaterale Analyse';

  @override
  String get monthly => 'Monatlich';

  @override
  String get perMonth => '/Monat';

  @override
  String get annual => 'Jährlich';

  @override
  String get perYear => '/Jahr';

  @override
  String get tenCredits => '10 Credits';

  @override
  String get oneTime => 'einmalig';

  @override
  String get best => 'BESTE';

  @override
  String get purchaseCancelled => 'Kauf abgebrochen';

  @override
  String purchaseFailed(String error) {
    return 'Kauf fehlgeschlagen: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT gespeichert: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON gespeichert: $path';
  }

  @override
  String get pdfSaved => 'PDF Gespeichert!';

  @override
  String pdfFailed(String error) {
    return 'PDF Fehlgeschlagen: $error';
  }

  @override
  String get open => 'ÖFFNEN';

  @override
  String failed(String error) {
    return 'Fehler: $error';
  }

  @override
  String get staticScans => 'Statisch';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => 'Nach Name oder Beschwerden suchen...';

  @override
  String get searchPlrRecords => 'PLR-Aufzeichnungen suchen...';

  @override
  String get noScansYet => 'Noch keine Scans';

  @override
  String get completedScansAppearHere =>
      'Abgeschlossene Scans werden hier angezeigt';

  @override
  String get deleteScan => 'Scan Löschen?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Scan für $name vom $date löschen?';
  }

  @override
  String get scanDeleted => 'Scan gelöscht';

  @override
  String get originalImagesNotFound => 'Original-Augenbilder nicht gefunden.';

  @override
  String get viewResults => 'Ergebnisse Anzeigen';

  @override
  String get avgPlr => 'Durchschn. PLR';

  @override
  String get years => 'Jahre';

  @override
  String get anisocoria => 'Anisokorie';

  @override
  String get none => 'Keine';

  @override
  String get mild => 'Leicht';

  @override
  String get severe => 'Schwer';

  @override
  String zoneLabel(String zone) {
    return 'Zone: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Assoziiert mit $organ';
  }

  @override
  String get significant => 'Signifikant';

  @override
  String get fair => 'Mäßig';

  @override
  String get low => 'Niedrig';

  @override
  String get good => 'Gut';

  @override
  String get zones => 'Zonen';
}
