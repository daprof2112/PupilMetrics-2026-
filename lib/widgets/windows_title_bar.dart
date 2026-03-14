// lib/widgets/windows_title_bar.dart
// v5.8 PRODUCTION - COMPLETE with reactive title bar localization
// Fixed: Title bar now updates reactively when language changes

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/license_manager.dart';
import 'package:ai_eye_capture/presentation/license_dialog.dart';
import 'package:ai_eye_capture/utils/language_controller.dart';
import 'package:ai_eye_capture/utils/app_settings.dart';


// =============================================================================
// WINDOWS TITLE BAR - Reactive to language changes
// =============================================================================
class WindowsTitleBar extends StatelessWidget {
  final String title;

  const WindowsTitleBar({super.key, this.title = 'PupilMetrics'});

  @override
  Widget build(BuildContext context) {
    if (!Platform.isWindows && !Platform.isMacOS && !Platform.isLinux) {
      return const SizedBox.shrink();
    }

    // BULLETPROOF: GetX builder ensures controller exists and rebuilds on changes
    return GetX<LanguageController>(
      init: LanguageController(),
      builder: (controller) {
        final displayTitle = AppLocalizations.of(context)!.windowTitle;

        return GestureDetector(
          onPanStart: (_) => windowManager.startDragging(),
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A0E21), Color(0xFF1A1F38)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border(bottom: BorderSide(color: Color(0xFF00D9FF), width: 1)),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.remove_red_eye, color: Color(0xFF00D9FF), size: 20),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF00FFCC)],
                  ).createShader(bounds),
                  child: Text(
                    displayTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                _TitleBarButton(icon: Icons.language, onPressed: _showLanguageDialog),
                _TitleBarButton(icon: Icons.folder_open, onPressed: _openReportsFolder),
                _TitleBarButton(icon: Icons.settings, onPressed: _openSettings),
                _TitleBarButton(icon: Icons.help_outline, onPressed: _showHelp),
                _TitleBarButton(icon: Icons.info_outline, onPressed: _showAbout),
                Container(width: 1, height: 20, margin: const EdgeInsets.symmetric(horizontal: 8), color: Colors.white24),
                const WindowButtons(),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> _openReportsFolder() async {
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final reportsPath = '${docsDir.path}\\PupilReports';
      final dir = Directory(reportsPath);
      if (!await dir.exists()) await dir.create(recursive: true);
      await Process.run('explorer', [reportsPath]);
    } catch (e) {
      debugPrint('Error opening reports folder: $e');
    }
  }

  static void _openSettings() => Get.dialog(const SettingsDialog());
  static void _showHelp() => Get.dialog(const HelpDialog());
  static void _showAbout() => Get.dialog(const AboutDialogWithLicense());
  static void _showLanguageDialog() => Get.dialog(const LanguageDialog());
}

// =============================================================================
// TITLE BAR BUTTON
// =============================================================================
class _TitleBarButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _TitleBarButton({required this.icon, required this.onPressed});

  @override
  State<_TitleBarButton> createState() => _TitleBarButtonState();
}

class _TitleBarButtonState extends State<_TitleBarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 36,
          height: 32,
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF2A2F4A) : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(widget.icon, color: _isHovered ? const Color(0xFF00D9FF) : Colors.white70, size: 16),
        ),
      ),
    );
  }
}

// =============================================================================
// WINDOW BUTTONS (Minimize, Maximize, Close)
// =============================================================================
class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _WindowButton(icon: Icons.remove, onPressed: () async => await windowManager.minimize()),
        _WindowButton(
          icon: Icons.crop_square,
          onPressed: () async {
            if (await windowManager.isMaximized()) {
              await windowManager.unmaximize();
            } else {
              await windowManager.maximize();
            }
          },
        ),
        _WindowButton(icon: Icons.close, onPressed: () async => await windowManager.close(), isClose: true),
      ],
    );
  }
}

