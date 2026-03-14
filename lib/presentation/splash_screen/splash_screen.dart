// lib/presentation/splash_screen/splash_screen.dart
// v5.5 PRODUCTION - Clean build with trial enforcement
// - Language picker moved to title bar
// - Friendly license messages
// - Trial enforcement on "Start Analysis"

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/presentation/camera_screen/camera_mode_selector.dart';
import 'package:ai_eye_capture/presentation/patient_info_screen.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/presentation/scan_history_screen.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/license_manager.dart';
import 'package:ai_eye_capture/presentation/license_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  bool get _isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _controller.forward();

    // Initialize license during splash
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    // Initialize license in background
    if (_isDesktop) {
      await LicenseManager().initialize();
    }

    // Wait for animation then navigate
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Get.off(() => const HomeScreen());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: SingleChildScrollView(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00D9FF), width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00D9FF).withOpacity(0.4),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.remove_red_eye, size: 70, color: Color(0xFF00D9FF)),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'PupilMetrics',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Program Developer - Bryan K. Marcia, Ph.D.',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                    const SizedBox(height: 60),
                    const SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        color: Color(0xFF00D9FF),
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HOME SCREEN - PRODUCTION WITH TRIAL ENFORCEMENT
// ============================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool get _isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  LicenseInfo? _licenseInfo;
  bool _licenseLoaded = false;

  @override
  void initState() {
    super.initState();
    if (_isDesktop) {
      _loadLicenseStatus();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showStartupDisclaimer();
    });
  }

  Future<void> _loadLicenseStatus() async {
    var license = LicenseManager().cachedLicense;
    license ??= await LicenseManager().initialize();

    if (mounted) {
      setState(() {
        _licenseInfo = license;
        _licenseLoaded = true;
      });
    }
  }

  /// Check if user can start a new analysis
  bool get _canStartAnalysis {
    if (!_isDesktop) return true; // Mobile: no restrictions
    if (!_licenseLoaded) return true; // Still loading: allow
    if (_licenseInfo == null) return true; // First run: will start trial
    if (_licenseInfo!.isValid) return true; // Valid license or active trial
    return false; // Expired trial or invalid license
  }

  /// Handle "Start Analysis" with trial check
  void _handleStartAnalysis() {
    if (!_canStartAnalysis) {
      _showTrialExpiredDialog();
      return;
    }

    // Clear previous data and start
    leftEyePic = null;
    rightEyePic = null;
    globalPatientInfo = null;

    Get.to(() => PatientInfoScreen(
      onContinue: (PatientInfo patientInfo) {
        globalPatientInfo = patientInfo;
        Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (_) => CameraModeSelectorPage(
              rightEye: true,
              camera: null,
            ),
          ),
        );
      },
    ));
  }

  /// Show dialog when trial has expired
  void _showTrialExpiredDialog() {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.orange, width: 2),
        ),
        title: Row(
          children: [
            const Icon(Icons.timer_off, color: Colors.orange, size: 28),
            const SizedBox(width: 12),
            Text(
              l10n.trialExpiredTitle,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.trialExpiredMessage,
              style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.trialExpiredCanStill,
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Text('• ${l10n.trialExpiredViewAnalyses}', style: const TextStyle(color: Colors.white60, fontSize: 13)),
                  Text('• ${l10n.trialExpiredExportReports}', style: const TextStyle(color: Colors.white60, fontSize: 13)),
                  Text('• ${l10n.trialExpiredAccessHistory}', style: const TextStyle(color: Colors.white60, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.trialExpiredMaybeLater, style: const TextStyle(color: Colors.white54)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              _openLicenseDialog();
            },
            icon: const Icon(Icons.key, size: 18),
            label: Text(l10n.licenseEnterKeyTitle),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showStartupDisclaimer() async {
    final prefs = await SharedPreferences.getInstance();
    final shown = prefs.getBool('disclaimer_shown') ?? false;
    if (!shown) {
      await _showDisclaimerDialog(prefs);
    }
  }

  Future<void> _showDisclaimerDialog([SharedPreferences? prefs]) async {
    final preferences = prefs ?? await SharedPreferences.getInstance();
    final l10n = AppLocalizations.of(context);

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF00D9FF), width: 2),
        ),
        title: Row(
          children: [
            const Icon(Icons.science, color: Color(0xFF00D9FF), size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                l10n.researchDisclaimerTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Text(
                    l10n.researchDisclaimerWarning,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDisclaimerPoint(l10n.researchDisclaimerNotMedical),
                _buildDisclaimerPoint(l10n.researchDisclaimerNotClinical),
                _buildDisclaimerPoint(l10n.researchDisclaimerResults),
                _buildDisclaimerPoint(l10n.researchDisclaimerConsult),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    l10n.researchDisclaimerAcknowledge,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await preferences.setBool('disclaimer_shown', true);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF00D9FF),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              l10n.iUnderstand,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF00D9FF), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LICENSE UI HELPERS
  // ============================================================

  Widget _buildLicenseStatusWidget() {
    final l10n = AppLocalizations.of(context);

    if (!_licenseLoaded) {
      return _buildLicenseCard(
        icon: Icons.hourglass_empty,
        iconColor: Colors.grey,
        title: l10n.aboutLicense,
        subtitle: l10n.licenseLoading,
        subtitleColor: Colors.grey,
        showButton: false,
      );
    }

    final license = _licenseInfo;

    // No license data - show welcome/trial start
    if (license == null || license.status == LicenseStatus.unregistered) {
      return _buildWelcomeCard();
    }

    // Active trial
    if (license.isTrial) {
      final days = license.daysRemaining ?? 0;
      final isExpiringSoon = days <= 3;
      return _buildLicenseCard(
        icon: Icons.rocket_launch,
        iconColor: isExpiringSoon ? Colors.orange : Colors.green,
        title: l10n.licenseFreeTrial,
        subtitle: l10n.licenseDaysRemaining(days),
        subtitleColor: isExpiringSoon ? Colors.orange : Colors.green,
        showButton: true,
        buttonText: l10n.upgrade,
        buttonColor: const Color(0xFF00D9FF),
      );
    }

    // Expired trial
    if (license.isExpired) {
      return _buildLicenseCard(
        icon: Icons.timer_off,
        iconColor: Colors.orange,
        title: l10n.licenseTrialEnded,
        subtitle: l10n.licenseEnterToContinue,
        subtitleColor: Colors.orange,
        showButton: true,
        buttonText: l10n.licenseActivate,
        buttonColor: Colors.orange,
      );
    }

    // Valid full license
    if (license.isValid) {
      final title = switch (license.type) {
        LicenseType.standard => l10n.licenseStandard,
        LicenseType.professional => l10n.licenseProfessional,
        LicenseType.enterprise => l10n.licenseEnterprise,
        _ => l10n.licenseLicensed,
      };
      return _buildLicenseCard(
        icon: Icons.verified,
        iconColor: Colors.green,
        title: title,
        subtitle: license.registeredTo ?? l10n.licenseActive,
        subtitleColor: Colors.green,
        showButton: false,
      );
    }

    // Fallback
    return _buildWelcomeCard();
  }

  Widget _buildWelcomeCard() {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D9FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.rocket_launch, color: Color(0xFF00D9FF), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.licenseWelcome,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.licenseTrialFeatures,
                      style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    await LicenseManager().checkLicense();
                    _loadLicenseStatus();
                    Get.snackbar(
                      l10n.trialStartedSnackbar,
                      l10n.trialStartedMessage,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF00D9FF),
                    side: const BorderSide(color: Color(0xFF00D9FF)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(l10n.licenseStartTrial),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _openLicenseDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(l10n.licenseEnterKey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLicenseCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color subtitleColor,
    required bool showButton,
    String? buttonText,
    Color? buttonColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                Text(
                  subtitle,
                  style: TextStyle(color: subtitleColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (showButton)
            TextButton(
              onPressed: _openLicenseDialog,
              child: Text(
                buttonText ?? AppLocalizations.of(context).aboutManageLicense,
                style: TextStyle(color: buttonColor ?? const Color(0xFF00D9FF), fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  void _openLicenseDialog() async {
    final result = await showLicenseDialog(context, currentLicense: _licenseInfo);
    if (result != null) {
      _loadLicenseStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF00D9FF), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00D9FF).withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.remove_red_eye, size: 50, color: Color(0xFF00D9FF)),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.splashTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple.withOpacity(0.5)),
                  ),
                  child: Text(
                    l10n.researchEducationalTool,
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // START NEW ANALYSIS BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _handleStartAnalysis,
                    icon: const Icon(Icons.play_arrow, size: 28),
                    label: Text(l10n.startNewAnalysis, style: const TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _canStartAnalysis
                          ? const Color(0xFF00D9FF)
                          : Colors.grey.shade700,
                      foregroundColor: _canStartAnalysis ? Colors.black : Colors.white54,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // VIEW HISTORY BUTTON (always available)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ScanHistoryScreen()),
                      );
                    },
                    icon: const Icon(Icons.history),
                    label: Text(l10n.viewHistory),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF00D9FF)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),

                // LICENSE SECTION (Desktop only)
                if (_isDesktop) ...[
                  const SizedBox(height: 24),
                  _buildLicenseStatusWidget(),
                ],

                const SizedBox(height: 24),

                // Disclaimer link
                TextButton(
                  onPressed: () => _showDisclaimerDialog(),
                  child: Text(
                    l10n.viewResearchDisclaimer,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}