// server/lib/handlers.dart
// HTTP route handlers for all license API endpoints.

// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';
import 'database.dart';
import 'key_validator.dart';

class LicenseHandlers {
  final LicenseDatabase db;
  final String apiSecret;
  final String adminSecret;
  final KeyValidator _validator;

  LicenseHandlers({
    required this.db,
    required this.apiSecret,
    required this.adminSecret,
    required String licenseSecret,
  }) : _validator = KeyValidator(licenseSecret);

  // ===========================================================================
  // App-facing endpoints (require X-App-Sig: HMAC-SHA256(apiSecret, body))
  // ===========================================================================

  /// POST /activate
  Future<Response> activate(Request request) async {
    final (data, err) = await _verifyAppRequest(request);
    if (err != null) return err;

    final key = _normalizeKey(data!['key']);
    final machineId = data['machineId'] as String? ?? '';
    final email = data['email'] as String? ?? '';
    final name = data['name'] as String? ?? '';
    final appVersion = data['appVersion'] as String? ?? 'unknown';
    final platform = data['platform'] as String? ?? 'unknown';

    if (key.isEmpty || machineId.isEmpty) {
      return _json(400, {'success': false, 'message': 'key and machineId are required.'});
    }

    var record = db.get(key);
    if (record == null) {
      // First time we've seen this key — validate its checksum structure
      final decoded = _validator.decode(key);
      if (decoded == null) {
        return _json(200, {'success': false, 'message': 'This license key is not valid.'});
      }
      // Lazy-register the license on first activation
      record = LicenseRecord(
        key: key,
        type: decoded['type'] as String,
        email: email,
        registeredTo: name,
        issuedAt: DateTime.now().toUtc(),
        expiresAt: decoded['expiration'] != null
            ? DateTime.parse(decoded['expiration'] as String)
            : null,
        activations: [],
      );
    }

    if (record.revoked) {
      return _json(200, {
        'success': false,
        'message': 'This license has been revoked. Please contact support.',
      });
    }

    if (record.expiresAt != null && DateTime.now().isAfter(record.expiresAt!)) {
      return _json(200, {'success': false, 'message': 'This license key has expired.'});
    }

    // Re-activation on the same machine is always allowed
    final alreadyBound = record.activations.any((a) => a.machineId == machineId);
    if (alreadyBound) {
      return _json(200, {
        'success': true,
        'type': record.type,
        'expiration': record.expiresAt?.toIso8601String(),
        'message': 'License verified for this computer.',
      });
    }

    // Enforce activation limit
    final limit = KeyValidator.maxActivations(record.type);
    if (record.activations.length >= limit) {
      return _json(200, {
        'success': false,
        'message': 'This license is already active on $limit '
            'computer${limit != 1 ? "s" : ""}. Deactivate it on another '
            'machine first, or contact support.',
      });
    }

    // Record the new activation
    final updated = record.copyWith(
      activations: [
        ...record.activations,
        ActivationRecord(
          machineId: machineId,
          activatedAt: DateTime.now().toUtc(),
          platform: platform,
          appVersion: appVersion,
        ),
      ],
    );
    await db.put(updated);

    print('[ACTIVATE] $key | machine=$machineId | type=${record.type} | '
        'activations=${updated.activations.length}/$limit');

    return _json(200, {
      'success': true,
      'type': record.type,
      'expiration': record.expiresAt?.toIso8601String(),
      'message': 'License activated successfully! Thank you for your purchase.',
    });
  }

  /// POST /validate — periodic re-validation while app is running
  Future<Response> validate(Request request) async {
    final (data, err) = await _verifyAppRequest(request);
    if (err != null) return err;

    final key = _normalizeKey(data!['key']);
    final machineId = data['machineId'] as String? ?? '';

    final record = db.get(key);
    if (record == null) {
      // Unknown key — trust the local Phase 1/2 validation
      return _json(200, {'valid': true});
    }

    if (record.revoked) {
      return _json(200, {
        'valid': false,
        'message': 'This license has been revoked. Please contact support.',
      });
    }

    if (record.expiresAt != null && DateTime.now().isAfter(record.expiresAt!)) {
      return _json(200, {'valid': false, 'message': 'License has expired.'});
    }

    final isBound = record.activations.any((a) => a.machineId == machineId);
    if (!isBound && record.activations.isNotEmpty) {
      return _json(200, {
        'valid': false,
        'message': 'This license is not registered for this computer.',
      });
    }

    return _json(200, {'valid': true});
  }

