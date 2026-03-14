// lib/presentation/video_mode/video_capture_screen.dart
// Video mode for PLR (Pupillary Light Reflex) analysis - LOCALIZED VERSION
// v5.2.8 - Zoom slider repositioned further right

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/app_branding.dart';
import 'package:ai_eye_capture/presentation/video_mode/plr_analysis_test_screen.dart';
import 'package:ai_eye_capture/utils/plr_constants.dart';

class VideoCaptureScreen extends StatefulWidget {
  final String eyeLabel;
  final bool isRightEye;
  final bool useFrontCamera;
  final String? patientName;

  const VideoCaptureScreen({
    super.key,
    required this.eyeLabel,
    required this.isRightEye,
    this.useFrontCamera = false,
    this.patientName,
  });

  @override
  State<VideoCaptureScreen> createState() => _VideoCaptureScreenState();
}

class _VideoCaptureScreenState extends State<VideoCaptureScreen> with TickerProviderStateMixin {
  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];
  bool _isInitialized = false;
  bool _isRecording = false;
  bool _isFlashOn = false;
  String? _errorMessage;
  int _actualFrameRate = 0;
  String _selectedCameraName = '';

  // v5.2.7: Zoom control
  double _currentZoom = 1.0;
  double _minZoom = 1.0;
  double _maxZoom = 1.0;

  int _recordingSeconds = 0;
  Timer? _recordingTimer;
  static const int maxRecordingSeconds = PLRNormativeValues.recordingDurationSec;

  PLRPhase _currentPhase = PLRPhase.ready;
  int _phaseCountdown = 3;
  Timer? _phaseTimer;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initCamera();
    _initAnimations();
  }

  void _initAnimations() {
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() => _errorMessage = 'noCamerasFound');
        return;
      }

      final targetDirection = widget.useFrontCamera ? CameraLensDirection.front : CameraLensDirection.back;
      CameraDescription? selectedCamera;
      for (var cam in _cameras) {
        if (cam.lensDirection == targetDirection) {
          selectedCamera = cam;
          break;
        }
      }
      selectedCamera ??= _cameras.first;
      _selectedCameraName = selectedCamera.lensDirection == CameraLensDirection.front ? 'front' : 'rear';

      _cameraController = CameraController(selectedCamera, ResolutionPreset.high, enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);
      await _cameraController!.initialize();
      _actualFrameRate = PLRNormativeValues.targetFrameRate;

      // v5.2.7: Initialize zoom levels
      _minZoom = await _cameraController!.getMinZoomLevel();
      _maxZoom = await _cameraController!.getMaxZoomLevel();
      _currentZoom = _minZoom;

      try {
        await _cameraController!.setExposureMode(ExposureMode.locked);
        await _cameraController!.setFocusMode(FocusMode.locked);
      } catch (e) {
        debugPrint('[PLR] Could not lock exposure/focus: $e');
      }

      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      if (mounted) setState(() => _errorMessage = e.toString());
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _recordingTimer?.cancel();
    _phaseTimer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _startPLRSequence() {
    setState(() {
      _currentPhase = PLRPhase.countdown;
      _phaseCountdown = 3;
    });
    _phaseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _phaseCountdown--;
        if (_phaseCountdown <= 0) {
          timer.cancel();
          _startRecording();
        }
      });
    });
  }

  Future<void> _startRecording() async {
    if (_cameraController == null || !_isInitialized) return;
    try {
      await _cameraController!.startVideoRecording();
      setState(() {
        _isRecording = true;
        _recordingSeconds = 0;
        _currentPhase = PLRPhase.baseline;
      });
      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        setState(() {
          _recordingSeconds++;
          if (_recordingSeconds == PLRNormativeValues.flashTriggerSec) {
            _currentPhase = PLRPhase.flash;
            _triggerFlash();
          } else if (_recordingSeconds == PLRNormativeValues.flashTriggerSec + 1) {
            _currentPhase = PLRPhase.constriction;
          } else if (_recordingSeconds == 7) {
            _currentPhase = PLRPhase.recovery;
          } else if (_recordingSeconds >= maxRecordingSeconds) {
            timer.cancel();
            _stopRecording();
          }
        });
      });
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    }
  }

  Future<void> _stopRecording() async {
    if (_cameraController == null || !_isRecording) return;
    try {
      final video = await _cameraController!.stopVideoRecording();
      if (!mounted) return;
      setState(() {
        _isRecording = false;
        _currentPhase = PLRPhase.complete;
      });
      _showCompletionDialog(video.path);
    } catch (e) {
      if (mounted) setState(() => _errorMessage = e.toString());
    }
  }

  void _triggerFlash() async {
    if (_cameraController != null) {
      try {
        await _cameraController!.setFlashMode(FlashMode.torch);
        setState(() => _isFlashOn = true);
        await Future.delayed(Duration(milliseconds: PLRNormativeValues.flashDurationMs));
        await _cameraController!.setFlashMode(FlashMode.off);
        setState(() => _isFlashOn = false);
      } catch (e) {
        debugPrint('[PLR] Flash error: $e');
      }
    }
  }

  void _showCompletionDialog(String videoPath) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.success, size: 28),
            const SizedBox(width: 12),
            Flexible(child: Text(l10n.recordingComplete, style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.plrVideoCapturedSuccess, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow(l10n.duration, '$maxRecordingSeconds ${l10n.seconds}'),
                  _infoRow(l10n.frameRate, '${_actualFrameRate}fps'),
                  _infoRow(l10n.camera, _selectedCameraName == 'front' ? l10n.frontCamera : l10n.rearCamera),
                  _infoRow(l10n.eye, widget.eyeLabel),
                  if (widget.patientName != null) _infoRow(l10n.patient, widget.patientName!),
                  _infoRow(l10n.flash, l10n.flashAt(PLRNormativeValues.flashTriggerSec, PLRNormativeValues.flashDurationMs)),
                  _infoRow(l10n.zoom, '${_currentZoom.toStringAsFixed(1)}x'),
                  const Divider(color: Colors.white24, height: 16),
                  _infoRow(l10n.phases, l10n.phasesFlow),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.blueGrey.withOpacity(0.3))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.expectedNormalValues, style: const TextStyle(color: Colors.blueGrey, fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('• ${l10n.latency}: ${PLRNormativeValues.latencyMsMin.toInt()}-${PLRNormativeValues.latencyMsMax.toInt()}ms', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                  Text('• ${l10n.constriction}: ${PLRNormativeValues.constrictionPercentMin.toInt()}-${PLRNormativeValues.constrictionPercentMax.toInt()}%', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                  Text('• ${l10n.velocity}: ${PLRNormativeValues.avgConstrictionVelocityMin.toStringAsFixed(1)}-${PLRNormativeValues.avgConstrictionVelocityMax.toStringAsFixed(1)} mm/s', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PLRAnalysisTestScreen(videoPath: videoPath, isRightEye: widget.isRightEye, patientName: widget.patientName)));
                },
                icon: const Icon(Icons.science, size: 18),
                label: Text(l10n.testFrameAnalysis),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 12)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () { Navigator.pop(ctx); _resetCapture(); }, child: Text(l10n.retake)),
          ElevatedButton(
            onPressed: () { Navigator.pop(ctx); Navigator.pop(context, videoPath); },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.black),
            child: Text(l10n.done),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 80, child: Text('$label:', style: const TextStyle(color: Colors.white54, fontSize: 12))),
          Expanded(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 12))),
        ],
      ),
    );
  }

  void _resetCapture() {
    setState(() {
      _currentPhase = PLRPhase.ready;
      _recordingSeconds = 0;
      _isRecording = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(l10n.videoCaptureTitle(widget.eyeLabel), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15), overflow: TextOverflow.ellipsis),
            Text(widget.useFrontCamera ? l10n.frontCamera : l10n.rearCamera, style: TextStyle(color: Colors.pinkAccent.withOpacity(0.8), fontSize: 11)),
          ],
        ),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.useFrontCamera ? Icons.camera_front : Icons.camera_rear, color: Colors.pinkAccent, size: 14),
                const SizedBox(width: 4),
                Text('${PLRNormativeValues.targetFrameRate}fps', style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.help_outline, color: Colors.white, size: 22), onPressed: () => _showHelpDialog(l10n)),
        ],
      ),
      body: _errorMessage != null
          ? _buildError(l10n)
          : !_isInitialized
          ? _buildLoading(l10n)
          : _buildCaptureUI(l10n),
    );
  }

  Widget _buildLoading(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.primary),
          const SizedBox(height: 16),
          Text(l10n.initializingCamera, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(l10n.usingCamera(widget.useFrontCamera ? l10n.frontCamera.toLowerCase() : l10n.rearCamera.toLowerCase()), style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildError(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppColors.error),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(_errorMessage == 'noCamerasFound' ? l10n.noCamerasFound : l10n.cameraError(_errorMessage!), style: const TextStyle(color: Colors.white70), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _initCamera, child: Text(l10n.retry)),
        ],
      ),
    );
  }

  Widget _buildCaptureUI(AppLocalizations l10n) {
    return Column(
      children: [
        _buildPhaseIndicator(l10n),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Camera preview
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: CameraPreview(_cameraController!),
                ),
              ),

              // Overlay guide (eye circle)
              _buildOverlayGuide(l10n),

              // v5.2.8: Zoom slider - MOVED FURTHER RIGHT (right: 4 instead of 16)
              Positioned(
                right: 4,
                top: 60,
                bottom: 100,
                child: _buildZoomSlider(),
              ),

              // v5.2.8: Zoom level indicator - MOVED FURTHER RIGHT
              Positioned(
                right: 4,
                top: 16,
                child: _buildZoomIndicator(),
              ),

              // Flash overlay
              if (_isFlashOn)
                Container(
                  color: Colors.white.withOpacity(0.8),
                  child: const Center(
                    child: Icon(Icons.flash_on, size: 100, color: Colors.yellow),
                  ),
                ),

              // Recording indicator - LEFT SIDE
              if (_isRecording)
                Positioned(
                  top: 20,
                  left: 20,
                  child: _buildRecordingIndicator(),
                ),
            ],
          ),
        ),
        _buildControls(l10n),
      ],
    );
  }

  // v5.2.8: Zoom slider widget - slightly wider touch area
  Widget _buildZoomSlider() {
    return Container(
      width: 44, // Slightly wider for easier touch
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(22),
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 18),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white24,
            thumbColor: Colors.white,
          ),
          child: Slider(
            value: _currentZoom,
            min: _minZoom,
            max: _maxZoom,
            onChanged: _isRecording ? null : (value) async {
              await _cameraController?.setZoomLevel(value);
              HapticFeedback.selectionClick();
              setState(() => _currentZoom = value);
            },
            onChangeEnd: (_) => HapticFeedback.selectionClick(),
          ),
        ),
      ),
    );
  }

  // v5.2.8: Zoom level indicator - compact design
  Widget _buildZoomIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search, color: Colors.white70, size: 14),
          const SizedBox(width: 3),
          Text(
            '${_currentZoom.toStringAsFixed(1)}x',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseIndicator(AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: _getPhaseColor().withOpacity(0.5))),
      child: Row(
        children: [
          Icon(_getPhaseIcon(), color: _getPhaseColor(), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_getPhaseTitle(l10n), style: TextStyle(color: _getPhaseColor(), fontWeight: FontWeight.bold)),
                Text(_getPhaseDescription(l10n), style: const TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          if (_currentPhase == PLRPhase.countdown) Text('$_phaseCountdown', style: TextStyle(color: _getPhaseColor(), fontSize: 32, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildOverlayGuide(AppLocalizations l10n) {
    return Container(
      width: 200, height: 200,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: _isRecording ? AppColors.error : AppColors.primary, width: 3)),
      child: Center(
        child: Container(
          width: 80, height: 80,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: _isRecording ? AppColors.error.withOpacity(0.5) : AppColors.primary.withOpacity(0.5), width: 2)),
          child: Center(child: Text(l10n.pupil.toUpperCase(), style: const TextStyle(color: Colors.white54, fontSize: 10))),
        ),
      ),
    );
  }

  Widget _buildRecordingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.error)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTransition(scale: _pulseAnimation, child: Container(width: 12, height: 12, decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle))),
          const SizedBox(width: 8),
          Text('${_recordingSeconds}s / ${maxRecordingSeconds}s', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildControls(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          if (_isRecording)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: LinearProgressIndicator(value: _recordingSeconds / maxRecordingSeconds, backgroundColor: Colors.white24, valueColor: const AlwaysStoppedAnimation(AppColors.error)),
            ),
          if (_currentPhase == PLRPhase.ready)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _startPLRSequence,
                icon: const Icon(Icons.videocam),
                label: Text(l10n.startPlrRecording),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            )
          else if (_isRecording)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _stopRecording,
                icon: const Icon(Icons.stop),
                label: Text(l10n.stopRecording),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.error, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16)),
              ),
            ),
          const SizedBox(height: 12),
          Text(_getInstructionText(l10n), style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Color _getPhaseColor() {
    switch (_currentPhase) {
      case PLRPhase.ready: return AppColors.primary;
      case PLRPhase.countdown: return Colors.orange;
      case PLRPhase.baseline: return Colors.blue;
      case PLRPhase.flash: return Colors.yellow;
      case PLRPhase.constriction: return Colors.purple;
      case PLRPhase.recovery: return Colors.green;
      case PLRPhase.complete: return AppColors.success;
    }
  }

  IconData _getPhaseIcon() {
    switch (_currentPhase) {
      case PLRPhase.ready: return Icons.play_circle_outline;
      case PLRPhase.countdown: return Icons.timer;
      case PLRPhase.baseline: return Icons.remove_red_eye;
      case PLRPhase.flash: return Icons.flash_on;
      case PLRPhase.constriction: return Icons.compress;
      case PLRPhase.recovery: return Icons.trending_up;
      case PLRPhase.complete: return Icons.check_circle;
    }
  }

  String _getPhaseTitle(AppLocalizations l10n) {
    switch (_currentPhase) {
      case PLRPhase.ready: return l10n.phaseReady;
      case PLRPhase.countdown: return l10n.phaseStarting;
      case PLRPhase.baseline: return l10n.phaseBaseline(PLRNormativeValues.flashTriggerSec);
      case PLRPhase.flash: return l10n.phaseFlash;
      case PLRPhase.constriction: return l10n.phaseConstriction(PLRNormativeValues.flashTriggerSec + 1, 7);
      case PLRPhase.recovery: return l10n.phaseRecovery(7, maxRecordingSeconds);
      case PLRPhase.complete: return l10n.phaseComplete;
    }
  }

  String _getPhaseDescription(AppLocalizations l10n) {
    switch (_currentPhase) {
      case PLRPhase.ready: return l10n.readyDesc;
      case PLRPhase.countdown: return l10n.holdSteady;
      case PLRPhase.baseline: return l10n.recordingBaselinePupil;
      case PLRPhase.flash: return l10n.lightStimulus(PLRNormativeValues.flashDurationMs);
      case PLRPhase.constriction: return l10n.measuringConstriction;
      case PLRPhase.recovery: return l10n.measuringRecovery;
      case PLRPhase.complete: return l10n.plrRecordingComplete;
    }
  }

  String _getInstructionText(AppLocalizations l10n) {
    if (_currentPhase == PLRPhase.ready) {
      return l10n.positionEyeInstruction(widget.isRightEye ? l10n.rightEyeOD.toLowerCase() : l10n.leftEyeOS.toLowerCase(), maxRecordingSeconds);
    } else if (_isRecording) {
      return l10n.keepEyeSteadyFlash(PLRNormativeValues.flashTriggerSec);
    }
    return '';
  }

  void _showHelpDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Row(children: [const Icon(Icons.help, color: AppColors.primary), const SizedBox(width: 12), Text(l10n.plrVideoModeTitle, style: const TextStyle(color: Colors.white))]),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.plrAssessmentTitle, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text(l10n.plrInstructions, style: const TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 16),
              Text(l10n.recordingPhases, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 8),
              _helpPhaseRow(Colors.blue, l10n.phaseBaseline(PLRNormativeValues.flashTriggerSec), l10n.baselinePhaseDesc),
              _helpPhaseRow(Colors.yellow, l10n.phaseFlash, l10n.flashPhaseDesc),
              _helpPhaseRow(Colors.purple, l10n.constrictionPhase, l10n.constrictionPhaseDesc),
              _helpPhaseRow(Colors.green, l10n.recovery, l10n.recoveryPhaseDesc),
              const SizedBox(height: 16),
              // v5.2.7: Zoom tip
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.cyan.withOpacity(0.15), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.cyan.withOpacity(0.3))),
                child: Row(
                  children: [
                    const Icon(Icons.zoom_in, color: Colors.cyan, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.zoomSliderTip,
                        style: const TextStyle(color: Colors.cyan, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.normalPlrValues, style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 6),
                    Text('${l10n.latency}: ${PLRNormativeValues.latencyMsMean.toInt()}ms (±${PLRNormativeValues.latencyMsSD.toInt()})', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                    Text('${l10n.constriction}: ${PLRNormativeValues.constrictionPercentMean.toInt()}% (±${PLRNormativeValues.constrictionPercentSD.toInt()})', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                    Text('${l10n.velocity}: ${PLRNormativeValues.avgConstrictionVelocityMean} mm/s (±${PLRNormativeValues.avgConstrictionVelocitySD})', style: const TextStyle(color: Colors.white54, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.gotIt))],
      ),
    );
  }

  Widget _helpPhaseRow(Color color, String phase, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text(phase, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          const Text(' - ', style: TextStyle(color: Colors.white38, fontSize: 12)),
          Expanded(child: Text(description, style: const TextStyle(color: Colors.white54, fontSize: 12))),
        ],
      ),
    );
  }
}

enum PLRPhase { ready, countdown, baseline, flash, constriction, recovery, complete }