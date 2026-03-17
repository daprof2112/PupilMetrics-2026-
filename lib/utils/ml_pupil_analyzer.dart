import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:onnxruntime_v2/onnxruntime_v2.dart';
/// import 'package:onnxruntime/onnxruntime.dart';

/// ML-based iris analysis using ONNX Runtime
/// Replaces classical CV algorithm for deterministic, accurate results
class MLPupilAnalyzer {
  static final MLPupilAnalyzer _instance = MLPupilAnalyzer._internal();
  factory MLPupilAnalyzer() => _instance;
  MLPupilAnalyzer._internal();

  OrtSession? _session;
  bool _isInitialized = false;

  // Model input dimensions
  static const int inputSize = 224;
  static const int channels = 3;

  // ImageNet normalization values (used during training)
  static const List<double> mean = [0.485, 0.456, 0.406];
  static const List<double> std = [0.229, 0.224, 0.225];

  // Output indices — corrected to match cnri_model_metadata.json v6.0.0
  static const int OUTPUT_PI_RATIO = 0;           // PI ratio (scale 50.0)
  static const int OUTPUT_ELLIPSENESS = 1;        // Ellipseness (scale 100.0) — was wrongly index 2
  static const int OUTPUT_DECENTRATION = 2;       // Decentration magnitude (scale 100.0) — was wrongly index 1
  static const int OUTPUT_DECENTRATION_ANGLE = 3; // Decentration direction 0–360° (scale 360.0) — was mislabelled ANISOCORIA

  /// Initialize ONNX Runtime and load model
  Future<bool> initialize() async {
    if (_isInitialized) return true;

    try {
      // Initialize ONNX Runtime environment
      OrtEnv.instance.init();

      // Create session options
      final sessionOptions = OrtSessionOptions();

      // Load model from assets
      final rawAssetFile = await rootBundle.load('assets/ml/cnri_model.onnx');
      final bytes = rawAssetFile.buffer.asUint8List();

      // Create session from model bytes
      _session = OrtSession.fromBuffer(bytes, sessionOptions);

      _isInitialized = true;
      print('✓ ML Model loaded successfully');
      print('  Input names: ${_session!.inputNames}');
      print('  Output names: ${_session!.outputNames}');

      return true;
    } catch (e) {
      print('✗ Failed to initialize ML model: $e');
      _isInitialized = false;
      return false;
    }
  }

  /// Check if model is ready
  bool get isReady => _isInitialized && _session != null;

  /// Analyze iris image and return detected parameters
  /// Signature matches existing analysis_screen.dart calls
  Future<MLAnalysisResult> analyze(
      Uint8List imageBytes, {
        required String eye,
        double threshold = 0.5,
      }) async {
    final isLeftEye = eye == 'OS';
    return analyzeIris(imageBytes: imageBytes, isLeftEye: isLeftEye, threshold: threshold);
  }

  /// Analyze iris image and return detected parameters
  Future<MLAnalysisResult> analyzeIris({
    required Uint8List imageBytes,
    required bool isLeftEye,
    double threshold = 0.5,
  }) async {
    if (!isReady) {
      throw Exception('ML Model not initialized. Call initialize() first.');
    }

    try {
      // Decode and preprocess image
      final inputTensor = await _preprocessImage(imageBytes);

      // Create ONNX input tensor
      final inputOrt = OrtValueTensor.createTensorWithDataList(
        inputTensor,
        [1, channels, inputSize, inputSize],
      );

      // Get input name from model
      final inputName = _session!.inputNames.first;
      final inputs = <String, OrtValue>{inputName: inputOrt};

      // Run inference - v1.4.1 API: runAsync(runOptions, inputs)
      final runOptions = OrtRunOptions();
      final outputs = await _session!.runAsync(runOptions, inputs);

      // Process outputs - v1.4.1 returns List<OrtValue?>
      final outputData = outputs?[0]?.value;

      // Release resources
      inputOrt.release();
      runOptions.release();
      if (outputs != null) {
        for (final output in outputs) {
          output?.release();
        }
      }

      if (outputData == null) {
        throw Exception('Model returned null output');
      }

      // Parse predictions
      final predictions = _parseOutput(outputData, threshold, isLeftEye);

      return predictions;
    } catch (e) {
      print('Analysis error: $e');
      rethrow;
    }
  }

  /// Preprocess image for model input
  Future<Float32List> _preprocessImage(Uint8List imageBytes) async {
    // Decode image
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception('Failed to decode image');
    }

    // Resize to model input size
    image = img.copyResize(image, width: inputSize, height: inputSize);

    // Create tensor in NCHW format (channels first)
    final tensorSize = channels * inputSize * inputSize;
    final Float32List tensor = Float32List(tensorSize);

    int pixelIndex = 0;
    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = image.getPixel(x, y);

        // Get RGB values normalized to 0-1
        final r = pixel.r / 255.0;
        final g = pixel.g / 255.0;
        final b = pixel.b / 255.0;

        // Apply ImageNet normalization and store in CHW format
        tensor[0 * inputSize * inputSize + pixelIndex] = ((r - mean[0]) / std[0]);
        tensor[1 * inputSize * inputSize + pixelIndex] = ((g - mean[1]) / std[1]);
        tensor[2 * inputSize * inputSize + pixelIndex] = ((b - mean[2]) / std[2]);

