// lib/utils/database_init.dart
// Handles database initialization for all platforms
// Uses sqlite3_flutter_libs for pre-compiled binaries (no network download needed)

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

/// Global flag to check if database is available
bool isDatabaseAvailable = false;

Future<void> initializeDatabase() async {
  if (Platform.isWindows || Platform.isLinux) {
    try {
      // Load the pre-built SQLite library from sqlite3_flutter_libs
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();

      // Initialize FFI
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      isDatabaseAvailable = true;
      debugPrint('✅ SQLite FFI initialized for ${Platform.operatingSystem}');
    } catch (e) {
      isDatabaseAvailable = false;
      debugPrint('⚠️ SQLite FFI failed: $e');
      debugPrint('⚠️ Scan history disabled on this platform');
    }
  } else if (Platform.isMacOS) {
    try {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      isDatabaseAvailable = true;
      debugPrint('✅ SQLite FFI initialized for macOS');
    } catch (e) {
      isDatabaseAvailable = false;
      debugPrint('⚠️ SQLite FFI failed on macOS: $e');
    }
  } else {
    // Android/iOS use native sqflite - no initialization needed
    isDatabaseAvailable = true;
    debugPrint('✅ Using native SQLite for ${Platform.operatingSystem}');
  }
}