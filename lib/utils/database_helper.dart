// lib/utils/database_helper.dart
// SQLite database for storing scan history
// FIXED FOR DESKTOP INSTALLERS: Uses getApplicationSupportDirectory() for reliable, writable path
// This resolves issues where getDatabasesPath() fails in release/installed builds on Windows

import 'dart:async';
import 'dart:convert';
import 'dart:io';  // For Directory
import 'package:flutter/foundation.dart';  // ADDED: Required for debugPrint
import 'package:flutter/services.dart' show rootBundle;  // For optional asset copying (uncomment if needed)
import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';  // Critical for reliable desktop path
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

// Optional: Import your logToFile function if you want persistent logging of the DB path
// import 'package:ai_eye_capture/main.dart';  // Uncomment and adjust if you want to use logToFile()

class ScanRecord {
  final int? id;
  final String patientName;
  final String patientSex;
  final int patientAge;
  final String? complaints;
  final DateTime scanDate;
  final String? rightEyePath;
  final String? leftEyePath;
  final String? rightEyeJson;
  final String? leftEyeJson;
  final String? anisocoriaJson;
  final String? ageNormJson;
  final bool isSynced;

  ScanRecord({
    this.id,
    required this.patientName,
    required this.patientSex,
    required this.patientAge,
    this.complaints,
    required this.scanDate,
    this.rightEyePath,
    this.leftEyePath,
    this.rightEyeJson,
    this.leftEyeJson,
    this.anisocoriaJson,
    this.ageNormJson,
    this.isSynced = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patient_name': patientName,
      'patient_sex': patientSex,
      'patient_age': patientAge,
      'complaints': complaints,
      'scan_date': scanDate.toIso8601String(),
      'right_eye_path': rightEyePath,
      'left_eye_path': leftEyePath,
      'right_eye_json': rightEyeJson,
      'left_eye_json': leftEyeJson,
      'anisocoria_json': anisocoriaJson,
      'age_norm_json': ageNormJson,
      'is_synced': isSynced ? 1 : 0,
    };
  }

  factory ScanRecord.fromMap(Map<String, dynamic> map) {
    return ScanRecord(
      id: map['id'],
      patientName: map['patient_name'],
      patientSex: map['patient_sex'],
      patientAge: map['patient_age'],
      complaints: map['complaints'],
      scanDate: DateTime.parse(map['scan_date']),
      rightEyePath: map['right_eye_path'],
      leftEyePath: map['left_eye_path'],
      rightEyeJson: map['right_eye_json'],
      leftEyeJson: map['left_eye_json'],
      anisocoriaJson: map['anisocoria_json'],
      ageNormJson: map['age_norm_json'],
      isSynced: map['is_synced'] == 1,
    );
  }

