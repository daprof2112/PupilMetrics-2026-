// lib/presentation/history/plr_history_screen.dart
// PLR Analysis History Screen - v5.2.6 FIXED OVERFLOW with DraggableScrollableSheet

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/utils/app_branding.dart';
import 'package:ai_eye_capture/models/plr_history_model.dart';
import 'package:ai_eye_capture/services/plr_database_service.dart';
import 'package:intl/intl.dart';

class PLRHistoryScreen extends StatefulWidget {
  const PLRHistoryScreen({super.key});

  @override
  State<PLRHistoryScreen> createState() => _PLRHistoryScreenState();
}

class _PLRHistoryScreenState extends State<PLRHistoryScreen> {
  final PLRDatabaseService _db = PLRDatabaseService();
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;

  List<PLRHistoryRecord> _records = [];
  PLRHistoryStats? _stats;
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final records = _searchQuery.isEmpty ? await _db.getAllRecords() : await _db.searchRecords(_searchQuery);
      final stats = await _db.getStats();
      setState(() {
        _records = records;
        _stats = stats;
        _isLoading = false;
      });
    } catch (e) {
      print('[PLR History] Error loading data: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    setState(() => _searchQuery = query);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), _loadData);
  }

  Future<void> _deleteRecord(PLRHistoryRecord record) async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(l10n.deleteRecord, style: const TextStyle(color: Colors.white)),
        content: Text(l10n.deleteRecordConfirm(record.patientName, record.eyeShort), style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: Text(l10n.delete)),
        ],
      ),
    );

    if (confirm == true && record.id != null) {
      await _db.deleteRecord(record.id!);
      _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.recordDeleted), backgroundColor: Colors.orange));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.plrHistory, style: const TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(icon: const Icon(Icons.refresh, color: Colors.white), onPressed: _loadData)],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearch,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: l10n.searchByName,
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          if (_stats != null) _buildStatsCard(l10n),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _records.isEmpty
                ? _buildEmptyState(l10n)
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _records.length,
              itemBuilder: (ctx, index) => _buildRecordCard(_records[index], l10n),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem(Icons.videocam, '${_stats!.totalScans}', l10n.plr, Colors.cyan),
          _statItem(Icons.calendar_today, '${_stats!.scansThisWeek}', l10n.thisWeek, Colors.blue),
          _statItem(Icons.check_circle, '${_stats!.detectionRate.toStringAsFixed(0)}%', l10n.detected, Colors.green),
          _statItem(Icons.trending_up, '${_stats!.avgPlrMagnitude.toStringAsFixed(1)}%', l10n.avgPlr, Colors.purple),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
      ],
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.videocam_off, size: 64, color: Colors.white24),
          const SizedBox(height: 16),
          Text(l10n.noPlrRecordsYet, style: const TextStyle(color: Colors.white54, fontSize: 16)),
          const SizedBox(height: 8),
          Text(l10n.recordPlrVideoToSeeHistory, style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRecordCard(PLRHistoryRecord record, AppLocalizations l10n) {
    final dateStr = DateFormat('MMM dd, yyyy HH:mm').format(record.timestamp);
    final plrStatus = record.plrDetected;

    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDetailBottomSheet(record, l10n),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(
                  color: plrStatus ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(plrStatus ? Icons.visibility : Icons.visibility_off, color: plrStatus ? Colors.green : Colors.orange, size: 22),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(record.patientName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(dateStr, style: const TextStyle(color: Colors.white54, fontSize: 11)),
                    const SizedBox(height: 2),
                    Text('${l10n.plr}: ${record.plrMagnitude?.toStringAsFixed(1) ?? l10n.na}%  •  ${(record.averageConfidence * 100).toStringAsFixed(0)}%',
                        style: TextStyle(color: plrStatus ? Colors.green : Colors.orange, fontSize: 11)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: record.isRightEye ? Colors.cyan.withOpacity(0.2) : Colors.pink.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(record.eyeShort, style: TextStyle(color: record.isRightEye ? Colors.cyan : Colors.pink, fontWeight: FontWeight.bold, fontSize: 11)),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(color: _gradeColor(record.overallGrade).withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                child: Text(record.overallGrade, style: TextStyle(color: _gradeColor(record.overallGrade), fontWeight: FontWeight.bold, fontSize: 11)),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red, size: 18),
                onPressed: () => _deleteRecord(record),
                padding: const EdgeInsets.all(4),
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FIXED: Using DraggableScrollableSheet - NO MORE OVERFLOW
  // ============================================================
  void _showDetailBottomSheet(PLRHistoryRecord record, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // ===== FIXED HEADER (not scrollable) =====
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle bar
                    Container(
                      width: 40, height: 4,
                      decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2)),
                    ),
                    const SizedBox(height: 12),
                    // Header row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Colors.purple.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                            child: const Icon(Icons.videocam, color: Colors.purple, size: 22),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.plrAnalysis(record.eyeLabel),
                                    style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis),
                                Text(record.patientName,
                                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: _gradeColor(record.overallGrade), borderRadius: BorderRadius.circular(10)),
                            child: Text(record.overallGrade, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white54, size: 20),
                            onPressed: () => Navigator.pop(ctx),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(color: Colors.white12, height: 1),
                  ],
                ),
              ),

              // ===== SCROLLABLE CONTENT =====
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    // PLR Status
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: record.plrDetected ? Colors.green.withOpacity(0.15) : Colors.orange.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: record.plrDetected ? Colors.green.withOpacity(0.4) : Colors.orange.withOpacity(0.4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(record.plrDetected ? Icons.check_circle : Icons.warning,
                              color: record.plrDetected ? Colors.green : Colors.orange, size: 22),
                          const SizedBox(width: 8),
                          Text(record.plrDetected ? l10n.plrDetected : l10n.plrWeakNotDetected,
                              style: TextStyle(color: record.plrDetected ? Colors.green : Colors.orange,
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Metrics grid
                    _buildMetricsGrid(record, l10n),
                    const SizedBox(height: 14),

                    // Patient info
                    _buildDetailSection(l10n.patient, [
                      _detailRow(l10n.patient, record.patientName),
                      _detailRow(l10n.date, DateFormat('MMM dd, yyyy HH:mm').format(record.timestamp)),
                      _detailRow(l10n.eye, record.eyeLabel),
                    ]),
                    const SizedBox(height: 10),

                    // PLR metrics
                    _buildDetailSection('PLR ${l10n.frames}', [
                      _detailRow(l10n.frames, '${record.successfulFrames}/${record.totalFrames}'),
                      _detailRow(l10n.baselinePiRatio, '${record.baselinePupilRatio?.toStringAsFixed(1) ?? l10n.na}%'),
                      _detailRow(l10n.minPiRatio, '${record.minPupilRatio?.toStringAsFixed(1) ?? l10n.na}%'),
                      _detailRow(l10n.plrMagnitude, '${record.plrMagnitude?.toStringAsFixed(1) ?? l10n.na}%'),
                      _detailRow(l10n.constriction, '${record.plrConstrictionPercent?.toStringAsFixed(1) ?? l10n.na}%'),
                    ]),
                    const SizedBox(height: 10),

                    // Quality
                    _buildDetailSection(l10n.confidence, [
                      _detailRow(l10n.confidence, '${(record.averageConfidence * 100).toStringAsFixed(0)}%'),
                      _detailRow(l10n.grade, record.overallGrade),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricsGrid(PLRHistoryRecord record, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(child: _metricTile(l10n.baseline, '${record.baselinePupilRatio?.toStringAsFixed(1) ?? "--"}%', Colors.blue)),
          Expanded(child: _metricTile(l10n.min, '${record.minPupilRatio?.toStringAsFixed(1) ?? "--"}%', Colors.orange)),
          Expanded(child: _metricTile(l10n.plr, '${record.plrMagnitude?.toStringAsFixed(1) ?? "--"}%', Colors.purple)),
          Expanded(child: _metricTile('%', '${record.plrConstrictionPercent?.toStringAsFixed(1) ?? "--"}%', Colors.cyan)),
        ],
      ),
    );
  }

  Widget _metricTile(String label, String value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: TextStyle(color: color.withOpacity(0.7), fontSize: 10)),
        const SizedBox(height: 3),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          ...children,
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
          Flexible(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Color _gradeColor(String g) => g == 'A' ? Colors.green : g == 'B' ? Colors.lightGreen : g == 'C' ? Colors.orange : Colors.red;
}