// lib/main.dart
// CNRI Eye Capture v5.3.0 - HARDENED DESKTOP DB + FILE LOGGER
// ============================================================================
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/presentation/splash_screen/splash_screen.dart';
import 'package:ai_eye_capture/presentation/scan_history_screen.dart';
import 'package:ai_eye_capture/utils/app_branding.dart';
import 'package:ai_eye_capture/utils/language_controller.dart';
import 'package:ai_eye_capture/services/security_utils.dart';
import 'package:ai_eye_capture/services/secure_strings.dart';
import 'package:ai_eye_capture/utils/database_init.dart';
import 'package:ai_eye_capture/utils/purchase_links.dart';

// License system (desktop only)
import 'package:ai_eye_capture/utils/license_manager.dart';
import 'package:ai_eye_capture/presentation/license_dialog.dart';

// Database support (DESKTOP)
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// Window management for desktop
import 'package:window_manager/window_manager.dart';

// Custom title bar
import 'package:ai_eye_capture/widgets/windows_title_bar.dart';

// ============================================================================
// FILE-BASED LOGGER (SAFE ON LOCKED-DOWN WINDOWS MACHINES)
// ============================================================================
Future<void> logToFile(String message) async {
  try {
    final dir = await getApplicationSupportDirectory();
    final logDir = Directory(dir.path);
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }
    final logFile = File(p.join(logDir.path, 'startup_log.txt'));
    final ts = DateTime.now().toIso8601String();
    await logFile.writeAsString('[$ts] $message\n', mode: FileMode.append);
  } catch (_) {
    // swallow – never crash during logging
  }
}

// ============================================================================
// MAIN ENTRY POINT
// ============================================================================

String _resolveRevenueCatApiKey() {
  if (Platform.isIOS) {
    final key = SecureStrings.revenueCatKey;
    if (key.isEmpty) {
      throw StateError(
        'Missing RevenueCat iOS API key. Pass --dart-define=REVENUECAT_IOS_API_KEY=appl_xxx',
      );
    }
    return key;
  }

  if (Platform.isAndroid) {
    return SecureStrings.revenueCatKey;
  }

  throw UnsupportedError('RevenueCat is only configured for iOS and Android.');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await logToFile('App starting');

  // ------------------------------------------------------------
  // DESKTOP SQLITE INITIALIZATION (MUST BE FIRST)
  // ------------------------------------------------------------
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // ------------------------------------------------------------
  // RESOLVE & LOG APP SUPPORT DIRECTORY (CRITICAL)
  // ------------------------------------------------------------
  final supportDir = await getApplicationSupportDirectory();
  await logToFile('ApplicationSupportDirectory = ${supportDir.path}');

  // Ensure directory exists (SQLite will NOT create parents)
  final supportDirectory = Directory(supportDir.path);
  if (!await supportDirectory.exists()) {
    await supportDirectory.create(recursive: true);
    await logToFile('Created ApplicationSupportDirectory');
  }

  // ------------------------------------------------------------
  // DATABASE INITIALIZATION (NOW SAFE)
  // ------------------------------------------------------------
  try {
    await logToFile('Initializing database');
    await initializeDatabase();
    await logToFile('Database initialized successfully');
  } catch (e) {
    await logToFile('❌ Database initialization failed: $e');
  }

  // ------------------------------------------------------------
  // DESKTOP WINDOW SETUP
  // ------------------------------------------------------------
  await _setupDesktopWindow();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Get.put(LanguageController());
  _initializeSecurity();

  // ------------------------------------------------------------
  // PLATFORM-SPECIFIC SERVICES
  // ------------------------------------------------------------
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await logToFile('Initializing desktop license system');
    await LicenseManager().initialize();
    await logToFile('License system initialized');
  } else {
    await Purchases.setDebugLogsEnabled(true);
    final revenueCatApiKey = _resolveRevenueCatApiKey();
    await Purchases.configure(
      PurchasesConfiguration(revenueCatApiKey),
    );
  }


  await logToFile('Launching UI');
  runApp(const MyApp());
}

// ============================================================================
// DESKTOP WINDOW SETUP
// ============================================================================
Future<void> _setupDesktopWindow() async {
  if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) return;

  try {
    await windowManager.ensureInitialized();

    const Size defaultSize = Size(500, 650);
    const Size minSize = Size(400, 500);
    const Size maxSize = Size(1400, 900);

    WindowOptions windowOptions = WindowOptions(
      size: defaultSize,
      minimumSize: minSize,
      maximumSize: maxSize,
      center: true,
      backgroundColor: const Color(0xFF0A0E21),
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      title: 'PupilMetrics',
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  } catch (e) {
    await logToFile('Window setup error: $e');
  }
}

// ============================================================================
// SECURITY INITIALIZATION (background)
// ============================================================================
Future<void> _initializeSecurity() async {
  try {
    final checker = DeviceIntegrityChecker();
    final result = await checker.runSecurityChecks();
    globalSecurityStatus = result;
  } catch (e) {
    globalSecurityStatus = null;
  }
}

