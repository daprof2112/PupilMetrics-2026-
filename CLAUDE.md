# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Get dependencies
flutter pub get

# Run on Windows desktop (primary target)
flutter run -d windows

# Run on connected device
flutter run

# Build Windows release
flutter build windows --release

# Build iOS (requires macOS + Codemagic)
flutter build ipa --release --dart-define=REVENUECAT_IOS_API_KEY=$REVENUECAT_IOS_API_KEY

# Regenerate localization files after editing .arb files
flutter gen-l10n

# Analyze code
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/path/to/test_file.dart
```

## Architecture Overview

This is **PupilMetrics** (package: `ai_eye_capture`), a Flutter medical app that captures eye images and performs iris/pupil analysis for clinical assessment. It targets Windows desktop (primary), iOS, and Android.

### App Flow

1. **License Check** (`main.dart`) → Desktop: `LicenseManager`, Mobile: RevenueCat
2. **SplashScreen** (`lib/presentation/splash_screen/`) → entry point after licensing
3. **PatientInfoScreen** → collect patient data
4. **CameraModeSelectorPage** (`lib/presentation/camera_screen/camera_mode_selector.dart`) → pick camera source per eye
5. **Eye capture screens** → left/right eye photo screens, UVC camera screens, video mode
6. **AnalysisScreen** (`lib/presentation/analysis_screen.dart`) → runs analysis pipeline, displays results, exports PDF
7. **ScanHistoryScreen** → view past scans (SQLite-backed)

### Analysis Pipeline

`AnalysisScreen` runs a **hybrid analysis** combining:
- **Classical CV** (`lib/utils/pupil_analyzer_fixed.dart`) — pixel-based iris detection
- **ML model** (`lib/utils/ml_pupil_analyzer.dart`) — ONNX Runtime with `assets/ml/cnri_model.onnx` (224×224 input, 4 regression outputs: PI ratio, decentration, ellipseness, anisocoria)
- **Hybrid fusion** (`lib/utils/hybrid_confidence.dart`) — weighted confidence score combining capture quality, classical confidence, ML plausibility, and cross-model agreement

### Platform Differences

The app has significant platform-specific branching. Check `isDesktopPlatform` (defined in `main.dart`) throughout:
- **Desktop**: SQLite via `sqflite_common_ffi` + `sqfliteFfiInit()`, `LicenseManager` (file-based with HTTP validation), `window_manager` for custom title bar, UVC camera support via `flutter_uvc_camera`
- **Mobile**: RevenueCat (`purchases_flutter`) for in-app purchases, standard `sqflite`, standard camera stack

### Key Files

| File | Purpose |
|------|---------|
| `lib/main.dart` | Entry point; global state (`leftEyePic`, `rightEyePic`, `globalPatientInfo`), window setup, license check |
| `lib/utils/license_manager.dart` | Desktop license system (trial/standard/professional/enterprise, machine-ID binding, HTTP validation) |
| `lib/utils/database_helper.dart` | `ScanRecord` model + SQLite CRUD; uses `getApplicationSupportDirectory()` on desktop |
| `lib/utils/database_init.dart` | Called once at startup to initialize DB schema |
| `lib/utils/ml_pupil_analyzer.dart` | ONNX Runtime singleton; loads `cnri_model.onnx` |
| `lib/utils/pupil_analyzer_fixed.dart` | Classical CV iris/pupil analysis; returns `EyeAnalysisResult` |
| `lib/utils/hybrid_confidence.dart` | `HybridConfidenceFusion.fuse()` — combines classical + ML outputs |
| `lib/utils/app_settings.dart` | `AppSettings` — SharedPreferences-backed settings (camera, zoom, PDF options) |
| `lib/widgets/windows_title_bar.dart` | Custom draggable title bar injected by `GetMaterialApp` builder for all desktop screens |
| `lib/config/clinical_constants.dart` | Clinical thresholds (age-norm ranges, anisocoria cutoffs) |
| `lib/utils/dynamic_chart_painter.dart` | Custom `CustomPainter` for polar/radial iris zone charts |
| `lib/utils/polar_zone_hittest.dart` | Hit-testing for interactive polar zone overlay |

### State Management

- **GetX** (`get` package) for navigation (`Get.to`, `Get.back`) and reactive state
- `LanguageController` (GetX) manages locale globally
- Global variables in `main.dart` (`leftEyePic`, `rightEyePic`, `globalPatientInfo`, etc.) pass data between screens — this is intentional for the linear scan flow
- `AppSettings.load()` / `AppSettings.save()` for persistent settings via SharedPreferences

### Localization

- ARB source files: `lib/l10n/app_en.arb` (template)
- Generated output: `lib/l10n/app_localizations.dart` + per-language files
- Config: `l10n.yaml` (output-dir: `lib/l10n`, nullable-getter: false)
- 8 supported locales: en, es, pt_BR, fr, de, ja, ko, it
- After editing any `.arb` file, run `flutter gen-l10n` to regenerate

### Camera Modes

Multiple camera sources are supported, selected in `CameraModeSelectorPage`:
- Standard Flutter `camera` plugin (built-in/webcam)
- `SimpleGatedCamera` — camera with quality gate
- `SecureUvcCameraScreen` / `UvcCameraScreen` — external USB/UVC cameras (Dino-Lite etc.) via `flutter_uvc_camera`
- `VideoCaptureScreen` — PLR (pupillary light reflex) video analysis mode
- Image picker (gallery import)

### Desktop Window

- Custom title bar (`WindowsTitleBar`) injected globally via `GetMaterialApp`'s `builder` — do NOT add it manually inside individual screens
- Use `DesktopScaffold` widget (defined in `main.dart`) when wrapping screens that need AppBar on desktop
- Keyboard shortcuts on desktop: F11 = fullscreen, Ctrl+H = scan history, Escape = back/close dialog

### CI/CD

Codemagic (`codemagic.yaml`): iOS App Store workflow and macOS DMG workflow, triggered on push to `main`. Bundle ID: `com.cnri.pupilmetrics`. RevenueCat key passed as `--dart-define=REVENUECAT_IOS_API_KEY`.
