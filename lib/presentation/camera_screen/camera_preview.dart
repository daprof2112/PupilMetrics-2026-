// lib/presentation/camera_screen/camera_preview.dart
// v5.2.7 - Added zoom slider control

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:image/image.dart' as imglib;
import 'package:ai_eye_capture/utils/utils.dart';
import 'package:ai_eye_capture/presentation/right_eye_screen/take_right_eye_photo_screen.dart';
import 'package:ai_eye_capture/iris_detector.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

enum CameraMode {
  auto,    // Auto-capture with countdown
  manual,  // Manual capture only
  selfie,  // Selfie mode (front camera, manual)
}

class CameraPreviewPage extends StatefulWidget {
  final dynamic camera;
  final bool rightEye;
  final CameraMode cameraMode;

  const CameraPreviewPage({
    super.key,
    this.camera,
    required this.rightEye,
    this.cameraMode = CameraMode.manual,
  });

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  final _cropController = CropController();
  bool _isCropping = false;

  // Eye Detection (only for auto mode)
  final IrisDetector _detector = IrisDetector();
  Timer? _detectionTimer;
  bool _eyeDetected = false;
  bool _isWellCentered = false;
  bool _hasGoodLighting = false;
  bool _isStable = false;
  int _captureCountdown = 0;
  Timer? _countdownTimer;
  Timer? _stabilityTimer;

  // Exposure
  Timer? _expApplyTimer;
  static const Duration _expThrottle = Duration(milliseconds: 30);
  int _expLevel = 0;
  static const int _expMax = 3;
  double _lastSentExposure01 = 0.5;

  // v5.2.7: Zoom control (CamerAwesome uses 0.0-1.0 range)
  double _currentZoom = 0.0;
  static const double _minZoom = 0.0;
  static const double _maxZoom = 1.0;

  // Flash
  FlashMode _flashMode = FlashMode.auto;
  bool _handlingCapture = false;

  // Mirror
  bool _mirrorFront = true;

  // Camera state
  dynamic _cameraState;

  bool get _isAutoMode => widget.cameraMode == CameraMode.auto;
  bool get _isSelfieMode => widget.cameraMode == CameraMode.selfie;

  @override
  void initState() {
    super.initState();
    _loadFlash();
    _loadMirror();
    _loadZoom(); // v5.2.7: Load saved zoom
    _detector.loadModel();
    _startPeriodicDetection();
  }

  // v5.2.7: Load/Save zoom preference
  Future<void> _loadZoom() async {
    final sp = await SharedPreferences.getInstance();
    setState(() => _currentZoom = sp.getDouble('cameraZoom') ?? 0.0);
  }

