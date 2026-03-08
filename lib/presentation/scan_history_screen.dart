// lib/presentation/scan_history_screen.dart
// View and manage scan history from database - WITH PLATFORM-SPECIFIC PLR TAB
// v5.2.8 - Desktop hides PLR tab (no iriscope flash capability)

import 'dart:io';
import 'dart:convert';
import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/database_helper.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/models/plr_history_model.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_localizations.dart';
import 'package:ai_eye_capture/services/plr_database_service.dart';

class ScanHistoryScreen extends StatefulWidget {
  const ScanHistoryScreen({super.key});

  @override
  State<ScanHistoryScreen> createState() => _ScanHistoryScreenState();
}

class _ScanHistoryScreenState extends State<ScanHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Platform detection - PLR only available on mobile (needs flash)
  bool get _isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  bool get _showPLRTab => !_isDesktop;

  List<ScanRecord> _scans = [];
  bool _isLoadingScans = true;
  String _scanSearchQuery = '';
  final _scanSearchController = TextEditingController();

  List<PLRHistoryRecord> _plrRecords = [];
  PLRHistoryStats? _plrStats;
  bool _isLoadingPLR = true;
  String _plrSearchQuery = '';
  final _plrSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Only create 2 tabs if PLR is available (mobile), otherwise just 1 tab (desktop)
    _tabController = TabController(length: _showPLRTab ? 2 : 1, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          _loadScans();
        } else if (_showPLRTab) {
          _loadPLRRecords();
        }
      }
    });
    _loadScans();
    if (_showPLRTab) {
      _loadPLRRecords();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scanSearchController.dispose();
    _plrSearchController.dispose();
    super.dispose();
  }

  Future<void> _loadScans() async {
    setState(() => _isLoadingScans = true);
    try {
      final scans = _scanSearchQuery.isEmpty
          ? await DatabaseHelper.instance.getAllScans()
          : await DatabaseHelper.instance.searchScans(_scanSearchQuery);
      setState(() {
        _scans = scans;
        _isLoadingScans = false;
      });
    } catch (e) {
      setState(() => _isLoadingScans = false);
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.errorLoadingImages(e.toString())), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _deleteScan(ScanRecord scan) async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        title: Text(l10n.deleteScan, style: const TextStyle(color: Colors.white)),
        content: Text(
          l10n.deleteScanConfirm(scan.patientName, DateFormat('MMM dd, yyyy').format(scan.scanDate)),
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.delete, style: const TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true && scan.id != null) {
      await DatabaseHelper.instance.deleteScan(scan.id!);
      _loadScans();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.scanDeleted), backgroundColor: Colors.orange),
        );
      }
    }
  }

  void _viewResults(ScanRecord scan) {
    final l10n = AppLocalizations.of(context)!;
    final hasRightEye = scan.rightEyePath != null && File(scan.rightEyePath!).existsSync();
    final hasLeftEye = scan.leftEyePath != null && File(scan.leftEyePath!).existsSync();

    if (!hasRightEye && !hasLeftEye) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.originalImagesNotFound), backgroundColor: Colors.orange),
      );
      return;
    }

    final patientInfo = PatientInfo(
      name: scan.patientName,
      sex: scan.patientSex.toLowerCase() == 'male' ? Sex.male : Sex.female,
      age: scan.patientAge,
      mainComplaints: scan.complaints,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScanResultsViewer(
          scan: scan,
          patientInfo: patientInfo,
          hasRightEye: hasRightEye,
          hasLeftEye: hasLeftEye,
        ),
      ),
    );
  }

  Future<void> _loadPLRRecords() async {
    if (!_showPLRTab) return; // Skip on desktop

    setState(() => _isLoadingPLR = true);
    try {
      final db = PLRDatabaseService();
      final records = _plrSearchQuery.isEmpty
          ? await db.getAllRecords()
          : await db.searchRecords(_plrSearchQuery);
      final stats = await db.getStats();
      setState(() {
        _plrRecords = records;
        _plrStats = stats;
        _isLoadingPLR = false;
      });
    } catch (e) {
      setState(() => _isLoadingPLR = false);
      debugPrint('[PLR History] Error: $e');
    }
  }

  Future<void> _deletePLRRecord(PLRHistoryRecord record) async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        title: Text(l10n.deleteRecord, style: const TextStyle(color: Colors.white)),
        content: Text(
          l10n.deleteRecordConfirm(record.patientName, record.eyeShort),
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.delete, style: const TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true && record.id != null) {
      final db = PLRDatabaseService();
      await db.deleteRecord(record.id!);
      _loadPLRRecords();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.recordDeleted), backgroundColor: Colors.orange),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.scanHistory, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              _loadScans();
              if (_showPLRTab) _loadPLRRecords();
            },
          ),
        ],
        // Only show TabBar if PLR tab is available (mobile)
        bottom: _showPLRTab ? TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00D9FF),
          indicatorWeight: 3,
          labelColor: const Color(0xFF00D9FF),
          unselectedLabelColor: Colors.white54,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt, size: 18),
                  const SizedBox(width: 8),
                  Text(l10n.staticScans),
                  if (_scans.isNotEmpty) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('${_scans.length}', style: const TextStyle(fontSize: 10)),
                    ),
                  ],
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.videocam, size: 18),
                  const SizedBox(width: 8),
                  Text(l10n.plrScans),
                  if (_plrRecords.isNotEmpty) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('${_plrRecords.length}', style: const TextStyle(fontSize: 10)),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ) : null, // No TabBar on desktop - just show Static scans
      ),
      // Use TabBarView only if PLR tab available, otherwise just show Static tab
      body: _showPLRTab
        ? TabBarView(
            controller: _tabController,
            children: [
              _buildStaticTab(l10n),
              _buildPLRTab(l10n),
            ],
          )
        : _buildStaticTab(l10n), // Desktop: just show Static tab directly
    );
  }

  Widget _buildStaticTab(AppLocalizations l10n) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _scanSearchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: l10n.searchByNameOrComplaints,
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF00D9FF)),
              suffixIcon: _scanSearchQuery.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.white54),
                onPressed: () {
                  _scanSearchController.clear();
                  setState(() => _scanSearchQuery = '');
                  _loadScans();
                },
              )
                  : null,
              filled: true,
              fillColor: const Color(0xFF1D1E33),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              setState(() => _scanSearchQuery = value);
              _loadScans();
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem(Icons.assignment, '${_scans.length}', l10n.totalScans, Colors.cyan),
              _statItem(Icons.today, '${_scans.where((s) => s.scanDate.isAfter(DateTime.now().subtract(const Duration(days: 7)))).length}', l10n.thisWeek, Colors.blue),
              _statItem(Icons.person, '${_scans.map((s) => s.patientName).toSet().length}', l10n.patients, Colors.green),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _isLoadingScans
              ? const Center(child: CircularProgressIndicator(color: Color(0xFF00D9FF)))
              : _scans.isEmpty
              ? _buildEmptyState(l10n.noScansYet, l10n.completedScansAppearHere, Icons.camera_alt)
              : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _scans.length,
            itemBuilder: (ctx, i) => _buildScanCard(_scans[i], l10n),
          ),
        ),
      ],
    );
  }

  Widget _buildPLRTab(AppLocalizations l10n) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _plrSearchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: l10n.searchPlrRecords,
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon: const Icon(Icons.search, color: Colors.purple),
              suffixIcon: _plrSearchQuery.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.white54),
                onPressed: () {
                  _plrSearchController.clear();
                  setState(() => _plrSearchQuery = '');
                  _loadPLRRecords();
                },
              )
                  : null,
              filled: true,
              fillColor: const Color(0xFF1D1E33),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              setState(() => _plrSearchQuery = value);
              _loadPLRRecords();
            },
          ),
        ),
        if (_plrStats != null)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purple.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _statItem(Icons.videocam, '${_plrStats!.totalScans}', l10n.plrScans, Colors.purple),
                _statItem(Icons.calendar_today, '${_plrStats!.scansThisWeek}', l10n.thisWeek, Colors.blue),
                _statItem(Icons.check_circle, '${_plrStats!.detectionRate.toStringAsFixed(0)}%', l10n.detected, Colors.green),
                _statItem(Icons.show_chart, '${_plrStats!.averagePlrMagnitude.toStringAsFixed(1)}%', l10n.avgPlr, Colors.orange),
              ],
            ),
          ),
        const SizedBox(height: 16),
        Expanded(
          child: _isLoadingPLR
              ? const Center(child: CircularProgressIndicator(color: Colors.purple))
              : _plrRecords.isEmpty
              ? _buildEmptyState(l10n.noPlrRecordsYet, l10n.recordPlrVideoToSeeHistory, Icons.videocam_off)
              : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _plrRecords.length,
            itemBuilder: (ctx, i) => _buildPLRCard(_plrRecords[i], l10n),
          ),
        ),
      ],
    );
  }

  Widget _statItem(IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
      ],
    );
  }

  Widget _buildEmptyState(String title, String subtitle, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 18)),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(color: Colors.white38, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildScanCard(ScanRecord scan, AppLocalizations l10n) {
    final dateStr = DateFormat('MMM dd, yyyy HH:mm').format(scan.scanDate);
    final isMale = scan.patientSex.toLowerCase() == 'male';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showScanDetails(scan, l10n),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(isMale ? Icons.male : Icons.female, color: isMale ? Colors.blue : Colors.pink, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(scan.patientName, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('${scan.patientAge} ${l10n.years} • $dateStr', style: const TextStyle(color: Colors.white54, fontSize: 12)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    if (scan.rightEyePath != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                        child: Text(l10n.od, style: const TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    const SizedBox(width: 4),
                    if (scan.leftEyePath != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                        child: Text(l10n.os, style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                  onPressed: () => _deleteScan(scan),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPLRCard(PLRHistoryRecord record, AppLocalizations l10n) {
    final dateStr = DateFormat('MMM dd, yyyy HH:mm').format(record.timestamp);
    final plrStatus = record.plrDetected;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showPLRDetails(record, l10n),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: plrStatus ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    plrStatus ? Icons.visibility : Icons.visibility_off,
                    color: plrStatus ? Colors.green : Colors.orange,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(record.patientName, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(dateStr, style: const TextStyle(color: Colors.white54, fontSize: 11)),
                      const SizedBox(height: 2),
                      Text(
                        '${l10n.plr}: ${record.plrMagnitude?.toStringAsFixed(1) ?? l10n.na}%  •  ${l10n.confidence}: ${(record.averageConfidence * 100).toStringAsFixed(0)}%',
                        style: TextStyle(color: plrStatus ? Colors.green : Colors.orange, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: record.isRightEye ? Colors.cyan.withOpacity(0.2) : Colors.pink.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(record.eyeShort, style: TextStyle(color: record.isRightEye ? Colors.cyan : Colors.pink, fontWeight: FontWeight.bold, fontSize: 10)),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                          child: Text(l10n.plr, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 10)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () => _deletePLRRecord(record),
                      child: const Icon(Icons.delete_outline, color: Colors.red, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FIXED: Static Scan Details - No border artifacts
  // ============================================================
  void _showScanDetails(ScanRecord scan, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1D1E33),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) {
        final screenHeight = MediaQuery.of(context).size.height;
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight * 0.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye, color: Color(0xFF00D9FF), size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        scan.patientName,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white54),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
                const Divider(color: Colors.white24, height: 20),

                // Details
                _detailRow(l10n.date, DateFormat('MMMM dd, yyyy HH:mm').format(scan.scanDate)),
                _detailRow(l10n.ageYears, '${scan.patientAge} ${l10n.years}'),
                _detailRow(l10n.sex, scan.patientSex),
                _detailRow(l10n.eye, '${scan.rightEyePath != null ? l10n.od : ""}${scan.rightEyePath != null && scan.leftEyePath != null ? " + " : ""}${scan.leftEyePath != null ? l10n.os : ""}'),

                const SizedBox(height: 20),

                // Buttons - NO BORDERS to avoid rendering artifacts
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(ctx);
                          _viewResults(scan);
                        },
                        icon: const Icon(Icons.visibility, size: 20),
                        label: Text(l10n.viewResults),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D9FF),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(ctx);
                          _deleteScan(scan);
                        },
                        icon: const Icon(Icons.delete, size: 20),
                        label: Text(l10n.delete),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.withOpacity(0.15),
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // FIXED: PLR Details - No border artifacts during scroll
  // ============================================================
  void _showPLRDetails(PLRHistoryRecord record, AppLocalizations l10n) {
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1D1E33),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => SizedBox(
        height: screenHeight * 0.65,
        child: Column(
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 12, 0),
              child: Row(
                children: [
                  const Icon(Icons.videocam, color: Colors.purple, size: 26),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l10n.plrAnalysis(record.eyeLabel),
                      style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white54),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white24, height: 16),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _detailRow(l10n.patient, record.patientName),
                    _detailRow(l10n.date, DateFormat('MMMM dd, yyyy HH:mm').format(record.timestamp)),
                    _detailRow(l10n.eye, record.eyeLabel),
                    const SizedBox(height: 8),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 8),
                    _detailRow(l10n.frames, '${record.successfulFrames}/${record.totalFrames}'),
                    _detailRow(l10n.baselinePiRatio, '${record.baselinePupilRatio?.toStringAsFixed(1) ?? l10n.na}%'),
                    _detailRow(l10n.minPiRatio, '${record.minPupilRatio?.toStringAsFixed(1) ?? l10n.na}%'),
                    _detailRow(l10n.plrMagnitude, '${record.plrMagnitude?.toStringAsFixed(1) ?? l10n.na}%'),
                    _detailRow(l10n.constriction, '${record.plrConstrictionPercent?.toStringAsFixed(1) ?? l10n.na}%'),
                    const SizedBox(height: 8),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 12),

                    // PLR Status - NO BORDER to avoid scroll artifacts
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: record.plrDetected ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(record.plrDetected ? Icons.check_circle : Icons.cancel, color: record.plrDetected ? Colors.green : Colors.orange, size: 22),
                          const SizedBox(width: 8),
                          Text(
                            record.plrDetected ? l10n.plrDetected : l10n.plrWeakNotDetected,
                            style: TextStyle(color: record.plrDetected ? Colors.green : Colors.orange, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    _detailRow(l10n.confidence, '${(record.averageConfidence * 100).toStringAsFixed(0)}%'),
                    _detailRow(l10n.grade, record.overallGrade),
                    const SizedBox(height: 20),

                    // Delete button - NO BORDER, use filled background
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(ctx);
                          _deletePLRRecord(record);
                        },
                        icon: const Icon(Icons.delete, size: 20),
                        label: Text(l10n.deleteRecord),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.withOpacity(0.15),
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 110, child: Text(label, style: const TextStyle(color: Colors.white54, fontSize: 13))),
          Expanded(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}

// ============================================================================
// ENHANCED ScanResultsViewer with full analysis display
// (Keep the rest of ScanResultsViewer class unchanged from original)
// ============================================================================

// ============================================================================
// ENHANCED ScanResultsViewer - Add to end of scan_history_screen.dart
// Replaces the existing ScanResultsViewer class
// Now includes full ANW assessment display like analysis_screen.dart
// ============================================================================

class ScanResultsViewer extends StatefulWidget {
  final ScanRecord scan;
  final PatientInfo patientInfo;
  final bool hasRightEye;
  final bool hasLeftEye;

  const ScanResultsViewer({
    super.key,
    required this.scan,
    required this.patientInfo,
    required this.hasRightEye,
    required this.hasLeftEye,
  });

  @override
  State<ScanResultsViewer> createState() => _ScanResultsViewerState();
}

class _ScanResultsViewerState extends State<ScanResultsViewer> {
  EyeAnalysisResult? _rightResult;
  EyeAnalysisResult? _leftResult;
  AnisocoriaAssessment? _anisocoria;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  void _loadResults() {
    try {
      if (widget.scan.rightEyeJson != null) {
        final json = jsonDecode(widget.scan.rightEyeJson!);
        _rightResult = EyeAnalysisResult.fromJson(json);
      }
      if (widget.scan.leftEyeJson != null) {
        final json = jsonDecode(widget.scan.leftEyeJson!);
        _leftResult = EyeAnalysisResult.fromJson(json);
      }
      if (widget.scan.anisocoriaJson != null) {
        final json = jsonDecode(widget.scan.anisocoriaJson!);
        _anisocoria = AnisocoriaAssessment.fromJson(json);
      }
    } catch (e) {
      debugPrint('Error loading results: $e');
    }
    setState(() => _isLoading = false);
  }

  Color _gradeColor(String grade) => grade == 'A' ? Colors.green : grade == 'B' ? Colors.lightGreen : grade == 'C' ? Colors.orange : Colors.red;
  Color _ratioColor(double r) => (r < 15 || r > 40) ? Colors.orange : Colors.green;

  String _ratioInterp(double r, AppLocalizations l10n) =>
      r < 15 ? l10n.miosis : r < 20 ? l10n.constricted : r <= 30 ? l10n.normal : r <= 40 ? l10n.dilated : l10n.mydriasis;

  String _getConfidenceLabel(double confidence, AppLocalizations l10n) =>
      confidence >= 0.8 ? l10n.high : confidence >= 0.6 ? l10n.good : confidence >= 0.4 ? l10n.fair : l10n.low;

  String _capitalize(String text) => text.isEmpty ? text : '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';

  // ANW status color helper
  Color _anwStatusColor(ANWRatioStatus status) {
    switch (status) {
      case ANWRatioStatus.spastic: return Colors.blue;
      case ANWRatioStatus.normal: return Colors.green;
      case ANWRatioStatus.atonic: return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.scan.patientName, style: const TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF00D9FF)))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPatientCard(l10n),
            const SizedBox(height: 16),
            _buildEyeImagesRow(l10n),
            const SizedBox(height: 16),
            if (_anisocoria != null && _anisocoria!.severity != AnisocoriaSeverity.none) ...[
              _buildAnisocoriaCard(l10n),
              const SizedBox(height: 16),
            ],
            if (_rightResult != null) ...[
              _buildEyeResultCard(l10n.rightEyeOD, _rightResult!, Colors.blue, isRightEye: true, l10n: l10n),
              const SizedBox(height: 16),
            ],
            if (_leftResult != null) ...[
              _buildEyeResultCard(l10n.leftEyeOS, _leftResult!, Colors.green, isRightEye: false, l10n: l10n),
              const SizedBox(height: 16),
            ],
            // Bilateral comparison if both eyes present
            if (_rightResult != null && _leftResult != null) ...[
              _buildComparisonCard(l10n),
              const SizedBox(height: 16),
            ],
            if (_rightResult == null && _leftResult == null)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange.withOpacity(0.3))),
                child: Row(children: [const Icon(Icons.info_outline, color: Colors.orange), const SizedBox(width: 12), Expanded(child: Text(l10n.analysisFailed('Results not saved'), style: const TextStyle(color: Colors.orange)))]),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(AppLocalizations l10n) {
    final isMale = widget.patientInfo.sex == Sex.male;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1D1E33), borderRadius: BorderRadius.circular(12), border: Border.all(color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.3))),
      child: Row(children: [
        Container(width: 50, height: 50, decoration: BoxDecoration(color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.2), shape: BoxShape.circle), child: Icon(isMale ? Icons.male : Icons.female, color: isMale ? Colors.blue : Colors.pink, size: 28)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.patientInfo.name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text('${widget.patientInfo.age} ${l10n.years} • ${widget.patientInfo.sexString}', style: const TextStyle(color: Colors.white54)),
            Text(DateFormat('MMM dd, yyyy HH:mm').format(widget.scan.scanDate), style: const TextStyle(color: Colors.white38, fontSize: 12)),
          ]),
        ),
      ]),
    );
  }

  Widget _buildEyeImagesRow(AppLocalizations l10n) {
    return Row(children: [
      if (widget.hasRightEye) Expanded(child: _buildEyeImageCard(l10n.od, widget.scan.rightEyePath!, Colors.blue)),
      if (widget.hasRightEye && widget.hasLeftEye) const SizedBox(width: 12),
      if (widget.hasLeftEye) Expanded(child: _buildEyeImageCard(l10n.os, widget.scan.leftEyePath!, Colors.green)),
    ]);
  }

  Widget _buildEyeImageCard(String label, String path, Color color) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: color, width: 2)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
            child: Center(child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold))),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
            child: Container(
              height: 140,
              width: double.infinity,
              color: Colors.black,
              child: Image.file(File(path), fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnisocoriaCard(AppLocalizations l10n) {
    final severityName = _anisocoria!.severity.name;
    final color = severityName.toLowerCase() == 'none' ? Colors.green : severityName.toLowerCase() == 'mild' ? Colors.yellow : severityName.toLowerCase() == 'moderate' ? Colors.orange : Colors.red;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1D1E33), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(l10n.anisocoria, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const Spacer(),
          Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)), child: Text(_capitalize(severityName), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
        ]),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _metricItem(l10n.od, '${_anisocoria!.odRatio.toStringAsFixed(1)}%', Colors.blue),
          _metricItem(l10n.diff, '${_anisocoria!.difference.toStringAsFixed(1)}%', color),
          _metricItem(l10n.os, '${_anisocoria!.osRatio.toStringAsFixed(1)}%', Colors.green),
        ]),
      ]),
    );
  }

  Widget _metricItem(String label, String value, Color color) {
    return Column(children: [
      Text(label, style: TextStyle(color: color, fontSize: 12)),
      Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
    ]);
  }

  Widget _buildEyeResultCard(String title, EyeAnalysisResult result, Color color, {required bool isRightEye, required AppLocalizations l10n}) {
    final localizer = PupilAnalyzerLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1D1E33), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.remove_red_eye, color: color, size: 24),
          const SizedBox(width: 8),
          Text(title, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
          const Spacer(),
          Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: _gradeColor(result.grade), borderRadius: BorderRadius.circular(20)), child: Text('${l10n.grade} ${result.grade}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
        ]),
        const Divider(color: Colors.white24, height: 24),

        // Core measurements
        _buildMeasRow(l10n.piRatio, '${result.pupilIrisRatio.toStringAsFixed(1)}%', _ratioColor(result.pupilIrisRatio), _ratioInterp(result.pupilIrisRatio, l10n)),
        _buildMeasRow(l10n.ellipseness, '${result.ellipseness.toStringAsFixed(1)}%', result.ellipseness >= 95 ? Colors.green : Colors.orange, result.ellipseness >= 95 ? l10n.normal : l10n.elliptical),
        _buildMeasRow(l10n.circularity, '${result.circularity.toStringAsFixed(1)}%', result.circularity >= 90 ? Colors.green : Colors.orange, result.circularity >= 90 ? l10n.circular : l10n.irregular),
        _buildMeasRow(l10n.decentralization, '${result.decentration.toStringAsFixed(1)}%', result.decentration < 3 ? Colors.green : Colors.orange, result.decentration < 3 ? l10n.centered : l10n.offset),

        // ANW Ratio (simple)
        if (result.anwRatio != null)
          _buildMeasRow(l10n.anwRatio, '${result.anwRatio!.toStringAsFixed(1)}%', Colors.cyan, result.anwRatio! < 25 ? l10n.anwSpastic : result.anwRatio! <= 35 ? l10n.normal : l10n.anwAtonic),

        _buildMeasRow(l10n.confidence, '${(result.confidence * 100).toStringAsFixed(0)}%', result.confidence >= 0.7 ? Colors.green : Colors.orange, _getConfidenceLabel(result.confidence, l10n)),

        // Pupil Form Assessment
        if (result.ellipseAssessment != null) ...[
          const SizedBox(height: 12),
          _buildPupilFormCard(result.ellipseAssessment!, localizer, l10n),
        ],

        // Decentration Pattern
        if (result.decentrationAssessment != null && result.decentrationAssessment!.pattern != DecentrationPattern.centered) ...[
          const SizedBox(height: 8),
          _buildDecentrationCard(result.decentrationAssessment!, localizer, isRightEye, l10n),
        ],

        // Flattenings
        if (result.flattenings.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildAnomaliesCard(l10n.flattenings, result.flattenings, Colors.blue, localizer, isRightEye, l10n),
        ],

        // Protrusions
        if (result.protrusions.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildAnomaliesCard(l10n.protrusions, result.protrusions, Colors.orange, localizer, isRightEye, l10n),
        ],

        // FULL ANW ASSESSMENT (NEW!)
        if (result.anwAssessment != null) ...[
          const SizedBox(height: 12),
          _buildANWAssessmentCard(result.anwAssessment!, isRightEye, l10n),
        ],
      ]),
    );
  }

  // ============================================================================
  // ANW ASSESSMENT CARD - Full display like analysis_screen.dart
  // ============================================================================
  Widget _buildANWAssessmentCard(ANWAssessment anw, bool isRightEye, AppLocalizations l10n) {
    final statusColor = _anwStatusColor(anw.ratioStatus);
    final eyeCode = isRightEye ? 'D' : 'S';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.cyan.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.withOpacity(0.5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Icon(Icons.trip_origin, color: Colors.cyan, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(l10n.anwTitle, style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: anw.isOverallNormal ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(anw.isOverallNormal ? l10n.normal : l10n.anwAbnormal, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Metrics
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _anwMetricColumn(l10n.anwDiameter, '${anw.diameterPx.toStringAsFixed(0)} px'),
                Container(width: 1, height: 30, color: Colors.white24),
                _anwMetricColumn(l10n.anwPerimeter, '${anw.perimeterPx.toStringAsFixed(0)} px'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Parameters
          _buildANWParameterRow(l10n.anwRatio, '${anw.ratio.toStringAsFixed(1)}%', anw.ratioStatusLabel, statusColor, anw.isRatioNormal),
          _buildANWParameterRow(l10n.anwAsymmetry, '${anw.asymmetryPercent.toStringAsFixed(1)}%', anw.isAsymmetryNormal ? l10n.normal : l10n.anwElevated, anw.isAsymmetryNormal ? Colors.green : Colors.orange, anw.isAsymmetryNormal),
          _buildANWParameterRow(l10n.anwFormType, anw.formTypeName, anw.isFormNormal ? l10n.normal : l10n.anwAbnormal, anw.isFormNormal ? Colors.green : Colors.orange, anw.isFormNormal),

          // Tonic State
          if (anw.tonicState != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: statusColor.withOpacity(0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.psychology, color: statusColor, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text('${l10n.anwTonicState}: ${anw.tonicState}', style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12))),
                    ],
                  ),
                  if (anw.tonicStateDescription.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(anw.tonicStateDescription, style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3)),
                  ],
                ],
              ),
            ),
          ],

          // Shift Detection
          if (anw.hasShift && anw.primaryShift != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.deepOrange.withOpacity(0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.call_made, color: Colors.deepOrange, size: 18),
                      const SizedBox(width: 8),
                      Text(l10n.anwShiftDetected, style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(8)),
                        child: Text(anw.primaryShift!.zoneName, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('$eyeCode: ${anw.primaryShift!.zoneName} shift.', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                  if (anw.primaryShift!.clinicalAssociation.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(anw.primaryShift!.clinicalAssociation, style: const TextStyle(color: Colors.white60, fontSize: 11, fontStyle: FontStyle.italic)),
                  ],
                ],
              ),
            ),
          ],

          // Constriction Detection
          if (anw.hasConstrictions) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withOpacity(0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.call_received, color: Colors.blue, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(l10n.anwConstrictionDetected, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12))),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('$eyeCode: ${anw.constrictionString}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ],

          // Bexel Findings
          if (anw.bexelFindings.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${l10n.anwFindings}:', style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 11)),
                  const SizedBox(height: 6),
                  ...anw.bexelFindings.map((finding) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(finding, style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3)),
                  )),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _anwMetricColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildANWParameterRow(String label, String value, String status, Color statusColor, bool isNormal) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12))),
          Expanded(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: statusColor.withOpacity(0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isNormal ? Icons.check : Icons.warning, color: statusColor, size: 12),
                const SizedBox(width: 4),
                Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bilateral Comparison Card
  Widget _buildComparisonCard(AppLocalizations l10n) {
    final pDiff = (_rightResult!.pupilIrisRatio - _leftResult!.pupilIrisRatio).abs();
    final eDiff = (_rightResult!.ellipseness - _leftResult!.ellipseness).abs();
    final cDiff = (_rightResult!.circularityScore - _leftResult!.circularityScore).abs();

    final hasANW = _rightResult!.anwAssessment != null && _leftResult!.anwAssessment != null;
    double? anwDiff;
    if (hasANW) {
      anwDiff = (_rightResult!.anwAssessment!.ratio - _leftResult!.anwAssessment!.ratio).abs();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.compare_arrows, color: Colors.cyan, size: 24),
              const SizedBox(width: 8),
              Text(l10n.bilateralComparison, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          // Header
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text(l10n.parameter, style: const TextStyle(color: Colors.white54, fontSize: 12))),
                Expanded(child: Text(l10n.od, style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center)),
                Expanded(child: Text(l10n.os, style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center)),
                Expanded(child: Text(l10n.diff, style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center)),
              ],
            ),
          ),
          _buildCompRow(l10n.piRatio, _rightResult!.pupilIrisRatio, _leftResult!.pupilIrisRatio, pDiff, pDiff > 5),
          _buildCompRow(l10n.ellipseness, _rightResult!.ellipseness, _leftResult!.ellipseness, eDiff, eDiff > 5),
          _buildCompRow(l10n.circularity, _rightResult!.circularityScore, _leftResult!.circularityScore, cDiff, cDiff > 5),
          if (hasANW && anwDiff != null)
            _buildCompRow(l10n.anwRatioComparison, _rightResult!.anwAssessment!.ratio, _leftResult!.anwAssessment!.ratio, anwDiff, anwDiff > 5),
        ],
      ),
    );
  }

  Widget _buildCompRow(String p, double od, double os, double d, bool sig) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Expanded(flex: 2, child: Text(p, style: const TextStyle(color: Colors.white70, fontSize: 13))),
        Expanded(child: Text('${od.toStringAsFixed(1)}%', style: const TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center)),
        Expanded(child: Text('${os.toStringAsFixed(1)}%', style: const TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center)),
        Expanded(child: Text('${d.toStringAsFixed(1)}%', style: TextStyle(color: sig ? Colors.red : Colors.green, fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
      ],
    ),
  );

  Widget _buildMeasRow(String label, String value, Color c, String sub) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          Text(sub, style: const TextStyle(color: Colors.white38, fontSize: 10)),
        ])),
        Text(value, style: TextStyle(color: c, fontSize: 15, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _buildPupilFormCard(EllipseAssessment e, PupilAnalyzerLocalizations localizer, AppLocalizations l10n) {
    final isNormal = e.formType == PupilFormType.circle;
    final c = isNormal ? Colors.green : Colors.deepOrange;
    final formTypeName = localizer.getFormTypeName(e.formType);
    final formDescription = localizer.getPupilFormDescription(e.formType);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: c.withOpacity(0.15), borderRadius: BorderRadius.circular(8), border: Border.all(color: c.withOpacity(0.5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(isNormal ? Icons.check_circle : Icons.circle_outlined, color: c, size: 18),
          const SizedBox(width: 8),
          Text(l10n.pupilForm, style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13)),
          const Spacer(),
          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)), child: Text(formTypeName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10))),
        ]),
        const SizedBox(height: 8),
        Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(6)), child: Text(formDescription, style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3))),
      ]),
    );
  }

  Widget _buildDecentrationCard(DecentrationAssessment d, PupilAnalyzerLocalizations localizer, bool isRightEye, AppLocalizations l10n) {
    const c = Colors.purple;
    final patternName = localizer.getPatternName(d.pattern);
    final patternDescription = localizer.getDecentrationDescription(d.pattern, isRightEye);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: c.withOpacity(0.15), borderRadius: BorderRadius.circular(8), border: Border.all(color: c.withOpacity(0.5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Icon(Icons.gps_fixed, color: c, size: 18),
          const SizedBox(width: 8),
          Text(l10n.decentrationPattern, style: const TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13)),
          const Spacer(),
          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: c.withOpacity(0.3), borderRadius: BorderRadius.circular(8)), child: Text('${d.correctedOffsetPercent.toStringAsFixed(1)}%', style: const TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 10))),
        ]),
        const SizedBox(height: 6),
        Text(patternName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 6),
        Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(6)), child: Text(patternDescription, style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3))),
      ]),
    );
  }

  Widget _buildAnomaliesCard(String label, List<ZoneAnomaly> list, Color c, PupilAnalyzerLocalizations localizer, bool isRightEye, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: c.withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: c.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(label == l10n.flattenings ? Icons.compress : Icons.expand, color: c, size: 18),
          const SizedBox(width: 8),
          Text('$label (${list.length} ${l10n.zones})', style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13)),
        ]),
        const SizedBox(height: 10),
        ...list.map((a) {
          final zoneName = localizer.getZoneName(a.zone);
          final description = a.anomalyType == AnomalyType.flattening
              ? localizer.getFlatteningDescription(a.zone, isRightEye)
              : localizer.getProtrusionDescription(a.zone, isRightEye);

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(6)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: c.withOpacity(0.3), borderRadius: BorderRadius.circular(4)), child: Text(zoneName.toUpperCase(), style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 9))),
                const SizedBox(width: 8),
                Text('${a.percentage.toStringAsFixed(1)}%', style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13)),
                if (a.clockPosition.isNotEmpty) ...[const SizedBox(width: 8), Text('(${a.clockPosition})', style: const TextStyle(color: Colors.white38, fontSize: 10))],
              ]),
              const SizedBox(height: 6),
              Text(description, style: const TextStyle(color: Colors.white60, fontSize: 11, height: 1.3)),
            ]),
          );
        }),
      ]),
    );
  }
}