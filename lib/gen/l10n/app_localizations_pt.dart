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
  String get center => 'Centro';

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
  String get close => 'Fechar';

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
  String get anwRatio => 'Razão ANW';

  @override
  String get normal => 'Normal';

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
  String get center => 'Centro';

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
  String get close => 'Fechar';

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
  String get anwRatio => 'Razão ANW';

  @override
  String get normal => 'Normal';

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
}
