// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'CNRI Captura Ocular';

  @override
  String get analyzeButton => 'Analizar';

  @override
  String get plrModes => 'Modos PLR';

  @override
  String get captureInstructions => 'Posicione el ojo dentro del círculo guía';

  @override
  String get scanHistory => 'Historial de Escaneos';

  @override
  String get selectCameraMode => 'Seleccionar Modo de Cámara';

  @override
  String get loadFromGallery => 'Cargar desde Galería';

  @override
  String get rightEyePhoto => 'Foto del Ojo Derecho';

  @override
  String get leftEyePhoto => 'Foto del Ojo Izquierdo';

  @override
  String get autoCapture => 'Captura Automática';

  @override
  String get autoCaptureDesc =>
      'Detección ocular + captura automática de 5 segundos';

  @override
  String get manualCapture => 'Captura Manual';

  @override
  String get manualCaptureDesc =>
      'Detección ocular + captura manual (cámara trasera)';

  @override
  String get selfieMode => 'Modo Selfie';

  @override
  String get selfieModeDesc =>
      'Detección ocular + captura automática de 5 seg (cámara frontal)';

  @override
  String get plrVideoRear => 'Video PLR (Trasera)';

  @override
  String get plrVideoRearDesc => 'Cámara trasera • captura de 10 seg';

  @override
  String get plrVideoSelfie => 'Video PLR (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Cámara frontal • captura de 10 seg';

  @override
  String get plrVideoCapture => 'Captura de Video PLR';

  @override
  String get frontCamera => 'Cámara Frontal';

  @override
  String get rearCamera => 'Cámara Trasera';

  @override
  String get selectEyeToAssess => 'Seleccione qué ojo evaluar';

  @override
  String get rightEyeOD => 'Ojo Derecho (OD)';

  @override
  String get leftEyeOS => 'Ojo Izquierdo (OS)';

  @override
  String get recordPlrRightEye => 'Grabar PLR del ojo derecho';

  @override
  String get recordPlrLeftEye => 'Grabar PLR del ojo izquierdo';

  @override
  String get loadRightEyeImage => 'Cargar imagen del ojo derecho';

  @override
  String get loadLeftEyeImage => 'Cargar imagen del ojo izquierdo';

  @override
  String get bothEyes => 'Ambos Ojos';

  @override
  String get loadBothEyesDesc => 'Cargar ojo derecho, luego izquierdo';

  @override
  String get selectEyeImageFromDevice =>
      'Seleccione una imagen ocular de su dispositivo';

  @override
  String get selectRightEyeFirst =>
      'Seleccione primero la imagen del ojo DERECHO (OD)';

  @override
  String get rightEyeSaved =>
      'Ojo derecho guardado. Ahora seleccione la imagen del ojo IZQUIERDO (OS)';

  @override
  String get cancelledNoRightEye => 'Cancelado - no se seleccionó ojo derecho';

  @override
  String get cancelledNoLeftEye => 'Cancelado - no se seleccionó ojo izquierdo';

  @override
  String errorLoadingImages(String error) {
    return 'Error al cargar imágenes: $error';
  }

  @override
  String get crop43 => 'Recortar (4:3)';

  @override
  String get success => 'Éxito';

  @override
  String get imageCroppedSuccess => '¡Imagen recortada exitosamente!';

  @override
  String get error => 'Error';

  @override
  String get cropFailed =>
      'Error al recortar imagen. Por favor intente de nuevo.';

  @override
  String get crop => 'Recortar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get saved => '¡Guardado! ✅';

  @override
  String get imageSavedToGallery =>
      'Imagen guardada exitosamente en la galería';

  @override
  String get exposure => 'Exposición';

  @override
  String get flash => 'Flash';

  @override
  String get eye => 'Ojo';

  @override
  String get center => 'centro';

  @override
  String get light => 'Luz';

  @override
  String get ready => 'Listo';

  @override
  String get on => 'SÍ';

  @override
  String get off => 'NO';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUAL';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPILA';

  @override
  String get plrHistory => 'Historial PLR';

  @override
  String get searchByName => 'Buscar por nombre...';

  @override
  String get totalScans => 'Total Escaneos';

  @override
  String get thisWeek => 'Esta Semana';

  @override
  String get patients => 'Pacientes';

  @override
  String get detected => 'Detectado';

  @override
  String get noPlrRecordsYet => 'Sin registros PLR aún';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Grabe un video PLR para ver el historial aquí';

  @override
  String get deleteRecord => '¿Eliminar Registro?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return '¿Eliminar análisis PLR de $name ($eye)?\n\nEsto no se puede deshacer.';
  }

  @override
  String get delete => 'Eliminar';

  @override
  String get recordDeleted => 'Registro eliminado';

  @override
  String plrAnalysis(String eye) {
    return 'Análisis PLR - $eye';
  }

  @override
  String get patient => 'Paciente';

  @override
  String get date => 'Fecha';

  @override
  String get frames => 'Cuadros';

  @override
  String get baselinePiRatio => 'P/I Base';

  @override
  String get minPiRatio => 'P/I Mín';

  @override
  String get plrMagnitude => 'Magnitud PLR';

  @override
  String get constriction => 'Constricción';

  @override
  String get plrDetected => 'PLR Detectado';

  @override
  String get confidence => 'Confianza';

  @override
  String get grade => 'Grado';

  @override
  String get close => 'cerrar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get na => 'N/D';

  @override
  String get takeLeftEyePhoto => 'Tomar Foto del Ojo Izquierdo';

  @override
  String get takeRightEyePhoto => 'Tomar Foto del Ojo Derecho';

  @override
  String get nowTakingLeftEye => 'Ahora tomando ojo IZQUIERDO (OS)';

  @override
  String get startingWithRightEye => 'Comenzando con ojo DERECHO (OD)';

  @override
  String get captured => 'Capturado ✓';

  @override
  String get useSameDistanceLighting =>
      'Use la misma distancia e iluminación que el ojo derecho para una comparación precisa.';

  @override
  String get step1of2 => 'Paso 1 de 2';

  @override
  String get step2of2 => 'Paso 2 de 2';

  @override
  String get bothEyesCaptured => 'Ambos ojos capturados ✓';

  @override
  String get continueToLeftEye => 'Continuar al Ojo Izquierdo';

  @override
  String get retakeOD => 'Repetir OD';

  @override
  String get retakeOS => 'Repetir OS';

  @override
  String get retakeRightEye => 'Repetir Ojo Derecho';

  @override
  String get analyzeBothEyes => 'Analizar Ambos Ojos';

  @override
  String get patientInfoMissing => 'Falta Info del Paciente';

  @override
  String get rightEyePhotoMissing => '¡Falta foto del ojo derecho!';

  @override
  String get patientInfoMissingRestart =>
      'Falta información del paciente. Por favor reinicie.';

  @override
  String get exitApp => 'Salir de la App';

  @override
  String get tipsForBestResults => 'CONSEJOS PARA MEJORES RESULTADOS';

  @override
  String get followGuidelinesForQuality =>
      'Siga estas pautas para una calidad de imagen óptima';

  @override
  String get cameraDistance => 'Distancia de la Cámara';

  @override
  String get cameraDistanceDesc =>
      'Mantenga la cámara a 10-15 cm de su ojo. Mantenga la misma distancia para ambos ojos.';

  @override
  String get lightingPosition => 'Posición de la Luz';

  @override
  String get lightingPositionDesc =>
      'Posicione la fuente de luz dentro o fuera de los bordes de la pupila. Intente mirar hacia el flash de la cámara.';

  @override
  String get avoidReflections => 'Evite Reflejos';

  @override
  String get avoidReflectionsDesc =>
      'Reduzca los reflejos evitando el resplandor de ventanas, espejos y lámparas directas.';

  @override
  String get centerYourEye => 'Centre Su Ojo';

  @override
  String get centerYourEyeDesc =>
      'Asegúrese de que todo el ojo, incluyendo la esclerótica (parte blanca), esté centrado y llene el encuadre.';

  @override
  String get cropProperly => 'Recorte Correctamente';

  @override
  String get cropProperlyDesc =>
      'Recorte la imagen con el ojo en el centro. La imagen se guardará automáticamente en proporción 4:3.';

  @override
  String get importantInformation => 'Información Importante';

  @override
  String get imageRatio43 =>
      'Proporción de imagen 4:3 para estándar de imágenes médicas';

  @override
  String get forClinicalUseCnri => 'Para uso clínico con CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'No proporciona diagnóstico médico';

  @override
  String get eyeWideOpenClear =>
      'Asegúrese de que su ojo esté bien abierto y la imagen sea clara';

  @override
  String get personalInfo => 'Información Personal';

  @override
  String get personInformation => 'Información de la Persona';

  @override
  String get enterPersonDetails => 'Ingrese los Datos de la Persona';

  @override
  String get infoIncludedInReport =>
      'Esta información se incluirá en el informe de análisis';

  @override
  String get fullName => 'Nombre Completo';

  @override
  String get enterPersonName => 'Ingrese el nombre de la persona';

  @override
  String get nameRequired => 'El nombre es requerido';

  @override
  String get sex => 'Sexo';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get ageYears => 'Edad (años)';

  @override
  String get enterAge => 'Ingrese la edad';

  @override
  String get ageRequired => 'La edad es requerida';

  @override
  String get enterValidNumber => 'Ingrese un número válido';

  @override
  String get enterValidAge => 'Ingrese una edad válida (0-120)';

  @override
  String get mainComplaints => 'Quejas Principales';

  @override
  String get mainComplaintsOptional => 'Quejas Principales (opcional)';

  @override
  String get complaintsHint =>
      'ej., dolores de cabeza, problemas de visión, fatiga...';

  @override
  String get continueToCaptire => 'Continuar a Captura';

  @override
  String get ageImportantNote =>
      'La edad es importante para una evaluación precisa del tamaño de la pupila, ya que los rangos normales varían según la edad.';

  @override
  String get submit => 'Enviar';

  @override
  String get pleaseSelectGender => '¡Por favor seleccione el género!';

  @override
  String get applicationSubmitted =>
      'Su solicitud ha sido enviada exitosamente.';

  @override
  String get type => 'Tipo:';

  @override
  String get gender => 'Género:';

  @override
  String get rightHanded => 'Diestro';

  @override
  String get leftHanded => 'Zurdo';

  @override
  String get partialLeftHandedness => 'Zurdería parcial';

  @override
  String get retrainedLeftHandedness => 'Zurdería reentrenada';

  @override
  String get bilateralUseBothHands => 'Uso bilateral de ambas manos';

  @override
  String get splashTitle => 'PupilMetrics Captura Ocular';

  @override
  String get splashDeveloper =>
      'Desarrollador del Programa - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool =>
      'Herramienta de Investigación/Educación';

  @override
  String get startNewAnalysis => 'Iniciar Nuevo Análisis';

  @override
  String get viewHistory => 'Ver Historial';

  @override
  String get viewResearchDisclaimer => 'Ver Aviso de Investigación';

  @override
  String get researchDisclaimerTitle =>
      'Herramienta de Investigación/Educación';

  @override
  String get researchDisclaimerNotMedical => 'NO es un dispositivo médico';

  @override
  String get researchDisclaimerNotClinical => 'NO es para diagnóstico clínico';

  @override
  String get researchDisclaimerResults =>
      'Los resultados son observaciones de investigación';

  @override
  String get researchDisclaimerConsult =>
      'Siempre consulte a profesionales de la salud';

  @override
  String get researchDisclaimerAcknowledge =>
      'Al continuar, usted reconoce que esta es una herramienta de investigación y no debe usarse para decisiones médicas.';

  @override
  String get researchDisclaimerWarning =>
      'Esta aplicación es SOLO para propósitos de INVESTIGACIÓN y EDUCACIÓN.';

  @override
  String get iUnderstand => 'Entiendo';

  @override
  String get plrAnalysisTest => 'Prueba de Análisis PLR';

  @override
  String get checkingVideoFile => 'Verificando archivo de video...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Procesando cuadro $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => '¡Análisis completo!';

  @override
  String get errorVideoNotFound => 'Error: Archivo de video no encontrado';

  @override
  String get waitingForResults => 'Esperando resultados...';

  @override
  String get baseline => 'Base';

  @override
  String get flashPhase => 'Flash';

  @override
  String get constrictionPhase => 'Contracción';

  @override
  String get recovery => 'Recuperación';

  @override
  String get plrDetectedExclaim => '¡PLR DETECTADO!';

  @override
  String get plrWeakNotDetected => 'PLR Débil/No Detectado';

  @override
  String get min => 'Mín';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => 'Constr.';

  @override
  String get saveToHistory => 'Guardar en Historial';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Guardar Cuadros';

  @override
  String get share => 'Compartir';

  @override
  String get frameSavedToGallery => '¡Cuadro guardado en la galería!';

  @override
  String get failedToSaveFrame => 'Error al guardar cuadro';

  @override
  String framesSavedToGallery(int count) {
    return '¡$count cuadros guardados en la galería!';
  }

  @override
  String get jsonCopiedToClipboard => '¡JSON copiado al portapapeles!';

  @override
  String get reportCopiedToClipboard => '¡Reporte copiado al portapapeles!';

  @override
  String shareFailedError(String error) {
    return 'Error al compartir: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return '¡Guardado en historial! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Error al guardar: $error';
  }

  @override
  String get noSuccessfulFramesToSave => 'No hay cuadros exitosos para guardar';

  @override
  String get saveAllFrames => 'Guardar Todos los Cuadros';

  @override
  String get shareReport => 'Compartir Reporte';

  @override
  String get shareJson => 'Compartir JSON';

  @override
  String get rerunTest => 'Repetir prueba';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'Inicializando cámara...';

  @override
  String usingCamera(String camera) {
    return 'Usando cámara $camera';
  }

  @override
  String cameraError(String error) {
    return 'Error de cámara: $error';
  }

  @override
  String get noCamerasFound => 'No se encontraron cámaras';

  @override
  String get retry => 'Reintentar';

  @override
  String get startPlrRecording => 'Iniciar Grabación PLR';

  @override
  String get stopRecording => 'Detener Grabación';

  @override
  String get phaseReady => 'Listo';

  @override
  String get phaseStarting => 'Iniciando...';

  @override
  String phaseBaseline(int sec) {
    return 'Base (0-${sec}s)';
  }

  @override
  String get phaseFlash => '¡FLASH!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Constricción ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Recuperación ($start-${end}s)';
  }

  @override
  String get phaseComplete => '¡Completo!';

  @override
  String get readyDesc => 'Posicione el ojo en el círculo, luego toque Iniciar';

  @override
  String get holdSteady => 'Mantenga firme...';

  @override
  String get recordingBaselinePupil => 'Grabando tamaño base de la pupila';

  @override
  String lightStimulus(int ms) {
    return 'Estímulo luminoso (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Midiendo constricción pupilar';

  @override
  String get measuringRecovery => 'Midiendo recuperación pupilar';

  @override
  String get plrRecordingComplete => 'Grabación PLR completa';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Posicione el ojo $eye dentro del círculo.\nMantenga firme durante la grabación de $seconds segundos.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Mantenga el ojo firme. El flash ocurrirá a los $sec segundos.';
  }

  @override
  String get recordingComplete => 'Grabación Completa';

  @override
  String get plrVideoCapturedSuccess => '¡Video PLR capturado exitosamente!';

  @override
  String get duration => 'Duración';

  @override
  String get seconds => 'segundos';

  @override
  String get frameRate => 'Tasa de Cuadros';

  @override
  String get camera => 'Cámara';

  @override
  String flashAt(int sec, int ms) {
    return 'A los ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Fases';

  @override
  String get phasesFlow => 'Base → Flash → Constricción → Recuperación';

  @override
  String get expectedNormalValues => 'Valores Normales Esperados:';

  @override
  String get latency => 'Latencia';

  @override
  String get velocity => 'Velocidad';

  @override
  String get testFrameAnalysis => '🧪 Prueba de Análisis de Cuadros';

  @override
  String get retake => 'Repetir';

  @override
  String get done => 'Listo';

  @override
  String get plrVideoModeTitle => 'Modo de Video PLR';

  @override
  String get plrAssessmentTitle =>
      'Evaluación del Reflejo Pupilar a la Luz (PLR)';

  @override
  String get plrInstructions =>
      '1. Posicione el ojo dentro del círculo guía\n2. Toque \"Iniciar Grabación PLR\"\n3. Mantenga firme por 10 segundos\n4. Ocurrirá un flash a los 3 segundos\n5. La app graba la respuesta pupilar';

  @override
  String get recordingPhases => 'Fases de Grabación:';

  @override
  String get baselinePhaseDesc => 'Tamaño inicial de la pupila';

  @override
  String get flashPhaseDesc => 'Estímulo luminoso';

  @override
  String get constrictionPhaseDesc => 'La pupila se contrae';

  @override
  String get recoveryPhaseDesc => 'La pupila regresa';

  @override
  String get normalPlrValues => 'Valores PLR Normales:';

  @override
  String get gotIt => 'Entendido';

  @override
  String get pupilAnalysis => 'Análisis Pupilar';

  @override
  String scansLeft(int count) {
    return '$count restantes';
  }

  @override
  String get validatingRightEye => 'Validando ojo derecho...';

  @override
  String get validatingLeftEye => 'Validando ojo izquierdo...';

  @override
  String get analyzingRightEye => 'Analizando ojo derecho (OD)...';

  @override
  String get analyzingLeftEye => 'Analizando ojo izquierdo (OS)...';

  @override
  String get comparingPupils => 'Comparando pupilas...';

  @override
  String person(String name) {
    return 'Persona: $name';
  }

  @override
  String get invalidEyeImage => 'Imagen Ocular Inválida';

  @override
  String analysisFailed(String error) {
    return 'Análisis fallido: $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'SOLO HERRAMIENTA DE INVESTIGACIÓN/EDUCACIÓN';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Esta aplicación es solo para propósitos de investigación y educación. Los resultados NO son diagnósticos médicos y NO han sido validados para uso clínico. Las asociaciones de patrones provienen de literatura de investigación histórica. Consulte a un profesional de la salud para cualquier preocupación de salud.';

  @override
  String get pupilSizeDifference => 'Diferencia de Tamaño Pupilar Detectada';

  @override
  String get significantPupilSizeDiff =>
      'DIFERENCIA SIGNIFICATIVA DE TAMAÑO PUPILAR';

  @override
  String get diff => 'dif';

  @override
  String get researchObservationConsult =>
      'Observación de investigación - Consulte a un profesional de la salud para interpretación';

  @override
  String get ageBasedResearchBaseline => 'Línea Base de Investigación por Edad';

  @override
  String group(String group) {
    return 'Grupo: $group';
  }

  @override
  String get researchRange => 'Rango de Investigación';

  @override
  String get measuredEst => 'Medido (est.)';

  @override
  String get pupilForm => 'Forma Pupilar';

  @override
  String get decentrationPattern => 'Patrón de Descentración';

  @override
  String get flattenings => 'Aplanamientos';

  @override
  String get protrusions => 'Protuberancias';

  @override
  String zonesCount(int count) {
    return '$count zonas';
  }

  @override
  String get bilateralComparison => 'Comparación Bilateral';

  @override
  String get parameter => 'Parámetro';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Ratio P/I';

  @override
  String get ellipseness => 'Elipticidad';

  @override
  String get circularity => 'Circularidad';

  @override
  String get decentralization => 'Descentración';

  @override
  String get anwRatio => 'Proporción';

  @override
  String get normal => 'normal';

  @override
  String get elliptical => 'Elíptico';

  @override
  String get circular => 'Circular';

  @override
  String get irregular => 'Irregular';

  @override
  String get centered => 'Centrado';

  @override
  String get offset => 'Desplazado';

  @override
  String get miosis => 'Miosis';

  @override
  String get constricted => 'Contraído';

  @override
  String get dilated => 'Dilatado';

  @override
  String get mydriasis => 'Midriasis';

  @override
  String get inner => 'Interior';

  @override
  String get outer => 'Exterior';

  @override
  String get high => 'Alto';

  @override
  String get moderate => 'Moderado';

  @override
  String get savePdf => 'Guardar PDF';

  @override
  String get sharePdf => 'Compartir PDF';

  @override
  String get retakePhotos => 'Repetir Fotos';

  @override
  String scansLeftBanner(int count) {
    return '$count escaneos restantes';
  }

  @override
  String get upgrade => 'Mejorar';

  @override
  String get unlockUnlimited => 'Desbloquear Ilimitado';

  @override
  String get usedAllFreeScans => 'Ha usado todos los escaneos gratuitos.';

  @override
  String get unlimitedScans => 'Escaneos ilimitados';

  @override
  String get pdfReports => 'Reportes PDF';

  @override
  String get scanHistoryFeature => 'Historial de escaneos';

  @override
  String get bilateralAnalysis => 'Análisis bilateral';

  @override
  String get monthly => 'Mensual';

  @override
  String get perMonth => '/mes';

  @override
  String get annual => 'Anual';

  @override
  String get perYear => '/año';

  @override
  String get tenCredits => '10 Créditos';

  @override
  String get oneTime => 'único pago';

  @override
  String get best => 'MEJOR';

  @override
  String get purchaseCancelled => 'Compra cancelada';

  @override
  String purchaseFailed(String error) {
    return 'Compra fallida: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT guardado: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON guardado: $path';
  }

  @override
  String get pdfSaved => '¡PDF Guardado!';

  @override
  String pdfFailed(String error) {
    return 'PDF Fallido: $error';
  }

  @override
  String get open => 'ABRIR';

  @override
  String failed(String error) {
    return 'Fallido: $error';
  }

  @override
  String get staticScans => 'Estático';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => 'Buscar por nombre o quejas...';

  @override
  String get searchPlrRecords => 'Buscar registros PLR...';

  @override
  String get noScansYet => 'Sin escaneos aún';

  @override
  String get completedScansAppearHere =>
      'Los escaneos completados aparecerán aquí';

  @override
  String get deleteScan => '¿Eliminar Escaneo?';

  @override
  String deleteScanConfirm(String name, String date) {
    return '¿Eliminar escaneo de $name del $date?';
  }

  @override
  String get scanDeleted => 'Escaneo eliminado';

  @override
  String get originalImagesNotFound =>
      'Imágenes originales de los ojos no encontradas.';

  @override
  String get viewResults => 'Ver Resultados';

  @override
  String get avgPlr => 'PLR Prom';

  @override
  String get years => 'años';

  @override
  String get anisocoria => 'Anisocoria';

  @override
  String get none => 'Ninguno';

  @override
  String get mild => 'Leve';

  @override
  String get severe => 'Severo';

  @override
  String zoneLabel(String zone) {
    return 'Zona: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Asociado con $organ';
  }

  @override
  String get significant => 'Significativo';

  @override
  String get fair => 'Regular';

  @override
  String get low => 'Bajo';

  @override
  String get good => 'Bueno';

  @override
  String get zones => 'Zonas';

  @override
  String get significanceWithinLimits => 'dentro de límites aceptables';

  @override
  String get significanceMild => 'leve';

  @override
  String get significanceModerate => 'moderado';

  @override
  String get significanceSignificant => 'significativo';

  @override
  String get formTypeCircle => 'Círculo (Normal)';

  @override
  String get formTypeOval => 'Oval';

  @override
  String get formTypeOvalVertical => 'Oval-vertical';

  @override
  String get formTypeOvalHorizontal => 'Oval-horizontal';

  @override
  String get formTypeOvalDiagonal => 'Oval-diagonal';

  @override
  String get formTypeLeftObliqueEllipse => 'Elipse Oblicua Izquierda';

  @override
  String get formTypeUnilateralEllipse => 'Elipse Unilateral';

  @override
  String get formTypeVentralDivergingEllipse => 'Elipse Divergente Ventral';

  @override
  String get formTypeFrontalDivergingEllipse => 'Elipse Divergente Frontal';

  @override
  String get formTypeEllipse => 'Elipse';

  @override
  String get formTypeChord => 'Cuerda';

  @override
  String get formTypeIrregular => 'Irregular';

  @override
  String get pupilFormCircleDesc =>
      'Forma pupilar circular normal. No se detectaron variaciones de patrón.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Patrón oval horizontal. La investigación histórica asoció esto con patrones del sistema nervioso autónomo que afectan las zonas de función respiratoria y glandular.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Patrón oval vertical. La investigación histórica vinculó este patrón con zonas de circulación cerebral en estudios de reflejos autonómicos.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Patrón oval diagonal. La literatura de investigación asoció esto con reflejos de zona urogenital en estudios autonómicos.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Patrón de elipse oblicua izquierda. Las observaciones históricas vincularon esto con zonas autonómicas urogenitales y de extremidades inferiores.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Patrón de elipse unilateral. La investigación indicó asociaciones con zonas autonómicas respiratorias y bronquiales.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Elipse divergente ventral. Los estudios históricos asociaron esto con zonas autonómicas del cuerpo inferior y patrones de función motora.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Elipse divergente frontal. La literatura de investigación vinculó este patrón con zonas autonómicas cerebrales y superiores.';

  @override
  String get pupilFormOvalDesc =>
      'Patrón de deformación oval leve. Monitorear progresión en observaciones de investigación.';

  @override
  String get pupilFormEllipseDesc =>
      'Patrón pupilar elíptico indicando variaciones del sistema autonómico en estudios históricos.';

  @override
  String get pupilFormChordDesc =>
      'Patrón de deformación tipo cuerda indicando influencias autonómicas localizadas en literatura de investigación.';

  @override
  String get pupilFormIrregularDesc =>
      'Forma irregular sugiriendo múltiples influencias de patrones autonómicos basado en observaciones históricas.';

  @override
  String get patternCentered => 'Centrado (Normal)';

  @override
  String get patternFrontal => 'Descentralización frontal';

  @override
  String get patternBasal => 'Descentralización basal';

  @override
  String get patternNasal => 'Descentralización nasal';

  @override
  String get patternTemporal => 'Descentralización temporal';

  @override
  String get patternMiddleNasal => 'Descentralización nasal media';

  @override
  String get patternMiddleTemporal => 'Descentralización temporal media';

  @override
  String get patternUpperNasal => 'Descentralización nasal superior';

  @override
  String get patternUpperTemporal => 'Descentralización temporal superior';

  @override
  String get patternLowerNasal => 'Descentralización nasal inferior';

  @override
  String get patternLowerTemporal => 'Descentralización temporal inferior';

  @override
  String get patternUpwards => 'Descentración - Hacia arriba';

  @override
  String get patternDownwards => 'Descentración - Hacia abajo';

  @override
  String get patternUpwardsInwards => 'Descentración - Arriba-Adentro';

  @override
  String get patternUpwardsOutwards => 'Descentración - Arriba-Afuera';

  @override
  String get decentrationCenteredDesc =>
      'Posicionamiento pupilar normal dentro de límites fisiológicos.';

  @override
  String get decentrationNasalRightDesc =>
      'Patrón nasal (Derecho). La investigación histórica asoció esta zona con reflejos autonómicos pulmonares.';

  @override
  String get decentrationNasalLeftDesc =>
      'Patrón nasal (Izquierdo). La literatura de investigación vinculó esta zona con patrones de función autonómica cardíaca.';

  @override
  String get decentrationTemporalDesc =>
      'Patrón temporal. Las observaciones históricas asociaron esta zona con reflejos autonómicos renales y reproductivos.';

  @override
  String get decentrationFrontalRightDesc =>
      'Patrón frontal (Derecho). La investigación asoció esta zona con patrones de función cognitiva y cerebral.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Patrón frontal (Izquierdo). Los estudios históricos vincularon esta zona con patrones autonómicos cerebrales.';

  @override
  String get decentrationBasalRightDesc =>
      'Patrón basal (Derecho). La investigación indicó asociaciones con reflejos de presión intracraneal.';

  @override
  String get decentrationBasalLeftDesc =>
      'Patrón basal (Izquierdo). Las observaciones históricas vincularon esto con patrones de zona inflamatoria cerebral.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Patrón nasal superior (Derecho). La investigación asoció esta zona con reflejos autonómicos hepatobiliares.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Patrón nasal superior (Izquierdo). Los estudios históricos vincularon esto con zonas esplénicas y diafragmáticas.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Patrón temporal superior. La investigación indicó asociaciones con zonas autonómicas renales y reproductivas.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Patrón nasal medio (Derecho). Las observaciones históricas vincularon esto con zonas de utilización de oxígeno y cardíacas.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Patrón nasal medio (Izquierdo). La investigación asoció esto con patrones autonómicos neurológicos y cardíacos.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Patrón temporal medio (Derecho). La investigación vinculó esto con zonas de regulación autonómica cardíaca.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Patrón temporal medio (Izquierdo). Los estudios históricos asociaron esto con zonas pulmonares y cardíacas.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Patrón nasal superior (Derecho). La investigación indicó asociaciones con zonas cognitivas y reflejos de columna cervical.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Patrón nasal superior (Izquierdo). Las observaciones históricas vincularon esto con patrones cognitivos y zonas cervicales.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Patrón temporal superior (Derecho). La investigación asoció esta zona con reflejos de nervios craneales y auditivos.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Patrón temporal superior (Izquierdo). Los estudios históricos vincularon esto con zonas neurovegetativas y del habla.';

  @override
  String get decentrationLowerNasalDesc =>
      'Patrón nasal inferior. La investigación indicó asociaciones con zonas autonómicas urogenitales y lumbosacras.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Patrón temporal inferior (Derecho). Las observaciones históricas asociaron esto con zonas metabólicas y hepáticas.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Patrón temporal inferior (Izquierdo). La investigación vinculó esto con patrones autonómicos cardíacos y esplénicos.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Patrón asociado con zona central superior. La investigación histórica vinculó esto con reflejos autonómicos de regulación del ánimo y energía.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Patrón asociado con zona temporal superior. La investigación indicó asociaciones con reflejos autonómicos de nervios craneales y auditivos.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Patrón asociado con zona temporal media. Las observaciones históricas vincularon esto con patrones autonómicos respiratorios y cardíacos.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Patrón asociado con zona temporal inferior. La literatura de investigación asoció esto con zonas autonómicas hepáticas y metabólicas.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Patrón asociado con zona basal inferior. Los estudios históricos vincularon esto con reflejos autonómicos renales y de extremidades inferiores.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Patrón asociado con zona nasal inferior. La investigación indicó asociaciones con zonas autonómicas urogenitales y pélvicas.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Patrón asociado con zona nasal media. Las observaciones históricas vincularon esto con patrones autonómicos de utilización de oxígeno y respiratorios.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Patrón asociado con zona nasal superior. La literatura de investigación asoció esto con reflejos autonómicos cognitivos y cervicales.';

  @override
  String get flatteningDefaultRightDesc =>
      'Variación de patrón del sistema nervioso autónomo detectada en esta zona basada en investigación histórica.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Patrón asociado con zona central superior. La investigación histórica vinculó esto con patrones autonómicos de regulación del ánimo y neurológicos.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Patrón asociado con zona temporal superior. La investigación indicó asociaciones con zonas autonómicas neurovegetativas y del habla.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Patrón asociado con zona temporal media. Las observaciones históricas vincularon esto con reflejos autonómicos pulmonares y cardíacos.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Patrón asociado con zona temporal inferior. La literatura de investigación asoció esto con patrones autonómicos cardíacos y esplénicos.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Patrón asociado con zona basal inferior. Los estudios históricos vincularon esto con zonas autonómicas renales y eliminativas.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Patrón asociado con zona nasal inferior. La investigación indicó asociaciones con reflejos autonómicos urogenitales y lumbosacros.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Patrón asociado con zona nasal media. Las observaciones históricas vincularon esto con patrones autonómicos cardíacos y respiratorios.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Patrón asociado con zona nasal superior. La literatura de investigación asoció esto con zonas autonómicas cognitivas y cervicales.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Variación de patrón del sistema nervioso autónomo detectada en esta zona basada en investigación histórica.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Patrón de protrusión en zona central superior. La investigación asoció esto con patrones de hiperactivación simpática afectando zonas cerebrales.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Patrón de protrusión en zona temporal superior. Las observaciones históricas vincularon esto con patrones de hiperactividad del sistema de nervios craneales y auditivo.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Patrón de protrusión en zona temporal media. La investigación indicó asociaciones con patrones simpáticos cardíacos y respiratorios.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Patrón de protrusión en zona temporal inferior. Los estudios históricos vincularon esto con zonas simpáticas hepatobiliares y metabólicas.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Patrón de protrusión en zona basal inferior. La investigación asoció esto con patrones de hiperactividad simpática renal y pélvica.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Patrón de protrusión en zona nasal inferior. Las observaciones históricas vincularon esto con zonas de activación simpática urogenital.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Patrón de protrusión en zona nasal media. La investigación indicó asociaciones con patrones simpáticos gástricos y pancreáticos.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Patrón de protrusión en zona nasal superior. Los estudios históricos vincularon esto con zonas de hiperactivación simpática cognitiva y visual.';

  @override
  String get protrusionDefaultRightDesc =>
      'Patrón de hiperactividad del sistema nervioso simpático detectado en esta zona basado en observaciones de investigación.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Patrón de protrusión en zona central superior. La investigación asoció esto con patrones simpáticos psicomotores y cerebrales.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Patrón de protrusión en zona temporal superior. Las observaciones históricas vincularon esto con zonas de hiperactividad simpática neurovegetativa.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Patrón de protrusión en zona temporal media. La investigación indicó asociaciones con patrones simpáticos pulmonares y cardíacos.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Patrón de protrusión en zona temporal inferior. Los estudios históricos vincularon esto con zonas de activación simpática esplénica y cardíaca.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Patrón de protrusión en zona basal inferior. La investigación asoció esto con patrones de hiperactividad simpática pélvica y renal.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Patrón de protrusión en zona nasal inferior. Las observaciones históricas vincularon esto con zonas de activación simpática lumbosacra.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Patrón de protrusión en zona nasal media. La investigación indicó asociaciones con patrones simpáticos de ansiedad-cardíacos.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Patrón de protrusión en zona nasal superior. Los estudios históricos vincularon esto con zonas de hiperactivación simpática cognitiva y visual.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Patrón de hiperactividad del sistema nervioso simpático detectado en esta zona basado en observaciones de investigación.';

  @override
  String get anisocoriaNone =>
      'Tamaños pupilares dentro de límites normales. No se detectó anisocoria significativa.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisocoria detectada: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'S>D';

  @override
  String get anisocoriaDirectionDS => 'D>S';

  @override
  String get anisocoriaSeverityNone => 'Dentro de límites normales.';

  @override
  String get anisocoriaSeverityMild =>
      'Diferencia leve observada. Puede ser fisiológica.';

  @override
  String get anisocoriaSeverityModerate =>
      'Asimetría moderada. Observación de investigación anotada.';

  @override
  String get anisocoriaSeveritySevere =>
      'Asimetría significativa. Observación de investigación señalada.';

  @override
  String get largerPupilEqual => 'igual';

  @override
  String get largerPupilOS => 'OS (Izquierdo)';

  @override
  String get largerPupilOD => 'OD (Derecho)';

  @override
  String get decentrationWithinLimits => 'Dentro de límites normales.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Desplazamiento: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Central-Superior';

  @override
  String get zoneUpperNasal => 'Nasal-Superior';

  @override
  String get zoneMiddleNasal => 'Nasal-Medio';

  @override
  String get zoneLowerNasal => 'Nasal-Inferior';

  @override
  String get zoneLowerBasal => 'Basal-Inferior';

  @override
  String get zoneLowerTemporal => 'Temporal-Inferior';

  @override
  String get zoneMiddleTemporal => 'Temporal-Medio';

  @override
  String get zoneUpperTemporal => 'Temporal-Superior';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Basal';

  @override
  String get zoneUnknown => 'Desconocido';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Aplanamiento $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Protrusión $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Modo Iriscopio USB';

  @override
  String get iriscopeExternal => 'Iriscopio / Externo';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => 'Usar cámara USB o iriscopio conectado';

  @override
  String get detectedCameras => 'Cámaras Detectadas';

  @override
  String get externalCamera => 'Cámara Externa';

  @override
  String cameraIndex(int index) {
    return 'Cámara $index';
  }

  @override
  String get noExternalCameraDetected =>
      'No se detectó cámara externa.\nConecte un iriscopio USB para habilitar.';

  @override
  String get refresh => 'Actualizar';

  @override
  String get selectCameraSource => 'Seleccionar Fuente de Cámara';

  @override
  String camerasDetected(int count) {
    return '$count cámaras detectadas';
  }

  @override
  String camerasAvailable(int count) {
    return '$count cámaras disponibles';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Cámara Externa $index';
  }

  @override
  String get qualityGatedRear =>
      'Captura automática con control de calidad (cámara trasera)';

  @override
  String get qualityGatedFront =>
      'Captura automática con control de calidad (cámara frontal)';

  @override
  String get usbCameraInfo => 'Info de Cámara USB';

  @override
  String get connected => 'Conectado';

  @override
  String get waiting => 'Esperando...';

  @override
  String get disconnected => 'Desconectado';

  @override
  String get waitingForUsbCamera => 'Esperando Cámara USB';

  @override
  String get connectIriscopePrompt =>
      'Conecte su iriscopio mediante adaptador USB OTG.\nOtorgue permiso cuando se solicite.';

  @override
  String get usbCameraIssue => 'Problema con Cámara USB';

  @override
  String get pleaseConnectIriscope =>
      'Por favor conecte su iriscopio o cámara USB.';

  @override
  String get retryConnection => 'Reintentar Conexión';

  @override
  String get troubleshootingTips => 'Consejos de Solución';

  @override
  String get tipUsbOtgAdapter =>
      'Asegúrese de que el adaptador USB OTG esté correctamente conectado';

  @override
  String get tipUsbHostMode =>
      'Verifique si el dispositivo soporta modo USB Host';

  @override
  String get tipReconnectCamera => 'Intente desconectar y reconectar la cámara';

  @override
  String get tipGrantPermissions => 'Otorgue permisos USB cuando se soliciten';

  @override
  String get tipUnlockDevice =>
      'Algunos dispositivos necesitan estar desbloqueados';

  @override
  String get back => 'Atrás';

  @override
  String get switchEye => 'Cambiar Ojo';

  @override
  String get state => 'Estado';

  @override
  String get status => 'Estado';

  @override
  String get usingFlutterUvcPlugin =>
      'Usando plugin flutter_uvc_camera\npara soporte de dispositivos USB Video Class.';

  @override
  String get initialized => 'Inicializado';

  @override
  String get notReady => 'No Listo';

  @override
  String get captureDistanceMatch => 'Coincidencia de Distancia';

  @override
  String get irisSize => 'Tamaño del Iris';

  @override
  String get distanceMatched => 'Distancia Coincidente';

  @override
  String get distanceMismatch => 'Distancia No Coincide';

  @override
  String get excellentMatch => 'Coincidencia excelente';

  @override
  String get goodMatch => 'Buena coincidencia';

  @override
  String get acceptableMatch => 'Coincidencia aceptable';

  @override
  String get considerRetaking => 'Distancia no coincide - considere repetir';

  @override
  String get qualityReady => '¡Listo! Mantenga firme...';

  @override
  String get qualityTooBlurry => 'Mantenga la cámara firme';

  @override
  String get qualityTooDark => 'Necesita más luz';

  @override
  String get qualityTooBright => 'Demasiado brillante - reduzca la luz';

  @override
  String get qualityNoContrast => 'Ajuste el ángulo de iluminación';

  @override
  String get qualityNoPupil => 'Centre la pupila en el marco';

  @override
  String get qualityNotCentered => 'Mueva el ojo al centro';

  @override
  String get qualityNotAnEye => 'No se detectó ojo';

  @override
  String get qualityProcessing => 'Procesando...';

  @override
  String get distanceMatchedCheck => '✓ Distancia coincidente';

  @override
  String get distanceGoodMatchCheck => '✓ Buena coincidencia';

  @override
  String get distanceSlightlyBack => 'Un poco atrás ↔';

  @override
  String get distanceSlightlyCloser => 'Un poco más cerca ↔';

  @override
  String get distanceAlmostThere => 'Casi listo...';

  @override
  String get distanceMoveBack => 'Muévase atrás ←←';

  @override
  String get distanceMoveCloser => 'Muévase más cerca →→';

  @override
  String get distanceTooClose => '¡Muy cerca! Retroceda';

  @override
  String get distanceTooFar => '¡Muy lejos! Acérquese';

  @override
  String get distanceStabilizing => 'Estabilizando...';

  @override
  String distanceLabel(int percent) {
    return 'Distancia: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Cámara Frontal';

  @override
  String get rearCameraLabel => 'Cámara Trasera';

  @override
  String get startingCamera => 'Iniciando cámara...';

  @override
  String get eyeNotDetected => 'Ojo No Detectado';

  @override
  String get tryAgain => 'Intentar de Nuevo';

  @override
  String get indicatorEye => 'Ojo';

  @override
  String get indicatorSharp => 'Nitidez';

  @override
  String get indicatorLight => 'Luz';

  @override
  String get indicatorFocus => 'Enfoque';

  @override
  String get indicatorPupil => 'Pupila';

  @override
  String get indicatorIris => 'Iris';

  @override
  String get indicatorMatch => 'Coinc.';

  @override
  String get checkImageShape => 'Forma de Imagen';

  @override
  String get checkCircularIris => 'Iris Circular';

  @override
  String get checkDarkPupil => 'Pupila Oscura';

  @override
  String get checkIrisTexture => 'Textura del Iris';

  @override
  String get checkPupilIrisStructure => 'Estructura Pupila-Iris';

  @override
  String get checkNaturalColors => 'Colores Naturales';

  @override
  String get checkEdgePattern => 'Patrón de Bordes';

  @override
  String get errorImageShapeIncorrect =>
      'Forma incorrecta - asegure que el ojo llene el marco';

  @override
  String get errorNoEyeDetected =>
      'No se detectó ojo - centre el iris en el marco';

  @override
  String get errorNoPupilDetected =>
      'No se detectó pupila - asegure buena iluminación';

  @override
  String get errorNoIrisTexture => 'Sin textura de iris - acérquese más al ojo';

  @override
  String get errorUnusualColors =>
      'Colores inusuales - evite pantallas/reflejos';

  @override
  String get errorTooManyEdges =>
      'Demasiados bordes rectos - puede no ser un ojo';

  @override
  String get errorNotValidEye => 'Imagen de ojo no válida - intente de nuevo';

  @override
  String get holdStillCapturing => 'Quieto - capturando...';

  @override
  String get adjustDistanceFirst => 'Ajuste la distancia primero';

  @override
  String get stabilizingReading => 'Estabilizando...';

  @override
  String get autoCaptureWhenReady => 'Captura automática cuando esté listo';

  @override
  String get tapOrWaitAutoCapture => 'Toque o espere captura automática';

  @override
  String get validatingImage => 'Validando...';

  @override
  String get capturingStatus => 'Capturando...';

  @override
  String get adjustPositionStatus => 'Ajuste posición';

  @override
  String get validationTip =>
      'Consejo: Asegure buena iluminación, sostenga la cámara a 10-15cm del ojo, evite reflejos';

  @override
  String get validationChecksTitle => 'Verificaciones de Validación:';

  @override
  String confidenceLabel(int percent) {
    return 'Confianza:';
  }

  @override
  String get incompleteData => 'Datos incompletos';

  @override
  String get irisDiameterLabel => 'iris ø';

  @override
  String get plrResponseCurve => 'Curva de Respuesta PLR';

  @override
  String get plrLatency => 'Latencia';

  @override
  String get plrVelocity => 'Velocidad';

  @override
  String get plrRecoveryTime => 'Recuperación';

  @override
  String get plrRecoveryRatio => 'Ratio Rec.';

  @override
  String get plrEnhancedMetrics => 'Métricas PLR Avanzadas';

  @override
  String get plrNormalLatency => 'Normal: 200-500ms';

  @override
  String get plrNormalConstriction => 'Normal: 10-30%';

  @override
  String get plrNormalVelocity => 'Normal: 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'Valores de Referencia PLR Normales';

  @override
  String get plrSubjectInfo => 'Información del Sujeto';

  @override
  String get plrTestType => 'Reflejo Pupilar a la Luz';

  @override
  String get plrAnalysisSummary => 'Resumen del Análisis';

  @override
  String get plrTotalFrames => 'Total de Cuadros Analizados';

  @override
  String get plrSuccessRate => 'Tasa de Éxito';

  @override
  String get plrMaxConstriction => 'Contracción Máxima';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => 'Corona Nerviosa Autónoma (ANW)';

  @override
  String get anwAbnormal => 'Anormal';

  @override
  String get anwDiameter => 'Diámetro';

  @override
  String get anwPerimeter => 'Perímetro';

  @override
  String get anwAsymmetry => 'Asimetría';

  @override
  String get anwElevated => 'Elevado';

  @override
  String get anwFormType => 'Tipo de Forma';

  @override
  String get anwRegular => 'Regular';

  @override
  String get anwDrawnIn => 'Contraído';

  @override
  String get anwIndented => 'Dentado';

  @override
  String get anwLacerated => 'Lacerado';

  @override
  String get anwSpastic => 'Espástico';

  @override
  String get anwAtonic => 'Atónico';

  @override
  String get anwTonicState => 'Patron Tonico Historico';

  @override
  String get anwParasympathotonic => 'Patron parasimpaticotonico';

  @override
  String get anwSympathotonicState => 'Patron simpaticotonico';

  @override
  String get anwShiftDetected => 'Patron Historico de Desplazamiento';

  @override
  String get anwConstrictionDetected => 'Constricción Detectada';

  @override
  String get anwFindings => 'Hallazgos';

  @override
  String get anwRatioComparison => 'Proporción ANW';

  @override
  String get bilateralANWComparison => 'Comparación Bilateral de ANW';

  @override
  String get anwSymmetryNormal => 'Simetría de ANW dentro de límites normales.';

  @override
  String get anwAsymmetryDetected =>
      'Asimetría de ANW detectada entre los ojos.';

  @override
  String get functionalFrustration =>
      'Frustración funcional en la correlación entre los sistemas nerviosos simpático y parasimpático.';

  @override
  String get anwParasympathotonicDesc =>
      'Las observaciones historicas vincularon esto con mayor sensibilidad liminal, actividad refleja acelerada y funciones secretoras/evacuativas gastrointestinales aumentadas.';

  @override
  String get anwSympathotonicDesc =>
      'Las observaciones historicas vincularon esto con menor sensibilidad liminal, actividad refleja desacelerada y funciones secretoras/evacuativas gastrointestinales reducidas.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Los estudios historicos segun Velchover vincularon esto con patrones de sobrecarga del ventriculo izquierdo y estres cardiaco.';

  @override
  String get anwFrontalConstricted =>
      'Zona frontal del cinturón pupilar está contraída.';

  @override
  String get anwBasalConstricted =>
      'Zona basal del cinturón pupilar está contraída.';

  @override
  String get anwFrontalBasalConstricted =>
      'Zonas frontal y basal del cinturón pupilar están contraídas.';

  @override
  String get helpTitle => 'Ayuda y Guía del Usuario';

  @override
  String get helpTabQuickStart => 'Inicio Rápido';

  @override
  String get helpTabCnriAnalysis => 'Análisis CNRI';

  @override
  String get helpTabShortcuts => 'Atajos';

  @override
  String get helpTabTroubleshooting => 'Solución de Problemas';

  @override
  String get helpOnlineDocs => 'Documentación Online';

  @override
  String get helpContactSupport => 'Contactar Soporte';

  @override
  String get helpGettingStarted => 'Comenzando';

  @override
  String get helpStep1Title => 'Conecte Su Iriscopio';

  @override
  String get helpStep1Desc =>
      'Conecte su Dino-Lite o iriscopio USB compatible.';

  @override
  String get helpStep2Title => 'Ingrese Información del Paciente';

  @override
  String get helpStep2Desc =>
      'Complete nombre, edad, sexo y quejas principales del paciente.';

  @override
  String get helpStep3Title => 'Capture el Ojo Derecho (OD)';

  @override
  String get helpStep3Desc =>
      'Posicione el iriscopio y capture la imagen del ojo derecho.';

  @override
  String get helpStep4Title => 'Capture el Ojo Izquierdo (OS)';

  @override
  String get helpStep4Desc =>
      'Repita para el ojo izquierdo con iluminación consistente.';

  @override
  String get helpStep5Title => 'Revise el Análisis';

  @override
  String get helpStep5Desc =>
      'La app analiza ratio P/I, forma pupilar y características ANW.';

  @override
  String get helpStep6Title => 'Exporte el Reporte';

  @override
  String get helpStep6Desc => 'Guarde como formato PDF, TXT o JSON.';

  @override
  String get helpTipBestResults =>
      'Para mejores resultados: Use iluminación consistente y mantenga 2-3cm de distancia del iriscopio.';

  @override
  String get helpCnriProtocolFeatures => 'Características del Protocolo CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Ratio Pupila/Iris (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal: 20-30%. Valores fuera pueden indicar desequilibrio autonómico.';

  @override
  String get helpFeaturePupilFormTitle => 'Análisis de Forma Pupilar';

  @override
  String get helpFeaturePupilFormDesc =>
      'Detecta patrones ovales, dirección de descentración y excentricidad.';

  @override
  String get helpFeatureAnwTitle => 'Evaluación ANW (Collarete)';

  @override
  String get helpFeatureAnwDesc =>
      'Analiza ratio, regularidad de forma, desplazamientos sectoriales y estado tónico.';

  @override
  String get helpFeatureZoneTitle => 'Análisis de Zonas';

  @override
  String get helpFeatureZoneDesc =>
      'Mapea aplanamientos/protrusiones a zonas de órganos CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Comparación Bilateral';

  @override
  String get helpFeatureBilateralDesc =>
      'Compara OD vs OS para detectar asimetrías.';

  @override
  String get helpFeatureMlTitle => 'Comparación ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'El modelo ONNX CNN proporciona mediciones secundarias para comparación.';

  @override
  String get helpKeyboardShortcuts => 'Atajos de Teclado';

  @override
  String get helpCameraControls => 'Controles de Cámara';

  @override
  String get helpShortcutSpace => 'Capturar imagen';

  @override
  String get helpShortcutCtrlS => 'Guardar reporte PDF';

  @override
  String get helpShortcutCtrlO => 'Abrir imagen de galería';

  @override
  String get helpShortcutCtrlH => 'Ver historial de escaneos';

  @override
  String get helpShortcutF11 => 'Alternar pantalla completa';

  @override
  String get helpShortcutEsc => 'Volver / Cancelar';

  @override
  String get helpShortcutScroll => 'Acercar/alejar';

  @override
  String get helpShortcutDoubleClick => 'Restablecer zoom';

  @override
  String get helpCommonIssues => 'Problemas Comunes';

  @override
  String get helpIssueCameraNotDetected => 'Cámara no detectada';

  @override
  String get helpIssueCameraSolution1 => 'Verifique conexión USB';

  @override
  String get helpIssueCameraSolution2 => 'Pruebe diferente puerto USB';

  @override
  String get helpIssueCameraSolution3 => 'Instale drivers Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Reinicie la aplicación';

  @override
  String get helpIssuePupilDetectionFails => 'Falla detección de pupila';

  @override
  String get helpIssuePupilSolution1 => 'Asegure iluminación adecuada';

  @override
  String get helpIssuePupilSolution2 => 'Centre pupila en el marco';

  @override
  String get helpIssuePupilSolution3 => 'Limpie lente del iriscopio';

  @override
  String get helpIssuePupilSolution4 => 'Ajuste enfoque manualmente';

  @override
  String get helpIssuePdfExportFails => 'Falla exportación PDF';

  @override
  String get helpIssuePdfSolution1 => 'Verifique permisos de carpeta';

  @override
  String get helpIssuePdfSolution2 => 'Asegure espacio disponible en disco';

  @override
  String get helpIssuePdfSolution3 => 'Cierre archivos PDF abiertos';

  @override
  String get helpIssuePdfSolution4 => 'Pruebe exportar TXT primero';

  @override
  String get helpCaptureChecklistTitle => 'Lista de Captura';

  @override
  String get helpCaptureChecklist1 =>
      'Mantenga la pupila centrada y completamente visible dentro del encuadre.';

  @override
  String get helpCaptureChecklist2 =>
      'Use iluminación uniforme y reduzca reflejos o brillos sobre la córnea.';

  @override
  String get helpCaptureChecklist3 =>
      'Mantenga una distancia similar del iriscopio para ambos ojos.';

  @override
  String get helpCaptureChecklist4 =>
      'Vuelva a enfocar o repita la captura si el borde pupilar se ve suave o borroso.';

  @override
  String get helpExportSettingsTitle => 'Ajustes de Exportación';

  @override
  String get helpExportSettingsDesc =>
      'Auto-guardar PDF puede guardar un informe tras el análisis, Incluir Imágenes controla si las fotos aparecen en el PDF, y Mostrar Comparación ML agrega valores comparativos del ONNX CNN al informe.';

  @override
  String get helpHybridScoreTitle => 'Confianza y Grado Híbridos';

  @override
  String get helpHybridScoreDesc =>
      'La confianza y el grado mostrados combinan la calidad geométrica clásica con la concordancia ML, por lo que reflejan fiabilidad de la medición y no un diagnóstico.';

  @override
  String get helpAnomalyGuideTitle => 'Cómo leer Aplanamientos y Protrusiones';

  @override
  String get helpAnomalyGuideDesc =>
      'Los aplanamientos indican una retracción relativa y las protrusiones una expansión hacia afuera del borde pupilar; cada tarjeta muestra zona, magnitud y asociación mapeada.';

  @override
  String get helpZoneOverlayGuideTitle => 'Superposición de Zonas';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Use la superposición de zonas para inspeccionar visualmente las posiciones sectoriales y verificar dónde caen las anomalías detectadas alrededor de la pupila y el iris.';

  @override
  String get helpContactSupportTip =>
      'Contacte helpdesk@cnri.edu para asistencia.';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsCameraIriscope => 'CÁMARA / IRISCOPIO';

  @override
  String get settingsPreferredCamera => 'Cámara Preferida:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'Cámara USB';

  @override
  String get settingsCameraAutoDetect => 'Auto-detectar';

  @override
  String get settingsDefaultZoom => 'Zoom Predeterminado:';

  @override
  String get settingsAnalysis => 'ANÁLISIS';

  @override
  String get settingsShowMlComparison => 'Mostrar Comparación ML';

  @override
  String get settingsShowZoneOverlay => 'Mostrar Superposición de Zonas';

  @override
  String get settingsExportReports => 'EXPORTACIÓN Y REPORTES';

  @override
  String get settingsAutoSavePdf => 'Auto-guardar PDF';

  @override
  String get settingsIncludeImages => 'Incluir Imágenes';

  @override
  String get settingsSaved => 'Configuración guardada';

  @override
  String get aboutResearchEdition => 'Edición de Investigación';

  @override
  String aboutVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get aboutLicense => 'Licencia';

  @override
  String get aboutLicensedTo => 'Licenciado a:';

  @override
  String get aboutExpires => 'Expira:';

  @override
  String get aboutManageLicense => 'Administrar Licencia';

  @override
  String get aboutBasedOnCnri => 'Basado en Protocolo CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Sitio Web';

  @override
  String get aboutPrivacy => 'Privacidad';

  @override
  String get languageSelectTitle => 'Seleccionar Idioma';

  @override
  String get selectLanguage => 'Seleccionar Idioma';

  @override
  String get languageChanged => 'Idioma Cambiado';

  @override
  String languageChangedMessage(String language) {
    return 'Idioma de la app establecido a $language';
  }

  @override
  String get languageSystemNotAvailable => 'Sistema de idioma no disponible';

  @override
  String get licenseLoading => 'Cargando...';

  @override
  String get licenseWelcome => '¡Bienvenido a PupilMetrics!';

  @override
  String get licenseTrialFeatures =>
      'Prueba gratuita de 14 días • Funciones completas';

  @override
  String get licenseStartTrial => 'Iniciar Prueba Gratuita';

  @override
  String get licenseEnterKey => 'Ingresar Licencia';

  @override
  String get licenseFreeTrial => 'Prueba Gratuita';

  @override
  String licenseDaysRemaining(int count) {
    return '$count días restantes';
  }

  @override
  String get licenseTrialEnded => 'Prueba Terminada';

  @override
  String get licenseEnterToContinue => 'Ingrese licencia para continuar';

  @override
  String get licenseStandard => 'Licencia Estándar';

  @override
  String get licenseProfessional => 'Licencia Profesional';

  @override
  String get licenseEnterprise => 'Licencia Empresarial';

  @override
  String get licenseLicensed => 'Licenciado';

  @override
  String get licenseActive => 'Activo';

  @override
  String get licenseTrialUser => 'Usuario de Prueba';

  @override
  String get licenseLifetime => 'Vitalicia';

  @override
  String get licenseNotSetUp => 'No Configurada';

  @override
  String get trialExpiredTitle => 'Período de Prueba Terminado';

  @override
  String get trialExpiredMessage =>
      'Su prueba de 14 días ha terminado. Para continuar analizando imágenes de iris, por favor adquiera una licencia.';

  @override
  String get trialExpiredCanStill => 'Aún puede:';

  @override
  String get trialExpiredViewAnalyses => 'Ver sus análisis anteriores';

  @override
  String get trialExpiredExportReports => 'Exportar reportes existentes';

  @override
  String get trialExpiredAccessHistory => 'Acceder al historial de escaneos';

  @override
  String get trialExpiredMaybeLater => 'Quizás Después';

  @override
  String get licenseRegistration => 'Registro de Licencia';

  @override
  String get licenseStatusValid => 'Licenciado';

  @override
  String get licenseStatusTrialActive => 'Prueba Gratuita';

  @override
  String get licenseStatusTrialExpired => 'Prueba Terminada';

  @override
  String get licenseStatusExpired => 'Licencia Expirada';

  @override
  String get licenseStatusInvalid => 'Licencia Inválida';

  @override
  String get licenseStatusUnregistered => 'No Configurada';

  @override
  String get licenseStatusMachineMismatch => 'Computadora Diferente';

  @override
  String get licenseStatusNetworkError => 'Error de Conexión';

  @override
  String get licenseEnterKeyTitle => 'Ingresar Clave de Licencia';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Su Nombre';

  @override
  String get licenseEmailAddress => 'Dirección de Correo Electrónico';

  @override
  String get licenseMachineId => 'ID de Máquina';

  @override
  String get licenseCopyMachineId => 'Copiar ID de Máquina';

  @override
  String get licenseMachineIdCopied => 'ID de máquina copiado al portapapeles';

  @override
  String get licenseValidationKeyRequired =>
      'Por favor ingrese su clave de licencia';

  @override
  String get licenseValidationKeyFormat =>
      'La clave debe tener 20 caracteres (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Por favor ingrese su nombre';

  @override
  String get licenseValidationEmailRequired =>
      'Por favor ingrese su correo electrónico';

  @override
  String get licenseValidationEmailInvalid =>
      'Por favor ingrese un correo válido';

  @override
  String get licenseActivate => 'Activar Licencia';

  @override
  String get licenseContinueTrial => 'Continuar Prueba';

  @override
  String get licenseBuyLicense => 'Comprar Licencia';

  @override
  String get licenseNeedHelp => '¿Necesita ayuda?';

  @override
  String get licenseLicenseAgreement => 'Acuerdo de Licencia';

  @override
  String get licenseActivatedSuccess => '¡Licencia Activada Exitosamente!';

  @override
  String get licenseMsgMachineMismatch =>
      'Esta licencia está registrada en otra computadora. Por favor use su dispositivo original o contacte soporte.';

  @override
  String get licenseMsgTrialEnded =>
      'Su prueba gratuita ha terminado. Ingrese una clave de licencia para continuar usando todas las funciones.';

  @override
  String get licenseMsgExpired =>
      'Su licencia ha expirado. Por favor renueve para continuar.';

  @override
  String get licenseMsgNeedsSetup =>
      'La licencia necesita configurarse. Inicie su prueba gratuita o ingrese una clave de licencia.';

  @override
  String get licenseMsgCheckFormat =>
      'Por favor verifique el formato de su clave. Debe verse así: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Esta clave de licencia no fue reconocida. Por favor verifique e intente de nuevo.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Esta clave ya está registrada en otra computadora.';

  @override
  String get licenseMsgContactSupport =>
      'Esta licencia ha expirado. Por favor contacte soporte para renovar.';

  @override
  String get licenseMsgActivatedThankYou =>
      '¡Licencia activada exitosamente! Gracias por su compra.';

  @override
  String get licenseMsgUnableToActivate =>
      'No se pudo activar la licencia. Por favor verifique su conexión a internet e intente de nuevo.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return '¡Bienvenido! Su prueba gratuita de $days días ha comenzado.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Prueba activa: $days días restantes.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Prueba gratuita activa';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Licencia activa - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'No se pudo activar esta clave de licencia.';

  @override
  String get licenseMsgNoLongerValid => 'La licencia ya no es válida.';

  @override
  String get licenseMsgUnableToVerify =>
      'No se pudo verificar esta clave de licencia. Por favor contacte soporte.';

  @override
  String get trialStartedSnackbar => '¡Prueba Iniciada!';

  @override
  String get trialStartedMessage => 'Disfrute 14 días de acceso completo';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'Modo de tema';

  @override
  String get methods => 'MÉTODOS';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => 'enfocar / desenfocar';

  @override
  String get showHide => 'mostrar / ocultar';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => 'maximizar / restaurar';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => 'minimizar / restaurar';

  @override
  String get dockUndock => 'acoplar / desacoplar';

  @override
  String get dockLeft => 'acoplar izquierda';

  @override
  String get dockRight => 'acoplar derecha';

  @override
  String get undock => 'desacoplar';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'restablecer';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'transparente';

  @override
  String get red => 'rojo';

  @override
  String get green => 'verde';

  @override
  String get blue => 'azul';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'arriba izquierda';

  @override
  String get topCenter => 'arriba centro';

  @override
  String get topRight => 'arriba derecha';

  @override
  String get centerLeft => 'centro izquierda';

  @override
  String get centerRight => 'centro derecha';

  @override
  String get bottomLeft => 'abajo izquierda';

  @override
  String get bottomCenter => 'abajo centro';

  @override
  String get bottomRight => 'abajo derecha';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Establecer';

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
  String get hidden => 'oculto';

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
  String get defaultIcon => 'Predeterminado';

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
  String get dragToMoveArea => 'Arrastrar para mover';

  @override
  String get dragToResizeArea => 'Arrastrar para redimensionar';

  @override
  String get dragToResizeAreaExample => 'Ejemplo de área redimensionable';

  @override
  String get closeWindowConfirmation =>
      '¿Está seguro de que desea cerrar esta ventana?';

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
  String get plrReportTitle => 'Informe de Analisis PLR';

  @override
  String get plrResearchOnlyTitle => 'SOLO PARA INVESTIGACION/EDUCACION';

  @override
  String get plrResearchDisclaimer =>
      'Los resultados NO son diagnosticos medicos. Consulte a un profesional de la salud.';

  @override
  String get plrNameLabel => 'Nombre';

  @override
  String plrAgeYears(int age) {
    return 'Edad: $age anos';
  }

  @override
  String get plrTestLabel => 'Prueba';

  @override
  String get plrSummaryTitle => 'Resumen PLR';

  @override
  String plrGradeValue(String grade) {
    return 'Grado $grade';
  }

  @override
  String get plrStatusLabel => 'Estado';

  @override
  String get plrDetectedStatus => 'PLR DETECTADO';

  @override
  String get plrWeakNotDetectedStatus => 'DEBIL/NO DETECTADO';

  @override
  String get plrRecoveryTimeLabel => 'Tiempo de recuperacion';

  @override
  String get plrRecoveryRatioLabel => 'Relacion de recuperacion';

  @override
  String get plrChartDescription =>
      'Representacion visual de la respuesta pupilar a lo largo del tiempo';

  @override
  String plrPiRange(String min, String max) {
    return 'Rango P/I: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Datos de cuadros';

  @override
  String get plrTableTime => 'Tiempo';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'Fase';

  @override
  String get plrTableConfidenceShort => 'Conf';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return 'Exitosos: $success | Fallidos: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latencia: 200-500 ms (tiempo hasta la respuesta inicial)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Constriccion: reduccion del 10-30 % desde la linea base';

  @override
  String get plrReferenceVelocityLine => '• Velocidad: 1.5-4.0 %/segundo';

  @override
  String get plrReferenceRecoveryLine =>
      '• Recuperacion: >75 % de retorno a la linea base en 5 segundos';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Recuperacion: >75 % de retorno a la linea base en 5 s';

  @override
  String plrShareSubject(String eye) {
    return 'Informe de Analisis PLR - $eye';
  }

  @override
  String get plrTextReportTitle => 'INFORME DE ANALISIS DE VIDEO PLR';

  @override
  String get plrTextDisclaimerTitle =>
      'AVISO: Solo para investigacion/fines educativos';

  @override
  String get plrTextDisclaimerBody =>
      'Los resultados NO son diagnosticos medicos.';

  @override
  String get plrOverallGradeLabel => 'Calificacion general';

  @override
  String get plrEndOfReport => 'FIN DEL INFORME';

  @override
  String get zoneOverlay => 'Superposición de Zonas';

  @override
  String get tipDragImage =>
      'Consejo: arrastre la imagen para alinear el limbo con los círculos.';

  @override
  String get overlayMetrics => 'Métricas de Superposición';

  @override
  String get piRatioLabel => 'Relación P/I:';

  @override
  String get ellipsenessLabel => 'Elipticidad:';

  @override
  String get decentralizationLabel => 'Descentralización:';

  @override
  String get detectedFindings => 'Hallazgos detectados';

  @override
  String get anwCollarette => 'ANW / COLLARETE';

  @override
  String get observerNotes => 'Notas del observador';

  @override
  String get observerNotesHint =>
      'Ingrese observaciones clínicas, hallazgos de zona, patrones…';

  @override
  String get autoCenter => 'Auto-centrar';

  @override
  String get anwRing => 'Anillo ANW';

  @override
  String get axisGrid => 'Eje/Cuadrícula';

  @override
  String get chart => 'Gráfico';

  @override
  String get hoverToIdentify =>
      'Pase el cursor o toque una zona para identificar';

  @override
  String get organsMode => 'Modo órganos — pase por el iris para identificar';

  @override
  String get mildSizeDiff =>
      'Diferencia de tamaño leve. Puede ser variación fisiológica.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Dentro del rango de investigación para edad $age ($group)';
  }

  @override
  String get formLabel => 'Forma:';

  @override
  String get flatteningLabel => 'Aplanamiento:';

  @override
  String get protrusionLabel => 'Protrusión:';

  @override
  String get decentrationLabel => 'Descentración:';

  @override
  String get pupilSizeLabel => 'Tamaño pupilar:';

  @override
  String get anwRatioLabel => 'Relación ANW:';

  @override
  String get anwToneLabel => 'Tono ANW:';

  @override
  String get noMajorODAnomalies => 'Sin anomalías pupilares OD significativas.';

  @override
  String get noMajorOSAnomalies => 'Sin anomalías pupilares OS significativas.';

  @override
  String get anwNotAssessed => 'ANW: no evaluado';

  @override
  String get manualAlignmentAid =>
      'Ayuda de alineación manual solo para revisión. Arrastre imagen o use Auto-centrar.';

  @override
  String get frontalShift => 'S: Patron de desplazamiento frontal.';

  @override
  String get cerebralCirculation =>
      'Los estudios historicos segun Velchover vincularon esto con patrones de circulacion cerebral.';

  @override
  String get middleTemporalShift => 'D: Patron de desplazamiento temporomedio.';

  @override
  String get respiratoryCardiac =>
      'Los estudios historicos segun Velchover vincularon esto con patrones autonomicos respiratorios y cardiacos.';

  @override
  String get findings => 'Hallazgos:';

  @override
  String get analysisReportTitle => 'Informe de Analisis Pupilar';

  @override
  String get reportResearchVersion => 'Version de Investigacion';

  @override
  String get reportDisclaimerTitle =>
      'AVISO: Solo para investigacion/fines educativos';

  @override
  String get reportDisclaimerBody =>
      'Los resultados son observaciones de investigacion, NO diagnosticos medicos.';

  @override
  String get reportPersonInformationTitle => 'Informacion de la persona';

  @override
  String get reportAgeGroupLabel => 'Grupo de edad';

  @override
  String get reportPupilSizeComparisonTitle => 'Comparacion del tamano pupilar';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Metricas de distancia de captura';

  @override
  String get reportResearchObservationsTitle =>
      'Observaciones de investigacion';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Notas del observador (Superposicion de zonas)';

  @override
  String get reportEndOfReport => 'FIN DEL INFORME';

  @override
  String get reportGradeLabel => 'Grado';

  @override
  String get reportPupilFormTitle => 'Forma pupilar';

  @override
  String get reportDecentrationTitle => 'Descentracion';

  @override
  String get reportFlatteningsTitle => 'Aplanamientos';

  @override
  String get reportProtrusionsTitle => 'Protrusiones';

  @override
  String get reportAnwParametersTitle => 'Corona Nerviosa Autonoma (ANW)';

  @override
  String get reportTonicStateLabel => 'Patron Tonico Historico';

  @override
  String get reportShiftDetectedTitle => 'Patron Historico de Desplazamiento';

  @override
  String get reportClinicalLabel => 'Nota Historica';

  @override
  String get reportConstrictionDetectedTitle => 'Constriccion detectada';

  @override
  String get reportSeverityLabel => 'Severidad';

  @override
  String get reportReferenceValuesTitle =>
      'Valores de referencia (Protocolo de investigacion CNRI)';

  @override
  String get reportMatchLabel => 'Coincidencia';

  @override
  String get reportValueLabel => 'Valor';

  @override
  String get reportNormalPupilForm => 'Forma pupilar normal';

  @override
  String reportPageXofY(int page, int total) {
    return 'Pagina $page/$total';
  }

  @override
  String reportShareSubject(String patientName) {
    return 'Informe de Analisis Pupilar - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Se adjunta el informe de analisis pupilar de $patientName, generado el $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Por debajo del rango de investigacion para edad $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Por encima del rango de investigacion para edad $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Infante';

  @override
  String get ageGroupChild15 => 'Nino (1-5)';

  @override
  String get ageGroupChild611 => 'Nino (6-11)';

  @override
  String get ageGroupTeen => 'Adolescente';

  @override
  String get ageGroupAdult2039 => 'Adulto (20-39)';

  @override
  String get ageGroupAdult4059 => 'Adulto (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Adulto mayor (60+)';

  @override
  String get middleNasalShift => 'Patron de desplazamiento nasal-medio.';

  @override
  String get upperTemporalShift =>
      'Patron de desplazamiento temporal-superior.';

  @override
  String get lowerTemporalShift =>
      'Patron de desplazamiento temporal-inferior.';

  @override
  String get basalShift => 'Patron de desplazamiento basal.';

  @override
  String get vagusStellateAssociation =>
      'Los estudios historicos segun Velchover vincularon esto con patrones de hipofuncion del nervio vago o del ganglio estrellado.';

  @override
  String get venaCavaInferiorAssociation =>
      'Los estudios historicos segun Velchover vincularon esto con patrones de alteracion hemodinamica en la vena cava inferior.';

  @override
  String get vertebralArteryAssociation =>
      'Los estudios historicos segun Velchover vincularon esto con patrones de circulacion de la arteria vertebral.';

  @override
  String get smallPelvisAssociation =>
      'Los estudios historicos segun Velchover vincularon esto con patrones congestivos en la pelvis menor.';

  @override
  String get openZoneOverlay => 'Abrir superposicion de zonas';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'Opacidad del grafico';

  @override
  String get irisSizeNotAvailable => 'Datos de tamano del iris no disponibles';

  @override
  String get ratio => 'Relacion';

  @override
  String get reportRefPiRatio => 'Relacion Pupila/Iris: Normal 20-30%';

  @override
  String get reportRefEllipseness => 'Elipticidad: Normal >95%';

  @override
  String get reportRefDecentralization => 'Descentralizacion: Normal <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Dif. Tamano Pupila: <2% Normal, 2-4% Leve, >4% Significativo';

  @override
  String get enterPatientInfoAnalysis =>
      'Ingresar Info del Paciente → Análisis';

  @override
  String get chooseCaptureMethod => 'Elige el método de captura:';

  @override
  String get usbCamera => 'Cámara USB';

  @override
  String get selectExistingImage => 'Seleccionar imagen existente';

  @override
  String get detectingCameras => 'Detectando cámaras...';

  @override
  String get retryDetection => 'Reintentar detección';

  @override
  String get connectUvcCameraViaUsb => 'Conecta la cámara UVC por USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Asegúrate de que los controladores estén instalados';

  @override
  String get tapRefreshToDetect => 'Toca Actualizar para detectar cámaras';

  @override
  String get connectUsbCameraToBegin => 'Conecta la cámara USB para comenzar';

  @override
  String get noExternalCameraTitle => 'No se detectó cámara externa';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Conecta tu iriscopio USB y asegúrate de que esté enchufado';

  @override
  String get languagesAvailable => 'Idiomas disponibles';

  @override
  String get validationChecks => 'Verificaciones de validación:';

  @override
  String get eyeQualityTip =>
      'Consejo: Asegura buena iluminación y mantén el ojo estable';

  @override
  String get validatingEye => 'Validando ojo...';

  @override
  String get initializing => 'Inicializando...';

  @override
  String get nameLabel => 'Nombre:';

  @override
  String get ageLabel => 'Edad:';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get pleaseEnterName => 'Por favor ingresa el nombre';

  @override
  String get pleaseEnterAge => 'Por favor ingresa la edad';

  @override
  String get ageMustBe2Digits => 'La edad debe tener 1 o 2 dígitos';

  @override
  String get optional => '(Opcional)';

  @override
  String get bilateralBothHands => 'Uso bilateral de ambas manos';

  @override
  String get zoom => 'Zoom';

  @override
  String get zoomSliderTip =>
      'Usa el control deslizante de zoom a la derecha para ajustar la ampliación antes de grabar.';

  @override
  String get aboutProgramDeveloper =>
      'Desarrollador del Programa - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Tamaño del gráfico';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Opacidad del gráfico (0 = solo hover / Modo órganos)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Listo y volver';

  @override
  String get errorImageShape =>
      'Forma de imagen incorrecta - asegúrese de que el ojo llene el marco';

  @override
  String get cameraConnected => 'Cámara conectada';

  @override
  String get cameraDisconnected => 'Cámara desconectada';

  @override
  String get cameraPermissionDenied => 'Permiso de cámara denegado';

  @override
  String get cameraFailedInit => 'Error al inicializar la cámara';

  @override
  String get cameraInUse => 'La cámara está siendo usada por otra aplicación';

  @override
  String get cameraFormatNotSupported => 'Formato de cámara no compatible';

  @override
  String get capturedImageNotFound =>
      'Archivo de imagen capturada no encontrado';

  @override
  String get failedToCaptureImage => 'Error al capturar imagen';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Ocurrió un error de cámara';

  @override
  String get connectingToUsbIriscope => 'Conectando al iriscopio USB...';

  @override
  String get noCamerasDetectedMessage =>
      'No se detectaron cámaras. Asegúrese de que su cámara USB esté conectada y reconocida por su sistema.';

  @override
  String get failedToAccessCameras => 'Error al acceder a las cámaras';

  @override
  String get notAnEyeImageTitle => 'No es una imagen de ojo';

  @override
  String get notAnEyeImageBody =>
      'La imagen seleccionada no parece ser un ojo.\n\nPor favor, elige una foto clara del iris/pupila e inténtalo de nuevo.';

  @override
  String get notAnEyeImageBodyCapture =>
      'La imagen capturada no parece ser un ojo.\n\nPor favor, posiciona el iriscopio directamente sobre el ojo y vuelve a capturar.';

  @override
  String get anisocoriaObservationSymmetrical => 'Simétrico';

  @override
  String get anisocoriaObservationSlight => 'Variación leve';

  @override
  String get anisocoriaObservationModerate => 'Variación moderada';

  @override
  String get anisocoriaObservationMarked => 'Variación marcada';

  @override
  String get settingsNaturalMedicineSection => 'Medicina Natural';

  @override
  String get settingsHerbalToggle =>
      'Recomendaciones Herbales (basadas en zonas del iris)';

  @override
  String get settingsNutritionToggle =>
      'Nutrición 7 Colores (basada en zonas del iris)';

  @override
  String get settingsChiropracticToggle => 'Quiropráctica / Evaluación Espinal';

  @override
  String get settingsTcmToggle => 'Medicina Tradicional China (MTC)';

  @override
  String get therapyHerbalTitle => 'Recomendaciones Herbales';

  @override
  String get therapyHerbalSubtitle =>
      'Hallazgos de zonas del iris — ordenados por peso de evidencia';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count referencias';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'Las sugerencias herbales se proporcionan con fines educativos únicamente. Consulte a un profesional de salud calificado antes de su uso.';

  @override
  String get therapyNutritionTitle => 'Nutrición Dieta 7 Colores';

  @override
  String get therapyNutritionSubtitle =>
      'Alimentos y nutrientes para órganos de zonas del iris';

  @override
  String get therapyNutritionFoodsByColor => 'Alimentos Recomendados por Color';

  @override
  String get therapyNutritionKeyNutrients => 'Nutrientes Clave';

  @override
  String get therapyNutritionHerbs => 'Hierbas y Especias de Apoyo';

  @override
  String get therapyNutritionNotes => 'Notas Nutricionales';

  @override
  String get therapyNutritionTonifying => 'Alimentos tonificantes:';

  @override
  String get therapyNutritionAvoid => 'Minimizar / evitar:';

  @override
  String get therapyNutritionDisclaimer =>
      'Las sugerencias nutricionales se basan en el marco de la Dieta 7 Colores y se proporcionan con fines educativos únicamente. Consulte a un profesional antes de realizar cambios en su dieta.';

  @override
  String get therapyChiroTitle => 'Evaluación Quiropráctica';

  @override
  String get therapyChiroSubtitle =>
      'Segmentos espinales indicados por hallazgos del iris';

  @override
  String get therapyChiroVertebrae => 'Vértebras';

  @override
  String get therapyChiroNerveRoots => 'Raíces Nerviosas';

  @override
  String get therapyChiroInnervated => 'Estructuras Inervadas';

  @override
  String get therapyChiroSubluxation => 'Indicadores Posibles de Subluxación';

  @override
  String get therapyChiroMuscles => 'Músculos Frecuentemente Afectados';

  @override
  String get therapyChiroAdjusting => 'Enfoque de Ajuste Quiropráctico';

  @override
  String get therapyChiroExercises => 'Ejercicios y Estiramientos en Casa';

  @override
  String get therapyChiroPostural => 'Nota Postural';

  @override
  String get therapyChiroDisclaimer =>
      'La información quiropráctica se proporciona con fines educativos. Consulte a un quiropráctico licenciado para diagnóstico y tratamiento.';

  @override
  String get therapyTcmTitle => 'Medicina Tradicional China';

  @override
  String get therapyTcmSubtitle =>
      'Meridiano · Reloj de Órganos · Cinco Elementos';

  @override
  String get therapyTcmMeridianFunctions => 'Funciones del Meridiano';

  @override
  String get therapyTcmGoverns => 'Rige';

  @override
  String get therapyTcmPatterns => 'Patrones de Desequilibrio';

  @override
  String get therapyTcmSymptoms => 'Síntomas';

  @override
  String get therapyTcmFormulas => 'Fórmulas Clásicas';

  @override
  String get therapyTcmKeyPoints => 'Puntos Clave para Este Patrón';

  @override
  String get therapyTcmAcupoints => 'Puntos de Acupresión Clave';

  @override
  String get therapyTcmDiet => 'Terapia Dietética MTC';

  @override
  String get therapyTcmTonifying => 'Alimentos tonificantes:';

  @override
  String get therapyTcmAvoid => 'Minimizar / evitar:';

  @override
  String get therapyTcmDisclaimer =>
      'La información de MTC se proporciona con fines educativos. Consulte a un acupunturista o médico de MTC licenciado.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'No se detectaron hallazgos significativos en zonas del iris para generar recomendaciones.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'Estación';

  @override
  String get therapyClimateLabel => 'Clima';

  @override
  String get therapyEmotionLabel => 'Emoción';

  @override
  String get therapyTasteLabel => 'Sabor';

  @override
  String get therapyNatureLabel => 'Naturaleza';

  @override
  String therapyPairedOrgan(String organ) {
    return 'par: $organ';
  }

  @override
  String get bothEyesCapturedTitle => 'Ambos Ojos Capturados';

  @override
  String get constitutionalType => 'Tipo Constitucional';

  @override
  String get constitutionalTypeOptional => 'Tipo Constitucional (Opcional)';

  @override
  String get selectConstitutionalType => 'Seleccionar tipo constitucional…';

  @override
  String get constitutionalTypeNone => 'Ninguno (no evaluado)';

  @override
  String get constitutionalIridology => 'Iridología Constitucional';

  @override
  String get constitutionalIrisDescription => 'Descripción del Iris';

  @override
  String get constitutionalPredispositions => 'Predisposiciones de Salud';

  @override
  String get constitutionalHomeopathicRemedies => 'Remedios Homeopáticos';

  @override
  String get constitutionalTypeBy =>
      'Basado en la Iridología Constitucional del Dr. Josef Deck';
}
