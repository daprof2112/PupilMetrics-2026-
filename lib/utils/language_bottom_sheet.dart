// lib/utils/language_bottom_sheet.dart
// v2.1 - Fixed for Windows/macOS/Linux desktop support
// Fixed: Native Windows title bar now updates on language change

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'package:ai_eye_capture/utils/language_controller.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

/// Shows language selector - Dialog on desktop, BottomSheet on mobile
void showLanguageBottomSheet(BuildContext context) {
  // Check if LanguageController is registered
  if (!Get.isRegistered<LanguageController>()) {
    debugPrint('LanguageController not registered! Registering now...');
    Get.put(LanguageController());
  }

  final languageController = Get.find<LanguageController>();

  // Use Dialog on desktop, BottomSheet on mobile
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    _showLanguageDialog(context, languageController);
  } else {
    _showLanguageBottomSheet(context, languageController);
  }
}

/// Desktop-friendly dialog
void _showLanguageDialog(BuildContext context, LanguageController controller) {
  showDialog(
    context: context,
    builder: (context) => _LanguageDialog(languageController: controller),
  );
}

/// Mobile bottom sheet
void _showLanguageBottomSheet(BuildContext context, LanguageController controller) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => _LanguageBottomSheetContent(languageController: controller),
  );
}

// =============================================================================
// DESKTOP DIALOG VERSION
// =============================================================================
class _LanguageDialog extends StatefulWidget {
  final LanguageController languageController;
  const _LanguageDialog({required this.languageController});

  @override
  State<_LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<_LanguageDialog> {
  late String _selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    _selectedLanguageCode = widget.languageController.currentLocale.value.languageCode;
  }

  void _selectLanguage(LanguageModel language) {
    setState(() {
      _selectedLanguageCode = language.locale.languageCode;
    });

    Navigator.pop(context);

    Future.delayed(const Duration(milliseconds: 100), () async {
      // Change the app language
      widget.languageController.changeLanguage(language.locale);

      // KEY FIX: Update the native Windows/macOS/Linux title bar
      if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        await Future.delayed(const Duration(milliseconds: 200));
        final loc = lookupAppLocalizations(language.locale);
        await windowManager.setTitle('${loc.windowTitle} - ${loc.aboutResearchEdition}');
      }

      // Show localized snackbar
      final loc = lookupAppLocalizations(language.locale);

      Get.snackbar(
        loc.languageChanged,
        loc.languageChangedMessage(language.nativeName),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF00D9FF),
        colorText: Colors.black,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 400,
        constraints: const BoxConstraints(maxHeight: 500),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D1E33), Color(0xFF0A0E21)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(color: const Color(0xFF00D9FF).withOpacity(0.2), blurRadius: 20, spreadRadius: -5),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [const Color(0xFF00D9FF).withOpacity(0.2), const Color(0xFF00FFCC).withOpacity(0.1)]),
                      border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.5), width: 2),
                    ),
                    child: const Icon(Icons.language, color: Color(0xFF00D9FF), size: 26),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D9FF), Color(0xFF00FFCC)]).createShader(bounds),
                          child: Text(l10n.languageSelectTitle, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 4),
                        Text('${widget.languageController.supportedLanguages.length} ${l10n.languagesAvailable}',
                            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
                      ],
                    ),
                  ),
                  // Close button
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white54),
                  ),
                ],
              ),
            ),

            // Divider
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  const Color(0xFF00D9FF).withOpacity(0.3),
                  const Color(0xFF00D9FF).withOpacity(0.5),
                  const Color(0xFF00D9FF).withOpacity(0.3),
                  Colors.transparent,
                ]),
              ),
            ),

            // Language list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                itemCount: widget.languageController.supportedLanguages.length,
                itemBuilder: (context, index) {
                  final language = widget.languageController.supportedLanguages[index];
                  final isSelected = _selectedLanguageCode == language.locale.languageCode;

                  return _LanguageTile(
                    language: language,
                    isSelected: isSelected,
                    onTap: () => _selectLanguage(language),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// MOBILE BOTTOM SHEET VERSION
// =============================================================================
class _LanguageBottomSheetContent extends StatefulWidget {
  final LanguageController languageController;

  const _LanguageBottomSheetContent({
    required this.languageController,
  });

  @override
  State<_LanguageBottomSheetContent> createState() => _LanguageBottomSheetContentState();
}

class _LanguageBottomSheetContentState extends State<_LanguageBottomSheetContent> {
  late String _selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    _selectedLanguageCode = widget.languageController.currentLocale.value.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.75;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1D1E33), Color(0xFF0A0E21)],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(color: Color(0xFF00D9FF), blurRadius: 20, offset: Offset(0, -2), spreadRadius: -5),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Glowing handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF00D9FF), Color(0xFF00FFCC)]),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(color: const Color(0xFF00D9FF).withOpacity(0.5), blurRadius: 8, spreadRadius: 1)],
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [const Color(0xFF00D9FF).withOpacity(0.2), const Color(0xFF00FFCC).withOpacity(0.1)]),
                      border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.5), width: 2),
                    ),
                    child: const Icon(Icons.language, color: Color(0xFF00D9FF), size: 26),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D9FF), Color(0xFF00FFCC)]).createShader(bounds),
                          child: Text(l10n.languageSelectTitle, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 4),
                        Text('${widget.languageController.supportedLanguages.length} ${l10n.languagesAvailable}',
                            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  const Color(0xFF00D9FF).withOpacity(0.3),
                  const Color(0xFF00D9FF).withOpacity(0.5),
                  const Color(0xFF00D9FF).withOpacity(0.3),
                  Colors.transparent,
                ]),
              ),
            ),

            // Language list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                itemCount: widget.languageController.supportedLanguages.length,
                itemBuilder: (context, index) {
                  final language = widget.languageController.supportedLanguages[index];
                  final isSelected = _selectedLanguageCode == language.locale.languageCode;

                  return _LanguageTile(
                    language: language,
                    isSelected: isSelected,
                    onTap: () => _selectLanguage(language),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _selectLanguage(LanguageModel language) {
    setState(() {
      _selectedLanguageCode = language.locale.languageCode;
    });

    Navigator.pop(context);

    Future.delayed(const Duration(milliseconds: 100), () async {
      // Change the app language
      widget.languageController.changeLanguage(language.locale);

      // KEY FIX: Update native window title bar (only on desktop)
      if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        await Future.delayed(const Duration(milliseconds: 200));
        final loc = lookupAppLocalizations(language.locale);
        await windowManager.setTitle('${loc.windowTitle} - ${loc.aboutResearchEdition}');
      }

      // Show localized snackbar
      final loc = lookupAppLocalizations(language.locale);

      Get.snackbar(
        loc.languageChanged,
        loc.languageChangedMessage(language.nativeName),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF00D9FF),
        colorText: Colors.black,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      );
    });
  }
}