class _WindowButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isClose;
  const _WindowButton({required this.icon, required this.onPressed, this.isClose = false});

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 46,
          height: 40,
          color: _isHovered ? (widget.isClose ? Colors.red : const Color(0xFF2A2F4A)) : Colors.transparent,
          child: Icon(widget.icon, color: _isHovered ? Colors.white : Colors.white70, size: 16),
        ),
      ),
    );
  }
}

// =============================================================================
// LANGUAGE DIALOG
// =============================================================================
class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  late String _selectedCode;
  LanguageController? _controller;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<LanguageController>()) {
      _controller = Get.find<LanguageController>();
    } else {
      _controller = Get.put(LanguageController());
    }
    _selectedCode = _controller?.currentLocale.value.languageCode ?? 'en';
  }

  void _selectLanguage(LanguageModel language) {
    final newLangCode = language.locale.languageCode;
    setState(() => _selectedCode = newLangCode);
    Navigator.pop(context);

    Future.delayed(const Duration(milliseconds: 100), () async {
      // Change the app language
      _controller?.changeLanguage(language.locale);

      // Update the native Windows title bar (taskbar, alt-tab)
      await Future.delayed(const Duration(milliseconds: 200));
      final newL10n = lookupAppLocalizations(Locale(newLangCode));
      await windowManager.setTitle('${newL10n.windowTitle} - ${newL10n.aboutResearchEdition}');

      // Show localized snackbar
      Get.snackbar(
        newL10n.languageChanged,
        newL10n.languageChangedMessage(language.nativeName),
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
    if (_controller == null) {
      return Dialog(
        backgroundColor: const Color(0xFF1D1E33),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.orange, size: 48),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.languageSystemNotAvailable, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              TextButton(onPressed: () => Get.back(), child: Text(AppLocalizations.of(context)!.close)),
            ],
          ),
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 360,
        constraints: const BoxConstraints(maxHeight: 450),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D1E33), Color(0xFF0A0E21)],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 12, 12),
              child: Row(
                children: [
                  const Icon(Icons.language, color: Color(0xFF00D9FF), size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.selectLanguage, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, color: Colors.white54, size: 20),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: const Color(0xFF00D9FF).withOpacity(0.2)),

            // Language list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: _controller!.supportedLanguages.length,
                itemBuilder: (context, index) {
                  final lang = _controller!.supportedLanguages[index];
                  final isSelected = _selectedCode == lang.locale.languageCode;

                  return _LanguageListItem(
                    language: lang,
                    isSelected: isSelected,
                    onTap: () => _selectLanguage(lang),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageListItem extends StatefulWidget {
  final LanguageModel language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageListItem({required this.language, required this.isSelected, required this.onTap});

  @override
  State<_LanguageListItem> createState() => _LanguageListItemState();
}

class _LanguageListItemState extends State<_LanguageListItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isSelected
                ? const Color(0xFF00D9FF).withOpacity(0.15)
                : _hovered
                ? Colors.white.withOpacity(0.05)
                : Colors.transparent,
            border: Border.all(
              color: widget.isSelected ? const Color(0xFF00D9FF).withOpacity(0.5) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.white24),
                ),
                clipBehavior: Clip.antiAlias,
                child: CustomPaint(painter: _FlagPainter(widget.language.locale.languageCode)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.language.nativeName,
                      style: TextStyle(
                        color: widget.isSelected ? const Color(0xFF00D9FF) : Colors.white,
                        fontSize: 14,
                        fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    Text(
                      widget.language.name,
                      style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11),
                    ),
                  ],
                ),
              ),
              if (widget.isSelected) const Icon(Icons.check_circle, color: Color(0xFF00D9FF), size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// FLAG PAINTER
// =============================================================================
class _FlagPainter extends CustomPainter {
  final String code;
  _FlagPainter(this.code);

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint();

    switch (code) {
      case 'en':
        for (int i = 0; i < 7; i++) {
          p.color = i.isEven ? const Color(0xFFB22234) : Colors.white;
          canvas.drawRect(Rect.fromLTWH(0, size.height / 7 * i, size.width, size.height / 7), p);
        }
        p.color = const Color(0xFF3C3B6E);
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width * 0.4, size.height * 0.57), p);
        break;
      case 'es':
        p.color = const Color(0xFFAA151B);
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height * 0.25), p);
        p.color = const Color(0xFFF1BF00);
        canvas.drawRect(Rect.fromLTWH(0, size.height * 0.25, size.width, size.height * 0.5), p);
        p.color = const Color(0xFFAA151B);
        canvas.drawRect(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25), p);
        break;
      case 'fr':
        final w = size.width / 3;
        p.color = const Color(0xFF002395);
        canvas.drawRect(Rect.fromLTWH(0, 0, w, size.height), p);
        p.color = Colors.white;
        canvas.drawRect(Rect.fromLTWH(w, 0, w, size.height), p);
        p.color = const Color(0xFFED2939);
        canvas.drawRect(Rect.fromLTWH(w * 2, 0, w, size.height), p);
        break;
      case 'de':
        final h = size.height / 3;
        p.color = Colors.black;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, h), p);
        p.color = const Color(0xFFDD0000);
        canvas.drawRect(Rect.fromLTWH(0, h, size.width, h), p);
        p.color = const Color(0xFFFFCC00);
        canvas.drawRect(Rect.fromLTWH(0, h * 2, size.width, h), p);
        break;
      case 'pt':
        p.color = const Color(0xFF009739);
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), p);
        p.color = const Color(0xFFFEDD00);
        final path = Path()
          ..moveTo(size.width * 0.5, size.height * 0.15)
          ..lineTo(size.width * 0.85, size.height * 0.5)
          ..lineTo(size.width * 0.5, size.height * 0.85)
          ..lineTo(size.width * 0.15, size.height * 0.5)
          ..close();
        canvas.drawPath(path, p);
        break;
      case 'ru':
        final h = size.height / 3;
        p.color = Colors.white;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, h), p);
        p.color = const Color(0xFF0039A6);
        canvas.drawRect(Rect.fromLTWH(0, h, size.width, h), p);
        p.color = const Color(0xFFD52B1E);
        canvas.drawRect(Rect.fromLTWH(0, h * 2, size.width, h), p);
        break;
      case 'zh':
        p.color = const Color(0xFFDE2910);
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), p);
        p.color = const Color(0xFFFFDE00);
        canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.35), size.height * 0.15, p);
        break;
      case 'ja':
        p.color = Colors.white;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), p);
        p.color = const Color(0xFFBC002D);
        canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), size.height * 0.28, p);
        break;
      case 'ko':
        p.color = Colors.white;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), p);
        p.color = const Color(0xFFCD2E3A);
        canvas.drawArc(
          Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: size.height * 0.5, height: size.height * 0.5),
          3.14159, 3.14159, true, p,
        );
        p.color = const Color(0xFF0047A0);
        canvas.drawArc(
          Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: size.height * 0.5, height: size.height * 0.5),
          0, 3.14159, true, p,
        );
        break;
      case 'it':
        final w = size.width / 3;
        p.color = const Color(0xFF009246);
        canvas.drawRect(Rect.fromLTWH(0, 0, w, size.height), p);
        p.color = Colors.white;
        canvas.drawRect(Rect.fromLTWH(w, 0, w, size.height), p);
        p.color = const Color(0xFFCE2B37);
        canvas.drawRect(Rect.fromLTWH(w * 2, 0, w, size.height), p);
        break;
      default:
        p.color = Colors.grey;
        canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// =============================================================================
