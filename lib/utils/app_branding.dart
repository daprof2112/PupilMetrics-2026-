// lib/utils/app_branding.dart
// Centralized branding and theming for CNRI / Bexel Irina

import 'package:flutter/material.dart';

// ============================================================
// APP INFO
// ============================================================

class AppInfo {
  static const String appName = 'PupilMetrics';
  static const String appTagline = 'Quantifying the pupil. Clarifying meaning.';
  static const String companyName = 'CNRI.EDU';
  static const String version = '3.3.0';
  static const String buildNumber = '1';

  static const String supportEmail = 'admin@cnri.edu';
  static const String privacyUrl = 'https://cnri.edu/privacy-policy-2/';
  static const String termsUrl = 'https://cnri.edu/pupilmetrics-research-only-software-license-agreement/';

  // Report branding
  static const String reportTitle = 'PUPILMETRICS RESEARCH ANALYSIS REPORT™';
  static const String reportProtocol = 'CNRI.EDU Protocol';

  // Copyright
  static String get copyright => '© ${DateTime.now().year} $companyName. All rights reserved.';
}

// ============================================================
// COLORS
// ============================================================

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF00D9FF);       // Cyan
  static const Color primaryDark = Color(0xFF00A8CC);
  static const Color primaryLight = Color(0xFF4DE8FF);

  // Background colors
  static const Color background = Color(0xFF0A0E21);    // Deep navy
  static const Color surface = Color(0xFF1D1E33);       // Card background
  static const Color surfaceLight = Color(0xFF2D2E43);

  // Accent colors
  static const Color accent = Color(0xFF6C63FF);        // Purple accent
  static const Color accentSecondary = Color(0xFFFF6B6B); // Coral

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Grade colors
  static const Color gradeA = Color(0xFF4CAF50);
  static const Color gradeB = Color(0xFF8BC34A);
  static const Color gradeC = Color(0xFFFF9800);
  static const Color gradeD = Color(0xFFF44336);

  // Text colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textMuted = Color(0xFF707070);

  // Sex colors
  static const Color male = Color(0xFF2196F3);
  static const Color female = Color(0xFFE91E63);

  // Eye indicators
  static const Color rightEye = Color(0xFF2196F3);      // Blue for OD
  static const Color leftEye = Color(0xFF4CAF50);       // Green for OS

  // Anisocoria severity
  static const Color anisocoriaNone = Color(0xFF4CAF50);
  static const Color anisocoriaMild = Color(0xFFFFEB3B);
  static const Color anisocriaModerate = Color(0xFFFF9800);
  static const Color anisocoriaSevere = Color(0xFFF44336);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, Color(0xFF1A1A2E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient get premiumGradient => LinearGradient(
    colors: [Colors.purple.shade600, Colors.deepPurple.shade800],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ============================================================
// TEXT STYLES
// ============================================================

class AppTextStyles {
  // Headings
  static const TextStyle h1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle h2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle h3 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle h4 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Body text
  static const TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
  );

  static const TextStyle bodySecondary = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
  );

  static const TextStyle caption = TextStyle(
    color: AppColors.textMuted,
    fontSize: 12,
  );

  // Buttons
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // Labels
  static const TextStyle label = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Values/metrics
  static const TextStyle metric = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle metricSmall = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

// ============================================================
// DECORATIONS
// ============================================================

class AppDecorations {
  // Card decoration
  static BoxDecoration card({Color? borderColor}) => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: borderColor ?? Colors.white.withOpacity(0.1),
    ),
  );

  // Primary button decoration
  static BoxDecoration primaryButton = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.3),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Circle avatar
  static BoxDecoration circleAvatar(Color color) => BoxDecoration(
    color: color.withOpacity(0.2),
    shape: BoxShape.circle,
  );

  // Badge
  static BoxDecoration badge(Color color) => BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(20),
  );

  // Input field
  static InputDecoration inputDecoration({
    required String hint,
    IconData? prefixIcon,
    Widget? suffix,
  }) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.white38),
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.primary) : null,
    suffix: suffix,
    filled: true,
    fillColor: AppColors.surface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error),
    ),
  );
}

// ============================================================
// BUTTON STYLES
// ============================================================

class AppButtonStyles {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.textPrimary,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: const BorderSide(color: AppColors.primary),
  );

  static ButtonStyle danger = ElevatedButton.styleFrom(
    backgroundColor: AppColors.error,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  static ButtonStyle outlined = OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    side: const BorderSide(color: AppColors.primary),
  );
}

// ============================================================
// THEME DATA (Flutter 3.x compatible)
// ============================================================

class AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surface,
      error: AppColors.error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtonStyles.primary),
    outlinedButtonTheme: OutlinedButtonThemeData(style: AppButtonStyles.outlined),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.surface,
      contentTextStyle: const TextStyle(color: AppColors.textPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );
}

// ============================================================
// HELPER FUNCTIONS
// ============================================================

class AppHelpers {
  // Get grade color
  static Color gradeColor(String grade) {
    switch (grade.toUpperCase()) {
      case 'A': return AppColors.gradeA;
      case 'B': return AppColors.gradeB;
      case 'C': return AppColors.gradeC;
      default: return AppColors.gradeD;
    }
  }

  // Get sex color
  static Color sexColor(String sex) {
    return sex.toLowerCase() == 'male' ? AppColors.male : AppColors.female;
  }

  // Get anisocoria severity color
  static Color anisocriaColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'none': return AppColors.anisocoriaNone;
      case 'mild': return AppColors.anisocoriaMild;
      case 'moderate': return AppColors.anisocriaModerate;
      default: return AppColors.anisocoriaSevere;
    }
  }

  // Format percentage
  static String formatPercent(double value, {int decimals = 1}) {
    return '${value.toStringAsFixed(decimals)}%';
  }
}
