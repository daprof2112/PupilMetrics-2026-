// lib/l10n/l10n_helper.dart
// Safe accessor for AppLocalizations that never returns null

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

/// Extension to safely get AppLocalizations from context
/// Usage: context.l10n.someString
extension L10nExtension on BuildContext {
  /// Safely gets AppLocalizations, throws descriptive error if null
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw FlutterError(
        'AppLocalizations not found in context.\n'
            'Make sure the widget is wrapped in a MaterialApp with proper '
            'localizationsDelegates and supportedLocales configured.',
      );
    }
    return localizations;
  }

  /// Safely gets AppLocalizations, returns null if not available
  AppLocalizations? get l10nOrNull => AppLocalizations.of(this);
}

/// Helper function for screens that need safe localization access
/// Returns AppLocalizations or throws with helpful message
AppLocalizations getL10n(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  if (l10n == null) {
    // This helps debug which screen has the issue
    debugPrint('⚠️ WARNING: AppLocalizations is null in context');
    debugPrint('   Widget: ${context.widget.runtimeType}');
    throw FlutterError.fromParts([
      ErrorSummary('AppLocalizations.of(context) returned null'),
      ErrorDescription(
          'This usually happens when:\n'
              '1. The locale is not in supportedLocales list in main.dart\n'
              '2. The ARB file for this locale is missing or has errors\n'
              '3. flutter gen-l10n was not run after adding new locales\n'
              '4. The widget is not a descendant of MaterialApp'
      ),
      ErrorHint('Run: flutter gen-l10n && flutter clean && flutter pub get'),
    ]);
  }
  return l10n;
}