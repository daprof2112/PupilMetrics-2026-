// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'CNRI アイキャプチャ';

  @override
  String get analyzeButton => '分析';

  @override
  String get plrModes => 'PLRモード';

  @override
  String get captureInstructions => 'ガイド円内に目を配置してください';

  @override
  String get scanHistory => 'スキャン履歴';

  @override
  String get selectCameraMode => 'カメラモードを選択';

  @override
  String get loadFromGallery => 'ギャラリーから読み込む';

  @override
  String get rightEyePhoto => '右目の写真';

  @override
  String get leftEyePhoto => '左目の写真';

  @override
  String get autoCapture => '自動キャプチャ';

  @override
  String get autoCaptureDesc => '目の検出 + 5秒自動キャプチャ';

  @override
  String get manualCapture => '手動キャプチャ';

  @override
  String get manualCaptureDesc => '目の検出 + 手動キャプチャ（背面カメラ）';

  @override
  String get selfieMode => 'セルフィーモード';

  @override
  String get selfieModeDesc => '目の検出 + 5秒自動キャプチャ（前面カメラ）';

  @override
  String get plrVideoRear => 'PLR動画（背面）';

  @override
  String get plrVideoRearDesc => '背面カメラ • 10秒キャプチャ';

  @override
  String get plrVideoSelfie => 'PLR動画（セルフィー）';

  @override
  String get plrVideoSelfieDesc => '前面カメラ • 10秒キャプチャ';

  @override
  String get plrVideoCapture => 'PLR動画キャプチャ';

  @override
  String get frontCamera => '前面カメラ';

  @override
  String get rearCamera => '背面カメラ';

  @override
  String get selectEyeToAssess => '評価する目を選択';

  @override
  String get rightEyeOD => '右目 (OD)';

  @override
  String get leftEyeOS => '左目 (OS)';

  @override
  String get recordPlrRightEye => '右目のPLRを記録';

  @override
  String get recordPlrLeftEye => '左目のPLRを記録';

  @override
  String get loadRightEyeImage => '右目の画像を読み込む';

  @override
  String get loadLeftEyeImage => '左目の画像を読み込む';

  @override
  String get bothEyes => '両目';

  @override
  String get loadBothEyesDesc => '右目を読み込み、次に左目';

  @override
  String get selectEyeImageFromDevice => 'デバイスから目の画像を選択';

  @override
  String get selectRightEyeFirst => 'まず右目 (OD) の画像を選択してください';

  @override
  String get rightEyeSaved => '右目を保存しました。次に左目 (OS) の画像を選択してください';

  @override
  String get cancelledNoRightEye => 'キャンセル - 右目が選択されていません';

  @override
  String get cancelledNoLeftEye => 'キャンセル - 左目が選択されていません';

  @override
  String errorLoadingImages(String error) {
    return '画像の読み込みエラー: $error';
  }

  @override
  String get crop43 => 'クロップ (4:3)';

  @override
  String get success => '成功';

  @override
  String get imageCroppedSuccess => '画像のクロップが完了しました！';

  @override
  String get error => 'エラー';

  @override
  String get cropFailed => '画像のクロップに失敗しました。もう一度お試しください。';

  @override
  String get crop => 'クロップ';

  @override
  String get cancel => 'キャンセル';

  @override
  String get saved => '保存完了！ ✅';

  @override
  String get imageSavedToGallery => '画像をギャラリーに保存しました';

  @override
  String get exposure => '露出';

  @override
  String get flash => 'フラッシュ';

  @override
  String get eye => '目';

  @override
  String get center => '中央';

  @override
  String get light => '光';

  @override
  String get ready => '準備完了';

  @override
  String get on => 'オン';

  @override
  String get off => 'オフ';

  @override
  String get auto => '自動';

  @override
  String get manual => '手動';

  @override
  String get selfie => 'セルフィー';

  @override
  String get pupil => '瞳孔';

  @override
  String get plrHistory => 'PLR履歴';

  @override
  String get searchByName => '名前で検索...';

  @override
  String get totalScans => '総スキャン数';

  @override
  String get thisWeek => '今週';

  @override
  String get patients => '患者';

  @override
  String get detected => '検出済み';

  @override
  String get noPlrRecordsYet => 'PLR記録はまだありません';

  @override
  String get recordPlrVideoToSeeHistory => 'PLR動画を記録すると履歴がここに表示されます';

  @override
  String get deleteRecord => '記録を削除しますか？';

  @override
  String deleteRecordConfirm(String name, String eye) {
    return '$name ($eye) のPLR分析を削除しますか？\n\nこの操作は取り消せません。';
  }

  @override
  String get delete => '削除';

  @override
  String get recordDeleted => '記録を削除しました';

  @override
  String plrAnalysis(String eye) {
    return 'PLR分析 - $eye';
  }

  @override
  String get patient => '患者';

  @override
  String get date => '日付';

  @override
  String get frames => 'フレーム';

  @override
  String get baselinePiRatio => '基準P/I';

  @override
  String get minPiRatio => '最小P/I';

  @override
  String get plrMagnitude => 'PLR振幅';

  @override
  String get constriction => '収縮';

  @override
  String get plrDetected => 'PLR検出';

  @override
  String get confidence => '信頼度';

  @override
  String get grade => 'グレード';

  @override
  String get close => '閉じる';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get na => 'N/A';

  @override
  String get takeLeftEyePhoto => '左目の写真を撮る';

  @override
  String get takeRightEyePhoto => '右目の写真を撮る';

  @override
  String get nowTakingLeftEye => '左目 (OS) を撮影中';

  @override
  String get startingWithRightEye => '右目 (OD) から開始';

  @override
  String get captured => 'キャプチャ完了 ✓';

  @override
  String get useSameDistanceLighting => '正確な比較のため、右目と同じ距離と照明を使用してください。';

  @override
  String get step1of2 => 'ステップ 1/2';

  @override
  String get step2of2 => 'ステップ 2/2';

  @override
  String get bothEyesCaptured => '両目キャプチャ完了 ✓';

  @override
  String get continueToLeftEye => '左目へ進む';

  @override
  String get retakeOD => 'OD撮り直し';

  @override
  String get retakeOS => 'OS撮り直し';

  @override
  String get retakeRightEye => '右目撮り直し';

  @override
  String get analyzeBothEyes => '両目を分析';

  @override
  String get patientInfoMissing => '患者情報がありません';

  @override
  String get rightEyePhotoMissing => '右目の写真がありません！';

  @override
  String get patientInfoMissingRestart => '患者情報がありません。最初からやり直してください。';

  @override
  String get exitApp => 'アプリを終了';

  @override
  String get tipsForBestResults => '最良の結果を得るためのヒント';

  @override
  String get followGuidelinesForQuality => '最適な画質のため、以下のガイドラインに従ってください';

  @override
  String get cameraDistance => 'カメラの距離';

  @override
  String get cameraDistanceDesc => 'カメラを目から10〜15cm離してください。両目で同じ距離を保ってください。';

  @override
  String get lightingPosition => '照明の位置';

  @override
  String get lightingPositionDesc =>
      '光源を瞳孔の境界の内側または外側に配置してください。カメラのフラッシュを見るようにしてください。';

  @override
  String get avoidReflections => '反射を避ける';

  @override
  String get avoidReflectionsDesc => '窓の光、鏡、直接照明を避けて反射を減らしてください。';

  @override
  String get centerYourEye => '目を中央に';

  @override
  String get centerYourEyeDesc => '強膜（白目）を含む目全体が中央に配置され、フレームいっぱいになるようにしてください。';

  @override
  String get cropProperly => '適切にクロップ';

  @override
  String get cropProperlyDesc => '目を中央にして画像をクロップしてください。画像は4:3のアスペクト比で自動保存されます。';

  @override
  String get importantInformation => '重要な情報';

  @override
  String get imageRatio43 => '医療画像標準の4:3画像比率';

  @override
  String get forClinicalUseCnri => 'CNRI (cnri.edu) での臨床使用向け';

  @override
  String get noMedicalDiagnosis => '医学的診断は提供しません';

  @override
  String get eyeWideOpenClear => '目を大きく開け、画像が鮮明であることを確認してください';

  @override
  String get personalInfo => '個人情報';

  @override
  String get personInformation => '対象者情報';

  @override
  String get enterPersonDetails => '対象者の詳細を入力';

  @override
  String get infoIncludedInReport => 'この情報は分析レポートに含まれます';

  @override
  String get fullName => '氏名';

  @override
  String get enterPersonName => '名前を入力';

  @override
  String get nameRequired => '名前は必須です';

  @override
  String get sex => '性別';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get ageYears => '年齢（歳）';

  @override
  String get enterAge => '年齢を入力';

  @override
  String get ageRequired => '年齢は必須です';

  @override
  String get enterValidNumber => '有効な数値を入力してください';

  @override
  String get enterValidAge => '有効な年齢を入力してください（0〜120）';

  @override
  String get mainComplaints => '主訴';

  @override
  String get mainComplaintsOptional => '主訴（任意）';

  @override
  String get complaintsHint => '例: 頭痛、視力の問題、疲労...';

  @override
  String get continueToCaptire => 'キャプチャへ進む';

  @override
  String get ageImportantNote => '正常範囲は年齢によって異なるため、年齢は正確な瞳孔サイズ評価に重要です。';

  @override
  String get submit => '送信';

  @override
  String get pleaseSelectGender => '性別を選択してください！';

  @override
  String get applicationSubmitted => '申請が正常に送信されました。';

  @override
  String get type => 'タイプ:';

  @override
  String get gender => '性別:';

  @override
  String get rightHanded => '右利き';

  @override
  String get leftHanded => '左利き';

  @override
  String get partialLeftHandedness => '部分的左利き';

  @override
  String get retrainedLeftHandedness => '矯正された左利き';

  @override
  String get bilateralUseBothHands => '両手使い';

  @override
  String get splashTitle => 'PupilMetrics アイキャプチャ';

  @override
  String get splashDeveloper => 'プログラム開発者 - Bryan K. Marcia, Ph.D.';

  @override
  String get researchEducationalTool => '研究・教育ツール';

  @override
  String get startNewAnalysis => '新しい分析を開始';

  @override
  String get viewHistory => '履歴を表示';

  @override
  String get viewResearchDisclaimer => '研究免責事項を表示';

  @override
  String get researchDisclaimerTitle => '研究・教育ツール';

  @override
  String get researchDisclaimerNotMedical => '医療機器ではありません';

  @override
  String get researchDisclaimerNotClinical => '臨床診断用ではありません';

  @override
  String get researchDisclaimerResults => '結果は研究観察です';

  @override
  String get researchDisclaimerConsult => '必ず医療専門家にご相談ください';

  @override
  String get researchDisclaimerAcknowledge =>
      '続行することで、これが研究ツールであり、医療上の決定に使用すべきではないことを認めたことになります。';

  @override
  String get researchDisclaimerWarning => 'このアプリは研究および教育目的専用です。';

  @override
  String get iUnderstand => '理解しました';

  @override
  String get plrAnalysisTest => 'PLR分析テスト';

  @override
  String get checkingVideoFile => '動画ファイルを確認中...';

  @override
  String processingFrame(int current, int total, int timestamp) {
    return 'フレーム処理中 $current/$total (${timestamp}ms)...';
  }

  @override
  String get analysisComplete => '分析完了！';

  @override
  String get errorVideoNotFound => 'エラー: 動画ファイルが見つかりません';

  @override
  String get waitingForResults => '結果を待っています...';

  @override
  String get baseline => '基準';

  @override
  String get flashPhase => 'フラッシュ';

  @override
  String get constrictionPhase => '収縮';

  @override
  String get recovery => '回復';

  @override
  String get plrDetectedExclaim => 'PLR検出！';

  @override
  String get plrWeakNotDetected => 'PLR弱/未検出';

  @override
  String get min => '最小';

  @override
  String get plr => 'PLR';

  @override
  String get constrLabel => '収縮';

  @override
  String get saveToHistory => '履歴に保存';

  @override
  String get txt => 'TXT';

  @override
  String get json => 'JSON';

  @override
  String get saveFrames => 'フレームを保存';

  @override
  String get share => '共有';

  @override
  String get frameSavedToGallery => 'フレームをギャラリーに保存しました！';

  @override
  String get failedToSaveFrame => 'フレームの保存に失敗しました';

  @override
  String framesSavedToGallery(int count) {
    return '$countフレームをギャラリーに保存しました！';
  }

  @override
  String get jsonCopiedToClipboard => 'JSONをクリップボードにコピーしました！';

  @override
  String get reportCopiedToClipboard => 'レポートをクリップボードにコピーしました！';

  @override
  String shareFailedError(String error) {
    return '共有に失敗しました: $error';
  }

  @override
  String savedToHistoryId(int id) {
    return '履歴に保存しました！ (ID: $id)';
  }

  @override
  String failedToSave(String error) {
    return '保存に失敗しました: $error';
  }

  @override
  String get noSuccessfulFramesToSave => '保存できる成功フレームがありません';

  @override
  String get saveAllFrames => 'すべてのフレームを保存';

  @override
  String get shareReport => 'レポートを共有';

  @override
  String get shareJson => 'JSONを共有';

  @override
  String get rerunTest => 'テストを再実行';

  @override
  String videoCaptureTitle(String eye) {
    return 'PLR - $eye';
  }

  @override
  String get initializingCamera => 'カメラを初期化中...';

  @override
  String usingCamera(String camera) {
    return '$cameraカメラを使用中';
  }

  @override
  String cameraError(String error) {
    return 'カメラエラー: $error';
  }

  @override
  String get noCamerasFound => 'カメラが見つかりません';

  @override
  String get retry => '再試行';

  @override
  String get startPlrRecording => 'PLR記録を開始';

  @override
  String get stopRecording => '記録を停止';

  @override
  String get phaseReady => '準備完了';

  @override
  String get phaseStarting => '開始中...';

  @override
  String phaseBaseline(int sec) {
    return '基準 (0-$sec秒)';
  }

  @override
  String get phaseFlash => 'フラッシュ！';

  @override
  String phaseConstriction(int start, int end) {
    return '収縮 ($start-$end秒)';
  }

  @override
  String phaseRecovery(int start, int end) {
    return '回復 ($start-$end秒)';
  }

  @override
  String get phaseComplete => '完了！';

  @override
  String get readyDesc => '円内に目を配置し、開始をタップしてください';

  @override
  String get holdSteady => '安定させてください...';

  @override
  String get recordingBaselinePupil => '基準瞳孔サイズを記録中';

  @override
  String lightStimulus(int ms) {
    return '光刺激 (${ms}ms)';
  }

  @override
  String get measuringConstriction => '瞳孔収縮を測定中';

  @override
  String get measuringRecovery => '瞳孔回復を測定中';

  @override
  String get plrRecordingComplete => 'PLR記録完了';

  @override
  String positionEyeInstruction(String eye, int seconds) {
    return '$eyeを円内に配置してください。\n$seconds秒間の記録中は安定させてください。';
  }

  @override
  String keepEyeSteadyFlash(int sec) {
    return '目を安定させてください。$sec秒でフラッシュが発生します。';
  }

  @override
  String get recordingComplete => '記録完了';

  @override
  String get plrVideoCapturedSuccess => 'PLR動画のキャプチャに成功しました！';

  @override
  String get duration => '時間';

  @override
  String get seconds => '秒';

  @override
  String get frameRate => 'フレームレート';

  @override
  String get camera => 'カメラ';

  @override
  String flashAt(int sec, int ms) {
    return '$sec秒時点 (${ms}ms)';
  }

  @override
  String get phases => 'フェーズ';

  @override
  String get phasesFlow => '基準 → フラッシュ → 収縮 → 回復';

  @override
  String get expectedNormalValues => '期待される正常値:';

  @override
  String get latency => '潜時';

  @override
  String get velocity => '速度';

  @override
  String get testFrameAnalysis => '🧪 フレーム分析テスト';

  @override
  String get retake => '撮り直し';

  @override
  String get done => '完了';

  @override
  String get plrVideoModeTitle => 'PLR動画モード';

  @override
  String get plrAssessmentTitle => '対光反射 (PLR) 評価';

  @override
  String get plrInstructions =>
      '1. ガイド円内に目を配置\n2. 「PLR記録を開始」をタップ\n3. 10秒間安定させる\n4. 3秒でフラッシュが発生\n5. アプリが瞳孔反応を記録';

  @override
  String get recordingPhases => '記録フェーズ:';

  @override
  String get baselinePhaseDesc => '初期瞳孔サイズ';

  @override
  String get flashPhaseDesc => '光刺激';

  @override
  String get constrictionPhaseDesc => '瞳孔が縮小';

  @override
  String get recoveryPhaseDesc => '瞳孔が回復';

  @override
  String get normalPlrValues => '正常PLR値:';

  @override
  String get gotIt => '了解';

  @override
  String get pupilAnalysis => '瞳孔分析';

  @override
  String scansLeft(int count) {
    return '残り$count回';
  }

  @override
  String get validatingRightEye => '右目を検証中...';

  @override
  String get validatingLeftEye => '左目を検証中...';

  @override
  String get analyzingRightEye => '右目を分析中 (OD)...';

  @override
  String get analyzingLeftEye => '左目を分析中 (OS)...';

  @override
  String get comparingPupils => '瞳孔を比較中...';

  @override
  String person(String name) {
    return '対象者: $name';
  }

  @override
  String get invalidEyeImage => '無効な目の画像';

  @override
  String analysisFailed(String error) {
    return '分析失敗: $error';
  }

  @override
  String get researchEducationalToolOnly => '研究・教育目的専用';

  @override
  String get resultsNotMedicalDiagnoses =>
      'このアプリは研究・教育目的のみです。結果は医学的診断ではなく、臨床使用の検証もされていません。パターン関連は歴史的研究文献に基づいています。健康上の懸念がある場合は医療専門家にご相談ください。';

  @override
  String get pupilSizeDifference => '瞳孔サイズの差を検出';

  @override
  String get significantPupilSizeDiff => '重大な瞳孔サイズ差';

  @override
  String get diff => '差';

  @override
  String get researchObservationConsult => '研究観察 - 解釈については医療専門家にご相談ください';

  @override
  String get ageBasedResearchBaseline => '年齢別研究基準値';

  @override
  String group(String group) {
    return 'グループ: $group';
  }

  @override
  String get researchRange => '研究範囲';

  @override
  String get measuredEst => '測定値（推定）';

  @override
  String get pupilForm => '瞳孔形状';

  @override
  String get decentrationPattern => '偏心パターン';

  @override
  String get flattenings => '扁平化';

  @override
  String get protrusions => '突出';

  @override
  String zonesCount(int count) {
    return '$countゾーン';
  }

  @override
  String get bilateralComparison => '両側比較';

  @override
  String get parameter => 'パラメータ';

  @override
  String get od => 'OD';

  @override
  String get os => 'OS';

  @override
  String get piRatio => 'P/I比';

  @override
  String get ellipseness => '楕円度';

  @override
  String get circularity => '真円度';

  @override
  String get decentralization => '偏心度';

  @override
  String get anwRatio => 'ANW比';

  @override
  String get normal => '正常';

  @override
  String get elliptical => '楕円形';

  @override
  String get circular => '円形';

  @override
  String get irregular => '不規則';

  @override
  String get centered => '中央';

  @override
  String get offset => '偏位';

  @override
  String get miosis => '縮瞳';

  @override
  String get constricted => '収縮';

  @override
  String get dilated => '散大';

  @override
  String get mydriasis => '散瞳';

  @override
  String get inner => '内側';

  @override
  String get outer => '外側';

  @override
  String get high => '高';

  @override
  String get moderate => '中程度';

  @override
  String get savePdf => 'PDF保存';

  @override
  String get sharePdf => 'PDF共有';

  @override
  String get retakePhotos => '写真を撮り直す';

  @override
  String scansLeftBanner(int count) {
    return '残りスキャン$count回';
  }

  @override
  String get upgrade => 'アップグレード';

  @override
  String get unlockUnlimited => '無制限を解除';

  @override
  String get usedAllFreeScans => '無料スキャンをすべて使用しました。';

  @override
  String get unlimitedScans => '無制限スキャン';

  @override
  String get pdfReports => 'PDFレポート';

  @override
  String get scanHistoryFeature => 'スキャン履歴';

  @override
  String get bilateralAnalysis => '両側分析';

  @override
  String get monthly => '月額';

  @override
  String get perMonth => '/月';

  @override
  String get annual => '年額';

  @override
  String get perYear => '/年';

  @override
  String get tenCredits => '10クレジット';

  @override
  String get oneTime => '一回限り';

  @override
  String get best => 'お得';

  @override
  String get purchaseCancelled => '購入がキャンセルされました';

  @override
  String purchaseFailed(String error) {
    return '購入失敗: $error';
  }

  @override
  String txtSaved(String path) {
    return 'TXT保存完了: $path';
  }

  @override
  String jsonSaved(String path) {
    return 'JSON保存完了: $path';
  }

  @override
  String get pdfSaved => 'PDF保存完了！';

  @override
  String pdfFailed(String error) {
    return 'PDF失敗: $error';
  }

  @override
  String get open => '開く';

  @override
  String failed(String error) {
    return '失敗: $error';
  }

  @override
  String get staticScans => '静的';

  @override
  String get plrScans => 'PLR';

  @override
  String get searchByNameOrComplaints => '名前または主訴で検索...';

  @override
  String get searchPlrRecords => 'PLR記録を検索...';

  @override
  String get noScansYet => 'スキャンはまだありません';

  @override
  String get completedScansAppearHere => '完了したスキャンがここに表示されます';

  @override
  String get deleteScan => 'スキャンを削除しますか？';

  @override
  String deleteScanConfirm(String name, String date) {
    return '$dateの$nameのスキャンを削除しますか？';
  }

  @override
  String get scanDeleted => 'スキャンを削除しました';

  @override
  String get originalImagesNotFound => '元の目の画像が見つかりません。';

  @override
  String get viewResults => '結果を表示';

  @override
  String get avgPlr => '平均PLR';

  @override
  String get years => '歳';

  @override
  String get anisocoria => '瞳孔不同';

  @override
  String get none => 'なし';

  @override
  String get mild => '軽度';

  @override
  String get severe => '重度';

  @override
  String zoneLabel(String zone) {
    return 'ゾーン: $zone';
  }

  @override
  String associatedWith(String organ) {
    return '$organに関連';
  }

  @override
  String get significant => '重要';

  @override
  String get fair => '普通';

  @override
  String get low => '低';

  @override
  String get good => '良好';
}
