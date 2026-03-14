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
  String get anwRatio => '비율';

  @override
  String get normal => '일반';

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

  @override
  String get significanceWithinLimits => '허용 범위 내';

  @override
  String get significanceMild => '경미';

  @override
  String get significanceModerate => '중등도';

  @override
  String get significanceSignificant => '유의미';

  @override
  String get formTypeCircle => '원형 (정상)';

  @override
  String get formTypeOval => '타원형';

  @override
  String get formTypeOvalVertical => '수직 타원형';

  @override
  String get formTypeOvalHorizontal => '수평 타원형';

  @override
  String get formTypeOvalDiagonal => '대각선 타원형';

  @override
  String get formTypeLeftObliqueEllipse => '좌측 경사 타원';

  @override
  String get formTypeUnilateralEllipse => '편측 타원';

  @override
  String get formTypeVentralDivergingEllipse => '복측 발산 타원';

  @override
  String get formTypeFrontalDivergingEllipse => '전두 발산 타원';

  @override
  String get formTypeEllipse => '타원';

  @override
  String get formTypeChord => '현상';

  @override
  String get formTypeIrregular => '불규칙';

  @override
  String get pupilFormCircleDesc => '정상적인 원형 동공 형태. 패턴 변이가 감지되지 않았습니다.';

  @override
  String get pupilFormOvalHorizontalDesc =>
      '수평 타원형 패턴. 역사적 연구에서는 이를 호흡기 및 선 기능 영역에 영향을 미치는 자율신경계 패턴과 연관시켰습니다.';

  @override
  String get pupilFormOvalVerticalDesc =>
      '수직 타원형 패턴. 역사적 연구에서는 이 패턴을 자율신경 반사 연구의 뇌순환 영역과 연관시켰습니다.';

  @override
  String get pupilFormOvalDiagonalDesc =>
      '대각선 타원형 패턴. 연구 문헌에서는 이를 자율신경 연구의 비뇨생식기 영역 반사와 연관시켰습니다.';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      '좌측 경사 타원 패턴. 역사적 관찰에서는 이를 비뇨생식기 및 하지 자율신경 영역과 연관시켰습니다.';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      '편측 타원 패턴. 연구에서는 호흡기 및 기관지 자율신경 영역과의 연관성을 나타냈습니다.';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      '복측 발산 타원. 역사적 연구에서는 이를 하체 자율신경 영역 및 운동 기능 패턴과 연관시켰습니다.';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      '전두 발산 타원. 연구 문헌에서는 이 패턴을 뇌 및 상부 자율신경 영역과 연관시켰습니다.';

  @override
  String get pupilFormOvalDesc => '경미한 타원형 변형 패턴. 연구 관찰에서 진행을 모니터링하십시오.';

  @override
  String get pupilFormEllipseDesc => '역사적 연구에서 자율신경계 변이를 나타내는 타원형 동공 패턴.';

  @override
  String get pupilFormChordDesc => '연구 문헌에서 국소적인 자율신경 영향을 나타내는 현상 변형 패턴.';

  @override
  String get pupilFormIrregularDesc =>
      '역사적 관찰에 기반한 다중 자율신경 패턴 영향을 시사하는 불규칙한 형태.';

  @override
  String get patternCentered => '중심 (정상)';

  @override
  String get patternFrontal => '전두 편심';

  @override
  String get patternBasal => '기저 편심';

  @override
  String get patternNasal => '비측 편심';

  @override
  String get patternTemporal => '측두 편심';

  @override
  String get patternMiddleNasal => '중비측 편심';

  @override
  String get patternMiddleTemporal => '중측두 편심';

  @override
  String get patternUpperNasal => '상비측 편심';

  @override
  String get patternUpperTemporal => '상측두 편심';

  @override
  String get patternLowerNasal => '하비측 편심';

  @override
  String get patternLowerTemporal => '하측두 편심';

  @override
  String get patternUpwards => '편심 - 상방';

  @override
  String get patternDownwards => '편심 - 하방';

  @override
  String get patternUpwardsInwards => '편심 - 상내측';

  @override
  String get patternUpwardsOutwards => '편심 - 상외측';

  @override
  String get decentrationCenteredDesc => '생리학적 한계 내의 정상적인 동공 위치.';

  @override
  String get decentrationNasalRightDesc =>
      '비측 패턴 (우측). 역사적 연구에서는 이 영역을 폐 자율신경 반사와 연관시켰습니다.';

  @override
  String get decentrationNasalLeftDesc =>
      '비측 패턴 (좌측). 연구 문헌에서는 이 영역을 심장 자율신경 기능 패턴과 연관시켰습니다.';

  @override
  String get decentrationTemporalDesc =>
      '측두 패턴. 역사적 관찰에서는 이 영역을 신장 및 생식기 자율신경 반사와 연관시켰습니다.';

  @override
  String get decentrationFrontalRightDesc =>
      '전두 패턴 (우측). 연구에서는 이 영역을 인지 및 뇌 기능 패턴과 연관시켰습니다.';

  @override
  String get decentrationFrontalLeftDesc =>
      '전두 패턴 (좌측). 역사적 연구에서는 이 영역을 뇌 자율신경 패턴과 연관시켰습니다.';

  @override
  String get decentrationBasalRightDesc =>
      '기저 패턴 (우측). 연구에서는 두개내압 반사와의 연관성을 나타냈습니다.';

  @override
  String get decentrationBasalLeftDesc =>
      '기저 패턴 (좌측). 역사적 관찰에서는 이를 뇌 염증 영역 패턴과 연관시켰습니다.';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      '상비측 패턴 (우측). 연구에서는 이 영역을 간담도 자율신경 반사와 연관시켰습니다.';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      '상비측 패턴 (좌측). 역사적 연구에서는 이를 비장 및 횡격막 영역과 연관시켰습니다.';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      '상측두 패턴. 연구에서는 신장 및 생식기 자율신경 영역과의 연관성을 나타냈습니다.';

  @override
  String get decentrationMiddleNasalRightDesc =>
      '중비측 패턴 (우측). 역사적 관찰에서는 이를 산소 이용 및 심장 영역과 연관시켰습니다.';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      '중비측 패턴 (좌측). 연구에서는 이를 신경학적 및 심장 자율신경 패턴과 연관시켰습니다.';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      '중측두 패턴 (우측). 연구에서는 이를 심장 자율신경 조절 영역과 연관시켰습니다.';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      '중측두 패턴 (좌측). 역사적 연구에서는 이를 폐 및 심장 영역과 연관시켰습니다.';

  @override
  String get decentrationUpperNasalRightDesc =>
      '상비측 패턴 (우측). 연구에서는 인지 영역 및 경추 반사와의 연관성을 나타냈습니다.';

  @override
  String get decentrationUpperNasalLeftDesc =>
      '상비측 패턴 (좌측). 역사적 관찰에서는 이를 인지 패턴 및 경부 영역과 연관시켰습니다.';

  @override
  String get decentrationUpperTemporalRightDesc =>
      '상측두 패턴 (우측). 연구에서는 이 영역을 뇌신경 및 청각 반사와 연관시켰습니다.';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      '상측두 패턴 (좌측). 역사적 연구에서는 이를 신경식물성 및 언어 영역과 연관시켰습니다.';

  @override
  String get decentrationLowerNasalDesc =>
      '하비측 패턴. 연구에서는 비뇨생식기 및 요천추 자율신경 영역과의 연관성을 나타냈습니다.';

  @override
  String get decentrationLowerTemporalRightDesc =>
      '하측두 패턴 (우측). 역사적 관찰에서는 이를 대사 및 간 영역과 연관시켰습니다.';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      '하측두 패턴 (좌측). 연구에서는 이를 심장 및 비장 자율신경 패턴과 연관시켰습니다.';

  @override
  String get flatteningUpperCentralRightDesc =>
      '상중앙 영역과 관련된 패턴. 역사적 연구에서는 이를 기분 조절 및 에너지 자율신경 반사와 연관시켰습니다.';

  @override
  String get flatteningUpperTemporalRightDesc =>
      '상측두 영역과 관련된 패턴. 연구에서는 뇌신경 및 청각 자율신경 반사와의 연관성을 나타냈습니다.';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      '중측두 영역과 관련된 패턴. 역사적 관찰에서는 이를 호흡기 및 심장 자율신경 패턴과 연관시켰습니다.';

  @override
  String get flatteningLowerTemporalRightDesc =>
      '하측두 영역과 관련된 패턴. 연구 문헌에서는 이를 간 및 대사 자율신경 영역과 연관시켰습니다.';

  @override
  String get flatteningLowerBasalRightDesc =>
      '하기저 영역과 관련된 패턴. 역사적 연구에서는 이를 신장 및 하지 자율신경 반사와 연관시켰습니다.';

  @override
  String get flatteningLowerNasalRightDesc =>
      '하비측 영역과 관련된 패턴. 연구에서는 비뇨생식기 및 골반 자율신경 영역과의 연관성을 나타냈습니다.';

  @override
  String get flatteningMiddleNasalRightDesc =>
      '중비측 영역과 관련된 패턴. 역사적 관찰에서는 이를 산소 이용 및 호흡기 자율신경 패턴과 연관시켰습니다.';

  @override
  String get flatteningUpperNasalRightDesc =>
      '상비측 영역과 관련된 패턴. 연구 문헌에서는 이를 인지 및 경부 자율신경 반사와 연관시켰습니다.';

  @override
  String get flatteningDefaultRightDesc =>
      '역사적 연구에 기반하여 이 영역에서 자율신경계 패턴 변이가 감지되었습니다.';

  @override
  String get flatteningUpperCentralLeftDesc =>
      '상중앙 영역과 관련된 패턴. 역사적 연구에서는 이를 기분 조절 및 신경학적 자율신경 패턴과 연관시켰습니다.';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      '상측두 영역과 관련된 패턴. 연구에서는 신경식물성 및 언어 자율신경 영역과의 연관성을 나타냈습니다.';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      '중측두 영역과 관련된 패턴. 역사적 관찰에서는 이를 폐 및 심장 자율신경 반사와 연관시켰습니다.';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      '하측두 영역과 관련된 패턴. 연구 문헌에서는 이를 심장 및 비장 자율신경 패턴과 연관시켰습니다.';

  @override
  String get flatteningLowerBasalLeftDesc =>
      '하기저 영역과 관련된 패턴. 역사적 연구에서는 이를 신장 및 배설 자율신경 영역과 연관시켰습니다.';

  @override
  String get flatteningLowerNasalLeftDesc =>
      '하비측 영역과 관련된 패턴. 연구에서는 비뇨생식기 및 요천추 자율신경 반사와의 연관성을 나타냈습니다.';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      '중비측 영역과 관련된 패턴. 역사적 관찰에서는 이를 심장 및 호흡기 자율신경 패턴과 연관시켰습니다.';

  @override
  String get flatteningUpperNasalLeftDesc =>
      '상비측 영역과 관련된 패턴. 연구 문헌에서는 이를 인지 및 경부 자율신경 영역과 연관시켰습니다.';

  @override
  String get flatteningDefaultLeftDesc =>
      '역사적 연구에 기반하여 이 영역에서 자율신경계 패턴 변이가 감지되었습니다.';

  @override
  String get protrusionUpperCentralRightDesc =>
      '상중앙 영역 돌출 패턴. 연구에서는 이를 뇌 영역에 영향을 미치는 교감신경 과활성화 패턴과 연관시켰습니다.';

  @override
  String get protrusionUpperTemporalRightDesc =>
      '상측두 영역 돌출 패턴. 역사적 관찰에서는 이를 뇌신경 및 청각 시스템 과활성 패턴과 연관시켰습니다.';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      '중측두 영역 돌출 패턴. 연구에서는 심장 및 호흡기 교감신경 패턴과의 연관성을 나타냈습니다.';

  @override
  String get protrusionLowerTemporalRightDesc =>
      '하측두 영역 돌출 패턴. 역사적 연구에서는 이를 간담도 및 대사 교감신경 영역과 연관시켰습니다.';

  @override
  String get protrusionLowerBasalRightDesc =>
      '하기저 영역 돌출 패턴. 연구에서는 이를 신장 및 골반 교감신경 과활성 패턴과 연관시켰습니다.';

  @override
  String get protrusionLowerNasalRightDesc =>
      '하비측 영역 돌출 패턴. 역사적 관찰에서는 이를 비뇨생식기 교감신경 활성화 영역과 연관시켰습니다.';

  @override
  String get protrusionMiddleNasalRightDesc =>
      '중비측 영역 돌출 패턴. 연구에서는 위 및 췌장 교감신경 패턴과의 연관성을 나타냈습니다.';

  @override
  String get protrusionUpperNasalRightDesc =>
      '상비측 영역 돌출 패턴. 역사적 연구에서는 이를 인지 및 시각 교감신경 과활성화 영역과 연관시켰습니다.';

  @override
  String get protrusionDefaultRightDesc =>
      '연구 관찰에 기반하여 이 영역에서 교감신경계 과활성 패턴이 감지되었습니다.';

  @override
  String get protrusionUpperCentralLeftDesc =>
      '상중앙 영역 돌출 패턴. 연구에서는 이를 정신운동 및 뇌 교감신경 패턴과 연관시켰습니다.';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      '상측두 영역 돌출 패턴. 역사적 관찰에서는 이를 신경식물성 교감신경 과활성 영역과 연관시켰습니다.';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      '중측두 영역 돌출 패턴. 연구에서는 폐 및 심장 교감신경 패턴과의 연관성을 나타냈습니다.';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      '하측두 영역 돌출 패턴. 역사적 연구에서는 이를 비장 및 심장 교감신경 활성화 영역과 연관시켰습니다.';

  @override
  String get protrusionLowerBasalLeftDesc =>
      '하기저 영역 돌출 패턴. 연구에서는 이를 골반 및 신장 교감신경 과활성 패턴과 연관시켰습니다.';

  @override
  String get protrusionLowerNasalLeftDesc =>
      '하비측 영역 돌출 패턴. 역사적 관찰에서는 이를 요천추 교감신경 활성화 영역과 연관시켰습니다.';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      '중비측 영역 돌출 패턴. 연구에서는 불안-심장 교감신경 패턴과의 연관성을 나타냈습니다.';

  @override
  String get protrusionUpperNasalLeftDesc =>
      '상비측 영역 돌출 패턴. 역사적 연구에서는 이를 인지 및 시각 교감신경 과활성화 영역과 연관시켰습니다.';

  @override
  String get protrusionDefaultLeftDesc =>
      '연구 관찰에 기반하여 이 영역에서 교감신경계 과활성 패턴이 감지되었습니다.';

  @override
  String get anisocoriaNone => '동공 크기가 정상 범위 내입니다. 유의미한 동공부동이 감지되지 않았습니다.';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return '동공부동이 감지되었습니다: $difference% ($direction). $description';
  }

  @override
  String get anisocoriaDirectionSD => '좌>우';

  @override
  String get anisocoriaDirectionDS => '우>좌';

  @override
  String get anisocoriaSeverityNone => '정상 범위 내.';

  @override
  String get anisocoriaSeverityMild => '경미한 차이가 관찰되었습니다. 생리학적일 수 있습니다.';

  @override
  String get anisocoriaSeverityModerate => '중등도 비대칭. 연구 관찰로 기록됨.';

  @override
  String get anisocoriaSeveritySevere => '유의미한 비대칭. 연구 관찰로 표시됨.';

  @override
  String get largerPupilEqual => '동일';

  @override
  String get largerPupilOS => 'OS (좌)';

  @override
  String get largerPupilOD => 'OD (우)';

  @override
  String get decentrationWithinLimits => '정상 범위 내.';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName. 오프셋: $offset%';
  }

  @override
  String get zoneUpperCentral => '상중앙';

  @override
  String get zoneUpperNasal => '상비측';

  @override
  String get zoneMiddleNasal => '중비측';

  @override
  String get zoneLowerNasal => '하비측';

  @override
  String get zoneLowerBasal => '하기저';

  @override
  String get zoneLowerTemporal => '하측두';

  @override
  String get zoneMiddleTemporal => '중측두';

  @override
  String get zoneUpperTemporal => '상측두';

  @override
  String get zoneFrontal => '전두';

  @override
  String get zoneBasal => '기저';

  @override
  String get zoneUnknown => '알 수 없음';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '평탄화 $zone ($clockRange) - $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '돌출 $zone ($clockRange) - $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB 홍채경 모드';

  @override
  String get iriscopeExternal => '홍채경 / 외부';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => '연결된 USB 카메라 또는 홍채경 사용';

  @override
  String get detectedCameras => '감지된 카메라';

  @override
  String get externalCamera => '외부 카메라';

  @override
  String cameraIndex(int index) {
    return '카메라 $index';
  }

  @override
  String get noExternalCameraDetected => '외부 카메라가 감지되지 않았습니다.\nUSB 홍채경을 연결하세요.';

  @override
  String get refresh => '새로고침';

  @override
  String get selectCameraSource => '카메라 소스 선택';

  @override
  String camerasDetected(int count) {
    return '$count개 카메라 감지됨';
  }

  @override
  String camerasAvailable(int count) {
    return '$count개 카메라 사용 가능';
  }

  @override
  String externalCameraIndex(int index) {
    return '외부 카메라 $index';
  }

  @override
  String get qualityGatedRear => '품질 제어 자동 캡처 (후면 카메라)';

  @override
  String get qualityGatedFront => '품질 제어 자동 캡처 (전면 카메라)';

  @override
  String get usbCameraInfo => 'USB 카메라 정보';

  @override
  String get connected => '연결됨';

  @override
  String get waiting => '대기 중...';

  @override
  String get disconnected => '연결 해제됨';

  @override
  String get waitingForUsbCamera => 'USB 카메라 대기 중';

  @override
  String get connectIriscopePrompt =>
      'USB OTG 어댑터로 홍채경을 연결하세요.\n메시지가 표시되면 권한을 부여하세요.';

  @override
  String get usbCameraIssue => 'USB 카메라 문제';

  @override
  String get pleaseConnectIriscope => '홍채경 또는 USB 카메라를 연결해 주세요.';

  @override
  String get retryConnection => '연결 재시도';

  @override
  String get troubleshootingTips => '문제 해결 팁';

  @override
  String get tipUsbOtgAdapter => 'USB OTG 어댑터가 올바르게 연결되어 있는지 확인하세요';

  @override
  String get tipUsbHostMode => '기기가 USB 호스트 모드를 지원하는지 확인하세요';

  @override
  String get tipReconnectCamera => '카메라를 분리했다가 다시 연결해 보세요';

  @override
  String get tipGrantPermissions => '메시지가 표시되면 USB 권한을 부여하세요';

  @override
  String get tipUnlockDevice => '일부 기기는 잠금 해제가 필요합니다';

  @override
  String get back => '뒤로';

  @override
  String get switchEye => '눈 전환';

  @override
  String get state => '상태';

  @override
  String get status => '상태';

  @override
  String get usingFlutterUvcPlugin =>
      'flutter_uvc_camera 플러그인을 사용하여\nUSB 비디오 클래스 장치를 지원합니다.';

  @override
  String get initialized => '초기화됨';

  @override
  String get notReady => '준비되지 않음';

  @override
  String get captureDistanceMatch => '촬영 거리 일치';

  @override
  String get irisSize => '홍채 크기';

  @override
  String get distanceMatched => '거리 일치';

  @override
  String get distanceMismatch => '거리 불일치';

  @override
  String get excellentMatch => '우수한 일치';

  @override
  String get goodMatch => '좋은 일치';

  @override
  String get acceptableMatch => '허용 가능한 일치';

  @override
  String get considerRetaking => '거리 불일치 - 재촬영을 고려하세요';

  @override
  String get qualityReady => '준비 완료! 고정하세요...';

  @override
  String get qualityTooBlurry => '카메라를 고정하세요';

  @override
  String get qualityTooDark => '더 많은 빛이 필요합니다';

  @override
  String get qualityTooBright => '너무 밝음 - 빛을 줄이세요';

  @override
  String get qualityNoContrast => '조명 각도를 조정하세요';

  @override
  String get qualityNoPupil => '동공을 프레임 중앙에 위치';

  @override
  String get qualityNotCentered => '눈을 중앙으로 이동';

  @override
  String get qualityNotAnEye => '눈이 감지되지 않음';

  @override
  String get qualityProcessing => '처리 중...';

  @override
  String get distanceMatchedCheck => '✓ 거리 일치';

  @override
  String get distanceGoodMatchCheck => '✓ 좋은 일치';

  @override
  String get distanceSlightlyBack => '약간 뒤로 ↔';

  @override
  String get distanceSlightlyCloser => '약간 가까이 ↔';

  @override
  String get distanceAlmostThere => '거의 다 됐어요...';

  @override
  String get distanceMoveBack => '뒤로 이동 ←←';

  @override
  String get distanceMoveCloser => '가까이 이동 →→';

  @override
  String get distanceTooClose => '너무 가까움! 뒤로 이동';

  @override
  String get distanceTooFar => '너무 멀음! 가까이 이동';

  @override
  String get distanceStabilizing => '안정화 중...';

  @override
  String distanceLabel(int percent) {
    return '거리: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => '전면 카메라';

  @override
  String get rearCameraLabel => '후면 카메라';

  @override
  String get startingCamera => '카메라 시작 중...';

  @override
  String get eyeNotDetected => '눈 감지 안됨';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get indicatorEye => '눈';

  @override
  String get indicatorSharp => '선명도';

  @override
  String get indicatorLight => '빛';

  @override
  String get indicatorFocus => '초점';

  @override
  String get indicatorPupil => '동공';

  @override
  String get indicatorIris => '홍채';

  @override
  String get indicatorMatch => '일치';

  @override
  String get checkImageShape => '이미지 형태';

  @override
  String get checkCircularIris => '원형 홍채';

  @override
  String get checkDarkPupil => '어두운 동공';

  @override
  String get checkIrisTexture => '홍채 질감';

  @override
  String get checkPupilIrisStructure => '동공-홍채 구조';

  @override
  String get checkNaturalColors => '자연스러운 색상';

  @override
  String get checkEdgePattern => '가장자리 패턴';

  @override
  String get errorImageShapeIncorrect => '이미지 형태 오류 - 눈이 프레임을 채우도록 하세요';

  @override
  String get errorNoEyeDetected => '눈 감지 안됨 - 홍채를 프레임 중앙에 위치';

  @override
  String get errorNoPupilDetected => '동공 감지 안됨 - 적절한 조명을 확보하세요';

  @override
  String get errorNoIrisTexture => '홍채 질감 없음 - 눈에 더 가까이 이동';

  @override
  String get errorUnusualColors => '비정상적인 색상 - 화면/반사를 피하세요';

  @override
  String get errorTooManyEdges => '직선 가장자리가 너무 많음 - 눈이 아닐 수 있음';

  @override
  String get errorNotValidEye => '유효하지 않은 눈 이미지 - 다시 시도하세요';

  @override
  String get holdStillCapturing => '움직이지 마세요 - 촬영 중...';

  @override
  String get adjustDistanceFirst => '먼저 거리를 조정하세요';

  @override
  String get stabilizingReading => '안정화 중...';

  @override
  String get autoCaptureWhenReady => '준비 시 자동 촬영';

  @override
  String get tapOrWaitAutoCapture => '탭하거나 자동 촬영 대기';

  @override
  String get validatingImage => '검증 중...';

  @override
  String get capturingStatus => '촬영 중...';

  @override
  String get adjustPositionStatus => '위치 조정';

  @override
  String get validationTip =>
      '팁: 적절한 조명을 확보하고, 카메라를 눈에서 10-15cm 떨어뜨려 들고, 반사를 피하세요';

  @override
  String get validationChecksTitle => '검증 확인:';

  @override
  String confidenceLabel(int percent) {
    return '신뢰도:';
  }

  @override
  String get incompleteData => '불완전한 데이터';

  @override
  String get irisDiameterLabel => '홍채 ø';

  @override
  String get plrResponseCurve => 'PLR 반응 곡선';

  @override
  String get plrLatency => '잠복기';

  @override
  String get plrVelocity => '속도';

  @override
  String get plrRecoveryTime => '회복';

  @override
  String get plrRecoveryRatio => '회복률';

  @override
  String get plrEnhancedMetrics => '확장 PLR 지표';

  @override
  String get plrNormalLatency => '정상: 200-500ms';

  @override
  String get plrNormalConstriction => '정상: 10-30%';

  @override
  String get plrNormalVelocity => '정상: 1.5-4.0%/초';

  @override
  String get plrReferenceValues => '정상 PLR 참조값';

  @override
  String get plrSubjectInfo => '피험자 정보';

  @override
  String get plrTestType => '동공 대광 반사';

  @override
  String get plrAnalysisSummary => '분석 요약';

  @override
  String get plrTotalFrames => '총 분석 프레임';

  @override
  String get plrSuccessRate => '성공률';

  @override
  String get plrMaxConstriction => '최대 수축';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => '자율신경환 (ANW)';

  @override
  String get anwAbnormal => '비정상';

  @override
  String get anwDiameter => '직경';

  @override
  String get anwPerimeter => '둘레';

  @override
  String get anwAsymmetry => '비대칭';

  @override
  String get anwElevated => '상승';

  @override
  String get anwFormType => '형태 유형';

  @override
  String get anwRegular => '정상';

  @override
  String get anwDrawnIn => '수축';

  @override
  String get anwIndented => '들여쓰기';

  @override
  String get anwLacerated => '열상';

  @override
  String get anwSpastic => '경련성';

  @override
  String get anwAtonic => '이완성';

  @override
  String get anwTonicState => '역사적 긴장 패턴';

  @override
  String get anwParasympathotonic => '부교감신경 우세 패턴';

  @override
  String get anwSympathotonicState => '교감신경 우세 패턴';

  @override
  String get anwShiftDetected => '역사적 이동 패턴';

  @override
  String get anwConstrictionDetected => '수축 감지됨';

  @override
  String get anwFindings => '소견';

  @override
  String get anwRatioComparison => 'ANW 비율';

  @override
  String get bilateralANWComparison => '양안 ANW 비교';

  @override
  String get anwSymmetryNormal => 'ANW 대칭성이 정상 범위 내에 있습니다.';

  @override
  String get anwAsymmetryDetected => '양안 간 ANW 비대칭이 감지되었습니다.';

  @override
  String get functionalFrustration => '교감신경계와 부교감신경계 상관관계의 기능적 좌절.';

  @override
  String get anwParasympathotonicDesc =>
      '역사적 관찰에서는 이것을 역치 민감도 증가, 반사 활동 가속, 위장 분비/배출 기능 증가와 연결했습니다.';

  @override
  String get anwSympathotonicDesc =>
      '역사적 관찰에서는 이것을 역치 민감도 감소, 반사 활동 저하, 위장 분비/배출 기능 감소와 연결했습니다.';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Velchover에 따른 역사적 연구에서는 이것을 좌심실 과부하 패턴과 심장 스트레스에 연결했습니다.';

  @override
  String get anwFrontalConstricted => '동공대의 전두 영역이 수축되어 있습니다.';

  @override
  String get anwBasalConstricted => '동공대의 기저 영역이 수축되어 있습니다.';

  @override
  String get anwFrontalBasalConstricted => '동공대의 전두 및 기저 영역이 수축되어 있습니다.';

  @override
  String get helpTitle => '도움말 및 사용자 가이드';

  @override
  String get helpTabQuickStart => '빠른 시작';

  @override
  String get helpTabCnriAnalysis => 'CNRI 분석';

  @override
  String get helpTabShortcuts => '단축키';

  @override
  String get helpTabTroubleshooting => '문제 해결';

  @override
  String get helpOnlineDocs => '온라인 문서';

  @override
  String get helpContactSupport => '지원 연락';

  @override
  String get helpGettingStarted => '시작하기';

  @override
  String get helpStep1Title => '아이리스코프 연결';

  @override
  String get helpStep1Desc => 'Dino-Lite 또는 호환 USB 아이리스코프를 연결하세요.';

  @override
  String get helpStep2Title => '환자 정보 입력';

  @override
  String get helpStep2Desc => '환자 이름, 나이, 성별 및 주요 증상을 입력하세요.';

  @override
  String get helpStep3Title => '오른쪽 눈(OD) 촬영';

  @override
  String get helpStep3Desc => '아이리스코프를 위치시키고 오른쪽 눈 이미지를 촬영하세요.';

  @override
  String get helpStep4Title => '왼쪽 눈(OS) 촬영';

  @override
  String get helpStep4Desc => '일관된 조명으로 왼쪽 눈에 대해 반복하세요.';

  @override
  String get helpStep5Title => '분석 검토';

  @override
  String get helpStep5Desc => '앱이 P/I 비율, 동공 형태 및 ANW 특성을 분석합니다.';

  @override
  String get helpStep6Title => '보고서 내보내기';

  @override
  String get helpStep6Desc => 'PDF, TXT 또는 JSON 형식으로 저장하세요.';

  @override
  String get helpTipBestResults =>
      '최상의 결과를 위해: 일관된 조명을 사용하고 아이리스코프 거리를 2-3cm로 유지하세요.';

  @override
  String get helpCnriProtocolFeatures => 'CNRI 프로토콜 기능';

  @override
  String get helpFeaturePiRatioTitle => '동공/홍채 비율 (P/I)';

  @override
  String get helpFeaturePiRatioDesc =>
      '정상: 20-30%. 범위를 벗어난 값은 자율신경 불균형을 나타낼 수 있습니다.';

  @override
  String get helpFeaturePupilFormTitle => '동공 형태 분석';

  @override
  String get helpFeaturePupilFormDesc => '타원 패턴, 편심 방향 및 이심률을 감지합니다.';

  @override
  String get helpFeatureAnwTitle => 'ANW (콜라렛) 평가';

  @override
  String get helpFeatureAnwDesc => '비율, 형태 규칙성, 섹터 이동 및 긴장 상태를 분석합니다.';

  @override
  String get helpFeatureZoneTitle => '구역 분석';

  @override
  String get helpFeatureZoneDesc => '편평화/돌출을 CNRI 장기 구역에 매핑합니다.';

  @override
  String get helpFeatureBilateralTitle => '양측 비교';

  @override
  String get helpFeatureBilateralDesc => 'OD 대 OS를 비교하여 비대칭을 감지합니다.';

  @override
  String get helpFeatureMlTitle => 'ONNX CNN 비교';

  @override
  String get helpFeatureMlDesc => 'ONNX CNN 모델이 비교용 보조 측정을 제공합니다.';

  @override
  String get helpKeyboardShortcuts => '키보드 단축키';

  @override
  String get helpCameraControls => '카메라 제어';

  @override
  String get helpShortcutSpace => '이미지 촬영';

  @override
  String get helpShortcutCtrlS => 'PDF 보고서 저장';

  @override
  String get helpShortcutCtrlO => '갤러리 이미지 열기';

  @override
  String get helpShortcutCtrlH => '스캔 기록 보기';

  @override
  String get helpShortcutF11 => '전체 화면 전환';

  @override
  String get helpShortcutEsc => '뒤로 / 취소';

  @override
  String get helpShortcutScroll => '확대/축소';

  @override
  String get helpShortcutDoubleClick => '확대/축소 재설정';

  @override
  String get helpCommonIssues => '일반적인 문제';

  @override
  String get helpIssueCameraNotDetected => '카메라가 감지되지 않음';

  @override
  String get helpIssueCameraSolution1 => 'USB 연결 확인';

  @override
  String get helpIssueCameraSolution2 => '다른 USB 포트 시도';

  @override
  String get helpIssueCameraSolution3 => 'Dino-Lite 드라이버 설치';

  @override
  String get helpIssueCameraSolution4 => '애플리케이션 재시작';

  @override
  String get helpIssuePupilDetectionFails => '동공 감지 실패';

  @override
  String get helpIssuePupilSolution1 => '적절한 조명 확보';

  @override
  String get helpIssuePupilSolution2 => '프레임 중앙에 동공 배치';

  @override
  String get helpIssuePupilSolution3 => '아이리스코프 렌즈 청소';

  @override
  String get helpIssuePupilSolution4 => '수동으로 초점 조정';

  @override
  String get helpIssuePdfExportFails => 'PDF 내보내기 실패';

  @override
  String get helpIssuePdfSolution1 => '폴더 권한 확인';

  @override
  String get helpIssuePdfSolution2 => '디스크 공간 확인';

  @override
  String get helpIssuePdfSolution3 => '열린 PDF 파일 닫기';

  @override
  String get helpIssuePdfSolution4 => '먼저 TXT 내보내기 시도';

  @override
  String get helpCaptureChecklistTitle => '촬영 체크리스트';

  @override
  String get helpCaptureChecklist1 => '동공이 중앙에 있고 프레임 안에서 완전히 보이도록 유지하세요.';

  @override
  String get helpCaptureChecklist2 => '균일한 조명을 사용하고 각막의 눈부심이나 반사를 줄이세요.';

  @override
  String get helpCaptureChecklist3 => '오른쪽 눈과 왼쪽 눈에서 아이리스코프 거리를 비슷하게 유지하세요.';

  @override
  String get helpCaptureChecklist4 => '동공 가장자리가 흐리게 보이면 다시 초점을 맞추거나 다시 촬영하세요.';

  @override
  String get helpExportSettingsTitle => '내보내기 설정';

  @override
  String get helpExportSettingsDesc =>
      'PDF 자동 저장은 분석 후 보고서를 저장할 수 있고, 이미지 포함은 PDF의 눈 사진 표시를 제어하며, ONNX CNN 비교는 비교 값을 보고서에 추가합니다.';

  @override
  String get helpHybridScoreTitle => '하이브리드 신뢰도 및 등급';

  @override
  String get helpHybridScoreDesc =>
      '표시되는 신뢰도와 등급은 고전 기하 품질과 ML 일치를 결합하므로 진단이 아니라 측정 신뢰성을 반영합니다.';

  @override
  String get helpAnomalyGuideTitle => '편평화와 돌출 읽기';

  @override
  String get helpAnomalyGuideDesc =>
      '편평화는 동공 경계의 상대적 안쪽 당김을, 돌출은 바깥쪽 당김을 의미합니다. 각 카드에는 구역, 크기, 매핑된 연관 정보가 표시됩니다.';

  @override
  String get helpZoneOverlayGuideTitle => '구역 오버레이';

  @override
  String get helpZoneOverlayGuideDesc =>
      '구역 오버레이를 사용하면 동공과 홍채 주변에서 감지된 이상이 어느 섹터에 위치하는지 시각적으로 확인할 수 있습니다.';

  @override
  String get helpContactSupportTip => '도움이 필요하면 helpdesk@cnri.edu에 문의하세요.';

  @override
  String get settingsTitle => '설정';

  @override
  String get settingsCameraIriscope => '카메라 / 아이리스코프';

  @override
  String get settingsPreferredCamera => '선호 카메라:';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USB 카메라';

  @override
  String get settingsCameraAutoDetect => '자동 감지';

  @override
  String get settingsDefaultZoom => '기본 확대:';

  @override
  String get settingsAnalysis => '분석';

  @override
  String get settingsShowMlComparison => 'ML 비교 표시';

  @override
  String get settingsShowZoneOverlay => '구역 오버레이 표시';

  @override
  String get settingsExportReports => '내보내기 및 보고서';

  @override
  String get settingsAutoSavePdf => 'PDF 자동 저장';

  @override
  String get settingsIncludeImages => '이미지 포함';

  @override
  String get settingsSaved => '설정 저장됨';

  @override
  String get aboutResearchEdition => '연구 에디션';

  @override
  String aboutVersion(String version) {
    return '버전 $version';
  }

  @override
  String get aboutLicense => '라이선스';

  @override
  String get aboutLicensedTo => '라이선스 소유자:';

  @override
  String get aboutExpires => '만료:';

  @override
  String get aboutManageLicense => '라이선스 관리';

  @override
  String get aboutBasedOnCnri => 'CNRI 프로토콜 기반';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => '웹사이트';

  @override
  String get aboutPrivacy => '개인정보';

  @override
  String get languageSelectTitle => '언어 선택';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get languageChanged => '언어 변경됨';

  @override
  String languageChangedMessage(String language) {
    return '앱 언어가 $language로 설정됨';
  }

  @override
  String get languageSystemNotAvailable => '언어 시스템을 사용할 수 없음';

  @override
  String get licenseLoading => '로딩 중...';

  @override
  String get licenseWelcome => 'PupilMetrics에 오신 것을 환영합니다!';

  @override
  String get licenseTrialFeatures => '14일 무료 체험 • 전체 기능';

  @override
  String get licenseStartTrial => '무료 체험 시작';

  @override
  String get licenseEnterKey => '라이선스 입력';

  @override
  String get licenseFreeTrial => '무료 체험';

  @override
  String licenseDaysRemaining(int count) {
    return '$count일 남음';
  }

  @override
  String get licenseTrialEnded => '체험 종료';

  @override
  String get licenseEnterToContinue => '계속하려면 라이선스를 입력하세요';

  @override
  String get licenseStandard => '표준 라이선스';

  @override
  String get licenseProfessional => '프로페셔널 라이선스';

  @override
  String get licenseEnterprise => '엔터프라이즈 라이선스';

  @override
  String get licenseLicensed => '라이선스됨';

  @override
  String get licenseActive => '활성';

  @override
  String get licenseTrialUser => '체험 사용자';

  @override
  String get licenseLifetime => '평생';

  @override
  String get licenseNotSetUp => '설정되지 않음';

  @override
  String get trialExpiredTitle => '체험 기간 종료';

  @override
  String get trialExpiredMessage =>
      '14일 체험 기간이 종료되었습니다. 홍채 이미지 분석을 계속하려면 라이선스를 구매하세요.';

  @override
  String get trialExpiredCanStill => '계속 할 수 있는 작업:';

  @override
  String get trialExpiredViewAnalyses => '이전 분석 보기';

  @override
  String get trialExpiredExportReports => '기존 보고서 내보내기';

  @override
  String get trialExpiredAccessHistory => '스캔 기록 접근';

  @override
  String get trialExpiredMaybeLater => '나중에';

  @override
  String get licenseRegistration => '라이선스 등록';

  @override
  String get licenseStatusValid => '라이선스됨';

  @override
  String get licenseStatusTrialActive => '무료 체험';

  @override
  String get licenseStatusTrialExpired => '체험 종료';

  @override
  String get licenseStatusExpired => '라이선스 만료';

  @override
  String get licenseStatusInvalid => '유효하지 않은 라이선스';

  @override
  String get licenseStatusUnregistered => '설정되지 않음';

  @override
  String get licenseStatusMachineMismatch => '다른 컴퓨터';

  @override
  String get licenseStatusNetworkError => '연결 오류';

  @override
  String get licenseEnterKeyTitle => '라이선스 키 입력';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => '이름';

  @override
  String get licenseEmailAddress => '이메일 주소';

  @override
  String get licenseMachineId => '기기 ID';

  @override
  String get licenseCopyMachineId => '기기 ID 복사';

  @override
  String get licenseMachineIdCopied => '기기 ID가 클립보드에 복사됨';

  @override
  String get licenseValidationKeyRequired => '라이선스 키를 입력하세요';

  @override
  String get licenseValidationKeyFormat =>
      '라이선스 키는 20자여야 합니다 (CNRI-XXXX-XXXX-XXXX-XXXX)';

  @override
  String get licenseValidationNameRequired => '이름을 입력하세요';

  @override
  String get licenseValidationEmailRequired => '이메일을 입력하세요';

  @override
  String get licenseValidationEmailInvalid => '유효한 이메일을 입력하세요';

  @override
  String get licenseActivate => '라이선스 활성화';

  @override
  String get licenseContinueTrial => '체험 계속';

  @override
  String get licenseBuyLicense => '라이선스 구매';

  @override
  String get licenseNeedHelp => '도움이 필요하신가요?';

  @override
  String get licenseLicenseAgreement => '라이선스 계약';

  @override
  String get licenseActivatedSuccess => '라이선스가 성공적으로 활성화되었습니다!';

  @override
  String get licenseMsgMachineMismatch =>
      '이 라이선스는 다른 컴퓨터에 등록되어 있습니다. 원래 기기를 사용하거나 지원팀에 문의하세요.';

  @override
  String get licenseMsgTrialEnded =>
      '무료 체험이 종료되었습니다. 모든 기능을 계속 사용하려면 라이선스 키를 입력하세요.';

  @override
  String get licenseMsgExpired => '라이선스가 만료되었습니다. 계속하려면 갱신하세요.';

  @override
  String get licenseMsgNeedsSetup =>
      '라이선스 설정이 필요합니다. 무료 체험을 시작하거나 라이선스 키를 입력하세요.';

  @override
  String get licenseMsgCheckFormat =>
      '라이선스 키 형식을 확인하세요. 형식: CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized => '이 라이선스 키가 인식되지 않았습니다. 다시 확인하고 시도하세요.';

  @override
  String get licenseMsgAlreadyRegistered => '이 키는 이미 다른 컴퓨터에 등록되어 있습니다.';

  @override
  String get licenseMsgContactSupport => '이 라이선스가 만료되었습니다. 갱신을 위해 지원팀에 문의하세요.';

  @override
  String get licenseMsgActivatedThankYou =>
      '라이선스가 성공적으로 활성화되었습니다! 구매해 주셔서 감사합니다.';

  @override
  String get licenseMsgUnableToActivate =>
      '라이선스를 활성화할 수 없습니다. 인터넷 연결을 확인하고 다시 시도하세요.';

  @override
  String licenseMsgTrialWelcome(int days) {
    return '환영합니다! $days일 무료 체험이 시작되었습니다.';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return '체험 활성: $days일 남음.';
  }

  @override
  String get licenseMsgFreeTrialActive => '무료 체험 활성';

  @override
  String licenseMsgLicenseActive(String type) {
    return '라이선스 활성 - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey => '이 라이선스 키를 활성화할 수 없습니다.';

  @override
  String get licenseMsgNoLongerValid => '라이선스가 더 이상 유효하지 않습니다.';

  @override
  String get licenseMsgUnableToVerify => '이 라이선스 키를 확인할 수 없습니다. 지원팀에 문의하세요.';

  @override
  String get trialStartedSnackbar => '체험 시작됨!';

  @override
  String get trialStartedMessage => '14일 동안 전체 기능을 이용하세요';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => '테마 모드';

  @override
  String get methods => '메서드';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => '포커스 / 블러';

  @override
  String get showHide => '표시 / 숨기기';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => '최대화 / 복원';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => '최소화 / 복원';

  @override
  String get dockUndock => '도킹 / 도킹 해제';

  @override
  String get dockLeft => '왼쪽 도킹';

  @override
  String get dockRight => '오른쪽 도킹';

  @override
  String get undock => '도킹 해제';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => '재설정';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => '투명';

  @override
  String get red => '빨강';

  @override
  String get green => '초록';

  @override
  String get blue => '파랑';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => '왼쪽 상단';

  @override
  String get topCenter => '상단 중앙';

  @override
  String get topRight => '오른쪽 상단';

  @override
  String get centerLeft => '왼쪽 중앙';

  @override
  String get centerRight => '오른쪽 중앙';

  @override
  String get bottomLeft => '왼쪽 하단';

  @override
  String get bottomCenter => '하단 중앙';

  @override
  String get bottomRight => '오른쪽 하단';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => '설정';

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
  String get hidden => '숨김';

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
  String get defaultIcon => '기본값';

  @override
  String get original => '원본';

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
  String get dragToMoveArea => '드래그하여 이동';

  @override
  String get dragToResizeArea => '드래그하여 크기 조정';

  @override
  String get dragToResizeAreaExample => '크기 조정 영역 예시';

  @override
  String get closeWindowConfirmation => '이 창을 닫으시겠습니까?';

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
  String get plrReportTitle => 'PLR 분석 보고서';

  @override
  String get plrResearchOnlyTitle => '연구/교육용 전용';

  @override
  String get plrResearchDisclaimer => '결과는 의학적 진단이 아닙니다. 의료 전문가와 상담하십시오.';

  @override
  String get plrNameLabel => '이름';

  @override
  String plrAgeYears(int age) {
    return '나이: $age세';
  }

  @override
  String get plrTestLabel => '검사';

  @override
  String get plrSummaryTitle => 'PLR 요약';

  @override
  String plrGradeValue(String grade) {
    return '등급 $grade';
  }

  @override
  String get plrStatusLabel => '상태';

  @override
  String get plrDetectedStatus => 'PLR 감지됨';

  @override
  String get plrWeakNotDetectedStatus => '약함/미감지';

  @override
  String get plrRecoveryTimeLabel => '회복 시간';

  @override
  String get plrRecoveryRatioLabel => '회복 비율';

  @override
  String get plrChartDescription => '시간에 따른 동공 반응의 시각적 표현';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I 범위: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return '최소: $value%';
  }

  @override
  String get plrFrameDataTitle => '프레임 데이터';

  @override
  String get plrTableTime => '시간';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => '단계';

  @override
  String get plrTableConfidenceShort => '신뢰';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return '성공: $success | 실패: $fail';
  }

  @override
  String get plrReferenceLatencyLine => '• 잠복기: 200-500ms (초기 반응까지의 시간)';

  @override
  String get plrReferenceConstrictionLine => '• 축동: 기준값 대비 10-30% 감소';

  @override
  String get plrReferenceVelocityLine => '• 속도: 1.5-4.0%/초';

  @override
  String get plrReferenceRecoveryLine => '• 회복: 5초 이내 기준값의 75% 이상 회복';

  @override
  String get plrReferenceRecoveryLineShort => '• 회복: 5초 이내 기준값의 75% 이상 회복';

  @override
  String plrShareSubject(String eye) {
    return 'PLR 분석 보고서 - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR 비디오 분석 보고서';

  @override
  String get plrTextDisclaimerTitle => '면책조항: 연구/교육용 전용';

  @override
  String get plrTextDisclaimerBody => '결과는 의학적 진단이 아닙니다.';

  @override
  String get plrOverallGradeLabel => '종합 등급';

  @override
  String get plrEndOfReport => '보고서 끝';

  @override
  String get zoneOverlay => '영역 오버레이';

  @override
  String get tipDragImage => '팁: 이미지를 드래그하여 각막윤부를 원과 정렬하세요.';

  @override
  String get overlayMetrics => '오버레이 지표';

  @override
  String get piRatioLabel => 'P/I 비율:';

  @override
  String get ellipsenessLabel => '타원도:';

  @override
  String get decentralizationLabel => '편심도:';

  @override
  String get detectedFindings => '감지된 소견';

  @override
  String get anwCollarette => 'ANW / 콜라렛';

  @override
  String get observerNotes => '관찰자 메모';

  @override
  String get observerNotesHint => '임상 관찰, 영역 소견, 패턴을 입력…';

  @override
  String get autoCenter => '자동 중심';

  @override
  String get anwRing => 'ANW 링';

  @override
  String get axisGrid => '축/그리드';

  @override
  String get chart => '차트';

  @override
  String get hoverToIdentify => '영역 위로 호버하거나 탭하여 식별';

  @override
  String get organsMode => '장기 모드 — 홍채 위로 호버하여 영역 식별';

  @override
  String get mildSizeDiff => '경미한 크기 차이. 생리적 변이일 수 있습니다.';

  @override
  String withinBaseline(Object age, Object group) {
    return '$age세($group) 연구 기준치 이내';
  }

  @override
  String get formLabel => '형태:';

  @override
  String get flatteningLabel => '편평화:';

  @override
  String get protrusionLabel => '돌출:';

  @override
  String get decentrationLabel => '편심:';

  @override
  String get pupilSizeLabel => '동공 크기:';

  @override
  String get anwRatioLabel => 'ANW 비율:';

  @override
  String get anwToneLabel => 'ANW 긴장도:';

  @override
  String get noMajorODAnomalies => 'OD 동공의 주요 이상 없음.';

  @override
  String get noMajorOSAnomalies => 'OS 동공의 주요 이상 없음.';

  @override
  String get anwNotAssessed => 'ANW: 미평가';

  @override
  String get manualAlignmentAid => '검토 전용 수동 정렬 보조. 이미지 드래그 또는 자동 중심 사용.';

  @override
  String get frontalShift => 'S: 전두 이동 패턴.';

  @override
  String get cerebralCirculation =>
      'Velchover에 따른 역사적 연구에서는 이것을 뇌순환 패턴에 연결했습니다.';

  @override
  String get middleTemporalShift => 'D: 중측두 이동 패턴.';

  @override
  String get respiratoryCardiac =>
      'Velchover에 따른 역사적 연구에서는 이것을 호흡기 및 심장 자율신경 패턴에 연결했습니다.';

  @override
  String get findings => '소견:';

  @override
  String get analysisReportTitle => '동공 분석 보고서';

  @override
  String get reportResearchVersion => '연구 버전';

  @override
  String get reportDisclaimerTitle => '면책조항: 연구/교육용 전용';

  @override
  String get reportDisclaimerBody => '결과는 연구 관찰이며 의학적 진단이 아닙니다.';

  @override
  String get reportPersonInformationTitle => '대상자 정보';

  @override
  String get reportAgeGroupLabel => '연령군';

  @override
  String get reportPupilSizeComparisonTitle => '동공 크기 비교';

  @override
  String get reportCaptureDistanceMetricsTitle => '촬영 거리 지표';

  @override
  String get reportResearchObservationsTitle => '연구 관찰';

  @override
  String get reportObserverNotesZoneOverlayTitle => '관찰자 메모(존 오버레이)';

  @override
  String get reportEndOfReport => '보고서 끝';

  @override
  String get reportGradeLabel => '등급';

  @override
  String get reportPupilFormTitle => '동공 형태';

  @override
  String get reportDecentrationTitle => '편심';

  @override
  String get reportFlatteningsTitle => '편평화';

  @override
  String get reportProtrusionsTitle => '돌출';

  @override
  String get reportAnwParametersTitle => '자율신경 환(ANW)';

  @override
  String get reportTonicStateLabel => '역사적 긴장 패턴';

  @override
  String get reportShiftDetectedTitle => '역사적 이동 패턴';

  @override
  String get reportClinicalLabel => '역사적 참고';

  @override
  String get reportConstrictionDetectedTitle => '수축 감지';

  @override
  String get reportSeverityLabel => '중증도';

  @override
  String get reportReferenceValuesTitle => '참고값(CNRI 연구 프로토콜)';

  @override
  String get reportMatchLabel => '일치';

  @override
  String get reportValueLabel => '값';

  @override
  String get reportNormalPupilForm => '정상 동공 형태';

  @override
  String reportPageXofY(int page, int total) {
    return '$page/$total페이지';
  }

  @override
  String reportShareSubject(String patientName) {
    return '동공 분석 보고서 - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return '$patientName의 동공 분석 보고서를 첨부합니다. 생성 일시: $date';
  }

  @override
  String belowBaseline(int age, String group) {
    return '연령 $age($group) 연구 기준보다 낮음';
  }

  @override
  String aboveBaseline(int age, String group) {
    return '연령 $age($group) 연구 기준보다 높음';
  }

  @override
  String get ageGroupInfant => '영아';

  @override
  String get ageGroupChild15 => '아동 (1-5)';

  @override
  String get ageGroupChild611 => '아동 (6-11)';

  @override
  String get ageGroupTeen => '청소년';

  @override
  String get ageGroupAdult2039 => '성인 (20-39)';

  @override
  String get ageGroupAdult4059 => '성인 (40-59)';

  @override
  String get ageGroupSenior60Plus => '노년층 (60+)';

  @override
  String get middleNasalShift => '중비측 이동 패턴.';

  @override
  String get upperTemporalShift => '상측두 이동 패턴.';

  @override
  String get lowerTemporalShift => '하측두 이동 패턴.';

  @override
  String get basalShift => '기저 이동 패턴.';

  @override
  String get vagusStellateAssociation =>
      'Velchover에 따른 역사적 연구에서는 이것을 미주신경 또는 성상신경절의 기능저하 패턴과 연결했습니다.';

  @override
  String get venaCavaInferiorAssociation =>
      'Velchover에 따른 역사적 연구에서는 이것을 하대정맥의 혈역학적 장애 패턴과 연결했습니다.';

  @override
  String get vertebralArteryAssociation =>
      'Velchover에 따른 역사적 연구에서는 이것을 척추동맥 순환 패턴과 연결했습니다.';

  @override
  String get smallPelvisAssociation =>
      'Velchover에 따른 역사적 연구에서는 이것을 소골반 울혈 패턴과 연결했습니다.';

  @override
  String get openZoneOverlay => '영역 오버레이 열기';

  @override
  String get iris => '홍채';

  @override
  String get chartOpacity => '차트 불투명도';

  @override
  String get irisSizeNotAvailable => '홍채 크기 데이터를 사용할 수 없습니다';

  @override
  String get ratio => '비율';

  @override
  String get reportRefPiRatio => '동공/홍채 비율: 정상 20-30%';

  @override
  String get reportRefEllipseness => '타원도: 정상 >95%';

  @override
  String get reportRefDecentralization => '탈중심화: 정상 <5%';

  @override
  String get reportRefPupilSizeDiff => '동공 크기 차이: <2% 정상, 2-4% 경미, >4% 유의';

  @override
  String get enterPatientInfoAnalysis => '환자 정보 입력 → 분석';

  @override
  String get chooseCaptureMethod => '캡처 방법 선택:';

  @override
  String get usbCamera => 'USB 카메라';

  @override
  String get selectExistingImage => '기존 이미지 선택';

  @override
  String get detectingCameras => '카메라 감지 중...';

  @override
  String get retryDetection => '감지 재시도';

  @override
  String get connectUvcCameraViaUsb => 'USB로 UVC 카메라 연결';

  @override
  String get ensureCameraDriversInstalled => '카메라 드라이버가 설치되어 있는지 확인';

  @override
  String get tapRefreshToDetect => '새로 고침을 눌러 카메라 감지';

  @override
  String get connectUsbCameraToBegin => 'USB 카메라를 연결하여 시작';

  @override
  String get noExternalCameraTitle => '외부 카메라가 감지되지 않음';

  @override
  String get connectUsbIriscopeEnsurePlugged => 'USB 홍채경을 연결하고 꽂혀 있는지 확인하세요';

  @override
  String get languagesAvailable => '사용 가능한 언어';

  @override
  String get validationChecks => '유효성 검사:';

  @override
  String get eyeQualityTip => '팁: 좋은 조명을 확보하고 눈을 안정적으로 유지하세요';

  @override
  String get validatingEye => '눈 유효성 검사 중...';

  @override
  String get initializing => '초기화 중...';

  @override
  String get nameLabel => '이름:';

  @override
  String get ageLabel => '나이:';

  @override
  String get typeLabel => '유형:';

  @override
  String get pleaseEnterName => '이름을 입력해 주세요';

  @override
  String get pleaseEnterAge => '나이를 입력해 주세요';

  @override
  String get ageMustBe2Digits => '나이는 1자리 또는 2자리여야 합니다';

  @override
  String get optional => '(선택)';

  @override
  String get bilateralBothHands => '양손 양측 사용';

  @override
  String get zoom => '줌';

  @override
  String get zoomSliderTip => '녹화 전에 오른쪽 줌 슬라이더를 사용하여 배율을 조정하세요.';
}