// =============================================================================
// SHARED LANGUAGE TILE WIDGET
// =============================================================================
class _LanguageTile extends StatefulWidget {
  final LanguageModel language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<_LanguageTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(16),
            splashColor: const Color(0xFF00D9FF).withOpacity(0.2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: widget.isSelected
                    ? LinearGradient(colors: [const Color(0xFF00D9FF).withOpacity(0.2), const Color(0xFF00FFCC).withOpacity(0.1)])
                    : _isHovered
                    ? LinearGradient(colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.02)])
                    : null,
                border: Border.all(
                  color: widget.isSelected
                      ? const Color(0xFF00D9FF).withOpacity(0.5)
                      : _isHovered
                      ? Colors.white.withOpacity(0.1)
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  // Custom Flag Widget
                  _CountryFlag(
                    languageCode: widget.language.locale.languageCode,
                    isSelected: widget.isSelected,
                  ),
                  const SizedBox(width: 16),

                  // Language names
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.language.nativeName,
                          style: TextStyle(
                            color: widget.isSelected ? const Color(0xFF00D9FF) : Colors.white,
                            fontSize: 17,
                            fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.language.name,
                          style: TextStyle(
                            color: widget.isSelected ? const Color(0xFF00D9FF).withOpacity(0.7) : Colors.white.withOpacity(0.4),
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Checkmark
                  if (widget.isSelected)
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [Color(0xFF00D9FF), Color(0xFF00FFCC)]),
                      ),
                      child: const Icon(Icons.check, color: Colors.black, size: 16),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// CUSTOM FLAG WIDGET - Works on Windows!
// =============================================================================
class _CountryFlag extends StatelessWidget {
  final String languageCode;
  final bool isSelected;

  const _CountryFlag({
    required this.languageCode,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final flagData = _getFlagData(languageCode);

    return Container(
      width: 52,
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? const Color(0xFF00D9FF).withOpacity(0.5) : Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: isSelected ? [BoxShadow(color: const Color(0xFF00D9FF).withOpacity(0.3), blurRadius: 8, spreadRadius: -2)] : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: CustomPaint(
        painter: _FlagPainter(flagData),
        size: const Size(52, 38),
      ),
    );
  }

  _FlagData _getFlagData(String code) {
    switch (code) {
      case 'en':
        return _FlagData(type: FlagType.usa);
      case 'es':
        return _FlagData(type: FlagType.horizontal3, colors: [const Color(0xFFAA151B), const Color(0xFFF1BF00), const Color(0xFFAA151B)], ratios: [0.25, 0.5, 0.25]);
      case 'pt':
        return _FlagData(type: FlagType.brazil);
      case 'fr':
        return _FlagData(type: FlagType.vertical3, colors: [const Color(0xFF002395), Colors.white, const Color(0xFFED2939)]);
      case 'de':
        return _FlagData(type: FlagType.horizontal3, colors: [Colors.black, const Color(0xFFDD0000), const Color(0xFFFFCC00)]);
      case 'ja':
        return _FlagData(type: FlagType.japan);
      case 'ko':
        return _FlagData(type: FlagType.korea);
      case 'it':
        return _FlagData(type: FlagType.vertical3, colors: [const Color(0xFF009246), Colors.white, const Color(0xFFCE2B37)]);
      case 'ru':
        return _FlagData(type: FlagType.horizontal3, colors: [Colors.white, const Color(0xFF0039A6), const Color(0xFFD52B1E)]);
      case 'zh':
        return _FlagData(type: FlagType.china);
      default:
        return _FlagData(type: FlagType.horizontal3, colors: [Colors.grey, Colors.white, Colors.grey]);
    }
  }
}

enum FlagType { horizontal3, vertical3, usa, brazil, japan, korea, china }

class _FlagData {
  final FlagType type;
  final List<Color> colors;
  final List<double>? ratios;

  _FlagData({required this.type, this.colors = const [], this.ratios});
}

class _FlagPainter extends CustomPainter {
  final _FlagData data;

  _FlagPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    switch (data.type) {
      case FlagType.horizontal3:
        _drawHorizontal3(canvas, size, paint);
        break;
      case FlagType.vertical3:
        _drawVertical3(canvas, size, paint);
        break;
      case FlagType.usa:
        _drawUSA(canvas, size, paint);
        break;
      case FlagType.brazil:
        _drawBrazil(canvas, size, paint);
        break;
      case FlagType.japan:
        _drawJapan(canvas, size, paint);
        break;
      case FlagType.korea:
        _drawKorea(canvas, size, paint);
        break;
      case FlagType.china:
        _drawChina(canvas, size, paint);
        break;
    }
  }

  void _drawHorizontal3(Canvas canvas, Size size, Paint paint) {
    final ratios = data.ratios ?? [0.333, 0.334, 0.333];
    double y = 0;
    for (int i = 0; i < data.colors.length && i < ratios.length; i++) {
      paint.color = data.colors[i];
      final h = size.height * ratios[i];
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, h), paint);
      y += h;
    }
  }

  void _drawVertical3(Canvas canvas, Size size, Paint paint) {
    final w = size.width / 3;
    for (int i = 0; i < data.colors.length; i++) {
      paint.color = data.colors[i];
      canvas.drawRect(Rect.fromLTWH(w * i, 0, w, size.height), paint);
    }
  }

  void _drawUSA(Canvas canvas, Size size, Paint paint) {
    final stripeH = size.height / 13;
    for (int i = 0; i < 13; i++) {
      paint.color = i.isEven ? const Color(0xFFB22234) : Colors.white;
      canvas.drawRect(Rect.fromLTWH(0, stripeH * i, size.width, stripeH), paint);
    }
    paint.color = const Color(0xFF3C3B6E);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width * 0.4, size.height * 0.54), paint);
    paint.color = Colors.white;
    final starSize = size.width * 0.03;
    for (int row = 0; row < 5; row++) {
      for (int col = 0; col < 6; col++) {
        final x = size.width * 0.04 + col * (size.width * 0.06);
        final y = size.height * 0.05 + row * (size.height * 0.1);
        canvas.drawCircle(Offset(x, y), starSize, paint);
      }
    }
  }

  void _drawBrazil(Canvas canvas, Size size, Paint paint) {
    paint.color = const Color(0xFF009739);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = const Color(0xFFFEDD00);
    final path = Path()
      ..moveTo(size.width * 0.5, size.height * 0.1)
      ..lineTo(size.width * 0.95, size.height * 0.5)
      ..lineTo(size.width * 0.5, size.height * 0.9)
      ..lineTo(size.width * 0.05, size.height * 0.5)
      ..close();
    canvas.drawPath(path, paint);
    paint.color = const Color(0xFF002776);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), size.height * 0.25, paint);
  }

  void _drawJapan(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = const Color(0xFFBC002D);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), size.height * 0.3, paint);
  }

  void _drawKorea(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = const Color(0xFFCD2E3A);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: size.height * 0.5, height: size.height * 0.5), 3.14159, 3.14159, true, paint);
    paint.color = const Color(0xFF0047A0);
    canvas.drawArc(Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: size.height * 0.5, height: size.height * 0.5), 0, 3.14159, true, paint);
  }

  void _drawChina(Canvas canvas, Size size, Paint paint) {
    paint.color = const Color(0xFFDE2910);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = const Color(0xFFFFDE00);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.35), size.height * 0.18, paint);
    for (int i = 0; i < 4; i++) {
      canvas.drawCircle(Offset(size.width * (0.4 + i * 0.05), size.height * (0.2 + (i % 2) * 0.15)), size.height * 0.06, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
