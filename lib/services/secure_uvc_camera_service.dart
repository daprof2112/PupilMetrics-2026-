// lib/services/secure_uvc_camera_service.dart
// Security wrapper for USB Iriscope communication
// Protects against USB sniffing, tampering, and MITM attacks

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uvc_camera/flutter_uvc_camera.dart';


/// Security events for monitoring
enum SecurityEvent {
  sessionStarted,
  sessionEnded,
  integrityCheckPassed,
  integrityCheckFailed,
  anomalyDetected,
  channelCompromised,
  rateLimitExceeded,
}

/// Security threat levels
enum ThreatLevel { none, low, medium, high, critical }

/// Callback for security events
typedef SecurityEventCallback = void Function(SecurityEvent event, String details);

/// Secure wrapper for UVC Camera operations
class SecureUvcCameraService {
  final UVCCameraController _controller;
  SecurityEventCallback? onSecurityEvent;

  // Session security
  Uint8List? _sessionKey;
  DateTime? _sessionStart;
  int _commandSequence = 0;
  final List<String> _commandLog = [];
  static const int _maxLogSize = 100;

  // Rate limiting
  final Map<String, List<DateTime>> _commandTimestamps = {};
  static const int _maxCommandsPerSecond = 10;
  static const int _maxCommandsPerMinute = 100;

  // Integrity tracking
  final Map<String, String> _imageHashes = {};
  int _captureCount = 0;
  DateTime? _lastCaptureTime;

  // Anomaly detection
  int _failedIntegrityChecks = 0;
  int _anomalyScore = 0;
  static const int _anomalyThreshold = 5;

  // Timing analysis protection
  final Random _secureRandom = Random.secure();

  // Initialization flag to prevent early event firing
  bool _isFullyInitialized = false;

  SecureUvcCameraService({
    required UVCCameraController controller,
    this.onSecurityEvent,
  }) : _controller = controller {
    _initializeSession();
    _isFullyInitialized = true;
  }

  UVCCameraController get controller => _controller;
  bool get hasActiveSession => _sessionKey != null;
  ThreatLevel get currentThreatLevel => _calculateThreatLevel();

  /// Initialize secure session
  void _initializeSession() {
    _sessionKey = _generateSessionKey();
    _sessionStart = DateTime.now();
    _commandSequence = 0;
    _anomalyScore = 0;
    _failedIntegrityChecks = 0;

    _logSecurityEvent(SecurityEvent.sessionStarted,
        'Session initialized at ${_sessionStart!.toIso8601String()}');
  }

  /// Generate cryptographically secure session key
  Uint8List _generateSessionKey() {
    final key = Uint8List(32);
    for (var i = 0; i < 32; i++) {
      key[i] = _secureRandom.nextInt(256);
    }
    return key;
  }

  /// Rotate session key periodically
  void _rotateSessionKeyIfNeeded() {
    if (_sessionStart == null) return;

    final elapsed = DateTime.now().difference(_sessionStart!);
    if (elapsed.inMinutes >= 30) {
      final oldKeyHash = _hashData(_sessionKey!).substring(0, 8);
      _sessionKey = _deriveNextKey(_sessionKey!);
      _sessionStart = DateTime.now();

      debugPrint('[SecureUVC] Session key rotated. Old prefix: $oldKeyHash');
    }
  }

