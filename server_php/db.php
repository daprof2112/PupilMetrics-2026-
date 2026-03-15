<?php
// db.php — Database connection and all SQL helpers

require_once __DIR__ . '/config.php';

function getDB(): PDO {
    static $pdo = null;
    if ($pdo !== null) return $pdo;

    $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4';
    $pdo = new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ]);
    return $pdo;
}

// --- License record ----------------------------------------------------------

function getLicense(string $key): ?array {
    $stmt = getDB()->prepare('SELECT * FROM licenses WHERE license_key = ?');
    $stmt->execute([strtoupper($key)]);
    return $stmt->fetch() ?: null;
}

function insertLicense(array $d): void {
    $stmt = getDB()->prepare(
        'INSERT INTO licenses (license_key, type, email, registered_to, issued_at, expires_at)
         VALUES (?, ?, ?, ?, NOW(), ?)
         ON DUPLICATE KEY UPDATE
           type         = VALUES(type),
           email        = VALUES(email),
           registered_to= VALUES(registered_to),
           expires_at   = VALUES(expires_at)'
    );
    $stmt->execute([
        strtoupper($d['key']),
        $d['type'],
        $d['email'],
        $d['registered_to'],
        $d['expires_at'] ?? null,
    ]);
}

function revokeLicense(string $key, string $reason): void {
    $stmt = getDB()->prepare(
        'UPDATE licenses SET revoked = 1, revoked_at = NOW(), revoked_reason = ?
         WHERE license_key = ?'
    );
    $stmt->execute([$reason, strtoupper($key)]);
}

function getAllLicenses(): array {
    return getDB()->query(
        'SELECT l.*, COUNT(a.id) AS activation_count
         FROM licenses l
         LEFT JOIN activations a ON a.license_key = l.license_key
         GROUP BY l.license_key
         ORDER BY l.issued_at DESC'
    )->fetchAll();
}

// --- Activations -------------------------------------------------------------

function getActivations(string $key): array {
    $stmt = getDB()->prepare('SELECT * FROM activations WHERE license_key = ?');
    $stmt->execute([strtoupper($key)]);
    return $stmt->fetchAll();
}

function addActivation(string $key, string $machineId, string $platform, string $appVersion): void {
    $stmt = getDB()->prepare(
        'INSERT INTO activations (license_key, machine_id, activated_at, platform, app_version)
         VALUES (?, ?, NOW(), ?, ?)
         ON DUPLICATE KEY UPDATE
           activated_at = NOW(),
           platform     = VALUES(platform),
           app_version  = VALUES(app_version)'
    );
    $stmt->execute([strtoupper($key), $machineId, $platform, $appVersion]);
}

function removeActivation(string $key, string $machineId): void {
    $stmt = getDB()->prepare(
        'DELETE FROM activations WHERE license_key = ? AND machine_id = ?'
    );
    $stmt->execute([strtoupper($key), $machineId]);
}
