// lib/utils/license_manager.dart
// CNRI Eye Capture - Desktop License Management System v2.1
// v1.2: Migrated from SharedPreferences + XOR to flutter_secure_storage
//       License data is now encrypted at rest using OS-native storage:
//       Windows DPAPI / macOS Keychain / Linux libsecret
// v1.3: Added HMAC-SHA256 integrity check to stored license blob.
//       Any direct edit of secure storage will be detected and rejected.
// v2.0: Phase 2 — Ed25519 asymmetric license file (.lic) support.
//       Private key lives only in the admin tool (never in the app).
//       Public key is embedded; no private key → no forged licenses.
// v2.1: Security hardening:
//       - Fixed: revoked licenses re-validated as valid after first check.
//         _validateOnline now deletes local cache on server rejection so
//         subsequent startups also fail rather than using stale local data.
//       - generateLicenseKey throws in kReleaseMode (cannot be called at
//         runtime in production builds).
//       - .lic file size capped at 10 KB before reading into memory.
//       - Ed25519 algorithm instance is now a cached static (was re-created
//         on every .lic verification).
// ============================================================================

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:cryptography/cryptography.dart' as cry;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/// License types supported by the system
enum LicenseType {
  trial,        // 14-day trial
  standard,     // Single machine, 1 year
  professional, // Single machine, lifetime
  enterprise,   // Multi-machine, lifetime
}

/// Current license status
enum LicenseStatus {
  valid,
  expired,
  invalid,
  unregistered,
  trialActive,
  trialExpired,
  machineMismatch,
  networkError,
}

/// License information container
class LicenseInfo {
  final LicenseStatus status;
  final LicenseType? type;
  final String? licenseKey;
  final String? registeredTo;
  final String? email;
  final DateTime? activationDate;
  final DateTime? expirationDate;
  final int? daysRemaining;
  final String? machineId;
  final String message;

  LicenseInfo({
    required this.status,
    this.type,
    this.licenseKey,
    this.registeredTo,
    this.email,
    this.activationDate,
    this.expirationDate,
    this.daysRemaining,
    this.machineId,
    required this.message,
  });

  bool get isValid => status == LicenseStatus.valid || status == LicenseStatus.trialActive;
  bool get isTrial => status == LicenseStatus.trialActive;
  bool get isExpired => status == LicenseStatus.expired || status == LicenseStatus.trialExpired;

  Map<String, dynamic> toJson() => {
    'status': status.name,
    'type': type?.name,
    'licenseKey': licenseKey,
    'registeredTo': registeredTo,
    'email': email,
    'activationDate': activationDate?.toIso8601String(),
    'expirationDate': expirationDate?.toIso8601String(),
    'daysRemaining': daysRemaining,
    'machineId': machineId,
    'message': message,
  };
}

/// Main License Manager class
class LicenseManager {
  // =========================================================================
  // CONFIGURATION - Update these for your deployment
  // =========================================================================
  static const String _appName = 'PupilMetrics';
  static const String _appVersion = '5.5.0';
  static const String _secretKey = 'J7hhJkReFF-CNRI-2026-JPz123Z883!'; // CHANGE THIS FOR PRODUCTION!

  // Set to your server URL to enable Phase 3 online activation.
  // Example: 'https://licenses.yourserver.com'
  // Keep 'offline' to run fully offline (Phase 1 + Phase 2 only).
  static const String _activationServer = 'offline';

  // Shared HMAC secret between app and license server.
  // Must match PM_API_SECRET in server/.env.
  // Only used when _activationServer != 'offline'.
  static const String _apiSecret = 'change-me-to-match-PM_API_SECRET-on-your-server';

  static const int _trialDays = 14;
  static const int _offlineGraceDays = 7;

