import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/constant/color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool appExit;

  const CustomAppbar({super.key, required this.text, this.appExit = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          if (!appExit) {
            Navigator.pop(context);
          } else {
            exit(0);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.primaryColor,
            size: 22,
          ),
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: AppColor.primaryColor,
          fontFamily: 'Manrope',
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
