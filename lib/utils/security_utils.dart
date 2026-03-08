// lib/utils/security_utils.dart
// Security utilities for CNRI Eye Capture
// v1.0.0 - Memory protection, secure storage, input sanitization

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';

// ============================================================================
// SECURE MEMORY HANDLER
// Ensures sensitive data is cleared from memory when no longer needed
// ============================================================================

class SecureMemory {
  /// Securely clear a Uint8List (image bytes, etc.)
  static void clearBytes(Uint8List? data) {
    if (data == null) return;
    for (int i = 0; i < data.length; i++) {
      data[i] = 0;
    }
  }

  /// Securely clear a List<int>
  static void clearIntList(List<int>? data) {
    if (data == null) return;
    for (int i = 0; i < data.length; i++) {
      data[i] = 0;
    }
  }

  /// Securely clear a string by overwriting (limited effectiveness in Dart)
  /// Best practice: avoid storing sensitive strings, use secure storage
  static String clearString(String? s) {
    // In Dart, strings are immutable, so we can't truly clear them
    // This returns empty string for assignment: myString = SecureMemory.clearString(myString)
    return '';
  }

  /// Create a secure random string (for IDs, tokens, etc.)
  static String generateSecureId({int length = 32}) {
    final random = Random.secure();
    final values = List<int>.generate(length, (_) => random.nextInt(256));
    return base64Url.encode(values).substring(0, length);
  }

  /// Hash sensitive data for logging (never log raw patient data)
  static String hashForLogging(String sensitive) {
    final bytes = utf8.encode(sensitive);
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 8) + '...';
  }
}

// ============================================================================
// SECURE PATIENT DATA STORAGE
// Encrypts patient information at rest
// ============================================================================

class SecurePatientStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'cnri_secure_prefs',
      preferencesKeyPrefix: 'cnri_',
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      accountName: 'cnri_eye_capture',
    ),
  );

  // Keys
  static const _patientDataKey = 'patient_data_';
  static const _sessionKey = 'current_session';
  static const _encryptionSaltKey = 'encryption_salt';

  /// Store patient info securely
  static Future<void> storePatientInfo(String odId, Map<String, dynamic> info) async {
    try {
      final jsonStr = jsonEncode(info);
      await _storage.write(key: '$_patientDataKey$odId', value: jsonStr);
    } catch (e) {
      debugPrint('SecureStorage write error: ${e.runtimeType}');
      rethrow;
    }
  }

  /// Retrieve patient info
  static Future<Map<String, dynamic>?> getPatientInfo(String odId) async {
    try {
      final jsonStr = await _storage.read(key: '$_patientDataKey$odId');
      if (jsonStr == null) return null;
      return jsonDecode(jsonStr) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('SecureStorage read error: ${e.runtimeType}');
      return null;
    }
  }

  /// Delete patient info
  static Future<void> deletePatientInfo(String odId) async {
    await _storage.delete(key: '$_patientDataKey$odId');
  }

  /// Clear all stored data (for logout/reset)
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Store session token securely
  static Future<void> storeSession(String token) async {
    await _storage.write(key: _sessionKey, value: token);
  }

  /// Get session token
  static Future<String?> getSession() async {
    return await _storage.read(key: _sessionKey);
  }

  /// Clear session
  static Future<void> clearSession() async {
    await _storage.delete(key: _sessionKey);
  }
}

// ============================================================================
// INPUT SANITIZATION
// Prevents injection attacks and validates input
// ============================================================================

class InputSanitizer {
  // Characters that should never appear in patient names
  static final _dangerousChars = RegExp(r'[<>"\x27;\\\/\x00-\x1f]');

  // Valid name pattern (letters, spaces, hyphens, apostrophes, periods)
  static final _validNamePattern = RegExp(r"^[a-zA-ZÀ-ÿ\s\-'.]+$");

  // Valid numeric ID pattern
  static final _validIdPattern = RegExp(r'^[a-zA-Z0-9\-_]+$');

  /// Sanitize patient name
  static String sanitizeName(String input) {
    // Remove dangerous characters
    String sanitized = input.replaceAll(_dangerousChars, '');
    // Trim whitespace
    sanitized = sanitized.trim();
    // Limit length
    if (sanitized.length > 100) {
      sanitized = sanitized.substring(0, 100);
    }
    return sanitized;
  }

  /// Validate patient name
  static bool isValidName(String input) {
    if (input.isEmpty || input.length > 100) return false;
    return _validNamePattern.hasMatch(input);
  }

  /// Sanitize and validate ID fields
  static String? sanitizeId(String input) {
    final sanitized = input.trim();
    if (sanitized.isEmpty || sanitized.length > 64) return null;
    if (!_validIdPattern.hasMatch(sanitized)) return null;
    return sanitized;
  }

