import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();

  // Current locale - observable
  final Rx<Locale> currentLocale = const Locale('en').obs;

  // Storage key
  static const String _languageKey = 'selected_language';

  // Supported languages with display names and flags
  final List<LanguageModel> supportedLanguages = [
    LanguageModel(locale: const Locale('en'), name: 'English', nativeName: 'English', flag: '🇺🇸', countryCode: 'US'),
    LanguageModel(locale: const Locale('es'), name: 'Spanish', nativeName: 'Español', flag: '🇪🇸', countryCode: 'ES'),
    LanguageModel(locale: const Locale('pt', 'BR'), name: 'Portuguese (Brazil)', nativeName: 'Português (Brasil)', flag: '🇧🇷', countryCode: 'BR'),
    LanguageModel(locale: const Locale('fr'), name: 'French', nativeName: 'Français', flag: '🇫🇷', countryCode: 'FR'),
    LanguageModel(locale: const Locale('de'), name: 'German', nativeName: 'Deutsch', flag: '🇩🇪', countryCode: 'DE'),
    LanguageModel(locale: const Locale('ja'), name: 'Japanese', nativeName: '日本語', flag: '🇯🇵', countryCode: 'JP'),
    LanguageModel(locale: const Locale('ko'), name: 'Korean', nativeName: '한국어', flag: '🇰🇷', countryCode: 'KR'),
    LanguageModel(locale: const Locale('it'), name: 'Italian', nativeName: 'Italiano', flag: '🇮🇹', countryCode: 'IT'),
    LanguageModel(locale: const Locale('ru'), name: 'Russian', nativeName: 'Русский', flag: '🇷🇺', countryCode: 'RU'),
    LanguageModel(locale: const Locale('zh'), name: 'Chinese (Simplified)', nativeName: '简体中文', flag: '🇨🇳', countryCode: 'CN'),
    LanguageModel(locale: const Locale('ar'), name: 'Arabic', nativeName: 'العربية', flag: '🇸🇦', countryCode: 'SA'),
    LanguageModel(locale: const Locale('hi'), name: 'Hindi', nativeName: 'हिन्दी', flag: '🇮🇳', countryCode: 'IN'),
    LanguageModel(locale: const Locale('tr'), name: 'Turkish', nativeName: 'Türkçe', flag: '🇹🇷', countryCode: 'TR'),
    LanguageModel(locale: const Locale('pl'), name: 'Polish', nativeName: 'Polski', flag: '🇵🇱', countryCode: 'PL'),
  ];

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  /// Load saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLang = prefs.getString(_languageKey);

      if (savedLang != null) {
        // Parse saved locale (format: "en" or "pt_BR")
        final parts = savedLang.split('_');
        final locale = parts.length > 1
            ? Locale(parts[0], parts[1])
            : Locale(parts[0]);

        // Verify it's a supported locale
        if (_isSupported(locale)) {
          currentLocale.value = locale;
          Get.updateLocale(locale);
        }
      } else {
        // Use device locale if supported, otherwise default to English
        final deviceLocale = Get.deviceLocale;
        if (deviceLocale != null && _isSupported(deviceLocale)) {
          currentLocale.value = deviceLocale;
          Get.updateLocale(deviceLocale);
        }
      }
    } catch (e) {
      debugPrint('Error loading saved language: $e');
    }
  }

  /// Check if a locale is supported
  bool _isSupported(Locale locale) {
    return supportedLanguages.any((lang) =>
    lang.locale.languageCode == locale.languageCode &&
        (lang.locale.countryCode == null || lang.locale.countryCode == locale.countryCode)
    );
  }

  /// Change the app language
  Future<void> changeLanguage(Locale locale) async {
    if (currentLocale.value == locale) return;

    try {
      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final localeString = locale.countryCode != null
          ? '${locale.languageCode}_${locale.countryCode}'
          : locale.languageCode;
      await prefs.setString(_languageKey, localeString);

      // Update current locale
      currentLocale.value = locale;

      // Update GetX locale (this triggers UI rebuild)
      Get.updateLocale(locale);

      debugPrint('Language changed to: $localeString');
    } catch (e) {
      debugPrint('Error changing language: $e');
    }
  }

  /// Get the current language model
  LanguageModel get currentLanguage {
    return supportedLanguages.firstWhere(
          (lang) => lang.locale.languageCode == currentLocale.value.languageCode,
      orElse: () => supportedLanguages.first,
    );
  }

  /// Get display name for a locale
  String getLanguageName(Locale locale) {
    final lang = supportedLanguages.firstWhere(
          (l) => l.locale.languageCode == locale.languageCode,
      orElse: () => supportedLanguages.first,
    );
    return lang.nativeName;
  }

  /// Get flag for a locale
  String getLanguageFlag(Locale locale) {
    final lang = supportedLanguages.firstWhere(
          (l) => l.locale.languageCode == locale.languageCode,
      orElse: () => supportedLanguages.first,
    );
    return lang.flag;
  }
}

/// Model class for language data
class LanguageModel {
  final Locale locale;
  final String name;        // English name
  final String nativeName;  // Native name (e.g., "日本語" for Japanese)
  final String flag;        // Flag emoji (e.g., "🇺🇸")
  final String countryCode; // Country code (e.g., "US")

  LanguageModel({
    required this.locale,
    required this.name,
    required this.nativeName,
    required this.flag,
    required this.countryCode,
  });
}