  // Create from analysis results
  factory ScanRecord.fromAnalysis({
    required PatientInfo patient,
    required DateTime date,
    String? rightPath,
    String? leftPath,
    EyeAnalysisResult? rightResult,
    EyeAnalysisResult? leftResult,
    AnisocoriaAssessment? anisocoria,
    AgeNormAssessment? ageNorm,
  }) {
    return ScanRecord(
      patientName: patient.name,
      patientSex: patient.sexString,
      patientAge: patient.age,
      complaints: patient.mainComplaints,
      scanDate: date,
      rightEyePath: rightPath,
      leftEyePath: leftPath,
      rightEyeJson: rightResult != null ? jsonEncode(rightResult.toJson()) : null,
      leftEyeJson: leftResult != null ? jsonEncode(leftResult.toJson()) : null,
      anisocoriaJson: anisocoria != null ? jsonEncode(anisocoria.toJson()) : null,
      ageNormJson: ageNorm != null ? jsonEncode({
        'ageGroup': ageNorm.ageGroup,
        'expectedRange': ageNorm.expectedRange,
        'measuredMm': ageNorm.measuredDiameter,
        'status': ageNorm.status.name,
        'interpretation': ageNorm.interpretation,
      }) : null,
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    const String dbFileName = 'bexel_scans.db';
    final String dbPath = await _getDbPath(dbFileName);

    // Optional: Log the resolved path for debugging installed versions
    debugPrint('Opening/creating database at: $dbPath');
    // await logToFile('Database path: $dbPath');  // Uncomment if you import logToFile

    _database = await _initDB(dbPath);
    return _database!;
  }

  /// Returns a reliable, writable absolute path using ApplicationSupportDirectory
  /// This works consistently on desktop (Windows/macOS/Linux) even after installation
  Future<String> _getDbPath(String fileName) async {
    final Directory supportDir = await getApplicationSupportDirectory();

    // Ensure the directory exists (redundant with main.dart but safe)
    if (!await supportDir.exists()) {
      await supportDir.create(recursive: true);
    }

    return join(supportDir.path, fileName);
  }

  Future<Database> _initDB(String path) async {
    // Optional: Copy pre-populated database from assets on first run
    // Useful if you have a "built-in" reference database with initial data
    // 1. Place your initial .db file in assets/database/bexel_scans.db
    // 2. Add to pubspec.yaml: assets: [assets/database/bexel_scans.db]
    // 3. Uncomment the block below
    /*
    final bool exists = await databaseExists(path);
    if (!exists) {
      debugPrint('Database not found – copying from assets');
      try {
        final ByteData data = await rootBundle.load('assets/database/bexel_scans.db');
        final List<int> bytes = data.buffer.asUint8List();
        await File(path).writeAsBytes(bytes, flush: true);
        debugPrint('Built-in database copied successfully');
      } catch (e) {
        debugPrint('Failed to copy built-in database from assets: $e');
        // Continue – will create empty DB via onCreate
      }
    }
    */

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      // Optional: Add onUpgrade for future schema changes
      onUpgrade: (db, oldVersion, newVersion) async {
        debugPrint('Database upgrade from $oldVersion to $newVersion');
        // Add migration logic here if needed in the future
      },
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE scans (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        patient_name TEXT NOT NULL,
        patient_sex TEXT NOT NULL,
        patient_age INTEGER NOT NULL,
        complaints TEXT,
        scan_date TEXT NOT NULL,
        right_eye_path TEXT,
        left_eye_path TEXT,
        right_eye_json TEXT,
        left_eye_json TEXT,
        anisocoria_json TEXT,
        age_norm_json TEXT,
        is_synced INTEGER DEFAULT 0
      )
    ''');

    // Indexes for performance
    await db.execute('CREATE INDEX idx_patient_name ON scans(patient_name)');
    await db.execute('CREATE INDEX idx_scan_date ON scans(scan_date)');
  }

  // INSERT a new scan
  Future<int> insertScan(ScanRecord scan) async {
    final db = await database;
    return await db.insert('scans', scan.toMap());
  }

  // GET all scans (most recent first)
  Future<List<ScanRecord>> getAllScans() async {
    final db = await database;
    final result = await db.query('scans', orderBy: 'scan_date DESC');
    return result.map((map) => ScanRecord.fromMap(map)).toList();
  }

  // GET scans for a specific patient
  Future<List<ScanRecord>> getScansForPatient(String name) async {
    final db = await database;
    final result = await db.query(
      'scans',
      where: 'patient_name LIKE ?',
      whereArgs: ['%$name%'],
      orderBy: 'scan_date DESC',
    );
    return result.map((map) => ScanRecord.fromMap(map)).toList();
  }

  // GET single scan by ID
  Future<ScanRecord?> getScan(int id) async {
    final db = await database;
    final result = await db.query('scans', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return ScanRecord.fromMap(result.first);
    }
    return null;
  }

  // GET recent scans (last N)
  Future<List<ScanRecord>> getRecentScans({int limit = 10}) async {
    final db = await database;
    final result = await db.query('scans', orderBy: 'scan_date DESC', limit: limit);
    return result.map((map) => ScanRecord.fromMap(map)).toList();
  }

  // GET scan count
  Future<int> getScanCount() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM scans');
    return result.first['count'] as int;
  }

  // DELETE a scan
  Future<int> deleteScan(int id) async {
    final db = await database;
    return await db.delete('scans', where: 'id = ?', whereArgs: [id]);
  }

  // DELETE all scans
  Future<int> deleteAllScans() async {
    final db = await database;
    return await db.delete('scans');
  }

  // UPDATE sync status
  Future<int> markAsSynced(int id) async {
    final db = await database;
    return await db.update('scans', {'is_synced': 1}, where: 'id = ?', whereArgs: [id]);
  }

  // GET unsynced scans (for future cloud sync)
  Future<List<ScanRecord>> getUnsyncedScans() async {
    final db = await database;
    final result = await db.query('scans', where: 'is_synced = ?', whereArgs: [0]);
    return result.map((map) => ScanRecord.fromMap(map)).toList();
  }

  // SEARCH scans
  Future<List<ScanRecord>> searchScans(String query) async {
    final db = await database;
    final result = await db.query(
      'scans',
      where: 'patient_name LIKE ? OR complaints LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
      orderBy: 'scan_date DESC',
    );
    return result.map((map) => ScanRecord.fromMap(map)).toList();
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;  // Allow re-opening if needed
  }
}