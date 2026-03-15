<?php
// POST /activate — record a machine activation and enforce per-type limits

require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/key_validator.php';

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
$email     = trim($data['email']                 ?? '');
$name      = trim($data['name']                  ?? '');
$version   = trim($data['appVersion']            ?? 'unknown');
$platform  = trim($data['platform']              ?? 'unknown');

if (empty($key) || empty($machineId)) {
    jsonResponse(400, ['success' => false, 'message' => 'key and machineId are required.']);
}

try {
    $license = getLicense($key);

    if ($license === null) {
        // First time we've seen this key — validate its HMAC checksum
        $decoded = validateKeyChecksum($key);
        if ($decoded === null) {
            jsonResponse(200, ['success' => false, 'message' => 'This license key is not valid.']);
        }
        // Lazy-register on first activation
        insertLicense([
            'key'           => $key,
            'type'          => $decoded['type'],
            'email'         => $email,
            'registered_to' => $name,
            'expires_at'    => $decoded['expiry'],
        ]);
        $license = getLicense($key);
    }

    if ($license['revoked']) {
        jsonResponse(200, [
            'success' => false,
            'message' => 'This license has been revoked. Please contact support.',
        ]);
    }

    if ($license['expires_at'] !== null && strtotime($license['expires_at']) < time()) {
        jsonResponse(200, ['success' => false, 'message' => 'This license key has expired.']);
    }

    $activations = getActivations($key);

    // Re-activation on the same machine is always allowed
    foreach ($activations as $a) {
        if ($a['machine_id'] === $machineId) {
            jsonResponse(200, [
                'success'    => true,
                'type'       => $license['type'],
                'expiration' => $license['expires_at'],
                'message'    => 'License verified for this computer.',
            ]);
        }
    }

    // Enforce activation limit
    $limit = maxActivations($license['type']);
    if (count($activations) >= $limit) {
        $noun = $limit === 1 ? 'computer' : 'computers';
        jsonResponse(200, [
            'success' => false,
            'message' => "This license is already active on $limit $noun. "
                       . 'Deactivate it on another machine first, or contact support.',
        ]);
    }

    addActivation($key, $machineId, $platform, $version);

    jsonResponse(200, [
        'success'    => true,
        'type'       => $license['type'],
        'expiration' => $license['expires_at'],
        'message'    => 'License activated successfully! Thank you for your purchase.',
    ]);

} catch (Exception $e) {
    logError('activate.php error: ' . $e->getMessage());
    jsonResponse(500, ['success' => false, 'message' => 'Server error. Please try again.']);
}
