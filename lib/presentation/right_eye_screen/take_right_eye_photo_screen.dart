// lib/presentation/right_eye_screen/take_right_eye_photo_screen.dart
// RIGHT eye is captured first - WITH USB MODE SUPPORT

import 'dart:io';
import 'package:ai_eye_capture/constant/color.dart';
import 'package:ai_eye_capture/presentation/widgets/appbar.dart';
import 'package:ai_eye_capture/presentation/widgets/primary_button.dart';
import 'package:ai_eye_capture/presentation/left_eye_screen/take_left_eye_photo_screen.dart';
import 'package:ai_eye_capture/presentation/camera_screen/simple_gated_camera.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/camera_screen/secure_uvc_camera_screen.dart';


class TakeRightEyePhotoScreen extends StatefulWidget {
  final CameraDescription? camera;
  final String? rightEyePhoto;
  final bool isUsbMode; // NEW: Track if using USB camera

  const TakeRightEyePhotoScreen({
    super.key,
    this.camera,
    this.rightEyePhoto,
    this.isUsbMode = false, // Default to phone camera
  });

  @override
  State<TakeRightEyePhotoScreen> createState() => _TakeRightEyePhotoScreenState();
}

class _TakeRightEyePhotoScreenState extends State<TakeRightEyePhotoScreen> {
  @override
  void initState() {
    super.initState();
    leftEyePic = null;
    if (widget.rightEyePhoto != null) {
      rightEyePic = widget.rightEyePhoto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => exit(0),
      child: Scaffold(
        appBar: CustomAppbar(
          appExit: true,
          text: widget.rightEyePhoto == null ? l10n.takeRightEyePhoto : l10n.rightEyePhoto,
        ),
        body: widget.rightEyePhoto == null
            ? _buildInstructionsScreen(context, l10n)
            : _buildCapturedScreen(context, l10n),
      ),
    );
  }

  Widget _buildInstructionsScreen(BuildContext context, AppLocalizations l10n) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [AppColor.primaryColor, AppColor.primaryColor.withOpacity(0.6)]),
              boxShadow: [BoxShadow(color: AppColor.primaryColor.withOpacity(0.3), blurRadius: 20, spreadRadius: 5)],
            ),
            child: const Icon(Icons.remove_red_eye, size: 70, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue),
            ),
            child: Text(l10n.startingWithRightEye, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          Text(l10n.tipsForBestResults,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.primaryColor, letterSpacing: 1.2, fontFamily: 'Manrope')),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(l10n.followGuidelinesForQuality,
                style: const TextStyle(fontSize: 14, color: AppColor.textColor, fontFamily: 'Manrope'), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 20),
          _buildTipCard(icon: Icons.straighten, title: l10n.cameraDistance, description: l10n.cameraDistanceDesc, color: Colors.blue),
          _buildTipCard(icon: Icons.light_mode, title: l10n.lightingPosition, description: l10n.lightingPositionDesc, color: Colors.orange),
          _buildTipCard(icon: Icons.visibility_off, title: l10n.avoidReflections, description: l10n.avoidReflectionsDesc, color: Colors.purple),
          _buildTipCard(icon: Icons.center_focus_strong, title: l10n.centerYourEye, description: l10n.centerYourEyeDesc, color: Colors.green),
          _buildTipCard(icon: Icons.crop, title: l10n.cropProperly, description: l10n.cropProperlyDesc, color: Colors.red),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey.shade700, size: 20),
                    const SizedBox(width: 8),
                    Text(l10n.importantInformation, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                  ],
                ),
                const Divider(height: 20),
                _buildInfoRow(Icons.aspect_ratio, l10n.imageRatio43),
                _buildInfoRow(Icons.business, l10n.forClinicalUseCnri),
                _buildInfoRow(Icons.medical_services, l10n.noMedicalDiagnosis),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(l10n.eyeWideOpenClear,
                style: const TextStyle(fontSize: 16, color: AppColor.textColor, fontFamily: 'Manrope', fontWeight: FontWeight.w500), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 32),

          // ========== MAIN BUTTON: Take Right Eye Photo ==========
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              splashColor: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              fillColor: AppColor.primaryColor,
              onPressed: () => _captureRightEye(context),
              radius: BorderRadius.circular(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  Text(l10n.takeRightEyePhoto, style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildCapturedScreen(BuildContext context, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),

        // Show USB mode indicator if active
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue),
          ),
          child: Text(l10n.rightEyeOD, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.file(File(widget.rightEyePhoto!), fit: BoxFit.contain, height: 220),
              ),
            ),
          ),
        ),

        // ========== RETAKE BUTTON ==========
        Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
          child: PrimaryButton(
            splashColor: Colors.transparent,
            width: MediaQuery.of(context).size.width * 0.9,
            height: 56,
            fillColor: Colors.transparent,
            boxBorder: Border.all(color: AppColor.primaryColor),
            onPressed: () => _captureRightEye(context),
            radius: BorderRadius.circular(20),
            child: Text(l10n.retakeRightEye, style: const TextStyle(fontSize: 16, color: AppColor.primaryColor, fontFamily: 'Manrope')),
          ),
        ),

        // ========== CONTINUE BUTTON ==========
        PrimaryButton(
          splashColor: Colors.transparent,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 60,
          fillColor: Colors.green,
          onPressed: () => _continueToLeftEye(context),
          radius: BorderRadius.circular(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.continueToLeftEye, style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.w600)),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
            ],
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
                  decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(3)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(l10n.step1of2, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }

  // ========== CAPTURE RIGHT EYE - USB OR PHONE ==========
  Future<void> _captureRightEye(BuildContext context) async {
    if (widget.isUsbMode) {
      // USB MODE: Navigate to UVC camera
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SecureUvcCameraScreen(isRightEye: true),
        ),
      );
    } else {
      // PHONE MODE: Navigate to SimpleGatedCameraScreen
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

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TakeRightEyePhotoScreen(
              camera: cameras.first,
              rightEyePhoto: result.imagePath,
              isUsbMode: false,
            ),
          ),
        );
      }
    }
  }

  // ========== CONTINUE TO LEFT EYE - USB OR PHONE ==========
  void _continueToLeftEye(BuildContext context) {
    rightEyePic = widget.rightEyePhoto;

    if (widget.isUsbMode) {
      // USB MODE: Go directly to UVC camera for left eye
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SecureUvcCameraScreen(isRightEye: false),
        ),
      );
    } else {
      // PHONE MODE: Go to left eye screen (which will use SimpleGatedCamera)
      Get.to(() => TakeLeftEyePhotoScreen(
        rightEyePhoto: widget.rightEyePhoto!,
        isUsbMode: false,
      ));
    }
  }

  Widget _buildTipCard({required IconData icon, required String title, required String description, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color, fontFamily: 'Manrope')),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(fontSize: 13, color: AppColor.textColor, fontFamily: 'Manrope', height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade600),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.3))),
        ],
      ),
    );
  }
}