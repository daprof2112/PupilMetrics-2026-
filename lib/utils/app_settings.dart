import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsData {
  const AppSettingsData({
    required this.autoSavePdf,
    required this.includeImagesInPdf,
    required this.showMlComparison,
    required this.showZoneOverlay,
    required this.preferredCamera,
    required this.defaultZoom,
  });

  final bool autoSavePdf;
  final bool includeImagesInPdf;
  final bool showMlComparison;
  final bool showZoneOverlay;
  final String preferredCamera;
  final double defaultZoom;

  AppSettingsData copyWith({
    bool? autoSavePdf,
    bool? includeImagesInPdf,
    bool? showMlComparison,
    bool? showZoneOverlay,
    String? preferredCamera,
    double? defaultZoom,
  }) {
    return AppSettingsData(
      autoSavePdf: autoSavePdf ?? this.autoSavePdf,
      includeImagesInPdf: includeImagesInPdf ?? this.includeImagesInPdf,
      showMlComparison: showMlComparison ?? this.showMlComparison,
      showZoneOverlay: showZoneOverlay ?? this.showZoneOverlay,
      preferredCamera: preferredCamera ?? this.preferredCamera,
      defaultZoom: defaultZoom ?? this.defaultZoom,
    );
  }
}

class AppSettings {
  static const String cameraDinoLite = 'dino_lite';
  static const String cameraUsb = 'usb_camera';
  static const String cameraAutoDetect = 'auto_detect';

  static const String _autoSavePdfKey = 'settings_auto_save_pdf';
  static const String _includeImagesInPdfKey = 'settings_include_images_in_pdf';
  static const String _showMlComparisonKey = 'settings_show_ml_comparison';
  static const String _showZoneOverlayKey = 'settings_show_zone_overlay';
  static const String _preferredCameraKey = 'settings_preferred_camera';
  static const String _defaultZoomKey = 'cameraZoom';

  static const AppSettingsData defaults = AppSettingsData(
    autoSavePdf: true,
    includeImagesInPdf: true,
    showMlComparison: true,
    showZoneOverlay: true,
    preferredCamera: cameraDinoLite,
    defaultZoom: 0.0,
  );

  static Future<AppSettingsData> load() async {
    final prefs = await SharedPreferences.getInstance();
    final storedZoom = prefs.getDouble(_defaultZoomKey) ?? defaults.defaultZoom;
    final normalizedZoom = storedZoom > 1.0
        ? displayZoomToStored(storedZoom)
        : storedZoom.clamp(0.0, 1.0).toDouble();

    return AppSettingsData(
      autoSavePdf: prefs.getBool(_autoSavePdfKey) ?? defaults.autoSavePdf,
      includeImagesInPdf: prefs.getBool(_includeImagesInPdfKey) ?? defaults.includeImagesInPdf,
      showMlComparison: prefs.getBool(_showMlComparisonKey) ?? defaults.showMlComparison,
      showZoneOverlay: prefs.getBool(_showZoneOverlayKey) ?? defaults.showZoneOverlay,
      preferredCamera: prefs.getString(_preferredCameraKey) ?? defaults.preferredCamera,
      defaultZoom: normalizedZoom,
    );
  }

  static double storedZoomToDisplay(double storedZoom) {
    final clamped = storedZoom.clamp(0.0, 1.0).toDouble();
    return 1.0 + (clamped * 3.0);
  }

  static double displayZoomToStored(double displayZoom) {
    return ((displayZoom - 1.0) / 3.0).clamp(0.0, 1.0).toDouble();
  }

  static Future<void> save(AppSettingsData settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_autoSavePdfKey, settings.autoSavePdf);
    await prefs.setBool(_includeImagesInPdfKey, settings.includeImagesInPdf);
    await prefs.setBool(_showMlComparisonKey, settings.showMlComparison);
    await prefs.setBool(_showZoneOverlayKey, settings.showZoneOverlay);
    await prefs.setString(_preferredCameraKey, settings.preferredCamera);
    await prefs.setDouble(_defaultZoomKey, settings.defaultZoom);
  }
}
