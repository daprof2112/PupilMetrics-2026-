// server/lib/database.dart
// JSON file-backed license database.
// All writes are atomic (write to temp file then rename).

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

/// A single machine activation record.
class ActivationRecord {
  final String machineId;
  final DateTime activatedAt;
  final String platform;
  final String appVersion;

  ActivationRecord({
    required this.machineId,
    required this.activatedAt,
    required this.platform,
    required this.appVersion,
  });

  factory ActivationRecord.fromJson(Map<String, dynamic> j) => ActivationRecord(
        machineId: j['machineId'] as String,
        activatedAt: DateTime.parse(j['activatedAt'] as String),
        platform: j['platform'] as String? ?? 'unknown',
        appVersion: j['appVersion'] as String? ?? 'unknown',
      );

  Map<String, dynamic> toJson() => {
        'machineId': machineId,
        'activatedAt': activatedAt.toIso8601String(),
        'platform': platform,
        'appVersion': appVersion,
      };
}

/// A license key record with all associated activations.
class LicenseRecord {
  final String key;
  final String type;
  final String email;
  final String registeredTo;
  final DateTime issuedAt;
  final DateTime? expiresAt;
  final List<ActivationRecord> activations;
  final bool revoked;
  final DateTime? revokedAt;
  final String? revokedReason;

  LicenseRecord({
    required this.key,
    required this.type,
    required this.email,
    required this.registeredTo,
    required this.issuedAt,
    this.expiresAt,
    required this.activations,
    this.revoked = false,
    this.revokedAt,
    this.revokedReason,
  });

  factory LicenseRecord.fromJson(Map<String, dynamic> j) => LicenseRecord(
        key: j['key'] as String,
        type: j['type'] as String,
        email: j['email'] as String,
        registeredTo: j['registeredTo'] as String,
        issuedAt: DateTime.parse(j['issuedAt'] as String),
        expiresAt:
            j['expiresAt'] != null ? DateTime.parse(j['expiresAt'] as String) : null,
        activations: (j['activations'] as List)
            .map((a) => ActivationRecord.fromJson(a as Map<String, dynamic>))
            .toList(),
        revoked: j['revoked'] as bool? ?? false,
        revokedAt:
            j['revokedAt'] != null ? DateTime.parse(j['revokedAt'] as String) : null,
        revokedReason: j['revokedReason'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'type': type,
        'email': email,
        'registeredTo': registeredTo,
        'issuedAt': issuedAt.toIso8601String(),
        'expiresAt': expiresAt?.toIso8601String(),
        'activations': activations.map((a) => a.toJson()).toList(),
        'revoked': revoked,
        'revokedAt': revokedAt?.toIso8601String(),
        'revokedReason': revokedReason,
      };

  LicenseRecord copyWith({
    List<ActivationRecord>? activations,
    bool? revoked,
    DateTime? revokedAt,
    String? revokedReason,
  }) =>
      LicenseRecord(
        key: key,
        type: type,
        email: email,
        registeredTo: registeredTo,
        issuedAt: issuedAt,
        expiresAt: expiresAt,
        activations: activations ?? this.activations,
        revoked: revoked ?? this.revoked,
        revokedAt: revokedAt ?? this.revokedAt,
        revokedReason: revokedReason ?? this.revokedReason,
      );
}

/// Simple JSON-file-backed license database with atomic writes.
class LicenseDatabase {
  final String _path;
  final Map<String, LicenseRecord> _records = {};

  LicenseDatabase(this._path);

  Future<void> load() async {
    final file = File(_path);
    if (!await file.exists()) {
      await file.parent.create(recursive: true);
      await _flush();
      print('[DB] Created new database at $_path');
      return;
    }
    try {
      final raw = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final licenses = raw['licenses'] as Map<String, dynamic>? ?? {};
      for (final entry in licenses.entries) {
        _records[entry.key] =
            LicenseRecord.fromJson(entry.value as Map<String, dynamic>);
      }
      print('[DB] Loaded ${_records.length} license(s) from $_path');
    } catch (e) {
      stderr.writeln('[DB] Error loading database: $e');
    }
  }

  LicenseRecord? get(String key) => _records[key.toUpperCase()];

  Future<void> put(LicenseRecord record) async {
    _records[record.key.toUpperCase()] = record;
    await _flush();
  }

  List<LicenseRecord> getAll() =>
      _records.values.toList()..sort((a, b) => b.issuedAt.compareTo(a.issuedAt));

  /// Atomic write: write to .tmp, then rename.
  Future<void> _flush() async {
    final data = {
      'licenses': {
        for (final e in _records.entries) e.key: e.value.toJson(),
      },
    };
    final tmp = File('$_path.tmp');
    await tmp.writeAsString(const JsonEncoder.withIndent('  ').convert(data));
    await tmp.rename(_path);
  }
}