        pixelIndex++;
      }
    }

    return tensor;
  }

  /// Parse model output into structured result (4 regression values)
  MLAnalysisResult _parseOutput(dynamic outputData, double threshold, bool isLeftEye) {
    List<double> values;

    if (outputData is List<List<double>>) {
      values = outputData[0];
    } else if (outputData is List<double>) {
      values = outputData;
    } else if (outputData is Float32List) {
      values = outputData.toList();
    } else if (outputData is List) {
      var data = outputData;
      while (data is List && data.isNotEmpty && data[0] is List) {
        data = data[0];
      }
      values = (data as List).map((e) => (e as num).toDouble()).toList();
    } else {
      throw Exception('Unexpected output format: ${outputData.runtimeType}');
    }

    // DEBUG: Print raw model outputs
    // print('🔬 ML Raw outputs: $values');

    // Extract the 4 regression values (corrected index mapping)
    final rawPiRatio          = values.length > OUTPUT_PI_RATIO          ? values[OUTPUT_PI_RATIO]          : 0.0;
    final rawEllipseness      = values.length > OUTPUT_ELLIPSENESS      ? values[OUTPUT_ELLIPSENESS]      : 0.0;
    final rawDecentration     = values.length > OUTPUT_DECENTRATION     ? values[OUTPUT_DECENTRATION]     : 0.0;
    final rawDecentrationAngle = values.length > OUTPUT_DECENTRATION_ANGLE ? values[OUTPUT_DECENTRATION_ANGLE] : 0.0;

    // print('🔬 Raw values: PI=$rawPiRatio, Ellip=$rawEllipseness, Dec=$rawDecentration, DecAngle=$rawDecentrationAngle');

    // =======================================================================
    // CALIBRATION — derived from linear regression over 712 eyes / 356 Bexel cases
    // (calibrate_onnx.py, bexel_envi/Scripts)
    //
    // Index 0 (PI ratio):      R²=0.856  MAE=1.17% — model is well-trained
    // Index 1 (ellipseness):   R²=0.004  MAE=2.69% — model outputs near-constant ~94%
    // Index 2 (decentration):  R²=0.003  MAE=2.01% — model outputs near-constant ~6.5%
    // Index 3 (dec. angle):    raw is negative/unbounded — not a valid bearing
    //
    // PRACTICAL CONCLUSION: Only PI ratio is reliable from this ONNX model.
    // Ellipseness and decentration are reported for completeness but the classical
    // CV pipeline values should be preferred for clinical decisions on those two.
    // =======================================================================

    // PI Ratio — calibrated linear fit (scale=11.835, offset=24.529)
    const double piScale  = 11.835412;
    const double piOffset = 24.528659;
    final double piRatio  = rawPiRatio * piScale + piOffset;

    // Ellipseness — calibrated but low R² (0.004); outputs ~91.7–94.5% regardless of input
    const double ellipScale  = 0.609340;
    const double ellipOffset = 91.728502;
    final double ellipseness = rawEllipseness * ellipScale + ellipOffset;

    // Decentration — calibrated but low R² (0.003); outputs ~6.0–6.8% regardless of input
    const double decScale  = 0.179778;
    const double decOffset = 6.796942;
    final double decentration = rawDecentration * decScale + decOffset;

    // Decentration angle — raw is negative/unbounded; no ground truth exists.
    // Stored for future use when model is retrained with angle labels.
    final double decentrationAngle = _sigmoid(rawDecentrationAngle) * 360.0;

    // print('ML: PI=$piRatio%, Ellip=$ellipseness%, Dec=$decentration%, Angle=$decentrationAngle°');

    return MLAnalysisResult(
      isLeftEye: isLeftEye,
      piRatio: piRatio.clamp(10.0, 50.0),
      ellipseness: ellipseness.clamp(80.0, 100.0),
      decentration: decentration.clamp(0.0, 25.0),
      decentrationAngle: decentrationAngle,
      threshold: threshold,
    );
  }

  double _sigmoid(double x) => 1.0 / (1.0 + math.exp(-x));

  void dispose() {
    _session?.release();
    _session = null;
    _isInitialized = false;
    OrtEnv.instance.release();
  }
}

/// Structured result from ML analysis (4 regression values)
class MLAnalysisResult {
  final bool isLeftEye;
  final double piRatio;           // Pupil-Iris ratio percentage (index 0)
  final double ellipseness;       // Ellipseness percentage — 100 = perfect circle (index 1)
  final double decentration;      // Decentration magnitude % (index 2)
  final double decentrationAngle; // Decentration direction 0–360° (index 3)
  final double threshold;

  MLAnalysisResult({
    required this.isLeftEye,
    required this.piRatio,
    required this.ellipseness,
    required this.decentration,
    required this.decentrationAngle,
    required this.threshold,
  });

  /// Pupil-to-iris ratio (for compatibility with existing UI)
  double get pupilIrisRatio => piRatio;

  /// Check if significant decentration detected
  bool get hasDecentration => decentration > 10.0;

  /// Check if oval deformation (low ellipseness)
  bool get hasOvalDeformation => ellipseness < 90.0;

  /// Get oval type based on ellipseness
  String? get ovalType {
    if (ellipseness >= 95.0) return null;
    if (ellipseness >= 90.0) return 'mild';
    return 'significant';
  }

  bool get hasFindings => hasDecentration || hasOvalDeformation;

  String get summary {
    final findings = <String>[];
    findings.add('PI Ratio: ${piRatio.toStringAsFixed(1)}%');
    if (hasDecentration) {
      findings.add('Decentration: ${decentration.toStringAsFixed(1)}% @ ${decentrationAngle.toStringAsFixed(0)}°');
    }
    if (hasOvalDeformation) {
      findings.add('Ellipseness: ${ellipseness.toStringAsFixed(1)}% ($ovalType)');
    }
    return findings.join('\n');
  }

  Map<String, dynamic> toJson() => {
    'isLeftEye': isLeftEye,
    'piRatio': piRatio,
    'ellipseness': ellipseness,
    'decentration': decentration,
    'decentrationAngle': decentrationAngle,
  };
}

