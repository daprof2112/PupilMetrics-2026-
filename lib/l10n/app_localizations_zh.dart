// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

  @override
  String get analyzeButton => '分析';

  @override
  String get plrModes => 'PLR模式';

  @override
  String get captureInstructions => '将眼睛置于引导圆内';

  @override
  String get scanHistory => '扫描历史';

  @override
  String get selectCameraMode => '选择摄像头模式';

  @override
  String get loadFromGallery => '从相册加载';

  @override
  String get rightEyePhoto => '右眼照片';

  @override
  String get leftEyePhoto => '左眼照片';

  @override
  String get autoCapture => '自动拍摄';

  @override
  String get autoCaptureDesc => '眼部检测 + 5秒自动拍摄';

  @override
  String get manualCapture => '手动拍摄';

  @override
  String get manualCaptureDesc => '眼部检测 + 手动拍摄（后置摄像头）';

  @override
  String get selfieMode => '自拍模式';

  @override
  String get selfieModeDesc => '眼部检测 + 5秒自动拍摄（前置摄像头）';

  @override
  String get plrVideoRear => 'PLR视频（后置）';

  @override
  String get plrVideoRearDesc => '后置摄像头 • 10秒拍摄';

  @override
  String get plrVideoSelfie => 'PLR视频（自拍）';

  @override
  String get plrVideoSelfieDesc => '前置摄像头 • 10秒拍摄';

  @override
  String get plrVideoCapture => 'PLR视频拍摄';

  @override
  String get frontCamera => '前置摄像头';

  @override
  String get rearCamera => '后置摄像头';

  @override
  String get selectEyeToAssess => '选择要评估的眼睛';

  @override
  String get rightEyeOD => '右眼 (OD)';

  @override
  String get leftEyeOS => '左眼 (OS)';

  @override
  String get recordPlrRightEye => '记录右眼PLR';

  @override
  String get recordPlrLeftEye => '记录左眼PLR';

  @override
  String get loadRightEyeImage => '加载右眼图像';

  @override
  String get loadLeftEyeImage => '加载左眼图像';

  @override
  String get bothEyes => '双眼';

  @override
  String get loadBothEyesDesc => '先加载右眼，再加载左眼';

  @override
  String get selectEyeImageFromDevice => '从设备中选择眼部图像';

  @override
  String get selectRightEyeFirst => '请先选择右眼 (OD) 图像';

  @override
  String get rightEyeSaved => '右眼已保存。请选择左眼 (OS) 图像';

  @override
  String get cancelledNoRightEye => '已取消 - 未选择右眼';

  @override
  String get cancelledNoLeftEye => '已取消 - 未选择左眼';

  @override
  String errorLoadingImages(String error) {
    return '图像加载错误：$error';
  }

  @override
  String get crop43 => '裁剪 (4:3)';

  @override
  String get success => '成功';

  @override
  String get imageCroppedSuccess => '图像裁剪成功！';

  @override
  String get error => '错误';

  @override
  String get cropFailed => '图像裁剪失败，请重试。';

  @override
  String get crop => '裁剪';

  @override
  String get cancel => '取消';

  @override
  String get saved => '已保存！ ✅';

  @override
  String get imageSavedToGallery => '图像已成功保存到相册';

  @override
  String get exposure => '曝光';

  @override
  String get flash => '闪光灯';

  @override
  String get eye => '眼睛';

  @override
  String get center => '中心';

  @override
  String get light => '光线';

  @override
  String get ready => '就绪';

  @override
  String get on => '开';

  @override
  String get off => '关';

  @override
  String get auto => '自动';

  @override
  String get manual => '手动';

  @override
  String get selfie => '自拍';

  @override
  String get pupil => '瞳孔';

  @override
  String get plrHistory => 'PLR历史';

  @override
  String get searchByName => '按姓名搜索...';

  @override
  String get totalScans => '扫描总数';

  @override
  String get thisWeek => '本周';

  @override
  String get patients => '患者';

  @override
  String get detected => '已检测';

  @override
  String get noPlrRecordsYet => '暂无PLR记录';

  @override
  String get recordPlrVideoToSeeHistory => '录制PLR视频后，历史记录将显示在此处';

  @override
  String get deleteRecord => '删除记录？';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return '删除 $name（$eye）的PLR分析记录？\\n\\n此操作无法撤销。';
  }

  @override
  String get delete => '删除';

  @override
  String get recordDeleted => '记录已删除';

  @override
  String plrAnalysis(String eye) {
    return 'PLR分析 - $eye';
  }

  @override
  String get patient => '患者';

  @override
  String get date => '日期';

  @override
  String get frames => '帧数';

  @override
  String get baselinePiRatio => '基线P/I';

  @override
  String get minPiRatio => '最小P/I';

  @override
  String get plrMagnitude => 'PLR幅度';

  @override
  String get constriction => '缩瞳';

  @override
  String get plrDetected => 'PLR已检测';

  @override
  String get confidence => '置信度';

  @override
  String get grade => '等级';

  @override
  String get close => '关闭';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get na => 'N/A';

  @override
  String get takeLeftEyePhoto => '拍摄左眼照片';

  @override
  String get takeRightEyePhoto => '拍摄右眼照片';

  @override
  String get nowTakingLeftEye => '正在拍摄左眼 (OS)';

  @override
  String get startingWithRightEye => '从右眼 (OD) 开始';

  @override
  String get captured => '已拍摄 ✓';

  @override
  String get useSameDistanceLighting => '请使用与右眼相同的距离和光线，以确保准确比较。';

  @override
  String get step1of2 => '第1步 共2步';

  @override
  String get step2of2 => '第2步 共2步';

  @override
  String get bothEyesCaptured => '双眼拍摄完成 ✓';

  @override
  String get continueToLeftEye => '继续拍摄左眼';

  @override
  String get retakeOD => '重拍OD';

  @override
  String get retakeOS => '重拍OS';

  @override
  String get retakeRightEye => '重拍右眼';

  @override
  String get analyzeBothEyes => '分析双眼';

  @override
  String get patientInfoMissing => '患者信息缺失';

  @override
  String get rightEyePhotoMissing => '缺少右眼照片！';

  @override
  String get patientInfoMissingRestart => '患者信息缺失，请重新开始。';

  @override
  String get exitApp => '退出应用';

  @override
  String get tipsForBestResults => '获得最佳效果的建议';

  @override
  String get followGuidelinesForQuality => '请遵循以下指南以获得最佳图像质量';

  @override
  String get cameraDistance => '摄像头距离';

  @override
  String get cameraDistanceDesc => '将摄像头保持在距眼睛10-15厘米处。两眼保持相同距离。';

  @override
  String get lightingPosition => '光线位置';

  @override
  String get lightingPositionDesc => '将光源置于瞳孔边缘内侧或外侧。尝试向摄像头闪光灯方向注视。';

  @override
  String get avoidReflections => '避免反光';

  @override
  String get avoidReflectionsDesc => '避免窗户眩光、镜子和直射灯光，以减少反光。';

  @override
  String get centerYourEye => '居中眼睛';

  @override
  String get centerYourEyeDesc => '确保包含巩膜（白眼球）在内的整个眼睛居中并充满画面。';

  @override
  String get cropProperly => '正确裁剪';

  @override
  String get cropProperlyDesc => '以眼睛为中心裁剪图像。图像将自动以4:3比例保存。';

  @override
  String get importantInformation => '重要信息';

  @override
  String get imageRatio43 => '符合医学影像标准的4:3图像比例';

  @override
  String get forClinicalUseCnri => '供CNRI (cnri.edu) 临床使用';

  @override
  String get noMedicalDiagnosis => '不提供医学诊断';

  @override
  String get eyeWideOpenClear => '请确保眼睛充分睁开且图像清晰';

  @override
  String get personalInfo => '个人信息';

  @override
  String get personInformation => '受检者信息';

  @override
  String get enterPersonDetails => '输入受检者详细信息';

  @override
  String get infoIncludedInReport => '此信息将包含在分析报告中';

  @override
  String get fullName => '姓名';

  @override
  String get enterPersonName => '输入姓名';

  @override
  String get nameRequired => '姓名为必填项';

  @override
  String get sex => '性别';

  @override
  String get male => '男';

  @override
  String get female => '女';

  @override
  String get ageYears => '年龄（岁）';

  @override
  String get enterAge => '输入年龄';

  @override
  String get ageRequired => '年龄为必填项';

  @override
  String get enterValidNumber => '请输入有效数字';

  @override
  String get enterValidAge => '请输入有效年龄（0-120）';

  @override
  String get mainComplaints => '主诉';

  @override
  String get mainComplaintsOptional => '主诉（可选）';

  @override
  String get complaintsHint => '例如：头痛、视力问题、疲劳...';

  @override
  String get continueToCaptire => '继续拍摄';

  @override
  String get ageImportantNote => '年龄对于准确评估瞳孔大小很重要，因为正常范围因年龄而异。';

  @override
  String get submit => '提交';

  @override
  String get pleaseSelectGender => '请选择性别！';

  @override
  String get applicationSubmitted => '申请已成功提交。';

  @override
  String get type => '类型：';

  @override
  String get gender => '性别：';

  @override
  String get rightHanded => '惯用右手';

  @override
  String get leftHanded => '惯用左手';

  @override
  String get partialLeftHandedness => '部分惯用左手';

  @override
  String get retrainedLeftHandedness => '矫正后的左利手';

  @override
  String get bilateralUseBothHands => '双手均用';

  @override
  String get splashTitle => 'PupilMetrics 眼部拍摄';

  @override
  String get splashDeveloper => '程序开发者 - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => '研究/教育工具';

  @override
  String get startNewAnalysis => '开始新分析';

  @override
  String get viewHistory => '查看历史';

  @override
  String get viewResearchDisclaimer => '查看研究免责声明';

  @override
  String get researchDisclaimerTitle => '研究/教育工具';

  @override
  String get researchDisclaimerNotMedical => '非医疗设备';

  @override
  String get researchDisclaimerNotClinical => '不用于临床诊断';

  @override
  String get researchDisclaimerResults => '结果为研究性观察';

  @override
  String get researchDisclaimerConsult => '请始终咨询医疗专业人员';

  @override
  String get researchDisclaimerAcknowledge => '继续使用即表示您确认本应用为研究工具，不应用于医疗决策。';

  @override
  String get researchDisclaimerWarning => '本应用仅供研究和教育目的使用。';

  @override
  String get iUnderstand => '我已了解';

  @override
  String get plrAnalysisTest => 'PLR分析测试';

  @override
  String get checkingVideoFile => '正在检查视频文件...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return '正在处理帧 $current/$total（${timestamp}ms）...';
  }

  @override
  String get analysisComplete => '分析完成！';

  @override
  String get errorVideoNotFound => '错误：未找到视频文件';

  @override
  String get waitingForResults => '等待结果...';

  @override
  String get baseline => '基线';

  @override
  String get flashPhase => '闪光';

  @override
  String get constrictionPhase => '缩瞳';

  @override
  String get recovery => '恢复';

  @override
  String get plrDetectedExclaim => '检测到PLR！';

  @override
  String get plrWeakNotDetected => 'PLR弱/未检测到';

  @override
  String get min => '最小值';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => '缩瞳';

  @override
  String get saveToHistory => '保存到历史';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => '保存帧';

  @override
  String get share => '分享';

  @override
  String get frameSavedToGallery => '帧已保存到相册！';

  @override
  String get failedToSaveFrame => '帧保存失败';

  @override
  String framesSavedToGallery(int count) {
    return '$count帧已保存到相册！';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON已复制到剪贴板！';

  @override
  String get reportCopiedToClipboard => '报告已复制到剪贴板！';

  @override
  String shareFailedError(String error) {
    return '分享失败：$error';
  }

  @override
  String savedToHistoryId(int id) {
    return '已保存到历史！（ID：$id）';
  }

  @override
  String failedToSave(String error) {
    return '保存失败：$error';
  }

  @override
  String get noSuccessfulFramesToSave => '没有可保存的成功帧';

  @override
  String get saveAllFrames => '保存所有帧';

  @override
  String get shareReport => '分享报告';

  @override
  String get shareJson => '分享JSON';

  @override
  String get rerunTest => '重新测试';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => '正在初始化摄像头...';

  @override
  String usingCamera(String camera) {
    return '使用$camera摄像头';
  }

  @override
  String cameraError(String error) {
    return '摄像头错误：$error';
  }

  @override
  String get noCamerasFound => '未找到摄像头';

  @override
  String get retry => '重试';

  @override
  String get startPlrRecording => '开始PLR录制';

  @override
  String get stopRecording => '停止录制';

  @override
  String get phaseReady => '就绪';

  @override
  String get phaseStarting => '启动中...';

  @override
  String phaseBaseline(int sec) {
    return '基线（0-$sec秒）';
  }

  @override
  String get phaseFlash => '闪光！';

  @override
  String phaseConstriction(int start, int end) {
    return '缩瞳（$start-$end秒）';
  }

  @override
  String phaseRecovery(int start, int end) {
    return '恢复（$start-$end秒）';
  }

  @override
  String get phaseComplete => '完成！';

  @override
  String get readyDesc => '将眼睛置于圆内，然后点击开始';

  @override
  String get holdSteady => '保持稳定...';

  @override
  String get recordingBaselinePupil => '正在记录基线瞳孔大小';

  @override
  String lightStimulus(int ms) {
    return '光刺激（${ms}ms）';
  }

  @override
  String get measuringConstriction => '正在测量瞳孔缩小';

  @override
  String get measuringRecovery => '正在测量瞳孔恢复';

  @override
  String get plrRecordingComplete => 'PLR录制完成';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return '将$eye置于圆内。\\n录制$seconds秒期间请保持稳定。';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return '保持眼睛稳定。闪光将在$sec秒时发生。';
  }

  @override
  String get recordingComplete => '录制完成';

  @override
  String get plrVideoCapturedSuccess => 'PLR视频拍摄成功！';

  @override
  String get duration => '时长';

  @override
  String get seconds => '秒';

  @override
  String get frameRate => '帧率';

  @override
  String get camera => '摄像头';

  @override
  String flashAt(int sec, int ms) {
    return '$sec秒时（${ms}ms）';
  }

  @override
  String get phases => '阶段';

  @override
  String get phasesFlow => '基线 → 闪光 → 缩瞳 → 恢复';

  @override
  String get expectedNormalValues => '预期正常值：';

  @override
  String get latency => '潜伏期';

  @override
  String get velocity => '速度';

  @override
  String get testFrameAnalysis => '🧪 帧分析测试';

  @override
  String get retake => '重拍';

  @override
  String get done => '完成';

  @override
  String get plrVideoModeTitle => 'PLR视频模式';

  @override
  String get plrAssessmentTitle => 'PLR（瞳孔对光反射）评估';

  @override
  String get plrInstructions =>
      '1. 将眼睛置于引导圆内\\n2. 点击\'开始PLR录制\'\\n3. 保持稳定10秒\\n4. 3秒时发出闪光\\n5. 应用记录瞳孔反应';

  @override
  String get recordingPhases => '录制阶段：';

  @override
  String get baselinePhaseDesc => '初始瞳孔大小';

  @override
  String get flashPhaseDesc => '光刺激';

  @override
  String get constrictionPhaseDesc => '瞳孔缩小';

  @override
  String get recoveryPhaseDesc => '瞳孔恢复';

  @override
  String get normalPlrValues => '正常PLR值：';

  @override
  String get gotIt => '明白了';

  @override
  String get pupilAnalysis => '瞳孔分析';

  @override
  String scansLeft(int count) {
    return '剩余$count次';
  }

  @override
  String get validatingRightEye => '正在验证右眼...';

  @override
  String get validatingLeftEye => '正在验证左眼...';

  @override
  String get analyzingRightEye => '正在分析右眼 (OD)...';

  @override
  String get analyzingLeftEye => '正在分析左眼 (OS)...';

  @override
  String get comparingPupils => '正在比较瞳孔...';

  @override
  String person(String name) {
    return '受检者：$name';
  }

  @override
  String get invalidEyeImage => '无效的眼部图像';

  @override
  String analysisFailed(String error) {
    return '分析失败：$error';
  }

  @override
  String get researchEducationalToolOnly => '仅供研究/教育使用';

  @override
  String get resultsNotMedicalDiagnoses =>
      '本应用仅供研究和教育目的使用。结果不是医学诊断，未经临床使用验证。模式关联来自历史研究文献。如有健康问题，请咨询医疗专业人员。';

  @override
  String get pupilSizeDifference => '检测到瞳孔大小差异';

  @override
  String get significantPupilSizeDiff => '显著瞳孔大小差异';

  @override
  String get diff => '差值';

  @override
  String get researchObservationConsult => '研究性观察 - 请咨询医疗专业人员进行解读';

  @override
  String get ageBasedResearchBaseline => '基于年龄的研究基准值';

  @override
  String group(String group) {
    return '组别：$group';
  }

  @override
  String get researchRange => '研究范围';

  @override
  String get measuredEst => '测量值（估算）';

  @override
  String get pupilForm => '瞳孔形态';

  @override
  String get decentrationPattern => '偏心度模式';

  @override
  String get flattenings => '扁平化';

  @override
  String get protrusions => '突出';

  @override
  String zonesCount(int count) {
    return '$count个区域';
  }

  @override
  String get bilateralComparison => '双眼比较';

  @override
  String get parameter => '参数';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'P/I比值';

  @override
  String get ellipseness => '椭圆度';

  @override
  String get circularity => '圆形度';

  @override
  String get decentralization => '偏心度';

  @override
  String get anwRatio => 'ANW比值';

  @override
  String get normal => '正常';

  @override
  String get elliptical => '椭圆形';

  @override
  String get circular => '圆形';

  @override
  String get irregular => '不规则';

  @override
  String get centered => '居中';

  @override
  String get offset => '偏移';

  @override
  String get miosis => '缩瞳';

  @override
  String get constricted => '收缩';

  @override
  String get dilated => '散大';

  @override
  String get mydriasis => '散瞳';

  @override
  String get inner => '内侧';

  @override
  String get outer => '外侧';

  @override
  String get high => '高';

  @override
  String get moderate => '中等';

  @override
  String get savePdf => '保存PDF';

  @override
  String get sharePdf => '分享PDF';

  @override
  String get retakePhotos => '重新拍摄';

  @override
  String scansLeftBanner(int count) {
    return '剩余$count次扫描';
  }

  @override
  String get upgrade => '升级';

  @override
  String get unlockUnlimited => '解锁无限制';

  @override
  String get usedAllFreeScans => '您已用完所有免费扫描次数。';

  @override
  String get unlimitedScans => '无限次扫描';

  @override
  String get pdfReports => 'PDF报告';

  @override
  String get scanHistoryFeature => '扫描历史';

  @override
  String get bilateralAnalysis => '双眼分析';

  @override
  String get monthly => '月付';

  @override
  String get perMonth => '/月';

  @override
  String get annual => '年付';

  @override
  String get perYear => '/年';

  @override
  String get tenCredits => '10次点数';

  @override
  String get oneTime => '一次性';

  @override
  String get best => '最优';

  @override
  String get purchaseCancelled => '购买已取消';

  @override
  String purchaseFailed(String error) {
    return '购买失败：$error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT已保存：$path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON已保存：$path';
  }

  @override
  String get pdfSaved => 'PDF已保存！';

  @override
  String pdfFailed(String error) {
    return 'PDF失败：$error';
  }

  @override
  String get open => '打开';

  @override
  String failed(String error) {
    return '失败：$error';
  }

  @override
  String get staticScans => '静态';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => '按姓名或主诉搜索...';

  @override
  String get searchPlrRecords => '搜索PLR记录...';

  @override
  String get noScansYet => '暂无扫描记录';

  @override
  String get completedScansAppearHere => '已完成的扫描将显示在此处';

  @override
  String get deleteScan => '删除扫描？';

  @override
  String deleteScanConfirm(String name, String date) {
    return '删除$name于$date的扫描记录？';
  }

  @override
  String get scanDeleted => '扫描已删除';

  @override
  String get originalImagesNotFound => '未找到原始眼部图像。';

  @override
  String get viewResults => '查看结果';

  @override
  String get avgPlr => '平均PLR';

  @override
  String get years => '岁';

  @override
  String get anisocoria => '瞳孔不等大';

  @override
  String get none => '无';

  @override
  String get mild => '轻度';

  @override
  String get severe => '重度';

  @override
  String zoneLabel(String zone) {
    return '区域：$zone';
  }

  @override
  String associatedWith(String organ) {
    return '与$organ相关';
  }

  @override
  String get significant => '显著';

  @override
  String get fair => '一般';

  @override
  String get low => '低';

  @override
  String get good => '良好';

  @override
  String get zones => '区域';

  @override
  String get significanceWithinLimits => '在可接受范围内';

  @override
  String get significanceMild => '轻度';

  @override
  String get significanceModerate => '中度';

  @override
  String get significanceSignificant => '显著';

  @override
  String get formTypeCircle => '圆形（正常）';

  @override
  String get formTypeOval => '椭圆形';

  @override
  String get formTypeOvalVertical => '垂直椭圆形';

  @override
  String get formTypeOvalHorizontal => '水平椭圆形';

  @override
  String get formTypeOvalDiagonal => '斜向椭圆形';

  @override
  String get formTypeLeftObliqueEllipse => '左斜椭圆';

  @override
  String get formTypeUnilateralEllipse => '单侧椭圆';

  @override
  String get formTypeVentralDivergingEllipse => '腹侧发散椭圆';

  @override
  String get formTypeFrontalDivergingEllipse => '额侧发散椭圆';

  @override
  String get formTypeEllipse => '椭圆';

  @override
  String get formTypeChord => '弦形';

  @override
  String get formTypeIrregular => '不规则';

  @override
  String get pupilFormCircleDesc => '正常圆形瞳孔形态。未检测到形态变异。';

  @override
  String get pupilFormOvalHorizontalDesc =>
      '水平椭圆形模式。历史研究将此与影响呼吸和腺体功能区域的自主神经系统模式相关联。';

  @override
  String get pupilFormOvalVerticalDesc =>
      '垂直椭圆形模式。历史研究将此模式与自主神经反射研究中的脑循环区域相关联。';

  @override
  String get pupilFormOvalDiagonalDesc => '斜向椭圆形模式。研究文献将此与自主神经研究中的泌尿生殖区域反射相关联。';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      '左斜椭圆形模式。历史观察将此与泌尿生殖和下肢自主神经区域相关联。';

  @override
  String get pupilFormUnilateralEllipseDesc => '单侧椭圆形模式。研究表明与呼吸和支气管自主神经区域有关联。';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      '腹侧发散椭圆。历史研究将此与下体自主神经区域和运动功能模式相关联。';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      '额侧发散椭圆。研究文献将此模式与脑部和上部自主神经区域相关联。';

  @override
  String get pupilFormOvalDesc => '轻度椭圆变形模式。请在研究观察中监测其进展。';

  @override
  String get pupilFormEllipseDesc => '历史研究中显示自主神经系统变异的椭圆形瞳孔模式。';

  @override
  String get pupilFormChordDesc => '研究文献中显示局部自主神经影响的弦形变形模式。';

  @override
  String get pupilFormIrregularDesc => '基于历史观察提示多种自主神经模式影响的不规则形态。';

  @override
  String get patternCentered => '居中（正常）';

  @override
  String get patternFrontal => '额侧偏心';

  @override
  String get patternBasal => '基底偏心';

  @override
  String get patternNasal => '鼻侧偏心';

  @override
  String get patternTemporal => '颞侧偏心';

  @override
  String get patternMiddleNasal => '中鼻侧偏心';

  @override
  String get patternMiddleTemporal => '中颞侧偏心';

  @override
  String get patternUpperNasal => '上鼻侧偏心';

  @override
  String get patternUpperTemporal => '上颞侧偏心';

  @override
  String get patternLowerNasal => '下鼻侧偏心';

  @override
  String get patternLowerTemporal => '下颞侧偏心';

  @override
  String get patternUpwards => '偏心 - 向上';

  @override
  String get patternDownwards => '偏心 - 向下';

  @override
  String get patternUpwardsInwards => '偏心 - 上内方';

  @override
  String get patternUpwardsOutwards => '偏心 - 上外方';

  @override
  String get decentrationCenteredDesc => '瞳孔位置在生理限制范围内。';

  @override
  String get decentrationNasalRightDesc => '鼻侧模式（右）。历史研究将此区域与肺部自主神经反射相关联。';

  @override
  String get decentrationNasalLeftDesc => '鼻侧模式（左）。研究文献将此区域与心脏自主神经功能模式相关联。';

  @override
  String get decentrationTemporalDesc => '颞侧模式。历史观察将此区域与肾脏和生殖器官自主神经反射相关联。';

  @override
  String get decentrationFrontalRightDesc => '额侧模式（右）。研究将此区域与认知和脑功能模式相关联。';

  @override
  String get decentrationFrontalLeftDesc => '额侧模式（左）。历史研究将此区域与脑自主神经模式相关联。';

  @override
  String get decentrationBasalRightDesc => '基底模式（右）。研究表明与颅内压反射有关联。';

  @override
  String get decentrationBasalLeftDesc => '基底模式（左）。历史观察将此与脑部炎症区域模式相关联。';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      '上鼻侧模式（右）。研究将此区域与肝胆自主神经反射相关联。';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      '上鼻侧模式（左）。历史研究将此与脾脏和膈肌区域相关联。';

  @override
  String get decentrationUpwardsOutwardsDesc => '上颞侧模式。研究表明与肾脏和生殖器官自主神经区域有关联。';

  @override
  String get decentrationMiddleNasalRightDesc =>
      '中鼻侧模式（右）。历史观察将此与氧气利用和心脏区域相关联。';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      '中鼻侧模式（左）。研究将此与神经学和心脏自主神经模式相关联。';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      '中颞侧模式（右）。研究将此与心脏自主神经调节区域相关联。';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      '中颞侧模式（左）。历史研究将此与肺部和心脏区域相关联。';

  @override
  String get decentrationUpperNasalRightDesc => '上鼻侧模式（右）。研究表明与认知区域和颈椎反射有关联。';

  @override
  String get decentrationUpperNasalLeftDesc => '上鼻侧模式（左）。历史观察将此与认知模式和颈部区域相关联。';

  @override
  String get decentrationUpperTemporalRightDesc =>
      '上颞侧模式（右）。研究将此区域与脑神经和听觉反射相关联。';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      '上颞侧模式（左）。历史研究将此与神经植物性和语言区域相关联。';

  @override
  String get decentrationLowerNasalDesc => '下鼻侧模式。研究表明与泌尿生殖和腰骶部自主神经区域有关联。';

  @override
  String get decentrationLowerTemporalRightDesc =>
      '下颞侧模式（右）。历史观察将此与代谢和肝脏区域相关联。';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      '下颞侧模式（左）。研究将此与心脏和脾脏自主神经模式相关联。';

  @override
  String get flatteningUpperCentralRightDesc =>
      '与上中央区域相关的模式。历史研究将此与情绪调节和能量自主神经反射相关联。';

  @override
  String get flatteningUpperTemporalRightDesc =>
      '与上颞侧区域相关的模式。研究表明与脑神经和听觉自主神经反射有关联。';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      '与中颞侧区域相关的模式。历史观察将此与呼吸和心脏自主神经模式相关联。';

  @override
  String get flatteningLowerTemporalRightDesc =>
      '与下颞侧区域相关的模式。研究文献将此与肝脏和代谢自主神经区域相关联。';

  @override
  String get flatteningLowerBasalRightDesc =>
      '与下基底区域相关的模式。历史研究将此与肾脏和下肢自主神经反射相关联。';

  @override
  String get flatteningLowerNasalRightDesc =>
      '与下鼻侧区域相关的模式。研究表明与泌尿生殖和骨盆自主神经区域有关联。';

  @override
  String get flatteningMiddleNasalRightDesc =>
      '与中鼻侧区域相关的模式。历史观察将此与氧气利用和呼吸自主神经模式相关联。';

  @override
  String get flatteningUpperNasalRightDesc =>
      '与上鼻侧区域相关的模式。研究文献将此与认知和颈部自主神经反射相关联。';

  @override
  String get flatteningDefaultRightDesc => '基于历史研究，在此区域检测到自主神经系统模式变异。';

  @override
  String get flatteningUpperCentralLeftDesc =>
      '与上中央区域相关的模式。历史研究将此与情绪调节和神经学自主神经模式相关联。';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      '与上颞侧区域相关的模式。研究表明与神经植物性和语言自主神经区域有关联。';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      '与中颞侧区域相关的模式。历史观察将此与肺部和心脏自主神经反射相关联。';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      '与下颞侧区域相关的模式。研究文献将此与心脏和脾脏自主神经模式相关联。';

  @override
  String get flatteningLowerBasalLeftDesc =>
      '与下基底区域相关的模式。历史研究将此与肾脏和排泄自主神经区域相关联。';

  @override
  String get flatteningLowerNasalLeftDesc =>
      '与下鼻侧区域相关的模式。研究表明与泌尿生殖和腰骶部自主神经反射有关联。';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      '与中鼻侧区域相关的模式。历史观察将此与心脏和呼吸自主神经模式相关联。';

  @override
  String get flatteningUpperNasalLeftDesc =>
      '与上鼻侧区域相关的模式。研究文献将此与认知和颈部自主神经区域相关联。';

  @override
  String get flatteningDefaultLeftDesc => '基于历史研究，在此区域检测到自主神经系统模式变异。';

  @override
  String get protrusionUpperCentralRightDesc =>
      '上中央区域突出模式。研究将此与影响脑部区域的交感神经过度激活模式相关联。';

  @override
  String get protrusionUpperTemporalRightDesc =>
      '上颞侧区域突出模式。历史观察将此与脑神经和听觉系统过度激活模式相关联。';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      '中颞侧区域突出模式。研究表明与心脏和呼吸交感神经模式有关联。';

  @override
  String get protrusionLowerTemporalRightDesc =>
      '下颞侧区域突出模式。历史研究将此与肝胆和代谢交感神经区域相关联。';

  @override
  String get protrusionLowerBasalRightDesc =>
      '下基底区域突出模式。研究将此与肾脏和骨盆交感神经过度激活模式相关联。';

  @override
  String get protrusionLowerNasalRightDesc =>
      '下鼻侧区域突出模式。历史观察将此与泌尿生殖交感神经激活区域相关联。';

  @override
  String get protrusionMiddleNasalRightDesc => '中鼻侧区域突出模式。研究表明与胃和胰腺交感神经模式有关联。';

  @override
  String get protrusionUpperNasalRightDesc =>
      '上鼻侧区域突出模式。历史研究将此与认知和视觉交感神经过度激活区域相关联。';

  @override
  String get protrusionDefaultRightDesc => '基于研究观察，在此区域检测到交感神经系统过度激活模式。';

  @override
  String get protrusionUpperCentralLeftDesc =>
      '上中央区域突出模式。研究将此与精神运动和脑部交感神经模式相关联。';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      '上颞侧区域突出模式。历史观察将此与神经植物性交感神经过度激活区域相关联。';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      '中颞侧区域突出模式。研究表明与肺部和心脏交感神经模式有关联。';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      '下颞侧区域突出模式。历史研究将此与脾脏和心脏交感神经激活区域相关联。';

  @override
  String get protrusionLowerBasalLeftDesc =>
      '下基底区域突出模式。研究将此与骨盆和肾脏交感神经过度激活模式相关联。';

  @override
  String get protrusionLowerNasalLeftDesc => '下鼻侧区域突出模式。历史观察将此与腰骶部交感神经激活区域相关联。';

  @override
  String get protrusionMiddleNasalLeftDesc => '中鼻侧区域突出模式。研究表明与焦虑-心脏交感神经模式有关联。';

  @override
  String get protrusionUpperNasalLeftDesc =>
      '上鼻侧区域突出模式。历史研究将此与认知和视觉交感神经过度激活区域相关联。';

  @override
  String get protrusionDefaultLeftDesc => '基于研究观察，在此区域检测到交感神经系统过度激活模式。';

  @override
  String get anisocoriaNone => '瞳孔大小在正常范围内。未检测到显著的瞳孔不等大。';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return '检测到瞳孔不等大：$difference%（$direction）。$description';
  }

  @override
  String get anisocoriaDirectionSD => '左>右';

  @override
  String get anisocoriaDirectionDS => '右>左';

  @override
  String get anisocoriaSeverityNone => '在正常范围内。';

  @override
  String get anisocoriaSeverityMild => '观察到轻度差异。可能属于生理性。';

  @override
  String get anisocoriaSeverityModerate => '中度不对称。已记录为研究性观察。';

  @override
  String get anisocoriaSeveritySevere => '显著不对称。已标记为研究性观察。';

  @override
  String get largerPupilEqual => '相等';

  @override
  String get largerPupilOS => 'OS（左眼）';

  @override
  String get largerPupilOD => 'OD（右眼）';

  @override
  String get decentrationWithinLimits => '在正常范围内。';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName。偏移量：$offset%';
  }

  @override
  String get zoneUpperCentral => '上中央';

  @override
  String get zoneUpperNasal => '上鼻侧';

  @override
  String get zoneMiddleNasal => '中鼻侧';

  @override
  String get zoneLowerNasal => '下鼻侧';

  @override
  String get zoneLowerBasal => '下基底';

  @override
  String get zoneLowerTemporal => '下颞侧';

  @override
  String get zoneMiddleTemporal => '中颞侧';

  @override
  String get zoneUpperTemporal => '上颞侧';

  @override
  String get zoneFrontal => '额侧';

  @override
  String get zoneBasal => '基底';

  @override
  String get zoneUnknown => '未知';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '$zone扁平化（$clockRange）- $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '$zone突出（$clockRange）- $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB虹膜镜模式';

  @override
  String get iriscopeExternal => '虹膜镜 / 外接';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => '使用已连接的USB摄像头或虹膜镜';

  @override
  String get detectedCameras => '已检测到的摄像头';

  @override
  String get externalCamera => '外接摄像头';

  @override
  String cameraIndex(int index) {
    return '摄像头 $index';
  }

  @override
  String get noExternalCameraDetected => '未检测到外接摄像头。\\n请连接USB虹膜镜以启用。';

  @override
  String get refresh => '刷新';

  @override
  String get selectCameraSource => '选择摄像头来源';

  @override
  String camerasDetected(int count) {
    return '已检测到$count个摄像头';
  }

  @override
  String camerasAvailable(int count) {
    return '$count个摄像头可用';
  }

  @override
  String externalCameraIndex(int index) {
    return '外接摄像头 $index';
  }

  @override
  String get qualityGatedRear => '质量门控自动拍摄（后置摄像头）';

  @override
  String get qualityGatedFront => '质量门控自动拍摄（前置摄像头）';

  @override
  String get usbCameraInfo => 'USB摄像头信息';

  @override
  String get connected => '已连接';

  @override
  String get waiting => '等待中...';

  @override
  String get disconnected => '已断开';

  @override
  String get waitingForUsbCamera => '等待USB摄像头';

  @override
  String get connectIriscopePrompt => '通过USB OTG适配器连接虹膜镜。\\n出现提示时请授予权限。';

  @override
  String get usbCameraIssue => 'USB摄像头问题';

  @override
  String get pleaseConnectIriscope => '请连接虹膜镜或USB摄像头。';

  @override
  String get retryConnection => '重试连接';

  @override
  String get troubleshootingTips => '故障排除提示';

  @override
  String get tipUsbOtgAdapter => '确保USB OTG适配器已正确连接';

  @override
  String get tipUsbHostMode => '检查设备是否支持USB主机模式';

  @override
  String get tipReconnectCamera => '尝试断开并重新连接摄像头';

  @override
  String get tipGrantPermissions => '出现提示时授予USB权限';

  @override
  String get tipUnlockDevice => '某些设备可能需要先解锁';

  @override
  String get back => '返回';

  @override
  String get switchEye => '切换眼睛';

  @override
  String get state => '状态';

  @override
  String get status => '状态';

  @override
  String get usingFlutterUvcPlugin => '使用flutter_uvc_camera插件\\支持USB视频类设备。';

  @override
  String get initialized => '已初始化';

  @override
  String get notReady => '未就绪';

  @override
  String get captureDistanceMatch => '拍摄距离匹配';

  @override
  String get irisSize => '虹膜大小';

  @override
  String get distanceMatched => '距离匹配';

  @override
  String get distanceMismatch => '距离不匹配';

  @override
  String get excellentMatch => '极佳匹配';

  @override
  String get goodMatch => '良好匹配';

  @override
  String get acceptableMatch => '可接受匹配';

  @override
  String get considerRetaking => '距离不匹配 - 建议重拍';

  @override
  String get qualityReady => '就绪！保持稳定...';

  @override
  String get qualityTooBlurry => '保持摄像头稳定';

  @override
  String get qualityTooDark => '需要更多光线';

  @override
  String get qualityTooBright => '太亮 - 减少光线';

  @override
  String get qualityNoContrast => '调整光线角度';

  @override
  String get qualityNoPupil => '将瞳孔居中于画面';

  @override
  String get qualityNotCentered => '将眼睛移至中央';

  @override
  String get qualityNotAnEye => '未检测到眼睛';

  @override
  String get qualityProcessing => '处理中...';

  @override
  String get distanceMatchedCheck => '✓ 距离匹配';

  @override
  String get distanceGoodMatchCheck => '✓ 良好匹配';

  @override
  String get distanceSlightlyBack => '稍微后退 ↔';

  @override
  String get distanceSlightlyCloser => '稍微靠近 ↔';

  @override
  String get distanceAlmostThere => '快到了...';

  @override
  String get distanceMoveBack => '后退 ←←';

  @override
  String get distanceMoveCloser => '靠近 →→';

  @override
  String get distanceTooClose => '太近！请后退';

  @override
  String get distanceTooFar => '太远！请靠近';

  @override
  String get distanceStabilizing => '稳定中...';

  @override
  String distanceLabel(int percent) {
    return '距离：$percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => '前置摄像头';

  @override
  String get rearCameraLabel => '后置摄像头';

  @override
  String get startingCamera => '正在启动摄像头...';

  @override
  String get eyeNotDetected => '未检测到眼睛';

  @override
  String get tryAgain => '重试';

  @override
  String get indicatorEye => '眼睛';

  @override
  String get indicatorSharp => '清晰';

  @override
  String get indicatorLight => '光线';

  @override
  String get indicatorFocus => '对焦';

  @override
  String get indicatorPupil => '瞳孔';

  @override
  String get indicatorIris => '虹膜';

  @override
  String get indicatorMatch => '匹配';

  @override
  String get checkImageShape => '图像形状';

  @override
  String get checkCircularIris => '圆形虹膜';

  @override
  String get checkDarkPupil => '暗色瞳孔';

  @override
  String get checkIrisTexture => '虹膜纹理';

  @override
  String get checkPupilIrisStructure => '瞳孔-虹膜结构';

  @override
  String get checkNaturalColors => '自然色彩';

  @override
  String get checkEdgePattern => '边缘模式';

  @override
  String get errorImageShapeIncorrect => '图像形状不正确 - 请确保眼睛充满画面';

  @override
  String get errorNoEyeDetected => '未检测到眼睛 - 请将虹膜居中于画面';

  @override
  String get errorNoPupilDetected => '未检测到瞳孔 - 请确保光线充足';

  @override
  String get errorNoIrisTexture => '无虹膜纹理 - 请靠近眼睛';

  @override
  String get errorUnusualColors => '检测到异常色彩 - 请避免屏幕/反光';

  @override
  String get errorTooManyEdges => '直线边缘过多 - 这可能不是眼睛';

  @override
  String get errorNotValidEye => '不是有效的眼部图像 - 请重试';

  @override
  String get holdStillCapturing => '保持不动 - 拍摄中...';

  @override
  String get adjustDistanceFirst => '请先调整距离';

  @override
  String get stabilizingReading => '稳定中...';

  @override
  String get autoCaptureWhenReady => '就绪后自动拍摄';

  @override
  String get tapOrWaitAutoCapture => '点击或等待自动拍摄';

  @override
  String get validatingImage => '验证中...';

  @override
  String get capturingStatus => '拍摄中...';

  @override
  String get adjustPositionStatus => '调整位置';

  @override
  String get validationTip => '提示：确保光线充足，将摄像头保持在距眼睛10-15厘米处，避免反光';

  @override
  String get validationChecksTitle => '验证检查：';

  @override
  String confidenceLabel(int percent) {
    return '置信度：$percent%';
  }

  @override
  String get incompleteData => '数据不完整';

  @override
  String get irisDiameterLabel => '虹膜 ø';

  @override
  String get plrResponseCurve => 'PLR反应曲线';

  @override
  String get plrLatency => '潜伏期';

  @override
  String get plrVelocity => '速度';

  @override
  String get plrRecoveryTime => '恢复时间';

  @override
  String get plrRecoveryRatio => '恢复率';

  @override
  String get plrEnhancedMetrics => '增强PLR指标';

  @override
  String get plrNormalLatency => '正常：200-500ms';

  @override
  String get plrNormalConstriction => '正常：10-30%';

  @override
  String get plrNormalVelocity => '正常：1.5-4.0%/秒';

  @override
  String get plrReferenceValues => '正常PLR参考值';

  @override
  String get plrSubjectInfo => '受检者信息';

  @override
  String get plrTestType => 'PLR（瞳孔对光反射）';

  @override
  String get plrAnalysisSummary => '分析摘要';

  @override
  String get plrTotalFrames => '分析帧总数';

  @override
  String get plrSuccessRate => '成功率';

  @override
  String get plrMaxConstriction => '最大缩瞳';

  @override
  String get plrResponseCurveLabels => 'PLR反应曲线';

  @override
  String get anwTitle => '自主神经带 (ANW)';

  @override
  String get anwAbnormal => '异常';

  @override
  String get anwDiameter => '直径';

  @override
  String get anwPerimeter => '周长';

  @override
  String get anwAsymmetry => '不对称性';

  @override
  String get anwElevated => '升高';

  @override
  String get anwFormType => '形态类型';

  @override
  String get anwRegular => '规则';

  @override
  String get anwDrawnIn => '内收';

  @override
  String get anwIndented => '缺刻';

  @override
  String get anwLacerated => '裂状';

  @override
  String get anwSpastic => '痉挛性';

  @override
  String get anwAtonic => '弛缓性';

  @override
  String get anwTonicState => '历史张力模式';

  @override
  String get anwParasympathotonic => '副交感神经优势模式';

  @override
  String get anwSympathotonicState => '交感神经优势模式';

  @override
  String get anwShiftDetected => '历史移位模式';

  @override
  String get anwConstrictionDetected => '检测到收缩';

  @override
  String get anwFindings => '所见';

  @override
  String get anwRatioComparison => 'ANW比值';

  @override
  String get bilateralANWComparison => '双眼ANW比较';

  @override
  String get anwSymmetryNormal => 'ANW对称性在正常范围内。';

  @override
  String get anwAsymmetryDetected => '双眼间检测到ANW不对称。';

  @override
  String get functionalFrustration => '交感神经和副交感神经系统相关性中的功能性失衡。';

  @override
  String get anwParasympathotonicDesc =>
      '历史观察将此与阈值敏感性增加、反射活动加速、胃肠分泌/排泄功能增强相关联。';

  @override
  String get anwSympathotonicDesc => '历史观察将此与阈值敏感性降低、反射活动减慢、胃肠分泌/排泄功能减弱相关联。';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Velchover历史研究将此与左心室负荷模式和心脏压力相关联。';

  @override
  String get anwFrontalConstricted => '瞳孔带额侧区域收缩。';

  @override
  String get anwBasalConstricted => '瞳孔带基底区域收缩。';

  @override
  String get anwFrontalBasalConstricted => '瞳孔带额侧和基底区域均收缩。';

  @override
  String get helpTitle => '帮助与用户指南';

  @override
  String get helpTabQuickStart => '快速入门';

  @override
  String get helpTabCnriAnalysis => 'CNRI分析';

  @override
  String get helpTabShortcuts => '快捷键';

  @override
  String get helpTabTroubleshooting => '故障排除';

  @override
  String get helpOnlineDocs => '在线文档';

  @override
  String get helpContactSupport => '联系支持';

  @override
  String get helpGettingStarted => '入门指南';

  @override
  String get helpStep1Title => '连接虹膜镜';

  @override
  String get helpStep1Desc => '连接您的Dino-Lite或兼容的USB虹膜镜。';

  @override
  String get helpStep2Title => '输入患者信息';

  @override
  String get helpStep2Desc => '填写患者姓名、年龄、性别和主诉。';

  @override
  String get helpStep3Title => '拍摄右眼 (OD)';

  @override
  String get helpStep3Desc => '放置虹膜镜并拍摄右眼图像。';

  @override
  String get helpStep4Title => '拍摄左眼 (OS)';

  @override
  String get helpStep4Desc => '在相同光线条件下对左眼重复操作。';

  @override
  String get helpStep5Title => '查看分析';

  @override
  String get helpStep5Desc => '应用分析瞳孔-虹膜比值、瞳孔形态和ANW特征。';

  @override
  String get helpStep6Title => '导出报告';

  @override
  String get helpStep6Desc => '以PDF、TXT或JSON格式保存。';

  @override
  String get helpTipBestResults => '获得最佳结果：使用稳定光线，保持虹膜镜距离2-3厘米。';

  @override
  String get helpCnriProtocolFeatures => 'CNRI协议功能';

  @override
  String get helpFeaturePiRatioTitle => '瞳孔/虹膜比值 (P/I)';

  @override
  String get helpFeaturePiRatioDesc => '正常：20-30%。超出范围可能提示自主神经失衡。';

  @override
  String get helpFeaturePupilFormTitle => '瞳孔形态分析';

  @override
  String get helpFeaturePupilFormDesc => '检测椭圆模式、偏心方向和离心率。';

  @override
  String get helpFeatureAnwTitle => 'ANW（领状带）评估';

  @override
  String get helpFeatureAnwDesc => '分析比值、形态规则性、区段移位和张力状态。';

  @override
  String get helpFeatureZoneTitle => '区域分析';

  @override
  String get helpFeatureZoneDesc => '将扁平化/突出映射到CNRI器官区域。';

  @override
  String get helpFeatureBilateralTitle => '双眼比较';

  @override
  String get helpFeatureBilateralDesc => '比较OD与OS以检测不对称性。';

  @override
  String get helpFeatureMlTitle => 'ONNX CNN比较';

  @override
  String get helpFeatureMlDesc => 'ONNX CNN模型提供辅助测量值供比较。';

  @override
  String get helpKeyboardShortcuts => '键盘快捷键';

  @override
  String get helpCameraControls => '摄像头控制';

  @override
  String get helpShortcutSpace => '拍摄图像';

  @override
  String get helpShortcutCtrlS => '保存PDF报告';

  @override
  String get helpShortcutCtrlO => '打开相册图像';

  @override
  String get helpShortcutCtrlH => '查看扫描历史';

  @override
  String get helpShortcutF11 => '切换全屏';

  @override
  String get helpShortcutEsc => '返回 / 取消';

  @override
  String get helpShortcutScroll => '放大/缩小';

  @override
  String get helpShortcutDoubleClick => '重置缩放';

  @override
  String get helpCommonIssues => '常见问题';

  @override
  String get helpIssueCameraNotDetected => '未检测到摄像头';

  @override
  String get helpIssueCameraSolution1 => '检查USB连接';

  @override
  String get helpIssueCameraSolution2 => '尝试不同的USB端口';

  @override
  String get helpIssueCameraSolution3 => '安装Dino-Lite驱动';

  @override
  String get helpIssueCameraSolution4 => '重启应用程序';

  @override
  String get helpIssuePupilDetectionFails => '瞳孔检测失败';

  @override
  String get helpIssuePupilSolution1 => '确保光线充足';

  @override
  String get helpIssuePupilSolution2 => '将瞳孔居中于画面';

  @override
  String get helpIssuePupilSolution3 => '清洁虹膜镜镜头';

  @override
  String get helpIssuePupilSolution4 => '手动调整对焦';

  @override
  String get helpIssuePdfExportFails => 'PDF导出失败';

  @override
  String get helpIssuePdfSolution1 => '检查文件夹权限';

  @override
  String get helpIssuePdfSolution2 => '确保磁盘空间充足';

  @override
  String get helpIssuePdfSolution3 => '关闭已打开的PDF文件';

  @override
  String get helpIssuePdfSolution4 => '先尝试TXT导出';

  @override
  String get helpCaptureChecklistTitle => '拍摄核查清单';

  @override
  String get helpCaptureChecklist1 => '确保瞳孔居中且在画面内完全可见。';

  @override
  String get helpCaptureChecklist2 => '使用均匀光线，减少角膜上的眩光或反光。';

  @override
  String get helpCaptureChecklist3 => '左右眼保持相近的虹膜镜距离。';

  @override
  String get helpCaptureChecklist4 => '如瞳孔边缘模糊，请重新对焦或重拍。';

  @override
  String get helpExportSettingsTitle => '导出设置';

  @override
  String get helpExportSettingsDesc =>
      'PDF自动保存可在分析后保存报告，包含图像控制眼部照片是否出现在PDF中，显示ML比较可将ONNX CNN比较值添加到报告中。';

  @override
  String get helpHybridScoreTitle => '综合置信度与等级';

  @override
  String get helpHybridScoreDesc => '显示的置信度和等级结合了经典几何质量与ML一致性，反映测量可靠性而非诊断。';

  @override
  String get helpAnomalyGuideTitle => '读取扁平化与突出';

  @override
  String get helpAnomalyGuideDesc =>
      '扁平化表示瞳孔边界的相对内向变化，突出表示外向变化；每张卡片列出区域、幅度和映射关联。';

  @override
  String get helpZoneOverlayGuideTitle => '区域叠加';

  @override
  String get helpZoneOverlayGuideDesc =>
      '使用区域叠加功能可视化检查区段位置，并交叉核查检测到的异常落在瞳孔和虹膜周围的哪个位置。';

  @override
  String get helpContactSupportTip => '如需帮助，请联系 helpdesk@cnri.edu。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsCameraIriscope => '摄像头 / 虹膜镜';

  @override
  String get settingsPreferredCamera => '首选摄像头：';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB摄像头';

  @override
  String get settingsCameraAutoDetect => '自动检测';

  @override
  String get settingsDefaultZoom => '默认缩放：';

  @override
  String get settingsAnalysis => '分析';

  @override
  String get settingsShowMlComparison => '显示ML比较';

  @override
  String get settingsShowZoneOverlay => '显示区域叠加';

  @override
  String get settingsExportReports => '导出与报告';

  @override
  String get settingsAutoSavePdf => '自动保存PDF';

  @override
  String get settingsIncludeImages => '包含图像';

  @override
  String get settingsSaved => '设置已保存';

  @override
  String get aboutResearchEdition => '研究版';

  @override
  String aboutVersion(String version) {
    return '版本 $version';
  }

  @override
  String get aboutLicense => '许可证';

  @override
  String get aboutLicensedTo => '授权给：';

  @override
  String get aboutExpires => '到期日：';

  @override
  String get aboutManageLicense => '管理许可证';

  @override
  String get aboutBasedOnCnri => '基于CNRI协议';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => '网站';

  @override
  String get aboutPrivacy => '隐私';

  @override
  String get languageSelectTitle => '选择语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get languageChanged => '语言已更改';

  @override
  String languageChangedMessage(String language) {
    return '应用语言已设置为$language';
  }

  @override
  String get languageSystemNotAvailable => '语言系统不可用';

  @override
  String get licenseLoading => '加载中...';

  @override
  String get licenseWelcome => '欢迎使用PupilMetrics！';

  @override
  String get licenseTrialFeatures => '14天免费试用 • 全功能';

  @override
  String get licenseStartTrial => '开始免费试用';

  @override
  String get licenseEnterKey => '输入许可证';

  @override
  String get licenseFreeTrial => '免费试用';

  @override
  String licenseDaysRemaining(int count) {
    return '剩余$count天';
  }

  @override
  String get licenseTrialEnded => '试用已结束';

  @override
  String get licenseEnterToContinue => '请输入许可证以继续';

  @override
  String get licenseStandard => '标准许可证';

  @override
  String get licenseProfessional => '专业许可证';

  @override
  String get licenseEnterprise => '企业许可证';

  @override
  String get licenseLicensed => '已授权';

  @override
  String get licenseActive => '激活';

  @override
  String get licenseTrialUser => '试用用户';

  @override
  String get licenseLifetime => '永久';

  @override
  String get licenseNotSetUp => '未设置';

  @override
  String get trialExpiredTitle => '试用期已结束';

  @override
  String get trialExpiredMessage => '您的14天试用已结束。如需继续分析虹膜图像，请购买许可证。';

  @override
  String get trialExpiredCanStill => '您仍可以：';

  @override
  String get trialExpiredViewAnalyses => '查看之前的分析';

  @override
  String get trialExpiredExportReports => '导出现有报告';

  @override
  String get trialExpiredAccessHistory => '访问扫描历史';

  @override
  String get trialExpiredMaybeLater => '稍后再说';

  @override
  String get licenseRegistration => '许可证注册';

  @override
  String get licenseStatusValid => '已授权';

  @override
  String get licenseStatusTrialActive => '免费试用';

  @override
  String get licenseStatusTrialExpired => '试用已结束';

  @override
  String get licenseStatusExpired => '许可证已过期';

  @override
  String get licenseStatusInvalid => '无效许可证';

  @override
  String get licenseStatusUnregistered => '未设置';

  @override
  String get licenseStatusMachineMismatch => '不同计算机';

  @override
  String get licenseStatusNetworkError => '连接错误';

  @override
  String get licenseEnterKeyTitle => '输入许可证密钥';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => '您的姓名';

  @override
  String get licenseEmailAddress => '电子邮件地址';

  @override
  String get licenseMachineId => '机器ID';

  @override
  String get licenseCopyMachineId => '复制机器ID';

  @override
  String get licenseMachineIdCopied => '机器ID已复制到剪贴板';

  @override
  String get licenseValidationKeyRequired => '请输入您的许可证密钥';

  @override
  String get licenseValidationKeyFormat =>
      '许可证密钥应为20个字符（CNRI-XXXX-XXXX-XXXX-XXXX）';

  @override
  String get licenseValidationNameRequired => '请输入您的姓名';

  @override
  String get licenseValidationEmailRequired => '请输入您的电子邮件';

  @override
  String get licenseValidationEmailInvalid => '请输入有效的电子邮件';

  @override
  String get licenseActivate => '激活许可证';

  @override
  String get licenseContinueTrial => '继续试用';

  @override
  String get licenseBuyLicense => '购买许可证';

  @override
  String get licenseNeedHelp => '需要帮助？';

  @override
  String get licenseLicenseAgreement => '许可协议';

  @override
  String get licenseActivatedSuccess => '许可证激活成功！';

  @override
  String get licenseMsgMachineMismatch => '此许可证已在另一台计算机上注册。请使用原始设备或联系支持。';

  @override
  String get licenseMsgTrialEnded => '您的免费试用已结束。请输入许可证密钥以继续使用所有功能。';

  @override
  String get licenseMsgExpired => '您的许可证已过期。请续期以继续使用。';

  @override
  String get licenseMsgNeedsSetup => '许可证需要设置。请开始免费试用或输入许可证密钥。';

  @override
  String get licenseMsgCheckFormat =>
      '请检查您的许可证密钥格式。应如下所示：CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized => '此许可证密钥未被识别。请再次核实并重试。';

  @override
  String get licenseMsgAlreadyRegistered => '此密钥已在另一台计算机上注册。';

  @override
  String get licenseMsgContactSupport => '此许可证已过期。请联系支持以续期。';

  @override
  String get licenseMsgActivatedThankYou => '许可证激活成功！感谢您的购买。';

  @override
  String get licenseMsgUnableToActivate => '无法激活许可证。请检查网络连接并重试。';

  @override
  String licenseMsgTrialWelcome(int days) {
    return '欢迎！您的$days天免费试用已开始。';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return '试用有效：剩余$days天。';
  }

  @override
  String get licenseMsgFreeTrialActive => '免费试用有效';

  @override
  String licenseMsgLicenseActive(String type) {
    return '许可证有效 - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey => '无法激活此许可证密钥。';

  @override
  String get licenseMsgNoLongerValid => '许可证已失效。';

  @override
  String get licenseMsgUnableToVerify => '无法验证此许可证密钥。请联系支持。';

  @override
  String get trialStartedSnackbar => '试用已开始！';

  @override
  String get trialStartedMessage => '享受14天完整访问权限';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => '主题模式';

  @override
  String get methods => '方法';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => '获焦 / 失焦';

  @override
  String get showHide => '显示 / 隐藏';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => '最大化 / 还原';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => '最小化 / 还原';

  @override
  String get dockUndock => '停靠 / 取消停靠';

  @override
  String get dockLeft => '左侧停靠';

  @override
  String get dockRight => '右侧停靠';

  @override
  String get undock => '取消停靠';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => '重置';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => '透明';

  @override
  String get red => '红色';

  @override
  String get green => '绿色';

  @override
  String get blue => '蓝色';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => '左上';

  @override
  String get topCenter => '上中';

  @override
  String get topRight => '右上';

  @override
  String get centerLeft => '左中';

  @override
  String get centerRight => '右中';

  @override
  String get bottomLeft => '左下';

  @override
  String get bottomCenter => '下中';

  @override
  String get bottomRight => '右下';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => '设置';

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
  String get hidden => '隐藏';

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
  String get defaultIcon => '默认';

  @override
  String get original => '原始';

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
  String get dragToMoveArea => '拖动以移动区域';

  @override
  String get dragToResizeArea => '拖动以调整大小区域';

  @override
  String get dragToResizeAreaExample => '调整大小区域示例';

  @override
  String get closeWindowConfirmation => '确定要关闭此窗口吗？';

  @override
  String get licenseChecking => '正在检查许可证...';

  @override
  String get licenseRequiredTitle => '需要许可证';

  @override
  String get licenseActivateValidMessage => '请激活有效许可证以继续。';

  @override
  String get licenseProIncludes => 'PupilMetrics Pro 包含：';

  @override
  String get licenseFeatureUnlimitedAnalysis => '无限次瞳孔-领状带分析';

  @override
  String get licenseFeaturePdfReports => 'PDF报告生成';

  @override
  String get licenseFeatureBilateralComparison => '双眼比较';

  @override
  String get licenseFeatureAnwAnalysis => 'ANW领状带分析';

  @override
  String get licenseFeatureScanHistory => '扫描历史数据库';

  @override
  String get licenseFeatureUpdates => '1年免费更新';

  @override
  String get licensePurchase => '购买许可证';

  @override
  String get licenseExitApplication => '退出应用程序';

  @override
  String get windowCompactView => '紧凑视图';

  @override
  String get windowExpandedView => '扩展视图';

  @override
  String licenseStatusTrialDaysLeft(int count) {
    return '试用（剩余$count天）';
  }

  @override
  String get licenseNotLicensed => '未授权';

  @override
  String get licenseStatusTitle => '许可证状态';

  @override
  String get unknown => '未知';

  @override
  String get plrReportTitle => 'PLR分析报告';

  @override
  String get plrResearchOnlyTitle => '仅供研究/教育使用';

  @override
  String get plrResearchDisclaimer => '结果不是医学诊断。请咨询医疗专业人员。';

  @override
  String get plrNameLabel => '姓名';

  @override
  String plrAgeYears(int age) {
    return '年龄：$age岁';
  }

  @override
  String get plrTestLabel => '检测';

  @override
  String get plrSummaryTitle => 'PLR摘要';

  @override
  String plrGradeValue(String grade) {
    return '等级 $grade';
  }

  @override
  String get plrStatusLabel => '状态';

  @override
  String get plrDetectedStatus => '已检测到PLR';

  @override
  String get plrWeakNotDetectedStatus => '弱/未检测到';

  @override
  String get plrRecoveryTimeLabel => '恢复时间';

  @override
  String get plrRecoveryRatioLabel => '恢复率';

  @override
  String get plrChartDescription => '瞳孔反应随时间变化的可视化表示';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I范围：$min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return '最小值：$value%';
  }

  @override
  String get plrFrameDataTitle => '帧数据';

  @override
  String get plrTableTime => '时间';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => '阶段';

  @override
  String get plrTableConfidenceShort => '置信';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return '成功：$success | 失败：$fail';
  }

  @override
  String get plrReferenceLatencyLine => '• 潜伏期：200-500ms（初始反应时间）';

  @override
  String get plrReferenceConstrictionLine => '• 缩瞳：较基线减少10-30%';

  @override
  String get plrReferenceVelocityLine => '• 速度：1.5-4.0%/秒';

  @override
  String get plrReferenceRecoveryLine => '• 恢复：5秒内恢复至基线的75%以上';

  @override
  String get plrReferenceRecoveryLineShort => '• 恢复：5秒内恢复至基线75%以上';

  @override
  String plrShareSubject(String eye) {
    return 'PLR分析报告 - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR视频分析报告';

  @override
  String get plrTextDisclaimerTitle => '免责声明：仅供研究/教育使用';

  @override
  String get plrTextDisclaimerBody => '结果不是医学诊断。';

  @override
  String get plrOverallGradeLabel => '综合等级';

  @override
  String get plrEndOfReport => '报告结束';

  @override
  String get zoneOverlay => '区域叠加';

  @override
  String get tipDragImage => '提示：拖动图像以将角膜缘与叠加圆对齐。';

  @override
  String get overlayMetrics => '叠加指标';

  @override
  String get piRatioLabel => 'P/I比值：';

  @override
  String get ellipsenessLabel => '椭圆度：';

  @override
  String get decentralizationLabel => '偏心度：';

  @override
  String get detectedFindings => '检测到的所见';

  @override
  String get anwCollarette => 'ANW / 领状带';

  @override
  String get observerNotes => '观察者备注';

  @override
  String get observerNotesHint => '输入临床观察、区域所见、模式...';

  @override
  String get autoCenter => '自动居中';

  @override
  String get anwRing => 'ANW环';

  @override
  String get axisGrid => '轴/网格';

  @override
  String get chart => '图表';

  @override
  String get hoverToIdentify => '悬停或点击区域以识别';

  @override
  String get organsMode => '器官模式 — 悬停于虹膜上以识别区域';

  @override
  String get mildSizeDiff => '轻度大小差异。可能属于生理性变异。';

  @override
  String withinBaseline(Object age, Object group) {
    return '在年龄$age（$group）的研究基准值范围内';
  }

  @override
  String get formLabel => '形态：';

  @override
  String get flatteningLabel => '扁平化：';

  @override
  String get protrusionLabel => '突出：';

  @override
  String get decentrationLabel => '偏心度：';

  @override
  String get pupilSizeLabel => '瞳孔大小：';

  @override
  String get anwRatioLabel => 'ANW比值：';

  @override
  String get anwToneLabel => 'ANW张力：';

  @override
  String get noMajorODAnomalies => 'OD瞳孔无主要异常。';

  @override
  String get noMajorOSAnomalies => 'OS瞳孔无主要异常。';

  @override
  String get anwNotAssessed => 'ANW：未评估';

  @override
  String get manualAlignmentAid => '仅供审阅的手动对齐辅助（拍摄后）。拖动图像或使用自动居中。';

  @override
  String get frontalShift => 'S：额侧移位模式。';

  @override
  String get cerebralCirculation => 'Velchover历史研究将此与脑循环模式相关联。';

  @override
  String get middleTemporalShift => 'D：中颞侧移位模式。';

  @override
  String get respiratoryCardiac => 'Velchover历史研究将此与呼吸和心脏自主神经模式相关联。';

  @override
  String get findings => '所见：';

  @override
  String get analysisReportTitle => '瞳孔分析报告';

  @override
  String get reportResearchVersion => '研究版';

  @override
  String get reportDisclaimerTitle => '免责声明：仅供研究/教育使用';

  @override
  String get reportDisclaimerBody => '结果为研究性观察，非医学诊断。';

  @override
  String get reportPersonInformationTitle => '受检者信息';

  @override
  String get reportAgeGroupLabel => '年龄组';

  @override
  String get reportPupilSizeComparisonTitle => '瞳孔大小比较';

  @override
  String get reportCaptureDistanceMetricsTitle => '拍摄距离指标';

  @override
  String get reportResearchObservationsTitle => '研究所见';

  @override
  String get reportObserverNotesZoneOverlayTitle => '观察者备注（区域叠加）';

  @override
  String get reportEndOfReport => '报告结束';

  @override
  String get reportGradeLabel => '等级';

  @override
  String get reportPupilFormTitle => '瞳孔形态';

  @override
  String get reportDecentrationTitle => '偏心度';

  @override
  String get reportFlatteningsTitle => '扁平化';

  @override
  String get reportProtrusionsTitle => '突出';

  @override
  String get reportAnwParametersTitle => '自主神经带（ANW）';

  @override
  String get reportTonicStateLabel => '历史张力模式';

  @override
  String get reportShiftDetectedTitle => '历史移位模式';

  @override
  String get reportClinicalLabel => '历史注记';

  @override
  String get reportConstrictionDetectedTitle => '检测到收缩';

  @override
  String get reportSeverityLabel => '严重程度';

  @override
  String get reportReferenceValuesTitle => '参考值（CNRI研究协议）';

  @override
  String get reportMatchLabel => '匹配';

  @override
  String get reportValueLabel => '值';

  @override
  String get reportNormalPupilForm => '正常瞳孔形态';

  @override
  String reportPageXofY(int page, int total) {
    return '第$page页 共$total页';
  }

  @override
  String reportShareSubject(String patientName) {
    return '瞳孔分析报告 - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return '附件为$patientName的瞳孔分析报告，生成于$date。';
  }

  @override
  String belowBaseline(int age, String group) {
    return '低于年龄$age（$group）的研究基准值';
  }

  @override
  String aboveBaseline(int age, String group) {
    return '高于年龄$age（$group）的研究基准值';
  }

  @override
  String get ageGroupInfant => '婴儿';

  @override
  String get ageGroupChild15 => '幼儿（1-5岁）';

  @override
  String get ageGroupChild611 => '儿童（6-11岁）';

  @override
  String get ageGroupTeen => '青少年';

  @override
  String get ageGroupAdult2039 => '成人（20-39岁）';

  @override
  String get ageGroupAdult4059 => '成人（40-59岁）';

  @override
  String get ageGroupSenior60Plus => '老年人（60岁以上）';

  @override
  String get middleNasalShift => '中鼻侧移位模式。';

  @override
  String get upperTemporalShift => '上颞侧移位模式。';

  @override
  String get lowerTemporalShift => '下颞侧移位模式。';

  @override
  String get basalShift => '基底移位模式。';

  @override
  String get vagusStellateAssociation => 'Velchover历史研究将此与迷走神经或星状神经节功能减退模式相关联。';

  @override
  String get venaCavaInferiorAssociation => 'Velchover历史研究将此与下腔静脉血流动力学障碍模式相关联。';

  @override
  String get vertebralArteryAssociation => 'Velchover历史研究将此与椎动脉循环模式相关联。';

  @override
  String get smallPelvisAssociation => 'Velchover历史研究将此与小骨盆充血模式相关联。';

  @override
  String get openZoneOverlay => '打开区域叠加';

  @override
  String get iris => '虹膜';

  @override
  String get chartOpacity => '图表不透明度';

  @override
  String get irisSizeNotAvailable => '虹膜大小数据不可用';

  @override
  String get ratio => '比值';

  @override
  String get reportRefPiRatio => '瞳孔/虹膜比值：正常20-30%';

  @override
  String get reportRefEllipseness => '椭圆度：正常>95%';

  @override
  String get reportRefDecentralization => '偏心度：正常<5%';

  @override
  String get reportRefPupilSizeDiff => '瞳孔大小差：<2%正常，2-4%轻度，>4%显著';

  @override
  String get enterPatientInfoAnalysis => '输入患者信息 → 分析';

  @override
  String get chooseCaptureMethod => '选择拍摄方式：';

  @override
  String get usbCamera => 'USB摄像头';

  @override
  String get selectExistingImage => '选择现有图像';

  @override
  String get detectingCameras => '正在检测摄像头...';

  @override
  String get retryDetection => '重试检测';

  @override
  String get connectUvcCameraViaUsb => '通过USB连接UVC摄像头';

  @override
  String get ensureCameraDriversInstalled => '确保已安装摄像头驱动';

  @override
  String get tapRefreshToDetect => '点击刷新以检测摄像头';

  @override
  String get connectUsbCameraToBegin => '连接USB摄像头以开始';

  @override
  String get noExternalCameraTitle => '未检测到外接摄像头';

  @override
  String get connectUsbIriscopeEnsurePlugged => '请连接USB虹膜镜并确保已插入';

  @override
  String get languagesAvailable => '可用语言';

  @override
  String get validationChecks => '验证检查：';

  @override
  String get eyeQualityTip => '提示：确保光线充足并保持眼睛稳定';

  @override
  String get validatingEye => '正在验证眼睛...';

  @override
  String get initializing => '初始化中...';

  @override
  String get nameLabel => '姓名：';

  @override
  String get ageLabel => '年龄：';

  @override
  String get typeLabel => '类型：';

  @override
  String get pleaseEnterName => '请输入姓名';

  @override
  String get pleaseEnterAge => '请输入年龄';

  @override
  String get ageMustBe2Digits => '年龄必须为1或2位数字';

  @override
  String get optional => '（可选）';

  @override
  String get bilateralBothHands => '双手均用';

  @override
  String get zoom => '缩放';

  @override
  String get zoomSliderTip => '录制前请使用右侧缩放滑块调整放大倍率。';

  @override
  String get aboutProgramDeveloper => '程序开发者 - Bryan K. Marcia, Ph.D.';

  @override
  String get chartSizeTooltip => '图表大小';

  @override
  String get chartOpacityAdvancedTooltip => '图表不透明度（0 = 仅悬停 / 器官模式）';

  @override
  String get anwLabel => 'ANW';

  @override
  String get doneAndGoBack => '完成并返回';

  @override
  String get errorImageShape => '图像形状不正确 - 请确保眼睛充满画面';

  @override
  String get cameraConnected => '摄像头已连接';

  @override
  String get cameraDisconnected => '摄像头已断开';

  @override
  String get cameraPermissionDenied => '摄像头权限被拒绝';

  @override
  String get cameraFailedInit => '摄像头初始化失败';

  @override
  String get cameraInUse => '摄像头正被其他应用使用';

  @override
  String get cameraFormatNotSupported => '不支持的摄像头格式';

  @override
  String get capturedImageNotFound => '未找到拍摄的图像文件';

  @override
  String get failedToCaptureImage => '图像拍摄失败';

  @override
  String get gradeA => 'A';

  @override
  String get gradeB => 'B';

  @override
  String get gradeC => 'C';

  @override
  String get gradeD => 'D';

  @override
  String get cameraErrorOccurred => '发生摄像头错误';

  @override
  String get connectingToUsbIriscope => '正在连接USB虹膜镜...';

  @override
  String get noCamerasDetectedMessage => '未检测到摄像头。请确保USB摄像头已连接并被系统识别。';

  @override
  String get failedToAccessCameras => '访问摄像头失败';

  @override
  String get notAnEyeImageTitle => '不是眼睛图像';

  @override
  String get notAnEyeImageBody => '所选图像似乎不是眼睛。\n\n请选择清晰的虹膜/瞳孔照片，然后重试。';

  @override
  String get notAnEyeImageBodyCapture =>
      '拍摄的图像似乎不是眼睛。\n\n请将虹膜镜直接放在眼睛上方，然后重新拍摄。';

  @override
  String get anisocoriaObservationSymmetrical => '对称';

  @override
  String get anisocoriaObservationSlight => '轻微差异';

  @override
  String get anisocoriaObservationModerate => '中度差异';

  @override
  String get anisocoriaObservationMarked => '明显差异';

  @override
  String get settingsNaturalMedicineSection => '自然医学';

  @override
  String get settingsHerbalToggle => '草药推荐（基于虹膜区域）';

  @override
  String get settingsNutritionToggle => '7色饮食营养（基于虹膜区域）';

  @override
  String get settingsChiropracticToggle => '脊椎指压治疗 / 脊柱评估';

  @override
  String get settingsTcmToggle => '中医传统医学（TCM）';

  @override
  String get therapyHerbalTitle => '草药推荐';

  @override
  String get therapyHerbalSubtitle => '虹膜区域发现 — 按证据强度排序';

  @override
  String therapyHerbalEvidenceCount(int count) {
    return '$count条参考文献';
  }

  @override
  String get therapyHerbalDisclaimer => '草药建议仅供教育目的。使用前请咨询合格的医疗保健专业人员。';

  @override
  String get therapyNutritionTitle => '7色饮食营养';

  @override
  String get therapyNutritionSubtitle => '虹膜区域器官的食物和营养素';

  @override
  String get therapyNutritionFoodsByColor => '按颜色推荐食物';

  @override
  String get therapyNutritionKeyNutrients => '关键营养素';

  @override
  String get therapyNutritionHerbs => '支持性草药和香料';

  @override
  String get therapyNutritionNotes => '营养说明';

  @override
  String get therapyNutritionTonifying => '滋补食物：';

  @override
  String get therapyNutritionAvoid => '减少 / 避免：';

  @override
  String get therapyNutritionDisclaimer =>
      '营养建议基于7色饮食框架，仅供教育目的。在做出饮食改变前请咨询专业人员。';

  @override
  String get therapyChiroTitle => '脊椎指压评估';

  @override
  String get therapyChiroSubtitle => '虹膜区域发现所指示的脊柱节段';

  @override
  String get therapyChiroVertebrae => '椎骨';

  @override
  String get therapyChiroNerveRoots => '神经根';

  @override
  String get therapyChiroInnervated => '被支配结构';

  @override
  String get therapyChiroSubluxation => '可能的半脱位指标';

  @override
  String get therapyChiroMuscles => '常见受影响肌肉';

  @override
  String get therapyChiroAdjusting => '脊椎指压调整方法';

  @override
  String get therapyChiroExercises => '居家运动与拉伸';

  @override
  String get therapyChiroPostural => '姿势说明';

  @override
  String get therapyChiroDisclaimer => '脊椎指压信息仅供教育目的。请向持牌脊椎指压治疗师咨询诊断和治疗。';

  @override
  String get therapyTcmTitle => '中医传统医学';

  @override
  String get therapyTcmSubtitle => '经络 · 脏腑时钟 · 五行';

  @override
  String get therapyTcmMeridianFunctions => '经络功能';

  @override
  String get therapyTcmGoverns => '主管';

  @override
  String get therapyTcmPatterns => '失衡证型';

  @override
  String get therapyTcmSymptoms => '症状';

  @override
  String get therapyTcmFormulas => '经典方剂';

  @override
  String get therapyTcmKeyPoints => '此证型的关键穴位';

  @override
  String get therapyTcmAcupoints => '关键穴位';

  @override
  String get therapyTcmDiet => '中医食疗';

  @override
  String get therapyTcmTonifying => '滋补食物：';

  @override
  String get therapyTcmAvoid => '减少 / 避免：';

  @override
  String get therapyTcmDisclaimer => '中医信息仅供教育目的。请向持牌针灸师或中医师咨询。';

  @override
  String get therapyFindingFlat => 'FLAT';

  @override
  String get therapyFindingProt => 'PROT';

  @override
  String get therapyFindingAnw => 'ANW';

  @override
  String get therapyNoFindings => '未检测到显著虹膜区域发现以生成推荐建议。';

  @override
  String get therapyEyeOD => 'OD';

  @override
  String get therapyEyeOS => 'OS';

  @override
  String get therapySeasonLabel => '季节';

  @override
  String get therapyClimateLabel => '气候';

  @override
  String get therapyEmotionLabel => '情绪';

  @override
  String get therapyTasteLabel => '味道';

  @override
  String get therapyNatureLabel => '性质';

  @override
  String therapyPairedOrgan(String organ) {
    return '配对：$organ';
  }

  @override
  String get bothEyesCapturedTitle => '双眼已拍摄';

  @override
  String get constitutionalType => '体质类型';

  @override
  String get constitutionalTypeOptional => '体质类型（可选）';

  @override
  String get selectConstitutionalType => '选择体质类型…';

  @override
  String get constitutionalTypeNone => '无（未评估）';

  @override
  String get constitutionalIridology => '体质虹膜学';

  @override
  String get constitutionalIrisDescription => '虹膜描述';

  @override
  String get constitutionalPredispositions => '健康倾向';

  @override
  String get constitutionalHomeopathicRemedies => '顺势疗法药物';

  @override
  String get constitutionalTypeBy => '基于约瑟夫·德克博士的体质虹膜学';
}