// SETTINGS DIALOG
// =============================================================================
class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool _autoSavePdf = AppSettings.defaults.autoSavePdf;
  bool _includeImagesInPdf = AppSettings.defaults.includeImagesInPdf;
  bool _showMLComparison = AppSettings.defaults.showMlComparison;
  bool _showZoneOverlay = AppSettings.defaults.showZoneOverlay;
  String _preferredCamera = AppSettings.defaults.preferredCamera;
  double _defaultZoom = AppSettings.defaults.defaultZoom;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await AppSettings.load();
    if (!mounted) return;

    setState(() {
      _autoSavePdf = settings.autoSavePdf;
      _includeImagesInPdf = settings.includeImagesInPdf;
      _showMLComparison = settings.showMlComparison;
      _showZoneOverlay = settings.showZoneOverlay;
      _preferredCamera = settings.preferredCamera;
      _defaultZoom = settings.defaultZoom;
    });
  }

  Future<void> _saveSettings() {
    return AppSettings.save(
      AppSettingsData(
        autoSavePdf: _autoSavePdf,
        includeImagesInPdf: _includeImagesInPdf,
        showMlComparison: _showMLComparison,
        showZoneOverlay: _showZoneOverlay,
        preferredCamera: _preferredCamera,
        defaultZoom: _defaultZoom,
      ),
    );
  }

  Map<String, String> _cameraOptions(AppLocalizations l10n) {
    return {
      AppSettings.cameraDinoLite: l10n.settingsCameraDinoLite,
      AppSettings.cameraUsb: l10n.settingsCameraUsb,
      AppSettings.cameraAutoDetect: l10n.settingsCameraAutoDetect,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cameraOptions = _cameraOptions(l10n);

    return AlertDialog(
      backgroundColor: const Color(0xFF1D1E33),
      title: Row(
        children: [
          const Icon(Icons.settings, color: Color(0xFF00D9FF)),
          const SizedBox(width: 12),
          Text(l10n.settingsTitle, style: const TextStyle(color: Colors.white)),
        ],
      ),
      content: SizedBox(
        width: 450,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader(l10n.settingsCameraIriscope),
              const SizedBox(height: 12),
              Text(l10n.settingsPreferredCamera, style: const TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 4),
              DropdownButton<String>(
                value: cameraOptions.containsKey(_preferredCamera) ? _preferredCamera : AppSettings.defaults.preferredCamera,
                isExpanded: true,
                dropdownColor: const Color(0xFF1D1E33),
                style: const TextStyle(color: Colors.white),
                items: cameraOptions.entries
                    .map((entry) => DropdownMenuItem<String>(value: entry.key, child: Text(entry.value)))
                    .toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _preferredCamera = v);
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(l10n.settingsDefaultZoom, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Slider(
                      value: AppSettings.storedZoomToDisplay(_defaultZoom),
                      min: 1.0,
                      max: 4.0,
                      divisions: 6,
                      label: '${AppSettings.storedZoomToDisplay(_defaultZoom).toStringAsFixed(1)}x',
                      activeColor: const Color(0xFF00D9FF),
                      onChanged: (v) => setState(() => _defaultZoom = AppSettings.displayZoomToStored(v)),
                    ),
                  ),
                  Text('${AppSettings.storedZoomToDisplay(_defaultZoom).toStringAsFixed(1)}x', style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              const Divider(color: Colors.white24, height: 24),
              _sectionHeader(l10n.settingsAnalysis),
              const SizedBox(height: 12),
              _buildSwitch(l10n.settingsShowMlComparison, _showMLComparison, (v) => setState(() => _showMLComparison = v)),
              _buildSwitch(l10n.settingsShowZoneOverlay, _showZoneOverlay, (v) => setState(() => _showZoneOverlay = v)),
              const Divider(color: Colors.white24, height: 24),
              _sectionHeader(l10n.settingsExportReports),
              const SizedBox(height: 12),
              _buildSwitch(l10n.settingsAutoSavePdf, _autoSavePdf, (v) => setState(() => _autoSavePdf = v)),
              _buildSwitch(l10n.settingsIncludeImages, _includeImagesInPdf, (v) => setState(() => _includeImagesInPdf = v)),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: Text(l10n.cancel)),
        ElevatedButton(
          onPressed: () async {
            await _saveSettings();
            if (!mounted) return;
            Get.back();
            Get.snackbar(l10n.settingsTitle, l10n.settingsSaved, backgroundColor: Colors.green, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D9FF)),
          child: Text(l10n.submit, style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Widget _sectionHeader(String title) => Text(title, style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2));

  Widget _buildSwitch(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 13)),
          Switch(value: value, onChanged: onChanged, activeColor: const Color(0xFF00D9FF)),
        ],
      ),
    );
  }
}
// =============================================================================
// HELP DIALOG WITH TABS
// =============================================================================
class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: const Color(0xFF1D1E33),
      title: Row(
        children: [
          const Icon(Icons.help_outline, color: Color(0xFF00D9FF)),
          const SizedBox(width: 12),
          Text(l10n.helpTitle, style: const TextStyle(color: Colors.white)),
        ],
      ),
      content: SizedBox(
        width: 550,
        height: 450,
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                labelColor: const Color(0xFF00D9FF),
                unselectedLabelColor: Colors.white54,
                indicatorColor: const Color(0xFF00D9FF),
                isScrollable: true,
                tabs: [
                  Tab(text: l10n.helpTabQuickStart),
                  Tab(text: l10n.helpTabCnriAnalysis),
                  Tab(text: l10n.helpTabShortcuts),
                  Tab(text: l10n.helpTabTroubleshooting),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildQuickStartTab(l10n),
                    _buildCNRITab(l10n),
                    _buildShortcutsTab(l10n),
                    _buildTroubleshootingTab(l10n),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => launchUrl(Uri.parse('mailto:helpdesk@cnri.edu')),
              child: Text(l10n.helpContactSupport),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D9FF)),
              child: Text(l10n.close, style: const TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildQuickStartTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.helpGettingStarted),
          const SizedBox(height: 12),
          _helpItem('1', l10n.helpStep1Title, l10n.helpStep1Desc),
          _helpItem('2', l10n.helpStep2Title, l10n.helpStep2Desc),
          _helpItem('3', l10n.helpStep3Title, l10n.helpStep3Desc),
          _helpItem('4', l10n.helpStep4Title, l10n.helpStep4Desc),
          _helpItem('5', l10n.helpStep5Title, l10n.helpStep5Desc),
          _helpItem('6', l10n.helpStep6Title, l10n.helpStep6Desc),
          const SizedBox(height: 16),
          _infoCard(
            icon: Icons.lightbulb_outline,
            iconColor: Colors.green,
            borderColor: Colors.green,
            backgroundColor: Colors.green.withOpacity(0.10),
            child: Text(
              l10n.helpTipBestResults,
              style: const TextStyle(color: Colors.green, fontSize: 12, fontStyle: FontStyle.italic, height: 1.35),
            ),
          ),
          const SizedBox(height: 24),
          _sectionTitle(l10n.helpCaptureChecklistTitle),
          const SizedBox(height: 12),
          _infoCard(
            icon: Icons.checklist,
            iconColor: const Color(0xFF00D9FF),
            borderColor: const Color(0xFF00D9FF),
            backgroundColor: const Color(0xFF00D9FF).withOpacity(0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bulletItem(l10n.helpCaptureChecklist1),
                _bulletItem(l10n.helpCaptureChecklist2),
                _bulletItem(l10n.helpCaptureChecklist3),
                _bulletItem(l10n.helpCaptureChecklist4),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _infoCard(
            icon: Icons.settings_suggest,
            iconColor: Colors.cyan,
            borderColor: Colors.cyan,
            backgroundColor: Colors.cyan.withOpacity(0.10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.helpExportSettingsTitle,
                  style: const TextStyle(color: Colors.cyan, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.helpExportSettingsDesc,
                  style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildCNRITab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.helpCnriProtocolFeatures),
          const SizedBox(height: 12),
          _featureItem(Icons.visibility, l10n.helpFeaturePiRatioTitle, l10n.helpFeaturePiRatioDesc),
          _featureItem(Icons.circle_outlined, l10n.helpFeaturePupilFormTitle, l10n.helpFeaturePupilFormDesc),
          _featureItem(Icons.trip_origin, l10n.helpFeatureAnwTitle, l10n.helpFeatureAnwDesc),
          _featureItem(Icons.radar, l10n.helpFeatureZoneTitle, l10n.helpFeatureZoneDesc),
          _featureItem(Icons.compare_arrows, l10n.helpFeatureBilateralTitle, l10n.helpFeatureBilateralDesc),
          _featureItem(Icons.psychology, l10n.helpFeatureMlTitle, l10n.helpFeatureMlDesc),
          _featureItem(Icons.hub, l10n.helpHybridScoreTitle, l10n.helpHybridScoreDesc),
          _featureItem(Icons.waves, l10n.helpAnomalyGuideTitle, l10n.helpAnomalyGuideDesc),
          _featureItem(Icons.layers, l10n.helpZoneOverlayGuideTitle, l10n.helpZoneOverlayGuideDesc),
        ],
      ),
    );
  }

  static Widget _buildShortcutsTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.helpKeyboardShortcuts),
          const SizedBox(height: 12),
          _shortcutItem('Ctrl + H', l10n.helpShortcutCtrlH),
          _shortcutItem('F11', l10n.helpShortcutF11),
          _shortcutItem('Esc', l10n.helpShortcutEsc),
        ],
      ),
    );
  }
  static Widget _buildTroubleshootingTab(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l10n.helpCommonIssues),
          const SizedBox(height: 12),
          _troubleshootItem(l10n.helpIssueCameraNotDetected, [
            l10n.helpIssueCameraSolution1,
            l10n.helpIssueCameraSolution2,
            l10n.helpIssueCameraSolution3,
            l10n.helpIssueCameraSolution4,
          ]),
          _troubleshootItem(l10n.helpIssuePupilDetectionFails, [
            l10n.helpIssuePupilSolution1,
            l10n.helpIssuePupilSolution2,
            l10n.helpIssuePupilSolution3,
            l10n.helpIssuePupilSolution4,
          ]),
          _troubleshootItem(l10n.helpIssuePdfExportFails, [
            l10n.helpIssuePdfSolution1,
            l10n.helpIssuePdfSolution2,
            l10n.helpIssuePdfSolution3,
            l10n.helpIssuePdfSolution4,
          ]),
          const SizedBox(height: 16),
          _infoCard(
            icon: Icons.support_agent,
            iconColor: Colors.amber,
            borderColor: Colors.amber,
            backgroundColor: Colors.amber.withOpacity(0.10),
            child: Text(
              l10n.helpContactSupportTip,
              style: const TextStyle(color: Colors.amber, fontSize: 12, fontStyle: FontStyle.italic, height: 1.35),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF00D9FF),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
      ),
    );
  }

  static Widget _infoCard({
    required IconData icon,
    required Color iconColor,
    required Color borderColor,
    required Color backgroundColor,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor.withOpacity(0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(child: child),
        ],
      ),
    );
  }

  static Widget _helpItem(String num, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(color: Color(0xFF00D9FF), shape: BoxShape.circle),
            child: Center(child: Text(num, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _featureItem(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF).withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF00D9FF), size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _bulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(Icons.check_circle, color: Colors.green, size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.35))),
        ],
      ),
    );
  }

  static Widget _shortcutItem(String keys, String action) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 108,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white24),
            ),
            child: Text(keys, style: const TextStyle(color: Colors.white, fontSize: 11, fontFamily: 'monospace')),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(action, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.3))),
        ],
      ),
    );
  }

  static Widget _troubleshootItem(String problem, List<String> solutions) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.orange, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(problem, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
            ],
          ),
          const SizedBox(height: 8),
          ...solutions.map((s) => Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(color: Colors.green, fontSize: 12)),
                Expanded(child: Text(s, style: const TextStyle(color: Colors.white60, fontSize: 12, height: 1.3))),
              ],
            ),
          )),
        ],
      ),
    );
  }

}
// ABOUT DIALOG WITH LICENSE
// =============================================================================
class AboutDialogWithLicense extends StatefulWidget {
  const AboutDialogWithLicense({super.key});

