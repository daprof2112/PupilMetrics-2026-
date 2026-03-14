import 'package:ai_eye_capture/constant/assets.dart';
import 'package:ai_eye_capture/constant/color.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatefulWidget {
  final String message;
  final String? title;
  final VoidCallback? onTap;
  final double? radius;
  final String? btnText;
  final bool skipBtn;
  final VoidCallback? skipTap;

  const SuccessDialog({
    super.key,
    required this.message,
    this.title,
    required this.onTap,
    this.radius,
    this.btnText,
    this.skipBtn = false,
    this.skipTap,
  });

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final buttonLabel = widget.btnText ?? l10n.doneAndGoBack;

    return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              height: 77,
              width: 77,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor),
              child: Image.asset(Assets.tick, scale: 4),
            ),
            const SizedBox(height: 16),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff202124),
                  fontFamily: 'Manrope'),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: PrimaryButton(
                fillColor: AppColor.primaryColor,
                height: 50,
                radius: BorderRadius.circular(10),
                onPressed: widget.onTap,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    buttonLabel,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Manrope'),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