  Future<void> _saveZoom(double v) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setDouble('cameraZoom', v);
  }

  // v5.2.7: Apply zoom to camera
  void _applyZoom(dynamic state, double zoom) {
    if (state == null) return;
    try {
      state.sensorConfig.setZoom(zoom);
    } catch (e) {
      debugPrint('[Zoom] Error setting zoom: $e');
    }
  }

  // ======== Eye Detection (All Modes) ========
  void _startPeriodicDetection() {
    _detectionTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      if (_handlingCapture || _cameraState == null) return;
      await _performDetection();
    });
  }

  Future<void> _performDetection() async {
    try {
      if (_cameraState is! PhotoCameraState) return;

      setState(() {
        _hasGoodLighting = _expLevel >= -1 && _expLevel <= 1;
        _eyeDetected = _hasGoodLighting;
        _isWellCentered = true;
      });

      if (_eyeDetected && _isWellCentered && _hasGoodLighting) {
        if (_isAutoMode || _isSelfieMode) {
          _startStabilityCheck();
        }
      } else {
        _cancelAutoCapture();
      }
    } catch (e) {
      debugPrint('[Detection] Detection error: $e');
    }
  }

  void _startStabilityCheck() {
    if (_stabilityTimer != null) return;

    _stabilityTimer = Timer(const Duration(milliseconds: 1000), () {
      if (!mounted) return;
      if (_eyeDetected && _isWellCentered && _hasGoodLighting) {
        setState(() => _isStable = true);
        _startCountdown();
      }
    });
  }

  void _startCountdown() {
    if (_countdownTimer != null || _captureCountdown > 0) return;

    setState(() => _captureCountdown = 5);

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_captureCountdown > 1) {
        setState(() => _captureCountdown--);
      } else {
        timer.cancel();
        _triggerAutoCapture();
      }
    });
  }

  void _cancelAutoCapture() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    _stabilityTimer?.cancel();
    _stabilityTimer = null;

    if (mounted) {
      setState(() {
        _captureCountdown = 0;
        _isStable = false;
      });
    }
  }

  Future<void> _triggerAutoCapture() async {
    if (_cameraState != null && _cameraState is PhotoCameraState) {
      final state = _cameraState as PhotoCameraState;
      await state.takePhoto();
    }
  }

  // ======== Persistence ========
  Future<void> _loadFlash() async {
    final sp = await SharedPreferences.getInstance();
    final v = sp.getString('flashMode') ?? 'auto';
    setState(() => _flashMode = _stringToFlash(v));
  }

  Future<void> _saveFlash(FlashMode m) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString('flashMode', _flashToString(m));
  }

  Future<void> _loadMirror() async {
    final sp = await SharedPreferences.getInstance();
    setState(() => _mirrorFront = sp.getBool('mirrorFront') ?? true);
  }

  Future<void> _saveMirror(bool v) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool('mirrorFront', v);
  }

  // ======== Flash helpers ========
  String _flashToString(FlashMode m) {
    switch (m) {
      case FlashMode.on:
        return 'on';
      case FlashMode.auto:
        return 'auto';
      case FlashMode.always:
        return 'always';
      case FlashMode.none:
      default:
        return 'none';
    }
  }

  FlashMode _stringToFlash(String s) {
    switch (s) {
      case 'on':
        return FlashMode.on;
      case 'auto':
        return FlashMode.auto;
      case 'always':
        return FlashMode.always;
      case 'none':
      default:
        return FlashMode.none;
    }
  }

  IconData _flashIcon(FlashMode m) {
    switch (m) {
      case FlashMode.on:
        return Icons.flash_on;
      case FlashMode.auto:
        return Icons.flash_auto;
      case FlashMode.always:
        return Icons.bolt;
      case FlashMode.none:
      default:
        return Icons.flash_off;
    }
  }

  FlashMode _nextFlash(FlashMode m) {
    switch (m) {
      case FlashMode.none:
        return FlashMode.on;
      case FlashMode.on:
        return FlashMode.auto;
      case FlashMode.auto:
        return FlashMode.always;
      case FlashMode.always:
      default:
        return FlashMode.none;
    }
  }

  // ======== Exposure helpers ========
  double _levelToBrightness01(int level) {
    final v = (level + _expMax) / (_expMax * 2.0);
    return v.clamp(0.0, 1.0);
  }

  void _scheduleExposureApply(dynamic state, int level) {
    _expApplyTimer?.cancel();

    final v01 = _levelToBrightness01(level);

    _expApplyTimer = Timer(_expThrottle, () {
      if ((v01 - _lastSentExposure01).abs() < 0.02) return;
      try {
        state.sensorConfig.setBrightness(v01);
        _lastSentExposure01 = v01;
      } catch (e) {
        debugPrint('[Camera] Exposure set failed: $e');
      }
    });
  }

  // ======== File helpers ========
  Future<String> _saveBytesToTemp(Uint8List bytes) async {
    final dir = await getTemporaryDirectory();
    final name = const Uuid().v4();
    final path = '${dir.path}/$name.jpg';
    final f = File(path)..createSync(recursive: true);
    await f.writeAsBytes(bytes);
    return path;
  }

  bool _isFrontFromEvent(MediaCapture event) {
    try {
      return event.captureRequest.when(
        single: (s) => s.sensor.position == SensorPosition.front,
        multiple: (m) =>
        m.fileBySensor.keys.first.position == SensorPosition.front,
      );
    } catch (_) {
      return false;
    }
  }

  Future<Uint8List> _maybeMirrorBytes(
      Uint8List bytes, {
        required bool isFront,
      }) async {
    if (!(_mirrorFront && isFront)) return bytes;
    try {
      final src = imglib.decodeImage(bytes);
      if (src == null) return bytes;
      final flipped = imglib.flipHorizontal(src);
      final out = imglib.encodeJpg(flipped, quality: 95);
      return Uint8List.fromList(out);
    } catch (_) {
      return bytes;
    }
  }

  // ======== Crop screen ========
  Future<String?> _openCropper(Uint8List imageBytes) async {
    final l10n = AppLocalizations.of(context)!;
    String? resultPath;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(l10n.crop43)),
          body: Stack(
            children: [
              Crop(
                image: imageBytes,
                controller: _cropController,
                onCropped: (result) async {
                  switch (result) {
                    case CropSuccess(:final croppedImage):
                      setState(() => _isCropping = false);
                      resultPath = await _saveBytesToTemp(croppedImage);
                      if (!mounted) return;
                      showCustomSnackbar(
                        title: l10n.success,
                        message: l10n.imageCroppedSuccess,
                        backgroundColor: Colors.green,
                      );
                      Navigator.of(context).pop();
                    case CropFailure(:final cause):
                      setState(() => _isCropping = false);
                      debugPrint('Crop failed: $cause');
                      if (!mounted) return;
                      showCustomSnackbar(
                        title: l10n.error,
                        message: l10n.cropFailed,
                        backgroundColor: Colors.red,
                      );
                  }
                },
                aspectRatio: 4 / 3,
                baseColor: Colors.blue.shade900,
                maskColor: Colors.white.withAlpha(100),
                progressIndicator: const CircularProgressIndicator(),
                radius: 20,
                interactive: true,
              ),
              if (_isCropping) const Center(child: CircularProgressIndicator()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() => _isCropping = true);
                          _cropController.crop();
                        },
                        child: Text(l10n.crop),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(l10n.cancel),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return resultPath;
  }

  String? _pathFromEvent(MediaCapture event) {
    return event.captureRequest.when(
      single: (s) => s.file?.path,
      multiple: (m) {
        if (m.fileBySensor.isEmpty) return null;
        return m.fileBySensor.values.first?.path;
      },
    );
  }

  // v5.2.7: Build zoom slider widget (vertical, right side)
  Widget _buildZoomSlider() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: RotatedBox(
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
            onChanged: (value) {
              HapticFeedback.selectionClick();
              setState(() => _currentZoom = value);
              _applyZoom(_cameraState, value);
            },
            onChangeEnd: (value) {
              HapticFeedback.selectionClick();
              _saveZoom(value);
            },
          ),
        ),
      ),
    );
  }

  // v5.2.7: Build zoom indicator
  Widget _buildZoomIndicator() {
    // Convert 0-1 range to display value (1x - 4x typical)
    final displayZoom = 1.0 + (_currentZoom * 3.0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.zoom_in, color: Colors.white70, size: 16),
          const SizedBox(width: 4),
          Text(
            '${displayZoom.toStringAsFixed(1)}x',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CameraAwesomeBuilder.awesome(
            saveConfig: SaveConfig.photo(
              pathBuilder: (sensors) async {
                final dir = await getTemporaryDirectory();
                final name = DateTime.now().millisecondsSinceEpoch.toString();
                return SingleCaptureRequest('${dir.path}/$name.jpg', sensors.first);
              },
            ),
            sensorConfig: SensorConfig.single(
              aspectRatio: CameraAspectRatios.ratio_4_3,
              flashMode: _flashMode,
              sensor: Sensor.position(
                _isSelfieMode ? SensorPosition.front : SensorPosition.back,
              ),
              zoom: _currentZoom, // v5.2.7: Apply initial zoom
            ),
            theme: AwesomeTheme(),
            topActionsBuilder: (state) => const SizedBox.shrink(),

            onMediaCaptureEvent: (event) async {
              if (_handlingCapture) return;
              if (event.isPicture && event.status == MediaCaptureStatus.success) {
                _handlingCapture = true;
                _cancelAutoCapture();

                try {
                  final path = _pathFromEvent(event);
                  if (path == null) return;

                  final isFront = _isFrontFromEvent(event);
                  final original = await File(path).readAsBytes();
                  final adjusted = await _maybeMirrorBytes(original, isFront: isFront);
                  final cropped = await _openCropper(adjusted);
                  if (!context.mounted || cropped == null) return;

                  final res = await ImageGallerySaverPlus.saveFile(cropped);
                  if (res['isSuccess'] == true) {
                    showCustomSnackbar(
                      title: l10n.saved,
                      message: l10n.imageSavedToGallery,
                      backgroundColor: Colors.green,
                    );
                  }

                  if (widget.rightEye) {
                    if (!context.mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            TakeRightEyePhotoScreen(rightEyePhoto: cropped),
                      ),
                    );
                  } else {
                    if (!context.mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            TakeLeftEyePhotoScreen(leftEyePhoto: cropped),
                      ),
                    );
                  }
                } finally {
                  _handlingCapture = false;
                }
              }
            },
            middleContentBuilder: (state) {
              _cameraState = state;

              // v5.2.7: Apply zoom when camera state is available
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_currentZoom > 0) {
                  _applyZoom(state, _currentZoom);
                }
              });

              return Stack(
                children: [
                  // Flash button at TOP-LEFT
                  Align(
                    alignment: Alignment.topLeft,
                    child: SafeArea(
                      minimum: const EdgeInsets.only(top: 8, left: 8),
                      child: StreamBuilder<SensorConfig>(
                        stream: state.sensorConfig$,
                        builder: (_, scSnap) {
                          if (!scSnap.hasData) return const SizedBox.shrink();
                          final sc = scSnap.requireData;
                          return StreamBuilder<FlashMode>(
                            stream: sc.flashMode$,
                            builder: (_, fSnap) {
                              final current = fSnap.data ?? _flashMode;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  tooltip: l10n.flash,
                                  onPressed: () async {
                                    final next = _nextFlash(current);
                                    try {
                                      await sc.setFlashMode(next);
                                    } catch (e) {
                                      debugPrint('[Camera] Flash mode set failed: $e');
                                    }
                                    setState(() => _flashMode = next);
                                    _saveFlash(next);
                                  },
                                  icon: Icon(_flashIcon(current), color: Colors.white, size: 28),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  // Status Indicators at TOP-CENTER (all modes)
                  Align(
                    alignment: Alignment.topCenter,
                    child: SafeArea(
                      minimum: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildCompactStatusIcon(Icons.visibility, _eyeDetected, l10n.eye),
                            const SizedBox(width: 12),
                            _buildCompactStatusIcon(Icons.center_focus_strong, _isWellCentered, l10n.center),
                            const SizedBox(width: 12),
                            _buildCompactStatusIcon(Icons.wb_sunny, _hasGoodLighting, l10n.light),
                            const SizedBox(width: 12),
                            _buildCompactStatusIcon(Icons.check_circle, _isStable, l10n.ready),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Mirror toggle at TOP-RIGHT (only show in manual/auto modes, not selfie)
                  if (!_isSelfieMode)
                    Align(
                      alignment: Alignment.topRight,
                      child: SafeArea(
                        minimum: const EdgeInsets.only(top: 8, right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            ),
                            onPressed: () {
                              setState(() => _mirrorFront = !_mirrorFront);
                              _saveMirror(_mirrorFront);
                            },
                            icon: Icon(
                              Icons.flip,
                              size: 22,
                              color: _mirrorFront ? Colors.amber : Colors.white,
                            ),
                            label: Text(
                              _mirrorFront ? l10n.on : l10n.off,
                              style: const TextStyle(fontSize: 9),
                            ),
                          ),
                        ),
                      ),
                    ),

                  // Exposure slider at TOP (below status indicators)
                  Align(
                    alignment: Alignment.topCenter,
                    child: SafeArea(
                      minimum: const EdgeInsets.only(top: 60),
                      child: Container(
                        width: 280,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              l10n.exposure,
                              style: const TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 4,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                              ),
                              child: Slider(
                                value: _expLevel.toDouble(),
                                min: -_expMax.toDouble(),
                                max: _expMax.toDouble(),
                                divisions: _expMax * 2,
                                label: _expLevel.toString(),
                                activeColor: Colors.white,
                                inactiveColor: Colors.white30,
                                onChanged: (v) {
                                  final lvl = v.round();
                                  setState(() => _expLevel = lvl);
                                  _scheduleExposureApply(state, lvl);
                                },
                                onChangeEnd: (v) =>
                                    _scheduleExposureApply(state, v.round()),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // v5.2.7: Zoom slider at RIGHT SIDE (same position as other screens)
                  Positioned(
                    right: 16,
                    top: 140,
                    bottom: 120,
                    child: _buildZoomSlider(),
                  ),

                  // v5.2.7: Zoom indicator at RIGHT TOP (below mirror toggle)
                  Positioned(
                    right: 16,
                    top: 60,
                    child: _buildZoomIndicator(),
                  ),
                ],
              );
            },
          ),

          // Eye Detection Overlay (all modes) - MUST NOT BLOCK TOUCHES
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: EyeDetectionOverlay(
                  eyeDetected: _eyeDetected,
                  isWellCentered: _isWellCentered,
                  hasGoodLighting: _hasGoodLighting,
                  isStable: _isStable,
                ),
              ),
            ),
          ),

          // Countdown Indicator (auto mode and selfie mode) - MUST NOT BLOCK TOUCHES
          if ((_isAutoMode || _isSelfieMode) && _captureCountdown > 0)
            Center(
              child: IgnorePointer(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.85),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '$_captureCountdown',
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Mode indicator badge (top-left corner) - MUST NOT BLOCK TOUCHES
          Positioned(
            top: 60,
            left: 8,
            child: IgnorePointer(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getModeColor().withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _getModeLabel(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getModeColor() {
    switch (widget.cameraMode) {
      case CameraMode.auto:
        return Colors.green;
      case CameraMode.manual:
        return Colors.blue;
      case CameraMode.selfie:
        return Colors.purple;
    }
  }

  String _getModeLabel() {
    final l10n = AppLocalizations.of(context)!;
    switch (widget.cameraMode) {
      case CameraMode.auto:
        return l10n.auto;
      case CameraMode.manual:
        return l10n.manual;
      case CameraMode.selfie:
        return l10n.selfie;
    }
  }

  Widget _buildCompactStatusIcon(IconData icon, bool isGood, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isGood ? Colors.green : Colors.grey.shade600,
          size: 18,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: isGood ? Colors.green : Colors.grey.shade600,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _expApplyTimer?.cancel();
    _detectionTimer?.cancel();
    _countdownTimer?.cancel();
    _stabilityTimer?.cancel();
    _detector.dispose();
    super.dispose();
  }
}

// Eye Detection Overlay Painter
class EyeDetectionOverlay extends CustomPainter {
  final bool eyeDetected;
  final bool isWellCentered;
  final bool hasGoodLighting;
  final bool isStable;

  EyeDetectionOverlay({
    required this.eyeDetected,
    required this.isWellCentered,
    required this.hasGoodLighting,
    required this.isStable,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Draw center guide circle
    final centerGuideRadius = size.width * 0.25;
    paint.color = _getGuideColor();
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      centerGuideRadius,
      paint,
    );

    // Draw corners for framing (pointing INWARD)
    paint.strokeWidth = 4;
    const cornerLength = 40.0;

    // Top-left corner
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.35),
      Offset(size.width * 0.2 + cornerLength, size.height * 0.35),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.35),
      Offset(size.width * 0.2, size.height * 0.35 + cornerLength),
      paint,
    );

    // Top-right corner
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.35),
      Offset(size.width * 0.8 - cornerLength, size.height * 0.35),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.35),
      Offset(size.width * 0.8, size.height * 0.35 + cornerLength),
      paint,
    );

    // Bottom-left corner
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.65),
      Offset(size.width * 0.2 + cornerLength, size.height * 0.65),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.65),
      Offset(size.width * 0.2, size.height * 0.65 - cornerLength),
      paint,
    );

    // Bottom-right corner
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.65),
      Offset(size.width * 0.8 - cornerLength, size.height * 0.65),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.65),
      Offset(size.width * 0.8, size.height * 0.65 - cornerLength),
      paint,
    );
  }

  Color _getGuideColor() {
    if (isStable) return Colors.green;
    if (isWellCentered && hasGoodLighting && eyeDetected) return Colors.yellow;
    if (eyeDetected) return Colors.orange;
    return Colors.red;
  }

  @override
  bool shouldRepaint(EyeDetectionOverlay oldDelegate) => true;
}