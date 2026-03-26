// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'CNRI Captura Ocular';

  @override
  String get analyzeButton => 'Analisar';

  @override
  String get plrModes => 'Modos RFP';

  @override
  String get captureInstructions => 'Posicione o olho dentro do círculo guia';

  @override
  String get scanHistory => 'Histórico de Análises';

  @override
  String get selectCameraMode => 'Selecionar Modo da Câmera';

  @override
  String get loadFromGallery => 'Carregar da Galeria';

  @override
  String get rightEyePhoto => 'Foto do Olho Direito';

  @override
  String get leftEyePhoto => 'Foto do Olho Esquerdo';

  @override
  String get autoCapture => 'Captura Automática';

  @override
  String get autoCaptureDesc =>
      'Detecção ocular + captura automática de 5 segundos';

  @override
  String get manualCapture => 'Captura Manual';

  @override
  String get manualCaptureDesc =>
      'Detecção ocular + captura manual (câmera traseira)';

  @override
  String get selfieMode => 'Modo Selfie';

  @override
  String get selfieModeDesc =>
      'Detecção ocular + captura auto 5 seg (câmera frontal)';

  @override
  String get plrVideoRear => 'Vídeo RFP (Traseira)';

  @override
  String get plrVideoRearDesc => 'Câmera traseira • captura 10 seg';

  @override
  String get plrVideoSelfie => 'Vídeo RFP (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Câmera frontal • captura 10 seg';

  @override
  String get plrVideoCapture => 'Captura de Vídeo RFP';

  @override
  String get frontCamera => 'Câmera Frontal';

  @override
  String get rearCamera => 'Câmera Traseira';

  @override
  String get selectEyeToAssess => 'Selecione qual olho avaliar';

  @override
  String get rightEyeOD => 'Olho Direito (OD)';

  @override
  String get leftEyeOS => 'Olho Esquerdo (OS)';

  @override
  String get recordPlrRightEye => 'Gravar RFP do olho direito';

  @override
  String get recordPlrLeftEye => 'Gravar RFP do olho esquerdo';

  @override
  String get loadRightEyeImage => 'Carregar imagem do olho direito';

  @override
  String get loadLeftEyeImage => 'Carregar imagem do olho esquerdo';

  @override
  String get bothEyes => 'Ambos os Olhos';

  @override
  String get loadBothEyesDesc => 'Carregar olho direito, depois esquerdo';

  @override
  String get selectEyeImageFromDevice =>
      'Selecione uma imagem ocular do seu dispositivo';

  @override
  String get selectRightEyeFirst =>
      'Selecione primeiro a imagem do olho DIREITO (OD)';

  @override
  String get rightEyeSaved =>
      'Olho direito salvo. Agora selecione a imagem do olho ESQUERDO (OS)';

  @override
  String get cancelledNoRightEye =>
      'Cancelado - nenhum olho direito selecionado';

  @override
  String get cancelledNoLeftEye =>
      'Cancelado - nenhum olho esquerdo selecionado';

  @override
  String errorLoadingImages(String error) {
    return 'Erro ao carregar imagens: $error';
  }

  @override
  String get crop43 => 'Cortar (4:3)';

  @override
  String get success => 'Sucesso';

  @override
  String get imageCroppedSuccess => 'Imagem cortada com sucesso!';

  @override
  String get error => 'Erro';

  @override
  String get cropFailed =>
      'Falha ao cortar imagem. Por favor, tente novamente.';

  @override
  String get crop => 'Cortar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get saved => 'Salvo! ✅';

  @override
  String get imageSavedToGallery => 'Imagem salva na galeria com sucesso';

  @override
  String get exposure => 'Exposição';

  @override
  String get flash => 'Flash';

  @override
  String get eye => 'Olho';

  @override
  String get center => 'centro';

  @override
  String get light => 'Luz';

  @override
  String get ready => 'Pronto';

  @override
  String get on => 'SIM';

  @override
  String get off => 'NÃO';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUAL';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPILA';

  @override
  String get plrHistory => 'Histórico RFP';

  @override
  String get searchByName => 'Buscar por nome...';

  @override
  String get totalScans => 'Total de Análises';

  @override
  String get thisWeek => 'Esta Semana';

  @override
  String get patients => 'Pacientes';

  @override
  String get detected => 'Detectado';

  @override
  String get noPlrRecordsYet => 'Nenhum registro RFP ainda';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Grave um vídeo RFP para ver o histórico aqui';

  @override
  String get deleteRecord => 'Excluir Registro?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Excluir análise RFP de $name ($eye)?\n\nIsto não pode ser desfeito.';
  }

  @override
  String get delete => 'Excluir';

  @override
  String get recordDeleted => 'Registro excluído';

  @override
  String plrAnalysis(String eye) {
    return 'Análise RFP - $eye';
  }

  @override
  String get patient => 'Paciente';

  @override
  String get date => 'Data';

  @override
  String get frames => 'Quadros';

  @override
  String get baselinePiRatio => 'P/I Base';

  @override
  String get minPiRatio => 'P/I Mín';

  @override
  String get plrMagnitude => 'Amplitude RFP';

  @override
  String get constriction => 'Constrição';

  @override
  String get plrDetected => 'RFP Detectado';

  @override
  String get confidence => 'Confiança';

  @override
  String get grade => 'Grau';

  @override
  String get close => 'fechar';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get na => 'N/D';

  @override
  String get takeLeftEyePhoto => 'Fotografar Olho Esquerdo';

  @override
  String get takeRightEyePhoto => 'Fotografar Olho Direito';

  @override
  String get nowTakingLeftEye => 'Agora capturando olho ESQUERDO (OS)';

  @override
  String get startingWithRightEye => 'Começando com olho DIREITO (OD)';

  @override
  String get captured => 'Capturado ✓';

  @override
  String get useSameDistanceLighting =>
      'Use a mesma distância e iluminação do olho direito para comparação precisa.';

  @override
  String get step1of2 => 'Passo 1 de 2';

  @override
  String get step2of2 => 'Passo 2 de 2';

  @override
  String get bothEyesCaptured => 'Ambos os olhos capturados ✓';

  @override
  String get continueToLeftEye => 'Continuar para o Olho Esquerdo';

  @override
  String get retakeOD => 'Refazer OD';

  @override
  String get retakeOS => 'Refazer OS';

  @override
  String get retakeRightEye => 'Refazer Olho Direito';

  @override
  String get analyzeBothEyes => 'Analisar Ambos os Olhos';

  @override
  String get patientInfoMissing => 'Info do Paciente Ausente';

  @override
  String get rightEyePhotoMissing => 'Foto do olho direito ausente!';

  @override
  String get patientInfoMissingRestart =>
      'Info do paciente ausente. Por favor, reinicie.';

  @override
  String get exitApp => 'Sair do App';

  @override
  String get tipsForBestResults => 'DICAS PARA MELHORES RESULTADOS';

  @override
  String get followGuidelinesForQuality =>
      'Siga estas diretrizes para qualidade de imagem ideal';

  @override
  String get cameraDistance => 'Distância da Câmera';

  @override
  String get cameraDistanceDesc =>
      'Mantenha a câmera a 10-15 cm do seu olho. Mantenha a mesma distância para ambos os olhos.';

  @override
  String get lightingPosition => 'Posição da Iluminação';

  @override
  String get lightingPositionDesc =>
      'Posicione a fonte de luz dentro ou fora das bordas da pupila. Tente olhar para o flash da câmera.';

  @override
  String get avoidReflections => 'Evite Reflexos';

  @override
  String get avoidReflectionsDesc =>
      'Reduza reflexos evitando brilho de janelas, espelhos e lâmpadas diretas.';

  @override
  String get centerYourEye => 'Centralize Seu Olho';

  @override
  String get centerYourEyeDesc =>
      'Certifique-se de que o olho inteiro, incluindo a esclera (parte branca), esteja centralizado e preencha o quadro.';

  @override
  String get cropProperly => 'Corte Corretamente';

  @override
  String get cropProperlyDesc =>
      'Corte a imagem com o olho no centro. A imagem será salva automaticamente na proporção 4:3.';

  @override
  String get importantInformation => 'Informação Importante';

  @override
  String get imageRatio43 => 'Proporção 4:3 para padrão de imagem médica';

  @override
  String get forClinicalUseCnri => 'Para uso clínico com CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Não fornece diagnóstico médico';

  @override
  String get eyeWideOpenClear =>
      'Certifique-se de que seu olho está bem aberto e a imagem está clara';

  @override
  String get personalInfo => 'Info Pessoal';

  @override
  String get personInformation => 'Informação da Pessoa';

  @override
  String get enterPersonDetails => 'Inserir Dados da Pessoa';

  @override
  String get infoIncludedInReport =>
      'Esta informação será incluída no relatório de análise';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get enterPersonName => 'Insira o nome da pessoa';

  @override
  String get nameRequired => 'Nome é obrigatório';

  @override
  String get sex => 'Sexo';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get ageYears => 'Idade (anos)';

  @override
  String get enterAge => 'Insira a idade';

  @override
  String get ageRequired => 'Idade é obrigatória';

  @override
  String get enterValidNumber => 'Insira um número válido';

  @override
  String get enterValidAge => 'Insira uma idade válida (0-120)';

  @override
  String get mainComplaints => 'Queixas Principais';

  @override
  String get mainComplaintsOptional => 'Queixas Principais (opcional)';

  @override
  String get complaintsHint =>
      'ex.: dores de cabeça, problemas de visão, fadiga...';

  @override
  String get continueToCaptire => 'Continuar para Captura';

  @override
  String get ageImportantNote =>
      'A idade é importante para avaliação precisa do tamanho pupilar, pois as faixas normais variam por idade.';

  @override
  String get submit => 'Enviar';

  @override
  String get pleaseSelectGender => 'Por favor, selecione o sexo!';

  @override
  String get applicationSubmitted => 'Sua solicitação foi enviada com sucesso.';

  @override
  String get type => 'Tipo:';

  @override
  String get gender => 'Sexo:';

  @override
  String get rightHanded => 'Destro';

  @override
  String get leftHanded => 'Canhoto';

  @override
  String get partialLeftHandedness => 'Canhotismo parcial';

  @override
  String get retrainedLeftHandedness => 'Canhotismo retreinado';

  @override
  String get bilateralUseBothHands => 'Uso bilateral de ambas as mãos';

  @override
  String get splashTitle => 'PupilMetrics Captura Ocular';

  @override
  String get splashDeveloper => 'Desenvolvedor - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Ferramenta de Pesquisa/Educação';

  @override
  String get startNewAnalysis => 'Iniciar Nova Análise';

  @override
  String get viewHistory => 'Ver Histórico';

  @override
  String get viewResearchDisclaimer => 'Ver Aviso de Pesquisa';

  @override
  String get researchDisclaimerTitle => 'Ferramenta de Pesquisa/Educação';

  @override
  String get researchDisclaimerNotMedical => 'NÃO é um dispositivo médico';

  @override
  String get researchDisclaimerNotClinical => 'NÃO é para diagnóstico clínico';

  @override
  String get researchDisclaimerResults =>
      'Resultados são observações de pesquisa';

  @override
  String get researchDisclaimerConsult =>
      'Sempre consulte profissionais de saúde';

  @override
  String get researchDisclaimerAcknowledge =>
      'Ao continuar, você reconhece que esta é uma ferramenta de pesquisa e não deve ser usada para decisões médicas.';

  @override
  String get researchDisclaimerWarning =>
      'Este app é APENAS para fins de PESQUISA e EDUCAÇÃO.';

  @override
  String get iUnderstand => 'Eu Entendo';

  @override
  String get plrAnalysisTest => 'Teste de Análise RFP';

  @override
  String get checkingVideoFile => 'Verificando arquivo de vídeo...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Processando quadro $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Análise concluída!';

  @override
  String get errorVideoNotFound => 'Erro: Arquivo de vídeo não encontrado';

  @override
  String get waitingForResults => 'Aguardando resultados...';

  @override
  String get baseline => 'Base';

  @override
  String get flashPhase => 'Flash';

  @override
  String get constrictionPhase => 'Constrição';

  @override
  String get recovery => 'Recuperação';

  @override
  String get plrDetectedExclaim => 'RFP DETECTADO!';

  @override
  String get plrWeakNotDetected => 'RFP Fraco/Não Detectado';

  @override
  String get min => 'Mín';

  @override
  String get plr => 'RFP';

  @override
  String get constrLabel => 'Constr.';

  @override
  String get saveToHistory => 'Salvar no Histórico';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Salvar Quadros';

  @override
  String get share => 'Compartilhar';

  @override
  String get frameSavedToGallery => 'Quadro salvo na galeria!';

  @override
  String get failedToSaveFrame => 'Falha ao salvar quadro';

  @override
  String framesSavedToGallery(int count) {
    return '$count quadros salvos na galeria!';
  }

  @override
  String get jsonCopiedToClipboard =>
      'JSON copiado para a área de transferência!';

  @override
  String get reportCopiedToClipboard =>
      'Relatório copiado para a área de transferência!';

  @override
  String shareFailedError(String error) {
    return 'Falha ao compartilhar: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Salvo no histórico! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get noSuccessfulFramesToSave =>
      'Nenhum quadro bem-sucedido para salvar';

  @override
  String get saveAllFrames => 'Salvar Todos os Quadros';

  @override
  String get shareReport => 'Compartilhar Relatório';

  @override
  String get shareJson => 'Compartilhar JSON';

  @override
  String get rerunTest => 'Refazer Teste';

  @override
  String videoCaptureTitle(String eye) {
    return 'RFP - $eye';
  }

  @override
  String get initializingCamera => 'Inicializando câmera...';

  @override
  String usingCamera(String camera) {
    return 'Usando câmera $camera';
  }

  @override
  String cameraError(String error) {
    return 'Erro da câmera: $error';
  }

  @override
  String get noCamerasFound => 'Nenhuma câmera encontrada';

  @override
  String get retry => 'Tentar Novamente';

  @override
  String get startPlrRecording => 'Iniciar Gravação RFP';

  @override
  String get stopRecording => 'Parar Gravação';

  @override
  String get phaseReady => 'Pronto';

  @override
  String get phaseStarting => 'Iniciando...';

  @override
  String phaseBaseline(int sec) {
    return 'Base (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'FLASH!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Constrição ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Recuperação ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Concluído!';

  @override
  String get readyDesc => 'Posicione o olho no círculo e toque em Iniciar';

  @override
  String get holdSteady => 'Mantenha firme...';

  @override
  String get recordingBaselinePupil => 'Gravando tamanho pupilar de base';

  @override
  String lightStimulus(int ms) {
    return 'Estímulo luminoso (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Medindo constrição pupilar';

  @override
  String get measuringRecovery => 'Medindo recuperação pupilar';

  @override
  String get plrRecordingComplete => 'Gravação RFP concluída';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Posicione o olho $eye dentro do círculo.\nMantenha firme durante a gravação de $seconds segundos.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Mantenha o olho firme. O flash ocorrerá em $sec segundos.';
  }

  @override
  String get recordingComplete => 'Gravação Concluída';

  @override
  String get plrVideoCapturedSuccess => 'Vídeo RFP capturado com sucesso!';

  @override
  String get duration => 'Duração';

  @override
  String get seconds => 'segundos';

  @override
  String get frameRate => 'Taxa de Quadros';

  @override
  String get camera => 'Câmera';

  @override
  String flashAt(int sec, int ms) {
    return 'Em ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Fases';

  @override
  String get phasesFlow => 'Base → Flash → Constrição → Recuperação';

  @override
  String get expectedNormalValues => 'Valores Normais Esperados:';

  @override
  String get latency => 'Latência';

  @override
  String get velocity => 'Velocidade';

  @override
  String get testFrameAnalysis => '🧪 Teste de Análise de Quadros';

  @override
  String get retake => 'Refazer';

  @override
  String get done => 'Concluído';

  @override
  String get plrVideoModeTitle => 'Modo de Vídeo RFP';

  @override
  String get plrAssessmentTitle =>
      'Avaliação do Reflexo Fotomotor Pupilar (RFP)';

  @override
  String get plrInstructions =>
      '1. Posicione o olho dentro do círculo guia\n2. Toque em \"Iniciar Gravação RFP\"\n3. Mantenha firme por 10 segundos\n4. Um flash ocorrerá em 3 segundos\n5. O app grava a resposta pupilar';

  @override
  String get recordingPhases => 'Fases da Gravação:';

  @override
  String get baselinePhaseDesc => 'Tamanho pupilar inicial';

  @override
  String get flashPhaseDesc => 'Estímulo luminoso';

  @override
  String get constrictionPhaseDesc => 'Pupila contrai';

  @override
  String get recoveryPhaseDesc => 'Pupila retorna';

  @override
  String get normalPlrValues => 'Valores RFP Normais:';

  @override
  String get gotIt => 'Entendi';

  @override
  String get pupilAnalysis => 'Análise Pupilar';

  @override
  String scansLeft(int count) {
    return '$count restantes';
  }

  @override
  String get validatingRightEye => 'Validando olho direito...';

  @override
  String get validatingLeftEye => 'Validando olho esquerdo...';

  @override
  String get analyzingRightEye => 'Analisando olho direito (OD)...';

  @override
  String get analyzingLeftEye => 'Analisando olho esquerdo (OS)...';

  @override
  String get comparingPupils => 'Comparando pupilas...';

  @override
  String person(String name) {
    return 'Pessoa: $name';
  }

  @override
  String get invalidEyeImage => 'Imagem Ocular Inválida';

  @override
  String analysisFailed(String error) {
    return 'Análise falhou: $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'FERRAMENTA DE PESQUISA/EDUCAÇÃO APENAS';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Este aplicativo é apenas para fins de pesquisa e educação. Os resultados NÃO são diagnósticos médicos e NÃO foram validados para uso clínico. Associações de padrões são de literatura de pesquisa histórica. Consulte um profissional de saúde para quaisquer preocupações de saúde.';

  @override
  String get pupilSizeDifference => 'Diferença de Tamanho Pupilar Detectada';

  @override
  String get significantPupilSizeDiff =>
      'DIFERENÇA SIGNIFICATIVA NO TAMANHO PUPILAR';

  @override
  String get diff => 'dif';

  @override
  String get researchObservationConsult =>
      'Observação de pesquisa - Consulte um profissional de saúde para interpretação';

  @override
  String get ageBasedResearchBaseline => 'Linha de Base de Pesquisa por Idade';

  @override
  String group(String group) {
    return 'Grupo: $group';
  }

  @override
  String get researchRange => 'Faixa de Pesquisa';

  @override
  String get measuredEst => 'Medido (est.)';

  @override
  String get pupilForm => 'Forma Pupilar';

  @override
  String get decentrationPattern => 'Padrão de Descentração';

  @override
  String get flattenings => 'Achatamentos';

  @override
  String get protrusions => 'Protuberâncias';

  @override
  String zonesCount(int count) {
    return '$count zonas';
  }

  @override
  String get bilateralComparison => 'Comparação Bilateral';

  @override
  String get parameter => 'Parâmetro';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Razão P/I';

  @override
  String get ellipseness => 'Elipsidade';

  @override
  String get circularity => 'Circularidade';

  @override
  String get decentralization => 'Descentração';

  @override
  String get anwRatio => 'Proporção';

  @override
  String get normal => 'normal';

  @override
  String get elliptical => 'Elíptica';

  @override
  String get circular => 'Circular';

  @override
  String get irregular => 'Irregular';

  @override
  String get centered => 'Centralizada';

  @override
  String get offset => 'Deslocada';

  @override
  String get miosis => 'Miose';

  @override
  String get constricted => 'Contraída';

  @override
  String get dilated => 'Dilatada';

  @override
  String get mydriasis => 'Midríase';

  @override
  String get inner => 'Interna';

  @override
  String get outer => 'Externa';

  @override
  String get high => 'Alta';

  @override
  String get moderate => 'Moderada';

  @override
  String get savePdf => 'Salvar PDF';

  @override
  String get sharePdf => 'Compartilhar PDF';

  @override
  String get retakePhotos => 'Refazer Fotos';

  @override
  String scansLeftBanner(int count) {
    return '$count análises restantes';
  }

  @override
  String get upgrade => 'Atualizar';

  @override
  String get unlockUnlimited => 'Desbloquear Ilimitado';

  @override
  String get usedAllFreeScans => 'Você usou todas as análises gratuitas.';

  @override
  String get unlimitedScans => 'Análises ilimitadas';

  @override
  String get pdfReports => 'Relatórios PDF';

  @override
  String get scanHistoryFeature => 'Histórico de análises';

  @override
  String get bilateralAnalysis => 'Análise bilateral';

  @override
  String get monthly => 'Mensal';

  @override
  String get perMonth => '/mês';

  @override
  String get annual => 'Anual';

  @override
  String get perYear => '/ano';

  @override
  String get tenCredits => '10 Créditos';

  @override
  String get oneTime => 'único';

  @override
  String get best => 'MELHOR';

  @override
  String get purchaseCancelled => 'Compra cancelada';

  @override
  String purchaseFailed(String error) {
    return 'Compra falhou: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT salvo: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON salvo: $path';
  }

  @override
  String get pdfSaved => 'PDF Salvo!';

  @override
  String pdfFailed(String error) {
    return 'PDF Falhou: $error';
  }

  @override
  String get open => 'ABRIR';

  @override
  String failed(String error) {
    return 'Falhou: $error';
  }

  @override
  String get staticScans => 'Estático';

  @override
  String get plrScans => 'RFP';

  @override
  String get searchByNameOrComplaints => 'Buscar por nome ou queixas...';

  @override
  String get searchPlrRecords => 'Buscar registros RFP...';

  @override
  String get noScansYet => 'Nenhuma análise ainda';

  @override
  String get completedScansAppearHere => 'Análises concluídas aparecerão aqui';

  @override
  String get deleteScan => 'Excluir Análise?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Excluir análise de $name de $date?';
  }

  @override
  String get scanDeleted => 'Análise excluída';

  @override
  String get originalImagesNotFound =>
      'Imagens oculares originais não encontradas.';

  @override
  String get viewResults => 'Ver Resultados';

  @override
  String get avgPlr => 'RFP Méd';

  @override
  String get years => 'anos';

  @override
  String get anisocoria => 'Anisocoria';

  @override
  String get none => 'Nenhum';

  @override
  String get mild => 'Leve';

  @override
  String get severe => 'Grave';

  @override
  String zoneLabel(String zone) {
    return 'Zona: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Associado com $organ';
  }

  @override
  String get significant => 'Significativo';

  @override
  String get fair => 'Regular';

  @override
  String get low => 'Baixa';

  @override
  String get good => 'Bom';

  @override
  String get zones => 'Zonas';

  @override
  String get significanceWithinLimits => 'dentro dos limites aceitáveis';

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
  String get formTypeLeftObliqueEllipse => 'Elipse Oblíqua Esquerda';

  @override
  String get formTypeUnilateralEllipse => 'Elipse Unilateral';

  @override
  String get formTypeVentralDivergingEllipse => 'Elipse Divergente Ventral';

  @override
  String get formTypeFrontalDivergingEllipse => 'Elipse Divergente Frontal';

  @override
  String get formTypeEllipse => 'Elipse';

  @override
  String get formTypeChord => 'Corda';

  @override
  String get formTypeIrregular => 'Irregular';

  @override
  String get pupilFormCircleDesc =>
      'Forma pupilar circular normal. Nenhuma variação de padrão detectada.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Padrão oval horizontal. A pesquisa histórica associou isso a padrões do sistema nervoso autônomo que afetam as zonas de função respiratória e glandular.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Padrão oval vertical. A pesquisa histórica vinculou este padrão às zonas de circulação cerebral em estudos de reflexos autonômicos.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Padrão oval diagonal. A literatura de pesquisa associou isso a reflexos da zona urogenital em estudos autonômicos.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Padrão de elipse oblíqua esquerda. Observações históricas vincularam isso às zonas autonômicas urogenitais e de extremidades inferiores.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Padrão de elipse unilateral. A pesquisa indicou associações com zonas autonômicas respiratórias e brônquicas.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Elipse divergente ventral. Estudos históricos associaram isso às zonas autonômicas do corpo inferior e padrões de função motora.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Elipse divergente frontal. A literatura de pesquisa vinculou este padrão às zonas autonômicas cerebrais e superiores.';

  @override
  String get pupilFormOvalDesc =>
      'Padrão de deformação oval leve. Monitorar progressão nas observações de pesquisa.';

  @override
  String get pupilFormEllipseDesc =>
      'Padrão pupilar elíptico indicando variações do sistema autonômico em estudos históricos.';

  @override
  String get pupilFormChordDesc =>
      'Padrão de deformação tipo corda indicando influências autonômicas localizadas na literatura de pesquisa.';

  @override
  String get pupilFormIrregularDesc =>
      'Forma irregular sugerindo múltiplas influências de padrões autonômicos com base em observações históricas.';

  @override
  String get patternCentered => 'Centrado (Normal)';

  @override
  String get patternFrontal => 'Descentralização frontal';

  @override
  String get patternBasal => 'Descentralização basal';

  @override
  String get patternNasal => 'Descentralização nasal';

  @override
  String get patternTemporal => 'Descentralização temporal';

  @override
  String get patternMiddleNasal => 'Descentralização nasal média';

  @override
  String get patternMiddleTemporal => 'Descentralização temporal média';

  @override
  String get patternUpperNasal => 'Descentralização nasal superior';

  @override
  String get patternUpperTemporal => 'Descentralização temporal superior';

  @override
  String get patternLowerNasal => 'Descentralização nasal inferior';

  @override
  String get patternLowerTemporal => 'Descentralização temporal inferior';

  @override
  String get patternUpwards => 'Descentração - Para cima';

  @override
  String get patternDownwards => 'Descentração - Para baixo';

  @override
  String get patternUpwardsInwards => 'Descentração - Cima-Dentro';

  @override
  String get patternUpwardsOutwards => 'Descentração - Cima-Fora';

  @override
  String get decentrationCenteredDesc =>
      'Posicionamento pupilar normal dentro dos limites fisiológicos.';

  @override
  String get decentrationNasalRightDesc =>
      'Padrão nasal (Direito). A pesquisa histórica associou esta zona a reflexos autonômicos pulmonares.';

  @override
  String get decentrationNasalLeftDesc =>
      'Padrão nasal (Esquerdo). A literatura de pesquisa vinculou esta zona a padrões de função autonômica cardíaca.';

  @override
  String get decentrationTemporalDesc =>
      'Padrão temporal. Observações históricas associaram esta zona a reflexos autonômicos renais e reprodutivos.';

  @override
  String get decentrationFrontalRightDesc =>
      'Padrão frontal (Direito). A pesquisa associou esta zona a padrões de função cognitiva e cerebral.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Padrão frontal (Esquerdo). Estudos históricos vincularam esta zona a padrões autonômicos cerebrais.';

  @override
  String get decentrationBasalRightDesc =>
      'Padrão basal (Direito). A pesquisa indicou associações com reflexos de pressão intracraniana.';

  @override
  String get decentrationBasalLeftDesc =>
      'Padrão basal (Esquerdo). Observações históricas vincularam isso a padrões de zona inflamatória cerebral.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Padrão nasal superior (Direito). A pesquisa associou esta zona a reflexos autonômicos hepatobiliares.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Padrão nasal superior (Esquerdo). Estudos históricos vincularam isso às zonas esplênicas e diafragmáticas.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Padrão temporal superior. A pesquisa indicou associações com zonas autonômicas renais e reprodutivas.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Padrão nasal médio (Direito). Observações históricas vincularam isso às zonas de utilização de oxigênio e cardíacas.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Padrão nasal médio (Esquerdo). A pesquisa associou isso a padrões autonômicos neurológicos e cardíacos.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Padrão temporal médio (Direito). A pesquisa vinculou isso às zonas de regulação autonômica cardíaca.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Padrão temporal médio (Esquerdo). Estudos históricos associaram isso às zonas pulmonares e cardíacas.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Padrão nasal superior (Direito). A pesquisa indicou associações com zonas cognitivas e reflexos da coluna cervical.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Padrão nasal superior (Esquerdo). Observações históricas vincularam isso a padrões cognitivos e zonas cervicais.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Padrão temporal superior (Direito). A pesquisa associou esta zona a reflexos de nervos cranianos e auditivos.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Padrão temporal superior (Esquerdo). Estudos históricos vincularam isso às zonas neurovegetativas e da fala.';

  @override
  String get decentrationLowerNasalDesc =>
      'Padrão nasal inferior. A pesquisa indicou associações com zonas autonômicas urogenitais e lombossacrais.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Padrão temporal inferior (Direito). Observações históricas associaram isso às zonas metabólicas e hepáticas.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Padrão temporal inferior (Esquerdo). A pesquisa vinculou isso a padrões autonômicos cardíacos e esplênicos.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Padrão associado à zona central superior. A pesquisa histórica vinculou isso a reflexos autonômicos de regulação do humor e energia.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Padrão associado à zona temporal superior. A pesquisa indicou associações com reflexos autonômicos de nervos cranianos e auditivos.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Padrão associado à zona temporal média. Observações históricas vincularam isso a padrões autonômicos respiratórios e cardíacos.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Padrão associado à zona temporal inferior. A literatura de pesquisa associou isso às zonas autonômicas hepáticas e metabólicas.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Padrão associado à zona basal inferior. Estudos históricos vincularam isso a reflexos autonômicos renais e de extremidades inferiores.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Padrão associado à zona nasal inferior. A pesquisa indicou associações com zonas autonômicas urogenitais e pélvicas.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Padrão associado à zona nasal média. Observações históricas vincularam isso a padrões autonômicos de utilização de oxigênio e respiratórios.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Padrão associado à zona nasal superior. A literatura de pesquisa associou isso a reflexos autonômicos cognitivos e cervicais.';

  @override
  String get flatteningDefaultRightDesc =>
      'Variação de padrão do sistema nervoso autônomo detectada nesta zona com base em pesquisa histórica.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Padrão associado à zona central superior. A pesquisa histórica vinculou isso a padrões autonômicos de regulação do humor e neurológicos.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Padrão associado à zona temporal superior. A pesquisa indicou associações com zonas autonômicas neurovegetativas e da fala.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Padrão associado à zona temporal média. Observações históricas vincularam isso a reflexos autonômicos pulmonares e cardíacos.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Padrão associado à zona temporal inferior. A literatura de pesquisa associou isso a padrões autonômicos cardíacos e esplênicos.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Padrão associado à zona basal inferior. Estudos históricos vincularam isso às zonas autonômicas renais e eliminativas.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Padrão associado à zona nasal inferior. A pesquisa indicou associações com reflexos autonômicos urogenitais e lombossacrais.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Padrão associado à zona nasal média. Observações históricas vincularam isso a padrões autonômicos cardíacos e respiratórios.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Padrão associado à zona nasal superior. A literatura de pesquisa associou isso às zonas autonômicas cognitivas e cervicais.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Variação de padrão do sistema nervoso autônomo detectada nesta zona com base em pesquisa histórica.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Padrão de protrusão na zona central superior. A pesquisa associou isso a padrões de hiperativação simpática afetando zonas cerebrais.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Padrão de protrusão na zona temporal superior. Observações históricas vincularam isso a padrões de hiperatividade do sistema de nervos cranianos e auditivo.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Padrão de protrusão na zona temporal média. A pesquisa indicou associações com padrões simpáticos cardíacos e respiratórios.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Padrão de protrusão na zona temporal inferior. Estudos históricos vincularam isso às zonas simpáticas hepatobiliares e metabólicas.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Padrão de protrusão na zona basal inferior. A pesquisa associou isso a padrões de hiperatividade simpática renal e pélvica.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Padrão de protrusão na zona nasal inferior. Observações históricas vincularam isso às zonas de ativação simpática urogenital.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Padrão de protrusão na zona nasal média. A pesquisa indicou associações com padrões simpáticos gástricos e pancreáticos.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Padrão de protrusão na zona nasal superior. Estudos históricos vincularam isso às zonas de hiperativação simpática cognitiva e visual.';

  @override
  String get protrusionDefaultRightDesc =>
      'Padrão de hiperatividade do sistema nervoso simpático detectado nesta zona com base em observações de pesquisa.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Padrão de protrusão na zona central superior. A pesquisa associou isso a padrões simpáticos psicomotores e cerebrais.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Padrão de protrusão na zona temporal superior. Observações históricas vincularam isso às zonas de hiperatividade simpática neurovegetativa.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Padrão de protrusão na zona temporal média. A pesquisa indicou associações com padrões simpáticos pulmonares e cardíacos.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Padrão de protrusão na zona temporal inferior. Estudos históricos vincularam isso às zonas de ativação simpática esplênica e cardíaca.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Padrão de protrusão na zona basal inferior. A pesquisa associou isso a padrões de hiperatividade simpática pélvica e renal.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Padrão de protrusão na zona nasal inferior. Observações históricas vincularam isso às zonas de ativação simpática lombossacral.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Padrão de protrusão na zona nasal média. A pesquisa indicou associações com padrões simpáticos de ansiedade-cardíacos.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Padrão de protrusão na zona nasal superior. Estudos históricos vincularam isso às zonas de hiperativação simpática cognitiva e visual.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Padrão de hiperatividade do sistema nervoso simpático detectado nesta zona com base em observações de pesquisa.';

  @override
  String get anisocoriaNone =>
      'Tamanhos pupilares dentro dos limites normais. Nenhuma anisocoria significativa detectada.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisocoria detectada: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'E>D';

  @override
  String get anisocoriaDirectionDS => 'D>E';

  @override
  String get anisocoriaSeverityNone => 'Dentro dos limites normais.';

  @override
  String get anisocoriaSeverityMild =>
      'Diferença leve observada. Pode ser fisiológica.';

  @override
  String get anisocoriaSeverityModerate =>
      'Assimetria moderada. Observação de pesquisa anotada.';

  @override
  String get anisocoriaSeveritySevere =>
      'Assimetria significativa. Observação de pesquisa sinalizada.';

  @override
  String get largerPupilEqual => 'igual';

  @override
  String get largerPupilOS => 'OE (Esquerdo)';

  @override
  String get largerPupilOD => 'OD (Direito)';

  @override
  String get decentrationWithinLimits => 'Dentro dos limites normais.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Deslocamento: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Central-Superior';

  @override
  String get zoneUpperNasal => 'Nasal-Superior';

  @override
  String get zoneMiddleNasal => 'Nasal-Médio';

  @override
  String get zoneLowerNasal => 'Nasal-Inferior';

  @override
  String get zoneLowerBasal => 'Basal-Inferior';

  @override
  String get zoneLowerTemporal => 'Temporal-Inferior';

  @override
  String get zoneMiddleTemporal => 'Temporal-Médio';

  @override
  String get zoneUpperTemporal => 'Temporal-Superior';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Basal';

  @override
  String get zoneUnknown => 'Desconhecido';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Achatamento $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Protrusão $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Modo Iriscópio USB';

  @override
  String get iriscopeExternal => 'Iriscópio / Externo';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => 'Usar câmera USB ou iriscópio conectado';

  @override
  String get detectedCameras => 'Câmeras Detectadas';

  @override
  String get externalCamera => 'Câmera Externa';

  @override
  String cameraIndex(int index) {
    return 'Câmera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Nenhuma câmera externa detectada.\nConecte um iriscópio USB para habilitar.';

  @override
  String get refresh => 'Atualizar';

  @override
  String get selectCameraSource => 'Selecionar Fonte da Câmera';

  @override
  String camerasDetected(int count) {
    return '$count câmeras detectadas';
  }

  @override
  String camerasAvailable(int count) {
    return '$count câmeras disponíveis';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Câmera Externa $index';
  }

  @override
  String get qualityGatedRear =>
      'Captura automática com controle de qualidade (câmera traseira)';

  @override
  String get qualityGatedFront =>
      'Captura automática com controle de qualidade (câmera frontal)';

  @override
  String get usbCameraInfo => 'Info da Câmera USB';

  @override
  String get connected => 'Conectado';

  @override
  String get waiting => 'Aguardando...';

  @override
  String get disconnected => 'Desconectado';

  @override
  String get waitingForUsbCamera => 'Aguardando Câmera USB';

  @override
  String get connectIriscopePrompt =>
      'Conecte seu iriscópio via adaptador USB OTG.\nConceda permissão quando solicitado.';

  @override
  String get usbCameraIssue => 'Problema com Câmera USB';

  @override
  String get pleaseConnectIriscope =>
      'Por favor conecte seu iriscópio ou câmera USB.';

  @override
  String get retryConnection => 'Tentar Novamente';

  @override
  String get troubleshootingTips => 'Dicas de Solução';

  @override
  String get tipUsbOtgAdapter =>
      'Certifique-se de que o adaptador USB OTG está conectado corretamente';

  @override
  String get tipUsbHostMode =>
      'Verifique se o dispositivo suporta modo USB Host';

  @override
  String get tipReconnectCamera => 'Tente desconectar e reconectar a câmera';

  @override
  String get tipGrantPermissions => 'Conceda permissões USB quando solicitado';

  @override
  String get tipUnlockDevice =>
      'Alguns dispositivos precisam estar desbloqueados';

  @override
  String get back => 'Voltar';

  @override
  String get switchEye => 'Trocar Olho';

  @override
  String get state => 'Estado';

  @override
  String get status => 'Status';

  @override
  String get usingFlutterUvcPlugin =>
      'Usando plugin flutter_uvc_camera\npara suporte a dispositivos USB Video Class.';

  @override
  String get initialized => 'Inicializado';

  @override
  String get notReady => 'Não Pronto';

  @override
  String get captureDistanceMatch => 'Correspondência de Distância';

  @override
  String get irisSize => 'Tamanho da Íris';

  @override
  String get distanceMatched => 'Distância Correspondente';

  @override
  String get distanceMismatch => 'Distância Não Corresponde';

  @override
  String get excellentMatch => 'Correspondência excelente';

  @override
  String get goodMatch => 'Boa correspondência';

  @override
  String get acceptableMatch => 'Correspondência aceitável';

  @override
  String get considerRetaking =>
      'Distância não corresponde - considere refazer';

  @override
  String get qualityReady => 'Pronto! Mantenha firme...';

  @override
  String get qualityTooBlurry => 'Mantenha a câmera firme';

  @override
  String get qualityTooDark => 'Precisa de mais luz';

  @override
  String get qualityTooBright => 'Muito claro - reduza a luz';

  @override
  String get qualityNoContrast => 'Ajuste o ângulo da iluminação';

  @override
  String get qualityNoPupil => 'Centralize a pupila no quadro';

  @override
  String get qualityNotCentered => 'Mova o olho para o centro';

  @override
  String get qualityNotAnEye => 'Nenhum olho detectado';

  @override
  String get qualityProcessing => 'Processando...';

  @override
  String get distanceMatchedCheck => '✓ Distância correspondente';

  @override
  String get distanceGoodMatchCheck => '✓ Boa correspondência';

  @override
  String get distanceSlightlyBack => 'Um pouco para trás ↔';

  @override
  String get distanceSlightlyCloser => 'Um pouco mais perto ↔';

  @override
  String get distanceAlmostThere => 'Quase lá...';

  @override
  String get distanceMoveBack => 'Afaste-se ←←';

  @override
  String get distanceMoveCloser => 'Aproxime-se →→';

  @override
  String get distanceTooClose => 'Muito perto! Afaste-se';

  @override
  String get distanceTooFar => 'Muito longe! Aproxime-se';

  @override
  String get distanceStabilizing => 'Estabilizando...';

  @override
  String distanceLabel(int percent) {
    return 'Distância: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Câmera Frontal';

  @override
  String get rearCameraLabel => 'Câmera Traseira';

  @override
  String get startingCamera => 'Iniciando câmera...';

  @override
  String get eyeNotDetected => 'Olho Não Detectado';

  @override
  String get tryAgain => 'Tentar Novamente';

  @override
  String get indicatorEye => 'Olho';

  @override
  String get indicatorSharp => 'Nitidez';

  @override
  String get indicatorLight => 'Luz';

  @override
  String get indicatorFocus => 'Foco';

  @override
  String get indicatorPupil => 'Pupila';

  @override
  String get indicatorIris => 'Íris';

  @override
  String get indicatorMatch => 'Corresp.';

  @override
  String get checkImageShape => 'Forma da Imagem';

  @override
  String get checkCircularIris => 'Íris Circular';

  @override
  String get checkDarkPupil => 'Pupila Escura';

  @override
  String get checkIrisTexture => 'Textura da Íris';

  @override
  String get checkPupilIrisStructure => 'Estrutura Pupila-Íris';

  @override
  String get checkNaturalColors => 'Cores Naturais';

  @override
  String get checkEdgePattern => 'Padrão de Bordas';

  @override
  String get errorImageShapeIncorrect =>
      'Forma incorreta - certifique-se que o olho preencha o quadro';

  @override
  String get errorNoEyeDetected =>
      'Nenhum olho detectado - centralize a íris no quadro';

  @override
  String get errorNoPupilDetected =>
      'Nenhuma pupila detectada - garanta boa iluminação';

  @override
  String get errorNoIrisTexture =>
      'Sem textura da íris - aproxime-se mais do olho';

  @override
  String get errorUnusualColors =>
      'Cores incomuns detectadas - evite telas/reflexos';

  @override
  String get errorTooManyEdges => 'Muitas bordas retas - pode não ser um olho';

  @override
  String get errorNotValidEye => 'Imagem de olho inválida - tente novamente';

  @override
  String get holdStillCapturing => 'Fique parado - capturando...';

  @override
  String get adjustDistanceFirst => 'Ajuste a distância primeiro';

  @override
  String get stabilizingReading => 'Estabilizando...';

  @override
  String get autoCaptureWhenReady => 'Captura automática quando pronto';

  @override
  String get tapOrWaitAutoCapture => 'Toque ou aguarde captura automática';

  @override
  String get validatingImage => 'Validando...';

  @override
  String get capturingStatus => 'Capturando...';

  @override
  String get adjustPositionStatus => 'Ajuste a posição';

  @override
  String get validationTip =>
      'Dica: Garanta boa iluminação, segure a câmera a 10-15cm do olho, evite reflexos';

  @override
  String get validationChecksTitle => 'Verificações de Validação:';

  @override
  String confidenceLabel(int percent) {
    return 'Confiança:';
  }

  @override
  String get incompleteData => 'Dados incompletos';

  @override
  String get irisDiameterLabel => 'íris ø';

  @override
  String get plrResponseCurve => 'Curva de Resposta PLR';

  @override
  String get plrLatency => 'Latência';

  @override
  String get plrVelocity => 'Velocidade';

  @override
  String get plrRecoveryTime => 'Recuperação';

  @override
  String get plrRecoveryRatio => 'Razão Rec.';

  @override
  String get plrEnhancedMetrics => 'Métricas PLR Avançadas';

  @override
  String get plrNormalLatency => 'Normal: 200-500ms';

  @override
  String get plrNormalConstriction => 'Normal: 10-30%';

  @override
  String get plrNormalVelocity => 'Normal: 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'Valores de Referência PLR Normais';

  @override
  String get plrSubjectInfo => 'Informação do Sujeito';

  @override
  String get plrTestType => 'Reflexo Pupilar à Luz';

  @override
  String get plrAnalysisSummary => 'Resumo da Análise';

  @override
  String get plrTotalFrames => 'Total de Quadros Analisados';

  @override
  String get plrSuccessRate => 'Taxa de Sucesso';

  @override
  String get plrMaxConstriction => 'Constrição Máxima';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => 'Coroa Nervosa Autônoma (ANW)';

  @override
  String get anwAbnormal => 'Anormal';

  @override
  String get anwDiameter => 'Diâmetro';

  @override
  String get anwPerimeter => 'Perímetro';

  @override
  String get anwAsymmetry => 'Assimetria';

  @override
  String get anwElevated => 'Elevado';

  @override
  String get anwFormType => 'Tipo de Forma';

  @override
  String get anwRegular => 'Regular';

  @override
  String get anwDrawnIn => 'Contraído';

  @override
  String get anwIndented => 'Recortado';

  @override
  String get anwLacerated => 'Lacerado';

  @override
  String get anwSpastic => 'Espástico';

  @override
  String get anwAtonic => 'Atônico';

  @override
  String get anwTonicState => 'Padrao Tonico Historico';

  @override
  String get anwParasympathotonic => 'Padrao parassimpaticotonico';

  @override
  String get anwSympathotonicState => 'Padrao simpaticotonico';

  @override
  String get anwShiftDetected => 'Padrao Historico de Deslocamento';

  @override
  String get anwConstrictionDetected => 'Constrição Detectada';

  @override
  String get anwFindings => 'Achados';

  @override
  String get anwRatioComparison => 'Proporção ANW';

  @override
  String get bilateralANWComparison => 'Comparação Bilateral de ANW';

  @override
  String get anwSymmetryNormal => 'Simetria de ANW dentro dos limites normais.';

  @override
  String get anwAsymmetryDetected =>
      'Assimetria de ANW detectada entre os olhos.';

  @override
  String get functionalFrustration =>
      'Frustração funcional na correlação entre os sistemas nervosos simpático e parassimpático.';

  @override
  String get anwParasympathotonicDesc =>
      'Observacoes historicas associaram isto a maior sensibilidade liminar, atividade reflexa acelerada e funcoes secretorias/evacuatorias gastrointestinais aumentadas.';

  @override
  String get anwSympathotonicDesc =>
      'Observacoes historicas associaram isto a menor sensibilidade liminar, atividade reflexa desacelerada e funcoes secretorias/evacuatorias gastrointestinais reduzidas.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Estudos historicos segundo Velchover associaram isto a padroes de sobrecarga do ventriculo esquerdo e estresse cardiaco.';

  @override
  String get anwFrontalConstricted =>
      'Zona frontal do cinto pupilar está contraída.';

  @override
  String get anwBasalConstricted =>
      'Zona basal do cinto pupilar está contraída.';

  @override
  String get anwFrontalBasalConstricted =>
      'Zonas frontal e basal do cinto pupilar estão contraídas.';

  @override
  String get helpTitle => 'Ajuda e Guia do Usuário';

  @override
  String get helpTabQuickStart => 'Início Rápido';

  @override
  String get helpTabCnriAnalysis => 'Análise CNRI';

  @override
  String get helpTabShortcuts => 'Atalhos';

  @override
  String get helpTabTroubleshooting => 'Solução de Problemas';

  @override
  String get helpOnlineDocs => 'Documentação Online';

  @override
  String get helpContactSupport => 'Contatar Suporte';

  @override
  String get helpGettingStarted => 'Começando';

  @override
  String get helpStep1Title => 'Conecte Seu Iriscópio';

  @override
  String get helpStep1Desc =>
      'Conecte seu Dino-Lite ou iriscópio USB compatível.';

  @override
  String get helpStep2Title => 'Insira Informações do Paciente';

  @override
  String get helpStep2Desc =>
      'Preencha nome, idade, sexo e queixas principais do paciente.';

  @override
  String get helpStep3Title => 'Capture o Olho Direito (OD)';

  @override
  String get helpStep3Desc =>
      'Posicione o iriscópio e capture a imagem do olho direito.';

  @override
  String get helpStep4Title => 'Capture o Olho Esquerdo (OS)';

  @override
  String get helpStep4Desc =>
      'Repita para o olho esquerdo com iluminação consistente.';

  @override
  String get helpStep5Title => 'Revise a Análise';

  @override
  String get helpStep5Desc =>
      'O app analisa razão P/I, forma pupilar e características ANW.';

  @override
  String get helpStep6Title => 'Exporte o Relatório';

  @override
  String get helpStep6Desc => 'Salve como formato PDF, TXT ou JSON.';

  @override
  String get helpTipBestResults =>
      'Para melhores resultados: Use iluminação consistente e mantenha 2-3cm de distância do iriscópio.';

  @override
  String get helpCnriProtocolFeatures => 'Características do Protocolo CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Razão Pupila/Íris (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal: 20-30%. Valores fora podem indicar desequilíbrio autonômico.';

  @override
  String get helpFeaturePupilFormTitle => 'Análise de Forma Pupilar';

  @override
  String get helpFeaturePupilFormDesc =>
      'Detecta padrões ovais, direção de descentração e excentricidade.';

  @override
  String get helpFeatureAnwTitle => 'Avaliação ANW (Colarete)';

  @override
  String get helpFeatureAnwDesc =>
      'Analisa razão, regularidade de forma, deslocamentos setoriais e estado tônico.';

  @override
  String get helpFeatureZoneTitle => 'Análise de Zonas';

  @override
  String get helpFeatureZoneDesc =>
      'Mapeia achatamentos/protrusões para zonas de órgãos CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Comparação Bilateral';

  @override
  String get helpFeatureBilateralDesc =>
      'Compara OD vs OS para detectar assimetrias.';

  @override
  String get helpFeatureMlTitle => 'Comparação ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'O modelo ONNX CNN fornece medições secundárias para comparação.';

  @override
  String get helpKeyboardShortcuts => 'Atalhos de Teclado';

  @override
  String get helpCameraControls => 'Controles de Câmera';

  @override
  String get helpShortcutSpace => 'Capturar imagem';

  @override
  String get helpShortcutCtrlS => 'Salvar relatório PDF';

  @override
  String get helpShortcutCtrlO => 'Abrir imagem da galeria';

  @override
  String get helpShortcutCtrlH => 'Ver histórico de exames';

  @override
  String get helpShortcutF11 => 'Alternar tela cheia';

  @override
  String get helpShortcutEsc => 'Voltar / Cancelar';

  @override
  String get helpShortcutScroll => 'Aproximar/afastar';

  @override
  String get helpShortcutDoubleClick => 'Redefinir zoom';

  @override
  String get helpCommonIssues => 'Problemas Comuns';

  @override
  String get helpIssueCameraNotDetected => 'Câmera não detectada';

  @override
  String get helpIssueCameraSolution1 => 'Verifique conexão USB';

  @override
  String get helpIssueCameraSolution2 => 'Tente porta USB diferente';

  @override
  String get helpIssueCameraSolution3 => 'Instale drivers Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Reinicie o aplicativo';

  @override
  String get helpIssuePupilDetectionFails => 'Falha na detecção de pupila';

  @override
  String get helpIssuePupilSolution1 => 'Assegure iluminação adequada';

  @override
  String get helpIssuePupilSolution2 => 'Centralize pupila no quadro';

  @override
  String get helpIssuePupilSolution3 => 'Limpe lente do iriscópio';

  @override
  String get helpIssuePupilSolution4 => 'Ajuste foco manualmente';

  @override
  String get helpIssuePdfExportFails => 'Falha na exportação PDF';

  @override
  String get helpIssuePdfSolution1 => 'Verifique permissões de pasta';

  @override
  String get helpIssuePdfSolution2 => 'Assegure espaço disponível em disco';

  @override
  String get helpIssuePdfSolution3 => 'Feche arquivos PDF abertos';

  @override
  String get helpIssuePdfSolution4 => 'Tente exportar TXT primeiro';

  @override
  String get helpCaptureChecklistTitle => 'Checklist de Captura';

  @override
  String get helpCaptureChecklist1 =>
      'Mantenha a pupila centralizada e totalmente visível no enquadramento.';

  @override
  String get helpCaptureChecklist2 =>
      'Use iluminação uniforme e reduza brilho ou reflexos na córnea.';

  @override
  String get helpCaptureChecklist3 =>
      'Mantenha distância semelhante do iriscópio para olho direito e esquerdo.';

  @override
  String get helpCaptureChecklist4 =>
      'Refaça o foco ou capture novamente se a borda da pupila parecer suave ou borrada.';

  @override
  String get helpExportSettingsTitle => 'Configurações de Exportação';

  @override
  String get helpExportSettingsDesc =>
      'Auto-salvar PDF pode salvar um relatório após a análise, Incluir Imagens controla se as fotos aparecem no PDF, e Comparação ONNX CNN adiciona valores comparativos aos relatórios.';

  @override
  String get helpHybridScoreTitle => 'Confiança e Grau Híbridos';

  @override
  String get helpHybridScoreDesc =>
      'A confiança e o grau exibidos combinam qualidade geométrica clássica com concordância ML, refletindo a confiabilidade da medição e não um diagnóstico.';

  @override
  String get helpAnomalyGuideTitle => 'Como Ler Achatamentos e Protrusões';

  @override
  String get helpAnomalyGuideDesc =>
      'Achatamentos indicam tração relativa para dentro e protrusões indicam tração para fora ao longo da borda pupilar; cada cartão mostra zona, magnitude e associação mapeada.';

  @override
  String get helpZoneOverlayGuideTitle => 'Sobreposição de Zonas';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Use a sobreposição de zonas para inspecionar visualmente as posições dos setores e conferir onde as anomalias detectadas ficam ao redor da pupila e da íris.';

  @override
  String get helpContactSupportTip =>
      'Contate helpdesk@cnri.edu para assistência.';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsCameraIriscope => 'CÂMERA / IRISCÓPIO';

  @override
  String get settingsPreferredCamera => 'Câmera Preferida:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'Câmera USB';

  @override
  String get settingsCameraAutoDetect => 'Auto-detectar';

  @override
  String get settingsDefaultZoom => 'Zoom Padrão:';

  @override
  String get settingsAnalysis => 'ANÁLISE';

  @override
  String get settingsShowMlComparison => 'Mostrar Comparação ML';

  @override
  String get settingsShowZoneOverlay => 'Mostrar Sobreposição de Zonas';

  @override
  String get settingsExportReports => 'EXPORTAÇÃO E RELATÓRIOS';

  @override
  String get settingsAutoSavePdf => 'Auto-salvar PDF';

  @override
  String get settingsIncludeImages => 'Incluir Imagens';

  @override
  String get settingsSaved => 'Configurações salvas';

  @override
  String get aboutResearchEdition => 'Edição de Pesquisa';

  @override
  String aboutVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get aboutLicense => 'Licença';

  @override
  String get aboutLicensedTo => 'Licenciado para:';

  @override
  String get aboutExpires => 'Expira:';

  @override
  String get aboutManageLicense => 'Gerenciar Licença';

  @override
  String get aboutBasedOnCnri => 'Baseado no Protocolo CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Site';

  @override
  String get aboutPrivacy => 'Privacidade';

  @override
  String get languageSelectTitle => 'Selecionar Idioma';

  @override
  String get selectLanguage => 'Selecionar Idioma';

  @override
  String get languageChanged => 'Idioma Alterado';

  @override
  String languageChangedMessage(String language) {
    return 'Idioma do app definido para $language';
  }

  @override
  String get languageSystemNotAvailable => 'Sistema de idioma não disponível';

  @override
  String get licenseLoading => 'Carregando...';

  @override
  String get licenseWelcome => 'Bem-vindo ao PupilMetrics!';

  @override
  String get licenseTrialFeatures =>
      'Teste gratuito de 14 dias • Recursos completos';

  @override
  String get licenseStartTrial => 'Iniciar Teste Gratuito';

  @override
  String get licenseEnterKey => 'Inserir Licença';

  @override
  String get licenseFreeTrial => 'Teste Gratuito';

  @override
  String licenseDaysRemaining(int count) {
    return '$count dias restantes';
  }

  @override
  String get licenseTrialEnded => 'Teste Encerrado';

  @override
  String get licenseEnterToContinue => 'Insira licença para continuar';

  @override
  String get licenseStandard => 'Licença Padrão';

  @override
  String get licenseProfessional => 'Licença Profissional';

  @override
  String get licenseEnterprise => 'Licença Empresarial';

  @override
  String get licenseLicensed => 'Licenciado';

  @override
  String get licenseActive => 'Ativo';

  @override
  String get licenseTrialUser => 'Usuário de Teste';

  @override
  String get licenseLifetime => 'Vitalícia';

  @override
  String get licenseNotSetUp => 'Não Configurada';

  @override
  String get trialExpiredTitle => 'Período de Teste Encerrado';

  @override
  String get trialExpiredMessage =>
      'Seu teste de 14 dias terminou. Para continuar analisando imagens de íris, por favor adquira uma licença.';

  @override
  String get trialExpiredCanStill => 'Você ainda pode:';

  @override
  String get trialExpiredViewAnalyses => 'Ver suas análises anteriores';

  @override
  String get trialExpiredExportReports => 'Exportar relatórios existentes';

  @override
  String get trialExpiredAccessHistory => 'Acessar histórico de exames';

  @override
  String get trialExpiredMaybeLater => 'Talvez Depois';

  @override
  String get licenseRegistration => 'Registro de Licença';

  @override
  String get licenseStatusValid => 'Licenciado';

  @override
  String get licenseStatusTrialActive => 'Teste Gratuito';

  @override
  String get licenseStatusTrialExpired => 'Teste Encerrado';

  @override
  String get licenseStatusExpired => 'Licença Expirada';

  @override
  String get licenseStatusInvalid => 'Licença Inválida';

  @override
  String get licenseStatusUnregistered => 'Não Configurada';

  @override
  String get licenseStatusMachineMismatch => 'Computador Diferente';

  @override
  String get licenseStatusNetworkError => 'Erro de Conexão';

  @override
  String get licenseEnterKeyTitle => 'Inserir Chave de Licença';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Seu Nome';

  @override
  String get licenseEmailAddress => 'Endereço de E-mail';

  @override
  String get licenseMachineId => 'ID da Máquina';

  @override
  String get licenseCopyMachineId => 'Copiar ID da Máquina';

  @override
  String get licenseMachineIdCopied =>
      'ID da máquina copiado para área de transferência';

  @override
  String get licenseValidationKeyRequired =>
      'Por favor insira sua chave de licença';

  @override
  String get licenseValidationKeyFormat =>
      'A chave deve ter 20 caracteres (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Por favor insira seu nome';

  @override
  String get licenseValidationEmailRequired => 'Por favor insira seu e-mail';

  @override
  String get licenseValidationEmailInvalid =>
      'Por favor insira um e-mail válido';

  @override
  String get licenseActivate => 'Ativar Licença';

  @override
  String get licenseContinueTrial => 'Continuar Teste';

  @override
  String get licenseBuyLicense => 'Comprar Licença';

  @override
  String get licenseNeedHelp => 'Precisa de ajuda?';

  @override
  String get licenseLicenseAgreement => 'Contrato de Licença';

  @override
  String get licenseActivatedSuccess => 'Licença Ativada com Sucesso!';

  @override
  String get licenseMsgMachineMismatch =>
      'Esta licença está registrada em outro computador. Por favor use seu dispositivo original ou contate o suporte.';

  @override
  String get licenseMsgTrialEnded =>
      'Seu teste gratuito terminou. Insira uma chave de licença para continuar usando todos os recursos.';

  @override
  String get licenseMsgExpired =>
      'Sua licença expirou. Por favor renove para continuar.';

  @override
  String get licenseMsgNeedsSetup =>
      'A licença precisa ser configurada. Inicie seu teste gratuito ou insira uma chave de licença.';

  @override
  String get licenseMsgCheckFormat =>
      'Por favor verifique o formato da sua chave. Deve parecer assim: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Esta chave de licença não foi reconhecida. Por favor verifique e tente novamente.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Esta chave já está registrada em outro computador.';

  @override
  String get licenseMsgContactSupport =>
      'Esta licença expirou. Por favor contate o suporte para renovação.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Licença ativada com sucesso! Obrigado pela sua compra.';

  @override
  String get licenseMsgUnableToActivate =>
      'Não foi possível ativar a licença. Por favor verifique sua conexão com a internet e tente novamente.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Bem-vindo! Seu teste gratuito de $days dias começou.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Teste ativo: $days dias restantes.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Teste gratuito ativo';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Licença ativa - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Não foi possível ativar esta chave de licença.';

  @override
  String get licenseMsgNoLongerValid => 'A licença não é mais válida.';

  @override
  String get licenseMsgUnableToVerify =>
      'Não foi possível verificar esta chave de licença. Por favor contate o suporte.';

  @override
  String get trialStartedSnackbar => 'Teste Iniciado!';

  @override
  String get trialStartedMessage => 'Aproveite 14 dias de acesso completo';

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
  String get focusBlur => 'focar / desfocar';

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
  String get dockLeft => 'acoplar esquerda';

  @override
  String get dockRight => 'acoplar direita';

  @override
  String get undock => 'desacoplar';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'redefinir';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'transparente';

  @override
  String get red => 'vermelho';

  @override
  String get green => 'verde';

  @override
  String get blue => 'azul';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'superior esquerdo';

  @override
  String get topCenter => 'superior centro';

  @override
  String get topRight => 'superior direito';

  @override
  String get centerLeft => 'centro esquerdo';

  @override
  String get centerRight => 'centro direito';

  @override
  String get bottomLeft => 'inferior esquerdo';

  @override
  String get bottomCenter => 'inferior centro';

  @override
  String get bottomRight => 'inferior direito';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Definir';

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
  String get defaultIcon => 'Padrão';

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
  String get dragToMoveArea => 'Arrastar para mover';

  @override
  String get dragToResizeArea => 'Arrastar para redimensionar';

  @override
  String get dragToResizeAreaExample => 'Exemplo de área redimensionável';

  @override
  String get closeWindowConfirmation =>
      'Tem certeza de que deseja fechar esta janela?';

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
  String get plrReportTitle => 'Relatorio de Analise PLR';

  @override
  String get plrResearchOnlyTitle => 'APENAS PARA PESQUISA/EDUCACAO';

  @override
  String get plrResearchDisclaimer =>
      'Os resultados NAO sao diagnosticos medicos. Consulte um profissional de saude.';

  @override
  String get plrNameLabel => 'Nome';

  @override
  String plrAgeYears(int age) {
    return 'Idade: $age anos';
  }

  @override
  String get plrTestLabel => 'Teste';

  @override
  String get plrSummaryTitle => 'Resumo PLR';

  @override
  String plrGradeValue(String grade) {
    return 'Grau $grade';
  }

  @override
  String get plrStatusLabel => 'Status';

  @override
  String get plrDetectedStatus => 'PLR DETECTADO';

  @override
  String get plrWeakNotDetectedStatus => 'FRACO/NAO DETECTADO';

  @override
  String get plrRecoveryTimeLabel => 'Tempo de recuperacao';

  @override
  String get plrRecoveryRatioLabel => 'Taxa de recuperacao';

  @override
  String get plrChartDescription =>
      'Representacao visual da resposta pupilar ao longo do tempo';

  @override
  String plrPiRange(String min, String max) {
    return 'Faixa P/I: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Dados de quadros';

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
    return 'Sucesso: $success | Falha: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latencia: 200-500ms (tempo ate a resposta inicial)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Constricao: reducao de 10-30% em relacao a linha de base';

  @override
  String get plrReferenceVelocityLine => '• Velocidade: 1.5-4.0%/segundo';

  @override
  String get plrReferenceRecoveryLine =>
      '• Recuperacao: >75% de retorno a linha de base em 5 segundos';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Recuperacao: >75% de retorno a linha de base em 5s';

  @override
  String plrShareSubject(String eye) {
    return 'Relatorio de Analise PLR - $eye';
  }

  @override
  String get plrTextReportTitle => 'RELATORIO DE ANALISE DE VIDEO PLR';

  @override
  String get plrTextDisclaimerTitle =>
      'AVISO: apenas para pesquisa/fins educacionais';

  @override
  String get plrTextDisclaimerBody =>
      'Os resultados NAO sao diagnosticos medicos.';

  @override
  String get plrOverallGradeLabel => 'Classificacao geral';

  @override
  String get plrEndOfReport => 'FIM DO RELATORIO';

  @override
  String get zoneOverlay => 'Sobreposição de Zonas';

  @override
  String get tipDragImage =>
      'Dica: arraste a imagem para alinhar o limbo com os círculos.';

  @override
  String get overlayMetrics => 'Métricas de Sobreposição';

  @override
  String get piRatioLabel => 'Razão P/I:';

  @override
  String get ellipsenessLabel => 'Elipticidade:';

  @override
  String get decentralizationLabel => 'Descentralização:';

  @override
  String get detectedFindings => 'Achados detectados';

  @override
  String get anwCollarette => 'ANW / COLARETE';

  @override
  String get observerNotes => 'Notas do observador';

  @override
  String get observerNotesHint =>
      'Insira observações clínicas, achados de zona, padrões…';

  @override
  String get autoCenter => 'Auto-centralizar';

  @override
  String get anwRing => 'Anel ANW';

  @override
  String get axisGrid => 'Eixo/Grade';

  @override
  String get chart => 'Gráfico';

  @override
  String get hoverToIdentify =>
      'Passe o cursor ou toque em uma zona para identificar';

  @override
  String get organsMode => 'Modo órgãos — passe sobre a íris para identificar';

  @override
  String get mildSizeDiff =>
      'Diferença leve de tamanho. Pode ser variação fisiológica.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Dentro da faixa de pesquisa para idade $age ($group)';
  }

  @override
  String get formLabel => 'Forma:';

  @override
  String get flatteningLabel => 'Achatamento:';

  @override
  String get protrusionLabel => 'Protrusão:';

  @override
  String get decentrationLabel => 'Descentração:';

  @override
  String get pupilSizeLabel => 'Tamanho pupilar:';

  @override
  String get anwRatioLabel => 'Razão ANW:';

  @override
  String get anwToneLabel => 'Tônus ANW:';

  @override
  String get noMajorODAnomalies => 'Sem anomalias pupilares OD significativas.';

  @override
  String get noMajorOSAnomalies => 'Sem anomalias pupilares OS significativas.';

  @override
  String get anwNotAssessed => 'ANW: não avaliado';

  @override
  String get manualAlignmentAid =>
      'Auxílio de alinhamento manual apenas para revisão. Arraste a imagem ou use Auto-centralizar.';

  @override
  String get frontalShift => 'S: Padrao de deslocamento frontal.';

  @override
  String get cerebralCirculation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de circulacao cerebral.';

  @override
  String get middleTemporalShift => 'D: Padrao de deslocamento medio-temporal.';

  @override
  String get respiratoryCardiac =>
      'Estudos historicos segundo Velchover associaram isto a padroes autonomicos respiratorios e cardiacos.';

  @override
  String get findings => 'Achados:';

  @override
  String get analysisReportTitle => 'Relatorio de Analise Pupilar';

  @override
  String get reportResearchVersion => 'Versao de Pesquisa';

  @override
  String get reportDisclaimerTitle =>
      'AVISO: apenas para pesquisa/fins educacionais';

  @override
  String get reportDisclaimerBody =>
      'Os resultados sao observacoes de pesquisa e NAO diagnosticos medicos.';

  @override
  String get reportPersonInformationTitle => 'Informacoes da pessoa';

  @override
  String get reportAgeGroupLabel => 'Faixa etaria';

  @override
  String get reportPupilSizeComparisonTitle => 'Comparacao do tamanho pupilar';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Metricas de distancia de captura';

  @override
  String get reportResearchObservationsTitle => 'Observacoes de pesquisa';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Notas do observador (sobreposicao de zonas)';

  @override
  String get reportEndOfReport => 'FIM DO RELATORIO';

  @override
  String get reportGradeLabel => 'Grau';

  @override
  String get reportPupilFormTitle => 'Forma pupilar';

  @override
  String get reportDecentrationTitle => 'Descentracao';

  @override
  String get reportFlatteningsTitle => 'Achatamentos';

  @override
  String get reportProtrusionsTitle => 'Protusoes';

  @override
  String get reportAnwParametersTitle => 'Coroa nervosa autonoma (ANW)';

  @override
  String get reportTonicStateLabel => 'Padrao Tonico Historico';

  @override
  String get reportShiftDetectedTitle => 'Padrao Historico de Deslocamento';

  @override
  String get reportClinicalLabel => 'Nota Historica';

  @override
  String get reportConstrictionDetectedTitle => 'Constricao detectada';

  @override
  String get reportSeverityLabel => 'Severidade';

  @override
  String get reportReferenceValuesTitle =>
      'Valores de referencia (Protocolo de Pesquisa CNRI)';

  @override
  String get reportMatchLabel => 'Correspondencia';

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
    return 'Relatorio de Analise Pupilar - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Segue em anexo o relatorio de analise pupilar de $patientName, gerado em $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Abaixo da faixa de pesquisa para idade $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Acima da faixa de pesquisa para idade $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Lactente';

  @override
  String get ageGroupChild15 => 'Crianca (1-5)';

  @override
  String get ageGroupChild611 => 'Crianca (6-11)';

  @override
  String get ageGroupTeen => 'Adolescente';

  @override
  String get ageGroupAdult2039 => 'Adulto (20-39)';

  @override
  String get ageGroupAdult4059 => 'Adulto (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Idoso (60+)';

  @override
  String get middleNasalShift => 'Padrao de deslocamento medio-nasal.';

  @override
  String get upperTemporalShift => 'Padrao de deslocamento temporal-superior.';

  @override
  String get lowerTemporalShift => 'Padrao de deslocamento temporal-inferior.';

  @override
  String get basalShift => 'Padrao de deslocamento basal.';

  @override
  String get vagusStellateAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de hipofuncao do nervo vago ou do ganglio estrelado.';

  @override
  String get venaCavaInferiorAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de disturbio hemodinamico na veia cava inferior.';

  @override
  String get vertebralArteryAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de circulacao da arteria vertebral.';

  @override
  String get smallPelvisAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes congestivos na pelve menor.';

  @override
  String get openZoneOverlay => 'Abrir sobreposicao de zonas';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'Opacidade do grafico';

  @override
  String get irisSizeNotAvailable => 'Dados de tamanho da iris nao disponiveis';

  @override
  String get ratio => 'Proporcao';

  @override
  String get reportRefPiRatio => 'Relacao Pupila/Iris: Normal 20-30%';

  @override
  String get reportRefEllipseness => 'Elipticidade: Normal >95%';

  @override
  String get reportRefDecentralization => 'Descentralizacao: Normal <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Dif. Tamanho Pupila: <2% Normal, 2-4% Leve, >4% Significativo';

  @override
  String get enterPatientInfoAnalysis => 'Inserir Info do Paciente → Análise';

  @override
  String get chooseCaptureMethod => 'Escolha o método de captura:';

  @override
  String get usbCamera => 'Câmera USB';

  @override
  String get selectExistingImage => 'Selecionar imagem existente';

  @override
  String get detectingCameras => 'Detectando câmeras...';

  @override
  String get retryDetection => 'Tentar detecção novamente';

  @override
  String get connectUvcCameraViaUsb => 'Conecte a câmera UVC via USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Certifique-se de que os drivers estão instalados';

  @override
  String get tapRefreshToDetect => 'Toque em Atualizar para detectar câmeras';

  @override
  String get connectUsbCameraToBegin => 'Conecte a câmera USB para começar';

  @override
  String get noExternalCameraTitle => 'Nenhuma câmera externa detectada';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Conecte seu iriscópio USB e certifique-se de que está conectado';

  @override
  String get languagesAvailable => 'Idiomas disponíveis';

  @override
  String get validationChecks => 'Verificações de validação:';

  @override
  String get eyeQualityTip =>
      'Dica: Garanta boa iluminação e mantenha o olho firme';

  @override
  String get validatingEye => 'Validando olho...';

  @override
  String get initializing => 'Inicializando...';

  @override
  String get nameLabel => 'Nome:';

  @override
  String get ageLabel => 'Idade:';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get pleaseEnterName => 'Por favor insira o nome';

  @override
  String get pleaseEnterAge => 'Por favor insira a idade';

  @override
  String get ageMustBe2Digits => 'A idade deve ter 1 ou 2 dígitos';

  @override
  String get optional => '(Opcional)';

  @override
  String get bilateralBothHands => 'Uso bilateral de ambas as mãos';

  @override
  String get zoom => 'Zoom';

  @override
  String get zoomSliderTip =>
      'Use o controle deslizante de zoom à direita para ajustar a ampliação antes de gravar.';

  @override
  String get aboutProgramDeveloper =>
      'Desenvolvedor do Programa - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Tamanho do gráfico';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Opacidade do gráfico (0 = somente hover / Modo órgãos)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Concluído e voltar';

  @override
  String get errorImageShape =>
      'Forma da imagem incorreta - garanta que o olho preencha o quadro';

  @override
  String get cameraConnected => 'Câmera conectada';

  @override
  String get cameraDisconnected => 'Câmera desconectada';

  @override
  String get cameraPermissionDenied => 'Permissão da câmera negada';

  @override
  String get cameraFailedInit => 'Falha ao inicializar câmera';

  @override
  String get cameraInUse => 'Câmera está sendo usada por outro aplicativo';

  @override
  String get cameraFormatNotSupported => 'Formato de câmera não suportado';

  @override
  String get capturedImageNotFound =>
      'Arquivo de imagem capturada não encontrado';

  @override
  String get failedToCaptureImage => 'Falha ao capturar imagem';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Ocorreu um erro de câmera';

  @override
  String get connectingToUsbIriscope => 'Conectando ao iriscopio USB...';

  @override
  String get noCamerasDetectedMessage =>
      'Nenhuma câmera detectada. Certifique-se de que sua câmera USB está conectada e reconhecida pelo sistema.';

  @override
  String get failedToAccessCameras => 'Falha ao acessar câmeras';

  @override
  String get notAnEyeImageTitle => 'Não é uma imagem do olho';

  @override
  String get notAnEyeImageBody =>
      'A imagem selecionada não parece ser um olho.\n\nPor favor, escolha uma foto clara da íris/pupila e tente novamente.';

  @override
  String get notAnEyeImageBodyCapture =>
      'A imagem capturada não parece ser um olho.\n\nPor favor, posicione o iriscópio diretamente sobre o olho e recapture.';

  @override
  String get anisocoriaObservationSymmetrical => 'Simétrico';

  @override
  String get anisocoriaObservationSlight => 'Variação leve';

  @override
  String get anisocoriaObservationModerate => 'Variação moderada';

  @override
  String get anisocoriaObservationMarked => 'Variação acentuada';

  @override
  String get settingsNaturalMedicineSection => 'Medicina Natural';

  @override
  String get settingsHerbalToggle =>
      'Recomendações Fitoterapêuticas (baseadas em zonas da íris)';

  @override
  String get settingsNutritionToggle =>
      'Nutrição Dieta 7 Cores (baseada em zonas da íris)';

  @override
  String get settingsChiropracticToggle => 'Quiropraxia / Avaliação Espinal';

  @override
  String get settingsTcmToggle => 'Medicina Tradicional Chinesa (MTC)';

  @override
  String get therapyHerbalTitle => 'Recomendações Fitoterapêuticas';

  @override
  String get therapyHerbalSubtitle =>
      'Achados das zonas da íris — ordenados por peso de evidência';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count referências';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'As sugestões fitoterapêuticas são fornecidas apenas para fins educacionais. Consulte um profissional de saúde qualificado antes do uso.';

  @override
  String get therapyNutritionTitle => 'Nutrição Dieta 7 Cores';

  @override
  String get therapyNutritionSubtitle =>
      'Alimentos e nutrientes para órgãos das zonas da íris';

  @override
  String get therapyNutritionFoodsByColor => 'Alimentos Recomendados por Cor';

  @override
  String get therapyNutritionKeyNutrients => 'Nutrientes-Chave';

  @override
  String get therapyNutritionHerbs => 'Ervas e Especiarias de Suporte';

  @override
  String get therapyNutritionNotes => 'Notas Nutricionais';

  @override
  String get therapyNutritionTonifying => 'Alimentos tonificantes:';

  @override
  String get therapyNutritionAvoid => 'Minimizar / evitar:';

  @override
  String get therapyNutritionDisclaimer =>
      'As sugestões nutricionais baseiam-se na estrutura da Dieta 7 Cores e são fornecidas apenas para fins educacionais. Consulte um profissional antes de fazer mudanças na dieta.';

  @override
  String get therapyChiroTitle => 'Avaliação Quiroprática';

  @override
  String get therapyChiroSubtitle =>
      'Segmentos espinhais indicados pelos achados das zonas da íris';

  @override
  String get therapyChiroVertebrae => 'Vértebras';

  @override
  String get therapyChiroNerveRoots => 'Raízes Nervosas';

  @override
  String get therapyChiroInnervated => 'Estruturas Inervadas';

  @override
  String get therapyChiroSubluxation => 'Possíveis Indicadores de Subluxão';

  @override
  String get therapyChiroMuscles => 'Músculos Frequentemente Afetados';

  @override
  String get therapyChiroAdjusting => 'Abordagem de Ajuste Quiroprático';

  @override
  String get therapyChiroExercises => 'Exercícios e Alongamentos em Casa';

  @override
  String get therapyChiroPostural => 'Nota Postural';

  @override
  String get therapyChiroDisclaimer =>
      'As informações quiroprátias são fornecidas para fins educacionais. Consulte um quiroprático licenciado para diagnóstico e tratamento.';

  @override
  String get therapyTcmTitle => 'Medicina Tradicional Chinesa';

  @override
  String get therapyTcmSubtitle =>
      'Meridiano · Relógio dos Órgãos · Cinco Elementos';

  @override
  String get therapyTcmMeridianFunctions => 'Funções do Meridiano';

  @override
  String get therapyTcmGoverns => 'Governa';

  @override
  String get therapyTcmPatterns => 'Padrões de Desequilíbrio';

  @override
  String get therapyTcmSymptoms => 'Sintomas';

  @override
  String get therapyTcmFormulas => 'Fórmulas Clássicas';

  @override
  String get therapyTcmKeyPoints => 'Pontos-Chave para Este Padrão';

  @override
  String get therapyTcmAcupoints => 'Pontos de Acupressão Chave';

  @override
  String get therapyTcmDiet => 'Terapia Dietética MTC';

  @override
  String get therapyTcmTonifying => 'Alimentos tonificantes:';

  @override
  String get therapyTcmAvoid => 'Minimizar / evitar:';

  @override
  String get therapyTcmDisclaimer =>
      'As informações de MTC são fornecidas para fins educacionais. Consulte um acupunturista ou médico de MTC licenciado.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'Nenhum achado significativo de zonas da íris detectado para gerar recomendações.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'Estação';

  @override
  String get therapyClimateLabel => 'Clima';

  @override
  String get therapyEmotionLabel => 'Emoção';

  @override
  String get therapyTasteLabel => 'Sabor';

  @override
  String get therapyNatureLabel => 'Natureza';

  @override
  String therapyPairedOrgan(String organ) {
    return 'par: $organ';
  }

  @override
  String get bothEyesCapturedTitle => 'Ambos os Olhos Capturados';

  @override
  String get constitutionalType => 'Tipo Constitucional';

  @override
  String get constitutionalTypeOptional => 'Tipo Constitucional (Opcional)';

  @override
  String get selectConstitutionalType => 'Selecionar tipo constitucional…';

  @override
  String get constitutionalTypeNone => 'Nenhum (não avaliado)';

  @override
  String get constitutionalIridology => 'Iridologia Constitucional';

  @override
  String get constitutionalIrisDescription => 'Descrição da Íris';

  @override
  String get constitutionalPredispositions => 'Predisposições de Saúde';

  @override
  String get constitutionalHomeopathicRemedies => 'Remédios Homeopáticos';

  @override
  String get constitutionalTypeBy =>
      'Baseado na Iridologia Constitucional do Dr. Josef Deck';

  @override
  String get addFinding => 'Adicionar achado';

  @override
  String get anomalyType => 'Tipo de anomalia';

  @override
  String get anomalySubtype => 'Subtipo';

  @override
  String get anomalyConclusion => 'Conclusão';

  @override
  String get selectAnomalyType => 'Selecionar tipo…';

  @override
  String get addToNotes => 'Adicionar às notas';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'CNRI Captura Ocular';

  @override
  String get analyzeButton => 'Analisar';

  @override
  String get plrModes => 'Modos RFP';

  @override
  String get captureInstructions => 'Posicione o olho dentro do círculo guia';

  @override
  String get scanHistory => 'Histórico de Análises';

  @override
  String get selectCameraMode => 'Selecionar Modo da Câmera';

  @override
  String get loadFromGallery => 'Carregar da Galeria';

  @override
  String get rightEyePhoto => 'Foto do Olho Direito';

  @override
  String get leftEyePhoto => 'Foto do Olho Esquerdo';

  @override
  String get autoCapture => 'Captura Automática';

  @override
  String get autoCaptureDesc =>
      'Detecção ocular + captura automática de 5 segundos';

  @override
  String get manualCapture => 'Captura Manual';

  @override
  String get manualCaptureDesc =>
      'Detecção ocular + captura manual (câmera traseira)';

  @override
  String get selfieMode => 'Modo Selfie';

  @override
  String get selfieModeDesc =>
      'Detecção ocular + captura auto 5 seg (câmera frontal)';

  @override
  String get plrVideoRear => 'Vídeo RFP (Traseira)';

  @override
  String get plrVideoRearDesc => 'Câmera traseira • captura 10 seg';

  @override
  String get plrVideoSelfie => 'Vídeo RFP (Selfie)';

  @override
  String get plrVideoSelfieDesc => 'Câmera frontal • captura 10 seg';

  @override
  String get plrVideoCapture => 'Captura de Vídeo RFP';

  @override
  String get frontCamera => 'Câmera Frontal';

  @override
  String get rearCamera => 'Câmera Traseira';

  @override
  String get selectEyeToAssess => 'Selecione qual olho avaliar';

  @override
  String get rightEyeOD => 'Olho Direito (OD)';

  @override
  String get leftEyeOS => 'Olho Esquerdo (OS)';

  @override
  String get recordPlrRightEye => 'Gravar RFP do olho direito';

  @override
  String get recordPlrLeftEye => 'Gravar RFP do olho esquerdo';

  @override
  String get loadRightEyeImage => 'Carregar imagem do olho direito';

  @override
  String get loadLeftEyeImage => 'Carregar imagem do olho esquerdo';

  @override
  String get bothEyes => 'Ambos os Olhos';

  @override
  String get loadBothEyesDesc => 'Carregar olho direito, depois esquerdo';

  @override
  String get selectEyeImageFromDevice =>
      'Selecione uma imagem ocular do seu dispositivo';

  @override
  String get selectRightEyeFirst =>
      'Selecione primeiro a imagem do olho DIREITO (OD)';

  @override
  String get rightEyeSaved =>
      'Olho direito salvo. Agora selecione a imagem do olho ESQUERDO (OS)';

  @override
  String get cancelledNoRightEye =>
      'Cancelado - nenhum olho direito selecionado';

  @override
  String get cancelledNoLeftEye =>
      'Cancelado - nenhum olho esquerdo selecionado';

  @override
  String errorLoadingImages(String error) {
    return 'Erro ao carregar imagens: $error';
  }

  @override
  String get crop43 => 'Cortar (4:3)';

  @override
  String get success => 'Sucesso';

  @override
  String get imageCroppedSuccess => 'Imagem cortada com sucesso!';

  @override
  String get error => 'Erro';

  @override
  String get cropFailed =>
      'Falha ao cortar imagem. Por favor, tente novamente.';

  @override
  String get crop => 'Cortar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get saved => 'Salvo! ✅';

  @override
  String get imageSavedToGallery => 'Imagem salva na galeria com sucesso';

  @override
  String get exposure => 'Exposição';

  @override
  String get flash => 'Flash';

  @override
  String get eye => 'Olho';

  @override
  String get center => 'centro';

  @override
  String get light => 'Luz';

  @override
  String get ready => 'Pronto';

  @override
  String get on => 'SIM';

  @override
  String get off => 'NÃO';

  @override
  String get auto => 'AUTO';

  @override
  String get manual => 'MANUAL';

  @override
  String get selfie => 'SELFIE';

  @override
  String get pupil => 'PUPILA';

  @override
  String get plrHistory => 'Histórico RFP';

  @override
  String get searchByName => 'Buscar por nome...';

  @override
  String get totalScans => 'Total de Análises';

  @override
  String get thisWeek => 'Esta Semana';

  @override
  String get patients => 'Pacientes';

  @override
  String get detected => 'Detectado';

  @override
  String get noPlrRecordsYet => 'Nenhum registro RFP ainda';

  @override
  String get recordPlrVideoToSeeHistory =>
      'Grave um vídeo RFP para ver o histórico aqui';

  @override
  String get deleteRecord => 'Excluir Registro?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return 'Excluir análise RFP de $name ($eye)?\n\nIsto não pode ser desfeito.';
  }

  @override
  String get delete => 'Excluir';

  @override
  String get recordDeleted => 'Registro excluído';

  @override
  String plrAnalysis(String eye) {
    return 'Análise RFP - $eye';
  }

  @override
  String get patient => 'Paciente';

  @override
  String get date => 'Data';

  @override
  String get frames => 'Quadros';

  @override
  String get baselinePiRatio => 'P/I Base';

  @override
  String get minPiRatio => 'P/I Mín';

  @override
  String get plrMagnitude => 'Amplitude RFP';

  @override
  String get constriction => 'Constrição';

  @override
  String get plrDetected => 'RFP Detectado';

  @override
  String get confidence => 'Confiança';

  @override
  String get grade => 'Grau';

  @override
  String get close => 'fechar';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get na => 'N/D';

  @override
  String get takeLeftEyePhoto => 'Fotografar Olho Esquerdo';

  @override
  String get takeRightEyePhoto => 'Fotografar Olho Direito';

  @override
  String get nowTakingLeftEye => 'Agora capturando olho ESQUERDO (OS)';

  @override
  String get startingWithRightEye => 'Começando com olho DIREITO (OD)';

  @override
  String get captured => 'Capturado ✓';

  @override
  String get useSameDistanceLighting =>
      'Use a mesma distância e iluminação do olho direito para comparação precisa.';

  @override
  String get step1of2 => 'Passo 1 de 2';

  @override
  String get step2of2 => 'Passo 2 de 2';

  @override
  String get bothEyesCaptured => 'Ambos os olhos capturados ✓';

  @override
  String get continueToLeftEye => 'Continuar para o Olho Esquerdo';

  @override
  String get retakeOD => 'Refazer OD';

  @override
  String get retakeOS => 'Refazer OS';

  @override
  String get retakeRightEye => 'Refazer Olho Direito';

  @override
  String get analyzeBothEyes => 'Analisar Ambos os Olhos';

  @override
  String get patientInfoMissing => 'Info do Paciente Ausente';

  @override
  String get rightEyePhotoMissing => 'Foto do olho direito ausente!';

  @override
  String get patientInfoMissingRestart =>
      'Info do paciente ausente. Por favor, reinicie.';

  @override
  String get exitApp => 'Sair do App';

  @override
  String get tipsForBestResults => 'DICAS PARA MELHORES RESULTADOS';

  @override
  String get followGuidelinesForQuality =>
      'Siga estas diretrizes para qualidade de imagem ideal';

  @override
  String get cameraDistance => 'Distância da Câmera';

  @override
  String get cameraDistanceDesc =>
      'Mantenha a câmera a 10-15 cm do seu olho. Mantenha a mesma distância para ambos os olhos.';

  @override
  String get lightingPosition => 'Posição da Iluminação';

  @override
  String get lightingPositionDesc =>
      'Posicione a fonte de luz dentro ou fora das bordas da pupila. Tente olhar para o flash da câmera.';

  @override
  String get avoidReflections => 'Evite Reflexos';

  @override
  String get avoidReflectionsDesc =>
      'Reduza reflexos evitando brilho de janelas, espelhos e lâmpadas diretas.';

  @override
  String get centerYourEye => 'Centralize Seu Olho';

  @override
  String get centerYourEyeDesc =>
      'Certifique-se de que o olho inteiro, incluindo a esclera (parte branca), esteja centralizado e preencha o quadro.';

  @override
  String get cropProperly => 'Corte Corretamente';

  @override
  String get cropProperlyDesc =>
      'Corte a imagem com o olho no centro. A imagem será salva automaticamente na proporção 4:3.';

  @override
  String get importantInformation => 'Informação Importante';

  @override
  String get imageRatio43 => 'Proporção 4:3 para padrão de imagem médica';

  @override
  String get forClinicalUseCnri => 'Para uso clínico com CNRI (cnri.edu)';

  @override
  String get noMedicalDiagnosis => 'Não fornece diagnóstico médico';

  @override
  String get eyeWideOpenClear =>
      'Certifique-se de que seu olho está bem aberto e a imagem está clara';

  @override
  String get personalInfo => 'Info Pessoal';

  @override
  String get personInformation => 'Informação da Pessoa';

  @override
  String get enterPersonDetails => 'Inserir Dados da Pessoa';

  @override
  String get infoIncludedInReport =>
      'Esta informação será incluída no relatório de análise';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get enterPersonName => 'Insira o nome da pessoa';

  @override
  String get nameRequired => 'Nome é obrigatório';

  @override
  String get sex => 'Sexo';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get ageYears => 'Idade (anos)';

  @override
  String get enterAge => 'Insira a idade';

  @override
  String get ageRequired => 'Idade é obrigatória';

  @override
  String get enterValidNumber => 'Insira um número válido';

  @override
  String get enterValidAge => 'Insira uma idade válida (0-120)';

  @override
  String get mainComplaints => 'Queixas Principais';

  @override
  String get mainComplaintsOptional => 'Queixas Principais (opcional)';

  @override
  String get complaintsHint =>
      'ex.: dores de cabeça, problemas de visão, fadiga...';

  @override
  String get continueToCaptire => 'Continuar para Captura';

  @override
  String get ageImportantNote =>
      'A idade é importante para avaliação precisa do tamanho pupilar, pois as faixas normais variam por idade.';

  @override
  String get submit => 'Enviar';

  @override
  String get pleaseSelectGender => 'Por favor, selecione o sexo!';

  @override
  String get applicationSubmitted => 'Sua solicitação foi enviada com sucesso.';

  @override
  String get type => 'Tipo:';

  @override
  String get gender => 'Sexo:';

  @override
  String get rightHanded => 'Destro';

  @override
  String get leftHanded => 'Canhoto';

  @override
  String get partialLeftHandedness => 'Canhotismo parcial';

  @override
  String get retrainedLeftHandedness => 'Canhotismo retreinado';

  @override
  String get bilateralUseBothHands => 'Uso bilateral de ambas as mãos';

  @override
  String get splashTitle => 'PupilMetrics Captura Ocular';

  @override
  String get splashDeveloper => 'Desenvolvedor - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => 'Ferramenta de Pesquisa/Educação';

  @override
  String get startNewAnalysis => 'Iniciar Nova Análise';

  @override
  String get viewHistory => 'Ver Histórico';

  @override
  String get viewResearchDisclaimer => 'Ver Aviso de Pesquisa';

  @override
  String get researchDisclaimerTitle => 'Ferramenta de Pesquisa/Educação';

  @override
  String get researchDisclaimerNotMedical => 'NÃO é um dispositivo médico';

  @override
  String get researchDisclaimerNotClinical => 'NÃO é para diagnóstico clínico';

  @override
  String get researchDisclaimerResults =>
      'Resultados são observações de pesquisa';

  @override
  String get researchDisclaimerConsult =>
      'Sempre consulte profissionais de saúde';

  @override
  String get researchDisclaimerAcknowledge =>
      'Ao continuar, você reconhece que esta é uma ferramenta de pesquisa e não deve ser usada para decisões médicas.';

  @override
  String get researchDisclaimerWarning =>
      'Este app é APENAS para fins de PESQUISA e EDUCAÇÃO.';

  @override
  String get iUnderstand => 'Eu Entendo';

  @override
  String get plrAnalysisTest => 'Teste de Análise RFP';

  @override
  String get checkingVideoFile => 'Verificando arquivo de vídeo...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'Processando quadro $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => 'Análise concluída!';

  @override
  String get errorVideoNotFound => 'Erro: Arquivo de vídeo não encontrado';

  @override
  String get waitingForResults => 'Aguardando resultados...';

  @override
  String get baseline => 'Base';

  @override
  String get flashPhase => 'Flash';

  @override
  String get constrictionPhase => 'Constrição';

  @override
  String get recovery => 'Recuperação';

  @override
  String get plrDetectedExclaim => 'RFP DETECTADO!';

  @override
  String get plrWeakNotDetected => 'RFP Fraco/Não Detectado';

  @override
  String get min => 'Mín';

  @override
  String get plr => 'RFP';

  @override
  String get constrLabel => 'Constr.';

  @override
  String get saveToHistory => 'Salvar no Histórico';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'Salvar Quadros';

  @override
  String get share => 'Compartilhar';

  @override
  String get frameSavedToGallery => 'Quadro salvo na galeria!';

  @override
  String get failedToSaveFrame => 'Falha ao salvar quadro';

  @override
  String framesSavedToGallery(int count) {
    return '$count quadros salvos na galeria!';
  }

  @override
  String get jsonCopiedToClipboard =>
      'JSON copiado para a área de transferência!';

  @override
  String get reportCopiedToClipboard =>
      'Relatório copiado para a área de transferência!';

  @override
  String shareFailedError(String error) {
    return 'Falha ao compartilhar: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return 'Salvo no histórico! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get noSuccessfulFramesToSave =>
      'Nenhum quadro bem-sucedido para salvar';

  @override
  String get saveAllFrames => 'Salvar Todos os Quadros';

  @override
  String get shareReport => 'Compartilhar Relatório';

  @override
  String get shareJson => 'Compartilhar JSON';

  @override
  String get rerunTest => 'Refazer Teste';

  @override
  String videoCaptureTitle(String eye) {
    return 'RFP - $eye';
  }

  @override
  String get initializingCamera => 'Inicializando câmera...';

  @override
  String usingCamera(String camera) {
    return 'Usando câmera $camera';
  }

  @override
  String cameraError(String error) {
    return 'Erro da câmera: $error';
  }

  @override
  String get noCamerasFound => 'Nenhuma câmera encontrada';

  @override
  String get retry => 'Tentar Novamente';

  @override
  String get startPlrRecording => 'Iniciar Gravação RFP';

  @override
  String get stopRecording => 'Parar Gravação';

  @override
  String get phaseReady => 'Pronto';

  @override
  String get phaseStarting => 'Iniciando...';

  @override
  String phaseBaseline(int sec) {
    return 'Base (0-${sec}s)';
  }

  @override
  String get phaseFlash => 'FLASH!';

  @override
  String phaseConstriction(int start, int end) {
    return 'Constrição ($start-${end}s)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return 'Recuperação ($start-${end}s)';
  }

  @override
  String get phaseComplete => 'Concluído!';

  @override
  String get readyDesc => 'Posicione o olho no círculo e toque em Iniciar';

  @override
  String get holdSteady => 'Mantenha firme...';

  @override
  String get recordingBaselinePupil => 'Gravando tamanho pupilar de base';

  @override
  String lightStimulus(int ms) {
    return 'Estímulo luminoso (${ms}ms)';
  }

  @override
  String get measuringConstriction => 'Medindo constrição pupilar';

  @override
  String get measuringRecovery => 'Medindo recuperação pupilar';

  @override
  String get plrRecordingComplete => 'Gravação RFP concluída';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return 'Posicione o olho $eye dentro do círculo.\nMantenha firme durante a gravação de $seconds segundos.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return 'Mantenha o olho firme. O flash ocorrerá em $sec segundos.';
  }

  @override
  String get recordingComplete => 'Gravação Concluída';

  @override
  String get plrVideoCapturedSuccess => 'Vídeo RFP capturado com sucesso!';

  @override
  String get duration => 'Duração';

  @override
  String get seconds => 'segundos';

  @override
  String get frameRate => 'Taxa de Quadros';

  @override
  String get camera => 'Câmera';

  @override
  String flashAt(int sec, int ms) {
    return 'Em ${sec}s (${ms}ms)';
  }

  @override
  String get phases => 'Fases';

  @override
  String get phasesFlow => 'Base → Flash → Constrição → Recuperação';

  @override
  String get expectedNormalValues => 'Valores Normais Esperados:';

  @override
  String get latency => 'Latência';

  @override
  String get velocity => 'Velocidade';

  @override
  String get testFrameAnalysis => '🧪 Teste de Análise de Quadros';

  @override
  String get retake => 'Refazer';

  @override
  String get done => 'Concluído';

  @override
  String get plrVideoModeTitle => 'Modo de Vídeo RFP';

  @override
  String get plrAssessmentTitle =>
      'Avaliação do Reflexo Fotomotor Pupilar (RFP)';

  @override
  String get plrInstructions =>
      '1. Posicione o olho dentro do círculo guia\n2. Toque em \"Iniciar Gravação RFP\"\n3. Mantenha firme por 10 segundos\n4. Um flash ocorrerá em 3 segundos\n5. O app grava a resposta pupilar';

  @override
  String get recordingPhases => 'Fases da Gravação:';

  @override
  String get baselinePhaseDesc => 'Tamanho pupilar inicial';

  @override
  String get flashPhaseDesc => 'Estímulo luminoso';

  @override
  String get constrictionPhaseDesc => 'Pupila contrai';

  @override
  String get recoveryPhaseDesc => 'Pupila retorna';

  @override
  String get normalPlrValues => 'Valores RFP Normais:';

  @override
  String get gotIt => 'Entendi';

  @override
  String get pupilAnalysis => 'Análise Pupilar';

  @override
  String scansLeft(int count) {
    return '$count restantes';
  }

  @override
  String get validatingRightEye => 'Validando olho direito...';

  @override
  String get validatingLeftEye => 'Validando olho esquerdo...';

  @override
  String get analyzingRightEye => 'Analisando olho direito (OD)...';

  @override
  String get analyzingLeftEye => 'Analisando olho esquerdo (OS)...';

  @override
  String get comparingPupils => 'Comparando pupilas...';

  @override
  String person(String name) {
    return 'Pessoa: $name';
  }

  @override
  String get invalidEyeImage => 'Imagem Ocular Inválida';

  @override
  String analysisFailed(String error) {
    return 'Análise falhou: $error';
  }

  @override
  String get researchEducationalToolOnly =>
      'FERRAMENTA DE PESQUISA/EDUCAÇÃO APENAS';

  @override
  String get resultsNotMedicalDiagnoses =>
      'Este aplicativo é apenas para fins de pesquisa e educação. Os resultados NÃO são diagnósticos médicos e NÃO foram validados para uso clínico. Associações de padrões são de literatura de pesquisa histórica. Consulte um profissional de saúde para quaisquer preocupações de saúde.';

  @override
  String get pupilSizeDifference => 'Diferença de Tamanho Pupilar Detectada';

  @override
  String get significantPupilSizeDiff =>
      'DIFERENÇA SIGNIFICATIVA NO TAMANHO PUPILAR';

  @override
  String get diff => 'dif';

  @override
  String get researchObservationConsult =>
      'Observação de pesquisa - Consulte um profissional de saúde para interpretação';

  @override
  String get ageBasedResearchBaseline => 'Linha de Base de Pesquisa por Idade';

  @override
  String group(String group) {
    return 'Grupo: $group';
  }

  @override
  String get researchRange => 'Faixa de Pesquisa';

  @override
  String get measuredEst => 'Medido (est.)';

  @override
  String get pupilForm => 'Forma Pupilar';

  @override
  String get decentrationPattern => 'Padrão de Descentração';

  @override
  String get flattenings => 'Achatamentos';

  @override
  String get protrusions => 'Protuberâncias';

  @override
  String zonesCount(int count) {
    return '$count zonas';
  }

  @override
  String get bilateralComparison => 'Comparação Bilateral';

  @override
  String get parameter => 'Parâmetro';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'Razão P/I';

  @override
  String get ellipseness => 'Elipsidade';

  @override
  String get circularity => 'Circularidade';

  @override
  String get decentralization => 'Descentração';

  @override
  String get anwRatio => 'Proporção';

  @override
  String get normal => 'normal';

  @override
  String get elliptical => 'Elíptica';

  @override
  String get circular => 'Circular';

  @override
  String get irregular => 'Irregular';

  @override
  String get centered => 'Centralizada';

  @override
  String get offset => 'Deslocada';

  @override
  String get miosis => 'Miose';

  @override
  String get constricted => 'Contraída';

  @override
  String get dilated => 'Dilatada';

  @override
  String get mydriasis => 'Midríase';

  @override
  String get inner => 'Interna';

  @override
  String get outer => 'Externa';

  @override
  String get high => 'Alta';

  @override
  String get moderate => 'Moderada';

  @override
  String get savePdf => 'Salvar PDF';

  @override
  String get sharePdf => 'Compartilhar PDF';

  @override
  String get retakePhotos => 'Refazer Fotos';

  @override
  String scansLeftBanner(int count) {
    return '$count análises restantes';
  }

  @override
  String get upgrade => 'Atualizar';

  @override
  String get unlockUnlimited => 'Desbloquear Ilimitado';

  @override
  String get usedAllFreeScans => 'Você usou todas as análises gratuitas.';

  @override
  String get unlimitedScans => 'Análises ilimitadas';

  @override
  String get pdfReports => 'Relatórios PDF';

  @override
  String get scanHistoryFeature => 'Histórico de análises';

  @override
  String get bilateralAnalysis => 'Análise bilateral';

  @override
  String get monthly => 'Mensal';

  @override
  String get perMonth => '/mês';

  @override
  String get annual => 'Anual';

  @override
  String get perYear => '/ano';

  @override
  String get tenCredits => '10 Créditos';

  @override
  String get oneTime => 'único';

  @override
  String get best => 'MELHOR';

  @override
  String get purchaseCancelled => 'Compra cancelada';

  @override
  String purchaseFailed(String error) {
    return 'Compra falhou: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT salvo: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON salvo: $path';
  }

  @override
  String get pdfSaved => 'PDF Salvo!';

  @override
  String pdfFailed(String error) {
    return 'PDF Falhou: $error';
  }

  @override
  String get open => 'ABRIR';

  @override
  String failed(String error) {
    return 'Falhou: $error';
  }

  @override
  String get staticScans => 'Estático';

  @override
  String get plrScans => 'RFP';

  @override
  String get searchByNameOrComplaints => 'Buscar por nome ou queixas...';

  @override
  String get searchPlrRecords => 'Buscar registros RFP...';

  @override
  String get noScansYet => 'Nenhuma análise ainda';

  @override
  String get completedScansAppearHere => 'Análises concluídas aparecerão aqui';

  @override
  String get deleteScan => 'Excluir Análise?';

  @override
  String deleteScanConfirm(String name, String date) {
    return 'Excluir análise de $name de $date?';
  }

  @override
  String get scanDeleted => 'Análise excluída';

  @override
  String get originalImagesNotFound =>
      'Imagens oculares originais não encontradas.';

  @override
  String get viewResults => 'Ver Resultados';

  @override
  String get avgPlr => 'RFP Méd';

  @override
  String get years => 'anos';

  @override
  String get anisocoria => 'Anisocoria';

  @override
  String get none => 'Nenhum';

  @override
  String get mild => 'Leve';

  @override
  String get severe => 'Grave';

  @override
  String zoneLabel(String zone) {
    return 'Zona: $zone';
  }

  @override
  String associatedWith(String organ) {
    return 'Associado com $organ';
  }

  @override
  String get significant => 'Significativo';

  @override
  String get fair => 'Regular';

  @override
  String get low => 'Baixa';

  @override
  String get good => 'Bom';

  @override
  String get zones => 'Zonas';

  @override
  String get significanceWithinLimits => 'dentro dos limites aceitáveis';

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
  String get formTypeLeftObliqueEllipse => 'Elipse Oblíqua Esquerda';

  @override
  String get formTypeUnilateralEllipse => 'Elipse Unilateral';

  @override
  String get formTypeVentralDivergingEllipse => 'Elipse Divergente Ventral';

  @override
  String get formTypeFrontalDivergingEllipse => 'Elipse Divergente Frontal';

  @override
  String get formTypeEllipse => 'Elipse';

  @override
  String get formTypeChord => 'Corda';

  @override
  String get formTypeIrregular => 'Irregular';

  @override
  String get pupilFormCircleDesc =>
      'Forma pupilar circular normal. Nenhuma variação de padrão detectada.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      'Padrão oval horizontal. A pesquisa histórica associou isso a padrões do sistema nervoso autônomo que afetam as zonas de função respiratória e glandular.';

  @override
  String get pupilFormOvalVerticalDesc =>
      'Padrão oval vertical. A pesquisa histórica vinculou este padrão às zonas de circulação cerebral em estudos de reflexos autonômicos.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      'Padrão oval diagonal. A literatura de pesquisa associou isso a reflexos da zona urogenital em estudos autonômicos.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      'Padrão de elipse oblíqua esquerda. Observações históricas vincularam isso às zonas autonômicas urogenitais e de extremidades inferiores.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      'Padrão de elipse unilateral. A pesquisa indicou associações com zonas autonômicas respiratórias e brônquicas.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      'Elipse divergente ventral. Estudos históricos associaram isso às zonas autonômicas do corpo inferior e padrões de função motora.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      'Elipse divergente frontal. A literatura de pesquisa vinculou este padrão às zonas autonômicas cerebrais e superiores.';

  @override
  String get pupilFormOvalDesc =>
      'Padrão de deformação oval leve. Monitorar progressão nas observações de pesquisa.';

  @override
  String get pupilFormEllipseDesc =>
      'Padrão pupilar elíptico indicando variações do sistema autonômico em estudos históricos.';

  @override
  String get pupilFormChordDesc =>
      'Padrão de deformação tipo corda indicando influências autonômicas localizadas na literatura de pesquisa.';

  @override
  String get pupilFormIrregularDesc =>
      'Forma irregular sugerindo múltiplas influências de padrões autonômicos com base em observações históricas.';

  @override
  String get patternCentered => 'Centrado (Normal)';

  @override
  String get patternFrontal => 'Descentralização frontal';

  @override
  String get patternBasal => 'Descentralização basal';

  @override
  String get patternNasal => 'Descentralização nasal';

  @override
  String get patternTemporal => 'Descentralização temporal';

  @override
  String get patternMiddleNasal => 'Descentralização nasal média';

  @override
  String get patternMiddleTemporal => 'Descentralização temporal média';

  @override
  String get patternUpperNasal => 'Descentralização nasal superior';

  @override
  String get patternUpperTemporal => 'Descentralização temporal superior';

  @override
  String get patternLowerNasal => 'Descentralização nasal inferior';

  @override
  String get patternLowerTemporal => 'Descentralização temporal inferior';

  @override
  String get patternUpwards => 'Descentração - Para cima';

  @override
  String get patternDownwards => 'Descentração - Para baixo';

  @override
  String get patternUpwardsInwards => 'Descentração - Cima-Dentro';

  @override
  String get patternUpwardsOutwards => 'Descentração - Cima-Fora';

  @override
  String get decentrationCenteredDesc =>
      'Posicionamento pupilar normal dentro dos limites fisiológicos.';

  @override
  String get decentrationNasalRightDesc =>
      'Padrão nasal (Direito). A pesquisa histórica associou esta zona a reflexos autonômicos pulmonares.';

  @override
  String get decentrationNasalLeftDesc =>
      'Padrão nasal (Esquerdo). A literatura de pesquisa vinculou esta zona a padrões de função autonômica cardíaca.';

  @override
  String get decentrationTemporalDesc =>
      'Padrão temporal. Observações históricas associaram esta zona a reflexos autonômicos renais e reprodutivos.';

  @override
  String get decentrationFrontalRightDesc =>
      'Padrão frontal (Direito). A pesquisa associou esta zona a padrões de função cognitiva e cerebral.';

  @override
  String get decentrationFrontalLeftDesc =>
      'Padrão frontal (Esquerdo). Estudos históricos vincularam esta zona a padrões autonômicos cerebrais.';

  @override
  String get decentrationBasalRightDesc =>
      'Padrão basal (Direito). A pesquisa indicou associações com reflexos de pressão intracraniana.';

  @override
  String get decentrationBasalLeftDesc =>
      'Padrão basal (Esquerdo). Observações históricas vincularam isso a padrões de zona inflamatória cerebral.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      'Padrão nasal superior (Direito). A pesquisa associou esta zona a reflexos autonômicos hepatobiliares.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      'Padrão nasal superior (Esquerdo). Estudos históricos vincularam isso às zonas esplênicas e diafragmáticas.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      'Padrão temporal superior. A pesquisa indicou associações com zonas autonômicas renais e reprodutivas.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      'Padrão nasal médio (Direito). Observações históricas vincularam isso às zonas de utilização de oxigênio e cardíacas.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      'Padrão nasal médio (Esquerdo). A pesquisa associou isso a padrões autonômicos neurológicos e cardíacos.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      'Padrão temporal médio (Direito). A pesquisa vinculou isso às zonas de regulação autonômica cardíaca.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      'Padrão temporal médio (Esquerdo). Estudos históricos associaram isso às zonas pulmonares e cardíacas.';

  @override
  String get decentrationUpperNasalRightDesc =>
      'Padrão nasal superior (Direito). A pesquisa indicou associações com zonas cognitivas e reflexos da coluna cervical.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      'Padrão nasal superior (Esquerdo). Observações históricas vincularam isso a padrões cognitivos e zonas cervicais.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      'Padrão temporal superior (Direito). A pesquisa associou esta zona a reflexos de nervos cranianos e auditivos.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      'Padrão temporal superior (Esquerdo). Estudos históricos vincularam isso às zonas neurovegetativas e da fala.';

  @override
  String get decentrationLowerNasalDesc =>
      'Padrão nasal inferior. A pesquisa indicou associações com zonas autonômicas urogenitais e lombossacrais.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      'Padrão temporal inferior (Direito). Observações históricas associaram isso às zonas metabólicas e hepáticas.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      'Padrão temporal inferior (Esquerdo). A pesquisa vinculou isso a padrões autonômicos cardíacos e esplênicos.';

  @override
  String get flatteningUpperCentralRightDesc =>
      'Padrão associado à zona central superior. A pesquisa histórica vinculou isso a reflexos autonômicos de regulação do humor e energia.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      'Padrão associado à zona temporal superior. A pesquisa indicou associações com reflexos autonômicos de nervos cranianos e auditivos.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      'Padrão associado à zona temporal média. Observações históricas vincularam isso a padrões autonômicos respiratórios e cardíacos.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      'Padrão associado à zona temporal inferior. A literatura de pesquisa associou isso às zonas autonômicas hepáticas e metabólicas.';

  @override
  String get flatteningLowerBasalRightDesc =>
      'Padrão associado à zona basal inferior. Estudos históricos vincularam isso a reflexos autonômicos renais e de extremidades inferiores.';

  @override
  String get flatteningLowerNasalRightDesc =>
      'Padrão associado à zona nasal inferior. A pesquisa indicou associações com zonas autonômicas urogenitais e pélvicas.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      'Padrão associado à zona nasal média. Observações históricas vincularam isso a padrões autonômicos de utilização de oxigênio e respiratórios.';

  @override
  String get flatteningUpperNasalRightDesc =>
      'Padrão associado à zona nasal superior. A literatura de pesquisa associou isso a reflexos autonômicos cognitivos e cervicais.';

  @override
  String get flatteningDefaultRightDesc =>
      'Variação de padrão do sistema nervoso autônomo detectada nesta zona com base em pesquisa histórica.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      'Padrão associado à zona central superior. A pesquisa histórica vinculou isso a padrões autonômicos de regulação do humor e neurológicos.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      'Padrão associado à zona temporal superior. A pesquisa indicou associações com zonas autonômicas neurovegetativas e da fala.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      'Padrão associado à zona temporal média. Observações históricas vincularam isso a reflexos autonômicos pulmonares e cardíacos.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      'Padrão associado à zona temporal inferior. A literatura de pesquisa associou isso a padrões autonômicos cardíacos e esplênicos.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      'Padrão associado à zona basal inferior. Estudos históricos vincularam isso às zonas autonômicas renais e eliminativas.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      'Padrão associado à zona nasal inferior. A pesquisa indicou associações com reflexos autonômicos urogenitais e lombossacrais.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      'Padrão associado à zona nasal média. Observações históricas vincularam isso a padrões autonômicos cardíacos e respiratórios.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      'Padrão associado à zona nasal superior. A literatura de pesquisa associou isso às zonas autonômicas cognitivas e cervicais.';

  @override
  String get flatteningDefaultLeftDesc =>
      'Variação de padrão do sistema nervoso autônomo detectada nesta zona com base em pesquisa histórica.';

  @override
  String get protrusionUpperCentralRightDesc =>
      'Padrão de protrusão na zona central superior. A pesquisa associou isso a padrões de hiperativação simpática afetando zonas cerebrais.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      'Padrão de protrusão na zona temporal superior. Observações históricas vincularam isso a padrões de hiperatividade do sistema de nervos cranianos e auditivo.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      'Padrão de protrusão na zona temporal média. A pesquisa indicou associações com padrões simpáticos cardíacos e respiratórios.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      'Padrão de protrusão na zona temporal inferior. Estudos históricos vincularam isso às zonas simpáticas hepatobiliares e metabólicas.';

  @override
  String get protrusionLowerBasalRightDesc =>
      'Padrão de protrusão na zona basal inferior. A pesquisa associou isso a padrões de hiperatividade simpática renal e pélvica.';

  @override
  String get protrusionLowerNasalRightDesc =>
      'Padrão de protrusão na zona nasal inferior. Observações históricas vincularam isso às zonas de ativação simpática urogenital.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      'Padrão de protrusão na zona nasal média. A pesquisa indicou associações com padrões simpáticos gástricos e pancreáticos.';

  @override
  String get protrusionUpperNasalRightDesc =>
      'Padrão de protrusão na zona nasal superior. Estudos históricos vincularam isso às zonas de hiperativação simpática cognitiva e visual.';

  @override
  String get protrusionDefaultRightDesc =>
      'Padrão de hiperatividade do sistema nervoso simpático detectado nesta zona com base em observações de pesquisa.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      'Padrão de protrusão na zona central superior. A pesquisa associou isso a padrões simpáticos psicomotores e cerebrais.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      'Padrão de protrusão na zona temporal superior. Observações históricas vincularam isso às zonas de hiperatividade simpática neurovegetativa.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      'Padrão de protrusão na zona temporal média. A pesquisa indicou associações com padrões simpáticos pulmonares e cardíacos.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      'Padrão de protrusão na zona temporal inferior. Estudos históricos vincularam isso às zonas de ativação simpática esplênica e cardíaca.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      'Padrão de protrusão na zona basal inferior. A pesquisa associou isso a padrões de hiperatividade simpática pélvica e renal.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      'Padrão de protrusão na zona nasal inferior. Observações históricas vincularam isso às zonas de ativação simpática lombossacral.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      'Padrão de protrusão na zona nasal média. A pesquisa indicou associações com padrões simpáticos de ansiedade-cardíacos.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      'Padrão de protrusão na zona nasal superior. Estudos históricos vincularam isso às zonas de hiperativação simpática cognitiva e visual.';

  @override
  String get protrusionDefaultLeftDesc =>
      'Padrão de hiperatividade do sistema nervoso simpático detectado nesta zona com base em observações de pesquisa.';

  @override
  String get anisocoriaNone =>
      'Tamanhos pupilares dentro dos limites normais. Nenhuma anisocoria significativa detectada.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return 'Anisocoria detectada: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => 'E>D';

  @override
  String get anisocoriaDirectionDS => 'D>E';

  @override
  String get anisocoriaSeverityNone => 'Dentro dos limites normais.';

  @override
  String get anisocoriaSeverityMild =>
      'Diferença leve observada. Pode ser fisiológica.';

  @override
  String get anisocoriaSeverityModerate =>
      'Assimetria moderada. Observação de pesquisa anotada.';

  @override
  String get anisocoriaSeveritySevere =>
      'Assimetria significativa. Observação de pesquisa sinalizada.';

  @override
  String get largerPupilEqual => 'igual';

  @override
  String get largerPupilOS => 'OE (Esquerdo)';

  @override
  String get largerPupilOD => 'OD (Direito)';

  @override
  String get decentrationWithinLimits => 'Dentro dos limites normais.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. Deslocamento: $offset%';
  }

  @override
  String get zoneUpperCentral => 'Central-Superior';

  @override
  String get zoneUpperNasal => 'Nasal-Superior';

  @override
  String get zoneMiddleNasal => 'Nasal-Médio';

  @override
  String get zoneLowerNasal => 'Nasal-Inferior';

  @override
  String get zoneLowerBasal => 'Basal-Inferior';

  @override
  String get zoneLowerTemporal => 'Temporal-Inferior';

  @override
  String get zoneMiddleTemporal => 'Temporal-Médio';

  @override
  String get zoneUpperTemporal => 'Temporal-Superior';

  @override
  String get zoneFrontal => 'Frontal';

  @override
  String get zoneBasal => 'Basal';

  @override
  String get zoneUnknown => 'Desconhecido';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return 'Achatamento $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return 'Protrusão $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'Modo Iriscópio USB';

  @override
  String get iriscopeExternal => 'Iriscópio / Externo';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => 'Usar câmera USB ou iriscópio conectado';

  @override
  String get detectedCameras => 'Câmeras Detectadas';

  @override
  String get externalCamera => 'Câmera Externa';

  @override
  String cameraIndex(int index) {
    return 'Câmera $index';
  }

  @override
  String get noExternalCameraDetected =>
      'Nenhuma câmera externa detectada.\nConecte um iriscópio USB para habilitar.';

  @override
  String get refresh => 'Atualizar';

  @override
  String get selectCameraSource => 'Selecionar Fonte da Câmera';

  @override
  String camerasDetected(int count) {
    return '$count câmeras detectadas';
  }

  @override
  String camerasAvailable(int count) {
    return '$count câmeras disponíveis';
  }

  @override
  String externalCameraIndex(int index) {
    return 'Câmera Externa $index';
  }

  @override
  String get qualityGatedRear =>
      'Captura automática com controle de qualidade (câmera traseira)';

  @override
  String get qualityGatedFront =>
      'Captura automática com controle de qualidade (câmera frontal)';

  @override
  String get usbCameraInfo => 'Info da Câmera USB';

  @override
  String get connected => 'Conectado';

  @override
  String get waiting => 'Aguardando...';

  @override
  String get disconnected => 'Desconectado';

  @override
  String get waitingForUsbCamera => 'Aguardando Câmera USB';

  @override
  String get connectIriscopePrompt =>
      'Conecte seu iriscópio via adaptador USB OTG.\nConceda permissão quando solicitado.';

  @override
  String get usbCameraIssue => 'Problema com Câmera USB';

  @override
  String get pleaseConnectIriscope =>
      'Por favor conecte seu iriscópio ou câmera USB.';

  @override
  String get retryConnection => 'Tentar Novamente';

  @override
  String get troubleshootingTips => 'Dicas de Solução';

  @override
  String get tipUsbOtgAdapter =>
      'Certifique-se de que o adaptador USB OTG está conectado corretamente';

  @override
  String get tipUsbHostMode =>
      'Verifique se o dispositivo suporta modo USB Host';

  @override
  String get tipReconnectCamera => 'Tente desconectar e reconectar a câmera';

  @override
  String get tipGrantPermissions => 'Conceda permissões USB quando solicitado';

  @override
  String get tipUnlockDevice =>
      'Alguns dispositivos precisam estar desbloqueados';

  @override
  String get back => 'Voltar';

  @override
  String get switchEye => 'Trocar Olho';

  @override
  String get state => 'Estado';

  @override
  String get status => 'Status';

  @override
  String get usingFlutterUvcPlugin =>
      'Usando plugin flutter_uvc_camera\npara suporte a dispositivos USB Video Class.';

  @override
  String get initialized => 'Inicializado';

  @override
  String get notReady => 'Não Pronto';

  @override
  String get captureDistanceMatch => 'Correspondência de Distância';

  @override
  String get irisSize => 'Tamanho da Íris';

  @override
  String get distanceMatched => 'Distância Correspondente';

  @override
  String get distanceMismatch => 'Distância Não Corresponde';

  @override
  String get excellentMatch => 'Correspondência excelente';

  @override
  String get goodMatch => 'Boa correspondência';

  @override
  String get acceptableMatch => 'Correspondência aceitável';

  @override
  String get considerRetaking =>
      'Distância não corresponde - considere refazer';

  @override
  String get qualityReady => 'Pronto! Mantenha firme...';

  @override
  String get qualityTooBlurry => 'Mantenha a câmera firme';

  @override
  String get qualityTooDark => 'Precisa de mais luz';

  @override
  String get qualityTooBright => 'Muito claro - reduza a luz';

  @override
  String get qualityNoContrast => 'Ajuste o ângulo da iluminação';

  @override
  String get qualityNoPupil => 'Centralize a pupila no quadro';

  @override
  String get qualityNotCentered => 'Mova o olho para o centro';

  @override
  String get qualityNotAnEye => 'Nenhum olho detectado';

  @override
  String get qualityProcessing => 'Processando...';

  @override
  String get distanceMatchedCheck => '✓ Distância correspondente';

  @override
  String get distanceGoodMatchCheck => '✓ Boa correspondência';

  @override
  String get distanceSlightlyBack => 'Um pouco para trás ↔';

  @override
  String get distanceSlightlyCloser => 'Um pouco mais perto ↔';

  @override
  String get distanceAlmostThere => 'Quase lá...';

  @override
  String get distanceMoveBack => 'Afaste-se ←←';

  @override
  String get distanceMoveCloser => 'Aproxime-se →→';

  @override
  String get distanceTooClose => 'Muito perto! Afaste-se';

  @override
  String get distanceTooFar => 'Muito longe! Aproxime-se';

  @override
  String get distanceStabilizing => 'Estabilizando...';

  @override
  String distanceLabel(int percent) {
    return 'Distância: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'Câmera Frontal';

  @override
  String get rearCameraLabel => 'Câmera Traseira';

  @override
  String get startingCamera => 'Iniciando câmera...';

  @override
  String get eyeNotDetected => 'Olho Não Detectado';

  @override
  String get tryAgain => 'Tentar Novamente';

  @override
  String get indicatorEye => 'Olho';

  @override
  String get indicatorSharp => 'Nitidez';

  @override
  String get indicatorLight => 'Luz';

  @override
  String get indicatorFocus => 'Foco';

  @override
  String get indicatorPupil => 'Pupila';

  @override
  String get indicatorIris => 'Íris';

  @override
  String get indicatorMatch => 'Corresp.';

  @override
  String get checkImageShape => 'Forma da Imagem';

  @override
  String get checkCircularIris => 'Íris Circular';

  @override
  String get checkDarkPupil => 'Pupila Escura';

  @override
  String get checkIrisTexture => 'Textura da Íris';

  @override
  String get checkPupilIrisStructure => 'Estrutura Pupila-Íris';

  @override
  String get checkNaturalColors => 'Cores Naturais';

  @override
  String get checkEdgePattern => 'Padrão de Bordas';

  @override
  String get errorImageShapeIncorrect =>
      'Forma incorreta - certifique-se que o olho preencha o quadro';

  @override
  String get errorNoEyeDetected =>
      'Nenhum olho detectado - centralize a íris no quadro';

  @override
  String get errorNoPupilDetected =>
      'Nenhuma pupila detectada - garanta boa iluminação';

  @override
  String get errorNoIrisTexture =>
      'Sem textura da íris - aproxime-se mais do olho';

  @override
  String get errorUnusualColors =>
      'Cores incomuns detectadas - evite telas/reflexos';

  @override
  String get errorTooManyEdges => 'Muitas bordas retas - pode não ser um olho';

  @override
  String get errorNotValidEye => 'Imagem de olho inválida - tente novamente';

  @override
  String get holdStillCapturing => 'Fique parado - capturando...';

  @override
  String get adjustDistanceFirst => 'Ajuste a distância primeiro';

  @override
  String get stabilizingReading => 'Estabilizando...';

  @override
  String get autoCaptureWhenReady => 'Captura automática quando pronto';

  @override
  String get tapOrWaitAutoCapture => 'Toque ou aguarde captura automática';

  @override
  String get validatingImage => 'Validando...';

  @override
  String get capturingStatus => 'Capturando...';

  @override
  String get adjustPositionStatus => 'Ajuste a posição';

  @override
  String get validationTip =>
      'Dica: Garanta boa iluminação, segure a câmera a 10-15cm do olho, evite reflexos';

  @override
  String get validationChecksTitle => 'Verificações de Validação:';

  @override
  String confidenceLabel(int percent) {
    return 'Confiança:';
  }

  @override
  String get incompleteData => 'Dados incompletos';

  @override
  String get irisDiameterLabel => 'íris ø';

  @override
  String get plrResponseCurve => 'Curva de Resposta PLR';

  @override
  String get plrLatency => 'Latência';

  @override
  String get plrVelocity => 'Velocidade';

  @override
  String get plrRecoveryTime => 'Recuperação';

  @override
  String get plrRecoveryRatio => 'Razão Rec.';

  @override
  String get plrEnhancedMetrics => 'Métricas PLR Avançadas';

  @override
  String get plrNormalLatency => 'Normal: 200-500ms';

  @override
  String get plrNormalConstriction => 'Normal: 10-30%';

  @override
  String get plrNormalVelocity => 'Normal: 1.5-4.0%/s';

  @override
  String get plrReferenceValues => 'Valores de Referência PLR Normais';

  @override
  String get plrSubjectInfo => 'Informação do Sujeito';

  @override
  String get plrTestType => 'Reflexo Pupilar à Luz';

  @override
  String get plrAnalysisSummary => 'Resumo da Análise';

  @override
  String get plrTotalFrames => 'Total de Quadros Analisados';

  @override
  String get plrSuccessRate => 'Taxa de Sucesso';

  @override
  String get plrMaxConstriction => 'Constrição Máxima';

  @override
  String get anwTitle => 'Coroa Nervosa Autônoma (ANW)';

  @override
  String get anwAbnormal => 'Anormal';

  @override
  String get anwDiameter => 'Diâmetro';

  @override
  String get anwPerimeter => 'Perímetro';

  @override
  String get anwAsymmetry => 'Assimetria';

  @override
  String get anwElevated => 'Elevado';

  @override
  String get anwFormType => 'Tipo de Forma';

  @override
  String get anwRegular => 'Regular';

  @override
  String get anwDrawnIn => 'Contraído';

  @override
  String get anwIndented => 'Recortado';

  @override
  String get anwLacerated => 'Lacerado';

  @override
  String get anwSpastic => 'Espástico';

  @override
  String get anwAtonic => 'Atônico';

  @override
  String get anwTonicState => 'Padrao Tonico Historico';

  @override
  String get anwParasympathotonic => 'Padrao parassimpaticotonico';

  @override
  String get anwSympathotonicState => 'Padrao simpaticotonico';

  @override
  String get anwShiftDetected => 'Padrao Historico de Deslocamento';

  @override
  String get anwConstrictionDetected => 'Constrição Detectada';

  @override
  String get anwFindings => 'Achados';

  @override
  String get anwRatioComparison => 'Proporção ANW';

  @override
  String get bilateralANWComparison => 'Comparação Bilateral de ANW';

  @override
  String get anwSymmetryNormal => 'Simetria de ANW dentro dos limites normais.';

  @override
  String get anwAsymmetryDetected =>
      'Assimetria de ANW detectada entre os olhos.';

  @override
  String get functionalFrustration =>
      'Frustração funcional na correlação entre os sistemas nervosos simpático e parassimpático.';

  @override
  String get anwParasympathotonicDesc =>
      'Observacoes historicas associaram isto a maior sensibilidade liminar, atividade reflexa acelerada e funcoes secretorias/evacuatorias gastrointestinais aumentadas.';

  @override
  String get anwSympathotonicDesc =>
      'Observacoes historicas associaram isto a menor sensibilidade liminar, atividade reflexa desacelerada e funcoes secretorias/evacuatorias gastrointestinais reduzidas.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Estudos historicos segundo Velchover associaram isto a padroes de sobrecarga do ventriculo esquerdo e estresse cardiaco.';

  @override
  String get anwFrontalConstricted =>
      'Zona frontal do cinto pupilar está contraída.';

  @override
  String get anwBasalConstricted =>
      'Zona basal do cinto pupilar está contraída.';

  @override
  String get anwFrontalBasalConstricted =>
      'Zonas frontal e basal do cinto pupilar estão contraídas.';

  @override
  String get helpTitle => 'Ajuda e Guia do Usuário';

  @override
  String get helpTabQuickStart => 'Início Rápido';

  @override
  String get helpTabCnriAnalysis => 'Análise CNRI';

  @override
  String get helpTabShortcuts => 'Atalhos';

  @override
  String get helpTabTroubleshooting => 'Solução de Problemas';

  @override
  String get helpOnlineDocs => 'Documentação Online';

  @override
  String get helpContactSupport => 'Contatar Suporte';

  @override
  String get helpGettingStarted => 'Começando';

  @override
  String get helpStep1Title => 'Conecte Seu Iriscópio';

  @override
  String get helpStep1Desc =>
      'Conecte seu Dino-Lite ou iriscópio USB compatível.';

  @override
  String get helpStep2Title => 'Insira Informações do Paciente';

  @override
  String get helpStep2Desc =>
      'Preencha nome, idade, sexo e queixas principais do paciente.';

  @override
  String get helpStep3Title => 'Capture o Olho Direito (OD)';

  @override
  String get helpStep3Desc =>
      'Posicione o iriscópio e capture a imagem do olho direito.';

  @override
  String get helpStep4Title => 'Capture o Olho Esquerdo (OS)';

  @override
  String get helpStep4Desc =>
      'Repita para o olho esquerdo com iluminação consistente.';

  @override
  String get helpStep5Title => 'Revise a Análise';

  @override
  String get helpStep5Desc =>
      'O app analisa razão P/I, forma pupilar e características ANW.';

  @override
  String get helpStep6Title => 'Exporte o Relatório';

  @override
  String get helpStep6Desc => 'Salve como formato PDF, TXT ou JSON.';

  @override
  String get helpTipBestResults =>
      'Para melhores resultados: Use iluminação consistente e mantenha 2-3cm de distância do iriscópio.';

  @override
  String get helpCnriProtocolFeatures => 'Características do Protocolo CNRI';

  @override
  String get helpFeaturePiRatioTitle => 'Razão Pupila/Íris (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      'Normal: 20-30%. Valores fora podem indicar desequilíbrio autonômico.';

  @override
  String get helpFeaturePupilFormTitle => 'Análise de Forma Pupilar';

  @override
  String get helpFeaturePupilFormDesc =>
      'Detecta padrões ovais, direção de descentração e excentricidade.';

  @override
  String get helpFeatureAnwTitle => 'Avaliação ANW (Colarete)';

  @override
  String get helpFeatureAnwDesc =>
      'Analisa razão, regularidade de forma, deslocamentos setoriais e estado tônico.';

  @override
  String get helpFeatureZoneTitle => 'Análise de Zonas';

  @override
  String get helpFeatureZoneDesc =>
      'Mapeia achatamentos/protrusões para zonas de órgãos CNRI.';

  @override
  String get helpFeatureBilateralTitle => 'Comparação Bilateral';

  @override
  String get helpFeatureBilateralDesc =>
      'Compara OD vs OS para detectar assimetrias.';

  @override
  String get helpFeatureMlTitle => 'Comparação ONNX CNN';

  @override
  String get helpFeatureMlDesc =>
      'O modelo ONNX CNN fornece medições secundárias para comparação.';

  @override
  String get helpKeyboardShortcuts => 'Atalhos de Teclado';

  @override
  String get helpCameraControls => 'Controles de Câmera';

  @override
  String get helpShortcutSpace => 'Capturar imagem';

  @override
  String get helpShortcutCtrlS => 'Salvar relatório PDF';

  @override
  String get helpShortcutCtrlO => 'Abrir imagem da galeria';

  @override
  String get helpShortcutCtrlH => 'Ver histórico de exames';

  @override
  String get helpShortcutF11 => 'Alternar tela cheia';

  @override
  String get helpShortcutEsc => 'Voltar / Cancelar';

  @override
  String get helpShortcutScroll => 'Aproximar/afastar';

  @override
  String get helpShortcutDoubleClick => 'Redefinir zoom';

  @override
  String get helpCommonIssues => 'Problemas Comuns';

  @override
  String get helpIssueCameraNotDetected => 'Câmera não detectada';

  @override
  String get helpIssueCameraSolution1 => 'Verifique conexão USB';

  @override
  String get helpIssueCameraSolution2 => 'Tente porta USB diferente';

  @override
  String get helpIssueCameraSolution3 => 'Instale drivers Dino-Lite';

  @override
  String get helpIssueCameraSolution4 => 'Reinicie o aplicativo';

  @override
  String get helpIssuePupilDetectionFails => 'Falha na detecção de pupila';

  @override
  String get helpIssuePupilSolution1 => 'Assegure iluminação adequada';

  @override
  String get helpIssuePupilSolution2 => 'Centralize pupila no quadro';

  @override
  String get helpIssuePupilSolution3 => 'Limpe lente do iriscópio';

  @override
  String get helpIssuePupilSolution4 => 'Ajuste foco manualmente';

  @override
  String get helpIssuePdfExportFails => 'Falha na exportação PDF';

  @override
  String get helpIssuePdfSolution1 => 'Verifique permissões de pasta';

  @override
  String get helpIssuePdfSolution2 => 'Assegure espaço disponível em disco';

  @override
  String get helpIssuePdfSolution3 => 'Feche arquivos PDF abertos';

  @override
  String get helpIssuePdfSolution4 => 'Tente exportar TXT primeiro';

  @override
  String get helpCaptureChecklistTitle => 'Checklist de Captura';

  @override
  String get helpCaptureChecklist1 =>
      'Mantenha a pupila centralizada e totalmente visível no enquadramento.';

  @override
  String get helpCaptureChecklist2 =>
      'Use iluminação uniforme e reduza brilho ou reflexos na córnea.';

  @override
  String get helpCaptureChecklist3 =>
      'Mantenha distância semelhante do iriscópio para olho direito e esquerdo.';

  @override
  String get helpCaptureChecklist4 =>
      'Refaça o foco ou capture novamente se a borda da pupila parecer suave ou borrada.';

  @override
  String get helpExportSettingsTitle => 'Configurações de Exportação';

  @override
  String get helpExportSettingsDesc =>
      'Auto-salvar PDF pode salvar um relatório após a análise, Incluir Imagens controla se as fotos aparecem no PDF, e Comparação ONNX CNN adiciona valores comparativos aos relatórios.';

  @override
  String get helpHybridScoreTitle => 'Confiança e Grau Híbridos';

  @override
  String get helpHybridScoreDesc =>
      'A confiança e o grau exibidos combinam qualidade geométrica clássica com concordância ML, refletindo a confiabilidade da medição e não um diagnóstico.';

  @override
  String get helpAnomalyGuideTitle => 'Como Ler Achatamentos e Protrusões';

  @override
  String get helpAnomalyGuideDesc =>
      'Achatamentos indicam tração relativa para dentro e protrusões indicam tração para fora ao longo da borda pupilar; cada cartão mostra zona, magnitude e associação mapeada.';

  @override
  String get helpZoneOverlayGuideTitle => 'Sobreposição de Zonas';

  @override
  String get helpZoneOverlayGuideDesc =>
      'Use a sobreposição de zonas para inspecionar visualmente as posições dos setores e conferir onde as anomalias detectadas ficam ao redor da pupila e da íris.';

  @override
  String get helpContactSupportTip =>
      'Contate helpdesk@cnri.edu para assistência.';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsCameraIriscope => 'CÂMERA / IRISCÓPIO';

  @override
  String get settingsPreferredCamera => 'Câmera Preferida:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'Câmera USB';

  @override
  String get settingsCameraAutoDetect => 'Auto-detectar';

  @override
  String get settingsDefaultZoom => 'Zoom Padrão:';

  @override
  String get settingsAnalysis => 'ANÁLISE';

  @override
  String get settingsShowMlComparison => 'Mostrar Comparação ML';

  @override
  String get settingsShowZoneOverlay => 'Mostrar Sobreposição de Zonas';

  @override
  String get settingsExportReports => 'EXPORTAÇÃO E RELATÓRIOS';

  @override
  String get settingsAutoSavePdf => 'Auto-salvar PDF';

  @override
  String get settingsIncludeImages => 'Incluir Imagens';

  @override
  String get settingsSaved => 'Configurações salvas';

  @override
  String get aboutResearchEdition => 'Edição de Pesquisa';

  @override
  String aboutVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get aboutLicense => 'Licença';

  @override
  String get aboutLicensedTo => 'Licenciado para:';

  @override
  String get aboutExpires => 'Expira:';

  @override
  String get aboutManageLicense => 'Gerenciar Licença';

  @override
  String get aboutBasedOnCnri => 'Baseado no Protocolo CNRI';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'Site';

  @override
  String get aboutPrivacy => 'Privacidade';

  @override
  String get languageSelectTitle => 'Selecionar Idioma';

  @override
  String get selectLanguage => 'Selecionar Idioma';

  @override
  String get languageChanged => 'Idioma Alterado';

  @override
  String languageChangedMessage(String language) {
    return 'Idioma do app definido para $language';
  }

  @override
  String get languageSystemNotAvailable => 'Sistema de idioma não disponível';

  @override
  String get licenseLoading => 'Carregando...';

  @override
  String get licenseWelcome => 'Bem-vindo ao PupilMetrics!';

  @override
  String get licenseTrialFeatures =>
      'Teste gratuito de 14 dias • Recursos completos';

  @override
  String get licenseStartTrial => 'Iniciar Teste Gratuito';

  @override
  String get licenseEnterKey => 'Inserir Licença';

  @override
  String get licenseFreeTrial => 'Teste Gratuito';

  @override
  String licenseDaysRemaining(int count) {
    return '$count dias restantes';
  }

  @override
  String get licenseTrialEnded => 'Teste Encerrado';

  @override
  String get licenseEnterToContinue => 'Insira licença para continuar';

  @override
  String get licenseStandard => 'Licença Padrão';

  @override
  String get licenseProfessional => 'Licença Profissional';

  @override
  String get licenseEnterprise => 'Licença Empresarial';

  @override
  String get licenseLicensed => 'Licenciado';

  @override
  String get licenseActive => 'Ativo';

  @override
  String get licenseTrialUser => 'Usuário de Teste';

  @override
  String get licenseLifetime => 'Vitalícia';

  @override
  String get licenseNotSetUp => 'Não Configurada';

  @override
  String get trialExpiredTitle => 'Período de Teste Encerrado';

  @override
  String get trialExpiredMessage =>
      'Seu teste de 14 dias terminou. Para continuar analisando imagens de íris, por favor adquira uma licença.';

  @override
  String get trialExpiredCanStill => 'Você ainda pode:';

  @override
  String get trialExpiredViewAnalyses => 'Ver suas análises anteriores';

  @override
  String get trialExpiredExportReports => 'Exportar relatórios existentes';

  @override
  String get trialExpiredAccessHistory => 'Acessar histórico de exames';

  @override
  String get trialExpiredMaybeLater => 'Talvez Depois';

  @override
  String get licenseRegistration => 'Registro de Licença';

  @override
  String get licenseStatusValid => 'Licenciado';

  @override
  String get licenseStatusTrialActive => 'Teste Gratuito';

  @override
  String get licenseStatusTrialExpired => 'Teste Encerrado';

  @override
  String get licenseStatusExpired => 'Licença Expirada';

  @override
  String get licenseStatusInvalid => 'Licença Inválida';

  @override
  String get licenseStatusUnregistered => 'Não Configurada';

  @override
  String get licenseStatusMachineMismatch => 'Computador Diferente';

  @override
  String get licenseStatusNetworkError => 'Erro de Conexão';

  @override
  String get licenseEnterKeyTitle => 'Inserir Chave de Licença';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'Seu Nome';

  @override
  String get licenseEmailAddress => 'Endereço de E-mail';

  @override
  String get licenseMachineId => 'ID da Máquina';

  @override
  String get licenseCopyMachineId => 'Copiar ID da Máquina';

  @override
  String get licenseMachineIdCopied =>
      'ID da máquina copiado para área de transferência';

  @override
  String get licenseValidationKeyRequired =>
      'Por favor insira sua chave de licença';

  @override
  String get licenseValidationKeyFormat =>
      'A chave deve ter 20 caracteres (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => 'Por favor insira seu nome';

  @override
  String get licenseValidationEmailRequired => 'Por favor insira seu e-mail';

  @override
  String get licenseValidationEmailInvalid =>
      'Por favor insira um e-mail válido';

  @override
  String get licenseActivate => 'Ativar Licença';

  @override
  String get licenseContinueTrial => 'Continuar Teste';

  @override
  String get licenseBuyLicense => 'Comprar Licença';

  @override
  String get licenseNeedHelp => 'Precisa de ajuda?';

  @override
  String get licenseLicenseAgreement => 'Contrato de Licença';

  @override
  String get licenseActivatedSuccess => 'Licença Ativada com Sucesso!';

  @override
  String get licenseMsgMachineMismatch =>
      'Esta licença está registrada em outro computador. Por favor use seu dispositivo original ou contate o suporte.';

  @override
  String get licenseMsgTrialEnded =>
      'Seu teste gratuito terminou. Insira uma chave de licença para continuar usando todos os recursos.';

  @override
  String get licenseMsgExpired =>
      'Sua licença expirou. Por favor renove para continuar.';

  @override
  String get licenseMsgNeedsSetup =>
      'A licença precisa ser configurada. Inicie seu teste gratuito ou insira uma chave de licença.';

  @override
  String get licenseMsgCheckFormat =>
      'Por favor verifique o formato da sua chave. Deve parecer assim: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized =>
      'Esta chave de licença não foi reconhecida. Por favor verifique e tente novamente.';

  @override
  String get licenseMsgAlreadyRegistered =>
      'Esta chave já está registrada em outro computador.';

  @override
  String get licenseMsgContactSupport =>
      'Esta licença expirou. Por favor contate o suporte para renovação.';

  @override
  String get licenseMsgActivatedThankYou =>
      'Licença ativada com sucesso! Obrigado pela sua compra.';

  @override
  String get licenseMsgUnableToActivate =>
      'Não foi possível ativar a licença. Por favor verifique sua conexão com a internet e tente novamente.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'Bem-vindo! Seu teste gratuito de $days dias começou.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'Teste ativo: $days dias restantes.';
  }

  @override
  String get licenseMsgFreeTrialActive => 'Teste gratuito ativo';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'Licença ativa - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey =>
      'Não foi possível ativar esta chave de licença.';

  @override
  String get licenseMsgNoLongerValid => 'A licença não é mais válida.';

  @override
  String get licenseMsgUnableToVerify =>
      'Não foi possível verificar esta chave de licença. Por favor contate o suporte.';

  @override
  String get trialStartedSnackbar => 'Teste Iniciado!';

  @override
  String get trialStartedMessage => 'Aproveite 14 dias de acesso completo';

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
  String get focusBlur => 'focar / desfocar';

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
  String get dockLeft => 'acoplar esquerda';

  @override
  String get dockRight => 'acoplar direita';

  @override
  String get undock => 'desacoplar';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'redefinir';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => 'transparente';

  @override
  String get red => 'vermelho';

  @override
  String get green => 'verde';

  @override
  String get blue => 'azul';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => 'superior esquerdo';

  @override
  String get topCenter => 'superior centro';

  @override
  String get topRight => 'superior direito';

  @override
  String get centerLeft => 'centro esquerdo';

  @override
  String get centerRight => 'centro direito';

  @override
  String get bottomLeft => 'inferior esquerdo';

  @override
  String get bottomCenter => 'inferior centro';

  @override
  String get bottomRight => 'inferior direito';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => 'Definir';

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
  String get defaultIcon => 'Padrão';

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
  String get dragToMoveArea => 'Arrastar para mover';

  @override
  String get dragToResizeArea => 'Arrastar para redimensionar';

  @override
  String get dragToResizeAreaExample => 'Exemplo de área redimensionável';

  @override
  String get closeWindowConfirmation =>
      'Tem certeza de que deseja fechar esta janela?';

  @override
  String get plrReportTitle => 'Relatorio de Analise PLR';

  @override
  String get plrResearchOnlyTitle => 'APENAS PARA PESQUISA/EDUCACAO';

  @override
  String get plrResearchDisclaimer =>
      'Os resultados NAO sao diagnosticos medicos. Consulte um profissional de saude.';

  @override
  String get plrNameLabel => 'Nome';

  @override
  String plrAgeYears(int age) {
    return 'Idade: $age anos';
  }

  @override
  String get plrTestLabel => 'Teste';

  @override
  String get plrSummaryTitle => 'Resumo PLR';

  @override
  String plrGradeValue(String grade) {
    return 'Grau $grade';
  }

  @override
  String get plrStatusLabel => 'Status';

  @override
  String get plrDetectedStatus => 'PLR DETECTADO';

  @override
  String get plrWeakNotDetectedStatus => 'FRACO/NAO DETECTADO';

  @override
  String get plrRecoveryTimeLabel => 'Tempo de recuperacao';

  @override
  String get plrRecoveryRatioLabel => 'Taxa de recuperacao';

  @override
  String get plrChartDescription =>
      'Representacao visual da resposta pupilar ao longo do tempo';

  @override
  String plrPiRange(String min, String max) {
    return 'Faixa P/I: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return 'Min: $value%';
  }

  @override
  String get plrFrameDataTitle => 'Dados de quadros';

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
    return 'Sucesso: $success | Falha: $fail';
  }

  @override
  String get plrReferenceLatencyLine =>
      '• Latencia: 200-500ms (tempo ate a resposta inicial)';

  @override
  String get plrReferenceConstrictionLine =>
      '• Constricao: reducao de 10-30% em relacao a linha de base';

  @override
  String get plrReferenceVelocityLine => '• Velocidade: 1.5-4.0%/segundo';

  @override
  String get plrReferenceRecoveryLine =>
      '• Recuperacao: >75% de retorno a linha de base em 5 segundos';

  @override
  String get plrReferenceRecoveryLineShort =>
      '• Recuperacao: >75% de retorno a linha de base em 5s';

  @override
  String plrShareSubject(String eye) {
    return 'Relatorio de Analise PLR - $eye';
  }

  @override
  String get plrTextReportTitle => 'RELATORIO DE ANALISE DE VIDEO PLR';

  @override
  String get plrTextDisclaimerTitle =>
      'AVISO: apenas para pesquisa/fins educacionais';

  @override
  String get plrTextDisclaimerBody =>
      'Os resultados NAO sao diagnosticos medicos.';

  @override
  String get plrOverallGradeLabel => 'Classificacao geral';

  @override
  String get plrEndOfReport => 'FIM DO RELATORIO';

  @override
  String get zoneOverlay => 'Sobreposição de Zonas';

  @override
  String get tipDragImage =>
      'Dica: arraste a imagem para alinhar o limbo com os círculos.';

  @override
  String get overlayMetrics => 'Métricas de Sobreposição';

  @override
  String get piRatioLabel => 'Razão P/I:';

  @override
  String get ellipsenessLabel => 'Elipticidade:';

  @override
  String get decentralizationLabel => 'Descentralização:';

  @override
  String get detectedFindings => 'Achados detectados';

  @override
  String get anwCollarette => 'ANW / COLARETE';

  @override
  String get observerNotes => 'Notas do observador';

  @override
  String get observerNotesHint =>
      'Insira observações clínicas, achados de zona, padrões…';

  @override
  String get autoCenter => 'Auto-centralizar';

  @override
  String get anwRing => 'Anel ANW';

  @override
  String get axisGrid => 'Eixo/Grade';

  @override
  String get chart => 'Gráfico';

  @override
  String get hoverToIdentify =>
      'Passe o cursor ou toque em uma zona para identificar';

  @override
  String get organsMode => 'Modo órgãos — passe sobre a íris para identificar';

  @override
  String get mildSizeDiff =>
      'Diferença leve de tamanho. Pode ser variação fisiológica.';

  @override
  String withinBaseline(Object age, Object group) {
    return 'Dentro da faixa de pesquisa para idade $age ($group)';
  }

  @override
  String get formLabel => 'Forma:';

  @override
  String get flatteningLabel => 'Achatamento:';

  @override
  String get protrusionLabel => 'Protrusão:';

  @override
  String get decentrationLabel => 'Descentração:';

  @override
  String get pupilSizeLabel => 'Tamanho pupilar:';

  @override
  String get anwRatioLabel => 'Razão ANW:';

  @override
  String get anwToneLabel => 'Tônus ANW:';

  @override
  String get noMajorODAnomalies => 'Sem anomalias pupilares OD significativas.';

  @override
  String get noMajorOSAnomalies => 'Sem anomalias pupilares OS significativas.';

  @override
  String get anwNotAssessed => 'ANW: não avaliado';

  @override
  String get manualAlignmentAid =>
      'Auxílio de alinhamento manual apenas para revisão. Arraste a imagem ou use Auto-centralizar.';

  @override
  String get frontalShift => 'S: Padrao de deslocamento frontal.';

  @override
  String get cerebralCirculation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de circulacao cerebral.';

  @override
  String get middleTemporalShift => 'D: Padrao de deslocamento medio-temporal.';

  @override
  String get respiratoryCardiac =>
      'Estudos historicos segundo Velchover associaram isto a padroes autonomicos respiratorios e cardiacos.';

  @override
  String get findings => 'Achados:';

  @override
  String get analysisReportTitle => 'Relatorio de Analise Pupilar';

  @override
  String get reportResearchVersion => 'Versao de Pesquisa';

  @override
  String get reportDisclaimerTitle =>
      'AVISO: apenas para pesquisa/fins educacionais';

  @override
  String get reportDisclaimerBody =>
      'Os resultados sao observacoes de pesquisa e NAO diagnosticos medicos.';

  @override
  String get reportPersonInformationTitle => 'Informacoes da pessoa';

  @override
  String get reportAgeGroupLabel => 'Faixa etaria';

  @override
  String get reportPupilSizeComparisonTitle => 'Comparacao do tamanho pupilar';

  @override
  String get reportCaptureDistanceMetricsTitle =>
      'Metricas de distancia de captura';

  @override
  String get reportResearchObservationsTitle => 'Observacoes de pesquisa';

  @override
  String get reportObserverNotesZoneOverlayTitle =>
      'Notas do observador (sobreposicao de zonas)';

  @override
  String get reportEndOfReport => 'FIM DO RELATORIO';

  @override
  String get reportGradeLabel => 'Grau';

  @override
  String get reportPupilFormTitle => 'Forma pupilar';

  @override
  String get reportDecentrationTitle => 'Descentracao';

  @override
  String get reportFlatteningsTitle => 'Achatamentos';

  @override
  String get reportProtrusionsTitle => 'Protusoes';

  @override
  String get reportAnwParametersTitle => 'Coroa nervosa autonoma (ANW)';

  @override
  String get reportTonicStateLabel => 'Padrao Tonico Historico';

  @override
  String get reportShiftDetectedTitle => 'Padrao Historico de Deslocamento';

  @override
  String get reportClinicalLabel => 'Nota Historica';

  @override
  String get reportConstrictionDetectedTitle => 'Constricao detectada';

  @override
  String get reportSeverityLabel => 'Severidade';

  @override
  String get reportReferenceValuesTitle =>
      'Valores de referencia (Protocolo de Pesquisa CNRI)';

  @override
  String get reportMatchLabel => 'Correspondencia';

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
    return 'Relatorio de Analise Pupilar - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return 'Segue em anexo o relatorio de analise pupilar de $patientName, gerado em $date.';
  }

  @override
  String belowBaseline(int age, String group) {
    return 'Abaixo da faixa de pesquisa para idade $age ($group)';
  }

  @override
  String aboveBaseline(int age, String group) {
    return 'Acima da faixa de pesquisa para idade $age ($group)';
  }

  @override
  String get ageGroupInfant => 'Lactente';

  @override
  String get ageGroupChild15 => 'Crianca (1-5)';

  @override
  String get ageGroupChild611 => 'Crianca (6-11)';

  @override
  String get ageGroupTeen => 'Adolescente';

  @override
  String get ageGroupAdult2039 => 'Adulto (20-39)';

  @override
  String get ageGroupAdult4059 => 'Adulto (40-59)';

  @override
  String get ageGroupSenior60Plus => 'Idoso (60+)';

  @override
  String get middleNasalShift => 'Padrao de deslocamento medio-nasal.';

  @override
  String get upperTemporalShift => 'Padrao de deslocamento temporal-superior.';

  @override
  String get lowerTemporalShift => 'Padrao de deslocamento temporal-inferior.';

  @override
  String get basalShift => 'Padrao de deslocamento basal.';

  @override
  String get vagusStellateAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de hipofuncao do nervo vago ou do ganglio estrelado.';

  @override
  String get venaCavaInferiorAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de disturbio hemodinamico na veia cava inferior.';

  @override
  String get vertebralArteryAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes de circulacao da arteria vertebral.';

  @override
  String get smallPelvisAssociation =>
      'Estudos historicos segundo Velchover associaram isto a padroes congestivos na pelve menor.';

  @override
  String get openZoneOverlay => 'Abrir sobreposicao de zonas';

  @override
  String get iris => 'Iris';

  @override
  String get chartOpacity => 'Opacidade do grafico';

  @override
  String get irisSizeNotAvailable => 'Dados de tamanho da iris nao disponiveis';

  @override
  String get ratio => 'Proporcao';

  @override
  String get reportRefPiRatio => 'Relacao Pupila/Iris: Normal 20-30%';

  @override
  String get reportRefEllipseness => 'Elipticidade: Normal >95%';

  @override
  String get reportRefDecentralization => 'Descentralizacao: Normal <5%';

  @override
  String get reportRefPupilSizeDiff =>
      'Dif. Tamanho Pupila: <2% Normal, 2-4% Leve, >4% Significativo';

  @override
  String get enterPatientInfoAnalysis => 'Inserir Info do Paciente → Análise';

  @override
  String get chooseCaptureMethod => 'Escolha o método de captura:';

  @override
  String get usbCamera => 'Câmera USB';

  @override
  String get selectExistingImage => 'Selecionar imagem existente';

  @override
  String get detectingCameras => 'Detectando câmeras...';

  @override
  String get retryDetection => 'Tentar detecção novamente';

  @override
  String get connectUvcCameraViaUsb => 'Conecte a câmera UVC via USB';

  @override
  String get ensureCameraDriversInstalled =>
      'Certifique-se de que os drivers estão instalados';

  @override
  String get tapRefreshToDetect => 'Toque em Atualizar para detectar câmeras';

  @override
  String get connectUsbCameraToBegin => 'Conecte a câmera USB para começar';

  @override
  String get noExternalCameraTitle => 'Nenhuma câmera externa detectada';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'Conecte seu iriscópio USB e certifique-se de que está conectado';

  @override
  String get languagesAvailable => 'Idiomas disponíveis';

  @override
  String get validationChecks => 'Verificações de validação:';

  @override
  String get eyeQualityTip =>
      'Dica: Garanta boa iluminação e mantenha o olho firme';

  @override
  String get validatingEye => 'Validando olho...';

  @override
  String get initializing => 'Inicializando...';

  @override
  String get nameLabel => 'Nome:';

  @override
  String get ageLabel => 'Idade:';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get pleaseEnterName => 'Por favor insira o nome';

  @override
  String get pleaseEnterAge => 'Por favor insira a idade';

  @override
  String get ageMustBe2Digits => 'A idade deve ter 1 ou 2 dígitos';

  @override
  String get optional => '(Opcional)';

  @override
  String get bilateralBothHands => 'Uso bilateral de ambas as mãos';

  @override
  String get zoom => 'Zoom';

  @override
  String get zoomSliderTip =>
      'Use o controle deslizante de zoom à direita para ajustar a ampliação antes de gravar.';

  @override
  String get aboutProgramDeveloper =>
      'Desenvolvedor do Programa - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => 'Tamanho do gráfico';

  @override
  String get chartOpacityAdvancedTooltip =>
      'Opacidade do gráfico (0 = somente hover / Modo órgãos)';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => 'Concluído e voltar';

  @override
  String get errorImageShape =>
      'Forma da imagem incorreta - garanta que o olho preencha o quadro';

  @override
  String get cameraConnected => 'Câmera conectada';

  @override
  String get cameraDisconnected => 'Câmera desconectada';

  @override
  String get cameraPermissionDenied => 'Permissão da câmera negada';

  @override
  String get cameraFailedInit => 'Falha ao inicializar câmera';

  @override
  String get cameraInUse => 'Câmera está sendo usada por outro aplicativo';

  @override
  String get cameraFormatNotSupported => 'Formato de câmera não suportado';

  @override
  String get capturedImageNotFound =>
      'Arquivo de imagem capturada não encontrado';

  @override
  String get failedToCaptureImage => 'Falha ao capturar imagem';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => 'Ocorreu um erro de câmera';

  @override
  String get connectingToUsbIriscope => 'Conectando ao iriscopio USB...';

  @override
  String get noCamerasDetectedMessage =>
      'Nenhuma câmera detectada. Certifique-se de que sua câmera USB está conectada e reconhecida pelo sistema.';

  @override
  String get failedToAccessCameras => 'Falha ao acessar câmeras';

  @override
  String get notAnEyeImageTitle => 'Não é uma imagem do olho';

  @override
  String get notAnEyeImageBody =>
      'A imagem selecionada não parece ser um olho.\n\nPor favor, escolha uma foto clara da íris/pupila e tente novamente.';

  @override
  String get notAnEyeImageBodyCapture =>
      'A imagem capturada não parece ser um olho.\n\nPor favor, posicione o iriscópio diretamente sobre o olho e recapture.';

  @override
  String get anisocoriaObservationSymmetrical => 'Simétrico';

  @override
  String get anisocoriaObservationSlight => 'Variação leve';

  @override
  String get anisocoriaObservationModerate => 'Variação moderada';

  @override
  String get anisocoriaObservationMarked => 'Variação acentuada';

  @override
  String get settingsNaturalMedicineSection => 'Medicina Natural';

  @override
  String get settingsHerbalToggle =>
      'Recomendações Fitoterapêuticas (baseadas em zonas da íris)';

  @override
  String get settingsNutritionToggle =>
      'Nutrição Dieta 7 Cores (baseada em zonas da íris)';

  @override
  String get settingsChiropracticToggle => 'Quiropraxia / Avaliação Espinal';

  @override
  String get settingsTcmToggle => 'Medicina Tradicional Chinesa (MTC)';

  @override
  String get therapyHerbalTitle => 'Recomendações Fitoterapêuticas';

  @override
  String get therapyHerbalSubtitle =>
      'Achados das zonas da íris — ordenados por peso de evidência';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count referências';
  }

  @override
  String get therapyHerbalDisclaimer =>
      'As sugestões fitoterapêuticas são fornecidas apenas para fins educacionais. Consulte um profissional de saúde qualificado antes do uso.';

  @override
  String get therapyNutritionTitle => 'Nutrição Dieta 7 Cores';

  @override
  String get therapyNutritionSubtitle =>
      'Alimentos e nutrientes para órgãos das zonas da íris';

  @override
  String get therapyNutritionFoodsByColor => 'Alimentos Recomendados por Cor';

  @override
  String get therapyNutritionKeyNutrients => 'Nutrientes-Chave';

  @override
  String get therapyNutritionHerbs => 'Ervas e Especiarias de Suporte';

  @override
  String get therapyNutritionNotes => 'Notas Nutricionais';

  @override
  String get therapyNutritionTonifying => 'Alimentos tonificantes:';

  @override
  String get therapyNutritionAvoid => 'Minimizar / evitar:';

  @override
  String get therapyNutritionDisclaimer =>
      'As sugestões nutricionais baseiam-se na estrutura da Dieta 7 Cores e são fornecidas apenas para fins educacionais. Consulte um profissional antes de fazer mudanças na dieta.';

  @override
  String get therapyChiroTitle => 'Avaliação Quiroprática';

  @override
  String get therapyChiroSubtitle =>
      'Segmentos espinhais indicados pelos achados das zonas da íris';

  @override
  String get therapyChiroVertebrae => 'Vértebras';

  @override
  String get therapyChiroNerveRoots => 'Raízes Nervosas';

  @override
  String get therapyChiroInnervated => 'Estruturas Inervadas';

  @override
  String get therapyChiroSubluxation => 'Possíveis Indicadores de Subluxão';

  @override
  String get therapyChiroMuscles => 'Músculos Frequentemente Afetados';

  @override
  String get therapyChiroAdjusting => 'Abordagem de Ajuste Quiroprático';

  @override
  String get therapyChiroExercises => 'Exercícios e Alongamentos em Casa';

  @override
  String get therapyChiroPostural => 'Nota Postural';

  @override
  String get therapyChiroDisclaimer =>
      'As informações quiroprátias são fornecidas para fins educacionais. Consulte um quiroprático licenciado para diagnóstico e tratamento.';

  @override
  String get therapyTcmTitle => 'Medicina Tradicional Chinesa';

  @override
  String get therapyTcmSubtitle =>
      'Meridiano · Relógio dos Órgãos · Cinco Elementos';

  @override
  String get therapyTcmMeridianFunctions => 'Funções do Meridiano';

  @override
  String get therapyTcmGoverns => 'Governa';

  @override
  String get therapyTcmPatterns => 'Padrões de Desequilíbrio';

  @override
  String get therapyTcmSymptoms => 'Sintomas';

  @override
  String get therapyTcmFormulas => 'Fórmulas Clássicas';

  @override
  String get therapyTcmKeyPoints => 'Pontos-Chave para Este Padrão';

  @override
  String get therapyTcmAcupoints => 'Pontos de Acupressão Chave';

  @override
  String get therapyTcmDiet => 'Terapia Dietética MTC';

  @override
  String get therapyTcmTonifying => 'Alimentos tonificantes:';

  @override
  String get therapyTcmAvoid => 'Minimizar / evitar:';

  @override
  String get therapyTcmDisclaimer =>
      'As informações de MTC são fornecidas para fins educacionais. Consulte um acupunturista ou médico de MTC licenciado.';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings =>
      'Nenhum achado significativo de zonas da íris detectado para gerar recomendações.';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => 'Estação';

  @override
  String get therapyClimateLabel => 'Clima';

  @override
  String get therapyEmotionLabel => 'Emoção';

  @override
  String get therapyTasteLabel => 'Sabor';

  @override
  String get therapyNatureLabel => 'Natureza';

  @override
  String therapyPairedOrgan(String organ) {
    return 'par: $organ';
  }

  @override
  String get bothEyesCapturedTitle => 'Ambos os Olhos Capturados';

  @override
  String get constitutionalType => 'Tipo Constitucional';

  @override
  String get constitutionalTypeOptional => 'Tipo Constitucional (Opcional)';

  @override
  String get selectConstitutionalType => 'Selecionar tipo constitucional…';

  @override
  String get constitutionalTypeNone => 'Nenhum (não avaliado)';

  @override
  String get constitutionalIridology => 'Iridologia Constitucional';

  @override
  String get constitutionalIrisDescription => 'Descrição da Íris';

  @override
  String get constitutionalPredispositions => 'Predisposições de Saúde';

  @override
  String get constitutionalHomeopathicRemedies => 'Remédios Homeopáticos';

  @override
  String get constitutionalTypeBy =>
      'Baseado na Iridologia Constitucional do Dr. Josef Deck';

  @override
  String get addFinding => 'Adicionar achado';

  @override
  String get anomalyType => 'Tipo de anomalia';

  @override
  String get anomalySubtype => 'Subtipo';

  @override
  String get anomalyConclusion => 'Conclusão';

  @override
  String get selectAnomalyType => 'Selecionar tipo…';

  @override
  String get addToNotes => 'Adicionar às notas';
}