  // Ed25519 public key for .lic file verification (base64-encoded, 32 bytes).
  // The matching private key lives ONLY in tool/generate_license.dart (gitignored).
  static const String _ed25519PublicKeyB64 =
      '9ThxoaJ2JIDDd8G50WRZglapCc6x/79gQ6MTJoLqn50=';

  // Cached Ed25519 algorithm instance (thread-safe, reused across all .lic verifications).
  static final _ed25519 = cry.Ed25519();

  // Maximum size of a .lic file we will parse (prevents reading arbitrarily large files).
  static const int _maxLicFileBytes = 10 * 1024; // 10 KB

  // OS-native encrypted storage (Windows DPAPI / macOS Keychain / Linux libsecret)
  // No key management needed — the OS handles encryption transparently.
  static const _storage = FlutterSecureStorage(
    wOptions: WindowsOptions(useBackwardCompatibility: false),
  );

  // Storage keys
  static const _keyLicenseData   = 'pm_license_data';
  static const _keyLastValidation = 'pm_last_validation';
  static const _keyTrialStart    = 'pm_trial_start';

  // Singleton pattern
  static final LicenseManager _instance = LicenseManager._internal();
  factory LicenseManager() => _instance;
  LicenseManager._internal();

  // Cached license info
  LicenseInfo? _cachedLicense;
  String? _machineId;

  // =========================================================================
  // PUBLIC API
  // =========================================================================

  /// Initialize the license manager - call on app startup
  Future<LicenseInfo> initialize() async {
    _machineId = await getMachineId();
    return await checkLicense();
  }

  /// Get current license status
  Future<LicenseInfo> checkLicense() async {
    try {
      final storedLicense = await _storage.read(key: _keyLicenseData);

      // No license stored - check for trial
      if (storedLicense == null) {
        return await _checkOrStartTrial();
      }

      // Parse stored license (stored as plain JSON; OS storage encrypts at rest)
      final licenseData = _parseLicenseData(storedLicense);
      if (licenseData == null) {
        await _storage.delete(key: _keyLicenseData);
        return await _checkOrStartTrial();
      }

      // Validate machine ID
      final storedMachineId = licenseData['machineId'] as String?;
      if (storedMachineId != null && storedMachineId != _machineId) {
        return _createLicenseInfo(LicenseStatus.machineMismatch,
            'This license is registered to a different computer. Please use your original device or contact support.');
      }

      // Check expiration
      final expDateStr = licenseData['expirationDate'] as String?;
      if (expDateStr != null) {
        final expDate = DateTime.parse(expDateStr);
        if (DateTime.now().isAfter(expDate)) {
          final licType = licenseData['type'] as String?;
          if (licType == 'trial') {
            return LicenseInfo(
              status: LicenseStatus.trialExpired,
              type: LicenseType.trial,
              activationDate: licenseData['activationDate'] != null
                  ? DateTime.parse(licenseData['activationDate'])
                  : null,
              expirationDate: expDate,
              daysRemaining: 0,
              machineId: _machineId,
              message: 'Your free trial has ended. Enter a license key to continue using all features.',
            );
          }
          return _createLicenseInfo(LicenseStatus.expired,
              'Your license has expired. Please renew to continue.');
        }
      }

      // Check if online validation needed
      final lastValidation = await _storage.read(key: _keyLastValidation);
      if (lastValidation != null) {
        final lastDate = DateTime.parse(lastValidation);
        final daysSince = DateTime.now().difference(lastDate).inDays;
        if (daysSince > _offlineGraceDays) {
          final onlineResult = await _validateOnline(licenseData['key'] as String?);
          if (onlineResult != null) return onlineResult;
        }
      }

      // License is valid
      _cachedLicense = _buildLicenseInfo(licenseData);
      return _cachedLicense!;

    } catch (e) {
      debugPrint('License check error: $e');
      return _createLicenseInfo(LicenseStatus.unregistered,
          'License needs to be set up. Start your free trial or enter a license key.');
    }
  }

