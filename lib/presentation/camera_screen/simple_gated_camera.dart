// lib/presentation/camera_screen/simple_gated_camera.dart
// Quality-gated camera with SELFIE MODE, AUDIO/HAPTIC FEEDBACK
// v5.2.5 - FIXED AUDIO RACE CONDITION CRASH
// COMPLETE FILE - COPY PASTE ENTIRELY

// ============================================================
// SECTION 1 OF 4: IMPORTS, CONFIGS, AND CLASS SETUP
// ============================================================

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:ai_eye_capture/constant/color.dart';
import 'package:ai_eye_capture/services/simple_eye_quality_gate.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

enum HapticType { light, medium, heavy, success, warning, error, selection }

/// v5.2.4: Bilateral distance matching configuration with RELAXED thresholds
class BilateralMatchConfig {
  static const double perfectMatch = 0.95;
  static const double goodMatch = 0.85;
  static const double acceptableMatch = 0.75;
  static const double minimumMatch = 0.60;
  static const int smoothingFrames = 8;
  static const double stabilityThreshold = 0.08;
  static const double indicatorTopOffset = 120.0;
}

class CaptureResult {
  final String imagePath;
  final double zoomLevel;
  final double? estimatedIrisSize;
  final double? distanceMatchPercent;
  final bool needsCropAdjustment;
  final double? cropScaleFactor;

  CaptureResult({
    required this.imagePath,
    required this.zoomLevel,
    this.estimatedIrisSize,
    this.distanceMatchPercent,
    this.needsCropAdjustment = false,
    this.cropScaleFactor,
  });
}

class SimpleGatedCameraScreen extends StatefulWidget {
  final CameraDescription camera;
  final bool isRightEye;
  final bool enableAutoCapture;
  final bool useFrontCamera;
  final double? referenceIrisSize;
  final double? referenceZoom;

  const SimpleGatedCameraScreen({
    super.key,
    required this.camera,
    this.isRightEye = true,
    this.enableAutoCapture = true,
    this.useFrontCamera = true,
    this.referenceIrisSize,
    this.referenceZoom,
  });

  @override
  State<SimpleGatedCameraScreen> createState() => _SimpleGatedCameraScreenState();
}

class _SimpleGatedCameraScreenState extends State<SimpleGatedCameraScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  SimpleEyeQualityGate? _qualityGate;
  final EyeValidator _eyeValidator = EyeValidator();

  SimpleQualityResult? _lastResult;
  bool _isInitialized = false;
  bool _isCapturing = false;
  bool _isProcessing = false;
  bool _isValidating = false;
  String? _validationError;
  int _validationAttempts = 0;

  // v5.2.5: FIXED AUDIO - Added debounce and state tracking
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _audioEnabled = true;
  DateTime? _lastSoundPlayed;  // For debouncing
  bool _isPlayingSound = false; // Prevents race condition

  int _readyFrameCount = 0;
  static const _autoCaptureTrigger = 15;
  int? _countdownValue;
  Timer? _countdownTimer;

  double _currentZoom = 1.0;
  double _minZoom = 1.0;
  double _maxZoom = 1.0;

  CameraDescription? _selectedCamera;
  List<CameraDescription> _cameras = [];

  final List<double> _irisSizeHistory = [];
  double? _smoothedIrisSize;
  bool _isDistanceStable = false;

  double? _distanceMatchPercent;
  String _distanceGuidance = '';
  Color _distanceIndicatorColor = Colors.orange;

  double? _currentIrisDiameterPx;
  double? _currentPupilDiameterPx;

  bool get _hasReference => widget.referenceIrisSize != null;

  double get _sizeMatchPercent {
    if (!_hasReference) return 1.0;
    if (_smoothedIrisSize == null) return 0;
    return _distanceMatchPercent ?? 0;
  }

  EyeValidationResult _applyValidationConfig(EyeValidationResult original) {
    final filteredChecks = Map<String, bool>.from(original.checkResults);
    if (!ValidationConfig.checkAspectRatio) filteredChecks['aspectRatio'] = true;
    if (!ValidationConfig.checkHasCircle) filteredChecks['hasCircle'] = true;
    if (!ValidationConfig.checkHasDarkCenter) filteredChecks['hasDarkCenter'] = true;
    if (!ValidationConfig.checkHasTexture) filteredChecks['hasTexture'] = true;
    if (!ValidationConfig.checkConcentricCircles) filteredChecks['hasConcentricCircles'] = true;
    if (!ValidationConfig.checkColorDistribution) filteredChecks['colorDistribution'] = true;
    if (!ValidationConfig.checkEdgeDensity) filteredChecks['edgeDensity'] = true;

    final passedCount = filteredChecks.values.where((v) => v).length;
    final totalChecks = filteredChecks.length;
    final passRatio = passedCount / totalChecks;
    final isValid = passRatio >= ValidationConfig.minPassRatio;

    return EyeValidationResult(
      isValidEye: isValid,
      confidence: original.confidence,
      checkResults: filteredChecks,
      rejectionReason: isValid ? null : original.rejectionReason,
    );
  }

