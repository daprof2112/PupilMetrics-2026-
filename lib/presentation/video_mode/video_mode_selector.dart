// lib/presentation/video_mode/video_mode_selector.dart
// PLR Video Mode Selector - LOCALIZED VERSION

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/app_branding.dart';
import 'package:ai_eye_capture/presentation/video_mode/video_capture_screen.dart';
import 'package:ai_eye_capture/main.dart';

class PLREyeSelector extends StatelessWidget {
  final bool useFrontCamera;

  const PLREyeSelector({super.key, required this.useFrontCamera});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final patientName = globalPatientInfo?.name;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 20),
          Text(l10n.plrVideoCapture, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(useFrontCamera ? l10n.frontCamera : l10n.rearCamera, style: const TextStyle(color: Colors.pinkAccent, fontSize: 14)),
          const SizedBox(height: 8),
          Text(l10n.selectEyeToAssess, style: const TextStyle(color: Colors.white54, fontSize: 14)),
          const SizedBox(height: 24),

          // Right Eye Option
          _buildEyeOption(
            context: context,
            l10n: l10n,
            icon: Icons.visibility,
            title: l10n.rightEyeOD,
            subtitle: l10n.recordPlrRightEye,
            color: Colors.green,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoCaptureScreen(
                    eyeLabel: l10n.rightEyeOD,
                    isRightEye: true,
                    useFrontCamera: useFrontCamera,
                    patientName: patientName,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),

          // Left Eye Option
          _buildEyeOption(
            context: context,
            l10n: l10n,
            icon: Icons.visibility,
            title: l10n.leftEyeOS,
            subtitle: l10n.recordPlrLeftEye,
            color: Colors.blue,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoCaptureScreen(
                    eyeLabel: l10n.leftEyeOS,
                    isRightEye: false,
                    useFrontCamera: useFrontCamera,
                    patientName: patientName,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildEyeOption({
    required BuildContext context,
    required AppLocalizations l10n,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withOpacity(0.2), shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

class PLRModesSection extends StatefulWidget {
  const PLRModesSection({super.key});

  @override
  State<PLRModesSection> createState() => _PLRModesSectionState();
}

class _PLRModesSectionState extends State<PLRModesSection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 16),
        InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Row(
            children: [
              const Expanded(child: Divider(color: Colors.white24)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(_isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.pinkAccent, size: 20),
                    const SizedBox(width: 8),
                    Text(l10n.plrModes, style: const TextStyle(color: Colors.pinkAccent, fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const Expanded(child: Divider(color: Colors.white24)),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                _buildPLROption(
                  context: context,
                  l10n: l10n,
                  icon: Icons.videocam,
                  title: l10n.plrVideoRear,
                  subtitle: l10n.plrVideoRearDesc,
                  color: Colors.pinkAccent,
                  useFrontCamera: false,
                ),
                const SizedBox(height: 12),
                _buildPLROption(
                  context: context,
                  l10n: l10n,
                  icon: Icons.face_retouching_natural,
                  title: l10n.plrVideoSelfie,
                  subtitle: l10n.plrVideoSelfieDesc,
                  color: Colors.pinkAccent,
                  useFrontCamera: true,
                ),
              ],
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }

  Widget _buildPLROption({
    required BuildContext context,
    required AppLocalizations l10n,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required bool useFrontCamera,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (ctx) => PLREyeSelector(useFrontCamera: useFrontCamera),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

void showPLREyeSelector(BuildContext context, {required bool useFrontCamera}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (ctx) => PLREyeSelector(useFrontCamera: useFrontCamera),
  );
}