  /// Activate a license key
  Future<LicenseInfo> activateLicense(String licenseKey, String email, String name) async {
    try {
      licenseKey = licenseKey.trim().toUpperCase().replaceAll(' ', '');

      if (!_validateKeyFormat(licenseKey)) {
        return _createLicenseInfo(LicenseStatus.invalid,
            'Please check your license key format. It should look like: CNRI-XXXX-XXXX-XXXX-XXXX');
      }

      // Try online activation first
      final onlineResult = await _activateOnline(licenseKey, email, name);
      if (onlineResult != null) {
        if (onlineResult.isValid) {
          await _storeLicense(onlineResult, licenseKey, email, name);
        }
        return onlineResult;
      }

      // Offline activation - validate key locally
      final localResult = _validateKeyOffline(licenseKey, email, name);
      if (localResult.isValid) {
        await _storeLicense(localResult, licenseKey, email, name);
      }
      return localResult;

    } catch (e) {
      debugPrint('Activation error: $e');
      return _createLicenseInfo(LicenseStatus.invalid,
          'Unable to activate license. Please check your internet connection and try again.');
    }
  }

  /// Deactivate current license — notifies server to free the machine slot.
  Future<void> deactivateLicense() async {
    // Notify server before clearing local state so we still have the key
    final storedRaw = await _storage.read(key: _keyLicenseData);
    if (storedRaw != null) {
      final data = _parseLicenseData(storedRaw);
      await _deactivateOnline(data?['key'] as String?);
    }
    await _storage.delete(key: _keyLicenseData);
    await _storage.delete(key: _keyLastValidation);
    await _storage.delete(key: _keyTrialStart);
    _cachedLicense = null;
  }

  /// Get the unique machine identifier
  Future<String> getMachineId() async {
    if (_machineId != null) return _machineId!;

    final components = <String>[];

    try {
      if (Platform.isWindows) {
        final machineGuid = await _runCommand('reg', [
          'query', 'HKLM\\SOFTWARE\\Microsoft\\Cryptography', '/v', 'MachineGuid'
        ]);
        if (machineGuid.isNotEmpty) {
          final match = RegExp(r'MachineGuid\s+REG_SZ\s+(.+)').firstMatch(machineGuid);
          if (match != null) components.add(match.group(1)!.trim());
        }

        final cpuInfo = await _runCommand('wmic', ['cpu', 'get', 'processorid']);
        final cpuLines = cpuInfo.split('\n').where((l) => l.trim().isNotEmpty && !l.contains('ProcessorId')).toList();
        if (cpuLines.isNotEmpty) components.add(cpuLines.first.trim());

        final mbInfo = await _runCommand('wmic', ['baseboard', 'get', 'serialnumber']);
        final mbLines = mbInfo.split('\n').where((l) => l.trim().isNotEmpty && !l.contains('SerialNumber')).toList();
        if (mbLines.isNotEmpty && mbLines.first.trim() != 'To be filled by O.E.M.') {
          components.add(mbLines.first.trim());
        }

      } else if (Platform.isMacOS) {
        final hwUuid = await _runCommand('system_profiler', ['SPHardwareDataType']);
        final uuidMatch = RegExp(r'Hardware UUID:\s*(.+)').firstMatch(hwUuid);
        if (uuidMatch != null) components.add(uuidMatch.group(1)!.trim());

        final serialMatch = RegExp(r'Serial Number.*?:\s*(.+)').firstMatch(hwUuid);
        if (serialMatch != null) components.add(serialMatch.group(1)!.trim());

      } else if (Platform.isLinux) {
        final machineId = await _runCommand('cat', ['/etc/machine-id']);
        if (machineId.isNotEmpty) components.add(machineId.trim());

        final cpuInfo = await _runCommand('cat', ['/proc/cpuinfo']);
        final serialMatch = RegExp(r'Serial\s*:\s*(.+)').firstMatch(cpuInfo);
        if (serialMatch != null) components.add(serialMatch.group(1)!.trim());
      }
    } catch (e) {
      debugPrint('Machine ID collection error: $e');
    }

    if (components.isEmpty) {
      components.add(Platform.localHostname);
      components.add(Platform.operatingSystem);
    }

    final combined = components.join('|');
    final hash = sha256.convert(utf8.encode(combined + _secretKey)).toString();
    _machineId = hash.substring(0, 32).toUpperCase();

    return _machineId!;
  }

