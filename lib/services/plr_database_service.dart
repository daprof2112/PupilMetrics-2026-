// lib/services/plr_database_service.dart
// PLR History Database Service
// Stores PLR analysis results alongside static pupil analyses

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ai_eye_capture/models/plr_history_model.dart';

class PLRDatabaseService {
  static final PLRDatabaseService _instance = PLRDatabaseService._internal();
  factory PLRDatabaseService() => _instance;
  PLRDatabaseService._internal();

  static Database? _database;
  static const String _tableName = 'plr_history';
  static const int _dbVersion = 1;

  /// Get database instance (creates if needed)
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initialize the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'plr_history.db');

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// Create tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT NOT NULL,
        patient_name TEXT NOT NULL,
        patient_age INTEGER,
        patient_sex TEXT,
        is_right_eye INTEGER NOT NULL,
        video_path TEXT,
        total_frames INTEGER NOT NULL,
        successful_frames INTEGER NOT NULL,
        baseline_pupil_ratio REAL,
        min_pupil_ratio REAL,
        plr_magnitude REAL,
        plr_constriction_percent REAL,
        plr_detected INTEGER NOT NULL,
        frame_data_json TEXT,
        average_confidence REAL NOT NULL,
        overall_grade TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // Index for faster queries
    await db.execute('CREATE INDEX idx_plr_timestamp ON $_tableName(timestamp DESC)');
    await db.execute('CREATE INDEX idx_plr_patient ON $_tableName(patient_name)');

    print('[PLR DB] Database created successfully');
  }

  /// Handle database upgrades
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Future migrations go here
    print('[PLR DB] Upgraded from v$oldVersion to v$newVersion');
  }

  // ============================================================
  // CRUD OPERATIONS
  // ============================================================

  /// Insert a new PLR record
  Future<int> insertRecord(PLRHistoryRecord record) async {
    final db = await database;
    final id = await db.insert(_tableName, record.toMap());
    print('[PLR DB] Inserted record with ID: $id');
    return id;
  }

  /// Get all records (newest first)
  Future<List<PLRHistoryRecord>> getAllRecords() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: 'timestamp DESC',
    );
    return maps.map((map) => PLRHistoryRecord.fromMap(map)).toList();
  }

  /// Get records for a specific patient
  Future<List<PLRHistoryRecord>> getRecordsByPatient(String patientName) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      where: 'patient_name = ?',
      whereArgs: [patientName],
      orderBy: 'timestamp DESC',
    );
    return maps.map((map) => PLRHistoryRecord.fromMap(map)).toList();
  }

  /// Get a single record by ID
  Future<PLRHistoryRecord?> getRecordById(int id) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return PLRHistoryRecord.fromMap(maps.first);
  }

  /// Get recent records (last N days)
  Future<List<PLRHistoryRecord>> getRecentRecords({int days = 7}) async {
    final db = await database;
    final cutoff = DateTime.now().subtract(Duration(days: days)).toIso8601String();
    final maps = await db.query(
      _tableName,
      where: 'timestamp >= ?',
      whereArgs: [cutoff],
      orderBy: 'timestamp DESC',
    );
    return maps.map((map) => PLRHistoryRecord.fromMap(map)).toList();
  }

  /// Delete a record
  Future<int> deleteRecord(int id) async {
    final db = await database;
    final count = await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    print('[PLR DB] Deleted $count record(s) with ID: $id');
    return count;
  }

  /// Delete all records for a patient
  Future<int> deleteRecordsByPatient(String patientName) async {
    final db = await database;
    final count = await db.delete(
      _tableName,
      where: 'patient_name = ?',
      whereArgs: [patientName],
    );
    print('[PLR DB] Deleted $count record(s) for patient: $patientName');
    return count;
  }

  /// Clear all records
  Future<int> clearAllRecords() async {
    final db = await database;
    final count = await db.delete(_tableName);
    print('[PLR DB] Cleared $count records');
    return count;
  }

  // ============================================================
  // STATISTICS
  // ============================================================

  /// Get history statistics
  Future<PLRHistoryStats> getStats() async {
    final db = await database;

    // Total scans
    final totalResult = await db.rawQuery('SELECT COUNT(*) as count FROM $_tableName');
    final totalScans = Sqflite.firstIntValue(totalResult) ?? 0;

    // Scans this week
    final weekAgo = DateTime.now().subtract(const Duration(days: 7)).toIso8601String();
    final weekResult = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $_tableName WHERE timestamp >= ?',
      [weekAgo],
    );
    final scansThisWeek = Sqflite.firstIntValue(weekResult) ?? 0;

    // Unique patients
    final patientResult = await db.rawQuery(
      'SELECT COUNT(DISTINCT patient_name) as count FROM $_tableName',
    );
    final totalPatients = Sqflite.firstIntValue(patientResult) ?? 0;

    // PLR detected count
    final detectedResult = await db.rawQuery(
      'SELECT COUNT(*) as count FROM $_tableName WHERE plr_detected = 1',
    );
    final plrDetectedCount = Sqflite.firstIntValue(detectedResult) ?? 0;

    // Average PLR magnitude
    final avgResult = await db.rawQuery(
      'SELECT AVG(plr_magnitude) as avg FROM $_tableName WHERE plr_magnitude IS NOT NULL',
    );
    final avgMagnitude = (avgResult.first['avg'] as double?) ?? 0.0;

    return PLRHistoryStats(
      totalScans: totalScans,
      scansThisWeek: scansThisWeek,
      totalPatients: totalPatients,
      plrDetectedCount: plrDetectedCount,
      averagePlrMagnitude: avgMagnitude,
    );
  }

  /// Search records
  Future<List<PLRHistoryRecord>> searchRecords(String query) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      where: 'patient_name LIKE ?',
      whereArgs: ['%$query%'],
      orderBy: 'timestamp DESC',
    );
    return maps.map((map) => PLRHistoryRecord.fromMap(map)).toList();
  }

  /// Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}