<?php
// POST /validate — periodic re-check; detects revocation and expiry

require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    jsonResponse(405, ['error' => 'Method not allowed.']);
}

$body = readBody();

if (!verifyAppSignature($body)) {
    jsonResponse(401, ['error' => 'Invalid request signature.']);
}

$data      = parseBody($body);
$key       = strtoupper(trim($data['key']       ?? ''));
$machineId = trim($data['machineId']             ?? '');

try {
    $license = getLicense($key);

    if ($license === null) {
        // Unknown key — trust the local Phase 1/2 validation
        jsonResponse(200, ['valid' => true]);
    }

    if ($license['revoked']) {
        jsonResponse(200, [
            'valid'   => false,
            'message' => 'This license has been revoked. Please contact support.',
        ]);
    }

    if ($license['expires_at'] !== null && strtotime($license['expires_at']) < time()) {
        jsonResponse(200, ['valid' => false, 'message' => 'License has expired.']);
    }

    // Check machine binding
    $activations = getActivations($key);
    $isBound     = false;
    foreach ($activations as $a) {
        if ($a['machine_id'] === $machineId) {
            $isBound = true;
            break;
        }
    }

    if (!$isBound && !empty($activations)) {
        jsonResponse(200, [
            'valid'   => false,
            'message' => 'This license is not registered for this computer.',
        ]);
    }

    jsonResponse(200, ['valid' => true]);

} catch (Exception $e) {
    logError('validate.php error: ' . $e->getMessage());
    // On server error, honour offline grace period — return null-equivalent
    // so the app falls back to its cached state rather than blocking the user.
    jsonResponse(200, ['valid' => true]);
}
