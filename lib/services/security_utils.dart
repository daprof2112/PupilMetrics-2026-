// lib/services/security_utils.dart
// Device integrity, environment checks, and secure utilities

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Environment security check results
class EnvironmentCheckResult {
  final bool isSecure;
  final bool isDebugMode;
  final bool isEmulator;
  final bool isRooted;
  final bool fridaDetected;
  final bool hookingDetected;
  final String deviceFingerprint;
  final List<String> warnings;

  EnvironmentCheckResult({
    required this.isSecure,
    required this.isDebugMode,
    required this.isEmulator,
    required this.isRooted,
    required this.fridaDetected,
    required this.hookingDetected,
    required this.deviceFingerprint,
    required this.warnings,
  });

  Map<String, dynamic> toJson() => {
    'isSecure': isSecure,
    'isDebugMode': isDebugMode,
    'isEmulator': isEmulator,
    'isRooted': isRooted,
    'fridaDetected': fridaDetected,
    'hookingDetected': hookingDetected,
    'deviceFingerprint': deviceFingerprint.substring(0, 16) + '...',
    'warnings': warnings,
  };
}

/// Device integrity and environment security checker
class DeviceIntegrityChecker {
  static final DeviceIntegrityChecker _instance = DeviceIntegrityChecker._();
  factory DeviceIntegrityChecker() => _instance;
  DeviceIntegrityChecker._();

  String? _cachedFingerprint;
  EnvironmentCheckResult? _lastCheckResult;

  /// Run all security checks
  Future<EnvironmentCheckResult> runSecurityChecks() async {
    final warnings = <String>[];

    final isDebug = _checkDebugMode();
    if (isDebug) warnings.add('Debug mode detected');

    final isEmulator = await _checkEmulator();
    if (isEmulator) warnings.add('Emulator detected');

    final isRooted = await _checkRootStatus();
    if (isRooted) warnings.add('Root/Jailbreak detected');

    final fridaDetected = await _checkFrida();
    if (fridaDetected) warnings.add('Frida instrumentation detected');

    final hookingDetected = await _checkHooking();
    if (hookingDetected) warnings.add('Method hooking detected');

    final fingerprint = await getDeviceFingerprint();

    final isSecure = !isDebug && !isEmulator && !isRooted &&
        !fridaDetected && !hookingDetected;

    _lastCheckResult = EnvironmentCheckResult(
      isSecure: isSecure,
      isDebugMode: isDebug,
      isEmulator: isEmulator,
      isRooted: isRooted,
      fridaDetected: fridaDetected,
      hookingDetected: hookingDetected,
      deviceFingerprint: fingerprint,
      warnings: warnings,
    );

    return _lastCheckResult!;
  }

  /// Check if running in debug mode
  bool _checkDebugMode() {
    bool inDebugMode = false;
    assert(() {
      inDebugMode = true;
      return true;
    }());
    return inDebugMode || kDebugMode;
  }

  /// Check if running on emulator
  Future<bool> _checkEmulator() async {
    if (!Platform.isAndroid && !Platform.isIOS) return false;

    if (Platform.isAndroid) {
      // Check common emulator indicators
      final emulatorIndicators = [
        Platform.environment.containsKey('ANDROID_EMULATOR'),
        Platform.environment['ANDROID_SDK_ROOT'] != null,
      ];

      // Check for emulator-specific files
      final emulatorPaths = [
        '/dev/socket/qemud',
        '/dev/qemu_pipe',
        '/system/lib/libc_malloc_debug_qemu.so',
        '/sys/qemu_trace',
        '/system/bin/qemu-props',
      ];

      for (final path in emulatorPaths) {
        try {
          if (await File(path).exists()) return true;
        } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
      }

      // Check build properties via system properties
      try {
        final result = await Process.run('getprop', ['ro.hardware']);
        final hardware = result.stdout.toString().toLowerCase();
        if (hardware.contains('goldfish') ||
            hardware.contains('ranchu') ||
            hardware.contains('vbox')) {
          return true;
        }
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }

      return emulatorIndicators.any((e) => e);
    }

    // iOS simulator check
    if (Platform.isIOS) {
      return Platform.environment['SIMULATOR_DEVICE_NAME'] != null;
    }

    return false;
  }