  /// Import and activate a signed .lic license file (Phase 2 / Ed25519).
  Future<LicenseInfo> importLicenseFile(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return _createLicenseInfo(LicenseStatus.invalid, 'License file not found.');
      }

      // Reject suspiciously large files before reading them into memory.
      final fileSize = await file.length();
      if (fileSize > _maxLicFileBytes) {
        return _createLicenseInfo(LicenseStatus.invalid,
            'This file is not a valid license file.');
      }

      final content = await file.readAsString();
      final payload = await _verifyLicFile(content);
      if (payload == null) {
        return _createLicenseInfo(LicenseStatus.invalid,
            'This license file is invalid or has been tampered with. '
            'Please request a new one from support.');
      }

      // Check machine binding if present
      final boundMachine = payload['machineId'] as String?;
      if (boundMachine != null &&
          boundMachine.isNotEmpty &&
          boundMachine != _machineId) {
        return _createLicenseInfo(LicenseStatus.machineMismatch,
            'This license file is bound to a different computer. '
            'Contact support to transfer your license.');
      }

      // Check expiry
      final expiresAtStr = payload['expiresAt'] as String?;
      DateTime? expDate;
      if (expiresAtStr != null) {
        expDate = DateTime.parse(expiresAtStr);
        if (DateTime.now().isAfter(expDate)) {
          return _createLicenseInfo(LicenseStatus.expired,
              'This license file has expired. Please contact support for renewal.');
        }
      }

      final type = _getLicenseType(payload['type'] as String?);
      final name = payload['registeredTo'] as String? ?? 'Licensed User';
      final email = payload['email'] as String? ?? '';
      final licKey = payload['licenseKey'] as String? ?? '';

      final info = LicenseInfo(
        status: LicenseStatus.valid,
        type: type,
        licenseKey: licKey,
        registeredTo: name,
        email: email,
        activationDate: DateTime.now(),
        expirationDate: expDate,
        daysRemaining: expDate?.difference(DateTime.now()).inDays,
        machineId: _machineId,
        message: 'License file activated successfully! Welcome, $name.',
      );

      await _writeLicenseData({
        'key': licKey,
        'type': type.name,
        'email': email,
        'registeredTo': name,
        'machineId': boundMachine ?? _machineId,
        'activationDate': DateTime.now().toIso8601String(),
        'expirationDate': expDate?.toIso8601String(),
        'source': 'licfile',
      });
      await _storage.delete(key: _keyTrialStart);
      await _updateValidationTime();
      _cachedLicense = info;

