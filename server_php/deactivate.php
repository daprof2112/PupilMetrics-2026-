<?php
// POST /deactivate — free a machine slot so the license can be moved

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
    if (!empty($key) && !empty($machineId)) {
        removeActivation($key, $machineId);
    }

    jsonResponse(200, [
        'success' => true,
        'message' => 'License deactivated from this computer.',
    ]);

} catch (Exception $e) {
    logError('deactivate.php error: ' . $e->getMessage());
    // Not critical if this fails — local deactivation already happened
    jsonResponse(200, ['success' => true, 'message' => 'Deactivated.']);
}