  /// Check for root (Android) or jailbreak (iOS)
  Future<bool> _checkRootStatus() async {
    if (Platform.isAndroid) {
      final rootPaths = [
        '/system/app/Superuser.apk',
        '/sbin/su',
        '/system/bin/su',
        '/system/xbin/su',
        '/data/local/xbin/su',
        '/data/local/bin/su',
        '/system/sd/xbin/su',
        '/system/bin/failsafe/su',
        '/data/local/su',
        '/su/bin/su',
        '/magisk/.core/bin/su',
      ];

      for (final path in rootPaths) {
        try {
          if (await File(path).exists()) return true;
        } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
      }

      // Try to execute su
      try {
        final result = await Process.run('su', ['-c', 'id']);
        if (result.exitCode == 0) return true;
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }

      // Check for Magisk
      try {
        if (await Directory('/data/adb/magisk').exists()) return true;
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    if (Platform.isIOS) {
      final jailbreakPaths = [
        '/Applications/Cydia.app',
        '/Library/MobileSubstrate/MobileSubstrate.dylib',
        '/bin/bash',
        '/usr/sbin/sshd',
        '/etc/apt',
        '/private/var/lib/apt/',
        '/usr/bin/ssh',
        '/private/var/stash',
        '/private/var/lib/cydia',
        '/private/var/tmp/cydia.log',
      ];

      for (final path in jailbreakPaths) {
        try {
          if (await File(path).exists() || await Directory(path).exists()) {
            return true;
          }
        } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
      }

      // Check if we can write outside sandbox
      try {
        final file = File('/private/jailbreak_test');
        await file.writeAsString('test');
        await file.delete();
        return true; // If we can write here, device is jailbroken
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    return false;
  }

  /// Check for Frida instrumentation framework
  Future<bool> _checkFrida() async {
    // Check common Frida ports
    final fridaPorts = [27042, 27043, 27044, 27045];

    for (final port in fridaPorts) {
      try {
        final socket = await Socket.connect(
          '127.0.0.1',
          port,
          timeout: const Duration(milliseconds: 100),
        );
        await socket.close();
        return true; // Frida server detected
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    // Check for Frida-related files (Android)
    if (Platform.isAndroid) {
      final fridaPaths = [
        '/data/local/tmp/frida-server',
        '/data/local/tmp/re.frida.server',
      ];

      for (final path in fridaPaths) {
        try {
          if (await File(path).exists()) return true;
        } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
      }
    }

    // Check loaded libraries for Frida
    if (Platform.isAndroid) {
      try {
        final maps = await File('/proc/self/maps').readAsString();
        if (maps.contains('frida') || maps.contains('gadget')) {
          return true;
        }
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    return false;
  }

  /// Check for method hooking (Xposed, Substrate, etc.)
  Future<bool> _checkHooking() async {
    if (Platform.isAndroid) {
      // Check for Xposed
      final xposedPaths = [
        '/system/framework/XposedBridge.jar',
        '/system/lib/libxposed_art.so',
        '/data/data/de.robv.android.xposed.installer',
        '/data/user/0/de.robv.android.xposed.installer',
      ];

      for (final path in xposedPaths) {
        try {
          if (await File(path).exists() || await Directory(path).exists()) {
            return true;
          }
        } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
      }

      // Check stack trace for hook indicators
      try {
        final stackTrace = StackTrace.current.toString();
        if (stackTrace.contains('de.robv.android.xposed') ||
            stackTrace.contains('com.saurik.substrate')) {
          return true;
        }
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    if (Platform.isIOS) {
      // Check for Substrate
      try {
        if (await File('/Library/MobileSubstrate/MobileSubstrate.dylib').exists()) {
          return true;
        }
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    return false;
  }

  /// Generate device fingerprint for binding
  Future<String> getDeviceFingerprint() async {
    if (_cachedFingerprint != null) return _cachedFingerprint!;

    final components = <String>[];

    // Platform info
    components.add(Platform.operatingSystem);
    components.add(Platform.operatingSystemVersion);
    components.add(Platform.localHostname);

    // Locale and timezone
    components.add(Platform.localeName);
    components.add(DateTime.now().timeZoneName);

    if (Platform.isAndroid) {
      // Android-specific identifiers
      try {
        var result = await Process.run('getprop', ['ro.product.model']);
        components.add(result.stdout.toString().trim());

        result = await Process.run('getprop', ['ro.product.brand']);
        components.add(result.stdout.toString().trim());

        result = await Process.run('getprop', ['ro.build.fingerprint']);
        components.add(result.stdout.toString().trim());
      } catch (_) { /* intentionally swallowed — security probe, failure is expected */ }
    }

    // Hash all components
    final combined = components.join('|');
    _cachedFingerprint = sha256.convert(utf8.encode(combined)).toString();

    return _cachedFingerprint!;
  }

  /// Get last check result without re-running
  EnvironmentCheckResult? get lastCheckResult => _lastCheckResult;
}

/// Secure string storage with XOR obfuscation
class SecureStringVault {
  static final _random = Random.secure();
  static int? _runtimeKey;

  /// Get runtime key (generated once per app session)
  static int get _key {
    _runtimeKey ??= _random.nextInt(0xFFFFFFFF);
    return _runtimeKey!;
  }

  /// Encode a string for storage (use at build time or initialization)
  static List<int> encode(String value) {
    final bytes = utf8.encode(value);
    return bytes.map((b) => b ^ (_key & 0xFF)).toList();
  }

  /// Decode an encoded string at runtime
  static String decode(List<int> encoded) {
    final decoded = encoded.map((b) => b ^ (_key & 0xFF)).toList();
    return utf8.decode(decoded);
  }

  /// Store with timestamp-based key derivation
  static Map<String, dynamic> encodeWithTimestamp(String value) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final derivedKey = (timestamp ~/ 1000) ^ _key;
    final bytes = utf8.encode(value);
    final encoded = bytes.map((b) => b ^ (derivedKey & 0xFF)).toList();

    return {
      'data': encoded,
      'ts': timestamp,
    };
  }

  static String decodeWithTimestamp(Map<String, dynamic> encoded) {
    final timestamp = encoded['ts'] as int;
    final data = (encoded['data'] as List).cast<int>();
    final derivedKey = (timestamp ~/ 1000) ^ _key;
    final decoded = data.map((b) => b ^ (derivedKey & 0xFF)).toList();

    return utf8.decode(decoded);
  }
}

/// Secure memory buffer that zeros on dispose
class SecureBuffer {
  Uint8List? _data;

  SecureBuffer([int size = 0]) {
    if (size > 0) {
      _data = Uint8List(size);
    }
  }

  void write(Uint8List data) {
    wipe();
    _data = Uint8List.fromList(data);
  }

  void writeString(String str) {
    write(Uint8List.fromList(utf8.encode(str)));
  }

  Uint8List? read() => _data != null ? Uint8List.fromList(_data!) : null;

  String? readString() {
    final data = read();
    return data != null ? utf8.decode(data) : null;
  }

  void wipe() {
    if (_data != null) {
      final random = Random.secure();
      // Overwrite with random data multiple times
      for (var pass = 0; pass < 3; pass++) {
        for (var i = 0; i < _data!.length; i++) {
          _data![i] = random.nextInt(256);
        }
      }
      _data = null;
    }
  }

  void dispose() => wipe();
}

/// HMAC-based command signing for method channels
class SecureChannelSigner {
  final Uint8List _key;
  int _sequence = 0;

  SecureChannelSigner(this._key);

  /// Sign a method channel call
  Map<String, dynamic> signCall(String method, dynamic arguments) {
    _sequence++;
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final payload = jsonEncode({
      'method': method,
      'args': arguments,
      'seq': _sequence,
      'ts': timestamp,
    });

    final hmac = Hmac(sha256, _key);
    final signature = hmac.convert(utf8.encode(payload)).toString();

    return {
      'payload': arguments,
      'sig': signature.substring(0, 32),
      'seq': _sequence,
      'ts': timestamp,
    };
  }

  /// Verify a response signature
  bool verifyResponse(Map<String, dynamic> response, String expectedSigPrefix) {
    final sig = response['sig'] as String?;
    if (sig == null) return false;
    return sig.startsWith(expectedSigPrefix);
  }
}

/// Rate limiter for sensitive operations
class OperationRateLimiter {
  final int maxOperations;
  final Duration window;
  final List<DateTime> _timestamps = [];

  OperationRateLimiter({
    required this.maxOperations,
    required this.window,
  });

  bool checkAndRecord() {
    final now = DateTime.now();
    _timestamps.removeWhere((t) => now.difference(t) > window);

    if (_timestamps.length >= maxOperations) {
      return false;
    }

    _timestamps.add(now);
    return true;
  }

  int get remainingOperations => maxOperations - _timestamps.length;

  Duration? get timeUntilReset {
    if (_timestamps.isEmpty) return null;
    final oldest = _timestamps.first;
    final resetTime = oldest.add(window);
    final remaining = resetTime.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  void reset() => _timestamps.clear();
}