// server/lib/key_validator.dart
// Mirrors the offline key validation logic from lib/utils/license_manager.dart.
// Must stay in sync with LicenseManager._decodeKey / _generateChecksum.

import 'dart:convert';
import 'package:crypto/crypto.dart';

class KeyValidator {
  final String _secretKey;

  KeyValidator(this._secretKey);

  /// Returns decoded key metadata, or null if the key has an invalid checksum.
  Map<String, dynamic>? decode(String licenseKey) {
    try {
      final cleaned = licenseKey.replaceAll('-', '').toUpperCase();
      if (cleaned.length != 20) return null;
      if (!cleaned.startsWith('CNRI')) return null;
      if (!RegExp(r'^[A-Z0-9]+$').hasMatch(cleaned)) return null;

      final rest = cleaned.substring(4); // strip 'CNRI'
      final typeCode = rest[0];
      final checksum = rest.substring(1, 9); // 8-char HMAC-SHA256 prefix
      final encodedData = rest.substring(9); // 7-char random suffix

      if (_checksum(typeCode + encodedData) != checksum) return null;

      String type;
      DateTime? expiration;
      switch (typeCode) {
        case 'S':
          type = 'standard';
          expiration = DateTime.now().toUtc().add(const Duration(days: 365));
          break;
        case 'P':
          type = 'professional';
          break;
        case 'E':
          type = 'enterprise';
          break;
        default:
          return null;
      }

      return {
        'type': type,
        'expiration': expiration?.toIso8601String(),
      };
    } catch (_) {
      return null;
    }
  }

  String _checksum(String data) =>
      Hmac(sha256, utf8.encode(_secretKey))
          .convert(utf8.encode(data))
          .toString()
          .substring(0, 8)
          .toUpperCase();

  /// Maximum concurrent machine activations per license type.
  static int maxActivations(String type) {
    switch (type) {
      case 'standard':
        return 2;
      case 'professional':
        return 1;
      case 'enterprise':
        return 10;
      default:
        return 1;
    }
  }
}