  /// POST /deactivate — free up a machine slot
  Future<Response> deactivate(Request request) async {
    final (data, err) = await _verifyAppRequest(request);
    if (err != null) return err;

    final key = _normalizeKey(data!['key']);
    final machineId = data['machineId'] as String? ?? '';

    final record = db.get(key);
    if (record != null) {
      final updated = record.copyWith(
        activations:
            record.activations.where((a) => a.machineId != machineId).toList(),
      );
      await db.put(updated);
      print('[DEACTIVATE] $key | machine=$machineId | '
          'remaining activations=${updated.activations.length}');
    }

    return _json(200, {
      'success': true,
      'message': 'License deactivated from this computer.',
    });
  }

  // ===========================================================================
  // Admin endpoints (require X-Admin-Secret header)
  // ===========================================================================

  /// POST /admin/revoke
  Future<Response> adminRevoke(Request request) async {
    if (!_checkAdmin(request)) return _json(401, {'error': 'Unauthorized'});

    final data = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
    final key = _normalizeKey(data['key']);
    final reason = data['reason'] as String? ?? '';

    final record = db.get(key);
    if (record == null) return _json(404, {'error': 'License key not found.'});

    await db.put(record.copyWith(
      revoked: true,
      revokedAt: DateTime.now().toUtc(),
      revokedReason: reason,
    ));

    print('[ADMIN REVOKE] $key | reason=$reason');
    return _json(200, {'success': true, 'message': 'License revoked.'});
  }

  /// POST /admin/issue — pre-register a key before sending to customer
  Future<Response> adminIssue(Request request) async {
    if (!_checkAdmin(request)) return _json(401, {'error': 'Unauthorized'});

    final data = jsonDecode(await request.readAsString()) as Map<String, dynamic>;
    final key = _normalizeKey(data['key']);
    final type = data['type'] as String? ?? '';
    final email = data['email'] as String? ?? '';
    final name = data['registeredTo'] as String? ?? '';
    final expiresAtStr = data['expiresAt'] as String?;

    if (key.isEmpty || type.isEmpty || email.isEmpty || name.isEmpty) {
      return _json(400,
          {'error': 'key, type, email, and registeredTo are required.'});
    }
    if (_validator.decode(key) == null) {
      return _json(400, {'error': 'Invalid license key checksum.'});
    }

    await db.put(LicenseRecord(
      key: key,
      type: type,
      email: email,
      registeredTo: name,
      issuedAt: DateTime.now().toUtc(),
      expiresAt: expiresAtStr != null ? DateTime.parse(expiresAtStr) : null,
      activations: [],
    ));

    print('[ADMIN ISSUE] $key | type=$type | to=$name <$email>');
    return _json(200, {'success': true, 'message': 'License issued.'});
  }

  /// GET /admin/licenses — list all license records
  Future<Response> adminListLicenses(Request request) async {
    if (!_checkAdmin(request)) return _json(401, {'error': 'Unauthorized'});

    final all = db.getAll();
    return _json(200, {
      'count': all.length,
      'licenses': all.map((r) => r.toJson()).toList(),
    });
  }

  /// GET /health
  Response health(Request request) => Response.ok('OK');

  // ===========================================================================
  // Helpers
  // ===========================================================================

  /// Read body once, verify HMAC signature, parse JSON.
  Future<(Map<String, dynamic>?, Response?)> _verifyAppRequest(
      Request request) async {
    final body = await request.readAsString();
    final sig = request.headers['x-app-sig'];

    if (sig == null || sig.isEmpty) {
      return (null, _json(401, {'error': 'Missing X-App-Sig header.'}));
    }

    final expected = Hmac(sha256, utf8.encode(apiSecret))
        .convert(utf8.encode(body))
        .toString();

    if (!_constantTimeEqual(expected, sig)) {
      return (null, _json(401, {'error': 'Invalid request signature.'}));
    }

    try {
      return (jsonDecode(body) as Map<String, dynamic>, null);
    } catch (_) {
      return (null, _json(400, {'error': 'Invalid JSON body.'}));
    }
  }

  bool _checkAdmin(Request request) {
    final secret = request.headers['x-admin-secret'];
    if (secret == null) return false;
    return _constantTimeEqual(secret, adminSecret);
  }

  static String _normalizeKey(dynamic raw) =>
      (raw as String? ?? '').toUpperCase().replaceAll(' ', '');

  static Response _json(int status, Object body) => Response(
        status,
        body: jsonEncode(body),
        headers: {'content-type': 'application/json'},
      );

  static bool _constantTimeEqual(String a, String b) {
    if (a.length != b.length) return false;
    int diff = 0;
    for (int i = 0; i < a.length; i++) {
      diff |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
    }
    return diff == 0;
  }
}