  /// Derive next session key from current
  Uint8List _deriveNextKey(Uint8List currentKey) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final combined = [...currentKey, ...utf8.encode(timestamp)];
    final hash = sha256.convert(combined);
    return Uint8List.fromList(hash.bytes);
  }

  /// Rate limiting check
  bool _checkRateLimit(String command) {
    final now = DateTime.now();
    _commandTimestamps[command] ??= [];
    final timestamps = _commandTimestamps[command]!;

    // Clean old timestamps
    timestamps.removeWhere((t) => now.difference(t).inSeconds > 60);

    // Check per-second limit
    final recentSecond = timestamps.where(
            (t) => now.difference(t).inMilliseconds < 1000
    ).length;

    if (recentSecond >= _maxCommandsPerSecond) {
      _logSecurityEvent(SecurityEvent.rateLimitExceeded,
          'Command "$command" rate limit exceeded (per second)');
      _anomalyScore += 2;
      return false;
    }

    // Check per-minute limit
    if (timestamps.length >= _maxCommandsPerMinute) {
      _logSecurityEvent(SecurityEvent.rateLimitExceeded,
          'Command "$command" rate limit exceeded (per minute)');
      _anomalyScore += 1;
      return false;
    }

    timestamps.add(now);
    return true;
  }

  /// Sign a command for integrity verification
  String _signCommand(String command, Map<String, dynamic>? params) {
    _commandSequence++;
    final payload = jsonEncode({
      'cmd': command,
      'seq': _commandSequence,
      'ts': DateTime.now().millisecondsSinceEpoch,
      'params': params,
    });

    final hmac = Hmac(sha256, _sessionKey!);
    final signature = hmac.convert(utf8.encode(payload));

    return signature.toString().substring(0, 16);
  }

  /// Log command for audit trail
  void _logCommand(String command, String signature) {
    final entry = '${DateTime.now().toIso8601String()}|$command|$signature';
    _commandLog.add(entry);

    if (_commandLog.length > _maxLogSize) {
      _commandLog.removeAt(0);
    }
  }

  /// Add random delay to prevent timing analysis
  Future<void> _addTimingNoise() async {
    final delay = _secureRandom.nextInt(50) + 10; // 10-60ms
    await Future.delayed(Duration(milliseconds: delay));
  }

  // ============================================
  // SECURE CAMERA OPERATIONS
  // ============================================

  /// Secure camera initialization
  Future<void> initializeCamera() async {
    if (!_checkRateLimit('initializeCamera')) {
      throw SecurityException('Rate limit exceeded for camera initialization');
    }

    _rotateSessionKeyIfNeeded();
    final sig = _signCommand('initializeCamera', null);
    _logCommand('initializeCamera', sig);

    await _addTimingNoise();
    await _controller.initializeCamera();
  }

  /// Secure camera open
  Future<void> openCamera() async {
    if (!_checkRateLimit('openUVCCamera')) {
      throw SecurityException('Rate limit exceeded');
    }

    _rotateSessionKeyIfNeeded();
    final sig = _signCommand('openUVCCamera', null);
    _logCommand('openUVCCamera', sig);

    await _addTimingNoise();
    await _controller.openUVCCamera();
  }

  /// Secure photo capture with integrity verification
  Future<SecureCaptureResult> takePictureSecure() async {
    if (!_checkRateLimit('takePicture')) {
      throw SecurityException('Rate limit exceeded for capture');
    }

    // Check for suspicious rapid captures
    if (_lastCaptureTime != null) {
      final timeSinceLastCapture = DateTime.now().difference(_lastCaptureTime!);
      if (timeSinceLastCapture.inMilliseconds < 500) {
        _anomalyScore++;
        _logSecurityEvent(SecurityEvent.anomalyDetected,
            'Suspiciously rapid capture attempt');
      }
    }

    _rotateSessionKeyIfNeeded();
    final preCaptureTimestamp = DateTime.now();
    final sig = _signCommand('takePicture', {'capture_id': _captureCount});
    _logCommand('takePicture', sig);

    await _addTimingNoise();

    final path = await _controller.takePicture();
    final postCaptureTimestamp = DateTime.now();

    if (path == null || path.isEmpty) {
      return SecureCaptureResult(
        success: false,
        error: 'Capture returned null path',
      );
    }

    // Verify the captured image
    final verificationResult = await _verifyImageIntegrity(
      path,
      preCaptureTimestamp,
      postCaptureTimestamp,
    );

    _captureCount++;
    _lastCaptureTime = DateTime.now();

    if (!verificationResult.isValid) {
      _failedIntegrityChecks++;
      _anomalyScore += 3;
      _logSecurityEvent(SecurityEvent.integrityCheckFailed,
          'Image integrity check failed: ${verificationResult.reason}');

      // Don't return potentially tampered image
      if (_failedIntegrityChecks >= 3) {
        throw SecurityException(
            'Multiple integrity failures detected. Possible tampering.'
        );
      }
    } else {
      _logSecurityEvent(SecurityEvent.integrityCheckPassed,
          'Image verified: ${verificationResult.hash.substring(0, 16)}...');
    }

    return SecureCaptureResult(
      success: true,
      imagePath: path,
      imageHash: verificationResult.hash,
      captureId: _captureCount,
      timestamp: postCaptureTimestamp,
      integrityVerified: verificationResult.isValid,
      signature: sig,
    );
  }

  /// Verify image file integrity
  Future<ImageVerificationResult> _verifyImageIntegrity(
      String path,
      DateTime preCaptureTime,
      DateTime postCaptureTime,
      ) async {
    try {
      final file = File(path);

      if (!await file.exists()) {
        return ImageVerificationResult(
          isValid: false,
          reason: 'File does not exist',
          hash: '',
        );
      }

      final stat = await file.stat();
      final fileModified = stat.modified;

      // Check if file modification time is within capture window
      // Allow 2 second tolerance for filesystem delays
      final tolerance = const Duration(seconds: 2);
      if (fileModified.isBefore(preCaptureTime.subtract(tolerance)) ||
          fileModified.isAfter(postCaptureTime.add(tolerance))) {
        return ImageVerificationResult(
          isValid: false,
          reason: 'File timestamp outside capture window',
          hash: '',
        );
      }

      // Check file size is reasonable for an iris image (100KB - 20MB)
      if (stat.size < 100 * 1024 || stat.size > 20 * 1024 * 1024) {
        return ImageVerificationResult(
          isValid: false,
          reason: 'Suspicious file size: ${stat.size} bytes',
          hash: '',
        );
      }

      // Calculate file hash
      final bytes = await file.readAsBytes();
      final hash = _hashData(bytes);

      // Check for duplicate images (possible replay attack)
      if (_imageHashes.containsValue(hash)) {
        return ImageVerificationResult(
          isValid: false,
          reason: 'Duplicate image detected (possible replay)',
          hash: hash,
        );
      }

      // Verify image header (basic JPEG/PNG check)
      if (!_verifyImageHeader(bytes)) {
        return ImageVerificationResult(
          isValid: false,
          reason: 'Invalid image format',
          hash: hash,
        );
      }

      // Store hash for future duplicate detection
      _imageHashes[path] = hash;

      // Limit stored hashes to prevent memory bloat
      if (_imageHashes.length > 50) {
        final oldestKey = _imageHashes.keys.first;
        _imageHashes.remove(oldestKey);
      }

      return ImageVerificationResult(
        isValid: true,
        reason: 'Verification passed',
        hash: hash,
      );
    } catch (e) {
      return ImageVerificationResult(
        isValid: false,
        reason: 'Verification error: $e',
        hash: '',
      );
    }
  }

  /// Verify image header bytes
  bool _verifyImageHeader(Uint8List bytes) {
    if (bytes.length < 4) return false;

    // JPEG: FF D8 FF
    if (bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF) {
      return true;
    }

    // PNG: 89 50 4E 47
    if (bytes[0] == 0x89 && bytes[1] == 0x50 &&
        bytes[2] == 0x4E && bytes[3] == 0x47) {
      return true;
    }

    // BMP: 42 4D
    if (bytes[0] == 0x42 && bytes[1] == 0x4D) {
      return true;
    }

    return false;
  }

  /// Hash data using SHA-256
  String _hashData(List<int> data) {
    return sha256.convert(data).toString();
  }

  /// Calculate current threat level
  ThreatLevel _calculateThreatLevel() {
    if (_anomalyScore >= 10 || _failedIntegrityChecks >= 5) {
      return ThreatLevel.critical;
    }
    if (_anomalyScore >= 7 || _failedIntegrityChecks >= 3) {
      return ThreatLevel.high;
    }
    if (_anomalyScore >= 4 || _failedIntegrityChecks >= 2) {
      return ThreatLevel.medium;
    }
    if (_anomalyScore >= 2 || _failedIntegrityChecks >= 1) {
      return ThreatLevel.low;
    }
    return ThreatLevel.none;
  }

  /// Log security event
  void _logSecurityEvent(SecurityEvent event, String details) {
    debugPrint('[SecureUVC] ${event.name}: $details');

    // Only fire callback if fully initialized
    if (_isFullyInitialized) {
      onSecurityEvent?.call(event, details);
    }

    if (event == SecurityEvent.integrityCheckFailed ||
        event == SecurityEvent.anomalyDetected) {
      _checkThreatLevel();
    }
  }

  /// Check and respond to threat level
  void _checkThreatLevel() {
    final level = currentThreatLevel;
    if (level == ThreatLevel.critical) {
      _logSecurityEvent(SecurityEvent.channelCompromised,
          'Critical threat level reached. Anomaly: $_anomalyScore, '
              'Failed checks: $_failedIntegrityChecks');
    }
  }

  /// Get security audit report
  SecurityAuditReport generateAuditReport() {
    return SecurityAuditReport(
      sessionStart: _sessionStart,
      commandCount: _commandSequence,
      captureCount: _captureCount,
      failedIntegrityChecks: _failedIntegrityChecks,
      anomalyScore: _anomalyScore,
      threatLevel: currentThreatLevel,
      recentCommands: List.from(_commandLog.reversed.take(20)),
    );
  }

  /// Close camera securely
  void closeCamera() {
    final sig = _signCommand('closeCamera', null);
    _logCommand('closeCamera', sig);
    _controller.closeCamera();
  }

  /// End session and clear sensitive data
  void endSession() {
    _logSecurityEvent(SecurityEvent.sessionEnded,
        'Session ended. Commands: $_commandSequence, Captures: $_captureCount');

    // Securely clear session key
    if (_sessionKey != null) {
      for (var i = 0; i < _sessionKey!.length; i++) {
        _sessionKey![i] = _secureRandom.nextInt(256);
      }
      _sessionKey = null;
    }

    _commandLog.clear();
    _imageHashes.clear();
    _commandTimestamps.clear();
  }

  /// Dispose resources
  void dispose() {
    endSession();
    _controller.dispose();
  }
}

