// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'PupilMetrics';

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
  String get saved => '保存済み！ ✅';

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
  String get researchEducationalTool => '研究/教育ツール';

  @override
  String get startNewAnalysis => '新しい分析を開始';

  @override
  String get viewHistory => '履歴を見る';

  @override
  String get viewResearchDisclaimer => '研究免責事項を見る';

  @override
  String get researchDisclaimerTitle => '研究/教育ツール';

  @override
  String get researchDisclaimerNotMedical => '医療機器ではありません';

  @override
  String get researchDisclaimerNotClinical => '臨床診断用ではありません';

  @override
  String get researchDisclaimerResults => '結果は研究観察です';

  @override
  String get researchDisclaimerConsult => '常に医療専門家に相談してください';

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
  String get retake => 'やり直し';

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
  String get normal => '通常';

  @override
  String get elliptical => '楕円形';

  @override
  String get circular => '円形';

  @override
  String get irregular => '不規則';

  @override
  String get centered => '中心';

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
  String get moderate => '中';

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

  @override
  String get zones => 'ゾーン';

  @override
  String get significanceWithinLimits => '許容範囲内';

  @override
  String get significanceMild => '軽度';

  @override
  String get significanceModerate => '中等度';

  @override
  String get significanceSignificant => '顕著';

  @override
  String get formTypeCircle => '円形（正常）';

  @override
  String get formTypeOval => '楕円形';

  @override
  String get formTypeOvalVertical => '垂直楕円形';

  @override
  String get formTypeOvalHorizontal => '水平楕円形';

  @override
  String get formTypeOvalDiagonal => '斜め楕円形';

  @override
  String get formTypeLeftObliqueEllipse => '左斜め楕円';

  @override
  String get formTypeUnilateralEllipse => '片側楕円';

  @override
  String get formTypeVentralDivergingEllipse => '腹側発散楕円';

  @override
  String get formTypeFrontalDivergingEllipse => '前頭発散楕円';

  @override
  String get formTypeEllipse => '楕円';

  @override
  String get formTypeChord => '弦状';

  @override
  String get formTypeIrregular => '不規則';

  @override
  String get pupilFormCircleDesc => '正常な円形瞳孔形態。パターン変異は検出されませんでした。';

  @override
  String get pupilFormOvalHorizontalDesc =>
      '水平楕円パターン。歴史的研究では、これを呼吸器および腺機能領域に影響を与える自律神経系パターンと関連付けています。';

  @override
  String get pupilFormOvalVerticalDesc =>
      '垂直楕円パターン。歴史的研究では、このパターンを自律神経反射研究における脳循環領域と関連付けています。';

  @override
  String get pupilFormOvalDiagonalDesc =>
      '斜め楕円パターン。研究文献では、これを自律神経研究における泌尿生殖器領域反射と関連付けています。';

  @override
  String get pupilFormLeftObliqueEllipseDesc =>
      '左斜め楕円パターン。歴史的観察では、これを泌尿生殖器および下肢の自律神経領域と関連付けています。';

  @override
  String get pupilFormUnilateralEllipseDesc =>
      '片側楕円パターン。研究では、呼吸器および気管支の自律神経領域との関連が示されています。';

  @override
  String get pupilFormVentralDivergingEllipseDesc =>
      '腹側発散楕円。歴史的研究では、これを下半身の自律神経領域および運動機能パターンと関連付けています。';

  @override
  String get pupilFormFrontalDivergingEllipseDesc =>
      '前頭発散楕円。研究文献では、このパターンを脳および上部自律神経領域と関連付けています。';

  @override
  String get pupilFormOvalDesc => '軽度の楕円変形パターン。研究観察で進行を監視してください。';

  @override
  String get pupilFormEllipseDesc => '歴史的研究において自律神経系の変異を示す楕円形瞳孔パターン。';

  @override
  String get pupilFormChordDesc => '研究文献における局所的な自律神経の影響を示す弦状変形パターン。';

  @override
  String get pupilFormIrregularDesc => '歴史的観察に基づく複数の自律神経パターンの影響を示唆する不規則な形態。';

  @override
  String get patternCentered => '中心（正常）';

  @override
  String get patternFrontal => '前頭偏心';

  @override
  String get patternBasal => '基底偏心';

  @override
  String get patternNasal => '鼻側偏心';

  @override
  String get patternTemporal => '側頭偏心';

  @override
  String get patternMiddleNasal => '中鼻側偏心';

  @override
  String get patternMiddleTemporal => '中側頭偏心';

  @override
  String get patternUpperNasal => '上鼻側偏心';

  @override
  String get patternUpperTemporal => '上側頭偏心';

  @override
  String get patternLowerNasal => '下鼻側偏心';

  @override
  String get patternLowerTemporal => '下側頭偏心';

  @override
  String get patternUpwards => '偏心 - 上方';

  @override
  String get patternDownwards => '偏心 - 下方';

  @override
  String get patternUpwardsInwards => '偏心 - 上内方';

  @override
  String get patternUpwardsOutwards => '偏心 - 上外方';

  @override
  String get decentrationCenteredDesc => '生理学的限界内の正常な瞳孔位置。';

  @override
  String get decentrationNasalRightDesc =>
      '鼻側パターン（右）。歴史的研究では、この領域を肺の自律神経反射と関連付けています。';

  @override
  String get decentrationNasalLeftDesc =>
      '鼻側パターン（左）。研究文献では、この領域を心臓の自律神経機能パターンと関連付けています。';

  @override
  String get decentrationTemporalDesc =>
      '側頭パターン。歴史的観察では、この領域を腎臓および生殖器の自律神経反射と関連付けています。';

  @override
  String get decentrationFrontalRightDesc =>
      '前頭パターン（右）。研究では、この領域を認知および脳機能パターンと関連付けています。';

  @override
  String get decentrationFrontalLeftDesc =>
      '前頭パターン（左）。歴史的研究では、この領域を脳の自律神経パターンと関連付けています。';

  @override
  String get decentrationBasalRightDesc => '基底パターン（右）。研究では、頭蓋内圧反射との関連が示されています。';

  @override
  String get decentrationBasalLeftDesc =>
      '基底パターン（左）。歴史的観察では、これを脳の炎症領域パターンと関連付けています。';

  @override
  String get decentrationUpwardsInwardsRightDesc =>
      '上鼻側パターン（右）。研究では、この領域を肝胆道の自律神経反射と関連付けています。';

  @override
  String get decentrationUpwardsInwardsLeftDesc =>
      '上鼻側パターン（左）。歴史的研究では、これを脾臓および横隔膜領域と関連付けています。';

  @override
  String get decentrationUpwardsOutwardsDesc =>
      '上側頭パターン。研究では、腎臓および生殖器の自律神経領域との関連が示されています。';

  @override
  String get decentrationMiddleNasalRightDesc =>
      '中鼻側パターン（右）。歴史的観察では、これを酸素利用および心臓領域と関連付けています。';

  @override
  String get decentrationMiddleNasalLeftDesc =>
      '中鼻側パターン（左）。研究では、これを神経学的および心臓の自律神経パターンと関連付けています。';

  @override
  String get decentrationMiddleTemporalRightDesc =>
      '中側頭パターン（右）。研究では、これを心臓の自律神経調節領域と関連付けています。';

  @override
  String get decentrationMiddleTemporalLeftDesc =>
      '中側頭パターン（左）。歴史的研究では、これを肺および心臓領域と関連付けています。';

  @override
  String get decentrationUpperNasalRightDesc =>
      '上鼻側パターン（右）。研究では、認知領域および頸椎反射との関連が示されています。';

  @override
  String get decentrationUpperNasalLeftDesc =>
      '上鼻側パターン（左）。歴史的観察では、これを認知パターンおよび頸部領域と関連付けています。';

  @override
  String get decentrationUpperTemporalRightDesc =>
      '上側頭パターン（右）。研究では、この領域を脳神経および聴覚反射と関連付けています。';

  @override
  String get decentrationUpperTemporalLeftDesc =>
      '上側頭パターン（左）。歴史的研究では、これを神経植物性および言語領域と関連付けています。';

  @override
  String get decentrationLowerNasalDesc =>
      '下鼻側パターン。研究では、泌尿生殖器および腰仙部の自律神経領域との関連が示されています。';

  @override
  String get decentrationLowerTemporalRightDesc =>
      '下側頭パターン（右）。歴史的観察では、これを代謝および肝臓領域と関連付けています。';

  @override
  String get decentrationLowerTemporalLeftDesc =>
      '下側頭パターン（左）。研究では、これを心臓および脾臓の自律神経パターンと関連付けています。';

  @override
  String get flatteningUpperCentralRightDesc =>
      '上中央領域に関連するパターン。歴史的研究では、これを気分調節およびエネルギーの自律神経反射と関連付けています。';

  @override
  String get flatteningUpperTemporalRightDesc =>
      '上側頭領域に関連するパターン。研究では、脳神経および聴覚の自律神経反射との関連が示されています。';

  @override
  String get flatteningMiddleTemporalRightDesc =>
      '中側頭領域に関連するパターン。歴史的観察では、これを呼吸器および心臓の自律神経パターンと関連付けています。';

  @override
  String get flatteningLowerTemporalRightDesc =>
      '下側頭領域に関連するパターン。研究文献では、これを肝臓および代謝の自律神経領域と関連付けています。';

  @override
  String get flatteningLowerBasalRightDesc =>
      '下基底領域に関連するパターン。歴史的研究では、これを腎臓および下肢の自律神経反射と関連付けています。';

  @override
  String get flatteningLowerNasalRightDesc =>
      '下鼻側領域に関連するパターン。研究では、泌尿生殖器および骨盤の自律神経領域との関連が示されています。';

  @override
  String get flatteningMiddleNasalRightDesc =>
      '中鼻側領域に関連するパターン。歴史的観察では、これを酸素利用および呼吸器の自律神経パターンと関連付けています。';

  @override
  String get flatteningUpperNasalRightDesc =>
      '上鼻側領域に関連するパターン。研究文献では、これを認知および頸部の自律神経反射と関連付けています。';

  @override
  String get flatteningDefaultRightDesc =>
      '歴史的研究に基づき、この領域で自律神経系パターン変異が検出されました。';

  @override
  String get flatteningUpperCentralLeftDesc =>
      '上中央領域に関連するパターン。歴史的研究では、これを気分調節および神経学的自律神経パターンと関連付けています。';

  @override
  String get flatteningUpperTemporalLeftDesc =>
      '上側頭領域に関連するパターン。研究では、神経植物性および言語の自律神経領域との関連が示されています。';

  @override
  String get flatteningMiddleTemporalLeftDesc =>
      '中側頭領域に関連するパターン。歴史的観察では、これを肺および心臓の自律神経反射と関連付けています。';

  @override
  String get flatteningLowerTemporalLeftDesc =>
      '下側頭領域に関連するパターン。研究文献では、これを心臓および脾臓の自律神経パターンと関連付けています。';

  @override
  String get flatteningLowerBasalLeftDesc =>
      '下基底領域に関連するパターン。歴史的研究では、これを腎臓および排泄の自律神経領域と関連付けています。';

  @override
  String get flatteningLowerNasalLeftDesc =>
      '下鼻側領域に関連するパターン。研究では、泌尿生殖器および腰仙部の自律神経反射との関連が示されています。';

  @override
  String get flatteningMiddleNasalLeftDesc =>
      '中鼻側領域に関連するパターン。歴史的観察では、これを心臓および呼吸器の自律神経パターンと関連付けています。';

  @override
  String get flatteningUpperNasalLeftDesc =>
      '上鼻側領域に関連するパターン。研究文献では、これを認知および頸部の自律神経領域と関連付けています。';

  @override
  String get flatteningDefaultLeftDesc => '歴史的研究に基づき、この領域で自律神経系パターン変異が検出されました。';

  @override
  String get protrusionUpperCentralRightDesc =>
      '上中央領域の突出パターン。研究では、これを脳領域に影響を与える交感神経過活動パターンと関連付けています。';

  @override
  String get protrusionUpperTemporalRightDesc =>
      '上側頭領域の突出パターン。歴史的観察では、これを脳神経および聴覚系の過活動パターンと関連付けています。';

  @override
  String get protrusionMiddleTemporalRightDesc =>
      '中側頭領域の突出パターン。研究では、心臓および呼吸器の交感神経パターンとの関連が示されています。';

  @override
  String get protrusionLowerTemporalRightDesc =>
      '下側頭領域の突出パターン。歴史的研究では、これを肝胆道および代謝の交感神経領域と関連付けています。';

  @override
  String get protrusionLowerBasalRightDesc =>
      '下基底領域の突出パターン。研究では、これを腎臓および骨盤の交感神経過活動パターンと関連付けています。';

  @override
  String get protrusionLowerNasalRightDesc =>
      '下鼻側領域の突出パターン。歴史的観察では、これを泌尿生殖器の交感神経活性化領域と関連付けています。';

  @override
  String get protrusionMiddleNasalRightDesc =>
      '中鼻側領域の突出パターン。研究では、胃および膵臓の交感神経パターンとの関連が示されています。';

  @override
  String get protrusionUpperNasalRightDesc =>
      '上鼻側領域の突出パターン。歴史的研究では、これを認知および視覚の交感神経過活動領域と関連付けています。';

  @override
  String get protrusionDefaultRightDesc =>
      '研究観察に基づき、この領域で交感神経系過活動パターンが検出されました。';

  @override
  String get protrusionUpperCentralLeftDesc =>
      '上中央領域の突出パターン。研究では、これを精神運動および脳の交感神経パターンと関連付けています。';

  @override
  String get protrusionUpperTemporalLeftDesc =>
      '上側頭領域の突出パターン。歴史的観察では、これを神経植物性の交感神経過活動領域と関連付けています。';

  @override
  String get protrusionMiddleTemporalLeftDesc =>
      '中側頭領域の突出パターン。研究では、肺および心臓の交感神経パターンとの関連が示されています。';

  @override
  String get protrusionLowerTemporalLeftDesc =>
      '下側頭領域の突出パターン。歴史的研究では、これを脾臓および心臓の交感神経活性化領域と関連付けています。';

  @override
  String get protrusionLowerBasalLeftDesc =>
      '下基底領域の突出パターン。研究では、これを骨盤および腎臓の交感神経過活動パターンと関連付けています。';

  @override
  String get protrusionLowerNasalLeftDesc =>
      '下鼻側領域の突出パターン。歴史的観察では、これを腰仙部の交感神経活性化領域と関連付けています。';

  @override
  String get protrusionMiddleNasalLeftDesc =>
      '中鼻側領域の突出パターン。研究では、不安-心臓の交感神経パターンとの関連が示されています。';

  @override
  String get protrusionUpperNasalLeftDesc =>
      '上鼻側領域の突出パターン。歴史的研究では、これを認知および視覚の交感神経過活動領域と関連付けています。';

  @override
  String get protrusionDefaultLeftDesc => '研究観察に基づき、この領域で交感神経系過活動パターンが検出されました。';

  @override
  String get anisocoriaNone => '瞳孔サイズは正常範囲内です。顕著な瞳孔不同は検出されませんでした。';

  @override
  String anisocoriaDetected(
      String difference, String direction, String description) {
    return '瞳孔不同が検出されました：$difference%（$direction）。$description';
  }

  @override
  String get anisocoriaDirectionSD => '左>右';

  @override
  String get anisocoriaDirectionDS => '右>左';

  @override
  String get anisocoriaSeverityNone => '正常範囲内。';

  @override
  String get anisocoriaSeverityMild => '軽度の差が観察されました。生理的である可能性があります。';

  @override
  String get anisocoriaSeverityModerate => '中等度の非対称。研究観察として記録。';

  @override
  String get anisocoriaSeveritySevere => '顕著な非対称。研究観察として注目。';

  @override
  String get largerPupilEqual => '同等';

  @override
  String get largerPupilOS => 'OS（左）';

  @override
  String get largerPupilOD => 'OD（右）';

  @override
  String get decentrationWithinLimits => '正常範囲内。';

  @override
  String decentrationClinicalNote(String patternName, String offset) {
    return '$patternName。オフセット：$offset%';
  }

  @override
  String get zoneUpperCentral => '上中央';

  @override
  String get zoneUpperNasal => '上鼻側';

  @override
  String get zoneMiddleNasal => '中鼻側';

  @override
  String get zoneLowerNasal => '下鼻側';

  @override
  String get zoneLowerBasal => '下基底';

  @override
  String get zoneLowerTemporal => '下側頭';

  @override
  String get zoneMiddleTemporal => '中側頭';

  @override
  String get zoneUpperTemporal => '上側頭';

  @override
  String get zoneFrontal => '前頭';

  @override
  String get zoneBasal => '基底';

  @override
  String get zoneUnknown => '不明';

  @override
  String flatteningDescription(
      String zone, String clockRange, String percentage) {
    return '平坦化 $zone（$clockRange）- $percentage%';
  }

  @override
  String protrusionDescription(
      String zone, String clockRange, String percentage) {
    return '突出 $zone（$clockRange）- $percentage%';
  }

  @override
  String get usbIriscopeMode => 'USB虹彩スコープモード';

  @override
  String get iriscopeExternal => '虹彩スコープ / 外部';

  @override
  String get usbLabel => 'USB';

  @override
  String get useConnectedUsbCamera => '接続されたUSBカメラまたは虹彩スコープを使用';

  @override
  String get detectedCameras => '検出されたカメラ';

  @override
  String get externalCamera => '外部カメラ';

  @override
  String cameraIndex(int index) {
    return 'カメラ $index';
  }

  @override
  String get noExternalCameraDetected =>
      '外部カメラが検出されませんでした。\nUSB虹彩スコープを接続してください。';

  @override
  String get refresh => '更新';

  @override
  String get selectCameraSource => 'カメラソースを選択';

  @override
  String camerasDetected(int count) {
    return '$count台のカメラを検出';
  }

  @override
  String camerasAvailable(int count) {
    return '$count台のカメラが利用可能';
  }

  @override
  String externalCameraIndex(int index) {
    return '外部カメラ $index';
  }

  @override
  String get qualityGatedRear => '品質制御自動キャプチャ（背面カメラ）';

  @override
  String get qualityGatedFront => '品質制御自動キャプチャ（前面カメラ）';

  @override
  String get usbCameraInfo => 'USBカメラ情報';

  @override
  String get connected => '接続済み';

  @override
  String get waiting => '待機中...';

  @override
  String get disconnected => '切断済み';

  @override
  String get waitingForUsbCamera => 'USBカメラを待機中';

  @override
  String get connectIriscopePrompt =>
      'USB OTGアダプターで虹彩スコープを接続してください。\n求められたら許可を与えてください。';

  @override
  String get usbCameraIssue => 'USBカメラの問題';

  @override
  String get pleaseConnectIriscope => '虹彩スコープまたはUSBカメラを接続してください。';

  @override
  String get retryConnection => '接続を再試行';

  @override
  String get troubleshootingTips => 'トラブルシューティングのヒント';

  @override
  String get tipUsbOtgAdapter => 'USB OTGアダプターが正しく接続されていることを確認';

  @override
  String get tipUsbHostMode => 'デバイスがUSBホストモードをサポートしているか確認';

  @override
  String get tipReconnectCamera => 'カメラを取り外して再接続してみてください';

  @override
  String get tipGrantPermissions => '求められたらUSB権限を許可してください';

  @override
  String get tipUnlockDevice => '一部のデバイスはロック解除が必要です';

  @override
  String get back => '戻る';

  @override
  String get switchEye => '目を切り替え';

  @override
  String get state => '状態';

  @override
  String get status => 'ステータス';

  @override
  String get usingFlutterUvcPlugin =>
      'flutter_uvc_cameraプラグインを使用して\nUSBビデオクラスデバイスをサポート。';

  @override
  String get initialized => '初期化済み';

  @override
  String get notReady => '準備中';

  @override
  String get captureDistanceMatch => '撮影距離の一致';

  @override
  String get irisSize => '虹彩サイズ';

  @override
  String get distanceMatched => '距離一致';

  @override
  String get distanceMismatch => '距離不一致';

  @override
  String get excellentMatch => '優れた一致';

  @override
  String get goodMatch => '良好な一致';

  @override
  String get acceptableMatch => '許容範囲の一致';

  @override
  String get considerRetaking => '距離が一致しません - 再撮影を検討してください';

  @override
  String get qualityReady => '準備完了！そのまま...';

  @override
  String get qualityTooBlurry => 'カメラを安定させてください';

  @override
  String get qualityTooDark => 'もっと光が必要です';

  @override
  String get qualityTooBright => '明るすぎます - 光を減らしてください';

  @override
  String get qualityNoContrast => '照明の角度を調整してください';

  @override
  String get qualityNoPupil => '瞳孔をフレーム内に中央に配置';

  @override
  String get qualityNotCentered => '目を中央に移動';

  @override
  String get qualityNotAnEye => '目が検出されません';

  @override
  String get qualityProcessing => '処理中...';

  @override
  String get distanceMatchedCheck => '✓ 距離一致';

  @override
  String get distanceGoodMatchCheck => '✓ 良好な一致';

  @override
  String get distanceSlightlyBack => '少し後ろへ ↔';

  @override
  String get distanceSlightlyCloser => '少し近づけて ↔';

  @override
  String get distanceAlmostThere => 'もう少し...';

  @override
  String get distanceMoveBack => '後ろへ ←←';

  @override
  String get distanceMoveCloser => '近づけて →→';

  @override
  String get distanceTooClose => '近すぎます！後ろへ';

  @override
  String get distanceTooFar => '遠すぎます！近づけて';

  @override
  String get distanceStabilizing => '安定化中...';

  @override
  String distanceLabel(int percent) {
    return '距離: $percent%';
  }

  @override
  String irisSizeComparison(int odSize, int osSize) {
    return 'OD: ${odSize}px → OS: ${osSize}px';
  }

  @override
  String get frontCameraLabel => 'フロントカメラ';

  @override
  String get rearCameraLabel => '背面カメラ';

  @override
  String get startingCamera => 'カメラを起動中...';

  @override
  String get eyeNotDetected => '目が検出されません';

  @override
  String get tryAgain => '再試行';

  @override
  String get indicatorEye => '目';

  @override
  String get indicatorSharp => '鮮明';

  @override
  String get indicatorLight => '光';

  @override
  String get indicatorFocus => 'フォーカス';

  @override
  String get indicatorPupil => '瞳孔';

  @override
  String get indicatorIris => '虹彩';

  @override
  String get indicatorMatch => '一致';

  @override
  String get checkImageShape => '画像形状';

  @override
  String get checkCircularIris => '円形虹彩';

  @override
  String get checkDarkPupil => '暗い瞳孔';

  @override
  String get checkIrisTexture => '虹彩テクスチャ';

  @override
  String get checkPupilIrisStructure => '瞳孔-虹彩構造';

  @override
  String get checkNaturalColors => '自然な色';

  @override
  String get checkEdgePattern => 'エッジパターン';

  @override
  String get errorImageShapeIncorrect => '画像形状が不正 - 目がフレームを満たすようにしてください';

  @override
  String get errorNoEyeDetected => '目が検出されません - 虹彩をフレーム中央に配置';

  @override
  String get errorNoPupilDetected => '瞳孔が検出されません - 適切な照明を確保';

  @override
  String get errorNoIrisTexture => '虹彩テクスチャなし - 目に近づけてください';

  @override
  String get errorUnusualColors => '異常な色 - 画面/反射を避けてください';

  @override
  String get errorTooManyEdges => '直線エッジが多すぎます - 目ではない可能性';

  @override
  String get errorNotValidEye => '有効な目の画像ではありません - 再試行してください';

  @override
  String get holdStillCapturing => '動かないで - 撮影中...';

  @override
  String get adjustDistanceFirst => 'まず距離を調整';

  @override
  String get stabilizingReading => '安定化中...';

  @override
  String get autoCaptureWhenReady => '準備完了時に自動撮影';

  @override
  String get tapOrWaitAutoCapture => 'タップまたは自動撮影を待つ';

  @override
  String get validatingImage => '検証中...';

  @override
  String get capturingStatus => '撮影中...';

  @override
  String get adjustPositionStatus => '位置を調整';

  @override
  String get validationTip => 'ヒント：適切な照明を確保し、カメラを目から10-15cm離して持ち、反射を避けてください';

  @override
  String get validationChecksTitle => '検証チェック:';

  @override
  String confidenceLabel(int percent) {
    return '信頼度:';
  }

  @override
  String get incompleteData => '不完全なデータ';

  @override
  String get irisDiameterLabel => '虹彩 ø';

  @override
  String get plrResponseCurve => 'PLR反応曲線';

  @override
  String get plrLatency => '潜時';

  @override
  String get plrVelocity => '速度';

  @override
  String get plrRecoveryTime => '回復';

  @override
  String get plrRecoveryRatio => '回復率';

  @override
  String get plrEnhancedMetrics => '拡張PLR指標';

  @override
  String get plrNormalLatency => '正常: 200-500ms';

  @override
  String get plrNormalConstriction => '正常: 10-30%';

  @override
  String get plrNormalVelocity => '正常: 1.5-4.0%/秒';

  @override
  String get plrReferenceValues => '正常PLR参照値';

  @override
  String get plrSubjectInfo => '被験者情報';

  @override
  String get plrTestType => '瞳孔対光反射';

  @override
  String get plrAnalysisSummary => '分析サマリー';

  @override
  String get plrTotalFrames => '分析フレーム総数';

  @override
  String get plrSuccessRate => '成功率';

  @override
  String get plrMaxConstriction => '最大収縮';

  @override
  String get plrResponseCurveLabels => 'PLR Response Curve';

  @override
  String get anwTitle => '自律神経環 (ANW)';

  @override
  String get anwAbnormal => '異常';

  @override
  String get anwDiameter => '直径';

  @override
  String get anwPerimeter => '周囲長';

  @override
  String get anwAsymmetry => '非対称性';

  @override
  String get anwElevated => '上昇';

  @override
  String get anwFormType => '形態タイプ';

  @override
  String get anwRegular => '規則的';

  @override
  String get anwDrawnIn => '収縮';

  @override
  String get anwIndented => '切れ込み';

  @override
  String get anwLacerated => '裂傷状';

  @override
  String get anwSpastic => '痙攣性';

  @override
  String get anwAtonic => '弛緩性';

  @override
  String get anwTonicState => '歴史的トーンパターン';

  @override
  String get anwParasympathotonic => '副交感神経優位パターン';

  @override
  String get anwSympathotonicState => '交感神経優位パターン';

  @override
  String get anwShiftDetected => '歴史的シフトパターン';

  @override
  String get anwConstrictionDetected => '狭窄検出';

  @override
  String get anwFindings => '所見';

  @override
  String get anwRatioComparison => 'ANW比率';

  @override
  String get bilateralANWComparison => '両側ANW比較';

  @override
  String get anwSymmetryNormal => 'ANW対称性は正常範囲内です。';

  @override
  String get anwAsymmetryDetected => '両目間でANW非対称性が検出されました。';

  @override
  String get functionalFrustration => '交感神経系と副交感神経系の相関における機能的フラストレーション。';

  @override
  String get anwParasympathotonicDesc =>
      '歴史的観察では、これを閾値感受性の上昇、反射活動の加速、胃腸の分泌・排泄機能の亢進と関連づけています。';

  @override
  String get anwSympathotonicDesc =>
      '歴史的観察では、これを閾値感受性の低下、反射活動の減速、胃腸の分泌・排泄機能の低下と関連づけています。';

  @override
  String get anwMiddleTemporalShiftCardiac =>
      'Velchoverによる歴史的研究では、これを左心室負荷パターンと心臓ストレスに関連づけています。';

  @override
  String get anwFrontalConstricted => '瞳孔帯の前頭部が狭窄しています。';

  @override
  String get anwBasalConstricted => '瞳孔帯の基底部が狭窄しています。';

  @override
  String get anwFrontalBasalConstricted => '瞳孔帯の前頭部と基底部が狭窄しています。';

  @override
  String get helpTitle => 'ヘルプ＆ユーザーガイド';

  @override
  String get helpTabQuickStart => 'クイックスタート';

  @override
  String get helpTabCnriAnalysis => 'CNRI分析';

  @override
  String get helpTabShortcuts => 'ショートカット';

  @override
  String get helpTabTroubleshooting => 'トラブルシューティング';

  @override
  String get helpOnlineDocs => 'オンラインドキュメント';

  @override
  String get helpContactSupport => 'サポートに連絡';

  @override
  String get helpGettingStarted => 'はじめに';

  @override
  String get helpStep1Title => '虹彩スコープを接続';

  @override
  String get helpStep1Desc => 'Dino-Liteまたは互換性のあるUSB虹彩スコープを接続します。';

  @override
  String get helpStep2Title => '患者情報を入力';

  @override
  String get helpStep2Desc => '患者の名前、年齢、性別、主訴を入力します。';

  @override
  String get helpStep3Title => '右目をキャプチャ (OD)';

  @override
  String get helpStep3Desc => '虹彩スコープを配置し、右目の画像をキャプチャします。';

  @override
  String get helpStep4Title => '左目をキャプチャ (OS)';

  @override
  String get helpStep4Desc => '一定の照明で左目も同様に行います。';

  @override
  String get helpStep5Title => '分析を確認';

  @override
  String get helpStep5Desc => 'アプリがP/I比、瞳孔形状、ANW特性を分析します。';

  @override
  String get helpStep6Title => 'レポートをエクスポート';

  @override
  String get helpStep6Desc => 'PDF、TXT、またはJSON形式で保存します。';

  @override
  String get helpTipBestResults => '最良の結果を得るには：一定の照明を使用し、虹彩スコープの距離を2-3cmに保ちます。';

  @override
  String get helpCnriProtocolFeatures => 'CNRIプロトコル機能';

  @override
  String get helpFeaturePiRatioTitle => '瞳孔/虹彩比 (P/I)';

  @override
  String get helpFeaturePiRatioDesc => '正常：20-30%。範囲外の値は自律神経の不均衡を示す可能性があります。';

  @override
  String get helpFeaturePupilFormTitle => '瞳孔形状分析';

  @override
  String get helpFeaturePupilFormDesc => '楕円パターン、偏心方向、離心率を検出します。';

  @override
  String get helpFeatureAnwTitle => 'ANW（襟巻）評価';

  @override
  String get helpFeatureAnwDesc => '比率、形状の規則性、セクター移動、緊張状態を分析します。';

  @override
  String get helpFeatureZoneTitle => 'ゾーン分析';

  @override
  String get helpFeatureZoneDesc => '扁平化/突出をCNRI臓器ゾーンにマッピングします。';

  @override
  String get helpFeatureBilateralTitle => '両側比較';

  @override
  String get helpFeatureBilateralDesc => 'ODとOSを比較して非対称性を検出します。';

  @override
  String get helpFeatureMlTitle => 'ONNX CNN比較';

  @override
  String get helpFeatureMlDesc => 'ONNX CNNモデルが比較用の補助測定値を提供します。';

  @override
  String get helpKeyboardShortcuts => 'キーボードショートカット';

  @override
  String get helpCameraControls => 'カメラ操作';

  @override
  String get helpShortcutSpace => '画像をキャプチャ';

  @override
  String get helpShortcutCtrlS => 'PDFレポートを保存';

  @override
  String get helpShortcutCtrlO => 'ギャラリー画像を開く';

  @override
  String get helpShortcutCtrlH => 'スキャン履歴を表示';

  @override
  String get helpShortcutF11 => 'フルスクリーン切替';

  @override
  String get helpShortcutEsc => '戻る / キャンセル';

  @override
  String get helpShortcutScroll => 'ズームイン/アウト';

  @override
  String get helpShortcutDoubleClick => 'ズームをリセット';

  @override
  String get helpCommonIssues => 'よくある問題';

  @override
  String get helpIssueCameraNotDetected => 'カメラが検出されない';

  @override
  String get helpIssueCameraSolution1 => 'USB接続を確認';

  @override
  String get helpIssueCameraSolution2 => '別のUSBポートを試す';

  @override
  String get helpIssueCameraSolution3 => 'Dino-Liteドライバをインストール';

  @override
  String get helpIssueCameraSolution4 => 'アプリケーションを再起動';

  @override
  String get helpIssuePupilDetectionFails => '瞳孔検出に失敗';

  @override
  String get helpIssuePupilSolution1 => '十分な照明を確保';

  @override
  String get helpIssuePupilSolution2 => 'フレーム内に瞳孔を中央配置';

  @override
  String get helpIssuePupilSolution3 => '虹彩スコープレンズを清掃';

  @override
  String get helpIssuePupilSolution4 => '手動でフォーカスを調整';

  @override
  String get helpIssuePdfExportFails => 'PDFエクスポートに失敗';

  @override
  String get helpIssuePdfSolution1 => 'フォルダ権限を確認';

  @override
  String get helpIssuePdfSolution2 => 'ディスク空き容量を確保';

  @override
  String get helpIssuePdfSolution3 => '開いているPDFファイルを閉じる';

  @override
  String get helpIssuePdfSolution4 => 'まずTXTエクスポートを試す';

  @override
  String get helpCaptureChecklistTitle => '撮影チェックリスト';

  @override
  String get helpCaptureChecklist1 => '瞳孔が中央にあり、フレーム内で完全に見えていることを確認します。';

  @override
  String get helpCaptureChecklist2 => '均一な照明を使い、角膜上のまぶしさや反射を減らします。';

  @override
  String get helpCaptureChecklist3 => '右眼と左眼でアイリスコープ距離をできるだけ揃えます。';

  @override
  String get helpCaptureChecklist4 => '瞳孔縁がぼやけて見える場合は再フォーカスまたは再撮影します。';

  @override
  String get helpExportSettingsTitle => 'エクスポート設定';

  @override
  String get helpExportSettingsDesc =>
      'PDF自動保存は解析後にレポートを保存でき、画像を含めるはPDF内の眼画像を制御し、ONNX CNN比較は比較値をレポートに追加します。';

  @override
  String get helpHybridScoreTitle => 'ハイブリッド信頼度とグレード';

  @override
  String get helpHybridScoreDesc =>
      '表示される信頼度とグレードは古典的幾何品質とML一致度を組み合わせたもので、診断ではなく測定信頼性を示します。';

  @override
  String get helpAnomalyGuideTitle => '扁平化と突出の見方';

  @override
  String get helpAnomalyGuideDesc =>
      '扁平化は瞳孔境界の相対的な内向き変化、突出は外向き変化を示します。各カードにはゾーン、程度、対応づけられた関連情報が表示されます。';

  @override
  String get helpZoneOverlayGuideTitle => 'ゾーンオーバーレイ';

  @override
  String get helpZoneOverlayGuideDesc =>
      'ゾーンオーバーレイを使うと、瞳孔と虹彩の周囲で検出された異常がどのセクターに位置するかを視覚的に確認できます。';

  @override
  String get helpContactSupportTip => 'サポートはhelpdesk@cnri.eduまでお問い合わせください。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsCameraIriscope => 'カメラ / 虹彩スコープ';

  @override
  String get settingsPreferredCamera => '優先カメラ：';

  @override
  String get settingsCameraDinoLite => 'Dino-Lite';

  @override
  String get settingsCameraUsb => 'USBカメラ';

  @override
  String get settingsCameraAutoDetect => '自動検出';

  @override
  String get settingsDefaultZoom => 'デフォルトズーム：';

  @override
  String get settingsAnalysis => '分析';

  @override
  String get settingsShowMlComparison => 'ML比較を表示';

  @override
  String get settingsShowZoneOverlay => 'ゾーンオーバーレイを表示';

  @override
  String get settingsExportReports => 'エクスポートとレポート';

  @override
  String get settingsAutoSavePdf => 'PDF自動保存';

  @override
  String get settingsIncludeImages => '画像を含める';

  @override
  String get settingsSaved => '設定が保存されました';

  @override
  String get aboutResearchEdition => '研究版';

  @override
  String aboutVersion(String version) {
    return 'バージョン $version';
  }

  @override
  String get aboutLicense => 'ライセンス';

  @override
  String get aboutLicensedTo => 'ライセンス先：';

  @override
  String get aboutExpires => '有効期限：';

  @override
  String get aboutManageLicense => 'ライセンス管理';

  @override
  String get aboutBasedOnCnri => 'CNRIプロトコルに基づく';

  @override
  String get aboutCopyright => '© 2024-2026 PupilMetrics Research';

  @override
  String get aboutWebsite => 'ウェブサイト';

  @override
  String get aboutPrivacy => 'プライバシー';

  @override
  String get languageSelectTitle => '言語を選択';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get languageChanged => '言語が変更されました';

  @override
  String languageChangedMessage(String language) {
    return 'アプリの言語が$languageに設定されました';
  }

  @override
  String get languageSystemNotAvailable => '言語システムが利用できません';

  @override
  String get licenseLoading => '読み込み中...';

  @override
  String get licenseWelcome => 'PupilMetricsへようこそ！';

  @override
  String get licenseTrialFeatures => '14日間無料トライアル・全機能';

  @override
  String get licenseStartTrial => '無料トライアルを開始';

  @override
  String get licenseEnterKey => 'ライセンスを入力';

  @override
  String get licenseFreeTrial => '無料トライアル';

  @override
  String licenseDaysRemaining(int count) {
    return '残り$count日';
  }

  @override
  String get licenseTrialEnded => 'トライアル終了';

  @override
  String get licenseEnterToContinue => '続行するにはライセンスを入力してください';

  @override
  String get licenseStandard => 'スタンダードライセンス';

  @override
  String get licenseProfessional => 'プロフェッショナルライセンス';

  @override
  String get licenseEnterprise => 'エンタープライズライセンス';

  @override
  String get licenseLicensed => 'ライセンス済み';

  @override
  String get licenseActive => 'アクティブ';

  @override
  String get licenseTrialUser => 'トライアルユーザー';

  @override
  String get licenseLifetime => '永久';

  @override
  String get licenseNotSetUp => '未設定';

  @override
  String get trialExpiredTitle => 'トライアル期間終了';

  @override
  String get trialExpiredMessage =>
      '14日間のトライアルが終了しました。虹彩画像の分析を続けるには、ライセンスをご購入ください。';

  @override
  String get trialExpiredCanStill => '引き続き可能な操作：';

  @override
  String get trialExpiredViewAnalyses => '以前の分析を表示';

  @override
  String get trialExpiredExportReports => '既存のレポートをエクスポート';

  @override
  String get trialExpiredAccessHistory => 'スキャン履歴にアクセス';

  @override
  String get trialExpiredMaybeLater => '後で';

  @override
  String get licenseRegistration => 'ライセンス登録';

  @override
  String get licenseStatusValid => 'ライセンス済み';

  @override
  String get licenseStatusTrialActive => '無料トライアル';

  @override
  String get licenseStatusTrialExpired => 'トライアル終了';

  @override
  String get licenseStatusExpired => 'ライセンス期限切れ';

  @override
  String get licenseStatusInvalid => '無効なライセンス';

  @override
  String get licenseStatusUnregistered => '未設定';

  @override
  String get licenseStatusMachineMismatch => '別のコンピュータ';

  @override
  String get licenseStatusNetworkError => '接続エラー';

  @override
  String get licenseEnterKeyTitle => 'ライセンスキーを入力';

  @override
  String get licenseKeyPlaceholder => 'CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseYourName => 'お名前';

  @override
  String get licenseEmailAddress => 'メールアドレス';

  @override
  String get licenseMachineId => 'マシンID';

  @override
  String get licenseCopyMachineId => 'マシンIDをコピー';

  @override
  String get licenseMachineIdCopied => 'マシンIDがクリップボードにコピーされました';

  @override
  String get licenseValidationKeyRequired => 'ライセンスキーを入力してください';

  @override
  String get licenseValidationKeyFormat =>
      'キーは20文字である必要があります（CNRI-XXXX-XXXX-XXXX-XXXX）';

  @override
  String get licenseValidationNameRequired => 'お名前を入力してください';

  @override
  String get licenseValidationEmailRequired => 'メールアドレスを入力してください';

  @override
  String get licenseValidationEmailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get licenseActivate => 'ライセンスを有効化';

  @override
  String get licenseContinueTrial => 'トライアルを続行';

  @override
  String get licenseBuyLicense => 'ライセンスを購入';

  @override
  String get licenseNeedHelp => 'ヘルプが必要ですか？';

  @override
  String get licenseLicenseAgreement => 'ライセンス契約';

  @override
  String get licenseActivatedSuccess => 'ライセンスが正常に有効化されました！';

  @override
  String get licenseMsgMachineMismatch =>
      'このライセンスは別のコンピュータに登録されています。元のデバイスを使用するか、サポートにお問い合わせください。';

  @override
  String get licenseMsgTrialEnded =>
      '無料トライアルが終了しました。すべての機能を引き続き使用するには、ライセンスキーを入力してください。';

  @override
  String get licenseMsgExpired => 'ライセンスの有効期限が切れました。続行するには更新してください。';

  @override
  String get licenseMsgNeedsSetup =>
      'ライセンスの設定が必要です。無料トライアルを開始するか、ライセンスキーを入力してください。';

  @override
  String get licenseMsgCheckFormat =>
      'キーの形式を確認してください。次のようになります：CNRI-XXXX-XXXX-XXXX-XXXX';

  @override
  String get licenseMsgNotRecognized => 'このライセンスキーは認識されませんでした。再確認してやり直してください。';

  @override
  String get licenseMsgAlreadyRegistered => 'このキーは既に別のコンピュータに登録されています。';

  @override
  String get licenseMsgContactSupport =>
      'このライセンスは期限切れです。更新についてはサポートにお問い合わせください。';

  @override
  String get licenseMsgActivatedThankYou => 'ライセンスが正常に有効化されました！ご購入ありがとうございます。';

  @override
  String get licenseMsgUnableToActivate =>
      'ライセンスを有効化できませんでした。インターネット接続を確認して、再試行してください。';

  @override
  String licenseMsgTrialWelcome(int days) {
    return 'ようこそ！$days日間の無料トライアルが開始されました。';
  }

  @override
  String licenseMsgTrialActive(int days) {
    return 'トライアル有効：残り$days日。';
  }

  @override
  String get licenseMsgFreeTrialActive => '無料トライアル有効';

  @override
  String licenseMsgLicenseActive(String type) {
    return 'ライセンス有効 - $type';
  }

  @override
  String get licenseMsgUnableToActivateKey => 'このライセンスキーを有効化できませんでした。';

  @override
  String get licenseMsgNoLongerValid => 'ライセンスは無効になりました。';

  @override
  String get licenseMsgUnableToVerify =>
      'このライセンスキーを確認できませんでした。サポートにお問い合わせください。';

  @override
  String get trialStartedSnackbar => 'トライアル開始！';

  @override
  String get trialStartedMessage => '14日間のフルアクセスをお楽しみください';

  @override
  String get windowTitle => 'PupilMetrics';

  @override
  String get themeMode => 'テーマモード';

  @override
  String get methods => 'メソッド';

  @override
  String get setAsFrameless => 'setAsFrameless';

  @override
  String get isPreventCloseSetPreventClose =>
      'isPreventClose / setPreventClose';

  @override
  String get focusBlur => 'フォーカス / ぼかし';

  @override
  String get showHide => '表示 / 非表示';

  @override
  String get isVisible => 'isVisible';

  @override
  String get isMaximized => 'isMaximized';

  @override
  String get maximizeUnmaximize => '最大化 / 元に戻す';

  @override
  String get isMinimized => 'isMinimized';

  @override
  String get minimizeRestore => '最小化 / 元に戻す';

  @override
  String get dockUndock => 'ドッキング / ドッキング解除';

  @override
  String get dockLeft => '左にドッキング';

  @override
  String get dockRight => '右にドッキング';

  @override
  String get undock => 'ドッキング解除';

  @override
  String get isFullScreenSetFullScreen => 'isFullScreen / setFullScreen';

  @override
  String get setAspectRatio => 'setAspectRatio';

  @override
  String get reset => 'リセット';

  @override
  String get setBackgroundColor => 'setBackgroundColor';

  @override
  String get transparent => '透明';

  @override
  String get red => '赤';

  @override
  String get green => '緑';

  @override
  String get blue => '青';

  @override
  String get setBoundsGetBounds => 'setBounds / getBounds';

  @override
  String get setAlignment => 'setAlignment';

  @override
  String get topLeft => '左上';

  @override
  String get topCenter => '上中央';

  @override
  String get topRight => '右上';

  @override
  String get centerLeft => '左中央';

  @override
  String get centerRight => '右中央';

  @override
  String get bottomLeft => '左下';

  @override
  String get bottomCenter => '下中央';

  @override
  String get bottomRight => '右下';

  @override
  String get getPositionSetPosition => 'getPosition / setPosition';

  @override
  String get getSizeSetSize => 'getSize / setSize';

  @override
  String get set => '設定';

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
  String get hidden => '非表示';

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
  String get defaultIcon => 'デフォルト';

  @override
  String get original => 'オリジナル';

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
  String get dragToMoveArea => 'ドラッグして移動';

  @override
  String get dragToResizeArea => 'ドラッグしてサイズ変更';

  @override
  String get dragToResizeAreaExample => 'サイズ変更エリアの例';

  @override
  String get closeWindowConfirmation => 'このウィンドウを閉じてもよろしいですか？';

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
  String get plrReportTitle => 'PLR分析レポート';

  @override
  String get plrResearchOnlyTitle => '研究・教育目的のみ';

  @override
  String get plrResearchDisclaimer => '結果は医学的診断ではありません。医療専門家に相談してください。';

  @override
  String get plrNameLabel => '氏名';

  @override
  String plrAgeYears(int age) {
    return '年齢: $age歳';
  }

  @override
  String get plrTestLabel => '検査';

  @override
  String get plrSummaryTitle => 'PLRサマリー';

  @override
  String plrGradeValue(String grade) {
    return 'グレード $grade';
  }

  @override
  String get plrStatusLabel => '状態';

  @override
  String get plrDetectedStatus => 'PLR検出';

  @override
  String get plrWeakNotDetectedStatus => '弱い/未検出';

  @override
  String get plrRecoveryTimeLabel => '回復時間';

  @override
  String get plrRecoveryRatioLabel => '回復率';

  @override
  String get plrChartDescription => '時間経過に伴う瞳孔反応の視覚表示';

  @override
  String plrPiRange(String min, String max) {
    return 'P/I範囲: $min% - $max%';
  }

  @override
  String plrMinValue(String value) {
    return '最小: $value%';
  }

  @override
  String get plrFrameDataTitle => 'フレームデータ';

  @override
  String get plrTableTime => '時間';

  @override
  String get plrTablePiPercent => 'P/I %';

  @override
  String get plrTablePhase => 'フェーズ';

  @override
  String get plrTableConfidenceShort => '信頼';

  @override
  String plrSuccessfulFailed(int success, int fail) {
    return '成功: $success | 失敗: $fail';
  }

  @override
  String get plrReferenceLatencyLine => '• 潜時: 200-500ms（初期反応までの時間）';

  @override
  String get plrReferenceConstrictionLine => '• 縮瞳: 基準値から10-30%の低下';

  @override
  String get plrReferenceVelocityLine => '• 速度: 1.5-4.0%/秒';

  @override
  String get plrReferenceRecoveryLine => '• 回復: 5秒以内に基準値へ75%以上回復';

  @override
  String get plrReferenceRecoveryLineShort => '• 回復: 5秒以内に基準値へ75%以上回復';

  @override
  String plrShareSubject(String eye) {
    return 'PLR分析レポート - $eye';
  }

  @override
  String get plrTextReportTitle => 'PLR動画分析レポート';

  @override
  String get plrTextDisclaimerTitle => '免責事項: 研究・教育目的のみ';

  @override
  String get plrTextDisclaimerBody => '結果は医学的診断ではありません。';

  @override
  String get plrOverallGradeLabel => '総合評価';

  @override
  String get plrEndOfReport => 'レポート終了';

  @override
  String get zoneOverlay => 'ゾーンオーバーレイ';

  @override
  String get tipDragImage => 'ヒント：画像をドラッグして角膜輪部をオーバーレイの円に合わせてください。';

  @override
  String get overlayMetrics => 'オーバーレイ指標';

  @override
  String get piRatioLabel => 'P/I比:';

  @override
  String get ellipsenessLabel => '楕円度:';

  @override
  String get decentralizationLabel => '偏心度:';

  @override
  String get detectedFindings => '検出された所見';

  @override
  String get anwCollarette => 'ANW / コラレット';

  @override
  String get observerNotes => '観察者メモ';

  @override
  String get observerNotesHint => '臨床観察、ゾーン所見、パターンを入力…';

  @override
  String get autoCenter => '自動中心合わせ';

  @override
  String get anwRing => 'ANWリング';

  @override
  String get axisGrid => '軸/グリッド';

  @override
  String get chart => 'チャート';

  @override
  String get hoverToIdentify => 'ゾーンにカーソルを合わせてタップすると特定できます';

  @override
  String get organsMode => '臓器モード — 虹彩上でホバーしてゾーンを特定';

  @override
  String get mildSizeDiff => '軽度のサイズ差。生理的な変動の可能性があります。';

  @override
  String withinBaseline(Object age, Object group) {
    return '年齢$age（$group）の研究基準値内';
  }

  @override
  String get formLabel => '形態:';

  @override
  String get flatteningLabel => '扁平化:';

  @override
  String get protrusionLabel => '突出:';

  @override
  String get decentrationLabel => '偏心:';

  @override
  String get pupilSizeLabel => '瞳孔径:';

  @override
  String get anwRatioLabel => 'ANW比:';

  @override
  String get anwToneLabel => 'ANWトーヌス:';

  @override
  String get noMajorODAnomalies => 'OD瞳孔に主要な異常なし。';

  @override
  String get noMajorOSAnomalies => 'OS瞳孔に主要な異常なし。';

  @override
  String get anwNotAssessed => 'ANW：未評価';

  @override
  String get manualAlignmentAid => 'レビュー専用の手動位置合わせ補助。画像をドラッグまたは自動中心合わせを使用。';

  @override
  String get frontalShift => 'S: 前頭シフトパターン。';

  @override
  String get cerebralCirculation => 'Velchoverによる歴史的研究では、これを脳循環パターンに関連づけています。';

  @override
  String get middleTemporalShift => 'D: 中側頭シフトパターン。';

  @override
  String get respiratoryCardiac =>
      'Velchoverによる歴史的研究では、これを呼吸器および心臓の自律神経パターンに関連づけています。';

  @override
  String get findings => '所見：';

  @override
  String get analysisReportTitle => '瞳孔分析レポート';

  @override
  String get reportResearchVersion => '研究版';

  @override
  String get reportDisclaimerTitle => '免責事項: 研究・教育目的のみ';

  @override
  String get reportDisclaimerBody => '結果は研究観察であり、医学的診断ではありません。';

  @override
  String get reportPersonInformationTitle => '被験者情報';

  @override
  String get reportAgeGroupLabel => '年齢群';

  @override
  String get reportPupilSizeComparisonTitle => '瞳孔サイズ比較';

  @override
  String get reportCaptureDistanceMetricsTitle => '撮影距離メトリクス';

  @override
  String get reportResearchObservationsTitle => '研究所見';

  @override
  String get reportObserverNotesZoneOverlayTitle => '観察メモ（ゾーンオーバーレイ）';

  @override
  String get reportEndOfReport => 'レポート終了';

  @override
  String get reportGradeLabel => 'グレード';

  @override
  String get reportPupilFormTitle => '瞳孔形状';

  @override
  String get reportDecentrationTitle => '偏心';

  @override
  String get reportFlatteningsTitle => '扁平化';

  @override
  String get reportProtrusionsTitle => '突出';

  @override
  String get reportAnwParametersTitle => '自律神経輪（ANW）';

  @override
  String get reportTonicStateLabel => '歴史的トーンパターン';

  @override
  String get reportShiftDetectedTitle => '歴史的シフトパターン';

  @override
  String get reportClinicalLabel => '歴史的注記';

  @override
  String get reportConstrictionDetectedTitle => '収縮検出';

  @override
  String get reportSeverityLabel => '重症度';

  @override
  String get reportReferenceValuesTitle => '基準値（CNRI研究プロトコル）';

  @override
  String get reportMatchLabel => '一致';

  @override
  String get reportValueLabel => '値';

  @override
  String get reportNormalPupilForm => '正常な瞳孔形状';

  @override
  String reportPageXofY(int page, int total) {
    return '$page/$totalページ';
  }

  @override
  String reportShareSubject(String patientName) {
    return '瞳孔分析レポート - $patientName';
  }

  @override
  String reportShareBody(String patientName, String date) {
    return '$patientName の瞳孔分析レポートを添付します。作成日時: $date';
  }

  @override
  String belowBaseline(int age, String group) {
    return '年齢 $age（$group）の研究基準より低い';
  }

  @override
  String aboveBaseline(int age, String group) {
    return '年齢 $age（$group）の研究基準より高い';
  }

  @override
  String get ageGroupInfant => '乳児';

  @override
  String get ageGroupChild15 => '小児 (1-5)';

  @override
  String get ageGroupChild611 => '小児 (6-11)';

  @override
  String get ageGroupTeen => '10代';

  @override
  String get ageGroupAdult2039 => '成人 (20-39)';

  @override
  String get ageGroupAdult4059 => '成人 (40-59)';

  @override
  String get ageGroupSenior60Plus => '高齢者 (60+)';

  @override
  String get middleNasalShift => '中鼻側シフトパターン。';

  @override
  String get upperTemporalShift => '上側頭シフトパターン。';

  @override
  String get lowerTemporalShift => '下側頭シフトパターン。';

  @override
  String get basalShift => '基底シフトパターン。';

  @override
  String get vagusStellateAssociation =>
      'Velchoverによる歴史的研究では、これを迷走神経または星状神経節の機能低下パターンに関連づけています。';

  @override
  String get venaCavaInferiorAssociation =>
      'Velchoverによる歴史的研究では、これを下大静脈の血行動態障害パターンに関連づけています。';

  @override
  String get vertebralArteryAssociation =>
      'Velchoverによる歴史的研究では、これを椎骨動脈循環パターンに関連づけています。';

  @override
  String get smallPelvisAssociation =>
      'Velchoverによる歴史的研究では、これを小骨盤のうっ血パターンに関連づけています。';

  @override
  String get openZoneOverlay => 'ゾーンオーバーレイを開く';

  @override
  String get iris => '虹彩';

  @override
  String get chartOpacity => 'チャートの不透明度';

  @override
  String get irisSizeNotAvailable => '虹彩サイズデータが利用できません';

  @override
  String get ratio => '比率';

  @override
  String get reportRefPiRatio => '瞳孔/虹彩比: 正常 20-30%';

  @override
  String get reportRefEllipseness => '楕円度: 正常 >95%';

  @override
  String get reportRefDecentralization => '脱中心: 正常 <5%';

  @override
  String get reportRefPupilSizeDiff => '瞳孔サイズ差: <2% 正常, 2-4% 軽度, >4% 重要';

  @override
  String get enterPatientInfoAnalysis => '患者情報を入力 → 分析';

  @override
  String get chooseCaptureMethod => '撮影方法を選択：';

  @override
  String get usbCamera => 'USBカメラ';

  @override
  String get selectExistingImage => '既存の画像を選択';

  @override
  String get detectingCameras => 'カメラを検出中...';

  @override
  String get retryDetection => '検出を再試行';

  @override
  String get connectUvcCameraViaUsb => 'UVCカメラをUSBで接続';

  @override
  String get ensureCameraDriversInstalled => 'カメラドライバーがインストールされていることを確認';

  @override
  String get tapRefreshToDetect => '更新をタップしてカメラを検出';

  @override
  String get connectUsbCameraToBegin => 'USBカメラを接続して開始';

  @override
  String get noExternalCameraTitle => '外部カメラが検出されません';

  @override
  String get connectUsbIriscopeEnsurePlugged =>
      'USBアイリスコープを接続し、接続されていることを確認してください';

  @override
  String get languagesAvailable => '利用可能な言語';

  @override
  String get validationChecks => 'バリデーションチェック：';

  @override
  String get eyeQualityTip => 'ヒント：適切な照明を確保し、目を安定させてください';

  @override
  String get validatingEye => '目を検証中...';

  @override
  String get initializing => '初期化中...';

  @override
  String get nameLabel => '名前：';

  @override
  String get ageLabel => '年齢：';

  @override
  String get typeLabel => 'タイプ：';

  @override
  String get pleaseEnterName => '名前を入力してください';

  @override
  String get pleaseEnterAge => '年齢を入力してください';

  @override
  String get ageMustBe2Digits => '年齢は1桁または2桁である必要があります';

  @override
  String get optional => '（任意）';

  @override
  String get bilateralBothHands => '両手の両側使用';
}
