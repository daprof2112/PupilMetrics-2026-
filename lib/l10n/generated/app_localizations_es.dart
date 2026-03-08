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
  String get center => 'Centro';

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
  String get close => 'Cerrar';

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
  String get anwRatio => 'Ratio ANW';

  @override
  String get normal => 'Normal';

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
}