  /// Sanitize notes/complaints text
  static String sanitizeNotes(String input) {
    // Remove potential script tags and dangerous content
    String sanitized = input
        .replaceAll(RegExp(r'<script[^>]*>.*?</script>', caseSensitive: false), '')
        .replaceAll(RegExp(r'<[^>]+>'), '') // Remove all HTML tags
        .replaceAll(_dangerousChars, '');

    // Limit length
    if (sanitized.length > 2000) {
      sanitized = sanitized.substring(0, 2000);
    }
    return sanitized.trim();
  }

  /// Validate age
  static bool isValidAge(int age) {
    return age >= 0 && age <= 150;
  }

  /// Sanitize filename
  static String sanitizeFilename(String filename) {
    return filename
        .replaceAll(RegExp(r'[^\w\-.]'), '_')
        .replaceAll(RegExp(r'\.{2,}'), '.')
        .substring(0, min(filename.length, 100));
  }
}

// ============================================================================
// SECURE ANALYSIS SESSION
// Wrapper that ensures cleanup of sensitive image data
// ============================================================================

class SecureAnalysisSession {
  Uint8List? _imageBytes;
  Map<String, dynamic>? _patientInfo;
  Map<String, dynamic>? _results;
  bool _isDisposed = false;

  SecureAnalysisSession();

  void setImageBytes(Uint8List bytes) {
    if (_isDisposed) throw StateError('Session disposed');
    // Clear previous image if exists
    if (_imageBytes != null) {
      SecureMemory.clearBytes(_imageBytes);
    }
    _imageBytes = Uint8List.fromList(bytes); // Make a copy
  }

  Uint8List? get imageBytes => _isDisposed ? null : _imageBytes;

  void setPatientInfo(Map<String, dynamic> info) {
    if (_isDisposed) throw StateError('Session disposed');
    _patientInfo = Map.from(info);
  }

  Map<String, dynamic>? get patientInfo => _isDisposed ? null : _patientInfo;

  void setResults(Map<String, dynamic> results) {
    if (_isDisposed) throw StateError('Session disposed');
    _results = Map.from(results);
  }

  Map<String, dynamic>? get results => _isDisposed ? null : _results;

  /// Securely dispose of all data
  void dispose() {
    if (_isDisposed) return;

    // Clear image bytes
    SecureMemory.clearBytes(_imageBytes);
    _imageBytes = null;

    // Clear maps
    _patientInfo?.clear();
    _patientInfo = null;

    _results?.clear();
    _results = null;

    _isDisposed = true;
  }

  bool get isDisposed => _isDisposed;
}

// ============================================================================
// RUNTIME INTEGRITY CHECKS
// Basic anti-tampering for release builds
// ============================================================================

class IntegrityChecker {
  static bool _hasChecked = false;
  static bool _isValid = true;

  /// Run basic integrity checks (call once at app startup)
  static Future<bool> runChecks() async {
    if (_hasChecked) return _isValid;

    _isValid = true;

    // Check 1: Debug mode detection (should be false in release)
    if (kDebugMode && !kProfileMode) {
      // Allow in debug, but flag it
      debugPrint('IntegrityChecker: Running in debug mode');
    }

    // Check 2: Assert functionality (asserts are stripped in release)
    bool assertsEnabled = false;
    assert(assertsEnabled = true);

    if (kReleaseMode && assertsEnabled) {
      // Asserts should be disabled in release
      _isValid = false;
    }

    _hasChecked = true;
    return _isValid;
  }

  /// Quick check if running in expected mode
  static bool get isReleaseMode => kReleaseMode;
  static bool get isProfileMode => kProfileMode;
  static bool get isDebugMode => kDebugMode;
}

// ============================================================================
// SECURE LOGGING
// Ensures sensitive data is never logged
// ============================================================================

class SecureLogger {
  static bool _enabled = !kReleaseMode; // Disabled in release by default

  static void enable() => _enabled = true;
  static void disable() => _enabled = false;

  /// Log general info (safe data only)
  static void info(String message) {
    if (_enabled) {
      debugPrint('[CNRI] $message');
    }
  }

  /// Log with patient context (hashes the ID)
  static void logPatientAction(String action, String odId) {
    if (_enabled) {
      final hashedId = SecureMemory.hashForLogging(odId);
      debugPrint('[CNRI] $action (patient: $hashedId)');
    }
  }

  /// Log analysis event (no sensitive data)
  static void logAnalysis(String eye, String quality) {
    if (_enabled) {
      debugPrint('[CNRI] Analysis: $eye eye, quality: $quality');
    }
  }

  /// Log error (sanitized)
  static void error(String context, Object error) {
    if (_enabled) {
      // Only log error type, not full message (might contain paths/data)
      debugPrint('[CNRI ERROR] $context: ${error.runtimeType}');
    }
  }
}