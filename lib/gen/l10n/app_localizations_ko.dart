// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'CNRI 아이 캡처';

  @override
  String get analyzeButton => '분석';

  @override
  String get plrModes => 'PLR 모드';

  @override
  String get captureInstructions => '가이드 원 안에 눈을 위치시키세요';

  @override
  String get scanHistory => '스캔 기록';

  @override
  String get selectCameraMode => '카메라 모드 선택';

  @override
  String get loadFromGallery => '갤러리에서 불러오기';

  @override
  String get rightEyePhoto => '오른쪽 눈 사진';

  @override
  String get leftEyePhoto => '왼쪽 눈 사진';

  @override
  String get autoCapture => '자동 촬영';

  @override
  String get autoCaptureDesc => '눈 감지 + 5초 자동 촬영';

  @override
  String get manualCapture => '수동 촬영';

  @override
  String get manualCaptureDesc => '눈 감지 + 수동 촬영 (후면 카메라)';

  @override
  String get selfieMode => '셀피 모드';

  @override
  String get selfieModeDesc => '눈 감지 + 5초 자동 촬영 (전면 카메라)';

  @override
  String get plrVideoRear => 'PLR 동영상 (후면)';

  @override
  String get plrVideoRearDesc => '후면 카메라 • 10초 촬영';

  @override
  String get plrVideoSelfie => 'PLR 동영상 (셀피)';

  @override
  String get plrVideoSelfieDesc => '전면 카메라 • 10초 촬영';

  @override
  String get plrVideoCapture => 'PLR 동영상 촬영';

  @override
  String get frontCamera => '전면 카메라';

  @override
  String get rearCamera => '후면 카메라';

  @override
  String get selectEyeToAssess => '평가할 눈을 선택하세요';

  @override
  String get rightEyeOD => '오른쪽 눈 (OD)';

  @override
  String get leftEyeOS => '왼쪽 눈 (OS)';

  @override
  String get recordPlrRightEye => '오른쪽 눈 PLR 기록';

  @override
  String get recordPlrLeftEye => '왼쪽 눈 PLR 기록';

  @override
  String get loadRightEyeImage => '오른쪽 눈 이미지 불러오기';

  @override
  String get loadLeftEyeImage => '왼쪽 눈 이미지 불러오기';

  @override
  String get bothEyes => '양쪽 눈';

  @override
  String get loadBothEyesDesc => '오른쪽 눈 불러오기 후 왼쪽 눈';

  @override
  String get selectEyeImageFromDevice => '기기에서 눈 이미지를 선택하세요';

  @override
  String get selectRightEyeFirst => '먼저 오른쪽 눈 (OD) 이미지를 선택하세요';

  @override
  String get rightEyeSaved => '오른쪽 눈 저장됨. 이제 왼쪽 눈 (OS) 이미지를 선택하세요';

  @override
  String get cancelledNoRightEye => '취소됨 - 오른쪽 눈이 선택되지 않았습니다';

  @override
  String get cancelledNoLeftEye => '취소됨 - 왼쪽 눈이 선택되지 않았습니다';

  @override
  String errorLoadingImages(String error) {
    return '이미지 불러오기 오류: $error';
  }

  @override
  String get crop43 => '자르기 (4:3)';

  @override
  String get success => '성공';

  @override
  String get imageCroppedSuccess => '이미지가 성공적으로 잘렸습니다!';

  @override
  String get error => '오류';

  @override
  String get cropFailed => '이미지 자르기에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get crop => '자르기';

  @override
  String get cancel => '취소';

  @override
  String get saved => '저장됨! ✅';

  @override
  String get imageSavedToGallery => '이미지가 갤러리에 저장되었습니다';

  @override
  String get exposure => '노출';

  @override
  String get flash => '플래시';

  @override
  String get eye => '눈';

  @override
  String get center => '중앙';

  @override
  String get light => '빛';

  @override
  String get ready => '준비 완료';

  @override
  String get on => '켜짐';

  @override
  String get off => '꺼짐';

  @override
  String get auto => '자동';

  @override
  String get manual => '수동';

  @override
  String get selfie => '셀피';

  @override
  String get pupil => '동공';

  @override
  String get plrHistory => 'PLR 기록';

  @override
  String get searchByName => '이름으로 검색...';

  @override
  String get totalScans => '총 스캔';

  @override
  String get thisWeek => '이번 주';

  @override
  String get patients => '환자';

  @override
  String get detected => '감지됨';

  @override
  String get noPlrRecordsYet => '아직 PLR 기록이 없습니다';

  @override
  String get recordPlrVideoToSeeHistory => 'PLR 동영상을 기록하면 여기에 기록이 표시됩니다';

  @override
  String get deleteRecord => '기록을 삭제하시겠습니까?';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return '$name ($eye)의 PLR 분석을 삭제하시겠습니까?\n\n이 작업은 취소할 수 없습니다.';
  }

  @override
  String get delete => '삭제';

  @override
  String get recordDeleted => '기록이 삭제되었습니다';

  @override
  String plrAnalysis(String eye) {
    return 'PLR 분석 - $eye';
  }

  @override
  String get patient => '환자';

  @override
  String get date => '날짜';

  @override
  String get frames => '프레임';

  @override
  String get baselinePiRatio => '기준 P/I';

  @override
  String get minPiRatio => '최소 P/I';

  @override
  String get plrMagnitude => 'PLR 크기';

  @override
  String get constriction => '수축';

  @override
  String get plrDetected => 'PLR 감지됨';

  @override
  String get confidence => '신뢰도';

  @override
  String get grade => '등급';

  @override
  String get close => '닫기';

  @override
  String get yes => '예';

  @override
  String get no => '아니오';

  @override
  String get na => 'N/A';

  @override
  String get takeLeftEyePhoto => '왼쪽 눈 사진 촬영';

  @override
  String get takeRightEyePhoto => '오른쪽 눈 사진 촬영';

  @override
  String get nowTakingLeftEye => '왼쪽 눈 (OS) 촬영 중';

  @override
  String get startingWithRightEye => '오른쪽 눈 (OD)부터 시작';

  @override
  String get captured => '촬영 완료 ✓';

  @override
  String get useSameDistanceLighting => '정확한 비교를 위해 오른쪽 눈과 같은 거리와 조명을 사용하세요.';

  @override
  String get step1of2 => '1단계 / 2단계';

  @override
  String get step2of2 => '2단계 / 2단계';

  @override
  String get bothEyesCaptured => '양쪽 눈 촬영 완료 ✓';

  @override
  String get continueToLeftEye => '왼쪽 눈으로 계속';

  @override
  String get retakeOD => 'OD 다시 촬영';

  @override
  String get retakeOS => 'OS 다시 촬영';

  @override
  String get retakeRightEye => '오른쪽 눈 다시 촬영';

  @override
  String get analyzeBothEyes => '양쪽 눈 분석';

  @override
  String get patientInfoMissing => '환자 정보 없음';

  @override
  String get rightEyePhotoMissing => '오른쪽 눈 사진이 없습니다!';

  @override
  String get patientInfoMissingRestart => '환자 정보가 없습니다. 다시 시작해 주세요.';

  @override
  String get exitApp => '앱 종료';

  @override
  String get tipsForBestResults => '최상의 결과를 위한 팁';

  @override
  String get followGuidelinesForQuality => '최적의 이미지 품질을 위해 다음 가이드라인을 따르세요';

  @override
  String get cameraDistance => '카메라 거리';

  @override
  String get cameraDistanceDesc =>
      '카메라를 눈에서 10~15cm 거리에 유지하세요. 양쪽 눈에 같은 거리를 유지하세요.';

  @override
  String get lightingPosition => '조명 위치';

  @override
  String get lightingPositionDesc =>
      '광원을 동공 경계 안쪽 또는 바깥쪽에 위치시키세요. 카메라 플래시를 바라보세요.';

  @override
  String get avoidReflections => '반사 피하기';

  @override
  String get avoidReflectionsDesc => '창문 빛, 거울, 직접 조명을 피하여 반사를 줄이세요.';

  @override
  String get centerYourEye => '눈 중앙 정렬';

  @override
  String get centerYourEyeDesc => '공막(흰자)을 포함한 전체 눈이 중앙에 위치하고 프레임을 채우도록 하세요.';

  @override
  String get cropProperly => '적절히 자르기';

  @override
  String get cropProperlyDesc => '눈을 중앙에 두고 이미지를 자르세요. 이미지는 4:3 비율로 자동 저장됩니다.';

  @override
  String get importantInformation => '중요 정보';

  @override
  String get imageRatio43 => '의료 영상 표준 4:3 이미지 비율';

  @override
  String get forClinicalUseCnri => 'CNRI (cnri.edu) 임상 사용용';

  @override
  String get noMedicalDiagnosis => '의료 진단을 제공하지 않습니다';

  @override
  String get eyeWideOpenClear => '눈을 크게 뜨고 사진이 선명한지 확인하세요';

  @override
  String get personalInfo => '개인 정보';

  @override
  String get personInformation => '대상자 정보';

  @override
  String get enterPersonDetails => '대상자 세부 정보 입력';

  @override
  String get infoIncludedInReport => '이 정보는 분석 보고서에 포함됩니다';

  @override
  String get fullName => '성명';

  @override
  String get enterPersonName => '이름을 입력하세요';

  @override
  String get nameRequired => '이름은 필수입니다';

  @override
  String get sex => '성별';

  @override
  String get male => '남성';

  @override
  String get female => '여성';

  @override
  String get ageYears => '나이 (세)';

  @override
  String get enterAge => '나이를 입력하세요';

  @override
  String get ageRequired => '나이는 필수입니다';

  @override
  String get enterValidNumber => '유효한 숫자를 입력하세요';

  @override
  String get enterValidAge => '유효한 나이를 입력하세요 (0-120)';

  @override
  String get mainComplaints => '주요 증상';

  @override
  String get mainComplaintsOptional => '주요 증상 (선택사항)';

  @override
  String get complaintsHint => '예: 두통, 시력 문제, 피로...';

  @override
  String get continueToCaptire => '촬영으로 계속';

  @override
  String get ageImportantNote => '정상 범위는 나이에 따라 다르므로 나이는 정확한 동공 크기 평가에 중요합니다.';

  @override
  String get submit => '제출';

  @override
  String get pleaseSelectGender => '성별을 선택해 주세요!';

  @override
  String get applicationSubmitted => '신청이 성공적으로 제출되었습니다.';

  @override
  String get type => '유형:';

  @override
  String get gender => '성별:';

  @override
  String get rightHanded => '오른손잡이';

  @override
  String get leftHanded => '왼손잡이';

  @override
  String get partialLeftHandedness => '부분적 왼손잡이';

  @override
  String get retrainedLeftHandedness => '교정된 왼손잡이';

  @override
  String get bilateralUseBothHands => '양손잡이';

  @override
  String get splashTitle => 'PupilMetrics 아이 캡처';

  @override
  String get splashDeveloper => '프로그램 개발자 - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => '연구/교육 도구';

  @override
  String get startNewAnalysis => '새 분석 시작';

  @override
  String get viewHistory => '기록 보기';

  @override
  String get viewResearchDisclaimer => '연구 면책조항 보기';

  @override
  String get researchDisclaimerTitle => '연구/교육 도구';

  @override
  String get researchDisclaimerNotMedical => '의료 기기가 아닙니다';

  @override
  String get researchDisclaimerNotClinical => '임상 진단용이 아닙니다';

  @override
  String get researchDisclaimerResults => '결과는 연구 관찰입니다';

  @override
  String get researchDisclaimerConsult => '항상 의료 전문가와 상담하세요';

  @override
  String get researchDisclaimerAcknowledge =>
      '계속 진행함으로써 이것이 연구 도구이며 의료 결정에 사용해서는 안 된다는 것을 인정합니다.';

  @override
  String get researchDisclaimerWarning => '이 앱은 연구 및 교육 목적으로만 사용됩니다.';

  @override
  String get iUnderstand => '이해했습니다';

  @override
  String get plrAnalysisTest => 'PLR 분석 테스트';

  @override
  String get checkingVideoFile => '동영상 파일 확인 중...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return '프레임 처리 중 $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => '분석 완료!';

  @override
  String get errorVideoNotFound => '오류: 동영상 파일을 찾을 수 없습니다';

  @override
  String get waitingForResults => '결과 대기 중...';

  @override
  String get baseline => '기준';

  @override
  String get flashPhase => '플래시';

  @override
  String get constrictionPhase => '수축';

  @override
  String get recovery => '회복';

  @override
  String get plrDetectedExclaim => 'PLR 감지됨!';

  @override
  String get plrWeakNotDetected => 'PLR 약함/미감지';

  @override
  String get min => '최소';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => '수축';

  @override
  String get saveToHistory => '기록에 저장';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => '프레임 저장';

  @override
  String get share => '공유';

  @override
  String get frameSavedToGallery => '프레임이 갤러리에 저장되었습니다!';

  @override
  String get failedToSaveFrame => '프레임 저장 실패';

  @override
  String framesSavedToGallery(int count) {
    return '$count개 프레임이 갤러리에 저장되었습니다!';
  }

  @override
  String get jsonCopiedToClipboard => 'JSON이 클립보드에 복사되었습니다!';

  @override
  String get reportCopiedToClipboard => '보고서가 클립보드에 복사되었습니다!';

  @override
  String shareFailedError(String error) {
    return '공유 실패: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return '기록에 저장되었습니다! (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return '저장 실패: $error';
  }

  @override
  String get noSuccessfulFramesToSave => '저장할 성공 프레임이 없습니다';

  @override
  String get saveAllFrames => '모든 프레임 저장';

  @override
  String get shareReport => '보고서 공유';

  @override
  String get shareJson => 'JSON 공유';

  @override
  String get rerunTest => '테스트 다시 실행';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => '카메라 초기화 중...';

  @override
  String usingCamera(String camera) {
    return '$camera 카메라 사용 중';
  }

  @override
  String cameraError(String error) {
    return '카메라 오류: $error';
  }

  @override
  String get noCamerasFound => '카메라를 찾을 수 없습니다';

  @override
  String get retry => '다시 시도';

  @override
  String get startPlrRecording => 'PLR 기록 시작';

  @override
  String get stopRecording => '기록 중지';

  @override
  String get phaseReady => '준비 완료';

  @override
  String get phaseStarting => '시작 중...';

  @override
  String phaseBaseline(int sec) {
    return '기준 (0-$sec초)';
  }

  @override
  String get phaseFlash => '플래시!';

  @override
  String phaseConstriction(int start, int end) {
    return '수축 ($start-$end초)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return '회복 ($start-$end초)';
  }

  @override
  String get phaseComplete => '완료!';

  @override
  String get readyDesc => '원 안에 눈을 위치시키고 시작을 누르세요';

  @override
  String get holdSteady => '흔들리지 않게 유지하세요...';

  @override
  String get recordingBaselinePupil => '기준 동공 크기 기록 중';

  @override
  String lightStimulus(int ms) {
    return '광 자극 (${ms}ms)';
  }

  @override
  String get measuringConstriction => '동공 수축 측정 중';

  @override
  String get measuringRecovery => '동공 회복 측정 중';

  @override
  String get plrRecordingComplete => 'PLR 기록 완료';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return '$eye을 원 안에 위치시키세요.\n$seconds초 기록 동안 흔들리지 않게 유지하세요.';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return '눈을 흔들리지 않게 유지하세요. $sec초에 플래시가 발생합니다.';
  }

  @override
  String get recordingComplete => '기록 완료';

  @override
  String get plrVideoCapturedSuccess => 'PLR 동영상이 성공적으로 촬영되었습니다!';

  @override
  String get duration => '시간';

  @override
  String get seconds => '초';

  @override
  String get frameRate => '프레임 레이트';

  @override
  String get camera => '카메라';

  @override
  String flashAt(int sec, int ms) {
    return '$sec초 시점 (${ms}ms)';
  }

  @override
  String get phases => '단계';

  @override
  String get phasesFlow => '기준 → 플래시 → 수축 → 회복';

  @override
  String get expectedNormalValues => '예상 정상 값:';

  @override
  String get latency => '잠복기';

  @override
  String get velocity => '속도';

  @override
  String get testFrameAnalysis => '🧪 프레임 분석 테스트';

  @override
  String get retake => '다시 촬영';

  @override
  String get done => '완료';

  @override
  String get plrVideoModeTitle => 'PLR 동영상 모드';

  @override
  String get plrAssessmentTitle => '대광반사 (PLR) 평가';

  @override
  String get plrInstructions =>
      '1. 가이드 원 안에 눈을 위치시키세요\n2. \"PLR 기록 시작\"을 누르세요\n3. 10초 동안 흔들리지 않게 유지하세요\n4. 3초에 플래시가 발생합니다\n5. 앱이 동공 반응을 기록합니다';

  @override
  String get recordingPhases => '기록 단계:';

  @override
  String get baselinePhaseDesc => '초기 동공 크기';

  @override
  String get flashPhaseDesc => '광 자극';

  @override
  String get constrictionPhaseDesc => '동공 수축';

  @override
  String get recoveryPhaseDesc => '동공 회복';

  @override
  String get normalPlrValues => '정상 PLR 값:';

  @override
  String get gotIt => '알겠습니다';

  @override
  String get pupilAnalysis => '동공 분석';

  @override
  String scansLeft(int count) {
    return '$count회 남음';
  }

  @override
  String get validatingRightEye => '오른쪽 눈 검증 중...';

  @override
  String get validatingLeftEye => '왼쪽 눈 검증 중...';

  @override
  String get analyzingRightEye => '오른쪽 눈 분석 중 (OD)...';

  @override
  String get analyzingLeftEye => '왼쪽 눈 분석 중 (OS)...';

  @override
  String get comparingPupils => '동공 비교 중...';

  @override
  String person(String name) {
    return '대상자: $name';
  }

  @override
  String get invalidEyeImage => '잘못된 눈 이미지';

  @override
  String analysisFailed(String error) {
    return '분석 실패: $error';
  }

  @override
  String get researchEducationalToolOnly => '연구/교육 목적 전용';

  @override
  String get resultsNotMedicalDiagnoses =>
      '이 앱은 연구 및 교육 목적으로만 사용됩니다. 결과는 의료 진단이 아니며 임상 사용을 위해 검증되지 않았습니다. 패턴 연관성은 역사적 연구 문헌에서 가져온 것입니다. 건강 문제가 있으시면 의료 전문가와 상담하세요.';

  @override
  String get pupilSizeDifference => '동공 크기 차이 감지됨';

  @override
  String get significantPupilSizeDiff => '심각한 동공 크기 차이';

  @override
  String get diff => '차이';

  @override
  String get researchObservationConsult => '연구 관찰 - 해석을 위해 의료 전문가와 상담하세요';

  @override
  String get ageBasedResearchBaseline => '연령 기반 연구 기준';

  @override
  String group(String group) {
    return '그룹: $group';
  }

  @override
  String get researchRange => '연구 범위';

  @override
  String get measuredEst => '측정값 (추정)';

  @override
  String get pupilForm => '동공 형태';

  @override
  String get decentrationPattern => '편심 패턴';

  @override
  String get flattenings => '편평화';

  @override
  String get protrusions => '돌출';

  @override
  String zonesCount(int count) {
    return '$count개 영역';
  }

  @override
  String get bilateralComparison => '양측 비교';

  @override
  String get parameter => '매개변수';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'P/I 비율';

  @override
  String get ellipseness => '타원도';

  @override
  String get circularity => '원형도';

  @override
  String get decentralization => '편심도';

  @override
  String get anwRatio => 'ANW 비율';

  @override
  String get normal => '정상';

  @override
  String get elliptical => '타원형';

  @override
  String get circular => '원형';

  @override
  String get irregular => '불규칙';

  @override
  String get centered => '중앙';

  @override
  String get offset => '편향';

  @override
  String get miosis => '축동';

  @override
  String get constricted => '수축';

  @override
  String get dilated => '확대';

  @override
  String get mydriasis => '산동';

  @override
  String get inner => '내부';

  @override
  String get outer => '외부';

  @override
  String get high => '높음';

  @override
  String get moderate => '보통';

  @override
  String get savePdf => 'PDF 저장';

  @override
  String get sharePdf => 'PDF 공유';

  @override
  String get retakePhotos => '사진 다시 촬영';

  @override
  String scansLeftBanner(int count) {
    return '스캔 $count회 남음';
  }

  @override
  String get upgrade => '업그레이드';

  @override
  String get unlockUnlimited => '무제한 잠금 해제';

  @override
  String get usedAllFreeScans => '무료 스캔을 모두 사용했습니다.';

  @override
  String get unlimitedScans => '무제한 스캔';

  @override
  String get pdfReports => 'PDF 보고서';

  @override
  String get scanHistoryFeature => '스캔 기록';

  @override
  String get bilateralAnalysis => '양측 분석';

  @override
  String get monthly => '월간';

  @override
  String get perMonth => '/월';

  @override
  String get annual => '연간';

  @override
  String get perYear => '/년';

  @override
  String get tenCredits => '10 크레딧';

  @override
  String get oneTime => '1회';

  @override
  String get best => '추천';

  @override
  String get purchaseCancelled => '구매가 취소되었습니다';

  @override
  String purchaseFailed(String error) {
    return '구매 실패: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT 저장됨: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON 저장됨: $path';
  }

  @override
  String get pdfSaved => 'PDF 저장 완료!';

  @override
  String pdfFailed(String error) {
    return 'PDF 실패: $error';
  }

  @override
  String get open => '열기';

  @override
  String failed(String error) {
    return '실패: $error';
  }

  @override
  String get staticScans => '정적';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => '이름 또는 증상으로 검색...';

  @override
  String get searchPlrRecords => 'PLR 기록 검색...';

  @override
  String get noScansYet => '아직 스캔이 없습니다';

  @override
  String get completedScansAppearHere => '완료된 스캔이 여기에 표시됩니다';

  @override
  String get deleteScan => '스캔을 삭제하시겠습니까?';

  @override
  String deleteScanConfirm(String name, String date) {
    return '$date의 $name 스캔을 삭제하시겠습니까?';
  }

  @override
  String get scanDeleted => '스캔이 삭제되었습니다';

  @override
  String get originalImagesNotFound => '원본 눈 이미지를 찾을 수 없습니다.';

  @override
  String get viewResults => '결과 보기';

  @override
  String get avgPlr => '평균 PLR';

  @override
  String get years => '세';

  @override
  String get anisocoria => '동공부동';

  @override
  String get none => '없음';

  @override
  String get mild => '경미';

  @override
  String get severe => '심각';

  @override
  String zoneLabel(String zone) {
    return '영역: $zone';
  }

  @override
  String associatedWith(String organ) {
    return '$organ 관련';
  }

  @override
  String get significant => '중요';

  @override
  String get fair => '보통';

  @override
  String get low => '낮음';

  @override
  String get good => '양호';

  @override
  String get zones => '구역';
}
