// lib/presentation/camera_screen/camera_mode_selector.dart
// Camera Mode Selector - WITH PLATFORM-SPECIFIC OPTIONS

import 'dart:io';
import 'package:ai_eye_capture/presentation/camera_screen/secure_uvc_camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:ai_eye_capture/constant/color.dart';
import 'package:ai_eye_capture/presentation/camera_screen/camera_preview.dart';
import 'package:ai_eye_capture/presentation/camera_screen/simple_gated_camera.dart';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/right_eye_screen/take_right_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/video_mode/video_capture_screen.dart' as plr_video;
import 'package:ai_eye_capture/presentation/camera_screen/uvc_camera_screen.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

class CameraModeSelectorPage extends StatefulWidget {
  final dynamic camera;
  final bool rightEye;

  const CameraModeSelectorPage({
    super.key,
    this.camera,
    required this.rightEye,
  });

  @override
  State<CameraModeSelectorPage> createState() => _CameraModeSelectorPageState();
}

class _CameraModeSelectorPageState extends State<CameraModeSelectorPage> {
  bool _showAdvancedModes = true;
  List<CameraDescription> _availableCameras = [];
  bool _hasExternalCamera = false;

  // Platform detection helper
  bool get _isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  @override
  void initState() {
    super.initState();
    _detectCameras();
  }

  Future<void> _detectCameras() async {
    try {
      final cameras = await availableCameras();
      setState(() {
        _availableCameras = cameras;
        _hasExternalCamera = cameras.any((cam) =>
        cam.name.toLowerCase().contains('external') ||
            cam.name.toLowerCase().contains('usb') ||
            cam.name.toLowerCase().contains('uvc') ||
            cameras.length > 2
        );
      });

      if (_availableCameras.length > 2) {
        debugPrint('🔍 Detected ${_availableCameras.length} cameras (possible external device)');
        for (var cam in _availableCameras) {
          debugPrint('   📷 ${cam.name} - ${cam.lensDirection}');
        }
      }
    } catch (e) {
      debugPrint('Error detecting cameras: $e');
    }
  }

