<?php
// key_validator.php — Mirrors LicenseManager._decodeKey / _generateChecksum in Dart.
// Must stay in sync with lib/utils/license_manager.dart.

require_once __DIR__ . '/config.php';

/**
 * Validate a license key's HMAC checksum.
 * Returns ['type' => ..., 'expiry' => ...] on success, null on failure.
 */
function validateKeyChecksum(string $key): ?array {
    $cleaned = strtoupper(str_replace('-', '', $key));

    if (strlen($cleaned) !== 20)                   return null;
    if (substr($cleaned, 0, 4) !== 'CNRI')         return null;
    if (!preg_match('/^[A-Z0-9]+$/', $cleaned))    return null;

    $rest       = substr($cleaned, 4);   // 16 chars
    $typeCode   = $rest[0];              // 1 char
    $checksum   = substr($rest, 1, 8);   // 8-char HMAC prefix
    $randomData = substr($rest, 9);      // 7-char random suffix

    // Recompute: HMAC-SHA256(LICENSE_SECRET, typeCode + randomData), first 8 hex chars
    $expected = strtoupper(substr(
        hash_hmac('sha256', $typeCode . $randomData, LICENSE_SECRET),
        0, 8
    ));

    if (!hash_equals($expected, $checksum)) return null;

    switch ($typeCode) {
        case 'S':
            return ['type' => 'standard',     'expiry' => date('Y-m-d H:i:s', strtotime('+365 days'))];
        case 'P':
            return ['type' => 'professional', 'expiry' => null];
        case 'E':
            return ['type' => 'enterprise',   'expiry' => null];
        default:
            return null;
    }
}

/**
 * Maximum concurrent machine activations per license type.
 * Must match KeyValidator.maxActivations() in server/lib/key_validator.dart.
 */
function maxActivations(string $type): int {
    return match ($type) {
        'standard'     => 2,
        'professional' => 1,
        'enterprise'   => 10,
        default        => 1,
    };
}