// ============================================================================
// ROOT APP
// ============================================================================
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _licenseChecked = false;
  bool _showLicenseBlocker = false;

  @override
  void initState() {
    super.initState();
    _checkDesktopLicense();
  }

  Future<void> _checkDesktopLicense() async {
    if (!isDesktopPlatform) {
      setState(() => _licenseChecked = true);
      return;
    }

    final license = LicenseManager().cachedLicense;

    if (license != null && license.isValid) {
      setState(() => _licenseChecked = true);
      return;
    }

    setState(() {
      _licenseChecked = true;
      _showLicenseBlocker = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();

    return Obx(() => GetMaterialApp(
          title: AppInfo.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          locale: languageController.currentLocale.value,
          fallbackLocale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
            Locale('pt', 'BR'),
            Locale('fr'),
            Locale('de'),
            Locale('ja'),
            Locale('ko'),
            Locale('it'),
          ],
          builder: (context, child) {
            final appContent = isDesktopPlatform
                ? Column(
                    children: [
                      const WindowsTitleBar(),
                      Expanded(child: child ?? const SizedBox.shrink()),
                    ],
                  )
                : (child ?? const SizedBox.shrink());

            if (isDesktopPlatform) {
              return CallbackShortcuts(
                bindings: <ShortcutActivator, VoidCallback>{
                  const SingleActivator(LogicalKeyboardKey.f11): _toggleDesktopFullscreen,
                  const SingleActivator(LogicalKeyboardKey.keyH, control: true): _openScanHistory,
                  const SingleActivator(LogicalKeyboardKey.escape): _handleEscape,
                },
                child: Focus(
                  autofocus: true,
                  child: appContent,
                ),
              );
            }
            return appContent;
          },
          home: !_licenseChecked
              ? const _LicenseCheckScreenContent()
              : _showLicenseBlocker
                  ? _LicenseBlockerScreenContent(onLicenseActivated: () {
                      setState(() => _showLicenseBlocker = false);
                    })
                  : const SplashScreen(),
        ));
  }
}


// ============================================================================
void _openScanHistory() {
  final nav = Get.key.currentState;
  if (nav == null) return;

  nav.push(
    MaterialPageRoute(builder: (_) => const ScanHistoryScreen()),
  );
}

Future<void> _toggleDesktopFullscreen() async {
  if (!isDesktopPlatform) return;

  try {
    final isFullScreen = await windowManager.isFullScreen();
    await windowManager.setFullScreen(!isFullScreen);
  } catch (e) {
    await logToFile('Fullscreen shortcut error: $e');
  }
}

void _handleEscape() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
    return;
  }

  final nav = Get.key.currentState;
  if (nav?.canPop() ?? false) {
    nav!.maybePop();
  }
}

// NOTE: Title bar is now added via GetMaterialApp builder for ALL screens
// ============================================================================

// ============================================================================
// LICENSE CHECK LOADING SCREEN (Content only - title bar added by builder)
// ============================================================================
class _LicenseCheckScreenContent extends StatelessWidget {
  const _LicenseCheckScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App icon/logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D9FF).withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.remove_red_eye,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              '${AppLocalizations.of(context)!.windowTitle} ${AppLocalizations.of(context)!.aboutResearchEdition}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: Color(0xFF00D9FF),
                strokeWidth: 3,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.licenseChecking,
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// LICENSE BLOCKER SCREEN (Content only - title bar added by builder)
// ============================================================================
class _LicenseBlockerScreenContent extends StatelessWidget {
  final VoidCallback onLicenseActivated;

  const _LicenseBlockerScreenContent({required this.onLicenseActivated});

