
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  Color? backgroundColor,
}) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 2),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
  );
}

double getProportionateHeight(
  double px, {
  double figmaHeight = 812,
}) {
  // Calculate the proportional height based on the figmaHeight and current screen height
  return (px / figmaHeight) * MediaQuery.of(Get.context!).size.height;
}

double getProportionateWidth(
  double px, {
  double figmaWidth = 370,
}) {
  // Calculate the proportional width based on the figmaWidth and current screen width
  return (px / figmaWidth) * MediaQuery.of(Get.context!).size.width;
}

Future<bool> shouldShowOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  return isFirstTime;
}

Future<void> markOnboardingShown() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFirstTime', false);
}


