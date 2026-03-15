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
  String get center => 'mitte';

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
  String get close => 'schließen';

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
  String get normal => 'normal';

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

  @override
  String get significanceWithinLimits => 'innerhalb akzeptabler Grenzen';

  @override
  String get significanceMild => 'leicht';

  @override
  String get significanceModerate => 'mäßig';

  @override
  String get significanceSignificant => 'signifikant';

  @override
  String get formTypeCircle => 'Kreis (Normal)';

  @override
  String get formTypeOval => 'Oval';

  @override
  String get formTypeOvalVertical => 'Oval-vertikal';

  @override
  String get formTypeOvalHorizontal => 'Oval-horizontal';

  @override
  String get formTypeOvalDiagonal => 'Oval-diagonal';

  @override
  String get formTypeLeftObliqueEllipse => 'Linke Schräge Ellipse';

  @override
  String get formTypeUnilateralEllipse => 'Einseitige Ellipse';

  @override
  String get formTypeVentralDivergingEllipse => 'Ventral Divergierende Ellipse';

  @override
  String get formTypeFrontalDivergingEllipse => 'Frontal Divergierende Ellipse';

  @override
  String get formTypeEllipse => 'Ellipse';

  @override
  String get formTypeChord => 'Sehne';

  @override
  String get formTypeIrregular => 'Unregelmäßig';

  @override
  String get pupilFormCircleDesc =>
      'Normale kreisförmige Pupillenform. Keine Mustervariationen erkannt.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Horizontales ovales Muster. Historische Forschung verband dies mit autonomen Nervensystemmustern, die respiratorische und drüsige Funktionszonen betreffen.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Vertikales ovales Muster. Historische Forschung verband dieses Muster mit zerebralen Zirkulationszonen in autonomen Reflexstudien.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Diagonales ovales Muster. Forschungsliteratur verband dies mit urogenitalen Zonenreflexen in autonomen Studien.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Linkes schräges Ellipsenmuster. Historische Beobachtungen verbanden dies mit urogenitalen und unteren Extremitäten autonomen Zonen.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Einseitiges Ellipsenmuster. Forschung deutete auf Assoziationen mit respiratorischen und bronchialen autonomen Zonen hin.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Ventral divergierende Ellipse. Historische Studien verbanden dies mit autonomen Zonen des unteren Körpers und motorischen Funktionsmustern.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Frontal divergierende Ellipse. Forschungsliteratur verband dieses Muster mit zerebralen und oberen autonomen Zonen.';

  @override
  String get pupilFormOvalDesc =>
      'Leichtes ovales Deformationsmuster. Progression in Forschungsbeobachtungen überwachen.';

  @override
  String get pupilFormEllipseDesc =>
      'Elliptisches Pupillenmuster, das auf autonome Systemvariationen in historischen Studien hinweist.';

  @override
  String get pupilFormChordDesc =>
      'Sehnenartiges Deformationsmuster, das auf lokalisierte autonome Einflüsse in der Forschungsliteratur hinweist.';

  @override
  String get pupilFormIrregularDesc =>
      'Unregelmäßige Form, die auf multiple autonome Mustereinflüsse basierend auf historischen Beobachtungen hindeutet.';

  @override
  String get patternCentered => 'Zentriert (Normal)';

  @override
  String get patternFrontal => 'Frontale Dezentralisierung';

  @override
  String get patternBasal => 'Basale Dezentralisierung';

  @override
  String get patternNasal => 'Nasale Dezentralisierung';

  @override
  String get patternTemporal => 'Temporale Dezentralisierung';

  @override
  String get patternMiddleNasal => 'Mittlere nasale Dezentralisierung';

  @override
  String get patternMiddleTemporal => 'Mittlere temporale Dezentralisierung';

  @override
  String get patternUpperNasal => 'Obere nasale Dezentralisierung';

  @override
  String get patternUpperTemporal => 'Obere temporale Dezentralisierung';

  @override
  String get patternLowerNasal => 'Untere nasale Dezentralisierung';

  @override
  String get patternLowerTemporal => 'Untere temporale Dezentralisierung';

  @override
  String get patternUpwards => 'Dezentrierung - Aufwärts';

  @override
  String get patternDownwards => 'Dezentrierung - Abwärts';

  @override
  String get patternUpwardsInwards => 'Dezentrierung - Aufwärts-Einwärts';

  @override
  String get patternUpwardsOutwards => 'Dezentrierung - Aufwärts-Auswärts';

  @override
  String get decentrationCenteredDesc =>
      'Normale Pupillenpositionierung innerhalb physiologischer Grenzen.';

  @override
  String get decentrationNasalRightDesc =>
      'Nasales Muster (Rechts). Historische Forschung verband diese Zone mit pulmonalen autonomen Reflexen.';

  @override
  String get decentrationNasalLeftDesc =>
      'Nasales Muster (Links). Forschungsliteratur verband diese Zone mit kardialen autonomen Funktionsmustern.';

  @override
  String get decentrationTemporalDesc =>
      'Temporales Muster. Historische Beobachtungen verbanden diese Zone mit renalen und reproduktiven autonomen Reflexen.';

  @override
  String get decentrationFrontalRightDesc =>
      'Frontales Muster (Rechts). Forschung verband diese Zone mit kognitiven und zerebralen Funktionsmustern.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Frontales Muster (Links). Historische Studien verbanden diese Zone mit zerebralen autonomen Mustern.';

  @override
  String get decentrationBasalRightDesc =>
      'Basales Muster (Rechts). Forschung deutete auf Assoziationen mit intrakraniellen Druckreflexen hin.';

  @override
  String get decentrationBasalLeftDesc =>
      'Basales Muster (Links). Historische Beobachtungen verbanden dies mit zerebralen entzündlichen Zonenmustern.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Oberes nasales Muster (Rechts). Forschung verband diese Zone mit hepatobiliären autonomen Reflexen.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Oberes nasales Muster (Links). Historische Studien verbanden dies mit splenischen und diaphragmatischen Zonen.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Oberes temporales Muster. Forschung deutete auf Assoziationen mit renalen und reproduktiven autonomen Zonen hin.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Mittleres nasales Muster (Rechts). Historische Beobachtungen verbanden dies mit Sauerstoffnutzungs- und Herzzonen.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Mittleres nasales Muster (Links). Forschung verband dies mit neurologischen und kardialen autonomen Mustern.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Mittleres temporales Muster (Rechts). Forschung verband dies mit kardialen autonomen Regulationszonen.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Mittleres temporales Muster (Links). Historische Studien verbanden dies mit pulmonalen und kardialen Zonen.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Oberes nasales Muster (Rechts). Forschung deutete auf Assoziationen mit kognitiven Zonen und Halswirbelsäulenreflexen hin.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Oberes nasales Muster (Links). Historische Beobachtungen verbanden dies mit kognitiven Mustern und zervikalen Zonen.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Oberes temporales Muster (Rechts). Forschung verband diese Zone mit Hirnnerven- und Hörreflexen.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Oberes temporales Muster (Links). Historische Studien verbanden dies mit neurovegetativen und Sprachzonen.';

  @override
  String get decentrationLowerNasalDesc =>
      'Unteres nasales Muster. Forschung deutete auf Assoziationen mit urogenitalen und lumbosakralen autonomen Zonen hin.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Unteres temporales Muster (Rechts). Historische Beobachtungen verbanden dies mit metabolischen und hepatischen Zonen.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Unteres temporales Muster (Links). Forschung verband dies mit kardialen und splenischen autonomen Mustern.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Muster assoziiert mit oberer zentraler Zone. Historische Forschung verband dies mit Stimmungsregulations- und Energie-autonomen Reflexen.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Muster assoziiert mit oberer temporaler Zone. Forschung deutete auf Assoziationen mit Hirnnerven- und auditiven autonomen Reflexen hin.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Muster assoziiert mit mittlerer temporaler Zone. Historische Beobachtungen verbanden dies mit respiratorischen und kardialen autonomen Mustern.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Muster assoziiert mit unterer temporaler Zone. Forschungsliteratur verband dies mit hepatischen und metabolischen autonomen Zonen.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Muster assoziiert mit unterer basaler Zone. Historische Studien verbanden dies mit renalen und unteren Extremitäten autonomen Reflexen.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Muster assoziiert mit unterer nasaler Zone. Forschung deutete auf Assoziationen mit urogenitalen und Becken-autonomen Zonen hin.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Muster assoziiert mit mittlerer nasaler Zone. Historische Beobachtungen verbanden dies mit Sauerstoffnutzungs- und respiratorischen autonomen Mustern.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Muster assoziiert mit oberer nasaler Zone. Forschungsliteratur verband dies mit kognitiven und zervikalen autonomen Reflexen.';

  @override
  String get flatteningDefaultRightDesc =>
      'Autonome Nervensystem-Mustervariation in dieser Zone basierend auf historischer Forschung erkannt.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Muster assoziiert mit oberer zentraler Zone. Historische Forschung verband dies mit Stimmungsregulations- und neurologischen autonomen Mustern.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Muster assoziiert mit oberer temporaler Zone. Forschung deutete auf Assoziationen mit neurovegetativen und Sprach-autonomen Zonen hin.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Muster assoziiert mit mittlerer temporaler Zone. Historische Beobachtungen verbanden dies mit pulmonalen und kardialen autonomen Reflexen.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Muster assoziiert mit unterer temporaler Zone. Forschungsliteratur verband dies mit kardialen und splenischen autonomen Mustern.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Muster assoziiert mit unterer basaler Zone. Historische Studien verbanden dies mit renalen und eliminativen autonomen Zonen.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Muster assoziiert mit unterer nasaler Zone. Forschung deutete auf Assoziationen mit urogenitalen und lumbosakralen autonomen Reflexen hin.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Muster assoziiert mit mittlerer nasaler Zone. Historische Beobachtungen verbanden dies mit kardialen und respiratorischen autonomen Mustern.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Muster assoziiert mit oberer nasaler Zone. Forschungsliteratur verband dies mit kognitiven und zervikalen autonomen Zonen.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Autonome Nervensystem-Mustervariation in dieser Zone basierend auf historischer Forschung erkannt.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Protrusionsmuster in oberer zentraler Zone. Forschung verband dies mit sympathischen Hyperaktivierungsmustern, die zerebrale Zonen betreffen.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Protrusionsmuster in oberer temporaler Zone. Historische Beobachtungen verbanden dies mit Hirnnerven- und Hörsystem-Hyperaktivitätsmustern.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Protrusionsmuster in mittlerer temporaler Zone. Forschung deutete auf Assoziationen mit kardialen und respiratorischen sympathischen Mustern hin.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Protrusionsmuster in unterer temporaler Zone. Historische Studien verbanden dies mit hepatobiliären und metabolischen sympathischen Zonen.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Protrusionsmuster in unterer basaler Zone. Forschung verband dies mit renalen und Becken-sympathischen Hyperaktivitätsmustern.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Protrusionsmuster in unterer nasaler Zone. Historische Beobachtungen verbanden dies mit urogenitalen sympathischen Aktivierungszonen.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Protrusionsmuster in mittlerer nasaler Zone. Forschung deutete auf Assoziationen mit gastrischen und pankreatischen sympathischen Mustern hin.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Protrusionsmuster in oberer nasaler Zone. Historische Studien verbanden dies mit kognitiven und visuellen sympathischen Hyperaktivierungszonen.';

  @override
  String get protrusionDefaultRightDesc =>
      'Sympathisches Nervensystem-Hyperaktivitätsmuster in dieser Zone basierend auf Forschungsbeobachtungen erkannt.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Protrusionsmuster in oberer zentraler Zone. Forschung verband dies mit psychomotorischen und zerebralen sympathischen Mustern.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Protrusionsmuster in oberer temporaler Zone. Historische Beobachtungen verbanden dies mit neurovegetativen sympathischen Hyperaktivitätszonen.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Protrusionsmuster in mittlerer temporaler Zone. Forschung deutete auf Assoziationen mit pulmonalen und kardialen sympathischen Mustern hin.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Protrusionsmuster in unterer temporaler Zone. Historische Studien verbanden dies mit splenischen und kardialen sympathischen Aktivierungszonen.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Protrusionsmuster in unterer basaler Zone. Forschung verband dies mit Becken- und renalen sympathischen Hyperaktivitätsmustern.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Protrusionsmuster in unterer nasaler Zone. Historische Beobachtungen verbanden dies mit lumbosakralen sympathischen Aktivierungszonen.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Protrusionsmuster in mittlerer nasaler Zone. Forschung deutete auf Assoziationen mit Angst-kardialen sympathischen Mustern hin.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Protrusionsmuster in oberer nasaler Zone. Historische Studien verbanden dies mit kognitiven und visuellen sympathischen Hyperaktivierungszonen.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Sympathisches Nervensystem-Hyperaktivitätsmuster in dieser Zone basierend auf Forschungsbeobachtungen erkannt.';

  @override
  String get anisocoriaNone =>
      'Pupillengrößen innerhalb normaler Grenzen. Keine signifikante Anisokorie erkannt.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisokorie erkannt: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'L>R';

  @override
  String get anisocoriaDirectionDS => 'R>L';

  @override
  String get anisocoriaSeverityNone => 'Innerhalb normaler Grenzen.';

  @override
  String get anisocoriaSeverityMild =>
      'Leichte Differenz beobachtet. Kann physiologisch sein.';

  @override
  String get anisocoriaSeverityModerate =>
      'Mäßige Asymmetrie. Forschungsbeobachtung notiert.';

  @override
  String get anisocoriaSeveritySevere =>
      'Signifikante Asymmetrie. Forschungsbeobachtung markiert.';

  @override
  String get largerPupilEqual => 'gleich';

  @override
  String get largerPupilOS => 'OS (Links)';

  @override
  String get largerPupilOD => 'OD (Rechts)';

  @override
  String get decentrationWithinLimits => 'Innerhalb normaler Grenzen.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Versatz: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Zentral-Oben';

  @override
  String get zoneUpperNasal => 'Nasal-Oben';

  @override
  String get zoneMiddleNasal => 'Nasal-Mitte';

  @override
  String get zoneLowerNasal => 'Nasal-Unten';

  @override
  String get zoneLowerBasal => 'Basal-Unten';

  @override
  String get zoneLowerTemporal => 'Temporal-Unten';

  @override
  String get zoneMiddleTemporal => 'Temporal-Mitte';

  @override
  String get zoneUpperTemporal => 'Temporal-Oben';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Basal';

  @override
  String get zoneUnknown => 'Unbekannt';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Abflachung $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Protrusion $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB-Iriskop-Modus';

  @override
  String get iriscopeExternal => 'Iriskop / Extern';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'Angeschlossene USB-Kamera oder Iriskop verwenden';

  @override
  String get detectedCameras => 'Erkannte Kameras';

  @override
  String get externalCamera => 'Externe Kamera';

  @override
  String cameraIndex(int index) {
    return 'Kamera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Keine externe Kamera erkannt.\nSchließen Sie ein USB-Iriskop an.';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get selectCameraSource => 'Kameraquelle Auswählen';

  @override
  String camerasDetected(int count) {
    return '$count Kameras erkannt';
  }

  @override
  String camerasAvailable(int count) {
    return '$count Kameras verfügbar';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Externe Kamera $index';
  }

  @override
  String get qualityGatedRear =>
      'Qualitätskontrollierte Auto-Aufnahme (Rückkamera)';

  @override
  String get qualityGatedFront =>
      'Qualitätskontrollierte Auto-Aufnahme (Frontkamera)';

  @override
  String get usbCameraInfo => 'USB-Kamera-Info';

  @override
  String get connected => 'Verbunden';

  @override
  String get waiting => 'Warten...';

  @override
  String get disconnected => 'Getrennt';

  @override
  String get waitingForUsbCamera => 'Warte auf USB-Kamera';

  @override
  String get connectIriscopePrompt =>
      'Verbinden Sie Ihr Iriskop über USB-OTG-Adapter.\nErteilen Sie die Berechtigung wenn gefragt.';

  @override
  String get usbCameraIssue => 'USB-Kamera-Problem';

  @override
  String get pleaseConnectIriscope =>
      'Bitte verbinden Sie Ihr Iriskop oder USB-Kamera.';

  @override
  String get retryConnection => 'Verbindung Wiederholen';

  @override
  String get troubleshootingTips => 'Fehlerbehebungstipps';

  @override
  String get tipUsbOtgAdapter =>
      'Stellen Sie sicher, dass der USB-OTG-Adapter richtig verbunden ist';

  @override
  String get tipUsbHostMode =>
      'Prüfen Sie, ob das Gerät USB-Host-Modus unterstützt';

  @override
  String get tipReconnectCamera =>
      'Versuchen Sie, die Kamera zu trennen und erneut zu verbinden';

  @override
  String get tipGrantPermissions =>
      'Erteilen Sie USB-Berechtigungen wenn gefragt';

  @override
  String get tipUnlockDevice => 'Einige Geräte müssen entsperrt sein';

  @override
  String get back => 'Zurück';

  @override
  String get switchEye => 'Auge Wechseln';

  @override
  String get state => 'Zustand';

  @override
  String get status => 'Status';

  @override
  String get usingFlutterUvcPlugin =>
      'Verwendet flutter_uvc_camera Plugin\nfür USB Video Class Geräteunterstützung.';

  @override
  String get initialized => 'Initialisiert';

  @override
  String get notReady => 'Nicht Bereit';

  @override
  String get captureDistanceMatch => 'Abstandsübereinstimmung';

  @override
  String get irisSize => 'Irisgröße';

  @override
  String get distanceMatched => 'Abstand Übereinstimmend';

  @override
  String get distanceMismatch => 'Abstand Nicht Übereinstimmend';

  @override
  String get excellentMatch => 'Ausgezeichnete Übereinstimmung';

  @override
  String get goodMatch => 'Gute Übereinstimmung';

  @override
  String get acceptableMatch => 'Akzeptable Übereinstimmung';

  @override
  String get considerRetaking =>
      'Abstand stimmt nicht überein - erneute Aufnahme empfohlen';

  @override
  String get qualityReady => 'Bereit! Ruhig halten...';

  @override
  String get qualityTooBlurry => 'Kamera ruhig halten';

  @override
  String get qualityTooDark => 'Mehr Licht benötigt';

  @override
  String get qualityTooBright => 'Zu hell - Licht reduzieren';

  @override
  String get qualityNoContrast => 'Beleuchtungswinkel anpassen';

  @override
  String get qualityNoPupil => 'Pupille im Rahmen zentrieren';

  @override
  String get qualityNotCentered => 'Auge zur Mitte bewegen';

  @override
  String get qualityNotAnEye => 'Kein Auge erkannt';

  @override
  String get qualityProcessing => 'Verarbeitung...';

  @override
  String get distanceMatchedCheck => '✓ Abstand übereinstimmend';

  @override
  String get distanceGoodMatchCheck => '✓ Gute Übereinstimmung';

  @override
  String get distanceSlightlyBack => 'Etwas zurück ↔';

  @override
  String get distanceSlightlyCloser => 'Etwas näher ↔';

  @override
  String get distanceAlmostThere => 'Fast geschafft...';

  @override
  String get distanceMoveBack => 'Zurückgehen ←←';

  @override
  String get distanceMoveCloser => 'Näher kommen →→';

  @override
  String get distanceTooClose => 'Zu nah! Zurückgehen';

  @override
  String get distanceTooFar => 'Zu weit! Näher kommen';

  @override
  String get distanceStabilizing => 'Stabilisierung...';

  @override
  String distanceLabel(int percent) {
    return 'Abstand: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Frontkamera';

  @override
  String get rearCameraLabel => 'Rückkamera';

  @override
  String get startingCamera => 'Kamera wird gestartet...';

  @override
  String get eyeNotDetected => 'Auge Nicht Erkannt';

  @override
  String get tryAgain => 'Erneut Versuchen';

  @override
  String get indicatorEye => 'Auge';

  @override
  String get indicatorSharp => 'Schärfe';

  @override
  String get indicatorLight => 'Licht';

  @override
  String get indicatorFocus => 'Fokus';

  @override
  String get indicatorPupil => 'Pupille';

  @override
  String get indicatorIris => 'Iris';

  @override
  String get indicatorMatch => 'Übereinst.';

  @override
  String get checkImageShape => 'Bildform';

  @override
  String get checkCircularIris => 'Runde Iris';

  @override
  String get checkDarkPupil => 'Dunkle Pupille';

  @override
  String get checkIrisTexture => 'Iris-Textur';

  @override
  String get checkPupilIrisStructure => 'Pupille-Iris-Struktur';

  @override
  String get checkNaturalColors => 'Natürliche Farben';

  @override
  String get checkEdgePattern => 'Kantenmuster';

  @override
  String get errorImageShapeIncorrect =>
      'Bildform falsch - Auge muss den Rahmen füllen';

  @override
  String get errorNoEyeDetected =>
      'Kein Auge erkannt - Iris im Rahmen zentrieren';

  @override
  String get errorNoPupilDetected =>
      'Keine Pupille erkannt - gute Beleuchtung sicherstellen';

  @override
  String get errorNoIrisTexture => 'Keine Iris-Textur - näher ans Auge gehen';

  @override
  String get errorUnusualColors =>
      'Ungewöhnliche Farben - Bildschirme/Reflexionen vermeiden';

  @override
  String get errorTooManyEdges =>
      'Zu viele gerade Kanten - möglicherweise kein Auge';

  @override
  String get errorNotValidEye =>
      'Ungültiges Augenbild - bitte erneut versuchen';

  @override
  String get holdStillCapturing => 'Stillhalten - Aufnahme...';

  @override
  String get adjustDistanceFirst => 'Zuerst Abstand anpassen';

  @override
  String get stabilizingReading => 'Stabilisierung...';

  @override
  String get autoCaptureWhenReady => 'Auto-Aufnahme wenn bereit';

  @override
  String get tapOrWaitAutoCapture => 'Tippen oder auf Auto-Aufnahme warten';

  @override
  String get validatingImage => 'Validierung...';

  @override
  String get capturingStatus => 'Aufnahme...';

  @override
  String get adjustPositionStatus => 'Position anpassen';

  @override
  String get validationTip =>
      'Tipp: Gute Beleuchtung sicherstellen, Kamera 10-15cm vom Auge halten, Reflexionen vermeiden';

  @override
  String get validationChecksTitle => 'Validierungsprüfungen:';

  @override
  String confidenceLabel(int percent) {
    return 'Konfidenz:';
  }

  @override
  String get incompleteData => 'Unvollständige Daten';

  @override
  String get irisDiameterLabel => 'Iris ø';

  @override
  String get plrResponseCurve => 'PLR-Antwortkurve';

  @override
  String get plrLatency => 'Latenz';

  @override
  String get plrVelocity => 'Geschw.';

  @override
  String get plrRecoveryTime => 'Erholung';

  @override
  String get plrRecoveryRatio => 'Erh.-Ratio';

  @override
  String get plrEnhancedMetrics => 'Erweiterte PLR-Metriken';

  @override
  String get plrNormalLatency => 'Normal: 200-500ms';

  @override
  String get plrNormalConstriction => 'Normal: 10-30%';

  @override
  String get plrNormalVelocity => 'Normal: 1,5-4,0%/s';

  @override
  String get plrReferenceValues => 'Normale PLR-Referenzwerte';

  @override
  String get plrSubjectInfo => 'Probandeninformation';

  @override
  String get plrTestType => 'Pupillenlichtreflex';

  @override
  String get plrAnalysisSummary => 'Analysezusammenfassung';

  @override
  String get plrTotalFrames => 'Analysierte Frames Gesamt';

  @override
  String get plrSuccessRate => 'Erfolgsrate';

  @override
  String get plrMaxConstriction => 'Maximale Konstriktion';

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
  String get helpTitle => 'Hilfe & Benutzerhandbuch';

  @override
  String get helpTabQuickStart => 'Schnellstart';

  @override
  String get helpTabCnriAnalysis => 'CNRI-Analyse';

  @override
  String get helpTabShortcuts => 'Tastenkürzel';

  @override
  String get helpTabTroubleshooting => 'Fehlerbehebung';

  @override
  String get helpOnlineDocs => 'Online-Dokumentation';

  @override
  String get helpContactSupport => 'Support Kontaktieren';

  @override
  String get helpGettingStarted => 'Erste Schritte';

  @override
  String get helpStep1Title => 'Iriskop Verbinden';

  @override
  String get helpStep1Desc =>
      'Verbinden Sie Ihr Dino-Lite oder kompatibles USB-Iriskop.';

  @override
  String get helpStep2Title => 'Patienteninformationen Eingeben';

  @override
  String get helpStep2Desc =>
      'Geben Sie Name, Alter, Geschlecht und Hauptbeschwerden des Patienten ein.';

  @override
  String get helpStep3Title => 'Rechtes Auge Erfassen (OD)';

  @override
  String get helpStep3Desc =>
      'Positionieren Sie das Iriskop und erfassen Sie das Bild des rechten Auges.';

  @override
  String get helpStep4Title => 'Linkes Auge Erfassen (OS)';

  @override
  String get helpStep4Desc =>
      'Wiederholen Sie für das linke Auge mit gleichbleibender Beleuchtung.';

  @override
  String get helpStep5Title => 'Analyse Überprüfen';

  @override
  String get helpStep5Desc =>
      'Die App analysiert P/I-Verhältnis, Pupillenform und ANW-Eigenschaften.';

  @override
  String get helpStep6Title => 'Bericht Exportieren';

  @override
  String get helpStep6Desc => 'Speichern Sie als PDF-, TXT- oder JSON-Format.';

  @override
  String get helpTipBestResults =>
      'Für beste Ergebnisse: Verwenden Sie gleichmäßige Beleuchtung und halten Sie 2-3cm Iriskop-Abstand.';

  @override
  String get helpCnriProtocolFeatures => 'CNRI-Protokoll-Funktionen';

  @override
  String get helpFeaturePiRatioTitle => 'Pupille/Iris-Verhältnis (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal: 20-30%. Werte außerhalb können auf autonomes Ungleichgewicht hinweisen.';

  @override
  String get helpFeaturePupilFormTitle => 'Pupillenform-Analyse';

  @override
  String get helpFeaturePupilFormDesc =>
      'Erkennt ovale Muster, Dezentrierungsrichtung und Exzentrizität.';

  @override
  String get helpFeatureAnwTitle => 'ANW (Krausenring) Bewertung';

  @override
  String get helpFeatureAnwDesc =>
      'Analysiert Verhältnis, Formregularität, Sektorverschiebungen und tonischen Zustand.';

  @override
  String get helpFeatureZoneTitle => 'Zonenanalyse';

  @override
  String get helpFeatureZoneDesc =>
      'Ordnet Abflachungen/Vorwölbungen den CNRI-Organzonen zu.';

  @override
  String get helpFeatureBilateralTitle => 'Bilateraler Vergleich';

  @override
  String get helpFeatureBilateralDesc =>
      'Vergleicht OD vs OS um Asymmetrien zu erkennen.';

  @override
  String get helpFeatureMlTitle => 'ONNX-CNN-Vergleich';

  @override
  String get helpFeatureMlDesc =>
      'Das ONNX-CNN-Modell liefert sekundäre Messungen zum Vergleich.';

  @override
  String get helpKeyboardShortcuts => 'Tastenkürzel';

  @override
  String get helpCameraControls => 'Kamerasteuerung';

  @override
  String get helpShortcutSpace => 'Bild aufnehmen';

  @override
  String get helpShortcutCtrlS => 'PDF-Bericht speichern';

  @override
  String get helpShortcutCtrlO => 'Galeriebild öffnen';

  @override
  String get helpShortcutCtrlH => 'Scan-Verlauf anzeigen';

  @override
  String get helpShortcutF11 => 'Vollbild umschalten';

  @override
  String get helpShortcutEsc => 'Zurück / Abbrechen';

  @override
  String get helpShortcutScroll => 'Vergrößern/Verkleinern';

  @override
  String get helpShortcutDoubleClick => 'Zoom zurücksetzen';

  @override
  String get helpCommonIssues => 'Häufige Probleme';

  @override
  String get helpIssueCameraNotDetected => 'Kamera nicht erkannt';

  @override
  String get helpIssueCameraSolution1 => 'USB-Verbindung prüfen';

  @override
  String get helpIssueCameraSolution2 => 'Anderen USB-Port versuchen';

  @override
  String get helpIssueCameraSolution3 => 'Dino-Lite-Treiber installieren';

  @override
  String get helpIssueCameraSolution4 => 'Anwendung neu starten';

  @override
  String get helpIssuePupilDetectionFails => 'Pupillenerkennung fehlgeschlagen';

  @override
  String get helpIssuePupilSolution1 =>
      'Ausreichende Beleuchtung sicherstellen';

  @override
  String get helpIssuePupilSolution2 => 'Pupille im Rahmen zentrieren';

  @override
  String get helpIssuePupilSolution3 => 'Iriskop-Linse reinigen';

  @override
  String get helpIssuePupilSolution4 => 'Fokus manuell anpassen';

  @override
  String get helpIssuePdfExportFails => 'PDF-Export fehlgeschlagen';

  @override
  String get helpIssuePdfSolution1 => 'Ordnerberechtigungen prüfen';

  @override
  String get helpIssuePdfSolution2 => 'Speicherplatz sicherstellen';

  @override
  String get helpIssuePdfSolution3 => 'Offene PDF-Dateien schließen';

  @override
  String get helpIssuePdfSolution4 => 'Zuerst TXT-Export versuchen';

  @override
  String get helpCaptureChecklistTitle => 'Aufnahme-Checkliste';

  @override
  String get helpCaptureChecklist1 =>
      'Halten Sie die Pupille zentriert und vollständig im Bild sichtbar.';

  @override
  String get helpCaptureChecklist2 =>
      'Verwenden Sie gleichmäßige Beleuchtung und reduzieren Sie Blendung oder Reflexe auf der Hornhaut.';

  @override
  String get helpCaptureChecklist3 =>
      'Halten Sie einen ähnlichen Iriskop-Abstand für rechtes und linkes Auge ein.';

  @override
  String get helpCaptureChecklist4 =>
      'Fokussieren Sie neu oder nehmen Sie erneut auf, wenn der Pupillenrand weich oder unscharf wirkt.';

  @override
  String get helpExportSettingsTitle => 'Export-Einstellungen';

  @override
  String get helpExportSettingsDesc =>
      'PDF automatisch speichern kann nach der Analyse einen Bericht sichern, Bilder einschließen steuert die Augenfotos im PDF, und ONNX-CNN-Vergleich anzeigen fügt Vergleichswerte zu Berichten hinzu.';

  @override
  String get helpHybridScoreTitle => 'Hybride Konfidenz & Note';

  @override
  String get helpHybridScoreDesc =>
      'Die angezeigte Konfidenz und Note kombinieren klassische Geometriequalität mit ML-Übereinstimmung und spiegeln daher die Messzuverlässigkeit statt einer Diagnose wider.';

  @override
  String get helpAnomalyGuideTitle => 'Abflachungen & Vorwölbungen lesen';

  @override
  String get helpAnomalyGuideDesc =>
      'Abflachungen zeigen ein relatives Einwärtsziehen, Vorwölbungen ein Auswärtsziehen entlang des Pupillenrands; jede Karte zeigt Zone, Ausmaß und zugeordnete Assoziation.';

  @override
  String get helpZoneOverlayGuideTitle => 'Zonen-Overlay';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Verwenden Sie das Zonen-Overlay, um Sektorpositionen visuell zu prüfen und zu kontrollieren, wo erkannte Anomalien um Pupille und Iris liegen.';

  @override
  String get helpContactSupportTip =>
      'Kontaktieren Sie helpdesk@cnri.edu für Unterstützung.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsCameraIriscope => 'KAMERA / IRISKOP';

  @override
  String get settingsPreferredCamera => 'Bevorzugte Kamera:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB-Kamera';

  @override
  String get settingsCameraAutoDetect => 'Automatisch erkennen';

  @override
  String get settingsDefaultZoom => 'Standard-Zoom:';

  @override
  String get settingsAnalysis => 'ANALYSE';

  @override
  String get settingsShowMlComparison => 'ML-Vergleich anzeigen';

  @override
  String get settingsShowZoneOverlay => 'Zonen-Überlagerung anzeigen';

  @override
  String get settingsExportReports => 'EXPORT & BERICHTE';

  @override
  String get settingsAutoSavePdf => 'PDF automatisch speichern';

  @override
  String get settingsIncludeImages => 'Bilder einschließen';

  @override
  String get settingsSaved => 'Einstellungen gespeichert';

  @override
  String get aboutResearchEdition => 'Forschungsausgabe';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutLicense => 'Lizenz';

  @override
  String get aboutLicensedTo => 'Lizenziert an:';

  @override
  String get aboutExpires => 'Läuft ab:';

  @override
  String get aboutManageLicense => 'Lizenz Verwalten';

  @override
  String get aboutBasedOnCnri => 'Basierend auf CNRI-Protokoll';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Webseite';

  @override
  String get aboutPrivacy => 'Datenschutz';

  @override
  String get languageSelectTitle => 'Sprache Auswählen';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get languageChanged => 'Sprache Geändert';

  @override
  String languageChangedMessage(String language) {
    return 'App-Sprache auf $language eingestellt';
  }

  @override
  String get languageSystemNotAvailable => 'Sprachsystem nicht verfügbar';

  @override
  String get licenseLoading => 'Laden...';

  @override
  String get licenseWelcome => 'Willkommen bei PupilMetrics!';

  @override
  String get licenseTrialFeatures => '14-tägige Testversion • Alle Funktionen';

  @override
  String get licenseStartTrial => 'Testversion Starten';

  @override
  String get licenseEnterKey => 'Lizenz Eingeben';

  @override
  String get licenseFreeTrial => 'Kostenlose Testversion';

  @override
  String licenseDaysRemaining(int count) {
    return '$count Tage verbleibend';
  }

  @override
  String get licenseTrialEnded => 'Testversion Beendet';

  @override
  String get licenseEnterToContinue => 'Lizenz eingeben um fortzufahren';

  @override
  String get licenseStandard => 'Standardlizenz';

  @override
  String get licenseProfessional => 'Professionelle Lizenz';

  @override
  String get licenseEnterprise => 'Unternehmenslizenz';

  @override
  String get licenseLicensed => 'Lizenziert';

  @override
  String get licenseActive => 'Aktiv';

  @override
  String get licenseTrialUser => 'Testnutzer';

  @override
  String get licenseLifetime => 'Lebenslang';

  @override
  String get licenseNotSetUp => 'Nicht Eingerichtet';

  @override
  String get trialExpiredTitle => 'Testzeitraum Beendet';

  @override
  String get trialExpiredMessage =>
      'Ihre 14-tägige Testversion ist beendet. Um weiterhin Irisbilder zu analysieren, erwerben Sie bitte eine Lizenz.';

  @override
  String get trialExpiredCanStill => 'Sie können noch:';

  @override
  String get trialExpiredViewAnalyses => 'Ihre vorherigen Analysen ansehen';

  @override
  String get trialExpiredExportReports => 'Bestehende Berichte exportieren';

  @override
  String get trialExpiredAccessHistory => 'Auf Scan-Verlauf zugreifen';

  @override
  String get trialExpiredMaybeLater => 'Vielleicht Später';

  @override
  String get licenseRegistration => 'Lizenzregistrierung';

  @override
  String get licenseStatusValid => 'Lizenziert';

  @override
  String get licenseStatusTrialActive => 'Kostenlose Testversion';

  @override
  String get licenseStatusTrialExpired => 'Testversion Beendet';

  @override
  String get licenseStatusExpired => 'Lizenz Abgelaufen';

  @override
  String get licenseStatusInvalid => 'Ungültige Lizenz';

  @override
  String get licenseStatusUnregistered => 'Nicht Eingerichtet';

  @override
  String get licenseStatusMachineMismatch => 'Anderer Computer';

  @override
  String get licenseStatusNetworkError => 'Verbindungsfehler';

  @override
  String get licenseEnterKeyTitle => 'Lizenzschlüssel Eingeben';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Ihr Name';

  @override
  String get licenseEmailAddress => 'E-Mail-Adresse';

  @override
  String get licenseMachineId => 'Maschinen-ID';

  @override
  String get licenseCopyMachineId => 'Maschinen-ID Kopieren';

  @override
  String get licenseMachineIdCopied => 'Maschinen-ID in Zwischenablage kopiert';

  @override
  String get licenseValidationKeyRequired =>
      'Bitte geben Sie Ihren Lizenzschlüssel ein';

  @override
  String get licenseValidationKeyFormat =>
      'Schlüssel sollte 20 Zeichen haben (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Bitte geben Sie Ihren Namen ein';

  @override
  String get licenseValidationEmailRequired =>
      'Bitte geben Sie Ihre E-Mail ein';

  @override
  String get licenseValidationEmailInvalid =>
      'Bitte geben Sie eine gültige E-Mail ein';

  @override
  String get licenseActivate => 'Lizenz Aktivieren';

  @override
  String get licenseContinueTrial => 'Testversion Fortsetzen';

  @override
  String get licenseBuyLicense => 'Lizenz Kaufen';

  @override
  String get licenseNeedHelp => 'Hilfe benötigt?';

  @override
  String get licenseLicenseAgreement => 'Lizenzvereinbarung';

  @override
  String get licenseActivatedSuccess => 'Lizenz Erfolgreich Aktiviert!';

  @override
  String get licenseMsgMachineMismatch =>
      'Diese Lizenz ist auf einem anderen Computer registriert. Bitte verwenden Sie Ihr Originalgerät oder kontaktieren Sie den Support.';

  @override
  String get licenseMsgTrialEnded =>
      'Ihre kostenlose Testversion ist beendet. Geben Sie einen Lizenzschlüssel ein, um alle Funktionen weiter zu nutzen.';

  @override
  String get licenseMsgExpired =>
      'Ihre Lizenz ist abgelaufen. Bitte verlängern Sie, um fortzufahren.';

  @override
  String get licenseMsgNeedsSetup =>
      'Die Lizenz muss eingerichtet werden. Starten Sie Ihre kostenlose Testversion oder geben Sie einen Lizenzschlüssel ein.';

  @override
  String get licenseMsgCheckFormat =>
      'Bitte überprüfen Sie das Format Ihres Schlüssels. Es sollte so aussehen: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Dieser Lizenzschlüssel wurde nicht erkannt. Bitte überprüfen und erneut versuchen.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Dieser Schlüssel ist bereits auf einem anderen Computer registriert.';

  @override
  String get licenseMsgContactSupport =>
      'Diese Lizenz ist abgelaufen. Bitte kontaktieren Sie den Support zur Verlängerung.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Lizenz erfolgreich aktiviert! Vielen Dank für Ihren Kauf.';

  @override
  String get licenseMsgUnableToActivate =>
      'Lizenz konnte nicht aktiviert werden. Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Willkommen! Ihre $days-tägige kostenlose Testversion hat begonnen.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Testversion aktiv: $days Tage verbleibend.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Kostenlose Testversion aktiv';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Lizenz aktiv - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Dieser Lizenzschlüssel konnte nicht aktiviert werden.';

  @override
  String get licenseMsgNoLongerValid => 'Lizenz ist nicht mehr gültig.';

  @override
  String get licenseMsgUnableToVerify =>
      'Dieser Lizenzschlüssel konnte nicht verifiziert werden. Bitte kontaktieren Sie den Support.';

  @override
  String get trialStartedSnackbar => 'Testversion Gestartet!';

  @override
  String get trialStartedMessage => 'Genießen Sie 14 Tage vollen Zugang';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'Themenmodus';

  @override
  String get methods => 'METHODEN';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => 'Fokus / Unschärfe';

  @override
  String get showHide => 'anzeigen / ausblenden';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => 'maximieren / wiederherstellen';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => 'minimieren / wiederherstellen';

  @override
  String get dockUndock => 'andocken / abdocken';

  @override
  String get dockLeft => 'links andocken';

  @override
  String get dockRight => 'rechts andocken';

  @override
  String get undock => 'abdocken';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'zurücksetzen';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'transparent';

  @override
  String get red => 'rot';

  @override
  String get green => 'grün';

  @override
  String get blue => 'blau';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'oben links';

  @override
  String get topCenter => 'oben mitte';

  @override
  String get topRight => 'oben rechts';

  @override
  String get centerLeft => 'mitte links';

  @override
  String get centerRight => 'mitte rechts';

  @override
  String get bottomLeft => 'unten links';

  @override
  String get bottomCenter => 'unten mitte';

  @override
  String get bottomRight => 'unten rechts';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Setzen';

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
  String get hidden => 'versteckt';

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
  String get defaultIcon => 'Standard';

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
  String get dragToMoveArea => 'Ziehen zum Verschieben';

  @override
  String get dragToResizeArea => 'Ziehen zum Ändern der Größe';

  @override
  String get dragToResizeAreaExample => 'Beispiel für Größenänderungsbereich';

  @override
  String get closeWindowConfirmation =>
      'Sind Sie sicher, dass Sie dieses Fenster schließen möchten?';

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
  String get plrReportTitle => 'PLR-Analysebericht';

  @override
  String get plrResearchOnlyTitle => 'NUR FUER FORSCHUNGS-/BILDUNGSZWECKE';

  @override
  String get plrResearchDisclaimer =>
      'Ergebnisse sind KEINE medizinischen Diagnosen. Bitte medizinisches Fachpersonal konsultieren.';

  @override
  String get plrNameLabel => 'Name';

  @override
  String plrAgeYears(int age) {
    return 'Alter: $age Jahre';
  }

  @override
  String get plrTestLabel => 'Test';

  @override
  String get plrSummaryTitle => 'PLR-Zusammenfassung';

  @override
  String plrGradeValue(String grade) {
    return 'Grad $grade';
  }

  @override
  String get plrStatusLabel => 'Status';

  @override
  String get plrDetectedStatus => 'PLR ERKANNT';

  @override
  String get plrWeakNotDetectedStatus => 'SCHWACH/NICHT ERKANNT';

  @override
  String get plrRecoveryTimeLabel => 'Erholungszeit';

  @override
  String get plrRecoveryRatioLabel => 'Erholungsverhaeltnis';

  @override
  String get plrChartDescription =>
      'Visuelle Darstellung der Pupillenreaktion im Zeitverlauf';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I-Bereich: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min.: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Frame-Daten';

  @override
  String get plrTableTime => 'Zeit';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Phase';

  @override
  String get plrTableConfidenceShort => 'Konf';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Erfolgreich: $success | Fehlgeschlagen: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latenz: 200-500 ms (Zeit bis zur ersten Reaktion)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Konstriktion: 10-30 % Reduktion gegenueber dem Ausgangswert';

  @override
  String get plrReferenceVelocityLine => '• Geschwindigkeit: 1,5-4,0 %/Sekunde';

  @override
  String get plrReferenceRecoveryLine =>
      '• Erholung: >75 % Rueckkehr zum Ausgangswert innerhalb von 5 Sekunden';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Erholung: >75 % Rueckkehr zum Ausgangswert innerhalb von 5 s';

  @override
  String plrShareSubject(String eye) {
    return 'PLR-Analysebericht - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR-VIDEOANALYSEBERICHT';

  @override
  String get plrTextDisclaimerTitle =>
      'HAFTUNGSAUSSCHLUSS: Nur fuer Forschungs-/Bildungszwecke';

  @override
  String get plrTextDisclaimerBody =>
      'Ergebnisse sind KEINE medizinischen Diagnosen.';

  @override
  String get plrOverallGradeLabel => 'Gesamtbewertung';

  @override
  String get plrEndOfReport => 'ENDE DES BERICHTS';

  @override
  String get zoneOverlay => 'Zonenüberlagerung';

  @override
  String get tipDragImage =>
      'Tipp: Bild ziehen, um den Limbus an den Kreisen auszurichten.';

  @override
  String get overlayMetrics => 'Overlay-Messwerte';

  @override
  String get piRatioLabel => 'P/I-Verhältnis:';

  @override
  String get ellipsenessLabel => 'Elliptizität:';

  @override
  String get decentralizationLabel => 'Dezentralisierung:';

  @override
  String get detectedFindings => 'Erkannte Befunde';

  @override
  String get anwCollarette => 'ANW / KOLLARETTE';

  @override
  String get observerNotes => 'Beobachternotizen';

  @override
  String get observerNotesHint =>
      'Klinische Beobachtungen, Zonenbefunde, Muster eingeben…';

  @override
  String get autoCenter => 'Auto-Zentrierung';

  @override
  String get anwRing => 'ANW-Ring';

  @override
  String get axisGrid => 'Achse/Gitter';

  @override
  String get chart => 'Diagramm';

  @override
  String get hoverToIdentify => 'Zone berühren oder darüber fahren';

  @override
  String get organsMode => 'Organmodus — Iris berühren zum Identifizieren';

  @override
  String get mildSizeDiff =>
      'Leichter Größenunterschied. Möglicherweise physiologische Variation.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Im Forschungsbereich für Alter $age ($group)';
  }

  @override
  String get formLabel => 'Form:';

  @override
  String get flatteningLabel => 'Abflachung:';

  @override
  String get protrusionLabel => 'Vorwölbung:';

  @override
  String get decentrationLabel => 'Dezentrierung:';

  @override
  String get pupilSizeLabel => 'Pupillengröße:';

  @override
  String get anwRatioLabel => 'ANW-Verhältnis:';

  @override
  String get anwToneLabel => 'ANW-Tonus:';

  @override
  String get noMajorODAnomalies => 'Keine wesentlichen OD-Pupillenanomalien.';

  @override
  String get noMajorOSAnomalies => 'Keine wesentlichen OS-Pupillenanomalien.';

  @override
  String get anwNotAssessed => 'ANW: nicht bewertet';

  @override
  String get manualAlignmentAid =>
      'Manuelle Ausrichtungshilfe nur zur Überprüfung. Bild ziehen oder Auto-Zentrierung verwenden.';

  @override
  String get frontalShift => 'S: Frontales Verschiebungsmuster.';

  @override
  String get cerebralCirculation =>
      'Historische Studien nach Velchover brachten dies mit zerebralen Durchblutungsmustern in Verbindung.';

  @override
  String get middleTemporalShift => 'D: Mittel-temporales Verschiebungsmuster.';

  @override
  String get respiratoryCardiac =>
      'Historische Studien nach Velchover brachten dies mit respiratorischen und kardialen autonomen Mustern in Verbindung.';

  @override
  String get findings => 'Befunde:';

  @override
  String get analysisReportTitle => 'Pupillenanalysebericht';

  @override
  String get reportResearchVersion => 'Forschungsversion';

  @override
  String get reportDisclaimerTitle =>
      'HAFTUNGSAUSSCHLUSS: Nur fuer Forschungs-/Bildungszwecke';

  @override
  String get reportDisclaimerBody =>
      'Ergebnisse sind Forschungsbeobachtungen und KEINE medizinischen Diagnosen.';

  @override
  String get reportPersonInformationTitle => 'Personeninformationen';

  @override
  String get reportAgeGroupLabel => 'Altersgruppe';

  @override
  String get reportPupilSizeComparisonTitle => 'Pupillengroessenvergleich';

  @override
  String get reportCaptureDistanceMetricsTitle => 'Aufnahmeabstandsmetriken';

  @override
  String get reportResearchObservationsTitle => 'Forschungsbeobachtungen';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Beobachternotizen (Zonen-Overlay)';

  @override
  String get reportEndOfReport => 'ENDE DES BERICHTS';

  @override
  String get reportGradeLabel => 'Grad';

  @override
  String get reportPupilFormTitle => 'Pupillenform';

  @override
  String get reportDecentrationTitle => 'Dezentrierung';

  @override
  String get reportFlatteningsTitle => 'Abflachungen';

  @override
  String get reportProtrusionsTitle => 'Vorwoelbungen';

  @override
  String get reportAnwParametersTitle => 'Autonomer Nervenkranz (ANW)';

  @override
  String get reportTonicStateLabel => 'Historisches Tonusmuster';

  @override
  String get reportShiftDetectedTitle => 'Historisches Verschiebungsmuster';

  @override
  String get reportClinicalLabel => 'Historischer Hinweis';

  @override
  String get reportConstrictionDetectedTitle => 'Konstriktion erkannt';

  @override
  String get reportSeverityLabel => 'Schweregrad';

  @override
  String get reportReferenceValuesTitle =>
      'Referenzwerte (CNRI-Forschungsprotokoll)';

  @override
  String get reportMatchLabel => 'Uebereinstimmung';

  @override
  String get reportValueLabel => 'Wert';

  @override
  String get reportNormalPupilForm => 'Normale Pupillenform';

  @override
  String reportPageXofY(int page, int total) {
    return 'Seite $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Pupillenanalysebericht - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Anbei der Pupillenanalysebericht fuer $patientName, erstellt am $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Unter dem Forschungsbereich fuer Alter $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Ueber dem Forschungsbereich fuer Alter $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Saeugling';

  @override
  String get ageGroupChild15 => 'Kind (1-5)';

  @override
  String get ageGroupChild611 => 'Kind (6-11)';

  @override
  String get ageGroupTeen => 'Jugendlicher';

  @override
  String get ageGroupAdult2039 => 'Erwachsener (20-39)';

  @override
  String get ageGroupAdult4059 => 'Erwachsener (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Senior (60+)';

  @override
  String get middleNasalShift => 'Mittel-nasales Verschiebungsmuster.';

  @override
  String get upperTemporalShift => 'Oberes temporales Verschiebungsmuster.';

  @override
  String get lowerTemporalShift => 'Unteres temporales Verschiebungsmuster.';

  @override
  String get basalShift => 'Basales Verschiebungsmuster.';

  @override
  String get vagusStellateAssociation =>
      'Historische Studien nach Velchover brachten dies mit Hypofunktionsmustern des Nervus vagus oder des Ganglion stellatum in Verbindung.';

  @override
  String get venaCavaInferiorAssociation =>
      'Historische Studien nach Velchover brachten dies mit hamodynamischen Storungsmustern der Vena cava inferior in Verbindung.';

  @override
  String get vertebralArteryAssociation =>
      'Historische Studien nach Velchover brachten dies mit Durchblutungsmustern der Arteria vertebralis in Verbindung.';

  @override
  String get smallPelvisAssociation =>
      'Historische Studien nach Velchover brachten dies mit Stauungsmustern im kleinen Becken in Verbindung.';

  @override
  String get openZoneOverlay => 'Zonenueberlagerung oeffnen';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'Diagrammtransparenz';

  @override
  String get irisSizeNotAvailable => 'Irisgroessendaten nicht verfuegbar';

  @override
  String get ratio => 'Verhaeltnis';

  @override
  String get reportRefPiRatio => 'Pupillen/Iris-Verhaeltnis: Normal 20-30%';

  @override
  String get reportRefEllipseness => 'Ellipsizitaet: Normal >95%';

  @override
  String get reportRefDecentralization => 'Dezentralisierung: Normal <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Pupillengroesse Diff.: <2% Normal, 2-4% Mild, >4% Signifikant';

  @override
  String get enterPatientInfoAnalysis => 'Patienteninfo eingeben → Analyse';

  @override
  String get chooseCaptureMethod => 'Aufnahmemethode wählen:';

  @override
  String get usbCamera => 'USB-Kamera';

  @override
  String get selectExistingImage => 'Vorhandenes Bild auswählen';

  @override
  String get detectingCameras => 'Kameras werden erkannt...';

  @override
  String get retryDetection => 'Erkennung erneut versuchen';

  @override
  String get connectUvcCameraViaUsb => 'UVC-Kamera per USB verbinden';

  @override
  String get ensureCameraDriversInstalled =>
      'Sicherstellen, dass Kameratreiber installiert sind';

  @override
  String get tapRefreshToDetect =>
      'Auf Aktualisieren tippen, um Kameras zu erkennen';

  @override
  String get connectUsbCameraToBegin => 'USB-Kamera verbinden, um zu beginnen';

  @override
  String get noExternalCameraTitle => 'Keine externe Kamera erkannt';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'USB-Iriskop anschließen und sicherstellen, dass es eingesteckt ist';

  @override
  String get languagesAvailable => 'Verfügbare Sprachen';

  @override
  String get validationChecks => 'Validierungsprüfungen:';

  @override
  String get eyeQualityTip =>
      'Tipp: Gute Beleuchtung sicherstellen und Auge ruhig halten';

  @override
  String get validatingEye => 'Auge wird validiert...';

  @override
  String get initializing => 'Initialisierung...';

  @override
  String get nameLabel => 'Name:';

  @override
  String get ageLabel => 'Alter:';

  @override
  String get typeLabel => 'Typ:';

  @override
  String get pleaseEnterName => 'Bitte Name eingeben';

  @override
  String get pleaseEnterAge => 'Bitte Alter eingeben';

  @override
  String get ageMustBe2Digits => 'Alter muss 1 oder 2 Ziffern enthalten';

  @override
  String get optional => '(Optional)';

  @override
  String get bilateralBothHands => 'Beidseitiger Gebrauch beider Hände';

  @override
  String get zoom => 'Zoom';

  @override
  String get zoomSliderTip =>
      'Verwenden Sie den Zoom-Schieberegler rechts, um die Vergrößerung vor der Aufnahme anzupassen.';

  @override
  String get aboutProgramDeveloper =>
      'Programmentwickler - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Diagrammgröße';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Diagramm-Deckkraft (0 = nur Hover / Organmodus)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Fertig & Zurück';

  @override
  String get errorImageShape =>
      'Bildform falsch - stellen Sie sicher, dass das Auge den Rahmen füllt';

  @override
  String get cameraConnected => 'Kamera verbunden';

  @override
  String get cameraDisconnected => 'Kamera getrennt';

  @override
  String get cameraPermissionDenied => 'Kamera-Berechtigung verweigert';

  @override
  String get cameraFailedInit => 'Kamera-Initialisierung fehlgeschlagen';

  @override
  String get cameraInUse => 'Kamera wird von einer anderen App verwendet';

  @override
  String get cameraFormatNotSupported => 'Kameraformat nicht unterstützt';

  @override
  String get capturedImageNotFound => 'Aufgenommene Bilddatei nicht gefunden';

  @override
  String get failedToCaptureImage => 'Bildaufnahme fehlgeschlagen';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Kamerafehler aufgetreten';
}
