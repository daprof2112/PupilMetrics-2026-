// lib/presentation/camera_screen/camera_preview.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ai_eye_capture/camera_mode.dart';
import 'package:ai_eye_capture/presentation/patient_info_screen.dart';
import 'package:ai_eye_capture/pupil_analyzer/analysis_screen.dart';

class CameraPreviewPage extends StatefulWidget {
  final bool rightEye;
  final CameraMode cameraMode;

  const CameraPreviewPage({
    super.key,
    required this.rightEye,
    this.cameraMode = CameraMode.manual, // ← THIS LINE WAS WRONG BEFORE
  });

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  final _cropController = CropController();
  final bool _isCropping = false;
  String? leftEyePath;
  String? rightEyePath;

  Future<String> _saveTemp(Uint8List bytes) async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await File(path).writeAsBytes(bytes);
    return path;
  }

  Future<String?> _cropImage(Uint8List bytes) async {
    String? result;
    await Get.dialog(
      Scaffold(
        appBar: AppBar(title: const Text('Crop Image')),
        body: Stack(
          children: [
            Crop(
              image: bytes,
              controller: _cropController,
              onCropped: (cropped) {
                result = cropped.toString(); // fake path for demo
                Get.back();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => _cropController.crop(),
                child: const Text('Crop'),
              ),
            ),
          ],
        ),
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.rightEye ? 'Right Eye' : 'Left Eye'),
        backgroundColor: Colors.transparent,
      ),
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(),
        onMediaCaptureEvent: (event) async {
          if (!event.isPicture || event.status != MediaCaptureStatus.success) return;

          final path = event.captureRequest.when(
            single: (s) => s.file?.path,
            multiple: (_) => null,
          );
          if (path == null) return;

          final bytes = await File(path).readAsBytes();
          final croppedPath = await _cropImage(bytes);
          if (croppedPath == null) return;

          await ImageGallerySaverPlus.saveFile(croppedPath);

          if (widget.rightEye) {
            rightEyePath = croppedPath;
          } else {
            leftEyePath = croppedPath;
          }

          if (leftEyePath != null && rightEyePath != null) {
            final patientInfo = await Get.to<PatientInfo?>(
                  () => PatientInfoScreen(
                onContinue: (info) => Get.back(result: info),
                onExit: () => Get.back(),
              ),
            );

            Get.to(() => AnalysisScreen(
              leftEyeImage: File(leftEyePath!),
              rightEyeImage: rightEyePath != null ? File(rightEyePath!) : null,
                if (patientInfo != null) {
            Get.to(() => AnalysisScreen(
            leftEyeImage: File(leftEyePath!),
            rightEyeImage: rightEyePath != null ? File(rightEyePath!) : null,
            patientInfo: patientInfo,
            ));
            }
            ));
            }
          }
        },
      ),
    );
  }
}