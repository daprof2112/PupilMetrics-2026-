// lib/presentation/both_eyes_captured_screen.dart
import 'dart:io';
import 'package:ai_eye_capture/presentation/patient_info_screen.dart';
import 'package:ai_eye_capture/presentation/analysis_screen.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart'; // For PatientInfo
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

String? leftEyePic;
String? rightEyePic;

class BothEyesCapturedScreen extends StatelessWidget {
  final String leftPath;
  final String rightPath;

  const BothEyesCapturedScreen({
    super.key,
    required this.leftPath,
    required this.rightPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.bothEyesCaptured)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(File(leftPath), height: 250),
                const SizedBox(width: 20),
                Image.file(File(rightPath), height: 250),
              ],
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () async {
                final info = await Get.to<PatientInfo?>(() => PatientInfoScreen(
                  onContinue: (i) => Get.back(result: i),
                ));
                if (info != null) {
                  Get.to(() => AnalysisScreen(
                    leftEyeImage: File(leftPath),
                    rightEyeImage: File(rightPath),
                    patientInfo: info,
                  ));
                }
              },
              child: Text(AppLocalizations.of(context)!.enterPatientInfoAnalysis),
            ),
          ],
        ),
      ),
    );
  }
}