// ============================================================
// SECTION 2 OF 4: INIT, CAMERA SETUP, AND AUDIO/HAPTIC FEEDBACK
// ============================================================

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  Future<void> _initCamera() async {
    _qualityGate = SimpleEyeQualityGate(
      thresholds: const SimpleQualityThresholds(),
    );

    _cameras = await availableCameras();

    if (widget.useFrontCamera) {
      _selectedCamera = _cameras.firstWhere(
            (cam) => cam.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      );
    } else {
      _selectedCamera = _cameras.firstWhere(
            (cam) => cam.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras.first,
      );
    }

    _controller = CameraController(
      _selectedCamera!,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    try {
      await _controller!.initialize();
      _minZoom = await _controller!.getMinZoomLevel();
      _maxZoom = await _controller!.getMaxZoomLevel();

      if (widget.referenceZoom != null) {
        _currentZoom = widget.referenceZoom!.clamp(_minZoom, _maxZoom);
      } else {
        _currentZoom = (_minZoom + 0.5).clamp(_minZoom, _maxZoom);
      }
      await _controller!.setZoomLevel(_currentZoom);
      await _controller!.setFlashMode(FlashMode.off);
      await _controller!.setExposureMode(ExposureMode.auto);
      await _controller!.setFocusMode(FocusMode.auto);
      await _controller!.startImageStream(_onFrame);
      await _playSound('ready');

      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('Camera init error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2) return;

    await _controller?.stopImageStream();
    await _controller?.dispose();

    final currentDirection = _selectedCamera?.lensDirection;
    _selectedCamera = _cameras.firstWhere(
          (cam) => cam.lensDirection != currentDirection,
      orElse: () => _cameras.first,
    );

    setState(() => _isInitialized = false);

    _controller = CameraController(
      _selectedCamera!,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    try {
      await _controller!.initialize();
      _minZoom = await _controller!.getMinZoomLevel();
      _maxZoom = await _controller!.getMaxZoomLevel();
      _currentZoom = (_minZoom + 0.5).clamp(_minZoom, _maxZoom);
      await _controller!.setZoomLevel(_currentZoom);
      await _controller!.setFlashMode(FlashMode.off);
      await _controller!.startImageStream(_onFrame);

      _playHaptic(HapticType.light);
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('Camera switch error: $e');
    }
  }

  // ==================== v5.2.5: FIXED AUDIO FEEDBACK ====================

  /// v5.2.5: Fixed audio playback with debouncing and state protection
  /// This prevents the IllegalStateException crash from race conditions
  Future<void> _playSound(String type) async {
    if (!_audioEnabled) return;

    // DEBOUNCE: Skip if sound played within last 300ms
    final now = DateTime.now();
    if (_lastSoundPlayed != null &&
        now.difference(_lastSoundPlayed!).inMilliseconds < 300) {
      return;
    }

    // RACE CONDITION GUARD: Skip if already playing
    if (_isPlayingSound) return;

    _lastSoundPlayed = now;
    _isPlayingSound = true;

    try {
      // CRITICAL FIX: Always stop before playing to prevent wrong state error
      await _audioPlayer.stop();

      final source = switch (type) {
        'ready' => 'sounds/ready.mp3',
        'countdown' => 'sounds/tick.mp3',
        'capture' => 'sounds/shutter.mp3',
        'success' => 'sounds/success.mp3',
        'error' => 'sounds/error.mp3',
        _ => null,
      };

      if (source != null) {
        await _audioPlayer.play(AssetSource(source));
      }
    } catch (e) {
      // Non-fatal: fall back to system sounds
      debugPrint('Audio playback error (non-fatal): $e');
      _playSystemSound(type);
    } finally {
      // Always reset flag even if error occurred
      _isPlayingSound = false;
    }
  }

  void _playSystemSound(String type) {
    switch (type) {
      case 'ready':
      case 'success':
        SystemSound.play(SystemSoundType.click);
        break;
      case 'countdown':
      case 'capture':
        SystemSound.play(SystemSoundType.click);
        break;
      case 'error':
        SystemSound.play(SystemSoundType.alert);
        break;
    }
  }

  // ==================== HAPTIC FEEDBACK ====================

  void _playHaptic(HapticType type) {
    switch (type) {
      case HapticType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticType.heavy:
        HapticFeedback.heavyImpact();
        break;
      case HapticType.success:
        HapticFeedback.mediumImpact();
        Future.delayed(const Duration(milliseconds: 100), () {
          HapticFeedback.lightImpact();
        });
        break;
      case HapticType.warning:
        HapticFeedback.mediumImpact();
        break;
      case HapticType.error:
        HapticFeedback.heavyImpact();
        Future.delayed(const Duration(milliseconds: 80), () {
          HapticFeedback.heavyImpact();
        });
        Future.delayed(const Duration(milliseconds: 160), () {
          HapticFeedback.heavyImpact();
        });
        break;
      case HapticType.selection:
        HapticFeedback.selectionClick();
        break;
    }
  }

  // ==================== FRAME SMOOTHING ====================

  void _updateIrisSizeHistory(double irisSize) {
    _irisSizeHistory.add(irisSize);

    while (_irisSizeHistory.length > BilateralMatchConfig.smoothingFrames) {
      _irisSizeHistory.removeAt(0);
    }

    if (_irisSizeHistory.length >= 3) {
      _smoothedIrisSize = _irisSizeHistory.reduce((a, b) => a + b) / _irisSizeHistory.length;

      if (_irisSizeHistory.length >= BilateralMatchConfig.smoothingFrames ~/ 2) {
        final variance = _calculateVariance(_irisSizeHistory);
        final mean = _smoothedIrisSize!;
        final coefficientOfVariation = mean > 0 ? variance / mean : 1.0;
        _isDistanceStable = coefficientOfVariation < BilateralMatchConfig.stabilityThreshold;
      }
    }
  }

  double _calculateVariance(List<double> values) {
    if (values.isEmpty) return 0;
    final mean = values.reduce((a, b) => a + b) / values.length;
    final squaredDiffs = values.map((v) => (v - mean) * (v - mean));
    return math.sqrt(squaredDiffs.reduce((a, b) => a + b) / values.length);
  }

  void _calculateDistanceMatch() {
    if (_smoothedIrisSize == null || widget.referenceIrisSize == null) {
      _distanceMatchPercent = null;
      _distanceGuidance = '';
      return;
    }

    final reference = widget.referenceIrisSize!;
    final current = _smoothedIrisSize!;

    final ratio = current / reference;
    final matchPercent = (1 - (ratio - 1).abs()).clamp(0.0, 1.0);
    _distanceMatchPercent = matchPercent;

    if (matchPercent >= BilateralMatchConfig.perfectMatch) {
      _distanceGuidance = '✓ Distance matched';
      _distanceIndicatorColor = Colors.green;
    } else if (matchPercent >= BilateralMatchConfig.goodMatch) {
      _distanceGuidance = '✓ Good match';
      _distanceIndicatorColor = Colors.lightGreen;
    } else if (matchPercent >= BilateralMatchConfig.acceptableMatch) {
      if (ratio > 1.08) {
        _distanceGuidance = 'Slightly back ↔';
        _distanceIndicatorColor = Colors.orange;
      } else if (ratio < 0.92) {
        _distanceGuidance = 'Slightly closer ↔';
        _distanceIndicatorColor = Colors.orange;
      } else {
        _distanceGuidance = 'Almost there...';
        _distanceIndicatorColor = Colors.yellow.shade700;
      }
    } else if (matchPercent >= BilateralMatchConfig.minimumMatch) {
      if (ratio > 1.15) {
        _distanceGuidance = 'Move back ←←';
        _distanceIndicatorColor = Colors.deepOrange;
      } else {
        _distanceGuidance = 'Move closer →→';
        _distanceIndicatorColor = Colors.deepOrange;
      }
    } else {
      if (ratio > 1.25) {
        _distanceGuidance = 'Too close! Move back';
        _distanceIndicatorColor = Colors.red;
      } else {
        _distanceGuidance = 'Too far! Move closer';
        _distanceIndicatorColor = Colors.red;
      }
    }
  }

// ============================================================
// SECTION 3 OF 4: FRAME PROCESSING, CAPTURE, AND VALIDATION
// ============================================================

  void _onFrame(CameraImage image) {
    if (_isCapturing || _qualityGate == null || _isProcessing || _isValidating) return;

    _isProcessing = true;
    final result = _qualityGate!.processFrame(image);
    _isProcessing = false;

    if (!mounted) return;

    final wasReady = _lastResult?.isReady ?? false;
    final isNowReady = result.isReady;

    if (!wasReady && isNowReady) {
      _playHaptic(HapticType.success);
      _playSound('ready');
    } else if (wasReady && !isNowReady) {
      _playHaptic(HapticType.warning);
    }

    setState(() {
      _lastResult = result;
      if (_validationError != null && !isNowReady) {
        _validationError = null;
      }
    });

    if (result.pupilConfidence > 0.3 && result.estimatedPupilCenter != null) {
      final frameWidth = image.width.toDouble();
      final estimatedDiameter = (frameWidth * 0.20) * (0.5 + result.pupilConfidence * 0.5);

      _currentIrisDiameterPx = estimatedDiameter;
      _updateIrisSizeHistory(estimatedDiameter);

      if (_hasReference) {
        _calculateDistanceMatch();
      }
    }

    if (widget.enableAutoCapture && !_isCapturing && !_isValidating) {
      final distanceOk = !_hasReference ||
          (_distanceMatchPercent != null &&
              _distanceMatchPercent! >= BilateralMatchConfig.acceptableMatch &&
              _isDistanceStable);

      if (result.isReady && distanceOk) {
        _readyFrameCount++;
        if (_readyFrameCount >= _autoCaptureTrigger && _countdownValue == null) {
          _startCountdown();
        }
      } else {
        _readyFrameCount = math.max(0, _readyFrameCount - 1);
        if (_countdownValue != null && !result.isReady) {
          _cancelCountdown();
        }
      }
    }
  }

  void _startCountdown() {
    _playHaptic(HapticType.medium);
    _playSound('countdown');
    setState(() => _countdownValue = 3);

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_countdownValue! > 1) {
        _playHaptic(HapticType.light);
        _playSound('countdown');
        setState(() => _countdownValue = _countdownValue! - 1);
      } else {
        timer.cancel();
        _capture();
      }
    });
  }

  void _cancelCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    if (mounted) {
      setState(() => _countdownValue = null);
    }
  }

  Future<void> _capture() async {
    if (_controller == null || _isCapturing || _isValidating) return;

    setState(() {
      _isCapturing = true;
      _isValidating = true;
      _validationError = null;
    });
    _cancelCountdown();

    _playHaptic(HapticType.heavy);
    _playSound('capture');

    try {
      await _controller!.stopImageStream();
      final file = await _controller!.takePicture();
      final imageBytes = await File(file.path).readAsBytes();

      final rawValidation = await _eyeValidator.validateBytes(imageBytes);
      final validationResult = _applyValidationConfig(rawValidation);

      debugPrint('🔧 Validation config applied:');
      debugPrint('   Raw: ${rawValidation.checkResults}');
      debugPrint('   Filtered: ${validationResult.checkResults}');

      if (!validationResult.isValidEye) {
        _validationAttempts++;
        _playHaptic(HapticType.error);
        _playSound('error');

        debugPrint('❌ Eye validation FAILED: ${validationResult.rejectionReason}');

        await _controller!.startImageStream(_onFrame);

        if (mounted) {
          setState(() {
            _isCapturing = false;
            _isValidating = false;
            _validationError = _getSimplifiedError(validationResult);
            _readyFrameCount = 0;
          });
          _showValidationErrorDialog(validationResult);
        }
        return;
      }

      debugPrint('✅ Eye validated: ${(validationResult.confidence * 100).toStringAsFixed(0)}% confidence');

      final croppedPath = await _cropAndSavePermanently(file.path);

      _playHaptic(HapticType.success);
      _playSound('success');

      bool needsCrop = false;
      double? cropScale;

      if (_hasReference && _distanceMatchPercent != null) {
        if (_distanceMatchPercent! < BilateralMatchConfig.perfectMatch &&
            _distanceMatchPercent! >= BilateralMatchConfig.acceptableMatch) {
          needsCrop = true;
          final ratio = _smoothedIrisSize! / widget.referenceIrisSize!;
          cropScale = 1 / ratio;
        }
      }

      if (mounted) {
        Navigator.pop(context, CaptureResult(
          imagePath: croppedPath,
          zoomLevel: _currentZoom,
          estimatedIrisSize: _smoothedIrisSize ?? _currentIrisDiameterPx,
          distanceMatchPercent: _distanceMatchPercent != null
              ? _distanceMatchPercent! * 100
              : null,
          needsCropAdjustment: needsCrop,
          cropScaleFactor: cropScale,
        ));
      }
    } catch (e) {
      debugPrint('Capture error: $e');
      _playHaptic(HapticType.error);
      _playSound('error');

      await _controller!.startImageStream(_onFrame);
      if (mounted) {
        setState(() {
          _isCapturing = false;
          _isValidating = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Capture failed: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  String _getSimplifiedError(EyeValidationResult result) {
    final checks = result.checkResults;

    if (checks['aspectRatio'] == false) {
      return 'Image shape incorrect - ensure eye fills frame';
    }
    if (checks['hasCircle'] == false || checks['hasConcentricCircles'] == false) {
      return 'No eye detected - center iris in frame';
    }
    if (checks['hasDarkCenter'] == false) {
      return 'No pupil detected - ensure good lighting';
    }
    if (checks['hasTexture'] == false) {
      return 'No iris texture - move closer to eye';
    }
    if (checks['colorDistribution'] == false) {
      return 'Unusual colors detected - avoid screens/reflections';
    }
    if (checks['edgeDensity'] == false) {
      return 'Too many straight edges - this may not be an eye';
    }

    return 'Not a valid eye image - please try again';
  }

  void _showValidationErrorDialog(EyeValidationResult result) {
    final l10n = AppLocalizations.of(context)!;
    final checks = result.checkResults;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.visibility_off, color: Colors.red, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(l10n!.eyeNotDetected, style: const TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: Text(_getSimplifiedError(result), style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
            const SizedBox(height: 16),
            Text(l10n!.validationChecks, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...checks.entries.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  Icon(e.value ? Icons.check_circle : Icons.cancel, color: e.value ? Colors.green : Colors.red, size: 16),
                  const SizedBox(width: 8),
                  Text(_getCheckLabel(e.key), style: TextStyle(color: e.value ? Colors.white70 : Colors.red.shade300, fontSize: 12)),
                ],
              ),
            )),
            const SizedBox(height: 16),
            Text('${l10n!.confidence}: ${(result.confidence * 100).toStringAsFixed(0)}%', style: const TextStyle(color: Colors.white54, fontSize: 11)),
            if (_validationAttempts > 2)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.amber.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(l10n!.eyeQualityTip, style: const TextStyle(color: Colors.amber, fontSize: 11))),
                  ],
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n!.tryAgain, style: const TextStyle(color: Colors.cyan)),
          ),
        ],
      ),
    );
  }

  String _getCheckLabel(String checkName) {
    switch (checkName) {
      case 'aspectRatio': return 'Image Shape';
      case 'hasCircle': return 'Circular Iris';
      case 'hasDarkCenter': return 'Dark Pupil';
      case 'hasTexture': return 'Iris Texture';
      case 'hasConcentricCircles': return 'Pupil-Iris Structure';
      case 'colorDistribution': return 'Natural Colors';
      case 'edgeDensity': return 'Edge Pattern';
      default: return checkName;
    }
  }

  Future<String> _cropAndSavePermanently(String imagePath) async {
    try {
      final bytes = await File(imagePath).readAsBytes();
      final original = img.decodeImage(bytes);

      if (original == null) {
        debugPrint('Could not decode image, returning original');
        return imagePath;
      }

      final origWidth = original.width;
      final origHeight = original.height;

      int cropWidth, cropHeight, offsetX, offsetY;
      final targetRatio = 3.0 / 4.0;
      final currentRatio = origWidth / origHeight;

      if (currentRatio > targetRatio) {
        cropHeight = origHeight;
        cropWidth = (origHeight * targetRatio).round();
        offsetX = (origWidth - cropWidth) ~/ 2;
        offsetY = 0;
      } else {
        cropWidth = origWidth;
        cropHeight = (origWidth / targetRatio).round();
        offsetX = 0;
        offsetY = (origHeight - cropHeight) ~/ 2;
      }

      offsetX = offsetX.clamp(0, origWidth - 1);
      offsetY = offsetY.clamp(0, origHeight - 1);
      cropWidth = cropWidth.clamp(1, origWidth - offsetX);
      cropHeight = cropHeight.clamp(1, origHeight - offsetY);

      final cropped = img.copyCrop(
        original,
        x: offsetX,
        y: offsetY,
        width: cropWidth,
        height: cropHeight,
      );

      final appDir = await getApplicationDocumentsDirectory();
      final eyeImagesDir = Directory('${appDir.path}/EyeImages');
      if (!await eyeImagesDir.exists()) {
        await eyeImagesDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final eyeLabel = widget.isRightEye ? 'OD' : 'OS';
      final croppedPath = '${eyeImagesDir.path}/eye_${eyeLabel}_$timestamp.jpg';

      final croppedBytes = img.encodeJpg(cropped, quality: 95);
      await File(croppedPath).writeAsBytes(croppedBytes);

      debugPrint('✅ Saved $eyeLabel eye PERMANENTLY: $croppedPath');
      debugPrint('   Original: ${origWidth}x$origHeight -> Cropped: ${cropWidth}x$cropHeight');

      try {
        await File(imagePath).delete();
      } catch (e) {
        debugPrint('Could not delete temp file: $e');
      }

      return croppedPath;
    } catch (e) {
      debugPrint('Crop error: $e - returning original');
      return imagePath;
    }
  }

  void _adjustZoom(double delta) async {
    final newZoom = (_currentZoom + delta).clamp(_minZoom, _maxZoom);
    if (newZoom != _currentZoom) {
      await _controller?.setZoomLevel(newZoom);
      _playHaptic(HapticType.selection);
      setState(() => _currentZoom = newZoom);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null) return;
    if (state == AppLifecycleState.inactive) {
      _controller?.stopImageStream();
      _cancelCountdown();
    } else if (state == AppLifecycleState.resumed && _isInitialized) {
      _controller?.startImageStream(_onFrame);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _countdownTimer?.cancel();
    _controller?.stopImageStream();
    _controller?.dispose();
    _audioPlayer.stop().catchError((_) {});
    _audioPlayer.dispose();
    super.dispose();
  }

// ============================================================
// SECTION 4 OF 4: UI BUILD METHODS
// ============================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isReady = _lastResult?.isReady ?? false;
    final isFrontCamera = _selectedCamera?.lensDirection == CameraLensDirection.front;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(l10n, isFrontCamera),
            Expanded(child: _buildCameraPreview(isReady)),
            _buildControls(l10n, isReady),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n, bool isFrontCamera) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white, size: 28),
            onPressed: () {
              _playHaptic(HapticType.light);
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.isRightEye ? l10n.takeRightEyePhoto : l10n.takeLeftEyePhoto,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  isFrontCamera ? '📷 Front Camera' : '📷 Back Camera',
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_ios, color: Colors.white70, size: 26),
            onPressed: _cameras.length > 1 ? _switchCamera : null,
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview(bool isReady) {
    if (!_isInitialized) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: Colors.white),
            const SizedBox(height: 16),
            Text(AppLocalizations.of(context)!.startingCamera, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: CameraPreview(_controller!),
          ),
        ),
        _buildReticle(isReady),
        Positioned(left: 16, top: 16, child: _buildQualityIndicators()),
        Positioned(right: 16, top: 60, bottom: 100, child: _buildZoomSlider()),
        Positioned(right: 16, top: 16, child: _buildAudioToggle()),
        if (_countdownValue != null) _buildCountdownOverlay(),

        if (_isValidating && !_isCapturing)
          Container(
            decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.cyan),
                  const SizedBox(height: 16),
                  Text(AppLocalizations.of(context)!.validatingEye, style: const TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ),

        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: _buildFeedbackBanner(isReady),
        ),

        if (_hasReference)
          Positioned(
            top: BilateralMatchConfig.indicatorTopOffset,
            left: 16,
            child: _buildDistanceIndicator(),
          ),

        if (_isCapturing)
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
      ],
    );
  }

  Widget _buildDistanceIndicator() {
    if (_smoothedIrisSize == null) {
      return const SizedBox.shrink();
    }

    final matchPercent = _distanceMatchPercent ?? 0;
    final isGoodMatch = matchPercent >= BilateralMatchConfig.goodMatch;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _distanceIndicatorColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _distanceIndicatorColor.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isGoodMatch ? Icons.check_circle : Icons.straighten,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                'Distance: ${(matchPercent * 100).toInt()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          if (_distanceGuidance.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              _distanceGuidance,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
          Text(
            'OD: ${widget.referenceIrisSize!.toInt()}px → OS: ${_smoothedIrisSize!.toInt()}px',
            style: const TextStyle(color: Colors.white70, fontSize: 8),
          ),
          if (!_isDistanceStable && matchPercent >= BilateralMatchConfig.acceptableMatch)
            const Text(
              '⏳ Stabilizing...',
              style: TextStyle(color: Colors.white60, fontSize: 8),
            ),
        ],
      ),
    );
  }

  Widget _buildAudioToggle() {
    return GestureDetector(
      onTap: () {
        _playHaptic(HapticType.selection);
        setState(() => _audioEnabled = !_audioEnabled);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20)),
        child: Icon(
          _audioEnabled ? Icons.volume_up : Icons.volume_off,
          color: _audioEnabled ? Colors.white : Colors.white38,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildZoomSlider() {
    return RotatedBox(
      quarterTurns: -1,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 3,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.white24,
          thumbColor: Colors.white,
        ),
        child: Slider(
          value: _currentZoom,
          min: _minZoom,
          max: _maxZoom,
          onChanged: (value) async {
            await _controller?.setZoomLevel(value);
            setState(() => _currentZoom = value);
          },
          onChangeEnd: (_) => _playHaptic(HapticType.selection),
        ),
      ),
    );
  }

  Widget _buildReticle(bool isReady) {
    Color color;
    if (_validationError != null) {
      color = Colors.red;
    } else if (isReady) {
      if (_hasReference && _distanceMatchPercent != null) {
        color = _distanceIndicatorColor;
      } else {
        color = Colors.green;
      }
    } else {
      color = Colors.white.withOpacity(0.6);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: isReady ? 4 : 2),
        boxShadow: isReady ? [
          BoxShadow(color: color.withOpacity(0.4), blurRadius: 20, spreadRadius: 5),
        ] : (_validationError != null ? [
          BoxShadow(color: Colors.red.withOpacity(0.4), blurRadius: 20, spreadRadius: 5),
        ] : null),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 1.5, height: 30, color: color.withOpacity(0.5)),
          Container(width: 30, height: 1.5, color: color.withOpacity(0.5)),
          if (_lastResult?.estimatedPupilCenter != null && _lastResult!.pupilConfidence > 0.2)
            _buildPupilDot(),
        ],
      ),
    );
  }

  Widget _buildPupilDot() {
    final center = _lastResult!.estimatedPupilCenter!;
    final confidence = _lastResult!.pupilConfidence;
    final x = (center.dx - 0.5) * 160;
    final y = (center.dy - 0.5) * 160;

    return Transform.translate(
      offset: Offset(x, y),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.cyan.withOpacity(confidence * 0.6),
          border: Border.all(color: Colors.cyan, width: 2),
        ),
      ),
    );
  }

  Widget _buildQualityIndicators() {
    final result = _lastResult;
    if (result == null) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(12)),
        child: Text(AppLocalizations.of(context)!.initializing, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _indicator(AppLocalizations.of(context)!.eye, result.issue != QualityIssue.notAnEye, result.issue == QualityIssue.notAnEye ? 'No' : 'Yes'),
          _indicator('Sharp', result.sharpness >= 100, '${result.sharpness.toInt()}'),
          _indicator(AppLocalizations.of(context)!.light, result.brightness >= 30 && result.brightness <= 230, '${result.brightness.toInt()}'),
          _indicator('Focus', result.contrast >= 30, '${result.contrast.toInt()}'),
          _indicator('Pupil', result.pupilConfidence >= 0.3, '${(result.pupilConfidence * 100).toInt()}%'),
          if (_smoothedIrisSize != null)
            _indicator(AppLocalizations.of(context)!.iris, true, '${_smoothedIrisSize!.toInt()}px'),
          if (_hasReference && _distanceMatchPercent != null)
            _indicator('Match', _distanceMatchPercent! >= BilateralMatchConfig.acceptableMatch,
                '${(_distanceMatchPercent! * 100).toInt()}%'),
        ],
      ),
    );
  }

  Widget _indicator(String label, bool ok, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8, height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: ok ? Colors.green : Colors.red),
          ),
          const SizedBox(width: 8),
          Text('$label: $value',
            style: TextStyle(color: ok ? Colors.white : Colors.white60, fontSize: 11, fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownOverlay() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green.withOpacity(0.85)),
      child: Center(
        child: Text(
          '$_countdownValue',
          style: const TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFeedbackBanner(bool isReady) {
    String displayMessage;
    Color backgroundColor;
    IconData icon;

    if (_validationError != null) {
      displayMessage = _validationError!;
      backgroundColor = Colors.red.shade700;
      icon = Icons.warning;
    } else if (_countdownValue != null) {
      displayMessage = 'Hold still - capturing...';
      backgroundColor = Colors.green;
      icon = Icons.camera;
    } else if (_hasReference && _distanceMatchPercent != null &&
        _distanceMatchPercent! < BilateralMatchConfig.acceptableMatch) {
      displayMessage = _distanceGuidance;
      backgroundColor = _distanceIndicatorColor;
      icon = Icons.straighten;
    } else if (isReady) {
      if (_hasReference && !_isDistanceStable) {
        displayMessage = 'Stabilizing distance...';
        backgroundColor = Colors.yellow.shade700;
        icon = Icons.hourglass_bottom;
      } else {
        displayMessage = _lastResult?.feedback ?? 'Ready!';
        backgroundColor = Colors.green;
        icon = Icons.check_circle;
      }
    } else {
      displayMessage = _lastResult?.feedback ?? AppLocalizations.of(context)!.initializing;
      backgroundColor = _getIssueColor(_lastResult?.issue);
      icon = _getIssueIcon(_lastResult?.issue);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              displayMessage,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls(AppLocalizations l10n, bool isReady) {
    final distanceOk = !_hasReference ||
        (_distanceMatchPercent != null &&
            _distanceMatchPercent! >= BilateralMatchConfig.acceptableMatch);
    final stableOk = !_hasReference || _isDistanceStable;
    final canCapture = isReady && distanceOk && stableOk && !_isValidating;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      child: Column(
        children: [
          if (widget.enableAutoCapture && _countdownValue == null && _validationError == null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (_readyFrameCount / _autoCaptureTrigger).clamp(0.0, 1.0),
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation(canCapture ? Colors.green : Colors.white38),
                minHeight: 4,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              canCapture
                  ? 'Hold steady...'
                  : (isReady && !distanceOk
                  ? 'Adjust distance first'
                  : (isReady && !stableOk
                  ? 'Stabilizing...'
                  : 'Auto-capture when ready')),
              style: TextStyle(color: canCapture ? Colors.green : Colors.white38, fontSize: 11),
            ),
            const SizedBox(height: 10),
          ],

          GestureDetector(
            onTap: (isReady && distanceOk) || _hasReference == false ? () {
              _playHaptic(HapticType.medium);
              _capture();
            } : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: canCapture ? Colors.white : Colors.white30,
                border: Border.all(
                  color: _validationError != null
                      ? Colors.red
                      : (canCapture ? Colors.green : Colors.white30),
                  width: 4,
                ),
                boxShadow: canCapture ? [BoxShadow(color: Colors.green.withOpacity(0.5), blurRadius: 16)] : null,
              ),
              child: Icon(
                Icons.camera_alt,
                size: 30,
                color: canCapture ? AppColor.primaryColor : Colors.white38,
              ),
            ),
          ),

          const SizedBox(height: 8),
          Text(
            _isValidating
                ? 'Validating...'
                : (_countdownValue != null
                ? 'Capturing...'
                : (canCapture ? 'Tap or wait for auto-capture' : 'Adjust position')),
            style: TextStyle(color: canCapture ? Colors.white : Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Color _getIssueColor(QualityIssue? issue) {
    switch (issue) {
      case QualityIssue.tooBlurry: return Colors.orange;
      case QualityIssue.tooDark: return Colors.amber.shade800;
      case QualityIssue.tooBright: return Colors.amber;
      case QualityIssue.noContrast: return Colors.purple;
      case QualityIssue.noPupil: return Colors.red;
      case QualityIssue.notCentered: return Colors.blue;
      case QualityIssue.notAnEye: return Colors.red.shade900;
      case QualityIssue.processing: return Colors.grey;
      default: return Colors.grey;
    }
  }

  IconData _getIssueIcon(QualityIssue? issue) {
    switch (issue) {
      case QualityIssue.tooBlurry: return Icons.blur_on;
      case QualityIssue.tooDark: return Icons.brightness_low;
      case QualityIssue.tooBright: return Icons.brightness_high;
      case QualityIssue.noContrast: return Icons.contrast;
      case QualityIssue.noPupil: return Icons.visibility_off;
      case QualityIssue.notCentered: return Icons.center_focus_weak;
      case QualityIssue.notAnEye: return Icons.block;
      case QualityIssue.processing: return Icons.hourglass_empty;
      default: return Icons.info_outline;
    }
  }
}