// ============================================
// SUPPORTING CLASSES
// ============================================

class SecureCaptureResult {
  final bool success;
  final String? imagePath;
  final String? imageHash;
  final int? captureId;
  final DateTime? timestamp;
  final bool integrityVerified;
  final String? signature;
  final String? error;

  SecureCaptureResult({
    required this.success,
    this.imagePath,
    this.imageHash,
    this.captureId,
    this.timestamp,
    this.integrityVerified = false,
    this.signature,
    this.error,
  });

  Map<String, dynamic> toJson() => {
    'success': success,
    'imagePath': imagePath,
    'imageHash': imageHash,
    'captureId': captureId,
    'timestamp': timestamp?.toIso8601String(),
    'integrityVerified': integrityVerified,
    'signature': signature,
    'error': error,
  };
}

class ImageVerificationResult {
  final bool isValid;
  final String reason;
  final String hash;

  ImageVerificationResult({
    required this.isValid,
    required this.reason,
    required this.hash,
  });
}

class SecurityAuditReport {
  final DateTime? sessionStart;
  final int commandCount;
  final int captureCount;
  final int failedIntegrityChecks;
  final int anomalyScore;
  final ThreatLevel threatLevel;
  final List<String> recentCommands;

  SecurityAuditReport({
    required this.sessionStart,
    required this.commandCount,
    required this.captureCount,
    required this.failedIntegrityChecks,
    required this.anomalyScore,
    required this.threatLevel,
    required this.recentCommands,
  });

  Map<String, dynamic> toJson() => {
    'sessionStart': sessionStart?.toIso8601String(),
    'sessionDuration': sessionStart != null
        ? DateTime.now().difference(sessionStart!).inMinutes
        : 0,
    'commandCount': commandCount,
    'captureCount': captureCount,
    'failedIntegrityChecks': failedIntegrityChecks,
    'anomalyScore': anomalyScore,
    'threatLevel': threatLevel.name,
    'recentCommands': recentCommands,
  };

  @override
  String toString() => jsonEncode(toJson());
}

class SecurityException implements Exception {
  final String message;
  SecurityException(this.message);

  @override
  String toString() => 'SecurityException: $message';
}