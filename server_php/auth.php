<?php
// auth.php — Request authentication helpers

require_once __DIR__ . '/config.php';

/**
 * Verify the X-App-Sig header against HMAC-SHA256(API_SECRET, body).
 * Uses hash_equals() for constant-time comparison (prevents timing attacks).
 */
function verifyAppSignature(string $body): bool {
    $sig = $_SERVER['HTTP_X_APP_SIG'] ?? '';
    if (empty($sig)) return false;
    $expected = hash_hmac('sha256', $body, API_SECRET);
    return hash_equals($expected, strtolower($sig));
}

/**
 * Verify the X-Admin-Secret header.
 */
function verifyAdminSecret(): bool {
    $secret = $_SERVER['HTTP_X_ADMIN_SECRET'] ?? '';
    if (empty($secret)) return false;
    return hash_equals(ADMIN_SECRET, $secret);
}

/**
 * Send a JSON response and exit.
 */
function jsonResponse(int $status, array $data): never {
    http_response_code($status);
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

/**
 * Read the raw request body.
 */
function readBody(): string {
    return file_get_contents('php://input') ?: '';
}

/**
 * Parse JSON body, responding 400 if malformed.
 */
function parseBody(string $body): array {
    if (empty($body)) jsonResponse(400, ['error' => 'Empty request body.']);
    $data = json_decode($body, true);
    if ($data === null) jsonResponse(400, ['error' => 'Invalid JSON body.']);
    return $data;
}

/**
 * Log an error to the configured log file (if set).
 */
function logError(string $message): void {
    if (!defined('ERROR_LOG') || empty(ERROR_LOG)) return;
    $dir = dirname(ERROR_LOG);
    if (!is_dir($dir)) @mkdir($dir, 0750, true);
    $line = '[' . date('Y-m-d H:i:s') . '] ' . $message . PHP_EOL;
    @file_put_contents(ERROR_LOG, $line, FILE_APPEND | LOCK_EX);
}
