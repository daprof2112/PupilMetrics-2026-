// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => 'Анализировать';

  @override
  String get plrModes => 'Режимы ЗПР';

  @override
  String get captureInstructions => 'Расположите глаз в направляющем круге';

  @override
  String get scanHistory => 'История сканирований';

  @override
  String get selectCameraMode => 'Выбор режима камеры';

  @override
  String get loadFromGallery => 'Загрузить из галереи';

  @override
  String get rightEyePhoto => 'Фото правого глаза';

  @override
  String get leftEyePhoto => 'Фото левого глаза';

  @override
  String get autoCapture => 'Авто-съёмка';

  @override
  String get autoCaptureDesc =>
      'Обнаружение глаза + авто-съёмка через 5 секунд';

  @override
  String get manualCapture => 'Ручная съёмка';

  @override
  String get manualCaptureDesc =>
      'Обнаружение глаза + ручная съёмка (задняя камера)';

  @override
  String get selfieMode => 'Режим селфи';

  @override
  String get selfieModeDesc =>
      'Обнаружение глаза + авто-съёмка через 5 сек (фронтальная камера)';

  @override
  String get plrVideoRear => 'ЗПР Видео (задняя)';

  @override
  String get plrVideoRearDesc => 'Задняя камера • съёмка 10 секунд';

  @override
  String get plrVideoSelfie => 'ЗПР Видео (селфи)';

  @override
  String get plrVideoSelfieDesc => 'Фронтальная камера • съёмка 10 секунд';

  @override
  String get plrVideoCapture => 'Запись видео ЗПР';

  @override
  String get frontCamera => 'Фронтальная камера';

  @override
  String get rearCamera => 'Задняя камера';

  @override
  String get selectEyeToAssess => 'Выберите глаз для оценки';

  @override
  String get rightEyeOD => 'Правый глаз (OD)';

  @override
  String get leftEyeOS => 'Левый глаз (OS)';

  @override
  String get recordPlrRightEye => 'Запись ЗПР для правого глаза';

  @override
  String get recordPlrLeftEye => 'Запись ЗПР для левого глаза';

  @override
  String get loadRightEyeImage => 'Загрузить изображение правого глаза';

  @override
  String get loadLeftEyeImage => 'Загрузить изображение левого глаза';

  @override
  String get bothEyes => 'Оба глаза';

  @override
  String get loadBothEyesDesc => 'Загрузить правый глаз, затем левый';

  @override
  String get selectEyeImageFromDevice =>
      'Выберите изображение глаза с устройства';

  @override
  String get selectRightEyeFirst =>
      'Сначала выберите изображение ПРАВОГО глаза (OD)';

  @override
  String get rightEyeSaved =>
      'Правый глаз сохранён. Теперь выберите изображение ЛЕВОГО глаза (OS)';

  @override
  String get cancelledNoRightEye => 'Отменено — правый глаз не выбран';

  @override
  String get cancelledNoLeftEye => 'Отменено — левый глаз не выбран';

  @override
  String errorLoadingImages(String error) {
    return 'Ошибка загрузки изображений: $error';
  }

  @override
  String get crop43 => 'Обрезка (4:3)';

  @override
  String get success => 'Успешно';

  @override
  String get imageCroppedSuccess => 'Изображение успешно обрезано!';

  @override
  String get error => 'Ошибка';

  @override
  String get cropFailed =>
      'Не удалось обрезать изображение. Пожалуйста, попробуйте ещё раз.';

  @override
  String get crop => 'Обрезать';

  @override
  String get cancel => 'Отмена';

  @override
  String get saved => 'Сохранено! ✅';

  @override
  String get imageSavedToGallery => 'Изображение успешно сохранено в галерее';

  @override
  String get exposure => 'Экспозиция';

  @override
  String get flash => 'Вспышка';

  @override
  String get eye => 'Глаз';

  @override
  String get center => 'центр';

  @override
  String get light => 'Свет';

  @override
  String get ready => 'Готово';

  @override
  String get on => 'ВКЛ';

  @override
  String get off => 'ВЫКЛ';

  @override
  String get auto => 'АВТО';

  @override
  String get manual => 'РУЧНОЙ';

  @override
  String get selfie => 'СЕЛФИ';

  @override
  String get pupil => 'ЗРАЧОК';

  @override
  String get plrHistory => 'История ЗПР';

  @override
  String get searchByName => 'Поиск по имени...';

  @override
  String get totalScans => 'Всего сканирований';

  @override
  String get thisWeek => 'На этой неделе';

  @override
  String get patients => 'Пациенты';

  @override
  String get detected => 'Обнаружено';

  @override
  String get noPlrRecordsYet => 'Записей ЗПР пока нет';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Запишите видео ЗПР, чтобы увидеть историю здесь';

  @override
  String get deleteRecord => 'Удалить запись?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Удалить анализ ЗПР для $name ($eye)?\\n\\nЭто действие нельзя отменить.';
  }

  @override
  String get delete => 'Удалить';

  @override
  String get recordDeleted => 'Запись удалена';

  @override
  String plrAnalysis(String eye) {
    return 'Анализ ЗПР — $eye';
  }

  @override
  String get patient => 'Пациент';

  @override
  String get date => 'Дата';

  @override
  String get frames => 'Кадры';

  @override
  String get baselinePiRatio => 'Исходное P/I';

  @override
  String get minPiRatio => 'Мин. P/I';

  @override
  String get plrMagnitude => 'Величина ЗПР';

  @override
  String get constriction => 'Сужение';

  @override
  String get plrDetected => 'ЗПР обнаружен';

  @override
  String get confidence => 'Достоверность';

  @override
  String get grade => 'Степень';

  @override
  String get close => 'закрыть';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get na => 'Н/Д';

  @override
  String get takeLeftEyePhoto => 'Сфотографировать левый глаз';

  @override
  String get takeRightEyePhoto => 'Сфотографировать правый глаз';

  @override
  String get nowTakingLeftEye => 'Сейчас снимается ЛЕВЫЙ глаз (OS)';

  @override
  String get startingWithRightEye => 'Начинаем с ПРАВОГО глаза (OD)';

  @override
  String get captured => 'Снято ✓';

  @override
  String get useSameDistanceLighting =>
      'Используйте то же расстояние и освещение, что и для правого глаза, для точного сравнения.';

  @override
  String get step1of2 => 'Шаг 1 из 2';

  @override
  String get step2of2 => 'Шаг 2 из 2';

  @override
  String get bothEyesCaptured => 'Оба глаза сфотографированы ✓';

  @override
  String get continueToLeftEye => 'Перейти к левому глазу';

  @override
  String get retakeOD => 'Переснять OD';

  @override
  String get retakeOS => 'Переснять OS';

  @override
  String get retakeRightEye => 'Переснять правый глаз';

  @override
  String get analyzeBothEyes => 'Анализировать оба глаза';

  @override
  String get patientInfoMissing => 'Данные пациента отсутствуют';

  @override
  String get rightEyePhotoMissing => 'Фото правого глаза отсутствует!';

  @override
  String get patientInfoMissingRestart =>
      'Данные пациента отсутствуют. Пожалуйста, перезапустите.';

  @override
  String get exitApp => 'Выйти из приложения';

  @override
  String get tipsForBestResults => 'СОВЕТЫ ДЛЯ ЛУЧШИХ РЕЗУЛЬТАТОВ';

  @override
  String get followGuidelinesForQuality =>
      'Следуйте этим рекомендациям для оптимального качества изображения';

  @override
  String get cameraDistance => 'Расстояние до камеры';

  @override
  String get cameraDistanceDesc =>
      'Держите камеру на расстоянии 10–15 см от глаза. Сохраняйте одинаковое расстояние для обоих глаз.';

  @override
  String get lightingPosition => 'Положение источника света';

  @override
  String get lightingPositionDesc =>
      'Расположите источник света внутри или снаружи границ зрачка. Попробуйте смотреть в сторону вспышки камеры.';

  @override
  String get avoidReflections => 'Избегайте отражений';

  @override
  String get avoidReflectionsDesc =>
      'Уменьшите отражения, избегая оконного блика, зеркал и прямых ламп.';

  @override
  String get centerYourEye => 'Отцентрируйте глаз';

  @override
  String get centerYourEyeDesc =>
      'Убедитесь, что весь глаз, включая склеру (белок), находится в центре и заполняет кадр.';

  @override
  String get cropProperly => 'Обрежьте правильно';

  @override
  String get cropProperlyDesc =>
      'Обрежьте изображение так, чтобы глаз находился в центре. Изображение будет автоматически сохранено в соотношении сторон 4:3.';

  @override
  String get importantInformation => 'Важная информация';

  @override
  String get imageRatio43 =>
      'Соотношение сторон 4:3 для стандарта медицинской визуализации';

  @override
  String get forClinicalUseCnri =>
      'Для клинического использования с CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Не предоставляет медицинский диагноз';

  @override
  String get eyeWideOpenClear =>
      'Убедитесь, что глаз широко открыт и изображение чёткое';

  @override
  String get personalInfo => 'Личные данные';

  @override
  String get personInformation => 'Информация о человеке';

  @override
  String get enterPersonDetails => 'Введите данные человека';

  @override
  String get infoIncludedInReport =>
      'Эта информация будет включена в отчёт по анализу';

  @override
  String get fullName => 'Полное имя';

  @override
  String get enterPersonName => 'Введите имя человека';

  @override
  String get nameRequired => 'Имя обязательно';

  @override
  String get sex => 'Пол';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get ageYears => 'Возраст (лет)';

  @override
  String get enterAge => 'Введите возраст';

  @override
  String get ageRequired => 'Возраст обязателен';

  @override
  String get enterValidNumber => 'Введите корректное число';

  @override
  String get enterValidAge => 'Введите корректный возраст (0–120)';

  @override
  String get mainComplaints => 'Основные жалобы';

  @override
  String get mainComplaintsOptional => 'Основные жалобы (необязательно)';

  @override
  String get complaintsHint =>
      'например, головные боли, проблемы со зрением, усталость...';

  @override
  String get continueToCaptire => 'Перейти к съёмке';

  @override
  String get ageImportantNote =>
      'Возраст важен для точной оценки размера зрачка, поскольку нормальные диапазоны варьируются в зависимости от возраста.';

  @override
  String get submit => 'Отправить';

  @override
  String get pleaseSelectGender => 'Пожалуйста, выберите пол!';

  @override
  String get applicationSubmitted => 'Ваша заявка успешно отправлена.';

  @override
  String get type => 'Тип:';

  @override
  String get gender => 'Пол:';

  @override
  String get rightHanded => 'Правша';

  @override
  String get leftHanded => 'Левша';

  @override
  String get partialLeftHandedness => 'Частичное левшество';

  @override
  String get retrainedLeftHandedness => 'Переученное левшество';

  @override
  String get bilateralUseBothHands => 'Двуручное использование обеих рук';

  @override
  String get splashTitle => 'PupilMetrics Eye Capture';

  @override
  String get splashDeveloper =>
      'Разработчик программы — Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool =>
      'Исследовательский/образовательный инструмент';

  @override
  String get startNewAnalysis => 'Начать новый анализ';

  @override
  String get viewHistory => 'Просмотр истории';

  @override
  String get viewResearchDisclaimer =>
      'Просмотр исследовательского отказа от ответственности';

  @override
  String get researchDisclaimerTitle =>
      'Исследовательский/образовательный инструмент';

  @override
  String get researchDisclaimerNotMedical =>
      'НЕ является медицинским устройством';

  @override
  String get researchDisclaimerNotClinical =>
      'НЕ предназначено для клинической диагностики';

  @override
  String get researchDisclaimerResults =>
      'Результаты являются исследовательскими наблюдениями';

  @override
  String get researchDisclaimerConsult =>
      'Всегда консультируйтесь со специалистами здравоохранения';

  @override
  String get researchDisclaimerAcknowledge =>
      'Продолжая, вы подтверждаете, что это исследовательский инструмент, и он не должен использоваться для принятия медицинских решений.';

  @override
  String get researchDisclaimerWarning =>
      'Это приложение предназначено ТОЛЬКО для ИССЛЕДОВАТЕЛЬСКИХ и ОБРАЗОВАТЕЛЬНЫХ целей.';

  @override
  String get iUnderstand => 'Я понимаю';

  @override
  String get plrAnalysisTest => 'Тест анализа ЗПР';

  @override
  String get checkingVideoFile => 'Проверка видеофайла...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Обработка кадра $current/$total ($timestamp мс)...';
  }

  @override
  String get analysisComplete => 'Анализ завершён!';

  @override
  String get errorVideoNotFound => 'Ошибка: видеофайл не найден';

  @override
  String get waitingForResults => 'Ожидание результатов...';

  @override
  String get baseline => 'Исходный уровень';

  @override
  String get flashPhase => 'Вспышка';

  @override
  String get constrictionPhase => 'Сужение';

  @override
  String get recovery => 'Восстановление';

  @override
  String get plrDetectedExclaim => 'ЗПР ОБНАРУЖЕН!';

  @override
  String get plrWeakNotDetected => 'ЗПР слабый/не обнаружен';

  @override
  String get min => 'Мин';

  @override
  String get plr => 'ЗПР';

  @override
  String get constrLabel => 'Сужен.';

  @override
  String get saveToHistory => 'Сохранить в историю';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Сохранить кадры';

  @override
  String get share => 'Поделиться';

  @override
  String get frameSavedToGallery => 'Кадр сохранён в галерее!';

  @override
  String get failedToSaveFrame => 'Не удалось сохранить кадр';

  @override
  String framesSavedToGallery(int count) {
    return '$count кадров сохранено в галерее!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON скопирован в буфер обмена!';

  @override
  String get reportCopiedToClipboard => 'Отчёт скопирован в буфер обмена!';

  @override
  String shareFailedError(String error) {
    return 'Ошибка при попытке поделиться: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Сохранено в историю! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'Нет успешных кадров для сохранения';

  @override
  String get saveAllFrames => 'Сохранить все кадры';

  @override
  String get shareReport => 'Поделиться отчётом';

  @override
  String get shareJson => 'Поделиться JSON';

  @override
  String get rerunTest => 'Запустить тест повторно';

  @override
  String videoCaptureTitle(String eye) {
    return 'ЗПР — $eye';
  }

  @override
  String get initializingCamera => 'Инициализация камеры...';

  @override
  String usingCamera(String camera) {
    return 'Используется $camera камера';
  }

  @override
  String cameraError(String error) {
    return 'Ошибка камеры: $error';
  }

  @override
  String get noCamerasFound => 'Камеры не найдены';

  @override
  String get retry => 'Повторить';

  @override
  String get startPlrRecording => 'Начать запись ЗПР';

  @override
  String get stopRecording => 'Остановить запись';

  @override
  String get phaseReady => 'Готово';

  @override
  String get phaseStarting => 'Запуск...';

  @override
  String phaseBaseline(int sec) {
    return 'Исходный уровень (0–$sec с)';
  }

  @override
  String get phaseFlash => 'ВСПЫШКА!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Сужение ($start–$end с)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Восстановление ($start–$end с)';
  }

  @override
  String get phaseComplete => 'Завершено!';

  @override
  String get readyDesc => 'Расположите глаз в круге, затем нажмите «Старт»';

  @override
  String get holdSteady => 'Держите неподвижно...';

  @override
  String get recordingBaselinePupil => 'Запись исходного размера зрачка';

  @override
  String lightStimulus(int ms) {
    return 'Световой стимул ($ms мс)';
  }

  @override
  String get measuringConstriction => 'Измерение сужения зрачка';

  @override
  String get measuringRecovery => 'Измерение восстановления зрачка';

  @override
  String get plrRecordingComplete => 'Запись ЗПР завершена';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Расположите $eye глаз в круге.\\nДержите неподвижно в течение $seconds-секундной записи.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Держите глаз неподвижно. Вспышка произойдёт на $sec секунде.';
  }

  @override
  String get recordingComplete => 'Запись завершена';

  @override
  String get plrVideoCapturedSuccess => 'Видео ЗПР успешно записано!';

  @override
  String get duration => 'Длительность';

  @override
  String get seconds => 'секунды';

  @override
  String get frameRate => 'Частота кадров';

  @override
  String get camera => 'Камера';

  @override
  String flashAt(int sec, int ms) {
    return 'На $sec с ($ms мс)';
  }

  @override
  String get phases => 'Фазы';

  @override
  String get phasesFlow =>
      'Исходный уровень → Вспышка → Сужение → Восстановление';

  @override
  String get expectedNormalValues => 'Ожидаемые нормальные значения:';

  @override
  String get latency => 'Латентность';

  @override
  String get velocity => 'Скорость';

  @override
  String get testFrameAnalysis => '🧪 Анализ тестового кадра';

  @override
  String get retake => 'Переснять';

  @override
  String get done => 'Готово';

  @override
  String get plrVideoModeTitle => 'Видеорежим ЗПР';

  @override
  String get plrAssessmentTitle => 'Оценка зрачкового светового рефлекса (ЗПР)';

  @override
  String get plrInstructions =>
      '1. Расположите глаз в направляющем круге\\n2. Нажмите «Начать запись ЗПР»\\n3. Держите неподвижно в течение 10 секунд\\n4. На 3-й секунде произойдёт вспышка\\n5. Приложение записывает реакцию зрачка';

  @override
  String get recordingPhases => 'Фазы записи:';

  @override
  String get baselinePhaseDesc => 'Начальный размер зрачка';

  @override
  String get flashPhaseDesc => 'Световой стимул';

  @override
  String get constrictionPhaseDesc => 'Зрачок сужается';

  @override
  String get recoveryPhaseDesc => 'Зрачок восстанавливается';

  @override
  String get normalPlrValues => 'Нормальные значения ЗПР:';

  @override
  String get gotIt => 'Понятно';

  @override
  String get pupilAnalysis => 'Анализ зрачка';

  @override
  String scansLeft(int count) {
    return 'Осталось $count';
  }

  @override
  String get validatingRightEye => 'Проверка правого глаза...';

  @override
  String get validatingLeftEye => 'Проверка левого глаза...';

  @override
  String get analyzingRightEye => 'Анализ правого глаза (OD)...';

  @override
  String get analyzingLeftEye => 'Анализ левого глаза (OS)...';

  @override
  String get comparingPupils => 'Сравнение зрачков...';

  @override
  String person(String name) {
    return 'Человек: $name';
  }

  @override
  String get invalidEyeImage => 'Недействительное изображение глаза';

  @override
  String analysisFailed(String error) {
    return 'Анализ не выполнен: $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'ТОЛЬКО ИССЛЕДОВАТЕЛЬСКИЙ/ОБРАЗОВАТЕЛЬНЫЙ ИНСТРУМЕНТ';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Данное приложение предназначено исключительно для исследовательских и образовательных целей. Результаты НЕ являются медицинскими диагнозами и НЕ прошли валидацию для клинического применения. Ассоциации паттернов основаны на исторической исследовательской литературе. По любым вопросам здоровья обращайтесь к специалисту здравоохранения.';

  @override
  String get pupilSizeDifference => 'Обнаружена разница в размере зрачков';

  @override
  String get significantPupilSizeDiff =>
      'ЗНАЧИТЕЛЬНАЯ РАЗНИЦА В РАЗМЕРЕ ЗРАЧКОВ';

  @override
  String get diff => 'разница';

  @override
  String get researchObservationConsult =>
      'Исследовательское наблюдение — для интерпретации обратитесь к специалисту здравоохранения';

  @override
  String get ageBasedResearchBaseline =>
      'Возрастной исследовательский базовый показатель';

  @override
  String group(String group) {
    return 'Группа: $group';
  }

  @override
  String get researchRange => 'Исследовательский диапазон';

  @override
  String get measuredEst => 'Измеренное (оценка)';

  @override
  String get pupilForm => 'Форма зрачка';

  @override
  String get decentrationPattern => 'Паттерн децентрации';

  @override
  String get flattenings => 'Уплощения';

  @override
  String get protrusions => 'Выпуклости';

  @override
  String zonesCount(int count) {
    return '$count зон';
  }

  @override
  String get bilateralComparison => 'Двусторонний анализ';

  @override
  String get parameter => 'Параметр';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Соотношение P/I';

  @override
  String get ellipseness => 'Эллиптичность';

  @override
  String get circularity => 'Округлость';

  @override
  String get decentralization => 'Децентрализация';

  @override
  String get anwRatio => 'Соотношение';

  @override
  String get normal => 'норма';

  @override
  String get elliptical => 'Эллиптический';

  @override
  String get circular => 'Круглый';

  @override
  String get irregular => 'Неправильный';

  @override
  String get centered => 'Центрированный';

  @override
  String get offset => 'Смещение';

  @override
  String get miosis => 'Миоз';

  @override
  String get constricted => 'Суженный';

  @override
  String get dilated => 'Расширенный';

  @override
  String get mydriasis => 'Мидриаз';

  @override
  String get inner => 'Внутренний';

  @override
  String get outer => 'Внешний';

  @override
  String get high => 'Высокая';

  @override
  String get moderate => 'Умеренная';

  @override
  String get savePdf => 'Сохранить PDF';

  @override
  String get sharePdf => 'Поделиться PDF';

  @override
  String get retakePhotos => 'Переснять фотографии';

  @override
  String scansLeftBanner(int count) {
    return 'Осталось $count сканирований';
  }

  @override
  String get upgrade => 'Обновить';

  @override
  String get unlockUnlimited => 'Разблокировать безлимит';

  @override
  String get usedAllFreeScans => 'Вы использовали все бесплатные сканирования.';

  @override
  String get unlimitedScans => 'Безлимитные сканирования';

  @override
  String get pdfReports => 'PDF-отчёты';

  @override
  String get scanHistoryFeature => 'История сканирований';

  @override
  String get bilateralAnalysis => 'Двусторонний анализ';

  @override
  String get monthly => 'Ежемесячно';

  @override
  String get perMonth => '/мес';

  @override
  String get annual => 'Ежегодно';

  @override
  String get perYear => '/год';

  @override
  String get tenCredits => '10 кредитов';

  @override
  String get oneTime => 'единоразово';

  @override
  String get best => 'ЛУЧШИЙ';

  @override
  String get purchaseCancelled => 'Покупка отменена';

  @override
  String purchaseFailed(String error) {
    return 'Ошибка покупки: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT сохранён: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON сохранён: $path';
  }

  @override
  String get pdfSaved => 'PDF сохранён!';

  @override
  String pdfFailed(String error) {
    return 'Ошибка PDF: $error';
  }

  @override
  String get open => 'ОТКРЫТЬ';

  @override
  String failed(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get staticScans => 'Статические';

  @override
  String get plrScans => 'ЗПР';

  @override
  String get searchByNameOrComplaints => 'Поиск по имени или жалобам...';

  @override
  String get searchPlrRecords => 'Поиск записей ЗПР...';

  @override
  String get noScansYet => 'Сканирований пока нет';

  @override
  String get completedScansAppearHere =>
      'Завершённые сканирования появятся здесь';

  @override
  String get deleteScan => 'Удалить сканирование?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Удалить сканирование для $name от $date?';
  }

  @override
  String get scanDeleted => 'Сканирование удалено';

  @override
  String get originalImagesNotFound => 'Исходные изображения глаза не найдены.';

  @override
  String get viewResults => 'Просмотр результатов';

  @override
  String get avgPlr => 'Сред. ЗПР';

  @override
  String get years => 'лет';

  @override
  String get anisocoria => 'Анизокория';

  @override
  String get none => 'Нет';

  @override
  String get mild => 'Лёгкая';

  @override
  String get severe => 'Тяжёлая';

  @override
  String zoneLabel(String zone) {
    return 'Зона: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Связано с $organ';
  }

  @override
  String get significant => 'Значительная';

  @override
  String get fair => 'Удовлетворительная';

  @override
  String get low => 'Низкая';

  @override
  String get good => 'Хорошая';

  @override
  String get zones => 'зоны';

  @override
  String get significanceWithinLimits => 'в пределах допустимых значений';

  @override
  String get significanceMild => 'лёгкая';

  @override
  String get significanceModerate => 'умеренная';

  @override
  String get significanceSignificant => 'значительная';

  @override
  String get formTypeCircle => 'Круг (норма)';

  @override
  String get formTypeOval => 'Овал';

  @override
  String get formTypeOvalVertical => 'Вертикальный овал';

  @override
  String get formTypeOvalHorizontal => 'Горизонтальный овал';

  @override
  String get formTypeOvalDiagonal => 'Диагональный овал';

  @override
  String get formTypeLeftObliqueEllipse => 'Левая косая эллипс';

  @override
  String get formTypeUnilateralEllipse => 'Односторонняя эллипс';

  @override
  String get formTypeVentralDivergingEllipse =>
      'Вентральная расходящаяся эллипс';

  @override
  String get formTypeFrontalDivergingEllipse =>
      'Фронтальная расходящаяся эллипс';

  @override
  String get formTypeEllipse => 'Эллипс';

  @override
  String get formTypeChord => 'Хорда';

  @override
  String get formTypeIrregular => 'Неправильная форма';

  @override
  String get pupilFormCircleDesc =>
      'Нормальная круглая форма зрачка. Вариаций паттерна не обнаружено.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Горизонтальный овальный паттерн. Историческое исследование связывало его с паттернами вегетативной нервной системы, влияющими на зоны дыхательной и железистой функции.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Вертикальный овальный паттерн. Исторические исследования связывали этот паттерн с зонами церебрального кровообращения в исследованиях вегетативных рефлексов.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Диагональный овальный паттерн. Исследовательская литература связывала его с рефлексами урогенитальной зоны в вегетативных исследованиях.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Паттерн левой косой эллипс. Исторические наблюдения связывали его с вегетативными зонами урогенитального отдела и нижних конечностей.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Паттерн односторонней эллипс. Исследования указывали на связь с вегетативными зонами дыхательных путей и бронхов.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Вентральная расходящаяся эллипс. Исторические исследования связывали её с вегетативными зонами нижней части тела и паттернами двигательных функций.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Фронтальная расходящаяся эллипс. Исследовательская литература связывала этот паттерн с церебральными и верхними вегетативными зонами.';

  @override
  String get pupilFormOvalDesc =>
      'Паттерн лёгкой овальной деформации. Наблюдайте за прогрессированием в рамках исследовательских наблюдений.';

  @override
  String get pupilFormEllipseDesc =>
      'Эллиптический паттерн зрачка, указывающий на вариации вегетативной системы в исторических исследованиях.';

  @override
  String get pupilFormChordDesc =>
      'Паттерн деформации по типу хорды, указывающий на локализованные вегетативные влияния в исследовательской литературе.';

  @override
  String get pupilFormIrregularDesc =>
      'Неправильная форма, предполагающая множественные вегетативные паттернные влияния на основе исторических наблюдений.';

  @override
  String get patternCentered => 'Центрированный (норма)';

  @override
  String get patternFrontal => 'Фронтальная децентрация';

  @override
  String get patternBasal => 'Базальная децентрация';

  @override
  String get patternNasal => 'Назальная децентрация';

  @override
  String get patternTemporal => 'Темпоральная децентрация';

  @override
  String get patternMiddleNasal => 'Средненазальная децентрация';

  @override
  String get patternMiddleTemporal => 'Среднетемпоральная децентрация';

  @override
  String get patternUpperNasal => 'Верхненазальная децентрация';

  @override
  String get patternUpperTemporal => 'Верхнетемпоральная децентрация';

  @override
  String get patternLowerNasal => 'Нижненазальная децентрация';

  @override
  String get patternLowerTemporal => 'Нижнетемпоральная децентрация';

  @override
  String get patternUpwards => 'Децентрация — вверх';

  @override
  String get patternDownwards => 'Децентрация — вниз';

  @override
  String get patternUpwardsInwards => 'Децентрация — вверх-внутрь';

  @override
  String get patternUpwardsOutwards => 'Децентрация — вверх-наружу';

  @override
  String get decentrationCenteredDesc =>
      'Нормальное положение зрачка в физиологических пределах.';

  @override
  String get decentrationNasalRightDesc =>
      'Назальный паттерн (правый). Историческое исследование связывало эту зону с лёгочными вегетативными рефлексами.';

  @override
  String get decentrationNasalLeftDesc =>
      'Назальный паттерн (левый). Исследовательская литература связывала эту зону с паттернами сердечной вегетативной функции.';

  @override
  String get decentrationTemporalDesc =>
      'Темпоральный паттерн. Исторические наблюдения связывали эту зону с почечными и репродуктивными вегетативными рефлексами.';

  @override
  String get decentrationFrontalRightDesc =>
      'Фронтальный паттерн (правый). Исследования связывали эту зону с когнитивными и церебральными паттернами функций.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Фронтальный паттерн (левый). Исторические исследования связывали эту зону с церебральными вегетативными паттернами.';

  @override
  String get decentrationBasalRightDesc =>
      'Базальный паттерн (правый). Исследования указывали на связь с рефлексами внутричерепного давления.';

  @override
  String get decentrationBasalLeftDesc =>
      'Базальный паттерн (левый). Исторические наблюдения связывали его с паттернами зон церебрального воспаления.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Верхненазальный паттерн (правый). Исследования связывали эту зону с гепатобилиарными вегетативными рефлексами.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Верхненазальный паттерн (левый). Исторические исследования связывали его со зонами селезёнки и диафрагмы.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Верхнетемпоральный паттерн. Исследования указывали на связь с почечными и репродуктивными вегетативными зонами.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Средненазальный паттерн (правый). Исторические наблюдения связывали его с утилизацией кислорода и сердечными зонами.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Средненазальный паттерн (левый). Исследования связывали его с неврологическими и сердечными вегетативными паттернами.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Среднетемпоральный паттерн (правый). Исследования связывали его с зонами сердечной вегетативной регуляции.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Среднетемпоральный паттерн (левый). Исторические исследования связывали его с лёгочными и сердечными зонами.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Верхненазальный паттерн (правый). Исследования указывали на связь с когнитивными зонами и рефлексами шейного отдела позвоночника.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Верхненазальный паттерн (левый). Исторические наблюдения связывали его с когнитивными паттернами и зонами шейного отдела.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Верхнетемпоральный паттерн (правый). Исследования связывали эту зону с рефлексами черепно-мозговых нервов и слухового анализатора.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Верхнетемпоральный паттерн (левый). Исторические исследования связывали его с нейровегетативными и речевыми зонами.';

  @override
  String get decentrationLowerNasalDesc =>
      'Нижненазальный паттерн. Исследования указывали на связь с урогенитальными и пояснично-крестцовыми вегетативными зонами.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Нижнетемпоральный паттерн (правый). Исторические наблюдения связывали его с метаболическими и печёночными зонами.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Нижнетемпоральный паттерн (левый). Исследования связывали его с сердечными и вегетативными паттернами селезёнки.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Паттерн, связанный с верхнецентральной зоной. Историческое исследование связывало его с регуляцией настроения и вегетативными рефлексами энергетических зон.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Паттерн, связанный с верхнетемпоральной зоной. Исследования указывали на связь с вегетативными рефлексами черепно-мозговых нервов и слухового анализатора.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Паттерн, связанный со среднетемпоральной зоной. Исторические наблюдения связывали его с дыхательными и сердечными вегетативными паттернами.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Паттерн, связанный с нижнетемпоральной зоной. Исследовательская литература связывала его с печёночными и метаболическими вегетативными зонами.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Паттерн, связанный с нижнебазальной зоной. Исторические исследования связывали его с почечными и вегетативными рефлексами нижних конечностей.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Паттерн, связанный с нижненазальной зоной. Исследования указывали на связь с урогенитальными и тазовыми вегетативными зонами.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Паттерн, связанный со средненазальной зоной. Исторические наблюдения связывали его с утилизацией кислорода и вегетативными паттернами дыхания.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Паттерн, связанный с верхненазальной зоной. Исследовательская литература связывала его с когнитивными и шейными вегетативными рефлексами.';

  @override
  String get flatteningDefaultRightDesc =>
      'В данной зоне обнаружено вариативное паттерное изменение вегетативной нервной системы на основе исторических исследований.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Паттерн, связанный с верхнецентральной зоной. Историческое исследование связывало его с регуляцией настроения и неврологическими вегетативными паттернами.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Паттерн, связанный с верхнетемпоральной зоной. Исследования указывали на связь с нейровегетативными и речевыми вегетативными зонами.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Паттерн, связанный со среднетемпоральной зоной. Исторические наблюдения связывали его с лёгочными и сердечными вегетативными рефлексами.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Паттерн, связанный с нижнетемпоральной зоной. Исследовательская литература связывала его с сердечными и вегетативными паттернами селезёнки.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Паттерн, связанный с нижнебазальной зоной. Исторические исследования связывали его с почечными и выделительными вегетативными зонами.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Паттерн, связанный с нижненазальной зоной. Исследования указывали на связь с урогенитальными и пояснично-крестцовыми вегетативными рефлексами.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Паттерн, связанный со средненазальной зоной. Исторические наблюдения связывали его с сердечными и дыхательными вегетативными паттернами.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Паттерн, связанный с верхненазальной зоной. Исследовательская литература связывала его с когнитивными и шейными вегетативными зонами.';

  @override
  String get flatteningDefaultLeftDesc =>
      'В данной зоне обнаружено вариативное паттерное изменение вегетативной нервной системы на основе исторических исследований.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Паттерн выпуклости верхнецентральной зоны. Исследования связывали его с паттернами симпатической гиперактивности, влияющими на церебральные зоны.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Паттерн выпуклости верхнетемпоральной зоны. Исторические наблюдения связывали его с паттернами гиперактивности черепно-мозговых нервов и слуховой системы.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Паттерн выпуклости среднетемпоральной зоны. Исследования указывали на связь с сердечными и дыхательными симпатическими паттернами.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Паттерн выпуклости нижнетемпоральной зоны. Исторические исследования связывали его с гепатобилиарными и метаболическими симпатическими зонами.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Паттерн выпуклости нижнебазальной зоны. Исследования связывали его с паттернами симпатической гиперактивности почечных и тазовых зон.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Паттерн выпуклости нижненазальной зоны. Исторические наблюдения связывали его с зонами симпатической активации урогенитального отдела.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Паттерн выпуклости средненазальной зоны. Исследования указывали на связь с желудочными и панкреатическими симпатическими паттернами.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Паттерн выпуклости верхненазальной зоны. Исторические исследования связывали его с когнитивными и зрительными зонами симпатической гиперактивности.';

  @override
  String get protrusionDefaultRightDesc =>
      'В данной зоне на основе исследовательских наблюдений обнаружен паттерн гиперактивности симпатической нервной системы.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Паттерн выпуклости верхнецентральной зоны. Исследования связывали его с психомоторными и церебральными симпатическими паттернами.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Паттерн выпуклости верхнетемпоральной зоны. Исторические наблюдения связывали его с зонами нейровегетативной симпатической гиперактивности.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Паттерн выпуклости среднетемпоральной зоны. Исследования указывали на связь с лёгочными и сердечными симпатическими паттернами.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Паттерн выпуклости нижнетемпоральной зоны. Исторические исследования связывали его с зонами симпатической активации селезёнки и сердца.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Паттерн выпуклости нижнебазальной зоны. Исследования связывали его с паттернами симпатической гиперактивности тазовых и почечных зон.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Паттерн выпуклости нижненазальной зоны. Исторические наблюдения связывали его с зонами симпатической активации пояснично-крестцового отдела.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Паттерн выпуклости средненазальной зоны. Исследования указывали на связь с симпатическими паттернами тревожно-сердечной сферы.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Паттерн выпуклости верхненазальной зоны. Исторические исследования связывали его с когнитивными и зрительными зонами симпатической гиперактивности.';

  @override
  String get protrusionDefaultLeftDesc =>
      'В данной зоне на основе исследовательских наблюдений обнаружен паттерн гиперактивности симпатической нервной системы.';

  @override
  String get anisocoriaNone =>
      'Размеры зрачков в пределах нормы. Значительной анизокории не обнаружено.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Обнаружена анизокория: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'В пределах нормы.';

  @override
  String get anisocoriaSeverityMild =>
      'Наблюдается лёгкое различие. Может быть физиологическим.';

  @override
  String get anisocoriaSeverityModerate =>
      'Умеренная асимметрия. Исследовательское наблюдение отмечено.';

  @override
  String get anisocoriaSeveritySevere =>
      'Значительная асимметрия. Исследовательское наблюдение зафиксировано.';

  @override
  String get largerPupilEqual => 'равны';

  @override
  String get largerPupilOS => 'OS (левый)';

  @override
  String get largerPupilOD => 'OD (правый)';

  @override
  String get decentrationWithinLimits => 'В пределах нормы.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Смещение: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Верхнецентральная';

  @override
  String get zoneUpperNasal => 'Верхненазальная';

  @override
  String get zoneMiddleNasal => 'Средненазальная';

  @override
  String get zoneLowerNasal => 'Нижненазальная';

  @override
  String get zoneLowerBasal => 'Нижнебазальная';

  @override
  String get zoneLowerTemporal => 'Нижнетемпоральная';

  @override
  String get zoneMiddleTemporal => 'Среднетемпоральная';

  @override
  String get zoneUpperTemporal => 'Верхнетемпоральная';

  @override
  String get zoneFrontal => 'Фронтальная';

  @override
  String get zoneBasal => 'Базальная';

  @override
  String get zoneUnknown => 'Неизвестная';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '$zone уплощение ($clockRange) — $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '$zone выпуклость ($clockRange) — $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Режим USB-ирископа';

  @override
  String get iriscopeExternal => 'Ирископ / внешняя камера';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera =>
      'Использовать подключённую USB-камеру или ирископ';

  @override
  String get detectedCameras => 'Обнаруженные камеры';

  @override
  String get externalCamera => 'Внешняя камера';

  @override
  String cameraIndex(int index) {
    return 'Камера $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Внешняя камера не обнаружена.\\nПодключите USB-ирископ для включения.';

  @override
  String get refresh => 'Обновить';

  @override
  String get selectCameraSource => 'Выбор источника камеры';

  @override
  String camerasDetected(int count) {
    return 'Обнаружено $count камер';
  }

  @override
  String camerasAvailable(int count) {
    return 'Доступно $count камер';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Внешняя камера $index';
  }

  @override
  String get qualityGatedRear =>
      'Авто-съёмка с контролем качества (задняя камера)';

  @override
  String get qualityGatedFront =>
      'Авто-съёмка с контролем качества (фронтальная камера)';

  @override
  String get usbCameraInfo => 'Информация о USB-камере';

  @override
  String get connected => 'Подключено';

  @override
  String get waiting => 'Ожидание...';

  @override
  String get disconnected => 'Отключено';

  @override
  String get waitingForUsbCamera => 'Ожидание USB-камеры';

  @override
  String get connectIriscopePrompt =>
      'Подключите ирископ через адаптер USB OTG.\\nРазрешите доступ при появлении запроса.';

  @override
  String get usbCameraIssue => 'Проблема с USB-камерой';

  @override
  String get pleaseConnectIriscope =>
      'Пожалуйста, подключите ирископ или USB-камеру.';

  @override
  String get retryConnection => 'Повторить подключение';

  @override
  String get troubleshootingTips => 'Советы по устранению неполадок';

  @override
  String get tipUsbOtgAdapter =>
      'Убедитесь, что адаптер USB OTG правильно подключён';

  @override
  String get tipUsbHostMode =>
      'Проверьте, поддерживает ли устройство режим USB Host';

  @override
  String get tipReconnectCamera =>
      'Попробуйте отключить и снова подключить камеру';

  @override
  String get tipGrantPermissions =>
      'Предоставьте разрешения на USB при появлении запроса';

  @override
  String get tipUnlockDevice =>
      'На некоторых устройствах может потребоваться разблокировка';

  @override
  String get back => 'Назад';

  @override
  String get switchEye => 'Переключить глаз';

  @override
  String get state => 'Состояние';

  @override
  String get status => 'Статус';

  @override
  String get usingFlutterUvcPlugin =>
      'Используется плагин flutter_uvc_camera\\Плагин для поддержки устройств USB Video Class.';

  @override
  String get initialized => 'Инициализировано';

  @override
  String get notReady => 'Не готово';

  @override
  String get captureDistanceMatch => 'Соответствие расстояния съёмки';

  @override
  String get irisSize => 'Размер радужки';

  @override
  String get distanceMatched => 'Расстояние совпадает';

  @override
  String get distanceMismatch => 'Расстояние не совпадает';

  @override
  String get excellentMatch => 'Отличное совпадение';

  @override
  String get goodMatch => 'Хорошее совпадение';

  @override
  String get acceptableMatch => 'Приемлемое совпадение';

  @override
  String get considerRetaking =>
      'Расстояние не совпадает — рекомендуется переснять';

  @override
  String get qualityReady => 'Готово! Держите неподвижно...';

  @override
  String get qualityTooBlurry => 'Держите камеру неподвижно';

  @override
  String get qualityTooDark => 'Необходимо больше света';

  @override
  String get qualityTooBright => 'Слишком ярко — уменьшите освещение';

  @override
  String get qualityNoContrast => 'Отрегулируйте угол освещения';

  @override
  String get qualityNoPupil => 'Центрируйте зрачок в кадре';

  @override
  String get qualityNotCentered => 'Переместите глаз в центр';

  @override
  String get qualityNotAnEye => 'Глаз не обнаружен';

  @override
  String get qualityProcessing => 'Обработка...';

  @override
  String get distanceMatchedCheck => '✓ Расстояние совпадает';

  @override
  String get distanceGoodMatchCheck => '✓ Хорошее совпадение';

  @override
  String get distanceSlightlyBack => 'Немного назад ↔';

  @override
  String get distanceSlightlyCloser => 'Немного ближе ↔';

  @override
  String get distanceAlmostThere => 'Почти готово...';

  @override
  String get distanceMoveBack => 'Отодвиньтесь ←←';

  @override
  String get distanceMoveCloser => 'Приблизьтесь →→';

  @override
  String get distanceTooClose => 'Слишком близко! Отодвиньтесь';

  @override
  String get distanceTooFar => 'Слишком далеко! Приблизьтесь';

  @override
  String get distanceStabilizing => 'Стабилизация...';

  @override
  String distanceLabel(int percent) {
    return 'Расстояние: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: $odSizeпкс → OS: $osSizeпкс';
  }

  @override
  String get frontCameraLabel => 'Фронтальная камера';

  @override
  String get rearCameraLabel => 'Задняя камера';

  @override
  String get startingCamera => 'Запуск камеры...';

  @override
  String get eyeNotDetected => 'Глаз не обнаружен';

  @override
  String get tryAgain => 'Повторить';

  @override
  String get indicatorEye => 'Глаз';

  @override
  String get indicatorSharp => 'Резкость';

  @override
  String get indicatorLight => 'Освещение';

  @override
  String get indicatorFocus => 'Фокус';

  @override
  String get indicatorPupil => 'Зрачок';

  @override
  String get indicatorIris => 'Радужка';

  @override
  String get indicatorMatch => 'Совпадение';

  @override
  String get checkImageShape => 'Форма изображения';

  @override
  String get checkCircularIris => 'Круглая радужка';

  @override
  String get checkDarkPupil => 'Тёмный зрачок';

  @override
  String get checkIrisTexture => 'Текстура радужки';

  @override
  String get checkPupilIrisStructure => 'Структура зрачок-радужка';

  @override
  String get checkNaturalColors => 'Естественные цвета';

  @override
  String get checkEdgePattern => 'Контуры краёв';

  @override
  String get errorImageShapeIncorrect =>
      'Неверная форма изображения — убедитесь, что глаз заполняет кадр';

  @override
  String get errorNoEyeDetected =>
      'Глаз не обнаружен — расположите радужку в центре кадра';

  @override
  String get errorNoPupilDetected =>
      'Зрачок не обнаружен — обеспечьте хорошее освещение';

  @override
  String get errorNoIrisTexture =>
      'Текстура радужки не определена — приблизьтесь к глазу';

  @override
  String get errorUnusualColors =>
      'Обнаружены нетипичные цвета — избегайте экранов и бликов';

  @override
  String get errorTooManyEdges =>
      'Слишком много прямых краёв — возможно, это не глаз';

  @override
  String get errorNotValidEye =>
      'Изображение не является действительным снимком глаза — повторите попытку';

  @override
  String get holdStillCapturing => 'Не двигайтесь — выполняется съёмка...';

  @override
  String get adjustDistanceFirst => 'Сначала отрегулируйте расстояние';

  @override
  String get stabilizingReading => 'Стабилизация...';

  @override
  String get autoCaptureWhenReady => 'Автосъёмка при готовности';

  @override
  String get tapOrWaitAutoCapture => 'Нажмите или дождитесь автосъёмки';

  @override
  String get validatingImage => 'Проверка...';

  @override
  String get capturingStatus => 'Съёмка...';

  @override
  String get adjustPositionStatus => 'Откорректируйте положение';

  @override
  String get validationTip =>
      'Совет: обеспечьте хорошее освещение, держите камеру на расстоянии 10–15 см от глаза, избегайте бликов';

  @override
  String get validationChecksTitle => 'Проверки качества:';

  @override
  String confidenceLabel(int percent) {
    return 'Достоверность: $percent%';
  }

  @override
  String get incompleteData => 'Неполные данные';

  @override
  String get irisDiameterLabel => 'радужка ø';

  @override
  String get plrResponseCurve => 'Кривая ЗПР';

  @override
  String get plrLatency => 'Латентность';

  @override
  String get plrVelocity => 'Скорость';

  @override
  String get plrRecoveryTime => 'Время восст.';

  @override
  String get plrRecoveryRatio => 'Восст. %';

  @override
  String get plrEnhancedMetrics => 'Расширенные показатели ЗПР';

  @override
  String get plrNormalLatency => 'Норма: 200–500 мс';

  @override
  String get plrNormalConstriction => 'Норма: 10–30%';

  @override
  String get plrNormalVelocity => 'Норма: 1,5–4,0%/с';

  @override
  String get plrReferenceValues => 'Нормативные значения ЗПР';

  @override
  String get plrSubjectInfo => 'Данные пациента';

  @override
  String get plrTestType => 'Зрачковый световой рефлекс';

  @override
  String get plrAnalysisSummary => 'Сводка анализа';

  @override
  String get plrTotalFrames => 'Всего проанализировано кадров';

  @override
  String get plrSuccessRate => 'Доля успешных кадров';

  @override
  String get plrMaxConstriction => 'Максимальное сужение';

  @override
  String get plrResponseCurveLabels => 'Кривая ЗПР';

  @override
  String get anwTitle => 'Автономное нервное кольцо (АНК)';

  @override
  String get anwAbnormal => 'Отклонение';

  @override
  String get anwDiameter => 'Диаметр';

  @override
  String get anwPerimeter => 'Периметр';

  @override
  String get anwAsymmetry => 'Асимметрия';

  @override
  String get anwElevated => 'Приподнятое';

  @override
  String get anwFormType => 'Тип формы';

  @override
  String get anwRegular => 'Правильное';

  @override
  String get anwDrawnIn => 'Втянутое';

  @override
  String get anwIndented => 'Вдавленное';

  @override
  String get anwLacerated => 'Разорванное';

  @override
  String get anwSpastic => 'Спастическое';

  @override
  String get anwAtonic => 'Атоническое';

  @override
  String get anwTonicState => 'Исторический паттерн тонуса';

  @override
  String get anwParasympathotonic => 'Парасимпатотонический паттерн';

  @override
  String get anwSympathotonicState => 'Симпатотонический паттерн';

  @override
  String get anwShiftDetected => 'Исторический паттерн смещения';

  @override
  String get anwConstrictionDetected => 'Обнаружено сужение';

  @override
  String get anwFindings => 'Находки';

  @override
  String get anwRatioComparison => 'Соотношение АНК';

  @override
  String get bilateralANWComparison => 'Двустороннее сравнение АНК';

  @override
  String get anwSymmetryNormal => 'Симметрия АНК в пределах нормы.';

  @override
  String get anwAsymmetryDetected => 'Обнаружена асимметрия АНК между глазами.';

  @override
  String get functionalFrustration =>
      'Функциональный дисбаланс в корреляции симпатической и парасимпатической нервных систем.';

  @override
  String get anwParasympathotonicDesc =>
      'По историческим наблюдениям это связано с повышенной лимбальной чувствительностью. Рефлекторная активность ускорена. Секреторные и эвакуаторные функции ЖКТ усилены.';

  @override
  String get anwSympathotonicDesc =>
      'По историческим наблюдениям это связано со сниженной лимбальной чувствительностью. Рефлекторная активность замедлена. Секреторные и эвакуаторные функции ЖКТ снижены.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Исторические исследования по Вельховеру связывали это с паттернами перегрузки левого желудочка и сердечного стресса.';

  @override
  String get anwFrontalConstricted =>
      'Фронтальная зона зрачкового пояса сужена.';

  @override
  String get anwBasalConstricted => 'Базальная зона зрачкового пояса сужена.';

  @override
  String get anwFrontalBasalConstricted =>
      'Фронтальная и базальная зоны зрачкового пояса сужены.';

  @override
  String get helpTitle => 'Справка и руководство пользователя';

  @override
  String get helpTabQuickStart => 'Быстрый старт';

  @override
  String get helpTabCnriAnalysis => 'Анализ CNRI';

  @override
  String get helpTabShortcuts => 'Горячие клавиши';

  @override
  String get helpTabTroubleshooting => 'Устранение неполадок';

  @override
  String get helpOnlineDocs => 'Онлайн-документация';

  @override
  String get helpContactSupport => 'Связаться с поддержкой';

  @override
  String get helpGettingStarted => 'Начало работы';

  @override
  String get helpStep1Title => 'Подключите ирископ';

  @override
  String get helpStep1Desc =>
      'Подключите Dino-Lite или совместимый USB-ирископ.';

  @override
  String get helpStep2Title => 'Введите данные пациента';

  @override
  String get helpStep2Desc =>
      'Укажите имя, возраст, пол и основные жалобы пациента.';

  @override
  String get helpStep3Title => 'Снимите правый глаз (OD)';

  @override
  String get helpStep3Desc =>
      'Расположите ирископ и сделайте снимок правого глаза.';

  @override
  String get helpStep4Title => 'Снимите левый глаз (OS)';

  @override
  String get helpStep4Desc =>
      'Повторите процедуру для левого глаза с одинаковым освещением.';

  @override
  String get helpStep5Title => 'Просмотрите анализ';

  @override
  String get helpStep5Desc =>
      'Приложение анализирует соотношение зрачок/радужка, форму зрачка и характеристики АНК.';

  @override
  String get helpStep6Title => 'Экспортируйте отчёт';

  @override
  String get helpStep6Desc => 'Сохраните в формате PDF, TXT или JSON.';

  @override
  String get helpTipBestResults =>
      'Для лучших результатов: используйте равномерное освещение и держите ирископ на расстоянии 2–3 см от глаза.';

  @override
  String get helpCnriProtocolFeatures => 'Функции протокола CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Соотношение зрачок/радужка (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Норма: 20–30%. Значения за пределами нормы могут указывать на вегетативный дисбаланс.';

  @override
  String get helpFeaturePupilFormTitle => 'Анализ формы зрачка';

  @override
  String get helpFeaturePupilFormDesc =>
      'Выявляет овальные паттерны, направление децентрации и эксцентриситет.';

  @override
  String get helpFeatureAnwTitle => 'Оценка АНК (коллоретты)';

  @override
  String get helpFeatureAnwDesc =>
      'Анализирует соотношение, регулярность формы, смещения секторов и тонус.';

  @override
  String get helpFeatureZoneTitle => 'Зональный анализ';

  @override
  String get helpFeatureZoneDesc =>
      'Сопоставляет уплощения/выпячивания с зонами органов по CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Двустороннее сравнение';

  @override
  String get helpFeatureBilateralDesc =>
      'Сравнивает OD и OS для выявления асимметрий.';

  @override
  String get helpFeatureMlTitle => 'Сравнение ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'Модель ONNX CNN предоставляет дополнительные измерения для сравнения.';

  @override
  String get helpKeyboardShortcuts => 'Горячие клавиши';

  @override
  String get helpCameraControls => 'Управление камерой';

  @override
  String get helpShortcutSpace => 'Сделать снимок';

  @override
  String get helpShortcutCtrlS => 'Сохранить PDF-отчёт';

  @override
  String get helpShortcutCtrlO => 'Открыть изображение из галереи';

  @override
  String get helpShortcutCtrlH => 'Просмотреть историю сканирований';

  @override
  String get helpShortcutF11 => 'Полноэкранный режим';

  @override
  String get helpShortcutEsc => 'Назад / Отмена';

  @override
  String get helpShortcutScroll => 'Увеличение/уменьшение';

  @override
  String get helpShortcutDoubleClick => 'Сбросить масштаб';

  @override
  String get helpCommonIssues => 'Частые проблемы';

  @override
  String get helpIssueCameraNotDetected => 'Камера не обнаружена';

  @override
  String get helpIssueCameraSolution1 => 'Проверьте USB-подключение';

  @override
  String get helpIssueCameraSolution2 => 'Попробуйте другой USB-порт';

  @override
  String get helpIssueCameraSolution3 => 'Установите драйверы Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Перезапустите приложение';

  @override
  String get helpIssuePupilDetectionFails => 'Ошибка обнаружения зрачка';

  @override
  String get helpIssuePupilSolution1 => 'Обеспечьте достаточное освещение';

  @override
  String get helpIssuePupilSolution2 => 'Разместите зрачок в центре кадра';

  @override
  String get helpIssuePupilSolution3 => 'Протрите объектив ирископа';

  @override
  String get helpIssuePupilSolution4 => 'Настройте фокус вручную';

  @override
  String get helpIssuePdfExportFails => 'Ошибка экспорта PDF';

  @override
  String get helpIssuePdfSolution1 => 'Проверьте права доступа к папке';

  @override
  String get helpIssuePdfSolution2 =>
      'Убедитесь в наличии свободного места на диске';

  @override
  String get helpIssuePdfSolution3 => 'Закройте открытые PDF-файлы';

  @override
  String get helpIssuePdfSolution4 => 'Сначала попробуйте экспорт в TXT';

  @override
  String get helpCaptureChecklistTitle => 'Контрольный список съёмки';

  @override
  String get helpCaptureChecklist1 =>
      'Держите зрачок по центру и полностью в кадре.';

  @override
  String get helpCaptureChecklist2 =>
      'Используйте равномерное освещение и уменьшайте блики на роговице.';

  @override
  String get helpCaptureChecklist3 =>
      'Сохраняйте одинаковое расстояние ирископа для правого и левого глаза.';

  @override
  String get helpCaptureChecklist4 =>
      'Перефокусируйтесь или переснимите, если край зрачка выглядит нечётким.';

  @override
  String get helpExportSettingsTitle => 'Настройки экспорта';

  @override
  String get helpExportSettingsDesc =>
      'Автосохранение PDF сохраняет отчёт после анализа; параметр «Включить изображения» управляет наличием фотографий глаз в PDF; «Показать сравнение ML» добавляет значения сравнения ONNX CNN в отчёты.';

  @override
  String get helpHybridScoreTitle => 'Гибридная достоверность и оценка';

  @override
  String get helpHybridScoreDesc =>
      'Отображаемая достоверность и оценка объединяют качество классической геометрии и согласованность ML, отражая надёжность измерений, а не диагноз.';

  @override
  String get helpAnomalyGuideTitle => 'Интерпретация уплощений и выпячиваний';

  @override
  String get helpAnomalyGuideDesc =>
      'Уплощения указывают на относительное втяжение, а выпячивания — на выбухание вдоль границы зрачка; каждая карточка содержит зону, величину и сопоставленную ассоциацию.';

  @override
  String get helpZoneOverlayGuideTitle => 'Наложение зон';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Используйте наложение зон для визуального осмотра позиций секторов и сверки расположения выявленных аномалий вокруг зрачка и радужки.';

  @override
  String get helpContactSupportTip =>
      'Для получения помощи обратитесь по адресу helpdesk@cnri.edu.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsCameraIriscope => 'КАМЕРА / ИРИСКОП';

  @override
  String get settingsPreferredCamera => 'Предпочтительная камера:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB-камера';

  @override
  String get settingsCameraAutoDetect => 'Автоопределение';

  @override
  String get settingsDefaultZoom => 'Масштаб по умолчанию:';

  @override
  String get settingsAnalysis => 'АНАЛИЗ';

  @override
  String get settingsShowMlComparison => 'Показывать сравнение ML';

  @override
  String get settingsShowZoneOverlay => 'Показывать наложение зон';

  @override
  String get settingsExportReports => 'ЭКСПОРТ И ОТЧЁТЫ';

  @override
  String get settingsAutoSavePdf => 'Автосохранение PDF';

  @override
  String get settingsIncludeImages => 'Включать изображения';

  @override
  String get settingsSaved => 'Настройки сохранены';

  @override
  String get aboutResearchEdition => 'Исследовательская версия';

  @override
  String aboutVersion(String version) {
    return 'Версия $version';
  }

  @override
  String get aboutLicense => 'Лицензия';

  @override
  String get aboutLicensedTo => 'Лицензировано для:';

  @override
  String get aboutExpires => 'Истекает:';

  @override
  String get aboutManageLicense => 'Управление лицензией';

  @override
  String get aboutBasedOnCnri => 'На основе протокола CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Веб-сайт';

  @override
  String get aboutPrivacy => 'Конфиденциальность';

  @override
  String get languageSelectTitle => 'Выбор языка';

  @override
  String get selectLanguage => 'Выбор языка';

  @override
  String get languageChanged => 'Язык изменён';

  @override
  String languageChangedMessage(String language) {
    return 'Язык приложения установлен: $language';
  }

  @override
  String get languageSystemNotAvailable => 'Языковая система недоступна';

  @override
  String get licenseLoading => 'Загрузка...';

  @override
  String get licenseWelcome => 'Добро пожаловать в PupilMetrics!';

  @override
  String get licenseTrialFeatures =>
      '14-дневная бесплатная пробная версия • Полный функционал';

  @override
  String get licenseStartTrial => 'Начать пробный период';

  @override
  String get licenseEnterKey => 'Ввести лицензию';

  @override
  String get licenseFreeTrial => 'Бесплатная пробная версия';

  @override
  String licenseDaysRemaining(int count) {
    return 'Осталось дней: $count';
  }

  @override
  String get licenseTrialEnded => 'Пробный период завершён';

  @override
  String get licenseEnterToContinue => 'Введите лицензию для продолжения';

  @override
  String get licenseStandard => 'Стандартная лицензия';

  @override
  String get licenseProfessional => 'Профессиональная лицензия';

  @override
  String get licenseEnterprise => 'Корпоративная лицензия';

  @override
  String get licenseLicensed => 'Лицензировано';

  @override
  String get licenseActive => 'Активна';

  @override
  String get licenseTrialUser => 'Пробный пользователь';

  @override
  String get licenseLifetime => 'Бессрочная';

  @override
  String get licenseNotSetUp => 'Не настроена';

  @override
  String get trialExpiredTitle => 'Пробный период завершён';

  @override
  String get trialExpiredMessage =>
      'Ваш 14-дневный пробный период истёк. Для продолжения анализа снимков радужки приобретите лицензию.';

  @override
  String get trialExpiredCanStill => 'Вы по-прежнему можете:';

  @override
  String get trialExpiredViewAnalyses => 'Просматривать предыдущие анализы';

  @override
  String get trialExpiredExportReports => 'Экспортировать существующие отчёты';

  @override
  String get trialExpiredAccessHistory =>
      'Получить доступ к истории сканирований';

  @override
  String get trialExpiredMaybeLater => 'Позже';

  @override
  String get licenseRegistration => 'Регистрация лицензии';

  @override
  String get licenseStatusValid => 'Действительна';

  @override
  String get licenseStatusTrialActive => 'Бесплатная пробная версия';

  @override
  String get licenseStatusTrialExpired => 'Пробный период завершён';

  @override
  String get licenseStatusExpired => 'Лицензия истекла';

  @override
  String get licenseStatusInvalid => 'Недействительная лицензия';

  @override
  String get licenseStatusUnregistered => 'Не настроена';

  @override
  String get licenseStatusMachineMismatch => 'Другой компьютер';

  @override
  String get licenseStatusNetworkError => 'Ошибка подключения';

  @override
  String get licenseEnterKeyTitle => 'Введите лицензионный ключ';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Ваше имя';

  @override
  String get licenseEmailAddress => 'Адрес электронной почты';

  @override
  String get licenseMachineId => 'Идентификатор машины';

  @override
  String get licenseCopyMachineId => 'Копировать идентификатор машины';

  @override
  String get licenseMachineIdCopied =>
      'Идентификатор машины скопирован в буфер обмена';

  @override
  String get licenseValidationKeyRequired =>
      'Пожалуйста, введите лицензионный ключ';

  @override
  String get licenseValidationKeyFormat =>
      'Лицензионный ключ должен содержать 20 символов (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Пожалуйста, введите ваше имя';

  @override
  String get licenseValidationEmailRequired =>
      'Пожалуйста, введите адрес электронной почты';

  @override
  String get licenseValidationEmailInvalid =>
      'Пожалуйста, введите корректный адрес электронной почты';

  @override
  String get licenseActivate => 'Активировать лицензию';

  @override
  String get licenseContinueTrial => 'Продолжить пробный период';

  @override
  String get licenseBuyLicense => 'Купить лицензию';

  @override
  String get licenseNeedHelp => 'Нужна помощь?';

  @override
  String get licenseLicenseAgreement => 'Лицензионное соглашение';

  @override
  String get licenseActivatedSuccess => 'Лицензия успешно активирована!';

  @override
  String get licenseMsgMachineMismatch =>
      'Эта лицензия зарегистрирована на другом компьютере. Используйте исходное устройство или обратитесь в поддержку.';

  @override
  String get licenseMsgTrialEnded =>
      'Ваш бесплатный пробный период завершён. Введите лицензионный ключ для доступа ко всем функциям.';

  @override
  String get licenseMsgExpired =>
      'Срок действия вашей лицензии истёк. Продлите её для продолжения работы.';

  @override
  String get licenseMsgNeedsSetup =>
      'Лицензия требует настройки. Начните бесплатный пробный период или введите лицензионный ключ.';

  @override
  String get licenseMsgCheckFormat =>
      'Проверьте формат лицензионного ключа. Он должен выглядеть так: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Этот лицензионный ключ не распознан. Проверьте ключ и повторите попытку.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Этот ключ уже зарегистрирован на другом компьютере.';

  @override
  String get licenseMsgContactSupport =>
      'Срок действия лицензии истёк. Обратитесь в поддержку для продления.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Лицензия успешно активирована! Спасибо за покупку.';

  @override
  String get licenseMsgUnableToActivate =>
      'Не удалось активировать лицензию. Проверьте подключение к интернету и повторите попытку.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Добро пожаловать! Ваш $days-дневный бесплатный пробный период начался.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Пробный период активен: осталось дней — $days.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Бесплатный пробный период активен';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Лицензия активна — $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Не удалось активировать этот лицензионный ключ.';

  @override
  String get licenseMsgNoLongerValid => 'Лицензия более недействительна.';

  @override
  String get licenseMsgUnableToVerify =>
      'Не удалось проверить этот лицензионный ключ. Обратитесь в поддержку.';

  @override
  String get trialStartedSnackbar => 'Пробный период начат!';

  @override
  String get trialStartedMessage => 'Наслаждайтесь 14 днями полного доступа';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'Режим темы';

  @override
  String get methods => 'МЕТОДЫ';

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
  String get reset => 'сброс';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'прозрачный';

  @override
  String get red => 'красный';

  @override
  String get green => 'зелёный';

  @override
  String get blue => 'синий';

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
  String get set => 'Установить';

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
  String get hidden => 'скрыт';

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
  String get defaultIcon => 'По умолчанию';

  @override
  String get original => 'Оригинал';

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
  String get dragToResizeAreaExample => 'Пример DragToResizeArea';

  @override
  String get closeWindowConfirmation =>
      'Вы уверены, что хотите закрыть это окно?';

  @override
  String get licenseChecking => 'Проверка лицензии...';

  @override
  String get licenseRequiredTitle => 'Требуется лицензия';

  @override
  String get licenseActivateValidMessage =>
      'Активируйте действительную лицензию для продолжения.';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro включает:';

  @override
  String get licenseFeatureUnlimitedAnalysis =>
      'Неограниченный анализ зрачок-коллоретта';

  @override
  String get licenseFeaturePdfReports => 'Создание PDF-отчётов';

  @override
  String get licenseFeatureBilateralComparison => 'Двустороннее сравнение';

  @override
  String get licenseFeatureAnwAnalysis => 'Анализ коллоретты АНК';

  @override
  String get licenseFeatureScanHistory => 'База данных истории сканирований';

  @override
  String get licenseFeatureUpdates => 'Бесплатные обновления в течение 1 года';

  @override
  String get licensePurchase => 'Купить лицензию';

  @override
  String get licenseExitApplication => 'Выйти из приложения';

  @override
  String get windowCompactView => 'Компактный вид';

  @override
  String get windowExpandedView => 'Расширенный вид';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return 'Пробная ($count дн. осталось)';
  }

  @override
  String get licenseNotLicensed => 'Не лицензировано';

  @override
  String get licenseStatusTitle => 'Статус лицензии';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get plrReportTitle => 'Отчёт по анализу ЗПР';

  @override
  String get plrResearchOnlyTitle => 'ТОЛЬКО ДЛЯ ИССЛЕДОВАНИЙ/ОБУЧЕНИЯ';

  @override
  String get plrResearchDisclaimer =>
      'Результаты НЕ являются медицинскими диагнозами. Проконсультируйтесь со специалистом здравоохранения.';

  @override
  String get plrNameLabel => 'Имя';

  @override
  String plrAgeYears(int age) {
    return 'Возраст: $age лет';
  }

  @override
  String get plrTestLabel => 'Тест';

  @override
  String get plrSummaryTitle => 'Сводка ЗПР';

  @override
  String plrGradeValue(String grade) {
    return 'Оценка $grade';
  }

  @override
  String get plrStatusLabel => 'Статус';

  @override
  String get plrDetectedStatus => 'ЗПР ОБНАРУЖЕН';

  @override
  String get plrWeakNotDetectedStatus => 'СЛАБЫЙ/НЕ ОБНАРУЖЕН';

  @override
  String get plrRecoveryTimeLabel => 'Время восстановления';

  @override
  String get plrRecoveryRatioLabel => 'Коэффициент восстановления';

  @override
  String get plrChartDescription =>
      'Визуальное представление реакции зрачка во времени';

  @override
  String plrPiRange(String min, String max) {
    return 'Диапазон P/I: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Мин: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Данные кадров';

  @override
  String get plrTableTime => 'Время';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Фаза';

  @override
  String get plrTableConfidenceShort => 'Дост.';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Успешно: $success | Ошибок: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Латентность: 200–500 мс (время до начала реакции)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Сужение: снижение на 10–30% от исходного уровня';

  @override
  String get plrReferenceVelocityLine => '• Скорость: 1,5–4,0%/сек';

  @override
  String get plrReferenceRecoveryLine =>
      '• Восстановление: >75% возврата к исходному уровню в течение 5 секунд';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Восстановление: >75% возврата к исходному уровню за 5 с';

  @override
  String plrShareSubject(String eye) {
    return 'Отчёт по анализу ЗПР — $eye';
  }

  @override
  String get plrTextReportTitle => 'ОТЧЁТ ПО ВИДЕОАНАЛИЗУ ЗПР';

  @override
  String get plrTextDisclaimerTitle =>
      'ОТКАЗ ОТ ОТВЕТСТВЕННОСТИ: только для исследований/обучения';

  @override
  String get plrTextDisclaimerBody =>
      'Результаты НЕ являются медицинскими диагнозами.';

  @override
  String get plrOverallGradeLabel => 'Общая оценка';

  @override
  String get plrEndOfReport => 'КОНЕЦ ОТЧЁТА';

  @override
  String get zoneOverlay => 'Наложение зон';

  @override
  String get tipDragImage =>
      'Совет: перетащите изображение, чтобы совместить лимб с кольцами наложения.';

  @override
  String get overlayMetrics => 'Метрики наложения';

  @override
  String get piRatioLabel => 'Соотношение P/I:';

  @override
  String get ellipsenessLabel => 'Эллиптичность:';

  @override
  String get decentralizationLabel => 'Децентрализация:';

  @override
  String get detectedFindings => 'Выявленные находки';

  @override
  String get anwCollarette => 'АНК / КОЛЛОРЕТТА';

  @override
  String get observerNotes => 'Заметки наблюдателя';

  @override
  String get observerNotesHint =>
      'Введите клинические наблюдения, результаты зональных находок, паттерны…';

  @override
  String get autoCenter => 'Автоцентрирование';

  @override
  String get anwRing => 'Кольцо АНК';

  @override
  String get axisGrid => 'Оси/Сетка';

  @override
  String get chart => 'График';

  @override
  String get hoverToIdentify =>
      'Наведите курсор или нажмите на зону для идентификации';

  @override
  String get organsMode =>
      'Режим органов — наведите курсор на радужку для идентификации зон';

  @override
  String get mildSizeDiff =>
      'Незначительная разница в размере. Возможно физиологическое различие.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'В пределах нормы для возраста $age ($group)';
  }

  @override
  String get formLabel => 'Форма:';

  @override
  String get flatteningLabel => 'Уплощение:';

  @override
  String get protrusionLabel => 'Выпячивание:';

  @override
  String get decentrationLabel => 'Децентрация:';

  @override
  String get pupilSizeLabel => 'Размер зрачка:';

  @override
  String get anwRatioLabel => 'Соотношение АНК:';

  @override
  String get anwToneLabel => 'Тонус АНК:';

  @override
  String get noMajorODAnomalies => 'Значимых аномалий зрачка OD не выявлено.';

  @override
  String get noMajorOSAnomalies => 'Значимых аномалий зрачка OS не выявлено.';

  @override
  String get anwNotAssessed => 'АНК: не оценивалось';

  @override
  String get manualAlignmentAid =>
      'Вспомогательное выравнивание вручную только для ревизии (после съёмки). Перетащите изображение или воспользуйтесь автоцентрированием.';

  @override
  String get frontalShift => 'С: Фронтальный паттерн смещения.';

  @override
  String get cerebralCirculation =>
      'Исторические исследования по Вельховеру связывали это с паттернами мозгового кровообращения.';

  @override
  String get middleTemporalShift => 'Д: Средне-темпоральный паттерн смещения.';

  @override
  String get respiratoryCardiac =>
      'Исторические исследования по Вельховеру связывали это с дыхательными и сердечными вегетативными паттернами.';

  @override
  String get findings => 'Находки:';

  @override
  String get analysisReportTitle => 'Отчёт по анализу зрачка';

  @override
  String get reportResearchVersion => 'Исследовательская версия';

  @override
  String get reportDisclaimerTitle =>
      'ОТКАЗ ОТ ОТВЕТСТВЕННОСТИ: только для исследований/обучения';

  @override
  String get reportDisclaimerBody =>
      'Результаты являются исследовательскими наблюдениями, а НЕ медицинскими диагнозами.';

  @override
  String get reportPersonInformationTitle => 'Данные пациента';

  @override
  String get reportAgeGroupLabel => 'Возрастная группа';

  @override
  String get reportPupilSizeComparisonTitle => 'Сравнение размеров зрачка';

  @override
  String get reportCaptureDistanceMetricsTitle => 'Метрики дистанции съёмки';

  @override
  String get reportResearchObservationsTitle => 'Исследовательские наблюдения';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Заметки наблюдателя (наложение зон)';

  @override
  String get reportEndOfReport => 'КОНЕЦ ОТЧЁТА';

  @override
  String get reportGradeLabel => 'Оценка';

  @override
  String get reportPupilFormTitle => 'Форма зрачка';

  @override
  String get reportDecentrationTitle => 'Децентрация';

  @override
  String get reportFlatteningsTitle => 'Уплощения';

  @override
  String get reportProtrusionsTitle => 'Выпячивания';

  @override
  String get reportAnwParametersTitle => 'Автономное нервное кольцо (АНК)';

  @override
  String get reportTonicStateLabel => 'Исторический паттерн тонуса';

  @override
  String get reportShiftDetectedTitle => 'Исторический паттерн смещения';

  @override
  String get reportClinicalLabel => 'Историческая заметка';

  @override
  String get reportConstrictionDetectedTitle => 'Обнаружено сужение';

  @override
  String get reportSeverityLabel => 'Степень тяжести';

  @override
  String get reportReferenceValuesTitle =>
      'Референсные значения (исследовательский протокол CNRI)';

  @override
  String get reportMatchLabel => 'Соответствие';

  @override
  String get reportValueLabel => 'Значение';

  @override
  String get reportNormalPupilForm => 'Нормальная форма зрачка';

  @override
  String reportPageXofY(int page, int total) {
    return 'Страница $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Отчёт по анализу зрачка — $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Прилагается отчёт по анализу зрачка пациента $patientName, сформированный $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Ниже нормы для возраста $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Выше нормы для возраста $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Младенец';

  @override
  String get ageGroupChild15 => 'Ребёнок (1–5)';

  @override
  String get ageGroupChild611 => 'Ребёнок (6–11)';

  @override
  String get ageGroupTeen => 'Подросток';

  @override
  String get ageGroupAdult2039 => 'Взрослый (20–39)';

  @override
  String get ageGroupAdult4059 => 'Взрослый (40–59)';

  @override
  String get ageGroupSenior60Plus => 'Пожилой (60+)';

  @override
  String get middleNasalShift => 'Средне-назальный паттерн смещения.';

  @override
  String get upperTemporalShift => 'Верхне-темпоральный паттерн смещения.';

  @override
  String get lowerTemporalShift => 'Нижне-темпоральный паттерн смещения.';

  @override
  String get basalShift => 'Базальный паттерн смещения.';

  @override
  String get vagusStellateAssociation =>
      'Исторические исследования по Вельховеру связывали это с паттернами гипофункции блуждающего нерва или звёздчатого ганглия.';

  @override
  String get venaCavaInferiorAssociation =>
      'Исторические исследования по Вельховеру связывали это с паттернами гемодинамических нарушений нижней полой вены.';

  @override
  String get vertebralArteryAssociation =>
      'Исторические исследования по Вельховеру связывали это с паттернами кровообращения позвоночной артерии.';

  @override
  String get smallPelvisAssociation =>
      'Исторические исследования по Вельховеру связывали это с застойными паттернами малого таза.';

  @override
  String get openZoneOverlay => 'Открыть наложение зон';

  @override
  String get iris => 'Радужка';

  @override
  String get chartOpacity => 'Непрозрачность графика';

  @override
  String get irisSizeNotAvailable => 'Данные о размере радужки недоступны';

  @override
  String get ratio => 'Соотношение';

  @override
  String get reportRefPiRatio => 'Соотношение зрачок/радужка: норма 20–30%';

  @override
  String get reportRefEllipseness => 'Эллиптичность: норма >95%';

  @override
  String get reportRefDecentralization => 'Децентрализация: норма <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Разница размеров зрачка: <2% — норма, 2–4% — незначительная, >4% — значимая';

  @override
  String get enterPatientInfoAnalysis => 'Введите данные пациента → Анализ';

  @override
  String get chooseCaptureMethod => 'Выберите метод съёмки:';

  @override
  String get usbCamera => 'USB-камера';

  @override
  String get selectExistingImage => 'Выбрать существующее изображение';

  @override
  String get detectingCameras => 'Обнаружение камер...';

  @override
  String get retryDetection => 'Повторить обнаружение';

  @override
  String get connectUvcCameraViaUsb => 'Подключите UVC-камеру через USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Убедитесь, что драйверы камеры установлены';

  @override
  String get tapRefreshToDetect => 'Нажмите «Обновить» для обнаружения камер';

  @override
  String get connectUsbCameraToBegin =>
      'Подключите USB-камеру для начала работы';

  @override
  String get noExternalCameraTitle => 'Внешняя камера не обнаружена';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Подключите USB-ирископ и убедитесь, что он подключён';

  @override
  String get languagesAvailable => 'Доступные языки';

  @override
  String get validationChecks => 'Проверки качества:';

  @override
  String get eyeQualityTip =>
      'Совет: обеспечьте хорошее освещение и держите глаз неподвижным';

  @override
  String get validatingEye => 'Проверка изображения глаза...';

  @override
  String get initializing => 'Инициализация...';

  @override
  String get nameLabel => 'Имя:';

  @override
  String get ageLabel => 'Возраст:';

  @override
  String get typeLabel => 'Тип:';

  @override
  String get pleaseEnterName => 'Введите имя';

  @override
  String get pleaseEnterAge => 'Введите возраст';

  @override
  String get ageMustBe2Digits => 'Возраст должен содержать 1 или 2 цифры';

  @override
  String get optional => '(Необязательно)';

  @override
  String get bilateralBothHands => 'Двустороннее использование обеих рук';

  @override
  String get zoom => 'Масштаб';

  @override
  String get zoomSliderTip =>
      'Используйте ползунок масштаба справа для регулировки увеличения перед записью.';

  @override
  String get aboutProgramDeveloper =>
      'Разработчик программы — Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Размер графика';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Непрозрачность графика (0 = только при наведении / режим органов)';

  @override
  String get anwLabel => 'АНК';

  @override
  String get doneAndGoBack => 'Готово и назад';

  @override
  String get errorImageShape =>
      'Неверная форма изображения — убедитесь, что глаз заполняет кадр';

  @override
  String get cameraConnected => 'Камера подключена';

  @override
  String get cameraDisconnected => 'Камера отключена';

  @override
  String get cameraPermissionDenied => 'Доступ к камере запрещён';

  @override
  String get cameraFailedInit => 'Не удалось инициализировать камеру';

  @override
  String get cameraInUse => 'Камера используется другим приложением';

  @override
  String get cameraFormatNotSupported => 'Формат камеры не поддерживается';

  @override
  String get capturedImageNotFound => 'Файл снятого изображения не найден';

  @override
  String get failedToCaptureImage => 'Не удалось сделать снимок';

  @override
  String get gradeA => 'А';

  @override
  String get gradeB => 'Б';

  @override
  String get gradeC => 'В';

  @override
  String get gradeD => 'Г';

  @override
  String get cameraErrorOccurred => 'Произошла ошибка камеры';

  @override
  String get connectingToUsbIriscope => 'Подключение к USB-ирископу...';

  @override
  String get noCamerasDetectedMessage =>
      'Камеры не обнаружены. Убедитесь, что USB-камера подключена и распознана системой.';

  @override
  String get failedToAccessCameras => 'Не удалось получить доступ к камерам';

  @override
  String get notAnEyeImageTitle => 'Не изображение глаза';

  @override
  String get notAnEyeImageBody =>
      'Выбранное изображение не похоже на глаз.\n\nПожалуйста, выберите чёткое фото радужки/зрачка и попробуйте снова.';

  @override
  String get notAnEyeImageBodyCapture =>
      'Снятое изображение не похоже на глаз.\n\nПожалуйста, установите ирископ прямо над глазом и сделайте снимок повторно.';

  @override
  String get anisocoriaObservationSymmetrical => 'Симметрично';

  @override
  String get anisocoriaObservationSlight => 'Незначительное различие';

  @override
  String get anisocoriaObservationModerate => 'Умеренное различие';

  @override
  String get anisocoriaObservationMarked => 'Значительное различие';

  @override
  String get settingsNaturalMedicineSection => 'Натуральная Медицина';

  @override
  String get settingsHerbalToggle =>
      'Фитотерапевтические рекомендации (на основе зон радужки)';

  @override
  String get settingsNutritionToggle =>
      'Питание по диете 7 цветов (на основе зон радужки)';

  @override
  String get settingsChiropracticToggle => 'Хиропрактика / Оценка позвоночника';

  @override
  String get settingsTcmToggle => 'Традиционная китайская медицина (ТКМ)';

  @override
  String get therapyHerbalTitle => 'Фитотерапевтические рекомендации';

  @override
  String get therapyHerbalSubtitle =>
      'Результаты зон радужки — отсортированы по весу доказательств';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count ссылок';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'Фитотерапевтические рекомендации предоставляются исключительно в образовательных целях. Перед применением проконсультируйтесь с квалифицированным специалистом здравоохранения.';

  @override
  String get therapyNutritionTitle => 'Питание по диете 7 цветов';

  @override
  String get therapyNutritionSubtitle =>
      'Продукты и питательные вещества для органов зон радужки';

  @override
  String get therapyNutritionFoodsByColor => 'Рекомендуемые продукты по цвету';

  @override
  String get therapyNutritionKeyNutrients => 'Ключевые питательные вещества';

  @override
  String get therapyNutritionHerbs => 'Поддерживающие травы и специи';

  @override
  String get therapyNutritionNotes => 'Питательные заметки';

  @override
  String get therapyNutritionTonifying => 'Тонизирующие продукты:';

  @override
  String get therapyNutritionAvoid => 'Минимизировать / избегать:';

  @override
  String get therapyNutritionDisclaimer =>
      'Рекомендации по питанию основаны на системе диеты 7 цветов и предоставляются исключительно в образовательных целях. Перед изменением диеты проконсультируйтесь со специалистом.';

  @override
  String get therapyChiroTitle => 'Хиропрактическая оценка';

  @override
  String get therapyChiroSubtitle =>
      'Позвоночные сегменты, указанные результатами зон радужки';

  @override
  String get therapyChiroVertebrae => 'Позвонки';

  @override
  String get therapyChiroNerveRoots => 'Нервные корешки';

  @override
  String get therapyChiroInnervated => 'Иннервируемые структуры';

  @override
  String get therapyChiroSubluxation => 'Возможные признаки подвывиха';

  @override
  String get therapyChiroMuscles => 'Часто затрагиваемые мышцы';

  @override
  String get therapyChiroAdjusting => 'Хиропрактический подход к коррекции';

  @override
  String get therapyChiroExercises => 'Домашние упражнения и растяжки';

  @override
  String get therapyChiroPostural => 'Постуральная заметка';

  @override
  String get therapyChiroDisclaimer =>
      'Хиропрактическая информация предоставляется в образовательных целях. Для диагностики и лечения обратитесь к лицензированному хиропрактику.';

  @override
  String get therapyTcmTitle => 'Традиционная китайская медицина';

  @override
  String get therapyTcmSubtitle => 'Меридиан · Часы органов · Пять элементов';

  @override
  String get therapyTcmMeridianFunctions => 'Функции меридиана';

  @override
  String get therapyTcmGoverns => 'Управляет';

  @override
  String get therapyTcmPatterns => 'Паттерны дисбаланса';

  @override
  String get therapyTcmSymptoms => 'Симптомы';

  @override
  String get therapyTcmFormulas => 'Классические формулы';

  @override
  String get therapyTcmKeyPoints => 'Ключевые точки для этого паттерна';

  @override
  String get therapyTcmAcupoints => 'Ключевые точки акупрессуры';

  @override
  String get therapyTcmDiet => 'Диетотерапия ТКМ';

  @override
  String get therapyTcmTonifying => 'Тонизирующие продукты:';

  @override
  String get therapyTcmAvoid => 'Минимизировать / избегать:';

  @override
  String get therapyTcmDisclaimer =>
      'Информация ТКМ предоставляется в образовательных целях. Обратитесь к лицензированному акупунктуристу или практикующему врачу ТКМ.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'Значимых результатов зон радужки для формирования рекомендаций не обнаружено.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'Сезон';

  @override
  String get therapyClimateLabel => 'Климат';

  @override
  String get therapyEmotionLabel => 'Эмоция';

  @override
  String get therapyTasteLabel => 'Вкус';

  @override
  String get therapyNatureLabel => 'Природа';

  @override
  String therapyPairedOrgan(String organ) {
    return 'пара: $organ';
  }

  @override
  String get bothEyesCapturedTitle => 'Оба глаза сфотографированы';

  @override
  String get constitutionalType => 'Конституциональный тип';

  @override
  String get constitutionalTypeOptional =>
      'Конституциональный тип (необязательно)';

  @override
  String get selectConstitutionalType => 'Выберите конституциональный тип…';

  @override
  String get constitutionalTypeNone => 'Нет (не оценивалось)';

  @override
  String get constitutionalIridology => 'Конституциональная иридология';

  @override
  String get constitutionalIrisDescription => 'Описание радужки';

  @override
  String get constitutionalPredispositions =>
      'Предрасположенности к заболеваниям';

  @override
  String get constitutionalHomeopathicRemedies => 'Гомеопатические средства';

  @override
  String get constitutionalTypeBy =>
      'На основе конституциональной иридологии д-ра Йозефа Дека';

  @override
  String get addFinding => 'Добавить находку';

  @override
  String get anomalyType => 'Тип аномалии';

  @override
  String get anomalySubtype => 'Подтип';

  @override
  String get anomalyConclusion => 'Заключение';

  @override
  String get selectAnomalyType => 'Выбрать тип…';

  @override
  String get addToNotes => 'Добавить в заметки';
}
