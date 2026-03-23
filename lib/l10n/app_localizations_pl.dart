// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => 'Analizuj';

  @override
  String get plrModes => 'Tryby PLR';

  @override
  String get captureInstructions => 'Ustaw oko w okręgu prowadnicy';

  @override
  String get scanHistory => 'Historia skanów';

  @override
  String get selectCameraMode => 'Wybierz tryb kamery';

  @override
  String get loadFromGallery => 'Wczytaj z galerii';

  @override
  String get rightEyePhoto => 'Zdjęcie prawego oka';

  @override
  String get leftEyePhoto => 'Zdjęcie lewego oka';

  @override
  String get autoCapture => 'Automatyczne przechwytywanie';

  @override
  String get autoCaptureDesc => 'Detekcja oka + auto-przechwytywanie po 5 sek.';

  @override
  String get manualCapture => 'Ręczne przechwytywanie';

  @override
  String get manualCaptureDesc =>
      'Detekcja oka + ręczne przechwytywanie (tylna kamera)';

  @override
  String get selfieMode => 'Tryb selfie';

  @override
  String get selfieModeDesc =>
      'Detekcja oka + auto-przechwytywanie po 5 sek. (przednia kamera)';

  @override
  String get plrVideoRear => 'PLR Video (Tylna)';

  @override
  String get plrVideoRearDesc => 'Tylna kamera • 10 sek. przechwytywania';

  @override
  String get plrVideoSelfie => 'PLR Video (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Przednia kamera • 10 sek. przechwytywania';

  @override
  String get plrVideoCapture => 'Przechwytywanie PLR Video';

  @override
  String get frontCamera => 'Przednia kamera';

  @override
  String get rearCamera => 'Tylna kamera';

  @override
  String get selectEyeToAssess => 'Wybierz oko do oceny';

  @override
  String get rightEyeOD => 'Prawe oko (OD)';

  @override
  String get leftEyeOS => 'Lewe oko (OS)';

  @override
  String get recordPlrRightEye => 'Nagraj PLR dla prawego oka';

  @override
  String get recordPlrLeftEye => 'Nagraj PLR dla lewego oka';

  @override
  String get loadRightEyeImage => 'Wczytaj obraz prawego oka';

  @override
  String get loadLeftEyeImage => 'Wczytaj obraz lewego oka';

  @override
  String get bothEyes => 'Oboje oczu';

  @override
  String get loadBothEyesDesc => 'Wczytaj prawe oko, następnie lewe';

  @override
  String get selectEyeImageFromDevice => 'Wybierz obraz oka z urządzenia';

  @override
  String get selectRightEyeFirst => 'Najpierw wybierz obraz PRAWEGO oka (OD)';

  @override
  String get rightEyeSaved =>
      'Prawe oko zapisane. Teraz wybierz obraz LEWEGO oka (OS)';

  @override
  String get cancelledNoRightEye => 'Anulowano – nie wybrano prawego oka';

  @override
  String get cancelledNoLeftEye => 'Anulowano – nie wybrano lewego oka';

  @override
  String errorLoadingImages(String error) {
    return 'Błąd wczytywania obrazów: $error';
  }

  @override
  String get crop43 => 'Przytnij (4:3)';

  @override
  String get success => 'Sukces';

  @override
  String get imageCroppedSuccess => 'Obraz przycięty pomyślnie!';

  @override
  String get error => 'Błąd';

  @override
  String get cropFailed => 'Nie udało się przyciąć obrazu. Spróbuj ponownie.';

  @override
  String get crop => 'Przytnij';

  @override
  String get cancel => 'Anuluj';

  @override
  String get saved => 'Zapisano! ✅';

  @override
  String get imageSavedToGallery => 'Obraz zapisany pomyślnie w galerii';

  @override
  String get exposure => 'Ekspozycja';

  @override
  String get flash => 'Błysk';

  @override
  String get eye => 'Oko';

  @override
  String get center => 'środek';

  @override
  String get light => 'Światło';

  @override
  String get ready => 'Gotowy';

  @override
  String get on => 'WŁ';

  @override
  String get off => 'WYŁ';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'RĘCZNY';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'ŹRENICA';

  @override
  String get plrHistory => 'Historia PLR';

  @override
  String get searchByName => 'Szukaj po nazwisku...';

  @override
  String get totalScans => 'Łączna liczba skanów';

  @override
  String get thisWeek => 'Ten tydzień';

  @override
  String get patients => 'Pacjenci';

  @override
  String get detected => 'Wykryto';

  @override
  String get noPlrRecordsYet => 'Brak rekordów PLR';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Nagraj film PLR, aby zobaczyć historię';

  @override
  String get deleteRecord => 'Usunąć rekord?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Usunąć analizę PLR dla $name ($eye)?\\n\\nTej operacji nie można cofnąć.';
  }

  @override
  String get delete => 'Usuń';

  @override
  String get recordDeleted => 'Rekord usunięty';

  @override
  String plrAnalysis(String eye) {
    return 'Analiza PLR – $eye';
  }

  @override
  String get patient => 'Pacjent';

  @override
  String get date => 'Data';

  @override
  String get frames => 'Klatki';

  @override
  String get baselinePiRatio => 'Bazowe P/I';

  @override
  String get minPiRatio => 'Min P/I';

  @override
  String get plrMagnitude => 'Wielkość PLR';

  @override
  String get constriction => 'Zwężenie';

  @override
  String get plrDetected => 'PLR wykryty';

  @override
  String get confidence => 'Pewność';

  @override
  String get grade => 'Ocena';

  @override
  String get close => 'zamknij';

  @override
  String get yes => 'Tak';

  @override
  String get no => 'Nie';

  @override
  String get na => 'N/D';

  @override
  String get takeLeftEyePhoto => 'Zrób zdjęcie lewego oka';

  @override
  String get takeRightEyePhoto => 'Zrób zdjęcie prawego oka';

  @override
  String get nowTakingLeftEye => 'Teraz przechwytywane LEWE oko (OS)';

  @override
  String get startingWithRightEye => 'Zaczynamy od PRAWEGO oka (OD)';

  @override
  String get captured => 'Przechwycono ✓';

  @override
  String get useSameDistanceLighting =>
      'Użyj tej samej odległości i oświetlenia co przy prawym oku, aby zapewnić dokładne porównanie.';

  @override
  String get step1of2 => 'Krok 1 z 2';

  @override
  String get step2of2 => 'Krok 2 z 2';

  @override
  String get bothEyesCaptured => 'Oboje oczu przechwycone ✓';

  @override
  String get continueToLeftEye => 'Przejdź do lewego oka';

  @override
  String get retakeOD => 'Powtórz OD';

  @override
  String get retakeOS => 'Powtórz OS';

  @override
  String get retakeRightEye => 'Powtórz prawe oko';

  @override
  String get analyzeBothEyes => 'Analizuj oboje oczu';

  @override
  String get patientInfoMissing => 'Brak danych pacjenta';

  @override
  String get rightEyePhotoMissing => 'Brak zdjęcia prawego oka!';

  @override
  String get patientInfoMissingRestart =>
      'Brak danych pacjenta. Uruchom ponownie.';

  @override
  String get exitApp => 'Zamknij aplikację';

  @override
  String get tipsForBestResults => 'WSKAZÓWKI DLA NAJLEPSZYCH WYNIKÓW';

  @override
  String get followGuidelinesForQuality =>
      'Stosuj się do tych wskazówek dla optymalnej jakości obrazu';

  @override
  String get cameraDistance => 'Odległość kamery';

  @override
  String get cameraDistanceDesc =>
      'Trzymaj kamerę 10–15 cm od oka. Zachowaj tę samą odległość dla obu oczu.';

  @override
  String get lightingPosition => 'Położenie oświetlenia';

  @override
  String get lightingPositionDesc =>
      'Ustaw źródło światła wewnątrz lub na zewnątrz granic źrenicy. Spróbuj patrzeć w kierunku lampy błyskowej.';

  @override
  String get avoidReflections => 'Unikaj refleksów';

  @override
  String get avoidReflectionsDesc =>
      'Zmniejsz odbicia, unikając odbicia od okien, luster i bezpośrednich lamp.';

  @override
  String get centerYourEye => 'Wyśrodkuj oko';

  @override
  String get centerYourEyeDesc =>
      'Upewnij się, że całe oko wraz z twardówką (białą częścią) jest wyśrodkowane i wypełnia kadr.';

  @override
  String get cropProperly => 'Przytnij właściwie';

  @override
  String get cropProperlyDesc =>
      'Przytnij obraz z okiem na środku. Obraz zostanie automatycznie zapisany w proporcjach 4:3.';

  @override
  String get importantInformation => 'Ważne informacje';

  @override
  String get imageRatio43 =>
      'Proporcje obrazu 4:3 zgodnie ze standardem obrazowania medycznego';

  @override
  String get forClinicalUseCnri => 'Do użytku klinicznego z CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Nie dostarcza diagnozy medycznej';

  @override
  String get eyeWideOpenClear =>
      'Upewnij się, że oko jest szeroko otwarte, a zdjęcie jest wyraźne';

  @override
  String get personalInfo => 'Dane osobowe';

  @override
  String get personInformation => 'Informacje o osobie';

  @override
  String get enterPersonDetails => 'Wprowadź dane osoby';

  @override
  String get infoIncludedInReport =>
      'Te informacje zostaną uwzględnione w raporcie z analizy';

  @override
  String get fullName => 'Imię i nazwisko';

  @override
  String get enterPersonName => 'Wprowadź nazwisko osoby';

  @override
  String get nameRequired => 'Imię i nazwisko jest wymagane';

  @override
  String get sex => 'Płeć';

  @override
  String get male => 'Mężczyzna';

  @override
  String get female => 'Kobieta';

  @override
  String get ageYears => 'Wiek (lata)';

  @override
  String get enterAge => 'Wprowadź wiek';

  @override
  String get ageRequired => 'Wiek jest wymagany';

  @override
  String get enterValidNumber => 'Wprowadź prawidłową liczbę';

  @override
  String get enterValidAge => 'Wprowadź prawidłowy wiek (0–120)';

  @override
  String get mainComplaints => 'Główne dolegliwości';

  @override
  String get mainComplaintsOptional => 'Główne dolegliwości (opcjonalne)';

  @override
  String get complaintsHint =>
      'np. bóle głowy, problemy ze wzrokiem, zmęczenie...';

  @override
  String get continueToCaptire => 'Przejdź do przechwytywania';

  @override
  String get ageImportantNote =>
      'Wiek jest ważny dla dokładnej oceny wielkości źrenicy, ponieważ zakresy prawidłowe różnią się w zależności od wieku.';

  @override
  String get submit => 'Zatwierdź';

  @override
  String get pleaseSelectGender => 'Proszę wybrać płeć!';

  @override
  String get applicationSubmitted =>
      'Twoje zgłoszenie zostało pomyślnie przesłane.';

  @override
  String get type => 'Typ:';

  @override
  String get gender => 'Płeć:';

  @override
  String get rightHanded => 'Praworęczny';

  @override
  String get leftHanded => 'Leworęczny';

  @override
  String get partialLeftHandedness => 'Częściowa leworęczność';

  @override
  String get retrainedLeftHandedness => 'Przekwalifikowana leworęczność';

  @override
  String get bilateralUseBothHands => 'Oburęczność';

  @override
  String get splashTitle => 'PupilMetrics Eye Capture';

  @override
  String get splashDeveloper => 'Twórca programu – Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Narzędzie badawczo-dydaktyczne';

  @override
  String get startNewAnalysis => 'Rozpocznij nową analizę';

  @override
  String get viewHistory => 'Wyświetl historię';

  @override
  String get viewResearchDisclaimer => 'Wyświetl zastrzeżenie badawcze';

  @override
  String get researchDisclaimerTitle => 'Narzędzie badawczo-dydaktyczne';

  @override
  String get researchDisclaimerNotMedical => 'NIE jest urządzeniem medycznym';

  @override
  String get researchDisclaimerNotClinical => 'NIE do diagnozy klinicznej';

  @override
  String get researchDisclaimerResults => 'Wyniki są obserwacjami badawczymi';

  @override
  String get researchDisclaimerConsult =>
      'Zawsze konsultuj się z pracownikami ochrony zdrowia';

  @override
  String get researchDisclaimerAcknowledge =>
      'Kontynuując, potwierdzasz, że jest to narzędzie badawcze i nie należy go używać do podejmowania decyzji medycznych.';

  @override
  String get researchDisclaimerWarning =>
      'Ta aplikacja służy WYŁĄCZNIE do celów BADAWCZYCH i EDUKACYJNYCH.';

  @override
  String get iUnderstand => 'Rozumiem';

  @override
  String get plrAnalysisTest => 'Test analizy PLR';

  @override
  String get checkingVideoFile => 'Sprawdzanie pliku wideo...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Przetwarzanie klatki $current/$total ($timestamp ms)...';
  }

  @override
  String get analysisComplete => 'Analiza zakończona!';

  @override
  String get errorVideoNotFound => 'Błąd: nie znaleziono pliku wideo';

  @override
  String get waitingForResults => 'Oczekiwanie na wyniki...';

  @override
  String get baseline => 'Wartość bazowa';

  @override
  String get flashPhase => 'Błysk';

  @override
  String get constrictionPhase => 'Zwężenie';

  @override
  String get recovery => 'Powrót';

  @override
  String get plrDetectedExclaim => 'PLR WYKRYTY!';

  @override
  String get plrWeakNotDetected => 'PLR słaby/niewykryty';

  @override
  String get min => 'Min';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'Zwęż.';

  @override
  String get saveToHistory => 'Zapisz w historii';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Zapisz klatki';

  @override
  String get share => 'Udostępnij';

  @override
  String get frameSavedToGallery => 'Klatka zapisana w galerii!';

  @override
  String get failedToSaveFrame => 'Nie udało się zapisać klatki';

  @override
  String framesSavedToGallery(int count) {
    return '$count klatek zapisanych w galerii!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON skopiowany do schowka!';

  @override
  String get reportCopiedToClipboard => 'Raport skopiowany do schowka!';

  @override
  String shareFailedError(String error) {
    return 'Udostępnianie nie powiodło się: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Zapisano w historii! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Nie udało się zapisać: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'Brak poprawnych klatek do zapisania';

  @override
  String get saveAllFrames => 'Zapisz wszystkie klatki';

  @override
  String get shareReport => 'Udostępnij raport';

  @override
  String get shareJson => 'Udostępnij JSON';

  @override
  String get rerunTest => 'Powtórz test';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR – $eye';
  }

  @override
  String get initializingCamera => 'Inicjalizacja kamery...';

  @override
  String usingCamera(String camera) {
    return 'Używana kamera: $camera';
  }

  @override
  String cameraError(String error) {
    return 'Błąd kamery: $error';
  }

  @override
  String get noCamerasFound => 'Nie znaleziono kamer';

  @override
  String get retry => 'Ponów';

  @override
  String get startPlrRecording => 'Rozpocznij nagrywanie PLR';

  @override
  String get stopRecording => 'Zatrzymaj nagrywanie';

  @override
  String get phaseReady => 'Gotowy';

  @override
  String get phaseStarting => 'Uruchamianie...';

  @override
  String phaseBaseline(int sec) {
    return 'Wartość bazowa (0–$sec s)';
  }

  @override
  String get phaseFlash => 'BŁYSK!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Zwężenie ($start–$end s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Powrót ($start–$end s)';
  }

  @override
  String get phaseComplete => 'Ukończono!';

  @override
  String get readyDesc => 'Ustaw oko w okręgu, a następnie dotknij Start';

  @override
  String get holdSteady => 'Trzymaj nieruchomo...';

  @override
  String get recordingBaselinePupil => 'Nagrywanie bazowego rozmiaru źrenicy';

  @override
  String lightStimulus(int ms) {
    return 'Bodziec świetlny ($ms ms)';
  }

  @override
  String get measuringConstriction => 'Pomiar zwężenia źrenicy';

  @override
  String get measuringRecovery => 'Pomiar powrotu źrenicy';

  @override
  String get plrRecordingComplete => 'Nagrywanie PLR zakończone';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Ustaw $eye oko w okręgu.\\nTrzymaj nieruchomo podczas $seconds-sekundowego nagrywania.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Trzymaj oko nieruchomo. Błysk nastąpi po $sec sekundach.';
  }

  @override
  String get recordingComplete => 'Nagrywanie zakończone';

  @override
  String get plrVideoCapturedSuccess => 'Film PLR przechwycony pomyślnie!';

  @override
  String get duration => 'Czas trwania';

  @override
  String get seconds => 'sekundy';

  @override
  String get frameRate => 'Liczba klatek';

  @override
  String get camera => 'Kamera';

  @override
  String flashAt(int sec, int ms) {
    return 'O $sec s ($ms ms)';
  }

  @override
  String get phases => 'Fazy';

  @override
  String get phasesFlow => 'Wartość bazowa → Błysk → Zwężenie → Powrót';

  @override
  String get expectedNormalValues => 'Oczekiwane wartości prawidłowe:';

  @override
  String get latency => 'Latencja';

  @override
  String get velocity => 'Prędkość';

  @override
  String get testFrameAnalysis => '🧪 Testowa analiza klatek';

  @override
  String get retake => 'Powtórz';

  @override
  String get done => 'Gotowe';

  @override
  String get plrVideoModeTitle => 'Tryb PLR Video';

  @override
  String get plrAssessmentTitle => 'Ocena odruchu źrenicznego na światło (PLR)';

  @override
  String get plrInstructions =>
      '1. Ustaw oko w okręgu prowadnicy\\n2. Dotknij \'Rozpocznij nagrywanie PLR\'\\n3. Trzymaj nieruchomo przez 10 sekund\\n4. Po 3 sekundach nastąpi błysk\\n5. Aplikacja rejestruje odpowiedź źrenicy';

  @override
  String get recordingPhases => 'Fazy nagrywania:';

  @override
  String get baselinePhaseDesc => 'Początkowy rozmiar źrenicy';

  @override
  String get flashPhaseDesc => 'Bodziec świetlny';

  @override
  String get constrictionPhaseDesc => 'Zwężenie źrenicy';

  @override
  String get recoveryPhaseDesc => 'Powrót źrenicy';

  @override
  String get normalPlrValues => 'Prawidłowe wartości PLR:';

  @override
  String get gotIt => 'Rozumiem';

  @override
  String get pupilAnalysis => 'Analiza źrenicy';

  @override
  String scansLeft(int count) {
    return 'Pozostało: $count';
  }

  @override
  String get validatingRightEye => 'Weryfikacja prawego oka...';

  @override
  String get validatingLeftEye => 'Weryfikacja lewego oka...';

  @override
  String get analyzingRightEye => 'Analiza prawego oka (OD)...';

  @override
  String get analyzingLeftEye => 'Analiza lewego oka (OS)...';

  @override
  String get comparingPupils => 'Porównywanie źrenic...';

  @override
  String person(String name) {
    return 'Osoba: $name';
  }

  @override
  String get invalidEyeImage => 'Nieprawidłowy obraz oka';

  @override
  String analysisFailed(String error) {
    return 'Analiza nie powiodła się: $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'WYŁĄCZNIE NARZĘDZIE BADAWCZO-DYDAKTYCZNE';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Ta aplikacja służy wyłącznie do celów badawczych i edukacyjnych. Wyniki NIE są diagnozami medycznymi i NIE zostały zwalidowane do użytku klinicznego. Powiązania wzorców pochodzą z historycznej literatury badawczej. W przypadku jakichkolwiek problemów zdrowotnych skonsultuj się z pracownikiem ochrony zdrowia.';

  @override
  String get pupilSizeDifference => 'Wykryto różnicę wielkości źrenic';

  @override
  String get significantPupilSizeDiff => 'ZNACZĄCA RÓŻNICA WIELKOŚCI ŹRENIC';

  @override
  String get diff => 'różn.';

  @override
  String get researchObservationConsult =>
      'Obserwacja badawcza – skonsultuj interpretację z pracownikiem ochrony zdrowia';

  @override
  String get ageBasedResearchBaseline => 'Wartość bazowa badań wg wieku';

  @override
  String group(String group) {
    return 'Grupa: $group';
  }

  @override
  String get researchRange => 'Zakres badawczy';

  @override
  String get measuredEst => 'Zmierzone (szac.)';

  @override
  String get pupilForm => 'Kształt źrenicy';

  @override
  String get decentrationPattern => 'Wzorzec decentracji';

  @override
  String get flattenings => 'Spłaszczenia';

  @override
  String get protrusions => 'Wypuklenia';

  @override
  String zonesCount(int count) {
    return '$count stref';
  }

  @override
  String get bilateralComparison => 'Porównanie obustronne';

  @override
  String get parameter => 'Parametr';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Stosunek P/I';

  @override
  String get ellipseness => 'Eliptyczność';

  @override
  String get circularity => 'Okrągłość';

  @override
  String get decentralization => 'Decentracja';

  @override
  String get anwRatio => 'Stosunek';

  @override
  String get normal => 'prawidłowy';

  @override
  String get elliptical => 'Eliptyczny';

  @override
  String get circular => 'Okrągły';

  @override
  String get irregular => 'Nieregularny';

  @override
  String get centered => 'Wyśrodkowany';

  @override
  String get offset => 'Przesunięty';

  @override
  String get miosis => 'Mioza';

  @override
  String get constricted => 'Zwężona';

  @override
  String get dilated => 'Rozszerzona';

  @override
  String get mydriasis => 'Mydriaza';

  @override
  String get inner => 'Wewnętrzna';

  @override
  String get outer => 'Zewnętrzna';

  @override
  String get high => 'Wysoka';

  @override
  String get moderate => 'Umiarkowana';

  @override
  String get savePdf => 'Zapisz PDF';

  @override
  String get sharePdf => 'Udostępnij PDF';

  @override
  String get retakePhotos => 'Powtórz zdjęcia';

  @override
  String scansLeftBanner(int count) {
    return 'Pozostało skanów: $count';
  }

  @override
  String get upgrade => 'Uaktualnij';

  @override
  String get unlockUnlimited => 'Odblokuj bez limitu';

  @override
  String get usedAllFreeScans => 'Wykorzystano wszystkie bezpłatne skany.';

  @override
  String get unlimitedScans => 'Nieograniczone skany';

  @override
  String get pdfReports => 'Raporty PDF';

  @override
  String get scanHistoryFeature => 'Historia skanów';

  @override
  String get bilateralAnalysis => 'Analiza obustronna';

  @override
  String get monthly => 'Miesięczny';

  @override
  String get perMonth => '/mies.';

  @override
  String get annual => 'Roczny';

  @override
  String get perYear => '/rok';

  @override
  String get tenCredits => '10 kredytów';

  @override
  String get oneTime => 'jednorazowy';

  @override
  String get best => 'NAJLEPSZY';

  @override
  String get purchaseCancelled => 'Zakup anulowany';

  @override
  String purchaseFailed(String error) {
    return 'Zakup nie powiódł się: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT zapisany: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON zapisany: $path';
  }

  @override
  String get pdfSaved => 'PDF zapisany!';

  @override
  String pdfFailed(String error) {
    return 'Błąd PDF: $error';
  }

  @override
  String get open => 'OTWÓRZ';

  @override
  String failed(String error) {
    return 'Błąd: $error';
  }

  @override
  String get staticScans => 'Statyczne';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints =>
      'Szukaj po nazwisku lub dolegliwościach...';

  @override
  String get searchPlrRecords => 'Szukaj rekordów PLR...';

  @override
  String get noScansYet => 'Brak skanów';

  @override
  String get completedScansAppearHere => 'Ukończone skany pojawią się tutaj';

  @override
  String get deleteScan => 'Usunąć skan?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Usunąć skan dla $name z $date?';
  }

  @override
  String get scanDeleted => 'Skan usunięty';

  @override
  String get originalImagesNotFound =>
      'Nie znaleziono oryginalnych obrazów oka.';

  @override
  String get viewResults => 'Wyświetl wyniki';

  @override
  String get avgPlr => 'Śr. PLR';

  @override
  String get years => 'lat';

  @override
  String get anisocoria => 'Anizokoria';

  @override
  String get none => 'Brak';

  @override
  String get mild => 'Łagodna';

  @override
  String get severe => 'Znaczna';

  @override
  String zoneLabel(String zone) {
    return 'Strefa: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Powiązana z: $organ';
  }

  @override
  String get significant => 'Znaczący';

  @override
  String get fair => 'Dostateczna';

  @override
  String get low => 'Niska';

  @override
  String get good => 'Dobra';

  @override
  String get zones => 'strefy';

  @override
  String get significanceWithinLimits => 'w dopuszczalnych granicach';

  @override
  String get significanceMild => 'łagodny';

  @override
  String get significanceModerate => 'umiarkowany';

  @override
  String get significanceSignificant => 'znaczący';

  @override
  String get formTypeCircle => 'Okrąg (prawidłowy)';

  @override
  String get formTypeOval => 'Owal';

  @override
  String get formTypeOvalVertical => 'Owal pionowy';

  @override
  String get formTypeOvalHorizontal => 'Owal poziomy';

  @override
  String get formTypeOvalDiagonal => 'Owal ukośny';

  @override
  String get formTypeLeftObliqueEllipse => 'Elipsa lewoukośna';

  @override
  String get formTypeUnilateralEllipse => 'Elipsa jednostronna';

  @override
  String get formTypeVentralDivergingEllipse => 'Elipsa brzuszna rozbieżna';

  @override
  String get formTypeFrontalDivergingEllipse => 'Elipsa czołowa rozbieżna';

  @override
  String get formTypeEllipse => 'Elipsa';

  @override
  String get formTypeChord => 'Cięciwa';

  @override
  String get formTypeIrregular => 'Nieregularny';

  @override
  String get pupilFormCircleDesc =>
      'Prawidłowy okrągły kształt źrenicy. Nie wykryto odchyleń wzorca.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Wzorzec owalu poziomego. Historyczne badania wiązały go z wzorcami autonomicznego układu nerwowego wpływającymi na strefy oddechowe i gruczołowe.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Wzorzec owalu pionowego. Historyczne badania wiązały ten wzorzec ze strefami krążenia mózgowego w badaniach odruchów autonomicznych.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Wzorzec owalu ukośnego. Literatura badawcza wiązała go z odruchami strefy urogenitalnej w badaniach autonomicznych.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Wzorzec elipsy lewoukośnej. Historyczne obserwacje wiązały go ze strefami autonomicznymi urogenitalnymi i kończyn dolnych.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Wzorzec elipsy jednostronnej. Badania wskazywały na powiązania ze strefami autonomicznymi oddechowymi i oskrzelowymi.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Elipsa brzuszna rozbieżna. Historyczne badania wiązały ją ze strefami autonomicznymi dolnej części ciała i wzorcami funkcji ruchowych.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Elipsa czołowa rozbieżna. Literatura badawcza wiązała ten wzorzec ze strefami mózgowymi i górnych układów autonomicznych.';

  @override
  String get pupilFormOvalDesc =>
      'Łagodny wzorzec deformacji owalnej. Monitoruj postęp w obserwacjach badawczych.';

  @override
  String get pupilFormEllipseDesc =>
      'Wzorzec eliptycznej źrenicy wskazujący na warianty układu autonomicznego w badaniach historycznych.';

  @override
  String get pupilFormChordDesc =>
      'Wzorzec deformacji cięciwowej wskazujący na zlokalizowane wpływy autonomiczne w literaturze badawczej.';

  @override
  String get pupilFormIrregularDesc =>
      'Forma nieregularna sugerująca wpływy wielu wzorców autonomicznych na podstawie historycznych obserwacji.';

  @override
  String get patternCentered => 'Wyśrodkowana (prawidłowa)';

  @override
  String get patternFrontal => 'Decentracja czołowa';

  @override
  String get patternBasal => 'Decentracja podstawna';

  @override
  String get patternNasal => 'Decentracja nosowa';

  @override
  String get patternTemporal => 'Decentracja skroniowa';

  @override
  String get patternMiddleNasal => 'Decentracja środkowo-nosowa';

  @override
  String get patternMiddleTemporal => 'Decentracja środkowo-skroniowa';

  @override
  String get patternUpperNasal => 'Decentracja górno-nosowa';

  @override
  String get patternUpperTemporal => 'Decentracja górno-skroniowa';

  @override
  String get patternLowerNasal => 'Decentracja dolno-nosowa';

  @override
  String get patternLowerTemporal => 'Decentracja dolno-skroniowa';

  @override
  String get patternUpwards => 'Decentracja – w górę';

  @override
  String get patternDownwards => 'Decentracja – w dół';

  @override
  String get patternUpwardsInwards => 'Decentracja – w górę i do środka';

  @override
  String get patternUpwardsOutwards => 'Decentracja – w górę i na zewnątrz';

  @override
  String get decentrationCenteredDesc =>
      'Prawidłowe położenie źrenicy w granicach fizjologicznych.';

  @override
  String get decentrationNasalRightDesc =>
      'Wzorzec nosowy (prawy). Historyczne badania wiązały tę strefę z odruchami autonomicznymi płucnymi.';

  @override
  String get decentrationNasalLeftDesc =>
      'Wzorzec nosowy (lewy). Literatura badawcza wiązała tę strefę z wzorcami autonomicznymi funkcji serca.';

  @override
  String get decentrationTemporalDesc =>
      'Wzorzec skroniowy. Historyczne obserwacje wiązały tę strefę z odruchami autonomicznymi nerkowymi i reprodukcyjnymi.';

  @override
  String get decentrationFrontalRightDesc =>
      'Wzorzec czołowy (prawy). Badania wiązały tę strefę z wzorcami funkcji poznawczych i mózgowych.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Wzorzec czołowy (lewy). Historyczne badania wiązały tę strefę z wzorcami autonomicznymi mózgowymi.';

  @override
  String get decentrationBasalRightDesc =>
      'Wzorzec podstawny (prawy). Badania wskazywały na powiązania z odruchami ciśnienia śródczaszkowego.';

  @override
  String get decentrationBasalLeftDesc =>
      'Wzorzec podstawny (lewy). Historyczne obserwacje wiązały go ze wzorcami stref zapalnych mózgowych.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Wzorzec górno-nosowy (prawy). Badania wiązały tę strefę z odruchami autonomicznymi wątrobowo-żółciowymi.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Wzorzec górno-nosowy (lewy). Historyczne badania wiązały go ze strefami śledzionowymi i przeponowymi.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Wzorzec górno-skroniowy. Badania wskazywały na powiązania ze strefami autonomicznymi nerkowymi i reprodukcyjnymi.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Wzorzec środkowo-nosowy (prawy). Historyczne obserwacje wiązały go z wykorzystaniem tlenu i strefami sercowymi.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Wzorzec środkowo-nosowy (lewy). Badania wiązały go z neurologicznymi i sercowymi wzorcami autonomicznymi.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Wzorzec środkowo-skroniowy (prawy). Badania wiązały go ze strefami regulacji autonomicznej serca.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Wzorzec środkowo-skroniowy (lewy). Historyczne badania wiązały go ze strefami płucnymi i sercowymi.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Wzorzec górno-nosowy (prawy). Badania wskazywały na powiązania ze strefami poznawczymi i odruchami kręgosłupa szyjnego.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Wzorzec górno-nosowy (lewy). Historyczne obserwacje wiązały go z wzorcami poznawczymi i strefami szyjnymi.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Wzorzec górno-skroniowy (prawy). Badania wiązały tę strefę z odruchami nerwów czaszkowych i słuchowych.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Wzorzec górno-skroniowy (lewy). Historyczne badania wiązały go ze strefami neurovegetatywnymi i mowy.';

  @override
  String get decentrationLowerNasalDesc =>
      'Wzorzec dolno-nosowy. Badania wskazywały na powiązania ze strefami autonomicznymi urogenitalnymi i lędźwiowo-krzyżowymi.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Wzorzec dolno-skroniowy (prawy). Historyczne obserwacje wiązały go ze strefami metabolicznymi i wątrobowymi.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Wzorzec dolno-skroniowy (lewy). Badania wiązały go z wzorcami autonomicznymi sercowymi i śledzionowymi.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Wzorzec powiązany ze strefą górno-centralną. Historyczne badania wiązały go z odruchami autonomicznymi regulacji nastroju i energii.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Wzorzec powiązany ze strefą górno-skroniową. Badania wskazywały na powiązania z autonomicznymi odruchami nerwów czaszkowych i słuchowych.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Wzorzec powiązany ze strefą środkowo-skroniową. Historyczne obserwacje wiązały go z wzorcami autonomicznymi oddechowymi i sercowymi.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Wzorzec powiązany ze strefą dolno-skroniową. Literatura badawcza wiązała go z autonomicznymi strefami wątrobowymi i metabolicznymi.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Wzorzec powiązany ze strefą dolno-podstawną. Historyczne badania wiązały go z autonomicznymi odruchami nerkowymi i kończyn dolnych.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Wzorzec powiązany ze strefą dolno-nosową. Badania wskazywały na powiązania z autonomicznymi strefami urogenitalnymi i miednicznymi.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Wzorzec powiązany ze strefą środkowo-nosową. Historyczne obserwacje wiązały go z wzorcami autonomicznymi wykorzystania tlenu i oddechowymi.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Wzorzec powiązany ze strefą górno-nosową. Literatura badawcza wiązała go z poznawczymi i szyjnymi odruchami autonomicznymi.';

  @override
  String get flatteningDefaultRightDesc =>
      'Wykryto wariant wzorca autonomicznego układu nerwowego w tej strefie na podstawie historycznych badań.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Wzorzec powiązany ze strefą górno-centralną. Historyczne badania wiązały go z wzorcami autonomicznymi regulacji nastroju i neurologicznymi.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Wzorzec powiązany ze strefą górno-skroniową. Badania wskazywały na powiązania z neurovegetatywnymi i mowy strefami autonomicznymi.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Wzorzec powiązany ze strefą środkowo-skroniową. Historyczne obserwacje wiązały go z autonomicznymi odruchami płucnymi i sercowymi.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Wzorzec powiązany ze strefą dolno-skroniową. Literatura badawcza wiązała go z wzorcami autonomicznymi sercowymi i śledzionowymi.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Wzorzec powiązany ze strefą dolno-podstawną. Historyczne badania wiązały go z autonomicznymi strefami nerkowymi i wydalniczymi.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Wzorzec powiązany ze strefą dolno-nosową. Badania wskazywały na powiązania z autonomicznymi odruchami urogenitalnymi i lędźwiowo-krzyżowymi.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Wzorzec powiązany ze strefą środkowo-nosową. Historyczne obserwacje wiązały go z wzorcami autonomicznymi sercowymi i oddechowymi.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Wzorzec powiązany ze strefą górno-nosową. Literatura badawcza wiązała go z poznawczymi i szyjnymi strefami autonomicznymi.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Wykryto wariant wzorca autonomicznego układu nerwowego w tej strefie na podstawie historycznych badań.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Wzorzec wypuklenia w strefie górno-centralnej. Badania wiązały go z wzorcami nadmiernej aktywacji współczulnej wpływającymi na strefy mózgowe.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Wzorzec wypuklenia w strefie górno-skroniowej. Historyczne obserwacje wiązały go z wzorcami nadaktywności nerwów czaszkowych i układu słuchowego.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Wzorzec wypuklenia w strefie środkowo-skroniowej. Badania wskazywały na powiązania ze współczulnymi wzorcami sercowymi i oddechowymi.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Wzorzec wypuklenia w strefie dolno-skroniowej. Historyczne badania wiązały go z współczulnymi strefami wątrobowo-żółciowymi i metabolicznymi.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Wzorzec wypuklenia w strefie dolno-podstawnej. Badania wiązały go z wzorcami nadaktywności współczulnej nerkowej i miednicznej.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Wzorzec wypuklenia w strefie dolno-nosowej. Historyczne obserwacje wiązały go ze współczulnymi strefami aktywacji urogenitalnej.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Wzorzec wypuklenia w strefie środkowo-nosowej. Badania wskazywały na powiązania z współczulnymi wzorcami żołądkowymi i trzustkowymi.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Wzorzec wypuklenia w strefie górno-nosowej. Historyczne badania wiązały go ze współczulnymi strefami nadmiernej aktywacji poznawczej i wzrokowej.';

  @override
  String get protrusionDefaultRightDesc =>
      'Wykryto wzorzec nadaktywności współczulnego układu nerwowego w tej strefie na podstawie obserwacji badawczych.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Wzorzec wypuklenia w strefie górno-centralnej. Badania wiązały go z psychomotorycznymi i mózgowymi wzorcami współczulnymi.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Wzorzec wypuklenia w strefie górno-skroniowej. Historyczne obserwacje wiązały go z neurovegetatywnymi strefami nadaktywności współczulnej.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Wzorzec wypuklenia w strefie środkowo-skroniowej. Badania wskazywały na powiązania z płucnymi i sercowymi wzorcami współczulnymi.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Wzorzec wypuklenia w strefie dolno-skroniowej. Historyczne badania wiązały go ze śledzionowymi i sercowymi strefami aktywacji współczulnej.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Wzorzec wypuklenia w strefie dolno-podstawnej. Badania wiązały go z wzorcami nadaktywności współczulnej miednicznej i nerkowej.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Wzorzec wypuklenia w strefie dolno-nosowej. Historyczne obserwacje wiązały go ze strefami aktywacji współczulnej lędźwiowo-krzyżowej.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Wzorzec wypuklenia w strefie środkowo-nosowej. Badania wskazywały na powiązania z wzorcami współczulnymi lękowo-sercowymi.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Wzorzec wypuklenia w strefie górno-nosowej. Historyczne badania wiązały go ze współczulnymi strefami nadmiernej aktywacji poznawczej i wzrokowej.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Wykryto wzorzec nadaktywności współczulnego układu nerwowego w tej strefie na podstawie obserwacji badawczych.';

  @override
  String get anisocoriaNone =>
      'Rozmiary źrenic w normie. Nie wykryto istotnej anizokorii.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Wykryto anizokorię: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'W granicach normy.';

  @override
  String get anisocoriaSeverityMild =>
      'Łagodna różnica. Może być fizjologiczna.';

  @override
  String get anisocoriaSeverityModerate =>
      'Umiarkowana asymetria. Odnotowano obserwację badawczą.';

  @override
  String get anisocoriaSeveritySevere =>
      'Znacząca asymetria. Zaznaczono obserwację badawczą.';

  @override
  String get largerPupilEqual => 'równe';

  @override
  String get largerPupilOS => 'OS (lewe)';

  @override
  String get largerPupilOD => 'OD (prawe)';

  @override
  String get decentrationWithinLimits => 'W granicach normy.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Przesunięcie: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Górno-centralna';

  @override
  String get zoneUpperNasal => 'Górno-nosowa';

  @override
  String get zoneMiddleNasal => 'Środkowo-nosowa';

  @override
  String get zoneLowerNasal => 'Dolno-nosowa';

  @override
  String get zoneLowerBasal => 'Dolno-podstawna';

  @override
  String get zoneLowerTemporal => 'Dolno-skroniowa';

  @override
  String get zoneMiddleTemporal => 'Środkowo-skroniowa';

  @override
  String get zoneUpperTemporal => 'Górno-skroniowa';

  @override
  String get zoneFrontal => 'Czołowa';

  @override
  String get zoneBasal => 'Podstawna';

  @override
  String get zoneUnknown => 'Nieznana';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Spłaszczenie $zone ($clockRange) – $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Wypuklenie $zone ($clockRange) – $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Tryb iryskopu USB';

  @override
  String get iriscopeExternal => 'Iryskop / zewnętrzny';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'Użyj podłączonej kamery USB lub iryskopu';

  @override
  String get detectedCameras => 'Wykryte kamery';

  @override
  String get externalCamera => 'Kamera zewnętrzna';

  @override
  String cameraIndex(int index) {
    return 'Kamera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Nie wykryto zewnętrznej kamery.\\nPodłącz iryskop USB, aby włączyć.';

  @override
  String get refresh => 'Odśwież';

  @override
  String get selectCameraSource => 'Wybierz źródło kamery';

  @override
  String camerasDetected(int count) {
    return 'Wykryto kamer: $count';
  }

  @override
  String camerasAvailable(int count) {
    return 'Dostępnych kamer: $count';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Kamera zewnętrzna $index';
  }

  @override
  String get qualityGatedRear =>
      'Auto-przechwytywanie z kontrolą jakości (tylna kamera)';

  @override
  String get qualityGatedFront =>
      'Auto-przechwytywanie z kontrolą jakości (przednia kamera)';

  @override
  String get usbCameraInfo => 'Informacje o kamerze USB';

  @override
  String get connected => 'Podłączona';

  @override
  String get waiting => 'Oczekiwanie...';

  @override
  String get disconnected => 'Odłączona';

  @override
  String get waitingForUsbCamera => 'Oczekiwanie na kamerę USB';

  @override
  String get connectIriscopePrompt =>
      'Podłącz iryskop przez adapter USB OTG.\\nUdziel uprawnień po wyświetleniu monitu.';

  @override
  String get usbCameraIssue => 'Problem z kamerą USB';

  @override
  String get pleaseConnectIriscope =>
      'Proszę podłączyć iryskop lub kamerę USB.';

  @override
  String get retryConnection => 'Ponów połączenie';

  @override
  String get troubleshootingTips =>
      'Wskazówki dotyczące rozwiązywania problemów';

  @override
  String get tipUsbOtgAdapter =>
      'Upewnij się, że adapter USB OTG jest prawidłowo podłączony';

  @override
  String get tipUsbHostMode =>
      'Sprawdź, czy urządzenie obsługuje tryb USB Host';

  @override
  String get tipReconnectCamera =>
      'Spróbuj odłączyć i ponownie podłączyć kamerę';

  @override
  String get tipGrantPermissions =>
      'Udziel uprawnień USB po wyświetleniu monitu';

  @override
  String get tipUnlockDevice => 'Niektóre urządzenia mogą wymagać odblokowania';

  @override
  String get back => 'Wstecz';

  @override
  String get switchEye => 'Przełącz oko';

  @override
  String get state => 'Stan';

  @override
  String get status => 'Status';

  @override
  String get usingFlutterUvcPlugin =>
      'Używa wtyczki flutter_uvc_camera\\nWtyczka do obsługi urządzeń USB Video Class.';

  @override
  String get initialized => 'Zainicjalizowany';

  @override
  String get notReady => 'Niegotowy';

  @override
  String get captureDistanceMatch => 'Dopasowanie odległości przechwytywania';

  @override
  String get irisSize => 'Rozmiar tęczówki';

  @override
  String get distanceMatched => 'Odległość dopasowana';

  @override
  String get distanceMismatch => 'Niezgodność odległości';

  @override
  String get excellentMatch => 'Doskonałe dopasowanie';

  @override
  String get goodMatch => 'Dobre dopasowanie';

  @override
  String get acceptableMatch => 'Dopuszczalne dopasowanie';

  @override
  String get considerRetaking => 'Niezgodność odległości – rozważ powtórzenie';

  @override
  String get qualityReady => 'Gotowy! Trzymaj nieruchomo...';

  @override
  String get qualityTooBlurry => 'Trzymaj kamerę nieruchomo';

  @override
  String get qualityTooDark => 'Potrzeba więcej światła';

  @override
  String get qualityTooBright => 'Za jasno – zmniejsz oświetlenie';

  @override
  String get qualityNoContrast => 'Zmień kąt oświetlenia';

  @override
  String get qualityNoPupil => 'Wyśrodkuj źrenicę w kadrze';

  @override
  String get qualityNotCentered => 'Przesuń oko na środek';

  @override
  String get qualityNotAnEye => 'Nie wykryto oka';

  @override
  String get qualityProcessing => 'Przetwarzanie...';

  @override
  String get distanceMatchedCheck => '✓ Odległość dopasowana';

  @override
  String get distanceGoodMatchCheck => '✓ Dobre dopasowanie';

  @override
  String get distanceSlightlyBack => 'Nieco dalej ↔';

  @override
  String get distanceSlightlyCloser => 'Nieco bliżej ↔';

  @override
  String get distanceAlmostThere => 'Prawie...';

  @override
  String get distanceMoveBack => 'Cofnij się ←←';

  @override
  String get distanceMoveCloser => 'Przybliż się →→';

  @override
  String get distanceTooClose => 'Za blisko! Cofnij się';

  @override
  String get distanceTooFar => 'Za daleko! Przybliż się';

  @override
  String get distanceStabilizing => 'Stabilizacja...';

  @override
  String distanceLabel(int percent) {
    return 'Odległość: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Przednia kamera';

  @override
  String get rearCameraLabel => 'Tylna kamera';

  @override
  String get startingCamera => 'Uruchamianie kamery...';

  @override
  String get eyeNotDetected => 'Nie wykryto oka';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get indicatorEye => 'Oko';

  @override
  String get indicatorSharp => 'Ostrość';

  @override
  String get indicatorLight => 'Światło';

  @override
  String get indicatorFocus => 'Fokus';

  @override
  String get indicatorPupil => 'Źrenica';

  @override
  String get indicatorIris => 'Tęczówka';

  @override
  String get indicatorMatch => 'Dopasowanie';

  @override
  String get checkImageShape => 'Kształt obrazu';

  @override
  String get checkCircularIris => 'Okrągła tęczówka';

  @override
  String get checkDarkPupil => 'Ciemna źrenica';

  @override
  String get checkIrisTexture => 'Tekstura tęczówki';

  @override
  String get checkPupilIrisStructure => 'Struktura źrenica-tęczówka';

  @override
  String get checkNaturalColors => 'Naturalne kolory';

  @override
  String get checkEdgePattern => 'Wzorzec krawędzi';

  @override
  String get errorImageShapeIncorrect =>
      'Nieprawidłowy kształt obrazu – upewnij się, że oko wypełnia kadr';

  @override
  String get errorNoEyeDetected =>
      'Nie wykryto oka – wyśrodkuj tęczówkę w kadrze';

  @override
  String get errorNoPupilDetected =>
      'Nie wykryto źrenicy – zapewnij odpowiednie oświetlenie';

  @override
  String get errorNoIrisTexture =>
      'Brak tekstury tęczówki – przybliż kamerę do oka';

  @override
  String get errorUnusualColors =>
      'Wykryto nietypowe kolory – unikaj ekranów i refleksów';

  @override
  String get errorTooManyEdges =>
      'Zbyt wiele prostych krawędzi – to może nie być oko';

  @override
  String get errorNotValidEye => 'Nieprawidłowy obraz oka – spróbuj ponownie';

  @override
  String get holdStillCapturing => 'Trzymaj nieruchomo – przechwytywanie...';

  @override
  String get adjustDistanceFirst => 'Najpierw ustaw odległość';

  @override
  String get stabilizingReading => 'Stabilizacja...';

  @override
  String get autoCaptureWhenReady => 'Auto-przechwytywanie, gdy gotowy';

  @override
  String get tapOrWaitAutoCapture =>
      'Dotknij lub czekaj na auto-przechwytywanie';

  @override
  String get validatingImage => 'Weryfikacja...';

  @override
  String get capturingStatus => 'Przechwytywanie...';

  @override
  String get adjustPositionStatus => 'Dostosuj pozycję';

  @override
  String get validationTip =>
      'Wskazówka: Zapewnij dobre oświetlenie, trzymaj kamerę 10–15 cm od oka, unikaj refleksów';

  @override
  String get validationChecksTitle => 'Kontrole walidacji:';

  @override
  String confidenceLabel(int percent) {
    return 'Pewność: $percent%';
  }

  @override
  String get incompleteData => 'Niekompletne dane';

  @override
  String get irisDiameterLabel => 'tęcz. ø';

  @override
  String get plrResponseCurve => 'Krzywa odpowiedzi PLR';

  @override
  String get plrLatency => 'Latencja';

  @override
  String get plrVelocity => 'Prędkość';

  @override
  String get plrRecoveryTime => 'Czas powrotu';

  @override
  String get plrRecoveryRatio => 'Powrót %';

  @override
  String get plrEnhancedMetrics => 'Rozszerzone metryki PLR';

  @override
  String get plrNormalLatency => 'Norma: 200–500 ms';

  @override
  String get plrNormalConstriction => 'Norma: 10–30%';

  @override
  String get plrNormalVelocity => 'Norma: 1,5–4,0%/s';

  @override
  String get plrReferenceValues => 'Referencyjne wartości PLR';

  @override
  String get plrSubjectInfo => 'Dane osoby badanej';

  @override
  String get plrTestType => 'Odruch źreniczny na światło';

  @override
  String get plrAnalysisSummary => 'Podsumowanie analizy';

  @override
  String get plrTotalFrames => 'Łączna liczba przeanalizowanych klatek';

  @override
  String get plrSuccessRate => 'Wskaźnik sukcesu';

  @override
  String get plrMaxConstriction => 'Maks. zwężenie';

  @override
  String get plrResponseCurveLabels => 'Krzywa odpowiedzi PLR';

  @override
  String get anwTitle => 'Kryza autonomiczna (ANW)';

  @override
  String get anwAbnormal => 'Nieprawidłowy';

  @override
  String get anwDiameter => 'Średnica';

  @override
  String get anwPerimeter => 'Obwód';

  @override
  String get anwAsymmetry => 'Asymetria';

  @override
  String get anwElevated => 'Podwyższony';

  @override
  String get anwFormType => 'Typ formy';

  @override
  String get anwRegular => 'Regularny';

  @override
  String get anwDrawnIn => 'Wciągnięty';

  @override
  String get anwIndented => 'Wcięty';

  @override
  String get anwLacerated => 'Postrzępiony';

  @override
  String get anwSpastic => 'Spastyczny';

  @override
  String get anwAtonic => 'Atoniczny';

  @override
  String get anwTonicState => 'Historyczny wzorzec napięcia';

  @override
  String get anwParasympathotonic => 'Wzorzec parasympatykotoniczny';

  @override
  String get anwSympathotonicState => 'Wzorzec sympatykotoniczny';

  @override
  String get anwShiftDetected => 'Historyczny wzorzec przesunięcia';

  @override
  String get anwConstrictionDetected => 'Wykryto zwężenie';

  @override
  String get anwFindings => 'Wyniki';

  @override
  String get anwRatioComparison => 'Stosunek ANW';

  @override
  String get bilateralANWComparison => 'Obustronne porównanie ANW';

  @override
  String get anwSymmetryNormal => 'Symetria ANW w granicach normy.';

  @override
  String get anwAsymmetryDetected => 'Wykryto asymetrię ANW między oczami.';

  @override
  String get functionalFrustration =>
      'Zaburzenie funkcjonalne w korelacji między współczulnym a przywspółczulnym układem nerwowym.';

  @override
  String get anwParasympathotonicDesc =>
      'Historyczne obserwacje wiązały to ze zwiększoną wrażliwością liminalną. Aktywność odruchowa przyspieszona. Funkcje wydzielnicze i ewakuacyjne przewodu pokarmowego nasilone.';

  @override
  String get anwSympathotonicDesc =>
      'Historyczne obserwacje wiązały to ze zmniejszoną wrażliwością liminalną. Aktywność odruchowa spowolniona. Funkcje wydzielnicze i ewakuacyjne przewodu pokarmowego obniżone.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Historyczne badania według Velchowera wiązały to z wzorcami przeciążenia lewej komory i stresem sercowym.';

  @override
  String get anwFrontalConstricted =>
      'Czołowa strefa kryzy źrenicznej jest zwężona.';

  @override
  String get anwBasalConstricted =>
      'Podstawna strefa kryzy źrenicznej jest zwężona.';

  @override
  String get anwFrontalBasalConstricted =>
      'Czołowa i podstawna strefa kryzy źrenicznej są zwężone.';

  @override
  String get helpTitle => 'Pomoc i podręcznik użytkownika';

  @override
  String get helpTabQuickStart => 'Szybki start';

  @override
  String get helpTabCnriAnalysis => 'Analiza CNRI';

  @override
  String get helpTabShortcuts => 'Skróty';

  @override
  String get helpTabTroubleshooting => 'Rozwiązywanie problemów';

  @override
  String get helpOnlineDocs => 'Dokumentacja online';

  @override
  String get helpContactSupport => 'Kontakt z pomocą techniczną';

  @override
  String get helpGettingStarted => 'Pierwsze kroki';

  @override
  String get helpStep1Title => 'Podłącz iryskop';

  @override
  String get helpStep1Desc =>
      'Podłącz iryskop Dino-Lite lub kompatybilny iryskop USB.';

  @override
  String get helpStep2Title => 'Wprowadź dane pacjenta';

  @override
  String get helpStep2Desc =>
      'Uzupełnij nazwisko, wiek, płeć i główne dolegliwości pacjenta.';

  @override
  String get helpStep3Title => 'Przechwytywanie prawego oka (OD)';

  @override
  String get helpStep3Desc => 'Ustaw iryskop i przechwytuj obraz prawego oka.';

  @override
  String get helpStep4Title => 'Przechwytywanie lewego oka (OS)';

  @override
  String get helpStep4Desc =>
      'Powtórz dla lewego oka przy równomiernym oświetleniu.';

  @override
  String get helpStep5Title => 'Przejrzyj analizę';

  @override
  String get helpStep5Desc =>
      'Aplikacja analizuje stosunek P/I, kształt źrenicy i charakterystykę ANW.';

  @override
  String get helpStep6Title => 'Eksportuj raport';

  @override
  String get helpStep6Desc => 'Zapisz w formacie PDF, TXT lub JSON.';

  @override
  String get helpTipBestResults =>
      'Dla najlepszych wyników: używaj równomiernego oświetlenia i zachowaj odległość iryskopu 2–3 cm.';

  @override
  String get helpCnriProtocolFeatures => 'Funkcje protokołu CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Stosunek źrenica/tęczówka (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Norma: 20–30%. Wartości poza normą mogą wskazywać na zaburzenia autonomiczne.';

  @override
  String get helpFeaturePupilFormTitle => 'Analiza kształtu źrenicy';

  @override
  String get helpFeaturePupilFormDesc =>
      'Wykrywa wzorce owalne, kierunek decentracji i ekscentryczność.';

  @override
  String get helpFeatureAnwTitle => 'Ocena ANW (kryzy)';

  @override
  String get helpFeatureAnwDesc =>
      'Analizuje stosunek, regularność formy, przesunięcia sektorowe i stan napięcia.';

  @override
  String get helpFeatureZoneTitle => 'Analiza stref';

  @override
  String get helpFeatureZoneDesc =>
      'Mapuje spłaszczenia/wypuklenia na strefy narządów CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Porównanie obustronne';

  @override
  String get helpFeatureBilateralDesc =>
      'Porównuje OD z OS w celu wykrycia asymetrii.';

  @override
  String get helpFeatureMlTitle => 'Porównanie ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'Model ONNX CNN dostarcza dodatkowych pomiarów do porównania.';

  @override
  String get helpKeyboardShortcuts => 'Skróty klawiszowe';

  @override
  String get helpCameraControls => 'Sterowanie kamerą';

  @override
  String get helpShortcutSpace => 'Przechwytuj obraz';

  @override
  String get helpShortcutCtrlS => 'Zapisz raport PDF';

  @override
  String get helpShortcutCtrlO => 'Otwórz obraz z galerii';

  @override
  String get helpShortcutCtrlH => 'Wyświetl historię skanów';

  @override
  String get helpShortcutF11 => 'Przełącz pełny ekran';

  @override
  String get helpShortcutEsc => 'Wstecz / Anuluj';

  @override
  String get helpShortcutScroll => 'Powiększ/zmniejsz';

  @override
  String get helpShortcutDoubleClick => 'Resetuj powiększenie';

  @override
  String get helpCommonIssues => 'Częste problemy';

  @override
  String get helpIssueCameraNotDetected => 'Kamera nie wykryta';

  @override
  String get helpIssueCameraSolution1 => 'Sprawdź połączenie USB';

  @override
  String get helpIssueCameraSolution2 => 'Wypróbuj inny port USB';

  @override
  String get helpIssueCameraSolution3 => 'Zainstaluj sterowniki Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Uruchom ponownie aplikację';

  @override
  String get helpIssuePupilDetectionFails => 'Detekcja źrenicy nie działa';

  @override
  String get helpIssuePupilSolution1 => 'Zapewnij odpowiednie oświetlenie';

  @override
  String get helpIssuePupilSolution2 => 'Wyśrodkuj źrenicę w kadrze';

  @override
  String get helpIssuePupilSolution3 => 'Wyczyść soczewkę iryskopu';

  @override
  String get helpIssuePupilSolution4 => 'Ustaw ostrość ręcznie';

  @override
  String get helpIssuePdfExportFails => 'Eksport PDF nie działa';

  @override
  String get helpIssuePdfSolution1 => 'Sprawdź uprawnienia do folderu';

  @override
  String get helpIssuePdfSolution2 =>
      'Upewnij się, że jest dostępne miejsce na dysku';

  @override
  String get helpIssuePdfSolution3 => 'Zamknij otwarte pliki PDF';

  @override
  String get helpIssuePdfSolution4 => 'Najpierw spróbuj eksportu TXT';

  @override
  String get helpCaptureChecklistTitle => 'Lista kontrolna przechwytywania';

  @override
  String get helpCaptureChecklist1 =>
      'Utrzymuj źrenicę wyśrodkowaną i w pełni widoczną w kadrze.';

  @override
  String get helpCaptureChecklist2 =>
      'Używaj równomiernego oświetlenia i zmniejszaj odblaski na rogówce.';

  @override
  String get helpCaptureChecklist3 =>
      'Zachowaj podobną odległość iryskopu dla prawego i lewego oka.';

  @override
  String get helpCaptureChecklist4 =>
      'Przeogniskuj lub powtórz zdjęcie, jeśli krawędź źrenicy wygląda miękko lub niewyraźnie.';

  @override
  String get helpExportSettingsTitle => 'Ustawienia eksportu';

  @override
  String get helpExportSettingsDesc =>
      'Opcja Auto-zapis PDF automatycznie zapisuje raport po analizie, Dołącz obrazy kontroluje, czy zdjęcia oka pojawiają się w PDF, a Pokaż porównanie ML dodaje wartości porównania ONNX CNN do raportów.';

  @override
  String get helpHybridScoreTitle => 'Hybrydowa pewność i ocena';

  @override
  String get helpHybridScoreDesc =>
      'Wyświetlana pewność i ocena łączą jakość geometrii klasycznej z zgodnością ML, więc odzwierciedlają wiarygodność pomiaru, a nie diagnozę.';

  @override
  String get helpAnomalyGuideTitle => 'Odczytywanie spłaszczeń i wypuklenia';

  @override
  String get helpAnomalyGuideDesc =>
      'Spłaszczenia wskazują względne wciągnięcie do środka, a wypuklenia – wybrzuszenie na zewnątrz wzdłuż granicy źrenicy; każda karta podaje strefę, wielkość i powiązane skojarzenie.';

  @override
  String get helpZoneOverlayGuideTitle => 'Nakładka strefowa';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Używaj nakładki strefowej do wizualnej kontroli pozycji sektorów i sprawdzania, gdzie wykryte anomalie rozkładają się wokół źrenicy i tęczówki.';

  @override
  String get helpContactSupportTip =>
      'Skontaktuj się z helpdesk@cnri.edu w celu uzyskania pomocy.';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get settingsCameraIriscope => 'KAMERA / IRYSKOP';

  @override
  String get settingsPreferredCamera => 'Preferowana kamera:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'Kamera USB';

  @override
  String get settingsCameraAutoDetect => 'Automatyczne wykrywanie';

  @override
  String get settingsDefaultZoom => 'Domyślne powiększenie:';

  @override
  String get settingsAnalysis => 'ANALIZA';

  @override
  String get settingsShowMlComparison => 'Pokaż porównanie ML';

  @override
  String get settingsShowZoneOverlay => 'Pokaż nakładkę strefową';

  @override
  String get settingsExportReports => 'EKSPORT I RAPORTY';

  @override
  String get settingsAutoSavePdf => 'Auto-zapis PDF';

  @override
  String get settingsIncludeImages => 'Dołącz obrazy';

  @override
  String get settingsSaved => 'Ustawienia zapisane';

  @override
  String get aboutResearchEdition => 'Wydanie badawcze';

  @override
  String aboutVersion(String version) {
    return 'Wersja $version';
  }

  @override
  String get aboutLicense => 'Licencja';

  @override
  String get aboutLicensedTo => 'Licencjobiorca:';

  @override
  String get aboutExpires => 'Wygasa:';

  @override
  String get aboutManageLicense => 'Zarządzaj licencją';

  @override
  String get aboutBasedOnCnri => 'Oparty na protokole CNRI';

  @override
  String get aboutCopyright => '© 2024–2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Strona internetowa';

  @override
  String get aboutPrivacy => 'Prywatność';

  @override
  String get languageSelectTitle => 'Wybierz język';

  @override
  String get selectLanguage => 'Wybierz język';

  @override
  String get languageChanged => 'Zmieniono język';

  @override
  String languageChangedMessage(String language) {
    return 'Język aplikacji ustawiony na $language';
  }

  @override
  String get languageSystemNotAvailable => 'System języka niedostępny';

  @override
  String get licenseLoading => 'Ładowanie...';

  @override
  String get licenseWelcome => 'Witamy w PupilMetrics!';

  @override
  String get licenseTrialFeatures =>
      '14-dniowy bezpłatny okres próbny • Pełne funkcje';

  @override
  String get licenseStartTrial => 'Rozpocznij bezpłatny okres próbny';

  @override
  String get licenseEnterKey => 'Wprowadź licencję';

  @override
  String get licenseFreeTrial => 'Bezpłatny okres próbny';

  @override
  String licenseDaysRemaining(int count) {
    return 'Pozostało dni: $count';
  }

  @override
  String get licenseTrialEnded => 'Okres próbny zakończony';

  @override
  String get licenseEnterToContinue => 'Wprowadź licencję, aby kontynuować';

  @override
  String get licenseStandard => 'Licencja standardowa';

  @override
  String get licenseProfessional => 'Licencja profesjonalna';

  @override
  String get licenseEnterprise => 'Licencja korporacyjna';

  @override
  String get licenseLicensed => 'Licencjonowany';

  @override
  String get licenseActive => 'Aktywna';

  @override
  String get licenseTrialUser => 'Użytkownik próbny';

  @override
  String get licenseLifetime => 'Dożywotnia';

  @override
  String get licenseNotSetUp => 'Nieskonfigurowana';

  @override
  String get trialExpiredTitle => 'Okres próbny zakończony';

  @override
  String get trialExpiredMessage =>
      'Twój 14-dniowy okres próbny dobiegł końca. Aby kontynuować analizę obrazów tęczówki, prosimy o zakup licencji.';

  @override
  String get trialExpiredCanStill => 'Nadal możesz:';

  @override
  String get trialExpiredViewAnalyses => 'Przeglądać poprzednie analizy';

  @override
  String get trialExpiredExportReports => 'Eksportować istniejące raporty';

  @override
  String get trialExpiredAccessHistory => 'Przeglądać historię skanów';

  @override
  String get trialExpiredMaybeLater => 'Może później';

  @override
  String get licenseRegistration => 'Rejestracja licencji';

  @override
  String get licenseStatusValid => 'Licencjonowany';

  @override
  String get licenseStatusTrialActive => 'Bezpłatny okres próbny';

  @override
  String get licenseStatusTrialExpired => 'Okres próbny zakończony';

  @override
  String get licenseStatusExpired => 'Licencja wygasła';

  @override
  String get licenseStatusInvalid => 'Nieprawidłowa licencja';

  @override
  String get licenseStatusUnregistered => 'Nieskonfigurowana';

  @override
  String get licenseStatusMachineMismatch => 'Inny komputer';

  @override
  String get licenseStatusNetworkError => 'Błąd połączenia';

  @override
  String get licenseEnterKeyTitle => 'Wprowadź klucz licencyjny';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Twoje imię i nazwisko';

  @override
  String get licenseEmailAddress => 'Adres e-mail';

  @override
  String get licenseMachineId => 'ID komputera';

  @override
  String get licenseCopyMachineId => 'Kopiuj ID komputera';

  @override
  String get licenseMachineIdCopied => 'ID komputera skopiowane do schowka';

  @override
  String get licenseValidationKeyRequired =>
      'Proszę wprowadzić klucz licencyjny';

  @override
  String get licenseValidationKeyFormat =>
      'Klucz licencyjny powinien mieć 20 znaków (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Proszę wprowadzić nazwisko';

  @override
  String get licenseValidationEmailRequired => 'Proszę wprowadzić adres e-mail';

  @override
  String get licenseValidationEmailInvalid =>
      'Proszę wprowadzić prawidłowy adres e-mail';

  @override
  String get licenseActivate => 'Aktywuj licencję';

  @override
  String get licenseContinueTrial => 'Kontynuuj okres próbny';

  @override
  String get licenseBuyLicense => 'Kup licencję';

  @override
  String get licenseNeedHelp => 'Potrzebujesz pomocy?';

  @override
  String get licenseLicenseAgreement => 'Umowa licencyjna';

  @override
  String get licenseActivatedSuccess => 'Licencja aktywowana pomyślnie!';

  @override
  String get licenseMsgMachineMismatch =>
      'Ta licencja jest zarejestrowana na innym komputerze. Użyj oryginalnego urządzenia lub skontaktuj się z pomocą techniczną.';

  @override
  String get licenseMsgTrialEnded =>
      'Twój bezpłatny okres próbny dobiegł końca. Wprowadź klucz licencyjny, aby kontynuować korzystanie ze wszystkich funkcji.';

  @override
  String get licenseMsgExpired =>
      'Twoja licencja wygasła. Proszę odnowić, aby kontynuować.';

  @override
  String get licenseMsgNeedsSetup =>
      'Licencja wymaga skonfigurowania. Rozpocznij bezpłatny okres próbny lub wprowadź klucz licencyjny.';

  @override
  String get licenseMsgCheckFormat =>
      'Sprawdź format klucza licencyjnego. Powinien wyglądać tak: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Ten klucz licencyjny nie został rozpoznany. Proszę sprawdzić i spróbować ponownie.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Ten klucz jest już zarejestrowany na innym komputerze.';

  @override
  String get licenseMsgContactSupport =>
      'Ta licencja wygasła. Skontaktuj się z pomocą techniczną w celu odnowienia.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Licencja aktywowana pomyślnie! Dziękujemy za zakup.';

  @override
  String get licenseMsgUnableToActivate =>
      'Nie można aktywować licencji. Sprawdź połączenie z internetem i spróbuj ponownie.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Witamy! Twój $days-dniowy bezpłatny okres próbny rozpoczął się.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Okres próbny aktywny: pozostało $days dni.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Bezpłatny okres próbny aktywny';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Licencja aktywna – $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Nie można aktywować tego klucza licencyjnego.';

  @override
  String get licenseMsgNoLongerValid => 'Licencja jest już nieważna.';

  @override
  String get licenseMsgUnableToVerify =>
      'Nie można zweryfikować tego klucza licencyjnego. Skontaktuj się z pomocą techniczną.';

  @override
  String get trialStartedSnackbar => 'Okres próbny rozpoczęty!';

  @override
  String get trialStartedMessage => 'Ciesz się 14 dniami pełnego dostępu';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'ThemeMode';

  @override
  String get methods => 'METODY';

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
  String get set => 'Ustaw';

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
  String get defaultIcon => 'Domyślna';

  @override
  String get original => 'Oryginalna';

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
  String get dragToResizeAreaExample => 'Przykład DragToResizeArea';

  @override
  String get closeWindowConfirmation => 'Czy na pewno chcesz zamknąć to okno?';

  @override
  String get licenseChecking => 'Sprawdzanie licencji...';

  @override
  String get licenseRequiredTitle => 'Wymagana licencja';

  @override
  String get licenseActivateValidMessage =>
      'Proszę aktywować prawidłową licencję, aby kontynuować.';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro zawiera:';

  @override
  String get licenseFeatureUnlimitedAnalysis =>
      'Nieograniczona analiza źrenicy i kryzy';

  @override
  String get licenseFeaturePdfReports => 'Generowanie raportów PDF';

  @override
  String get licenseFeatureBilateralComparison => 'Porównanie obustronne';

  @override
  String get licenseFeatureAnwAnalysis => 'Analiza kryzy ANW';

  @override
  String get licenseFeatureScanHistory => 'Baza danych historii skanów';

  @override
  String get licenseFeatureUpdates => 'Bezpłatne aktualizacje przez 1 rok';

  @override
  String get licensePurchase => 'Kup licencję';

  @override
  String get licenseExitApplication => 'Zamknij aplikację';

  @override
  String get windowCompactView => 'Widok kompaktowy';

  @override
  String get windowExpandedView => 'Widok rozszerzony';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return 'Okres próbny (pozostało $count dni)';
  }

  @override
  String get licenseNotLicensed => 'Bez licencji';

  @override
  String get licenseStatusTitle => 'Status licencji';

  @override
  String get unknown => 'Nieznany';

  @override
  String get plrReportTitle => 'Raport analizy PLR';

  @override
  String get plrResearchOnlyTitle => 'WYŁĄCZNIE NARZĘDZIE BADAWCZO-DYDAKTYCZNE';

  @override
  String get plrResearchDisclaimer =>
      'Wyniki NIE są diagnozami medycznymi. Skonsultuj się z pracownikiem ochrony zdrowia.';

  @override
  String get plrNameLabel => 'Nazwisko';

  @override
  String plrAgeYears(int age) {
    return 'Wiek: $age lat';
  }

  @override
  String get plrTestLabel => 'Test';

  @override
  String get plrSummaryTitle => 'Podsumowanie PLR';

  @override
  String plrGradeValue(String grade) {
    return 'Ocena $grade';
  }

  @override
  String get plrStatusLabel => 'Status';

  @override
  String get plrDetectedStatus => 'PLR WYKRYTY';

  @override
  String get plrWeakNotDetectedStatus => 'SŁABY/NIEWYKRYTY';

  @override
  String get plrRecoveryTimeLabel => 'Czas powrotu';

  @override
  String get plrRecoveryRatioLabel => 'Wskaźnik powrotu';

  @override
  String get plrChartDescription =>
      'Wizualna reprezentacja odpowiedzi źrenicy w czasie';

  @override
  String plrPiRange(String min, String max) {
    return 'Zakres P/I: $min% – $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Dane klatek';

  @override
  String get plrTableTime => 'Czas';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Faza';

  @override
  String get plrTableConfidenceShort => 'Pewn.';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Pomyślne: $success | Nieudane: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latencja: 200–500 ms (czas do początkowej odpowiedzi)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Zwężenie: 10–30% redukcji od wartości bazowej';

  @override
  String get plrReferenceVelocityLine => '• Prędkość: 1,5–4,0%/sekundę';

  @override
  String get plrReferenceRecoveryLine =>
      '• Powrót: >75% powrotu do wartości bazowej w ciągu 5 sekund';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Powrót: >75% do wartości bazowej w ciągu 5 s';

  @override
  String plrShareSubject(String eye) {
    return 'Raport analizy PLR – $eye';
  }

  @override
  String get plrTextReportTitle => 'RAPORT ANALIZY PLR VIDEO';

  @override
  String get plrTextDisclaimerTitle =>
      'ZASTRZEŻENIE: Wyłącznie narzędzie badawczo-dydaktyczne';

  @override
  String get plrTextDisclaimerBody => 'Wyniki NIE są diagnozami medycznymi.';

  @override
  String get plrOverallGradeLabel => 'Ocena ogólna';

  @override
  String get plrEndOfReport => 'KONIEC RAPORTU';

  @override
  String get zoneOverlay => 'Nakładka strefowa';

  @override
  String get tipDragImage =>
      'Wskazówka: przeciągnij obraz, aby wyrównać rąbek z okręgami nakładki.';

  @override
  String get overlayMetrics => 'Metryki nakładki';

  @override
  String get piRatioLabel => 'Stosunek P/I:';

  @override
  String get ellipsenessLabel => 'Eliptyczność:';

  @override
  String get decentralizationLabel => 'Decentracja:';

  @override
  String get detectedFindings => 'Wykryte wyniki';

  @override
  String get anwCollarette => 'ANW / KRYZA';

  @override
  String get observerNotes => 'Notatki obserwatora';

  @override
  String get observerNotesHint =>
      'Wprowadź obserwacje kliniczne, wyniki stref, wzorce…';

  @override
  String get autoCenter => 'Auto-wyśrodkowanie';

  @override
  String get anwRing => 'Pierścień ANW';

  @override
  String get axisGrid => 'Oś/siatka';

  @override
  String get chart => 'Wykres';

  @override
  String get hoverToIdentify => 'Najedź lub dotknij strefę, aby zidentyfikować';

  @override
  String get organsMode =>
      'Tryb narządów — najedź na tęczówkę, aby zidentyfikować strefy';

  @override
  String get mildSizeDiff =>
      'Łagodna różnica wielkości. Może być fizjologiczna.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'W granicach wartości badawczej dla wieku $age ($group)';
  }

  @override
  String get formLabel => 'Forma:';

  @override
  String get flatteningLabel => 'Spłaszczenie:';

  @override
  String get protrusionLabel => 'Wypuklenie:';

  @override
  String get decentrationLabel => 'Decentracja:';

  @override
  String get pupilSizeLabel => 'Rozmiar źrenicy:';

  @override
  String get anwRatioLabel => 'Stosunek ANW:';

  @override
  String get anwToneLabel => 'Napięcie ANW:';

  @override
  String get noMajorODAnomalies => 'Brak znaczących anomalii źrenicy OD.';

  @override
  String get noMajorOSAnomalies => 'Brak znaczących anomalii źrenicy OS.';

  @override
  String get anwNotAssessed => 'ANW: nieoceniany';

  @override
  String get manualAlignmentAid =>
      'Pomocnicze ręczne wyrównanie wyłącznie do przeglądu (po przechwyceniu). Przeciągnij obraz lub użyj Auto-wyśrodkowania.';

  @override
  String get frontalShift => 'S: Wzorzec przesunięcia czołowego.';

  @override
  String get cerebralCirculation =>
      'Historyczne badania według Velchowera wiązały to z wzorcami krążenia mózgowego.';

  @override
  String get middleTemporalShift =>
      'D: Wzorzec przesunięcia środkowo-skroniowego.';

  @override
  String get respiratoryCardiac =>
      'Historyczne badania według Velchowera wiązały to z wzorcami autonomicznymi oddechowymi i sercowymi.';

  @override
  String get findings => 'Wyniki:';

  @override
  String get analysisReportTitle => 'Raport analizy źrenicy';

  @override
  String get reportResearchVersion => 'Wersja badawcza';

  @override
  String get reportDisclaimerTitle =>
      'ZASTRZEŻENIE: Wyłącznie narzędzie badawczo-dydaktyczne';

  @override
  String get reportDisclaimerBody =>
      'Wyniki są obserwacjami badawczymi, NIE diagnozami medycznymi.';

  @override
  String get reportPersonInformationTitle => 'Dane osoby';

  @override
  String get reportAgeGroupLabel => 'Grupa wiekowa';

  @override
  String get reportPupilSizeComparisonTitle => 'Porównanie rozmiaru źrenic';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Metryki odległości przechwytywania';

  @override
  String get reportResearchObservationsTitle => 'Obserwacje badawcze';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Notatki obserwatora (nakładka strefowa)';

  @override
  String get reportEndOfReport => 'KONIEC RAPORTU';

  @override
  String get reportGradeLabel => 'Ocena';

  @override
  String get reportPupilFormTitle => 'Kształt źrenicy';

  @override
  String get reportDecentrationTitle => 'Decentracja';

  @override
  String get reportFlatteningsTitle => 'Spłaszczenia';

  @override
  String get reportProtrusionsTitle => 'Wypuklenia';

  @override
  String get reportAnwParametersTitle => 'Kryza autonomiczna (ANW)';

  @override
  String get reportTonicStateLabel => 'Historyczny wzorzec napięcia';

  @override
  String get reportShiftDetectedTitle => 'Historyczny wzorzec przesunięcia';

  @override
  String get reportClinicalLabel => 'Uwaga historyczna';

  @override
  String get reportConstrictionDetectedTitle => 'Wykryto zwężenie';

  @override
  String get reportSeverityLabel => 'Nasilenie';

  @override
  String get reportReferenceValuesTitle =>
      'Wartości referencyjne (Protokół badawczy CNRI)';

  @override
  String get reportMatchLabel => 'Dopasowanie';

  @override
  String get reportValueLabel => 'Wartość';

  @override
  String get reportNormalPupilForm => 'Prawidłowy kształt źrenicy';

  @override
  String reportPageXofY(int page, int total) {
    return 'Strona $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Raport analizy źrenicy – $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'W załączeniu raport analizy źrenicy dla $patientName, wygenerowany dnia $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Poniżej wartości badawczej dla wieku $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Powyżej wartości badawczej dla wieku $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Niemowlę';

  @override
  String get ageGroupChild15 => 'Dziecko (1–5)';

  @override
  String get ageGroupChild611 => 'Dziecko (6–11)';

  @override
  String get ageGroupTeen => 'Nastolatek';

  @override
  String get ageGroupAdult2039 => 'Dorosły (20–39)';

  @override
  String get ageGroupAdult4059 => 'Dorosły (40–59)';

  @override
  String get ageGroupSenior60Plus => 'Senior (60+)';

  @override
  String get middleNasalShift => 'Wzorzec przesunięcia środkowo-nosowego.';

  @override
  String get upperTemporalShift => 'Wzorzec przesunięcia górno-skroniowego.';

  @override
  String get lowerTemporalShift => 'Wzorzec przesunięcia dolno-skroniowego.';

  @override
  String get basalShift => 'Wzorzec przesunięcia podstawnego.';

  @override
  String get vagusStellateAssociation =>
      'Historyczne badania według Velchowera wiązały to z wzorcami hipofunkcji nerwu błędnego lub zwoju gwiaździstego.';

  @override
  String get venaCavaInferiorAssociation =>
      'Historyczne badania według Velchowera wiązały to z wzorcami zaburzeń hemodynamicznych w żyle głównej dolnej.';

  @override
  String get vertebralArteryAssociation =>
      'Historyczne badania według Velchowera wiązały to z wzorcami krążenia w tętnicy kręgowej.';

  @override
  String get smallPelvisAssociation =>
      'Historyczne badania według Velchowera wiązały to z wzorcami zastoinowymi w małej miednicy.';

  @override
  String get openZoneOverlay => 'Otwórz nakładkę strefową';

  @override
  String get iris => 'Tęczówka';

  @override
  String get chartOpacity => 'Przezroczystość wykresu';

  @override
  String get irisSizeNotAvailable => 'Dane rozmiaru tęczówki niedostępne';

  @override
  String get ratio => 'Stosunek';

  @override
  String get reportRefPiRatio => 'Stosunek źrenica/tęczówka: Norma 20–30%';

  @override
  String get reportRefEllipseness => 'Eliptyczność: Norma >95%';

  @override
  String get reportRefDecentralization => 'Decentracja: Norma <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Różnica rozmiaru źrenic: <2% norma, 2–4% łagodna, >4% znacząca';

  @override
  String get enterPatientInfoAnalysis => 'Wprowadź dane pacjenta → Analiza';

  @override
  String get chooseCaptureMethod => 'Wybierz metodę przechwytywania:';

  @override
  String get usbCamera => 'Kamera USB';

  @override
  String get selectExistingImage => 'Wybierz istniejący obraz';

  @override
  String get detectingCameras => 'Wykrywanie kamer...';

  @override
  String get retryDetection => 'Ponów wykrywanie';

  @override
  String get connectUvcCameraViaUsb => 'Podłącz kamerę UVC przez USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Upewnij się, że sterowniki kamery są zainstalowane';

  @override
  String get tapRefreshToDetect => 'Dotknij Odśwież, aby wykryć kamery';

  @override
  String get connectUsbCameraToBegin => 'Podłącz kamerę USB, aby rozpocząć';

  @override
  String get noExternalCameraTitle => 'Nie wykryto zewnętrznej kamery';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Podłącz iryskop USB i upewnij się, że jest podłączony';

  @override
  String get languagesAvailable => 'Dostępne języki';

  @override
  String get validationChecks => 'Kontrole walidacji:';

  @override
  String get eyeQualityTip =>
      'Wskazówka: Zapewnij dobre oświetlenie i trzymaj oko nieruchomo';

  @override
  String get validatingEye => 'Weryfikacja oka...';

  @override
  String get initializing => 'Inicjalizacja...';

  @override
  String get nameLabel => 'Nazwisko:';

  @override
  String get ageLabel => 'Wiek:';

  @override
  String get typeLabel => 'Typ:';

  @override
  String get pleaseEnterName => 'Proszę podać nazwisko';

  @override
  String get pleaseEnterAge => 'Proszę podać wiek';

  @override
  String get ageMustBe2Digits => 'Wiek musi zawierać 1 lub 2 cyfry';

  @override
  String get optional => '(Opcjonalne)';

  @override
  String get bilateralBothHands => 'Oburęczność';

  @override
  String get zoom => 'Powiększenie';

  @override
  String get zoomSliderTip =>
      'Użyj suwaka powiększenia po prawej stronie, aby dostosować powiększenie przed nagrywaniem.';

  @override
  String get aboutProgramDeveloper =>
      'Twórca programu – Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Rozmiar wykresu';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Przezroczystość wykresu (0 = tylko po najechaniu / tryb narządów)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Gotowe i powrót';

  @override
  String get errorImageShape =>
      'Nieprawidłowy kształt obrazu – upewnij się, że oko wypełnia kadr';

  @override
  String get cameraConnected => 'Kamera podłączona';

  @override
  String get cameraDisconnected => 'Kamera odłączona';

  @override
  String get cameraPermissionDenied => 'Odmówiono dostępu do kamery';

  @override
  String get cameraFailedInit => 'Nie udało się zainicjalizować kamery';

  @override
  String get cameraInUse => 'Kamera jest używana przez inną aplikację';

  @override
  String get cameraFormatNotSupported => 'Format kamery nieobsługiwany';

  @override
  String get capturedImageNotFound =>
      'Nie znaleziono przechwycone pliku obrazu';

  @override
  String get failedToCaptureImage => 'Nie udało się przechwycić obrazu';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Wystąpił błąd kamery';

  @override
  String get connectingToUsbIriscope => 'Łączenie z iryskotem USB...';

  @override
  String get noCamerasDetectedMessage =>
      'Nie wykryto kamer. Upewnij się, że kamera USB jest podłączona i rozpoznana przez system.';

  @override
  String get failedToAccessCameras => 'Nie udało się uzyskać dostępu do kamer';

  @override
  String get notAnEyeImageTitle => 'To nie jest obraz oka';

  @override
  String get notAnEyeImageBody =>
      'Wybrane zdjęcie nie wygląda jak oko.\n\nProszę wybrać wyraźne zdjęcie tęczówki/źrenicy i spróbować ponownie.';

  @override
  String get notAnEyeImageBodyCapture =>
      'Przechwycone zdjęcie nie wygląda jak oko.\n\nProszę umieścić iriskop bezpośrednio nad okiem i wykonać zdjęcie ponownie.';

  @override
  String get anisocoriaObservationSymmetrical => 'Symetryczny';

  @override
  String get anisocoriaObservationSlight => 'Nieznaczna różnica';

  @override
  String get anisocoriaObservationModerate => 'Umiarkowana różnica';

  @override
  String get anisocoriaObservationMarked => 'Wyraźna różnica';

  @override
  String get settingsNaturalMedicineSection => 'Medycyna Naturalna';

  @override
  String get settingsHerbalToggle =>
      'Zalecenia Ziołowe (na podstawie stref tęczówki)';

  @override
  String get settingsNutritionToggle =>
      'Żywienie Dieta 7 Kolorów (na podstawie stref tęczówki)';

  @override
  String get settingsChiropracticToggle => 'Chiropraktyka / Ocena Kręgosłupa';

  @override
  String get settingsTcmToggle => 'Tradycyjna Medycyna Chińska (TCM)';

  @override
  String get therapyHerbalTitle => 'Zalecenia Ziołowe';

  @override
  String get therapyHerbalSubtitle =>
      'Wyniki stref tęczówki — posortowane według wagi dowodów';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count referencji';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'Sugestie ziołowe są dostarczane wyłącznie w celach edukacyjnych. Przed zastosowaniem skonsultuj się z wykwalifikowanym pracownikiem służby zdrowia.';

  @override
  String get therapyNutritionTitle => 'Żywienie Dieta 7 Kolorów';

  @override
  String get therapyNutritionSubtitle =>
      'Żywność i składniki odżywcze dla narządów stref tęczówki';

  @override
  String get therapyNutritionFoodsByColor => 'Zalecane Produkty według Koloru';

  @override
  String get therapyNutritionKeyNutrients => 'Kluczowe Składniki Odżywcze';

  @override
  String get therapyNutritionHerbs => 'Wspierające Zioła i Przyprawy';

  @override
  String get therapyNutritionNotes => 'Uwagi Żywieniowe';

  @override
  String get therapyNutritionTonifying => 'Produkty tonizujące:';

  @override
  String get therapyNutritionAvoid => 'Ograniczyć / unikać:';

  @override
  String get therapyNutritionDisclaimer =>
      'Sugestie żywieniowe opierają się na systemie Diety 7 Kolorów i są dostarczane wyłącznie w celach edukacyjnych. Przed zmianą diety skonsultuj się ze specjalistą.';

  @override
  String get therapyChiroTitle => 'Ocena Chiropraktyczna';

  @override
  String get therapyChiroSubtitle =>
      'Segmenty kręgosłupa wskazane przez wyniki stref tęczówki';

  @override
  String get therapyChiroVertebrae => 'Kręgi';

  @override
  String get therapyChiroNerveRoots => 'Korzenie Nerwowe';

  @override
  String get therapyChiroInnervated => 'Struktury Unerwione';

  @override
  String get therapyChiroSubluxation => 'Możliwe Wskaźniki Podwichnięcia';

  @override
  String get therapyChiroMuscles => 'Często Zajęte Mięśnie';

  @override
  String get therapyChiroAdjusting => 'Podejście do Korekty Chiropraktycznej';

  @override
  String get therapyChiroExercises => 'Ćwiczenia i Rozciąganie w Domu';

  @override
  String get therapyChiroPostural => 'Uwaga Posturalna';

  @override
  String get therapyChiroDisclaimer =>
      'Informacje chiropraktyczne są dostarczane w celach edukacyjnych. Skonsultuj się z licencjonowanym chiropraktykiem w celu diagnozy i leczenia.';

  @override
  String get therapyTcmTitle => 'Tradycyjna Medycyna Chińska';

  @override
  String get therapyTcmSubtitle => 'Meridian · Zegar Narządów · Pięć Elementów';

  @override
  String get therapyTcmMeridianFunctions => 'Funkcje Meridianu';

  @override
  String get therapyTcmGoverns => 'Zarządza';

  @override
  String get therapyTcmPatterns => 'Wzorce Nierównowagi';

  @override
  String get therapyTcmSymptoms => 'Objawy';

  @override
  String get therapyTcmFormulas => 'Klasyczne Formuły';

  @override
  String get therapyTcmKeyPoints => 'Kluczowe Punkty dla Tego Wzorca';

  @override
  String get therapyTcmAcupoints => 'Kluczowe Punkty Akupresury';

  @override
  String get therapyTcmDiet => 'Terapia Dietetyczna TCM';

  @override
  String get therapyTcmTonifying => 'Produkty tonizujące:';

  @override
  String get therapyTcmAvoid => 'Ograniczyć / unikać:';

  @override
  String get therapyTcmDisclaimer =>
      'Informacje TCM są dostarczane w celach edukacyjnych. Skonsultuj się z licencjonowanym akupunkturzystą lub praktykiem TCM.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'Nie wykryto znaczących wyników stref tęczówki do generowania zaleceń.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'Pora roku';

  @override
  String get therapyClimateLabel => 'Klimat';

  @override
  String get therapyEmotionLabel => 'Emocja';

  @override
  String get therapyTasteLabel => 'Smak';

  @override
  String get therapyNatureLabel => 'Natura';

  @override
  String therapyPairedOrgan(String organ) {
    return 'para: $organ';
  }
}