  @override
  State<AboutDialogWithLicense> createState() => _AboutDialogWithLicenseState();
}

class _AboutDialogWithLicenseState extends State<AboutDialogWithLicense> {
  LicenseInfo? _license;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadLicense();
  }

  Future<void> _loadLicense() async {
    final lic = LicenseManager().cachedLicense ?? await LicenseManager().checkLicense();
    if (mounted) setState(() { _license = lic; _loading = false; });
  }

  String _statusText() {
    final l10n = AppLocalizations.of(context)!;

    if (_loading) return l10n.licenseLoading;
    if (_license == null) return l10n.licenseNotSetUp;
    if (_license!.isTrial) return '${l10n.licenseFreeTrial} (${l10n.licenseDaysRemaining(_license!.daysRemaining ?? 0)})';
    if (_license!.isExpired) return l10n.licenseStatusExpired;
    if (_license!.isValid) {
      return switch (_license!.type) {
        LicenseType.standard => l10n.licenseStandard,
        LicenseType.professional => l10n.licenseProfessional,
        LicenseType.enterprise => l10n.licenseEnterprise,
        _ => l10n.licenseLicensed,
      };
    }
    return l10n.licenseNotSetUp;
  }

  Color _statusColor() {
    if (_loading) return Colors.grey;
    if (_license == null) return Colors.orange;
    if (_license!.isTrial) {
      return (_license!.daysRemaining ?? 0) <= 3 ? Colors.orange : Colors.green;
    }
    if (_license!.isExpired) return Colors.red;
    if (_license!.isValid) return Colors.green;
    return Colors.orange;
  }

  String _expiresText() {
    final l10n = AppLocalizations.of(context)!;

    if (_license == null) return l10n.na;
    if (_license!.isTrial) return l10n.licenseDaysRemaining(_license!.daysRemaining ?? 0);
    if (_license!.isExpired) return l10n.licenseStatusExpired;
    if (_license!.expirationDate == null) return l10n.licenseLifetime;
    return _license!.expirationDate!.toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: const Color(0xFF1D1E33),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 520),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00D9FF), width: 2),
                ),
                child: const Icon(Icons.remove_red_eye, size: 30, color: Color(0xFF00D9FF)),
              ),
              const SizedBox(height: 12),
              Text(l10n.appTitle, style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 22, fontWeight: FontWeight.bold)),
              Text(l10n.aboutResearchEdition, style: const TextStyle(color: Colors.white54, fontSize: 12)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.purple),
                ),
                child: Text(l10n.aboutVersion('5.8.0'), style: const TextStyle(color: Colors.purple, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white24),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _statusColor().withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(_license?.isTrial == true ? Icons.rocket_launch : Icons.verified_user, color: _statusColor(), size: 20),
                        const SizedBox(width: 8),
                        Text(l10n.aboutLicense, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _row('${l10n.status}:', _statusText(), _statusColor()),
                    _row(l10n.aboutLicensedTo, _license?.registeredTo ?? l10n.licenseTrialUser, Colors.white70),
                    _row(l10n.aboutExpires, _expiresText(), Colors.white70),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          Get.back();
                          await showLicenseDialog(context, currentLicense: _license);
                        },
                        icon: const Icon(Icons.key, size: 16),
                        label: Text(_license?.isValid == true && !(_license?.isTrial ?? false) ? l10n.aboutManageLicense : l10n.licenseEnterKeyTitle),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _statusColor(),
                          side: BorderSide(color: _statusColor()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(l10n.aboutBasedOnCnri, style: const TextStyle(color: Colors.white38, fontSize: 10)),
              Text(l10n.aboutCopyright, style: const TextStyle(color: Colors.white38, fontSize: 10)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () => launchUrl(Uri.parse('https://cnri.edu')), child: Text(l10n.aboutWebsite, style: const TextStyle(fontSize: 11))),
                  const Text('•', style: TextStyle(color: Colors.white24)),
                  TextButton(onPressed: () => launchUrl(Uri.parse('https://cnri.edu/privacy-policy-2/')), child: Text(l10n.aboutPrivacy, style: const TextStyle(fontSize: 11))),
                ],
              ),
              TextButton(onPressed: () => Get.back(), child: Text(l10n.close, style: const TextStyle(color: Colors.white54))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          Flexible(child: Text(value, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
