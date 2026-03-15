<?php
// GET /health — quick sanity check (also tests DB connection)

require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/db.php';

header('Content-Type: application/json');

try {
    getDB()->query('SELECT 1');
    $count = getDB()->query('SELECT COUNT(*) AS n FROM licenses')->fetch()['n'];
    echo json_encode([
        'status'   => 'ok',
        'db'       => 'connected',
        'licenses' => (int)$count,
        'time'     => date('c'),
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'detail' => $e->getMessage()]);
}
