// lib/presentation/left_eye_screen/take_left_eye_photo_screen.dart
// LEFT eye screen - WITH USB MODE SUPPORT
// v5.2.4 - Added isFromGallery flag to skip validation for imported images

import 'dart:io';
import 'package:ai_eye_capture/constant/color.dart';
import 'package:ai_eye_capture/presentation/widgets/appbar.dart';
import 'package:ai_eye_capture/presentation/widgets/primary_button.dart';
import 'package:ai_eye_capture/presentation/analysis_screen.dart';
import 'package:ai_eye_capture/presentation/splash_screen/splash_screen.dart';
import 'package:ai_eye_capture/presentation/camera_screen/simple_gated_camera.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/camera_screen/secure_uvc_camera_screen.dart';
import 'package:ai_eye_capture/presentation/camera_screen/android_uvc_camera.dart';
import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/therapy/constitutional_data.dart';

class TakeLeftEyePhotoScreen extends StatefulWidget {
  final CameraDescription? camera;
  final String? leftEyePhoto;
  final String? rightEyePhoto;
  final bool isUsbMode;
  final bool isFromGallery; // NEW: Skip validation for gallery imports

  const TakeLeftEyePhotoScreen({
    super.key,
    this.camera,
    this.leftEyePhoto,
    this.rightEyePhoto,
    this.isUsbMode = false,
    this.isFromGallery = false, // Default to false for camera captures
  });

  @override
  State<TakeLeftEyePhotoScreen> createState() => _TakeLeftEyePhotoScreenState();
}

class _TakeLeftEyePhotoScreenState extends State<TakeLeftEyePhotoScreen> {
  // Windows-only constitutional type selector
  String? _selectedConstitutionId;