      return info;
    } catch (e) {
      debugPrint('[LicenseManager] importLicenseFile error: $e');
      return _createLicenseInfo(LicenseStatus.invalid,
          'Failed to read license file. Please ensure the file is not corrupted.');
    }
  }

  /// Verify the Ed25519 signature of a .lic file and return the parsed payload,
  /// or null if the signature is invalid or the file is malformed.
  Future<Map<String, dynamic>?> _verifyLicFile(String content) async {
    try {
      final bundle = jsonDecode(content) as Map<String, dynamic>;
      if ((bundle['version'] as int?) != 2) return null;

      final payloadB64 = bundle['payload'] as String?;
      final sigB64 = bundle['signature'] as String?;
      if (payloadB64 == null || sigB64 == null) return null;

      final payloadBytes = base64.decode(base64.normalize(payloadB64));
      final sigBytes = base64.decode(base64.normalize(sigB64));

      final pubKeyBytes = base64.decode(_ed25519PublicKeyB64);
      final publicKey = cry.SimplePublicKey(pubKeyBytes, type: cry.KeyPairType.ed25519);
      final signature = cry.Signature(sigBytes, publicKey: publicKey);

      final valid = await _ed25519.verify(payloadBytes, signature: signature);
      if (!valid) {
        debugPrint('[LicenseManager] .lic Ed25519 signature invalid.');
        return null;
      }

      return jsonDecode(utf8.decode(payloadBytes)) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('[LicenseManager] .lic verification error: $e');
      return null;
    }
  }

  /// Get cached license info (non-async for UI)
  LicenseInfo? get cachedLicense => _cachedLicense;

  // =========================================================================
  // TRIAL MANAGEMENT
  // =========================================================================

  Future<LicenseInfo> _checkOrStartTrial() async {
    final trialStart = await _storage.read(key: _keyTrialStart);

    if (trialStart == null) {
      // Start new trial
      final now = DateTime.now();
      await _storage.write(key: _keyTrialStart, value: now.toIso8601String());

      final expiration = now.add(const Duration(days: _trialDays));
      final licenseData = {
        'type': 'trial',
        'machineId': _machineId,
        'activationDate': now.toIso8601String(),
        'expirationDate': expiration.toIso8601String(),
        'registeredTo': 'Trial User',
      };

      await _writeLicenseData(licenseData);

      _cachedLicense = LicenseInfo(
        status: LicenseStatus.trialActive,
        type: LicenseType.trial,
        activationDate: now,
        expirationDate: expiration,
        daysRemaining: _trialDays,
        machineId: _machineId,
        registeredTo: 'Trial User',
        message: 'Welcome! Your $_trialDays-day free trial has started.',
      );
      return _cachedLicense!;
    }

    // Check existing trial
    final startDate = DateTime.parse(trialStart);
    final expiration = startDate.add(const Duration(days: _trialDays));
    final remaining = expiration.difference(DateTime.now()).inDays;

    if (remaining <= 0) {
      _cachedLicense = LicenseInfo(
        status: LicenseStatus.trialExpired,
        type: LicenseType.trial,
        activationDate: startDate,
        expirationDate: expiration,
        daysRemaining: 0,
        machineId: _machineId,
        registeredTo: 'Trial User',
        message: 'Your free trial has ended. Enter a license key to continue.',
      );
      return _cachedLicense!;
    }

    _cachedLicense = LicenseInfo(
      status: LicenseStatus.trialActive,
      type: LicenseType.trial,
      activationDate: startDate,
      expirationDate: expiration,
      daysRemaining: remaining,
      machineId: _machineId,
      registeredTo: 'Trial User',
      message: 'Trial active: $remaining days remaining.',
    );
    return _cachedLicense!;
  }

  // =========================================================================
  // KEY VALIDATION
  // =========================================================================

  bool _validateKeyFormat(String key) {
    final cleaned = key.replaceAll('-', '');
    if (cleaned.length != 20) return false;
    if (!cleaned.startsWith('CNRI')) return false;
    return RegExp(r'^[A-Z0-9]+$').hasMatch(cleaned);
  }

  LicenseInfo _validateKeyOffline(String licenseKey, String email, String name) {
    try {
      final decoded = _decodeKey(licenseKey);
      if (decoded == null) {
        return _createLicenseInfo(LicenseStatus.invalid,
            'This license key was not recognized. Please double-check and try again.');
      }

      if (decoded['machineId'] != null && decoded['machineId'] != _machineId) {
        return _createLicenseInfo(LicenseStatus.machineMismatch,
            'This key is already registered to a different computer.');
      }

      if (decoded['expiration'] != null) {
        final expDate = DateTime.parse(decoded['expiration']);
        if (DateTime.now().isAfter(expDate)) {
          return _createLicenseInfo(LicenseStatus.expired,
              'This license has expired. Please contact support for renewal.');
        }
      }

      final type = _getLicenseType(decoded['type'] as String?);
      final expDate = decoded['expiration'] != null
          ? DateTime.parse(decoded['expiration']) : null;

      _cachedLicense = LicenseInfo(
        status: LicenseStatus.valid,
        type: type,
        licenseKey: licenseKey,
        registeredTo: name,
        email: email,
        activationDate: DateTime.now(),
        expirationDate: expDate,
        daysRemaining: expDate?.difference(DateTime.now()).inDays,
        machineId: _machineId,
        message: 'License activated successfully! Thank you for your purchase.',
      );
      return _cachedLicense!;

    } catch (e) {
      return _createLicenseInfo(LicenseStatus.invalid,
          'Unable to verify this license key. Please contact support.');
    }
  }

  Map<String, dynamic>? _decodeKey(String key) {
    try {
      final cleaned = key.replaceAll('-', '').substring(4);

      final typeCode = cleaned[0];
      final checksum = cleaned.substring(1, 9);   // 8-char HMAC-SHA256 prefix
      final encodedData = cleaned.substring(9);   // 7-char random data

      final expectedChecksum = _generateChecksum(typeCode + encodedData);
      if (checksum != expectedChecksum) return null;

      String type;
      DateTime? expiration;
      switch (typeCode) {
        case 'S': type = 'standard';
        expiration = DateTime.now().add(const Duration(days: 365)); break;
        case 'P': type = 'professional'; break;
        case 'E': type = 'enterprise'; break;
        default: return null;
      }

      return {
        'type': type,
        'expiration': expiration?.toIso8601String(),
        'valid': true,
      };
    } catch (e) {
      return null;
    }
  }

  String _generateChecksum(String data) {
    final hmac = Hmac(sha256, utf8.encode(_secretKey));
    final digest = hmac.convert(utf8.encode(data));
    return digest.toString().substring(0, 8).toUpperCase();
  }

  LicenseType _getLicenseType(String? typeStr) {
    switch (typeStr) {
      case 'standard': return LicenseType.standard;
      case 'professional': return LicenseType.professional;
      case 'enterprise': return LicenseType.enterprise;
      default: return LicenseType.standard;
    }
  }

  // =========================================================================
  // ONLINE ACTIVATION (Phase 3 — server-side validation)
  // Set _activationServer to your server URL to enable.
  // All requests are HMAC-signed so only genuine app instances can call
  // the server. The server tracks activations and handles revocation.
  // =========================================================================

  /// Build headers with HMAC-SHA256 request signature.
  /// Server verifies X-App-Sig == HMAC(apiSecret, requestBody).
  Map<String, String> _signedHeaders(String body) {
    final sig = Hmac(sha256, utf8.encode(_apiSecret))
        .convert(utf8.encode(body))
        .toString();
    return {
      'Content-Type': 'application/json',
      'X-App-Sig': sig,
      'X-App-Version': _appVersion,
    };
  }

  Future<LicenseInfo?> _activateOnline(String key, String email, String name) async {
    if (_activationServer == 'offline') return null;

    try {
      final body = jsonEncode({
        'key': key,
        'email': email,
        'name': name,
        'machineId': _machineId,
        'appVersion': _appVersion,
        'platform': Platform.operatingSystem,
      });
      final response = await http.post(
        Uri.parse('$_activationServer/activate'),
        headers: _signedHeaders(body),
        body: body,
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          await _updateValidationTime();
          return LicenseInfo(
            status: LicenseStatus.valid,
            type: _getLicenseType(data['type']),
            licenseKey: key,
            registeredTo: name,
            email: email,
            activationDate: DateTime.now(),
            expirationDate: data['expiration'] != null
                ? DateTime.parse(data['expiration']) : null,
            machineId: _machineId,
            message: data['message'] ?? 'License activated successfully!',
          );
        } else {
          return _createLicenseInfo(LicenseStatus.invalid,
              data['message'] ?? 'Unable to activate this license key.');
        }
      }
      return null;
    } catch (e) {
      debugPrint('[LicenseManager] Online activation failed (offline fallback): $e');
      return null; // Fall through to offline validation
    }
  }

  Future<LicenseInfo?> _validateOnline(String? key) async {
    if (key == null || _activationServer == 'offline') return null;
    try {
      final body = jsonEncode({'key': key, 'machineId': _machineId});
      final response = await http.post(
        Uri.parse('$_activationServer/validate'),
        headers: _signedHeaders(body),
        body: body,
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['valid'] == true) {
          // License confirmed valid — reset the grace period timer.
          await _updateValidationTime();
          return null; // Continue with locally-stored data
        } else {
          // Server says this license is revoked or invalid.
          // Delete the local cache so the next startup also rejects it —
          // do NOT update the validation time, so the check is not skipped.
          await _storage.delete(key: _keyLicenseData);
          await _storage.delete(key: _keyLastValidation);
          _cachedLicense = null;
          return _createLicenseInfo(LicenseStatus.invalid,
              data['message'] ?? 'License is no longer valid.');
        }
      }
      return null;
    } catch (e) {
      debugPrint('[LicenseManager] Online validation failed (using cached): $e');
      return null; // Honour offline grace period
    }
  }

  /// Notify server to free the machine slot when deactivating locally.
  Future<void> _deactivateOnline(String? key) async {
    if (key == null || _activationServer == 'offline') return;
    try {
      final body = jsonEncode({'key': key, 'machineId': _machineId});
      await http.post(
        Uri.parse('$_activationServer/deactivate'),
        headers: _signedHeaders(body),
        body: body,
      ).timeout(const Duration(seconds: 10));
    } catch (e) {
      debugPrint('[LicenseManager] Online deactivation failed: $e');
    }
  }

  Future<void> _updateValidationTime() async {
    await _storage.write(
      key: _keyLastValidation,
      value: DateTime.now().toIso8601String(),
    );
  }

  // =========================================================================
  // LICENSE STORAGE
  // Stored as HMAC-verified JSON bundle inside OS-native encrypted storage
  // (Windows DPAPI, macOS Keychain, Linux libsecret).
  // Format: {"data": "<json payload>", "mac": "<hex HMAC-SHA256>"}
  // Any direct edit of the stored blob will fail the MAC check.
  // =========================================================================

  /// Write license data with HMAC-SHA256 integrity protection.
  Future<void> _writeLicenseData(Map<String, dynamic> data) async {
    final payload = jsonEncode(data);
    final mac = Hmac(sha256, utf8.encode(_secretKey))
        .convert(utf8.encode(payload))
        .toString();
    final bundle = jsonEncode({'data': payload, 'mac': mac});
    await _storage.write(key: _keyLicenseData, value: bundle);
  }

  Future<void> _storeLicense(LicenseInfo info, String key, String email, String name) async {
    final licenseData = {
      'key': key,
      'type': info.type?.name ?? 'standard',
      'email': email,
      'registeredTo': name,
      'machineId': _machineId,
      'activationDate': DateTime.now().toIso8601String(),
      'expirationDate': info.expirationDate?.toIso8601String(),
    };

    await _writeLicenseData(licenseData);
    await _storage.delete(key: _keyTrialStart);
    await _updateValidationTime();
    _cachedLicense = info;
  }

  /// Parse license data, verifying HMAC integrity before accepting.
  /// Returns null if data is missing, malformed, or tampered with.
  Map<String, dynamic>? _parseLicenseData(String stored) {
    try {
      final bundle = jsonDecode(stored) as Map<String, dynamic>;
      final payload = bundle['data'] as String?;
      final storedMac = bundle['mac'] as String?;
      if (payload == null || storedMac == null) return null;

      final expectedMac = Hmac(sha256, utf8.encode(_secretKey))
          .convert(utf8.encode(payload))
          .toString();

      // Constant-time comparison to prevent timing attacks
      if (expectedMac.length != storedMac.length) return null;
      int diff = 0;
      for (int i = 0; i < expectedMac.length; i++) {
        diff |= expectedMac.codeUnitAt(i) ^ storedMac.codeUnitAt(i);
      }
      if (diff != 0) {
        debugPrint('[LicenseManager] HMAC mismatch — stored license data may be tampered.');
        return null;
      }

      return jsonDecode(payload) as Map<String, dynamic>;
    } catch (e) {
      debugPrint('[LicenseManager] Failed to parse license bundle: $e');
      return null;
    }
  }

  // =========================================================================
  // HELPERS
  // =========================================================================

  LicenseInfo _createLicenseInfo(LicenseStatus status, String message) {
    return LicenseInfo(
      status: status,
      machineId: _machineId,
      message: message,
    );
  }

  LicenseInfo _buildLicenseInfo(Map<String, dynamic> data) {
    final type = _getLicenseType(data['type'] as String?);
    final expDate = data['expirationDate'] != null
        ? DateTime.parse(data['expirationDate']) : null;

    return LicenseInfo(
      status: type == LicenseType.trial ? LicenseStatus.trialActive : LicenseStatus.valid,
      type: type,
      licenseKey: data['key'],
      registeredTo: data['registeredTo'],
      email: data['email'],
      activationDate: data['activationDate'] != null
          ? DateTime.parse(data['activationDate']) : null,
      expirationDate: expDate,
      daysRemaining: expDate?.difference(DateTime.now()).inDays,
      machineId: data['machineId'],
      message: type == LicenseType.trial
          ? 'Free trial active'
          : 'License active - ${type.name}',
    );
  }

  Future<String> _runCommand(String command, List<String> args) async {
    try {
      final result = await Process.run(command, args);
      return result.stdout.toString();
    } catch (e) {
      return '';
    }
  }

  // =========================================================================
  // LICENSE KEY GENERATION
  // For development/testing only. Throws in release builds so it cannot be
  // invoked at runtime even if the binary is reverse-engineered.
  // Production key issuance should use tool/generate_license.dart (Ed25519).
  //
  // NOTE: _secretKey is shared between key-checksum, storage-MAC, and
  // machine-ID hashing. Migrating to per-purpose derived keys would be a
  // breaking change (invalidates all existing activations). Preferred path:
  // stop issuing new HMAC keys and move all customers to Phase 2 .lic files.
  // =========================================================================

  static String generateLicenseKey(LicenseType type) {
    if (kReleaseMode) {
      throw UnsupportedError(
          'generateLicenseKey is disabled in release builds. '
          'Use tool/generate_license.dart to issue licenses.');
    }
    final random = Random.secure();
    final typeCode = switch (type) {
      LicenseType.standard => 'S',
      LicenseType.professional => 'P',
      LicenseType.enterprise => 'E',
      LicenseType.trial => 'T',
    };

    // 7 random chars: 36^7 ≈ 78 billion combinations
    // (reduced from 12 to fit 8-char HMAC-SHA256 checksum in 20-char key)
    final randomData = List.generate(7, (_) =>
    'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'[random.nextInt(36)]).join();

    final hmac = Hmac(sha256, utf8.encode(_secretKey));
    final digest = hmac.convert(utf8.encode(typeCode + randomData));
    final checksum = digest.toString().substring(0, 8).toUpperCase();

    final raw = 'CNRI$typeCode$checksum$randomData';
    return '${raw.substring(0, 4)}-${raw.substring(4, 8)}-${raw.substring(8, 12)}-${raw.substring(12, 16)}-${raw.substring(16, 20)}';
  }
}
