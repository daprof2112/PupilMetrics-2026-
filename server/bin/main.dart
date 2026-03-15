// server/bin/main.dart
// PupilMetrics License Server
//
// Configuration via environment variables (or a .env file loaded by your
// process manager / systemd unit / Docker env):
//
//   PM_API_SECRET      — shared secret between app and server (HMAC request signing)
//   PM_ADMIN_SECRET    — secret for admin API endpoints
//   PM_LICENSE_SECRET  — must match _secretKey in lib/utils/license_manager.dart
//   PM_DB_PATH         — path to licenses.json (default: data/licenses.json)
//   PORT               — HTTP port (default: 8080)
//
// Run:
//   dart run bin/main.dart
//
// Or compile a native binary for production:
//   dart compile exe bin/main.dart -o license_server
//   ./license_server

// ignore_for_file: avoid_print

import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import '../lib/database.dart';
import '../lib/handlers.dart';

Future<void> main() async {
  // ── Configuration ──────────────────────────────────────────────────────────
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final apiSecret = Platform.environment['PM_API_SECRET'] ?? '';
  final adminSecret = Platform.environment['PM_ADMIN_SECRET'] ?? '';
  final licenseSecret = Platform.environment['PM_LICENSE_SECRET'] ?? '';
  final dbPath = Platform.environment['PM_DB_PATH'] ?? 'data/licenses.json';

  if (apiSecret.isEmpty || adminSecret.isEmpty || licenseSecret.isEmpty) {
    stderr.writeln(
      'ERROR: PM_API_SECRET, PM_ADMIN_SECRET, and PM_LICENSE_SECRET '
      'must all be set as environment variables.',
    );
    exit(1);
  }

  if (apiSecret.length < 32 || adminSecret.length < 32) {
    stderr.writeln(
      'WARNING: Secrets should be at least 32 characters for security.',
    );
  }

  // ── Database ───────────────────────────────────────────────────────────────
  final db = LicenseDatabase(dbPath);
  await db.load();

  // ── Routes ─────────────────────────────────────────────────────────────────
  final handlers = LicenseHandlers(
    db: db,
    apiSecret: apiSecret,
    adminSecret: adminSecret,
    licenseSecret: licenseSecret,
  );

  final router = Router()
    // App-facing (require X-App-Sig: HMAC-SHA256(apiSecret, body))
    ..post('/activate', handlers.activate)
    ..post('/validate', handlers.validate)
    ..post('/deactivate', handlers.deactivate)
    // Admin (require X-Admin-Secret header)
    ..post('/admin/revoke', handlers.adminRevoke)
    ..post('/admin/issue', handlers.adminIssue)
    ..get('/admin/licenses', handlers.adminListLicenses)
    // Health check
    ..get('/health', handlers.health);

  final pipeline = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  // ── Start ──────────────────────────────────────────────────────────────────
  final server =
      await shelf_io.serve(pipeline, InternetAddress.anyIPv4, port);
  server.autoCompress = true;

  print('');
  print('┌─────────────────────────────────────────┐');
  print('│  PupilMetrics License Server v1.0        │');
  print('│  http://0.0.0.0:${server.port}                    │');
  print('│  DB: $dbPath');
  print('└─────────────────────────────────────────┘');
  print('');
  print('Endpoints:');
  print('  POST /activate           (app)');
  print('  POST /validate           (app)');
  print('  POST /deactivate         (app)');
  print('  POST /admin/revoke       (admin)');
  print('  POST /admin/issue        (admin)');
  print('  GET  /admin/licenses     (admin)');
  print('  GET  /health');
  print('');
}