  @override
  Widget build(BuildContext context) {
    final license = LicenseManager().cachedLicense;
    final isExpired = license?.status == LicenseStatus.trialExpired ||
        license?.status == LicenseStatus.expired;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isExpired ? Colors.orange : Colors.red).withOpacity(0.2),
                  border: Border.all(
                    color: isExpired ? Colors.orange : Colors.red,
                    width: 3,
                  ),
                ),
                child: Icon(
                  isExpired ? Icons.timer_off : Icons.lock,
                  size: 60,
                  color: isExpired ? Colors.orange : Colors.red,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                isExpired ? l10n.trialExpiredTitle : l10n.licenseRequiredTitle,
                style: TextStyle(
                  color: isExpired ? Colors.orange : Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                license?.message ?? l10n.licenseActivateValidMessage,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  children: [
                    Text(
                      l10n.licenseProIncludes,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _featureRow(Icons.all_inclusive, l10n.licenseFeatureUnlimitedAnalysis),
                    _featureRow(Icons.picture_as_pdf, l10n.licenseFeaturePdfReports),
                    _featureRow(Icons.compare_arrows, l10n.licenseFeatureBilateralComparison),
                    _featureRow(Icons.trip_origin, l10n.licenseFeatureAnwAnalysis),
                    _featureRow(Icons.history, l10n.licenseFeatureScanHistory),
                    _featureRow(Icons.update, l10n.licenseFeatureUpdates),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _showActivationDialog(context),
                  icon: const Icon(Icons.vpn_key),
                  label: Text(
                    l10n.licenseActivate,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _handlePurchasePagePress,
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(l10n.licensePurchase),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(color: Colors.green),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => exit(0),
                child: Text(
                  l10n.licenseExitApplication,
                  style: const TextStyle(color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  Future<void> _showActivationDialog(BuildContext context) async {
    final result = await showLicenseDialog(
      context,
      currentLicense: LicenseManager().cachedLicense,
    );

    if (result != null && result.isValid) {
      onLicenseActivated();
    }
  }

  Future<void> _handlePurchasePagePress() async {
    await openPurchasePage();
  }
}
// ============================================================================
// GLOBAL STATE
// ============================================================================
String? leftEyePic;
String? rightEyePic;

PatientInfo? globalPatientInfo;

double? globalRightEyeIrisSize;
double? globalLeftEyeIrisSize;
double? globalRightEyeZoom;

EnvironmentCheckResult? globalSecurityStatus;

bool get isEnvironmentSecure => globalSecurityStatus?.isSecure ?? true;

List<String> get securityWarnings =>
    globalSecurityStatus?.warnings ?? [];

// ============================================================================
// HELPER: Check if running on desktop
// ============================================================================
bool get isDesktopPlatform =>
    Platform.isWindows || Platform.isMacOS || Platform.isLinux;

// ============================================================================
// WINDOW SIZE TOGGLE WIDGET - Use in AppBars
// ============================================================================
class WindowSizeToggle extends StatefulWidget {
  const WindowSizeToggle({super.key});

  @override
  State<WindowSizeToggle> createState() => _WindowSizeToggleState();
}

class _WindowSizeToggleState extends State<WindowSizeToggle> {
  bool _isExpanded = false;

  Future<void> _toggleWindowSize() async {
    if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) return;

    try {
      if (_isExpanded) {
        // Compact mode - portrait style
        await windowManager.setSize(const Size(480, 720));
      } else {
        // Expanded mode - for viewing results
        await windowManager.setSize(const Size(1100, 750));
      }
      await windowManager.center();
      setState(() => _isExpanded = !_isExpanded);
    } catch (e) {
      debugPrint('Window resize error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show on desktop
    if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: Icon(
        _isExpanded ? Icons.fullscreen_exit : Icons.fullscreen,
        color: Colors.white70,
      ),
      tooltip: _isExpanded ? AppLocalizations.of(context)!.windowCompactView : AppLocalizations.of(context)!.windowExpandedView,
      onPressed: _toggleWindowSize,
    );
  }
}

// ============================================================================
// LICENSE STATUS WIDGET - Use in Settings/About screens
// ============================================================================
class LicenseStatusWidget extends StatelessWidget {
  const LicenseStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (!isDesktopPlatform) return const SizedBox.shrink();

    final license = LicenseManager().cachedLicense;
    if (license == null) return const SizedBox.shrink();

    final color = license.isValid
        ? (license.isTrial ? Colors.orange : Colors.green)
        : Colors.red;

    final icon = license.isValid
        ? (license.isTrial ? Icons.timer : Icons.verified)
        : Icons.error;

    final l10n = AppLocalizations.of(context)!;
    final statusText = license.isTrial
        ? l10n.licenseStatusTrialDaysLeft(license.daysRemaining ?? 0)
        : license.isValid
            ? l10n.licenseStatusValid
            : l10n.licenseNotLicensed;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(l10n.licenseStatusTitle, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        statusText,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white38),
      onTap: () async {
        final result = await showLicenseDialog(
          context,
          currentLicense: license,
        );
        if (result != null && result.isValid) {
        }
      },
    );
  }
}
// ============================================================================
// DESKTOP SCAFFOLD WRAPPER - Use to wrap screens with title bar
// ============================================================================
class DesktopScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;

  const DesktopScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.floatingActionButton,
    this.backgroundColor,
  });

  bool get _isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  @override
  Widget build(BuildContext context) {
    if (!_isDesktop) {
      // Mobile: Regular scaffold
      return Scaffold(
        backgroundColor: backgroundColor ?? const Color(0xFF0A0E21),
        appBar: appBar,
        body: child,
        floatingActionButton: floatingActionButton,
      );
    }

    // Desktop: Custom title bar + content
    return Scaffold(
      backgroundColor: backgroundColor ?? const Color(0xFF0A0E21),
      body: Column(
        children: [
          const WindowsTitleBar(),
          if (appBar != null) appBar!,
          Expanded(child: child),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