  // Helper to get permanent gallery images directory
  Future<Directory> _getGalleryImagesDirectory() async {
    Directory baseDir;

    if (Platform.isAndroid) {
      final extDir = await getExternalStorageDirectory();
      baseDir = extDir ?? await getApplicationDocumentsDirectory();
    } else {
      // Windows/macOS/Linux/iOS
      baseDir = await getApplicationDocumentsDirectory();
    }

    final galleryDir = Directory('${baseDir.path}/GalleryImages');
    if (!await galleryDir.exists()) {
      await galleryDir.create(recursive: true);
    }

    return galleryDir;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(l10n.selectCameraMode, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if (_availableCameras.isNotEmpty)
            IconButton(
              icon: Badge(
                isLabelVisible: _hasExternalCamera,
                backgroundColor: Colors.green,
                smallSize: 8,
                child: const Icon(Icons.videocam),
              ),
              tooltip: l10n.detectedCameras,
              onPressed: () => _showDetectedCameras(context),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt, size: 80, color: AppColor.primaryColor),
            const SizedBox(height: 20),
            Text(
              widget.rightEye ? l10n.rightEyePhoto : l10n.leftEyePhoto,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 40),

            // === MOBILE ONLY: AUTO-CAPTURE (REAR) ===
            if (!_isDesktop) ...[
              _buildNewModeCard(
                context: context,
                icon: Icons.auto_awesome,
                title: l10n.autoCapture,
                description: l10n.qualityGatedRear,
                color: Colors.green,
                useFrontCamera: false,
              ),
              const SizedBox(height: 16),
            ],

            // === MOBILE ONLY: MANUAL CAPTURE ===
            if (!_isDesktop) ...[
              _buildManualModeCard(context, l10n),
              const SizedBox(height: 16),
            ],

            // === MOBILE ONLY: SELFIE MODE (FRONT) ===
            if (!_isDesktop) ...[
              _buildNewModeCard(
                context: context,
                icon: Icons.face,
                title: l10n.selfieMode,
                description: l10n.qualityGatedFront,
                color: Colors.purple,
                useFrontCamera: true,
              ),
              const SizedBox(height: 16),
            ],

            // === LOAD FROM GALLERY (ALL PLATFORMS) ===
            _buildGalleryModeCard(context, l10n),

            // === EXTERNAL USB IRISCOPE MODE (ALWAYS VISIBLE ON DESKTOP) ===
            if (_isDesktop || _hasExternalCamera || _availableCameras.length > 2) ...[
              const SizedBox(height: 16),
              _buildExternalCameraModeCard(context, l10n),
            ],

            // === MOBILE ONLY: PLR MODES ===
            if (!_isDesktop) ...[
              const SizedBox(height: 24),
              _buildPLRDivider(l10n),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildPLRModeCard(
                      context: context,
                      title: l10n.plrVideoRear,
                      subtitle: l10n.plrVideoRearDesc,
                      icon: Icons.videocam,
                      useFrontCamera: false,
                    ),
                    const SizedBox(height: 12),
                    _buildPLRModeCard(
                      context: context,
                      title: l10n.plrVideoSelfie,
                      subtitle: l10n.plrVideoSelfieDesc,
                      icon: Icons.face_retouching_natural,
                      useFrontCamera: true,
                    ),
                  ],
                ),
                crossFadeState: _showAdvancedModes
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// NEW: Gallery mode card - prominent button to load from gallery
  Widget _buildGalleryModeCard(BuildContext context, AppLocalizations l10n) {
    const color = Colors.orange;
    return InkWell(
      onTap: () => _showGalleryOptions(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), Colors.amber.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.photo_library, size: 40, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.loadFromGallery,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.selectEyeImageFromDevice,
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.7), size: 20),
          ],
        ),
      ),
    );
  }

  void _showDetectedCameras(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Row(
          children: [
            const Icon(Icons.videocam, color: Colors.white),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                l10n.detectedCameras,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._availableCameras.asMap().entries.map((entry) {
              final idx = entry.key;
              final cam = entry.value;
              final isExternal = cam.name.toLowerCase().contains('external') ||
                  cam.name.toLowerCase().contains('usb') ||
                  cam.name.toLowerCase().contains('uvc');
              final directionIcon = cam.lensDirection == CameraLensDirection.front
                  ? Icons.face
                  : cam.lensDirection == CameraLensDirection.back
                  ? Icons.camera_rear
                  : Icons.videocam;

              return ListTile(
                leading: Icon(
                  isExternal ? Icons.usb : directionIcon,
                  color: isExternal ? Colors.green : Colors.blue,
                ),
                title: Text(
                  isExternal ? l10n.externalCamera : l10n.cameraIndex(idx),
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${cam.name}\n${cam.lensDirection.name}',
                  style: TextStyle(color: Colors.grey[400], fontSize: 11),
                ),
                trailing: isExternal
                    ? Chip(
                  label: Text(l10n.usbLabel, style: const TextStyle(fontSize: 10)),
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.zero,
                )
                    : null,
              );
            }),
            const Divider(color: Colors.grey),
            Text(
              _hasExternalCamera
                  ? '${l10n.externalCamera} ${l10n.detected.toLowerCase()}'
                  : l10n.noExternalCameraDetected,
              style: TextStyle(
                color: _hasExternalCamera ? Colors.green : Colors.grey[500],
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _detectCameras();
            },
            child: Text(l10n.refresh),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  Widget _buildManualModeCard(BuildContext context, AppLocalizations l10n) {
    const color = Colors.blue;
    return InkWell(
      onTap: () => _showCameraSourceSelector(context, l10n),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.camera, size: 40, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.manualCapture,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 4),
                  Text(l10n.manualCaptureDesc,
                      style: const TextStyle(fontSize: 13, color: Colors.white70)),
                  if (_availableCameras.length > 2)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          Icon(Icons.usb, size: 14, color: Colors.green[300]),
                          const SizedBox(width: 4),
                          Text(
                            l10n.camerasAvailable(_availableCameras.length),
                            style: TextStyle(fontSize: 11, color: Colors.green[300]),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.7), size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExternalCameraModeCard(BuildContext context, AppLocalizations l10n) {
    const color = Colors.teal;
    return InkWell(
      onTap: () => _launchExternalCamera(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), Colors.green.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.usb, size: 40, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          l10n.iriscopeExternal,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(l10n.usbLabel, style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.useConnectedUsbCamera,
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.7), size: 20),
          ],
        ),
      ),
    );
  }

  void _showCameraSourceSelector(BuildContext context, AppLocalizations l10n) {
    if (_availableCameras.length <= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CameraPreviewPage(
            camera: widget.camera,
            rightEye: widget.rightEye,
            cameraMode: CameraMode.manual,
          ),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(ctx).padding.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.selectCameraSource,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.camerasDetected(_availableCameras.length),
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                ),
                const SizedBox(height: 24),
                ..._availableCameras.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final cam = entry.value;
                  final isExternal = cam.name.toLowerCase().contains('external') ||
                      cam.name.toLowerCase().contains('usb') ||
                      cam.name.toLowerCase().contains('uvc') ||
                      (idx >= 2);

                  final color = isExternal
                      ? Colors.teal
                      : (cam.lensDirection == CameraLensDirection.front
                      ? Colors.purple
                      : Colors.blue);

                  final icon = isExternal
                      ? Icons.usb
                      : (cam.lensDirection == CameraLensDirection.front
                      ? Icons.face
                      : Icons.camera_rear);

                  final title = isExternal
                      ? l10n.externalCameraIndex(idx - 1)
                      : (cam.lensDirection == CameraLensDirection.front
                      ? l10n.frontCamera
                      : l10n.rearCamera);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildGalleryOption(
                      context: context,
                      title: title,
                      subtitle: cam.name,
                      icon: icon,
                      color: color,
                      onTap: () {
                        Navigator.pop(ctx);
                        _launchManualWithCamera(context, cam);
                      },
                    ),
                  );
                }),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchManualWithCamera(BuildContext context, CameraDescription camera) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraPreviewPage(
          camera: camera,
          rightEye: widget.rightEye,
          cameraMode: CameraMode.manual,
        ),
      ),
    );
  }

  void _launchExternalCamera(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SecureUvcCameraScreen(
          isRightEye: widget.rightEye,
        ),
      ),
    );
  }

  Widget _buildNewModeCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required bool useFrontCamera,
  }) {
    return InkWell(
      onTap: () => _navigateToGatedCamera(context, useFrontCamera: useFrontCamera),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(fontSize: 13, color: Colors.white70)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.7), size: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToGatedCamera(BuildContext context, {required bool useFrontCamera}) async {
    final cameras = await availableCameras();
    final result = await Navigator.push<CaptureResult>(
      context,
      MaterialPageRoute(
        builder: (context) => SimpleGatedCameraScreen(
          camera: cameras.first,
          isRightEye: widget.rightEye,
          enableAutoCapture: true,
          useFrontCamera: useFrontCamera,
          referenceZoom: widget.rightEye ? null : globalRightEyeZoom,
          referenceIrisSize: widget.rightEye ? null : globalRightEyeIrisSize,
        ),
      ),
    );

    if (result != null && mounted) {
      if (widget.rightEye) {
        globalRightEyeZoom = result.zoomLevel;
        globalRightEyeIrisSize = result.estimatedIrisSize;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TakeRightEyePhotoScreen(
              camera: cameras.first,
              rightEyePhoto: result.imagePath,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TakeLeftEyePhotoScreen(
              camera: cameras.first,
              leftEyePhoto: result.imagePath,
              rightEyePhoto: rightEyePic,
            ),
          ),
        );
      }
    }
  }

  Widget _buildPLRDivider(AppLocalizations l10n) {
    return InkWell(
      onTap: () => setState(() => _showAdvancedModes = !_showAdvancedModes),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[700], thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(_showAdvancedModes ? Icons.expand_less : Icons.expand_more, color: Colors.pinkAccent, size: 20),
                  const SizedBox(width: 8),
                  Text(l10n.plrModes, style: const TextStyle(color: Colors.pinkAccent, fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[700], thickness: 1)),
          ],
        ),
      ),
    );
  }

  Widget _buildPLRModeCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required bool useFrontCamera,
  }) {
    const color = Colors.pinkAccent;
    return InkWell(
      onTap: () => _showPLREyeSelector(context, useFrontCamera: useFrontCamera),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.25), Colors.deepPurple.withOpacity(0.15)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.5), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.white70)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.6), size: 18),
          ],
        ),
      ),
    );
  }

  void _showPLREyeSelector(BuildContext context, {required bool useFrontCamera}) {
    final l10n = AppLocalizations.of(context)!;
    final cameraLabel = useFrontCamera ? l10n.frontCamera : l10n.rearCamera;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[600], borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 20),
            Text(l10n.plrVideoCapture, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(cameraLabel, style: TextStyle(fontSize: 13, color: Colors.pinkAccent.withOpacity(0.8))),
            const SizedBox(height: 8),
            Text(l10n.selectEyeToAssess, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
            const SizedBox(height: 24),
            _buildGalleryOption(context: context, title: l10n.rightEyeOD, subtitle: l10n.recordPlrRightEye, icon: Icons.visibility, color: Colors.green, onTap: () { Navigator.pop(ctx); _navigateToPLR(context, isRightEye: true, useFrontCamera: useFrontCamera); }),
            const SizedBox(height: 12),
            _buildGalleryOption(context: context, title: l10n.leftEyeOS, subtitle: l10n.recordPlrLeftEye, icon: Icons.visibility_outlined, color: Colors.blue, onTap: () { Navigator.pop(ctx); _navigateToPLR(context, isRightEye: false, useFrontCamera: useFrontCamera); }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _navigateToPLR(BuildContext context, {required bool isRightEye, required bool useFrontCamera}) {
    final l10n = AppLocalizations.of(context)!;
    Navigator.push(context, MaterialPageRoute(builder: (_) => plr_video.VideoCaptureScreen(eyeLabel: isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS, isRightEye: isRightEye, useFrontCamera: useFrontCamera, patientName: globalPatientInfo?.name)));
  }

  void _showGalleryOptions(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[600], borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 20),
              Text(l10n.loadFromGallery, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 8),
              Text(l10n.selectEyeImageFromDevice, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
              const SizedBox(height: 24),
              _buildGalleryOption(context: context, title: l10n.bothEyes, subtitle: l10n.loadBothEyesDesc, icon: Icons.remove_red_eye, color: Colors.orange, onTap: () { Navigator.pop(context); _loadBothEyesFromGallery(context); }),
              const SizedBox(height: 12),
              _buildGalleryOption(context: context, title: l10n.rightEyeOD, subtitle: l10n.loadRightEyeImage, icon: Icons.visibility, color: Colors.green, onTap: () { Navigator.pop(context); _loadFromGallery(context, isLeftEye: false); }),
              const SizedBox(height: 12),
              _buildGalleryOption(context: context, title: l10n.leftEyeOS, subtitle: l10n.loadLeftEyeImage, icon: Icons.visibility_outlined, color: Colors.blue, onTap: () { Navigator.pop(context); _loadFromGallery(context, isLeftEye: true); }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryOption({required BuildContext context, required String title, required String subtitle, required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: color, size: 28)),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)), const SizedBox(height: 2), Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[400]))])),
            Icon(Icons.arrow_forward_ios, color: color.withOpacity(0.5), size: 18),
          ],
        ),
      ),
    );
  }

  bool _isEyeImage(EyeValidationResult v) =>
      v.checkResults['hasDarkCenter'] == true &&
      v.checkResults['hasCircle'] == true;

  void _showNotAnEyeDialog(BuildContext context, String eyeLabel) {
    final l10n = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.orange),
          const SizedBox(width: 8),
          Text(l10n.notAnEyeImageTitle),
        ]),
        content: Text(l10n.notAnEyeImageBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  Future<void> _loadBothEyesFromGallery(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final picker = ImagePicker();
      final galleryDir = await _getGalleryImagesDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.selectRightEyeFirst), backgroundColor: Colors.green, duration: const Duration(seconds: 2)));
      await Future.delayed(const Duration(milliseconds: 500));

      final XFile? rightImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (rightImage == null) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.cancelledNoRightEye), backgroundColor: Colors.orange));
        return;
      }

      final rightBytes = await rightImage.readAsBytes();
      try {
        final rightValidation = await EyeValidator().validateBytes(rightBytes);
        if (rightValidation.checkResults.isNotEmpty && !_isEyeImage(rightValidation)) {
          if (context.mounted) _showNotAnEyeDialog(context, 'right');
          return;
        }
      } catch (_) {}
      final rightFile = File('${galleryDir.path}/gallery_right_$timestamp.jpg');
      await rightFile.writeAsBytes(rightBytes);

      scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.rightEyeSaved), backgroundColor: Colors.blue, duration: const Duration(seconds: 2)));
      await Future.delayed(const Duration(milliseconds: 500));

      final XFile? leftImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (leftImage == null) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.cancelledNoLeftEye), backgroundColor: Colors.orange));
        return;
      }

      final leftBytes = await leftImage.readAsBytes();
      try {
        final leftValidation = await EyeValidator().validateBytes(leftBytes);
        if (leftValidation.checkResults.isNotEmpty && !_isEyeImage(leftValidation)) {
          if (context.mounted) _showNotAnEyeDialog(context, 'left');
          return;
        }
      } catch (_) {}
      final leftFile = File('${galleryDir.path}/gallery_left_$timestamp.jpg');
      await leftFile.writeAsBytes(leftBytes);

      debugPrint('📁 Gallery images saved to: ${galleryDir.path}');

      Get.to(() => TakeLeftEyePhotoScreen(rightEyePhoto: rightFile.path, leftEyePhoto: leftFile.path, isFromGallery: true));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.errorLoadingImages(e.toString())), backgroundColor: Colors.red));
    }
  }

  Future<void> _loadFromGallery(BuildContext context, {required bool isLeftEye}) async {
    final l10n = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

      if (image != null) {
        final imageBytes = await image.readAsBytes();
        try {
          final validation = await EyeValidator().validateBytes(imageBytes);
          if (validation.checkResults.isNotEmpty && !_isEyeImage(validation)) {
            if (context.mounted) _showNotAnEyeDialog(context, isLeftEye ? 'left' : 'right');
            return;
          }
        } catch (_) {}
        final galleryDir = await _getGalleryImagesDirectory();
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final eyeLabel = isLeftEye ? 'left' : 'right';
        final savedFile = File('${galleryDir.path}/gallery_${eyeLabel}_$timestamp.jpg');
        await savedFile.writeAsBytes(imageBytes);

        debugPrint('📁 Gallery image saved to: ${savedFile.path}');

        Get.to(() => TakeLeftEyePhotoScreen(
            rightEyePhoto: isLeftEye ? null : savedFile.path,
            leftEyePhoto: isLeftEye ? savedFile.path : null,
            isFromGallery: true
        ));
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.errorLoadingImages(e.toString())), backgroundColor: Colors.red));
    }
  }
}