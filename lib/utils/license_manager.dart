// lib/utils/license_manager.dart
// CNRI Eye Capture - Desktop License Management System v1.3
// v1.2: Migrated from SharedPreferences + XOR to flutter_secure_storage
//       License data is now encrypted at rest using OS-native storage:
//       Windows DPAPI / macOS Keychain / Linux libsecret
// v1.3: Added HMAC-SHA256 integrity check to stored license blob.
//       Any direct edit of secure storage will be detected and rejected.
// ============================================================================

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
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
  static const String _activationServer = 'offline'; // Set to URL if using server
  static const int _trialDays = 14;
  static const int _offlineGraceDays = 7;

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

  /// Deactivate current license
  Future<void> deactivateLicense() async {
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
  // ONLINE ACTIVATION (for future use)
  // =========================================================================

  Future<LicenseInfo?> _activateOnline(String key, String email, String name) async {
    if (_activationServer == 'offline') return null;

    try {
      final response = await http.post(
        Uri.parse('$_activationServer/activate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'key': key,
          'email': email,
          'name': name,
          'machineId': _machineId,
          'appVersion': _appVersion,
          'platform': Platform.operatingSystem,
        }),
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
      debugPrint('Online activation failed: $e');
      return null;
    }
  }

  Future<LicenseInfo?> _validateOnline(String? key) async {
    if (key == null || _activationServer == 'offline') return null;
    try {
      final response = await http.post(
        Uri.parse('$_activationServer/validate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'key': key,
          'machineId': _machineId,
        }),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _updateValidationTime();
        if (data['valid'] != true) {
          return _createLicenseInfo(LicenseStatus.invalid,
              data['message'] ?? 'License is no longer valid.');
        }
      }
      return null;
    } catch (e) {
      debugPrint('Online validation failed: $e');
      return null;
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
  // LICENSE KEY GENERATION (For admin use only — run offline, never ship
  // this method in a production build.)
  // =========================================================================

  static String generateLicenseKey(LicenseType type) {
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
