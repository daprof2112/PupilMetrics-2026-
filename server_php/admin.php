<?php
// admin.php — Admin-only endpoints
// All require the X-Admin-Secret header.
//
// POST /admin/revoke      body: {"key":"...", "reason":"..."}
// POST /admin/issue       body: {"key":"...", "type":"...", "email":"...", "registeredTo":"...", "expiresAt":"..."}
// GET  /admin/licenses

require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/db.php';
require_once __DIR__ . '/key_validator.php';

if (!verifyAdminSecret()) {
    jsonResponse(401, ['error' => 'Unauthorized.']);
}

$action = $_GET['action'] ?? '';
$method = $_SERVER['REQUEST_METHOD'];

try {
    // ----- GET /admin/licenses -----------------------------------------------
    if ($action === 'licenses' && $method === 'GET') {
        $licenses = getAllLicenses();
        // Attach activations to each record
        foreach ($licenses as &$lic) {
            $lic['activations'] = getActivations($lic['license_key']);
        }
        jsonResponse(200, ['count' => count($licenses), 'licenses' => $licenses]);
    }

    // ----- POST /admin/revoke ------------------------------------------------
    if ($action === 'revoke' && $method === 'POST') {
        $data   = parseBody(readBody());
        $key    = strtoupper(trim($data['key']    ?? ''));
        $reason = trim($data['reason']            ?? '');

        if (empty($key)) jsonResponse(400, ['error' => 'key is required.']);

        $license = getLicense($key);
        if ($license === null) jsonResponse(404, ['error' => 'License key not found.']);

        revokeLicense($key, $reason);
        jsonResponse(200, ['success' => true, 'message' => 'License revoked.']);
    }

    // ----- POST /admin/issue -------------------------------------------------
    if ($action === 'issue' && $method === 'POST') {
        $data         = parseBody(readBody());
        $key          = strtoupper(trim($data['key']          ?? ''));
        $type         = trim($data['type']                    ?? '');
        $email        = trim($data['email']                   ?? '');
        $name         = trim($data['registeredTo']            ?? '');
        $expiresAt    = $data['expiresAt'] ?? null;

        if (empty($key) || empty($type) || empty($email) || empty($name)) {
            jsonResponse(400, ['error' => 'key, type, email, and registeredTo are required.']);
        }

        if (validateKeyChecksum($key) === null) {
            jsonResponse(400, ['error' => 'Invalid license key checksum.']);
        }

        insertLicense([
            'key'           => $key,
            'type'          => $type,
            'email'         => $email,
            'registered_to' => $name,
            'expires_at'    => $expiresAt,
        ]);

        jsonResponse(200, ['success' => true, 'message' => 'License issued.']);
    }

    jsonResponse(404, ['error' => 'Unknown admin action. Use: revoke, issue, or licenses.']);

} catch (Exception $e) {
    logError('admin.php error: ' . $e->getMessage());
    jsonResponse(500, ['error' => 'Server error: ' . $e->getMessage()]);
}