  @override
  void initState() {
    super.initState();
    if (widget.leftEyePhoto != null) {
      leftEyePic = widget.leftEyePhoto;
    }
    if (widget.rightEyePhoto != null) {
      rightEyePic = widget.rightEyePhoto;
    }
    // Restore previously selected constitution (if user navigated back)
    _selectedConstitutionId = globalSelectedConstitution;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => SystemNavigator.pop(),
      child: Scaffold(
        appBar: CustomAppbar(
          appExit: true,
          text: widget.leftEyePhoto == null ? l10n.takeLeftEyePhoto : l10n.bothEyesCapturedTitle,
        ),
        body: widget.leftEyePhoto == null
            ? _buildReadyScreen(context, l10n)
            : _buildCapturedScreen(context, l10n),
      ),
    );
  }

  Widget _buildReadyScreen(BuildContext context, AppLocalizations l10n) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Colors.green, Colors.green.withOpacity(0.6)]),
              boxShadow: [BoxShadow(color: Colors.green.withOpacity(0.3), blurRadius: 20, spreadRadius: 5)],
            ),
            child: const Icon(Icons.remove_red_eye, size: 70, color: Colors.white),
          ),
          const SizedBox(height: 24),

          if (widget.isUsbMode)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.teal),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.usb, color: Colors.teal, size: 16),
                  const SizedBox(width: 6),
                  Text(l10n.usbIriscopeMode, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Text(l10n.nowTakingLeftEye, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 32),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  ),
                  child: rightEyePic != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.file(File(rightEyePic!), fit: BoxFit.cover),
                  )
                      : const Icon(Icons.remove_red_eye, color: Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.rightEyeOD, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(l10n.captured, style: const TextStyle(color: Colors.green, fontSize: 13)),
                    ],
                  ),
                ),
                const Icon(Icons.check_circle, color: Colors.green, size: 28),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, color: Colors.amber.shade700, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.useSameDistanceLighting,
                    style: TextStyle(color: Colors.amber.shade800, fontSize: 13, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              splashColor: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              fillColor: Colors.green,
              onPressed: () => _captureLeftEye(context),
              radius: BorderRadius.circular(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  Text(l10n.takeLeftEyePhoto, style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(3)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(l10n.step2of2, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildCapturedScreen(BuildContext context, AppLocalizations l10n) {
    final hasPatientInfo = globalPatientInfo != null;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Show indicator for gallery imports
          if (widget.isFromGallery)
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.photo_library, color: Colors.orange, size: 16),
                  const SizedBox(width: 6),
                  Text(l10n.loadFromGallery, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),

          if (widget.isUsbMode)
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.teal),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.usb, color: Colors.teal, size: 16),
                  const SizedBox(width: 6),
                  Text(l10n.usbIriscopeMode, style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),

          if (hasPatientInfo)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.green, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(globalPatientInfo!.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('${globalPatientInfo!.sexString}, ${globalPatientInfo!.age} ${l10n.years}', style: const TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle, color: Colors.green, size: 20),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                // RIGHT EYE (OD)
                Expanded(
                  child: Column(
                    children: [
                      Text(l10n.rightEyeOD, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        height: 160, // INCREASED from 120
                        decoration: BoxDecoration(
                          color: Colors.black, // Background for letterboxing
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: rightEyePic != null
                              ? Image.file(
                                  File(rightEyePic!),
                                  fit: BoxFit.contain, // CHANGED from cover
                                  width: double.infinity,
                                  height: double.infinity,
                                )
                              : const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // LEFT EYE (OS)
                Expanded(
                  child: Column(
                    children: [
                      Text(l10n.leftEyeOS, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 8),
                      Container(
                        height: 160, // INCREASED from 120
                        decoration: BoxDecoration(
                          color: Colors.black, // Background for letterboxing
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(widget.leftEyePhoto!),
                            fit: BoxFit.contain, // CHANGED from cover
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _retakeRightEye(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(l10n.retakeOD, style: const TextStyle(fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _captureLeftEye(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,
                      side: const BorderSide(color: Colors.green),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(l10n.retakeOS, style: const TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Windows-only: Constitutional Type selector ──────────────────────
          if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
            _buildConstitutionalSelector(l10n),

          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              splashColor: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.9,
              height: 65,
              fillColor: hasPatientInfo ? AppColor.primaryColor : Colors.grey,
              onPressed: () {
                if (rightEyePic == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.rightEyePhotoMissing), backgroundColor: Colors.red),
                  );
                  return;
                }
                if (globalPatientInfo == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.patientInfoMissingRestart), backgroundColor: Colors.red),
                  );
                  return;
                }
                Get.to(() => AnalysisScreen(
                  leftEyeImage: File(widget.leftEyePhoto!),
                  rightEyeImage: File(rightEyePic!),
                  patientInfo: globalPatientInfo!,
                  skipValidation: widget.isFromGallery, // NEW: Skip validation for gallery imports
                  onRetake: () {
                    leftEyePic = null;
                    rightEyePic = null;
                    Get.offAll(() => const HomeScreen());
                  },
                  onComplete: () {
                    leftEyePic = null;
                    rightEyePic = null;
                    globalPatientInfo = null;
                    Get.offAll(() => const HomeScreen());
                  },
                ));
              },
              radius: BorderRadius.circular(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.analytics, color: Colors.white, size: 28),
                  const SizedBox(width: 12),
                  Text(hasPatientInfo ? l10n.analyzeBothEyes : l10n.patientInfoMissing, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: Container(height: 6, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(3))),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(height: 6, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(3))),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(l10n.bothEyesCaptured, style: const TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(height: 24),
Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OutlinedButton.icon(
              onPressed: () {
                if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
                  exit(0);
                } else {
                  SystemNavigator.pop();
                }
              },
              icon: const Icon(Icons.exit_to_app, color: Colors.red, size: 20),
              label: Text(l10n.exitApp, style: const TextStyle(color: Colors.red, fontSize: 14)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ── Constitutional Type Selector (Desktop only) ──────────────────────────
  Widget _buildConstitutionalSelector(AppLocalizations l10n) {
    // Build grouped dropdown items
    final List<DropdownMenuItem<String?>> items = [
      DropdownMenuItem<String?>(
        value: null,
        child: Text(
          l10n.constitutionalTypeNone,
          style: const TextStyle(color: Colors.white54, fontSize: 13),
        ),
      ),
    ];

    for (final group in kConstitutionalGroups) {
      final types = kConstitutionalTypes.where((t) => t.group == group).toList();
      if (types.isEmpty) continue;

      // Group header as disabled item
      items.add(DropdownMenuItem<String?>(
        value: '__header_$group',
        enabled: false,
        child: Text(
          '── $group ──',
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ));

      for (final t in types) {
        items.add(DropdownMenuItem<String?>(
          value: t.id,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              t.name,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1500),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.remove_red_eye_outlined, color: Colors.amber, size: 18),
              const SizedBox(width: 8),
              Text(
                l10n.constitutionalTypeOptional,
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String?>(
            value: _selectedConstitutionId,
            isExpanded: true,
            dropdownColor: const Color(0xFF1D1E33),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.amber),
              ),
              filled: true,
              fillColor: const Color(0xFF0D0D1A),
            ),
            hint: Text(
              l10n.selectConstitutionalType,
              style: const TextStyle(color: Colors.white38, fontSize: 13),
            ),
            items: items,
            onChanged: (val) {
              if (val != null && val.startsWith('__header_')) return;
              setState(() => _selectedConstitutionId = val);
              globalSelectedConstitution = val;
            },
          ),
          if (_selectedConstitutionId != null) ...[
            const SizedBox(height: 8),
            Text(
              findConstitution(_selectedConstitutionId!)?.name ?? '',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }

// =============================================================================
// FIX FOR take_left_eye_photo_screen.dart
// Replace BOTH _captureLeftEye and _retakeRightEye methods (at the bottom of file)
// with these updated versions that handle Windows properly:
// =============================================================================

  // ========== CAPTURE LEFT EYE - PLATFORM AWARE ==========
  Future<void> _captureLeftEye(BuildContext context) async {
    // On Windows/Desktop, always use USB camera screen or show options
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      _showDesktopCaptureOptions(context, isRightEye: false);
      return;
    }

    // On mobile with USB mode
    if (widget.isUsbMode) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Platform.isAndroid
              ? const AndroidUvcCameraScreen(isRightEye: false)
              : const SecureUvcCameraScreen(isRightEye: false),
        ),
      );
    } else {
      // Mobile camera capture
      final cameras = await availableCameras();
      final result = await Navigator.push<CaptureResult>(
        context,
        MaterialPageRoute(
          builder: (context) => SimpleGatedCameraScreen(
            camera: cameras.first,
            isRightEye: false,
            enableAutoCapture: true,
            useFrontCamera: false,
            referenceZoom: globalRightEyeZoom,
            referenceIrisSize: globalRightEyeIrisSize,
          ),
        ),
      );

      if (result != null && mounted) {
        globalLeftEyeIrisSize = result.estimatedIrisSize;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TakeLeftEyePhotoScreen(
              camera: cameras.first,
              leftEyePhoto: result.imagePath,
              rightEyePhoto: rightEyePic,
              isUsbMode: false,
              isFromGallery: false,
            ),
          ),
        );
      }
    }
  }

  // ========== RETAKE RIGHT EYE - PLATFORM AWARE ==========
  Future<void> _retakeRightEye(BuildContext context) async {
    // On Windows/Desktop, always use USB camera screen or show options
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      _showDesktopCaptureOptions(context, isRightEye: true);
      return;
    }

    // On mobile with USB mode
    if (widget.isUsbMode) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Platform.isAndroid
              ? const AndroidUvcCameraScreen(isRightEye: true)
              : const SecureUvcCameraScreen(isRightEye: true),
        ),
      );
    } else {
      // Mobile camera capture
      final cameras = await availableCameras();
      final result = await Navigator.push<CaptureResult>(
        context,
        MaterialPageRoute(
          builder: (context) => SimpleGatedCameraScreen(
            camera: cameras.first,
            isRightEye: true,
            enableAutoCapture: true,
            useFrontCamera: false,
          ),
        ),
      );

      if (result != null && mounted) {
        globalRightEyeZoom = result.zoomLevel;
        globalRightEyeIrisSize = result.estimatedIrisSize;
        setState(() {
          rightEyePic = result.imagePath;
        });
      }
    }
  }

  // ========== DESKTOP CAPTURE OPTIONS DIALOG ==========
  void _showDesktopCaptureOptions(BuildContext context, {required bool isRightEye}) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          isRightEye ? l10n.retakeOD : l10n.retakeOS,
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n!.chooseCaptureMethod,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // USB Camera option
            ListTile(
              leading: const Icon(Icons.usb, color: Colors.teal),
              title: Text(l10n.usbCamera, style: const TextStyle(color: Colors.white)),
              subtitle: Text(l10n.useConnectedUsbCamera, style: const TextStyle(color: Colors.white54, fontSize: 12)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.teal.withOpacity(0.3)),
              ),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SecureUvcCameraScreen(isRightEye: isRightEye),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // Gallery option
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.orange),
              title: Text(l10n.loadFromGallery, style: const TextStyle(color: Colors.white)),
              subtitle: Text(l10n.selectExistingImage, style: const TextStyle(color: Colors.white54, fontSize: 12)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.orange.withOpacity(0.3)),
              ),
              onTap: () {
                Navigator.pop(ctx);
                _pickFromGallery(context, isRightEye: isRightEye);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel, style: const TextStyle(color: Colors.white54)),
          ),
        ],
      ),
    );
  }

  bool _isEyeImage(EyeValidationResult v) =>
      v.checkResults['hasDarkCenter'] == true &&
      v.checkResults['hasCircle'] == true;

  void _showNotAnEyeDialog(BuildContext context) {
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
            child: Text(l10n.done),
          ),
        ],
      ),
    );
  }

  // ========== PICK FROM GALLERY (Desktop) ==========
  Future<void> _pickFromGallery(BuildContext context, {required bool isRightEye}) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (image != null && mounted) {
      // Save to temp with proper naming
      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final eyeLabel = isRightEye ? 'right' : 'left';
      final savedPath = '${tempDir.path}/gallery_${eyeLabel}_$timestamp.jpg';

      await File(image.path).copy(savedPath);

      try {
        final bytes = await File(savedPath).readAsBytes();
        final validation = await EyeValidator().validateBytes(bytes);
        if (validation.checkResults.isNotEmpty && !_isEyeImage(validation)) {
          if (mounted) _showNotAnEyeDialog(context);
          return;
        }
      } catch (_) {
        // If validation throws (unsupported format etc.), allow the import.
      }

      if (isRightEye) {
        setState(() {
          rightEyePic = savedPath;
        });
      } else {
        // Navigate to updated screen with new left eye
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => TakeLeftEyePhotoScreen(
              camera: null,
              leftEyePhoto: savedPath,
              rightEyePhoto: rightEyePic,
              isUsbMode: false,
              isFromGallery: true,
            ),
          ),
        );
      }
    }
  }
}
