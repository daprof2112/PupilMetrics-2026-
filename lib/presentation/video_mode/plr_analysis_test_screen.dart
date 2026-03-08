// lib/presentation/video_mode/plr_analysis_test_screen.dart
// Enhanced PLR Analysis Test Screen - WITH PDF EXPORT & CHARTS
// v5.2.6 - Fixed PDF chart rendering

import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:ai_eye_capture/utils/app_branding.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/models/plr_history_model.dart';
import 'package:ai_eye_capture/services/plr_database_service.dart';

class PLRAnalysisTestScreen extends StatefulWidget {
  final String videoPath;
  final bool isRightEye;
  final String? patientName;
  final int? patientAge;

  const PLRAnalysisTestScreen({
    super.key,
    required this.videoPath,
    required this.isRightEye,
    this.patientName,
    this.patientAge,
  });

  @override
  State<PLRAnalysisTestScreen> createState() => _PLRAnalysisTestScreenState();
}

class _PLRAnalysisTestScreenState extends State<PLRAnalysisTestScreen> {
  final PupilAnalyzer _analyzer = PupilAnalyzer();

  bool _isLoading = true;
  String _statusMessage = '';
  final List<PLRFrameResult> _results = [];
  int _successCount = 0;
  int _failCount = 0;
  DateTime _analysisTimestamp = DateTime.now();

  // Core PLR metrics
  double? _baselineAvg;
  double? _minAfterFlash;
  double? _plrMagnitude;
  double? _plrPercent;
  bool _plrDetected = false;

  // Enhanced PLR metrics
  double? _latencyMs;
  double? _constrictionVelocity;
  double? _recoveryTime;
  double? _recoveryRatio;
  double? _maxConstrictionTime;
  String _plrGrade = 'N/A';

  // Normal reference values
  static const double _normalLatencyMin = 200;
  static const double _normalLatencyMax = 500;
  static const double _normalConstrictionMin = 10;
  static const double _normalConstrictionMax = 30;
  static const double _normalVelocityMin = 1.5;
  static const double _normalVelocityMax = 4.0;

  static const List<int> _testTimestamps = [
    500, 1000, 1500, 2000, 2500,
    3000,
    3100, 3200, 3300, 3400, 3500, 3600, 3800, 4000, 4500, 5000,
    5500, 6000, 7000, 8000, 9000, 10000
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _runAnalysisTest());
  }

  Future<void> _runAnalysisTest() async {
    final l10n = AppLocalizations.of(context);
    setState(() {
      _isLoading = true;
      _statusMessage = l10n?.checkingVideoFile ?? 'Checking video file...';
      _results.clear();
      _successCount = 0;
      _failCount = 0;
      _analysisTimestamp = DateTime.now();
    });

    final videoFile = File(widget.videoPath);
    if (!await videoFile.exists()) {
      setState(() {
        _isLoading = false;
        _statusMessage = l10n?.errorVideoNotFound ?? 'Error: Video file not found';
      });
      return;
    }

    for (int i = 0; i < _testTimestamps.length; i++) {
      final timestamp = _testTimestamps[i];
      setState(() {
        _statusMessage = l10n?.processingFrame(i + 1, _testTimestamps.length, timestamp) ??
            'Processing frame ${i + 1}/${_testTimestamps.length} (${timestamp}ms)...';
      });

      try {
        final frameBytes = await VideoThumbnail.thumbnailData(
          video: widget.videoPath,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 640,
          quality: 85,
          timeMs: timestamp,
        );

        if (frameBytes == null) {
          _results.add(PLRFrameResult(timestampMs: timestamp, success: false, error: 'Failed to extract frame'));
          _failCount++;
          continue;
        }

        final analysisResult = await _analyzer.analyzeBytes(frameBytes, isRightEye: widget.isRightEye);
        _results.add(PLRFrameResult(
          timestampMs: timestamp,
          success: true,
          frameBytes: frameBytes,
          pupilIrisRatio: analysisResult.pupilIrisRatio,
          confidence: analysisResult.confidence,
          qualityGrade: analysisResult.qualityGrade,
          irisDiameter: analysisResult.irisDiameterPx,
          pupilDiameter: analysisResult.pupilDiameterPx,
          ellipseness: analysisResult.ellipseness,
        ));
        _successCount++;
      } catch (e) {
        _results.add(PLRFrameResult(timestampMs: timestamp, success: false, error: e.toString()));
        _failCount++;
      }
    }

    _calculatePLRMetrics();
    _calculateEnhancedMetrics();
    _calculatePLRGrade();

    setState(() {
      _isLoading = false;
      _statusMessage = l10n?.analysisComplete ?? 'Analysis complete!';
    });
  }

  void _calculatePLRMetrics() {
    if (_successCount == 0) return;
    final successResults = _results.where((r) => r.success).toList();
    final baselineResults = successResults.where((r) => r.timestampMs < 3000).toList();
    final postFlashResults = successResults.where((r) => r.timestampMs >= 3100 && r.timestampMs <= 5000).toList();

    if (baselineResults.isNotEmpty) {
      _baselineAvg = baselineResults.map((r) => r.pupilIrisRatio!).reduce((a, b) => a + b) / baselineResults.length;
    }
    if (postFlashResults.isNotEmpty) {
      _minAfterFlash = postFlashResults.map((r) => r.pupilIrisRatio!).reduce((a, b) => a < b ? a : b);
      final minResult = postFlashResults.reduce((a, b) => a.pupilIrisRatio! < b.pupilIrisRatio! ? a : b);
      _maxConstrictionTime = minResult.timestampMs.toDouble();
    }
    if (_baselineAvg != null && _minAfterFlash != null) {
      _plrMagnitude = _baselineAvg! - _minAfterFlash!;
      _plrPercent = (_plrMagnitude! / _baselineAvg!) * 100;
      _plrDetected = _plrMagnitude! > 3;
    }
  }

  void _calculateEnhancedMetrics() {
    if (_successCount == 0 || _baselineAvg == null) return;
    final successResults = _results.where((r) => r.success).toList();

    final threshold90 = _baselineAvg! * 0.90;
    final postFlash = successResults.where((r) => r.timestampMs > 3000).toList();
    for (final result in postFlash) {
      if (result.pupilIrisRatio! <= threshold90) {
        _latencyMs = (result.timestampMs - 3000).toDouble();
        break;
      }
    }

    if (_maxConstrictionTime != null && _latencyMs != null && _plrMagnitude != null) {
      final constrictionDuration = (_maxConstrictionTime! - 3000 - _latencyMs!) / 1000;
      if (constrictionDuration > 0) {
        _constrictionVelocity = _plrMagnitude! / constrictionDuration;
      }
    }

    if (_minAfterFlash != null && _baselineAvg != null) {
      final recoveryTarget = _minAfterFlash! + (_baselineAvg! - _minAfterFlash!) * 0.75;
      final recoveryResults = successResults.where((r) => r.timestampMs > (_maxConstrictionTime ?? 4000)).toList();

      for (final result in recoveryResults) {
        if (result.pupilIrisRatio! >= recoveryTarget) {
          _recoveryTime = (result.timestampMs - (_maxConstrictionTime ?? 4000)).toDouble();
          break;
        }
      }

      final lastResult = successResults.last;
      if (lastResult.pupilIrisRatio != null) {
        _recoveryRatio = lastResult.pupilIrisRatio! / _baselineAvg!;
      }
    }
  }

  void _calculatePLRGrade() {
    if (!_plrDetected) {
      _plrGrade = 'D';
      return;
    }

    int score = 0;

    if (_plrPercent != null) {
      if (_plrPercent! >= 25) score += 3;
      else if (_plrPercent! >= 15) score += 2;
      else if (_plrPercent! >= 10) score += 1;
    }

    if (_latencyMs != null) {
      if (_latencyMs! >= _normalLatencyMin && _latencyMs! <= _normalLatencyMax) score += 2;
      else if (_latencyMs! < 600) score += 1;
    }

    if (_recoveryRatio != null) {
      if (_recoveryRatio! >= 0.90) score += 2;
      else if (_recoveryRatio! >= 0.75) score += 1;
    }

    final avgConfidence = _results.where((r) => r.success).map((r) => r.confidence!).reduce((a, b) => a + b) / _successCount;
    if (avgConfidence >= 0.7) score += 1;

    if (score >= 7) _plrGrade = 'A';
    else if (score >= 5) _plrGrade = 'B';
    else if (score >= 3) _plrGrade = 'C';
    else _plrGrade = 'D';
  }

  // ============================================================
  // PDF EXPORT - FIXED CHART
  // ============================================================
  Future<void> _exportPdf({bool showSnackbar = true}) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator(color: Color(0xFF00D9FF))),
      );

      final pdf = pw.Document();
      final now = DateTime.now();
      final dateStr = DateFormat('MMMM dd, yyyy HH:mm').format(now);
      final eye = widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS;

      Uint8List? thumbnailBytes;
      final firstSuccess = _results.where((r) => r.success && r.frameBytes != null).firstOrNull;
      if (firstSuccess != null) {
        thumbnailBytes = firstSuccess.frameBytes;
      }

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(40),
          header: (ctx) => _buildPdfHeader(l10n, dateStr, eye),
          footer: (ctx) => pw.Container(
            alignment: pw.Alignment.centerRight,
            child: pw.Text('Page ${ctx.pageNumber}/${ctx.pagesCount}', style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
          ),
          build: (ctx) => [
            _buildPdfPatientInfo(l10n, eye),
            pw.SizedBox(height: 16),
            if (thumbnailBytes != null) _buildPdfFrameThumbnail(thumbnailBytes),
            pw.SizedBox(height: 16),
            _buildPdfPlrSummary(l10n),
            pw.SizedBox(height: 16),
            _buildPdfEnhancedMetrics(l10n),
            pw.SizedBox(height: 16),
            _buildPdfPlrChart(l10n),
            pw.SizedBox(height: 16),
            _buildPdfFrameData(l10n),
            pw.SizedBox(height: 16),
            _buildPdfReference(l10n),
          ],
        ),
      );

      final dir = await getExternalStorageDirectory();
      final reportDir = Directory('${dir?.path}/PLRReports');
      if (!await reportDir.exists()) await reportDir.create(recursive: true);

      final ts = DateFormat('yyyy-MM-dd_HH-mm-ss').format(now);
      final eyeCode = widget.isRightEye ? 'OD' : 'OS';
      final safeName = (widget.patientName ?? 'Unknown').replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      final pdfPath = '${reportDir.path}/PLR_${safeName}_${eyeCode}_$ts.pdf';

      await File(pdfPath).writeAsBytes(await pdf.save());
      Navigator.pop(context);

      if (showSnackbar) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.pdfSaved, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(pdfPath, style: const TextStyle(fontSize: 11)),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
            action: SnackBarAction(label: l10n.open, textColor: Colors.white, onPressed: () => OpenFile.open(pdfPath)),
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);
      _showSnackBar('${l10n.pdfFailed(e.toString())}', Colors.red);
    }
  }

  pw.Widget _buildPdfHeader(AppLocalizations l10n, String dateStr, String eye) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(l10n.plrReportTitle, style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
            pw.Text('v5.2.6-research', style: const pw.TextStyle(fontSize: 12, color: PdfColors.grey600)),
          ],
        ),
        pw.Divider(color: PdfColors.blue900, thickness: 2),
        pw.Container(
          margin: const pw.EdgeInsets.only(top: 8, bottom: 8),
          padding: const pw.EdgeInsets.all(10),
          decoration: pw.BoxDecoration(
            color: PdfColors.amber50,
            border: pw.Border.all(color: PdfColors.orange, width: 2),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(l10n.plrResearchOnlyTitle, style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, color: PdfColors.orange900)),
              pw.SizedBox(height: 4),
              pw.Text(l10n.plrResearchDisclaimer, style: const pw.TextStyle(fontSize: 8, color: PdfColors.orange900)),
            ],
          ),
        ),
        pw.Text('${l10n.date}: $dateStr', style: const pw.TextStyle(fontSize: 10)),
        pw.SizedBox(height: 16),
      ],
    );
  }

  pw.Widget _buildPdfPatientInfo(AppLocalizations l10n, String eye) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.blue, width: 2)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(l10n.plrSubjectInfo, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
          pw.SizedBox(height: 8),
          pw.Row(
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('${l10n.plrNameLabel}: ${widget.patientName ?? l10n.unknown}'),
                    if (widget.patientAge != null) pw.Text(l10n.plrAgeYears(widget.patientAge!)),
                  ],
                ),
              ),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('${l10n.eye}: $eye', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('${l10n.plrTestLabel}: ${l10n.plrTestType}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildPdfFrameThumbnail(Uint8List imageBytes) {
    return pw.Center(
      child: pw.Container(
        width: 150,
        height: 150,
        decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey, width: 1)),
        child: pw.Image(pw.MemoryImage(imageBytes), fit: pw.BoxFit.cover),
      ),
    );
  }

  pw.Widget _buildPdfPlrSummary(AppLocalizations l10n) {
    final gradeColor = _plrGrade == 'A' ? PdfColors.green : _plrGrade == 'B' ? PdfColors.lightGreen : _plrGrade == 'C' ? PdfColors.orange : PdfColors.red;

    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: _plrDetected ? PdfColors.green50 : PdfColors.orange50,
        border: pw.Border.all(color: _plrDetected ? PdfColors.green : PdfColors.orange, width: 2),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(l10n.plrSummaryTitle, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                color: gradeColor,
                child: pw.Text(l10n.plrGradeValue(_plrGrade), style: const pw.TextStyle(color: PdfColors.white, fontSize: 12)),
              ),
            ],
          ),
          pw.SizedBox(height: 12),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              _pdfMetricBox(l10n.plrStatusLabel, _plrDetected ? l10n.plrDetectedStatus : l10n.plrWeakNotDetectedStatus),
              _pdfMetricBox(l10n.baselinePiRatio, _baselineAvg != null ? '${_baselineAvg!.toStringAsFixed(1)}%' : l10n.na),
              _pdfMetricBox(l10n.minPiRatio, _minAfterFlash != null ? '${_minAfterFlash!.toStringAsFixed(1)}%' : l10n.na),
              _pdfMetricBox(l10n.constriction, _plrPercent != null ? '${_plrPercent!.toStringAsFixed(1)}%' : l10n.na),
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildPdfEnhancedMetrics(AppLocalizations l10n) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.purple)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(l10n.plrEnhancedMetrics, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.purple)),
          pw.SizedBox(height: 8),
          pw.Row(
            children: [
              pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text('${l10n.plrLatency}: ${_latencyMs?.toStringAsFixed(0) ?? l10n.na} ms', style: const pw.TextStyle(fontSize: 10)),
                pw.Text('(Normal: $_normalLatencyMin-${_normalLatencyMax}ms)', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
              ])),
              pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text('${l10n.plrVelocity}: ${_constrictionVelocity?.toStringAsFixed(2) ?? l10n.na} %/s', style: const pw.TextStyle(fontSize: 10)),
                pw.Text('(Normal: $_normalVelocityMin-${_normalVelocityMax}%/s)', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
              ])),
            ],
          ),
          pw.SizedBox(height: 6),
          pw.Row(
            children: [
              pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text('${l10n.plrRecoveryTimeLabel}: ${_recoveryTime?.toStringAsFixed(0) ?? l10n.na} ms', style: const pw.TextStyle(fontSize: 10)),
                pw.Text('(to 75% of baseline)', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
              ])),
              pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text('${l10n.plrRecoveryRatioLabel}: ${_recoveryRatio != null ? "${(_recoveryRatio! * 100).toStringAsFixed(1)}%" : l10n.na}', style: const pw.TextStyle(fontSize: 10)),
                pw.Text('(final/baseline)', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
              ])),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FIXED PDF CHART - Uses bar visualization
  // ============================================================
  pw.Widget _buildPdfPlrChart(AppLocalizations l10n) {
    final successResults = _results.where((r) => r.success).toList();
    if (successResults.isEmpty) return pw.SizedBox();

    final allRatios = successResults.map((r) => r.pupilIrisRatio!).toList();
    final minRatio = allRatios.reduce((a, b) => a < b ? a : b);
    final maxRatio = allRatios.reduce((a, b) => a > b ? a : b);
    final range = maxRatio - minRatio;

    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey400)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(l10n.plrResponseCurve, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          pw.Text(l10n.plrChartDescription, style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
          pw.SizedBox(height: 12),

          // Visual bar chart
          pw.Container(
            height: 100,
            decoration: pw.BoxDecoration(
              color: PdfColors.grey100,
              border: pw.Border.all(color: PdfColors.grey300),
            ),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: successResults.map((r) {
                final normalized = range > 0 ? (r.pupilIrisRatio! - minRatio) / range : 0.5;
                final barHeight = 20 + (normalized * 70);

                PdfColor barColor;
                if (r.timestampMs < 3000) {
                  barColor = PdfColors.blue;
                } else if (r.timestampMs == 3000) {
                  barColor = PdfColors.yellow;
                } else if (r.timestampMs < 5000) {
                  barColor = PdfColors.purple;
                } else {
                  barColor = PdfColors.green;
                }

                final isMin = r.pupilIrisRatio == _minAfterFlash;

                return pw.Expanded(
                  child: pw.Container(
                    margin: const pw.EdgeInsets.symmetric(horizontal: 1),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        if (isMin) pw.Container(
                          width: 8, height: 8,
                          decoration: const pw.BoxDecoration(shape: pw.BoxShape.circle, color: PdfColors.red),
                        ),
                        if (isMin) pw.SizedBox(height: 2),
                        pw.Container(
                          height: barHeight,
                          decoration: pw.BoxDecoration(
                            color: barColor,
                            border: isMin ? pw.Border.all(color: PdfColors.red, width: 2) : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          pw.SizedBox(height: 4),

          // Time axis labels
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('0s', style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey600)),
              pw.Text('3s (${l10n.flashPhase})', style: const pw.TextStyle(fontSize: 7, color: PdfColors.orange)),
              pw.Text('${(successResults.last.timestampMs / 1000).toStringAsFixed(0)}s', style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey600)),
            ],
          ),

          pw.SizedBox(height: 8),

          // Y-axis info
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(l10n.plrPiRange(minRatio.toStringAsFixed(1), maxRatio.toStringAsFixed(1)),
                  style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
              if (_minAfterFlash != null)
                pw.Row(children: [
                  pw.Container(width: 8, height: 8, decoration: const pw.BoxDecoration(shape: pw.BoxShape.circle, color: PdfColors.red)),
                  pw.SizedBox(width: 4),
                  pw.Text(l10n.plrMinValue(_minAfterFlash!.toStringAsFixed(1)), style: const pw.TextStyle(fontSize: 8, color: PdfColors.red)),
                ]),
            ],
          ),

          pw.SizedBox(height: 8),

          // Legend
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              _pdfLegendItem(l10n.baseline, PdfColors.blue),
              _pdfLegendItem(l10n.flashPhase, PdfColors.yellow),
              _pdfLegendItem(l10n.constrictionPhase, PdfColors.purple),
              _pdfLegendItem(l10n.recovery, PdfColors.green),
            ],
          ),

          pw.SizedBox(height: 12),
          pw.Divider(color: PdfColors.grey300),
          pw.SizedBox(height: 8),

          // Data table
          pw.Text(l10n.plrFrameDataTitle, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          _buildPdfDataTable(successResults, l10n),
        ],
      ),
    );
  }

  pw.Widget _pdfLegendItem(String label, PdfColor color) {
    return pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Container(width: 10, height: 10, color: color),
        pw.SizedBox(width: 4),
        pw.Text(label, style: const pw.TextStyle(fontSize: 8)),
      ],
    );
  }

  pw.Widget _buildPdfDataTable(List<PLRFrameResult> successResults, AppLocalizations l10n) {
    List<pw.TableRow> tableRows = [
      pw.TableRow(
        decoration: const pw.BoxDecoration(color: PdfColors.grey200),
        children: [
          pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.plrTableTime, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8))),
          pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.plrTablePiPercent, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8))),
          pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.plrTablePhase, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8))),
          pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.plrTableConfidenceShort, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8))),
        ],
      ),
    ];

    for (final r in successResults) {
      final isMin = r.pupilIrisRatio == _minAfterFlash;
      tableRows.add(
        pw.TableRow(
          decoration: isMin ? const pw.BoxDecoration(color: PdfColors.red50) : null,
          children: [
            pw.Padding(padding: const pw.EdgeInsets.all(3), child: pw.Text('${(r.timestampMs / 1000).toStringAsFixed(1)}s', style: pw.TextStyle(fontSize: 7, fontWeight: isMin ? pw.FontWeight.bold : null))),
            pw.Padding(padding: const pw.EdgeInsets.all(3), child: pw.Text('${r.pupilIrisRatio!.toStringAsFixed(1)}', style: pw.TextStyle(fontSize: 7, fontWeight: isMin ? pw.FontWeight.bold : null, color: isMin ? PdfColors.red : null))),
            pw.Padding(padding: const pw.EdgeInsets.all(3), child: pw.Text(_getPhaseNameForPdf(r.timestampMs, l10n), style: const pw.TextStyle(fontSize: 7))),
            pw.Padding(padding: const pw.EdgeInsets.all(3), child: pw.Text('${(r.confidence! * 100).toStringAsFixed(0)}%', style: const pw.TextStyle(fontSize: 7))),
          ],
        ),
      );
    }

    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(1),
        1: const pw.FlexColumnWidth(1),
        2: const pw.FlexColumnWidth(1.2),
        3: const pw.FlexColumnWidth(0.8),
      },
      children: tableRows,
    );
  }

  String _getPhaseNameForPdf(int timestampMs, AppLocalizations l10n) {
    if (timestampMs < 3000) return l10n.baseline;
    if (timestampMs == 3000) return l10n.flashPhase;
    if (timestampMs < 5000) return l10n.constrictionPhase;
    return l10n.recovery;
  }

  pw.Widget _buildPdfFrameData(AppLocalizations l10n) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      decoration: const pw.BoxDecoration(color: PdfColors.grey100),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(l10n.plrAnalysisSummary, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 4),
          pw.Text('${l10n.plrTotalFrames}: ${_results.length}', style: const pw.TextStyle(fontSize: 9)),
          pw.Text(l10n.plrSuccessfulFailed(_successCount, _failCount), style: const pw.TextStyle(fontSize: 9)),
          pw.Text('${l10n.plrSuccessRate}: ${(_successCount / _results.length * 100).toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 9)),
        ],
      ),
    );
  }

  pw.Widget _buildPdfReference(AppLocalizations l10n) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(color: PdfColors.blue50, border: pw.Border.all(color: PdfColors.blue200)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(l10n.plrReferenceValues, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
          pw.SizedBox(height: 6),
          pw.Text(l10n.plrReferenceLatencyLine, style: const pw.TextStyle(fontSize: 9)),
          pw.Text(l10n.plrReferenceConstrictionLine, style: const pw.TextStyle(fontSize: 9)),
          pw.Text(l10n.plrReferenceVelocityLine, style: const pw.TextStyle(fontSize: 9)),
          pw.Text(l10n.plrReferenceRecoveryLine, style: const pw.TextStyle(fontSize: 9)),
        ],
      ),
    );
  }

  pw.Widget _pdfMetricBox(String label, String value) {
    return pw.Column(
      children: [
        pw.Text(label, style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700)),
        pw.SizedBox(height: 2),
        pw.Text(value, style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  Future<void> _sharePdf() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      showDialog(context: context, barrierDismissible: false, builder: (_) => const Center(child: CircularProgressIndicator()));

      final pdf = pw.Document();
      final dateStr = DateFormat('MMMM dd, yyyy HH:mm').format(_analysisTimestamp);
      final eye = widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS;

      pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        header: (ctx) => _buildPdfHeader(l10n, dateStr, eye),
        build: (ctx) => [
          _buildPdfPatientInfo(l10n, eye),
          pw.SizedBox(height: 16),
          _buildPdfPlrSummary(l10n),
          pw.SizedBox(height: 16),
          _buildPdfEnhancedMetrics(l10n),
          pw.SizedBox(height: 16),
          _buildPdfPlrChart(l10n),
          pw.SizedBox(height: 16),
          _buildPdfReference(l10n),
        ],
      ));

      final tempDir = await getTemporaryDirectory();
      final eyeCode = widget.isRightEye ? 'OD' : 'OS';
      final pdfPath = '${tempDir.path}/PLR_Report_${eyeCode}_${_analysisTimestamp.millisecondsSinceEpoch}.pdf';
      await File(pdfPath).writeAsBytes(await pdf.save());

      Navigator.pop(context);
      await Share.shareXFiles([XFile(pdfPath)], subject: l10n.plrShareSubject(eye));
    } catch (e) {
      Navigator.pop(context);
      _showSnackBar(l10n.shareFailedError(e.toString()), Colors.red);
    }
  }

  // ============================================================
  // EXPORT METHODS
  // ============================================================

  Future<void> _saveFrameToGallery(PLRFrameResult frame) async {
    if (frame.frameBytes == null) return;
    final l10n = AppLocalizations.of(context)!;
    try {
      final result = await ImageGallerySaverPlus.saveImage(
        frame.frameBytes!,
        quality: 100,
        name: 'PLR_${widget.isRightEye ? "OD" : "OS"}_${frame.timestampMs}ms_${DateTime.now().millisecondsSinceEpoch}',
      );
      _showSnackBar(result['isSuccess'] == true ? l10n.frameSavedToGallery : l10n.failedToSaveFrame,
          result['isSuccess'] == true ? Colors.green : Colors.red);
    } catch (e) {
      _showSnackBar('${l10n.error}: $e', Colors.red);
    }
  }

  Future<void> _saveAllFramesToGallery() async {
    final l10n = AppLocalizations.of(context)!;
    int saved = 0;
    for (final frame in _results.where((r) => r.success && r.frameBytes != null)) {
      try {
        await ImageGallerySaverPlus.saveImage(
          frame.frameBytes!,
          quality: 100,
          name: 'PLR_${widget.isRightEye ? "OD" : "OS"}_${frame.timestampMs}ms_${DateTime.now().millisecondsSinceEpoch}',
        );
        saved++;
      } catch (e) {
        debugPrint('[PLR] Failed to save frame: $e');
      }
    }
    _showSnackBar(l10n.framesSavedToGallery(saved), Colors.green);
  }

  Map<String, dynamic> _buildExportData() {
    final l10n = AppLocalizations.of(context)!;
    return {
      'analysisType': 'PLR_Video_Analysis',
      'version': '5.2.6',
      'timestamp': _analysisTimestamp.toIso8601String(),
      'eye': widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS,
      'videoPath': widget.videoPath,
      'patientName': widget.patientName ?? 'Unknown',
      'patientAge': widget.patientAge,
      'summary': {
        'totalFrames': _results.length,
        'successfulFrames': _successCount,
        'failedFrames': _failCount,
        'baselinePupilRatio': _baselineAvg,
        'minPupilRatio': _minAfterFlash,
        'plrMagnitude': _plrMagnitude,
        'plrPercent': _plrPercent,
        'plrDetected': _plrDetected,
        'plrGrade': _plrGrade,
      },
      'enhancedMetrics': {
        'latencyMs': _latencyMs,
        'constrictionVelocity': _constrictionVelocity,
        'maxConstrictionTimeMs': _maxConstrictionTime,
        'recoveryTimeMs': _recoveryTime,
        'recoveryRatio': _recoveryRatio,
      },
      'referenceValues': {
        'normalLatencyRange': '$_normalLatencyMin-$_normalLatencyMax ms',
        'normalConstrictionRange': '$_normalConstrictionMin-$_normalConstrictionMax %',
        'normalVelocityRange': '$_normalVelocityMin-$_normalVelocityMax %/s',
      },
      'frames': _results.map((r) => r.toJson()).toList(),
    };
  }

  String _buildTextReport() {
    final l10n = AppLocalizations.of(context)!;
    final buffer = StringBuffer();
    final eye = widget.isRightEye ? l10n.rightEyeOD : l10n.leftEyeOS;

    buffer.writeln('═' * 60);
    buffer.writeln('     ${l10n.plrTextReportTitle} v5.2.6 - RESEARCH VERSION');
    buffer.writeln('═' * 60);
    buffer.writeln();
    buffer.writeln(l10n.plrTextDisclaimerTitle);
    buffer.writeln(l10n.plrTextDisclaimerBody);
    buffer.writeln();
    buffer.writeln('─' * 60);
    buffer.writeln(l10n.plrSubjectInfo);
    buffer.writeln('─' * 60);
    buffer.writeln('${l10n.date}: ${_analysisTimestamp.toString().substring(0, 19)}');
    buffer.writeln('${l10n.eye}: $eye');
    if (widget.patientName != null) buffer.writeln('${l10n.patient}: ${widget.patientName}');
    if (widget.patientAge != null) buffer.writeln(l10n.plrAgeYears(widget.patientAge!));
    buffer.writeln();
    buffer.writeln('─' * 60);
    buffer.writeln(l10n.plrSummaryTitle);
    buffer.writeln('─' * 60);
    buffer.writeln();
    buffer.writeln('  ${l10n.plrOverallGradeLabel}:     $_plrGrade');
    buffer.writeln('  ${l10n.plrStatusLabel}:            ${_plrDetected ? l10n.plrDetectedStatus : l10n.plrWeakNotDetectedStatus}');
    buffer.writeln();
    buffer.writeln('  ${l10n.frames}:           $_successCount / ${_results.length}');
    buffer.writeln('  ${l10n.baselinePiRatio}:  ${_baselineAvg?.toStringAsFixed(1) ?? l10n.na}%');
    buffer.writeln('  ${l10n.minPiRatio}:       ${_minAfterFlash?.toStringAsFixed(1) ?? l10n.na}%');
    buffer.writeln('  ${l10n.plrMagnitude}:     ${_plrMagnitude?.toStringAsFixed(1) ?? l10n.na}%');
    buffer.writeln('  ${l10n.constriction}:     ${_plrPercent?.toStringAsFixed(1) ?? l10n.na}%');
    buffer.writeln();
    buffer.writeln('─' * 60);
    buffer.writeln(l10n.plrEnhancedMetrics);
    buffer.writeln('─' * 60);
    buffer.writeln();
    buffer.writeln('  ${l10n.plrLatency}:           ${_latencyMs?.toStringAsFixed(0) ?? l10n.na} ms');
    buffer.writeln('                     (Normal: $_normalLatencyMin-${_normalLatencyMax}ms)');
    buffer.writeln('  ${l10n.plrVelocity}:          ${_constrictionVelocity?.toStringAsFixed(2) ?? l10n.na} %/s');
    buffer.writeln('                     (Normal: $_normalVelocityMin-${_normalVelocityMax}%/s)');
    buffer.writeln('  ${l10n.plrMaxConstriction}:  ${_maxConstrictionTime?.toStringAsFixed(0) ?? l10n.na} ms');
    buffer.writeln('  ${l10n.plrRecoveryTimeLabel}:     ${_recoveryTime?.toStringAsFixed(0) ?? l10n.na} ms');
    buffer.writeln('  ${l10n.plrRecoveryRatioLabel}:    ${_recoveryRatio != null ? "${(_recoveryRatio! * 100).toStringAsFixed(1)}%" : l10n.na}');
    buffer.writeln();
    buffer.writeln('─' * 60);
    buffer.writeln(l10n.plrFrameDataTitle);
    buffer.writeln('─' * 60);
    buffer.writeln();
    buffer.writeln('Time(s)  P/I Ratio  ${l10n.plrTablePhase}         ${l10n.confidence}');
    buffer.writeln('-------  ---------  ------------  ----------');
    for (final r in _results.where((r) => r.success)) {
      final time = (r.timestampMs / 1000).toStringAsFixed(1).padLeft(6);
      final ratio = '${r.pupilIrisRatio!.toStringAsFixed(1)}%'.padLeft(8);
      final phase = _getPhaseNameForPdf(r.timestampMs, l10n).padRight(12);
      final conf = '${(r.confidence! * 100).toStringAsFixed(0)}%'.padLeft(8);
      buffer.writeln('$time   $ratio  $phase  $conf');
    }
    buffer.writeln();
    buffer.writeln('═' * 60);
    buffer.writeln(l10n.plrReferenceValues);
    buffer.writeln('═' * 60);
    buffer.writeln(l10n.plrReferenceLatencyLine);
    buffer.writeln(l10n.plrReferenceConstrictionLine);
    buffer.writeln(l10n.plrReferenceVelocityLine);
    buffer.writeln(l10n.plrReferenceRecoveryLineShort);
    buffer.writeln();
    buffer.writeln('═' * 60);
    buffer.writeln(l10n.plrEndOfReport);
    buffer.writeln('═' * 60);

    return buffer.toString();
  }

  Future<void> _exportAsJson() async {
    final l10n = AppLocalizations.of(context)!;
    final data = _buildExportData();
    final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
    await Clipboard.setData(ClipboardData(text: jsonStr));
    _showSnackBar(l10n.jsonCopiedToClipboard, Colors.green);
  }

  Future<void> _exportAsTxt() async {
    final l10n = AppLocalizations.of(context)!;
    final text = _buildTextReport();
    await Clipboard.setData(ClipboardData(text: text));
    _showSnackBar(l10n.reportCopiedToClipboard, Colors.blue);
  }

  Future<void> _saveTxtReport() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final text = _buildTextReport();
      final dir = await getExternalStorageDirectory();
      final reportDir = Directory('${dir?.path}/PLRReports');
      if (!await reportDir.exists()) await reportDir.create(recursive: true);

      final ts = DateFormat('yyyy-MM-dd_HH-mm-ss').format(_analysisTimestamp);
      final eyeCode = widget.isRightEye ? 'OD' : 'OS';
      final safeName = (widget.patientName ?? 'Unknown').replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      final txtPath = '${reportDir.path}/PLR_${safeName}_${eyeCode}_$ts.txt';

      await File(txtPath).writeAsString(text);
      _showSnackBar(l10n.txtSaved(txtPath), Colors.green);
    } catch (e) {
      _showSnackBar(l10n.failed(e.toString()), Colors.red);
    }
  }

  Future<void> _saveJsonReport() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final data = _buildExportData();
      final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
      final dir = await getExternalStorageDirectory();
      final reportDir = Directory('${dir?.path}/PLRReports');
      if (!await reportDir.exists()) await reportDir.create(recursive: true);

      final ts = DateFormat('yyyy-MM-dd_HH-mm-ss').format(_analysisTimestamp);
      final eyeCode = widget.isRightEye ? 'OD' : 'OS';
      final safeName = (widget.patientName ?? 'Unknown').replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      final jsonPath = '${reportDir.path}/PLR_${safeName}_${eyeCode}_$ts.json';

      await File(jsonPath).writeAsString(jsonStr);
      _showSnackBar(l10n.jsonSaved(jsonPath), Colors.green);
    } catch (e) {
      _showSnackBar(l10n.failed(e.toString()), Colors.red);
    }
  }

  Future<void> _shareReport() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final text = _buildTextReport();
      final tempDir = await getTemporaryDirectory();
      final eye = widget.isRightEye ? 'OD' : 'OS';
      final file = File('${tempDir.path}/PLR_Report_${eye}_${_analysisTimestamp.millisecondsSinceEpoch}.txt');
      await file.writeAsString(text);
      await Share.shareXFiles([XFile(file.path)], subject: '${l10n.plrAnalysis(eye)}');
    } catch (e) {
      _showSnackBar(l10n.shareFailedError(e.toString()), Colors.red);
    }
  }

  Future<void> _shareJson() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final data = _buildExportData();
      final jsonStr = const JsonEncoder.withIndent('  ').convert(data);
      final tempDir = await getTemporaryDirectory();
      final eye = widget.isRightEye ? 'OD' : 'OS';
      final file = File('${tempDir.path}/PLR_Data_${eye}_${_analysisTimestamp.millisecondsSinceEpoch}.json');
      await file.writeAsString(jsonStr);
      await Share.shareXFiles([XFile(file.path)], subject: '${l10n.plrAnalysis(eye)} - JSON');
    } catch (e) {
      _showSnackBar(l10n.shareFailedError(e.toString()), Colors.red);
    }
  }

  Future<void> _saveToHistory() async {
    final l10n = AppLocalizations.of(context)!;
    if (_successCount == 0) {
      _showSnackBar(l10n.noSuccessfulFramesToSave, Colors.orange);
      return;
    }

    final frameDataJson = jsonEncode(_results.map((r) => r.toJson()).toList());

    final record = PLRHistoryRecord(
      timestamp: _analysisTimestamp,
      patientName: widget.patientName ?? 'Unknown Subject',
      isRightEye: widget.isRightEye,
      videoPath: widget.videoPath,
      totalFrames: _results.length,
      successfulFrames: _successCount,
      baselinePupilRatio: _baselineAvg,
      minPupilRatio: _minAfterFlash,
      plrMagnitude: _plrMagnitude,
      plrConstrictionPercent: _plrPercent,
      plrDetected: _plrDetected,
      frameDataJson: frameDataJson,
      averageConfidence: _results.where((r) => r.success).map((r) => r.confidence!).reduce((a, b) => a + b) / _successCount,
      overallGrade: _plrGrade,
    );

    try {
      final db = PLRDatabaseService();
      final id = await db.insertRecord(record);
      _showSnackBar(l10n.savedToHistoryId(id), Colors.green);
    } catch (e) {
      _showSnackBar(l10n.failedToSave(e.toString()), Colors.red);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: color, duration: const Duration(seconds: 2)));
  }

  // ============================================================
  // BUILD UI
  // ============================================================
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(l10n.plrAnalysisTest, style: const TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        actions: [
          if (!_isLoading && _successCount > 0)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              color: AppColors.surface,
              onSelected: (value) {
                switch (value) {
                  case 'save_pdf': _exportPdf(); break;
                  case 'share_pdf': _sharePdf(); break;
                  case 'save_txt': _saveTxtReport(); break;
                  case 'save_json': _saveJsonReport(); break;
                  case 'save_all': _saveAllFramesToGallery(); break;
                }
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(value: 'save_pdf', child: Row(children: [const Icon(Icons.picture_as_pdf, color: Colors.red, size: 20), const SizedBox(width: 8), Text(l10n.savePdf)])),
                PopupMenuItem(value: 'share_pdf', child: Row(children: [const Icon(Icons.share, color: Colors.orange, size: 20), const SizedBox(width: 8), Text(l10n.sharePdf)])),
                const PopupMenuDivider(),
                PopupMenuItem(value: 'save_txt', child: Row(children: [const Icon(Icons.description, color: Colors.blue, size: 20), const SizedBox(width: 8), Text(l10n.txt)])),
                PopupMenuItem(value: 'save_json', child: Row(children: [const Icon(Icons.code, color: Colors.teal, size: 20), const SizedBox(width: 8), Text(l10n.json)])),
                const PopupMenuDivider(),
                PopupMenuItem(value: 'save_all', child: Row(children: [const Icon(Icons.photo_library, color: Colors.purple, size: 20), const SizedBox(width: 8), Text(l10n.saveAllFrames)])),
              ],
            ),
          if (!_isLoading) IconButton(icon: const Icon(Icons.refresh, color: Colors.white), onPressed: _runAnalysisTest, tooltip: l10n.rerunTest),
        ],
      ),
      body: _isLoading ? _buildLoadingView(l10n) : _buildResultsView(l10n),
    );
  }

  Widget _buildLoadingView(AppLocalizations l10n) {
    return Column(
      children: [
        _buildStatusHeader(l10n),
        Expanded(child: Center(child: Text(l10n.waitingForResults, style: const TextStyle(color: Colors.white54)))),
      ],
    );
  }

  Widget _buildResultsView(AppLocalizations l10n) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildStatusHeader(l10n),
          if (_successCount > 0) _buildPlrChart(l10n),
          if (_successCount > 0) _buildSummarySection(l10n),
          if (_successCount > 0) _buildExportButtons(l10n),
          _buildFramesList(l10n),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStatusHeader(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: _isLoading ? Colors.blue.withOpacity(0.2) : (_plrDetected ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2)),
      child: Column(
        children: [
          if (_isLoading)
            const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_plrDetected ? Icons.check_circle : Icons.warning, color: _plrDetected ? Colors.green : Colors.orange, size: 28),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(color: _gradeColor(_plrGrade), borderRadius: BorderRadius.circular(16)),
                  child: Text('${l10n.grade} $_plrGrade', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
              ],
            ),
          const SizedBox(height: 6),
          Text(_statusMessage, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          if (!_isLoading) Text('$_successCount/${_results.length} ${l10n.frames.toLowerCase()}', style: const TextStyle(color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildPlrChart(AppLocalizations l10n) {
    final successResults = _results.where((r) => r.success).toList();
    if (successResults.isEmpty) return const SizedBox.shrink();

    final allRatios = successResults.map((r) => r.pupilIrisRatio!).toList();
    final minRatio = allRatios.reduce((a, b) => a < b ? a : b) - 2;
    final maxRatio = allRatios.reduce((a, b) => a > b ? a : b) + 2;

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.show_chart, color: Colors.cyan, size: 18),
              const SizedBox(width: 6),
              Text('PLR ${l10n.recovery} Curve', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: CustomPaint(
              size: const Size(double.infinity, 120),
              painter: PLRChartPainter(
                results: successResults,
                minY: minRatio,
                maxY: maxRatio,
                flashTimeMs: 3000,
                baselineAvg: _baselineAvg,
                minAfterFlash: _minAfterFlash,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _legendItem(l10n.baseline, Colors.blue),
              _legendItem(l10n.flashPhase, Colors.yellow),
              _legendItem(l10n.constrictionPhase, Colors.purple),
              _legendItem(l10n.recovery, Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 3),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 9)),
      ],
    );
  }

  Widget _buildResultCard(PLRFrameResult result, AppLocalizations l10n) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 6),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 50, height: 50,
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(6)),
                  child: result.frameBytes != null
                      ? ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.memory(result.frameBytes!, fit: BoxFit.cover))
                      : const Icon(Icons.error_outline, color: Colors.red, size: 24),
                ),
                if (result.success && result.frameBytes != null)
                  Positioned(
                    right: 0, bottom: 0,
                    child: GestureDetector(
                      onTap: () => _saveFrameToGallery(result),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
                        child: const Icon(Icons.download, color: Colors.white, size: 12),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${(result.timestampMs / 1000).toStringAsFixed(1)}s', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(color: _getPhaseColor(result.timestampMs).withOpacity(0.3), borderRadius: BorderRadius.circular(4)),
                        child: Text(_getPhaseLabel(result.timestampMs, l10n), style: TextStyle(color: _getPhaseColor(result.timestampMs), fontSize: 9)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  if (result.success)
                    Text('P/I: ${result.pupilIrisRatio!.toStringAsFixed(1)}%  •  ${(result.confidence! * 100).toStringAsFixed(0)}%  •  ${result.qualityGrade}',
                        style: const TextStyle(color: Colors.white70, fontSize: 11))
                  else
                    Text('${l10n.error}: ${result.error}', style: const TextStyle(color: Colors.red, fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Icon(result.success ? Icons.check_circle : Icons.cancel, color: result.success ? Colors.green : Colors.red, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildFramesList(AppLocalizations l10n) {
    if (_results.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.list, color: Colors.white54, size: 18),
                const SizedBox(width: 8),
                Text('${l10n.frames} (${_results.length})', style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ),
          ..._results.map((r) => _buildResultCard(r, l10n)),
        ],
      ),
    );
  }

  Widget _buildSummarySection(AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _plrDetected ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _plrDetected ? Colors.green.withOpacity(0.5) : Colors.orange.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(_plrDetected ? Icons.check_circle : Icons.help_outline, color: _plrDetected ? Colors.green : Colors.orange),
              const SizedBox(width: 8),
              Text(_plrDetected ? l10n.plrDetectedExclaim : l10n.plrWeakNotDetected,
                  style: TextStyle(color: _plrDetected ? Colors.green : Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _metricBox(l10n.baseline, _baselineAvg != null ? '${_baselineAvg!.toStringAsFixed(1)}%' : l10n.na),
              _metricBox(l10n.min, _minAfterFlash != null ? '${_minAfterFlash!.toStringAsFixed(1)}%' : l10n.na),
              _metricBox(l10n.plr, _plrMagnitude != null ? '${_plrMagnitude!.toStringAsFixed(1)}%' : l10n.na),
              _metricBox(l10n.constrLabel, _plrPercent != null ? '${_plrPercent!.toStringAsFixed(1)}%' : l10n.na),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.purple.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _metricBoxSmall(l10n.latency, _latencyMs != null ? '${_latencyMs!.toStringAsFixed(0)}ms' : l10n.na),
                _metricBoxSmall(l10n.velocity, _constrictionVelocity != null ? '${_constrictionVelocity!.toStringAsFixed(1)}%/s' : l10n.na),
                _metricBoxSmall('Rec. Time', _recoveryTime != null ? '${_recoveryTime!.toStringAsFixed(0)}ms' : l10n.na),
                _metricBoxSmall('Rec. %', _recoveryRatio != null ? '${(_recoveryRatio! * 100).toStringAsFixed(0)}%' : l10n.na),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExportButtons(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _saveToHistory,
              icon: const Icon(Icons.save, size: 20),
              label: Text(l10n.saveToHistory),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 12)),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: ElevatedButton.icon(onPressed: _exportPdf, icon: const Icon(Icons.picture_as_pdf, size: 18), label: Text(l10n.savePdf), style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700, foregroundColor: Colors.white))),
              const SizedBox(width: 8),
              Expanded(child: ElevatedButton.icon(onPressed: _sharePdf, icon: const Icon(Icons.share, size: 18), label: Text(l10n.sharePdf), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700, foregroundColor: Colors.white))),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: OutlinedButton.icon(onPressed: _exportAsTxt, icon: const Icon(Icons.description, size: 18), label: Text(l10n.txt), style: OutlinedButton.styleFrom(foregroundColor: Colors.blue, side: const BorderSide(color: Colors.blue)))),
              const SizedBox(width: 8),
              Expanded(child: OutlinedButton.icon(onPressed: _exportAsJson, icon: const Icon(Icons.code, size: 18), label: Text(l10n.json), style: OutlinedButton.styleFrom(foregroundColor: Colors.teal, side: const BorderSide(color: Colors.teal)))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricBox(String label, String value) => Column(children: [
    Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
    const SizedBox(height: 4),
    Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
  ]);

  Widget _metricBoxSmall(String label, String value) => Column(children: [
    Text(label, style: const TextStyle(color: Colors.purple, fontSize: 9)),
    const SizedBox(height: 2),
    Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
  ]);

  String _getPhaseLabel(int timestampMs, AppLocalizations l10n) {
    if (timestampMs < 3000) return l10n.baseline;
    if (timestampMs == 3000) return l10n.flashPhase;
    if (timestampMs < 5000) return l10n.constrictionPhase;
    return l10n.recovery;
  }

  Color _getPhaseColor(int timestampMs) {
    if (timestampMs < 3000) return Colors.blue;
    if (timestampMs == 3000) return Colors.yellow;
    if (timestampMs < 5000) return Colors.purple;
    return Colors.green;
  }

  Color _gradeColor(String g) => g == 'A' ? Colors.green : g == 'B' ? Colors.lightGreen : g == 'C' ? Colors.orange : Colors.red;
}

// ============================================================
// PLR CHART PAINTER (Flutter UI)
// ============================================================
class PLRChartPainter extends CustomPainter {
  final List<PLRFrameResult> results;
  final double minY;
  final double maxY;
  final int flashTimeMs;
  final double? baselineAvg;
  final double? minAfterFlash;

  PLRChartPainter({
    required this.results,
    required this.minY,
    required this.maxY,
    required this.flashTimeMs,
    this.baselineAvg,
    this.minAfterFlash,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (results.isEmpty) return;

    final maxTimeMs = results.last.timestampMs.toDouble();
    final chartPadding = const EdgeInsets.only(left: 35, right: 8, top: 8, bottom: 20);
    final chartWidth = size.width - chartPadding.left - chartPadding.right;
    final chartHeight = size.height - chartPadding.top - chartPadding.bottom;

    final gridPaint = Paint()..color = Colors.white12..strokeWidth = 1;
    final axisPaint = Paint()..color = Colors.white38..strokeWidth = 1.5;
    final textStyle = const TextStyle(color: Colors.white54, fontSize: 8);

    canvas.drawLine(Offset(chartPadding.left, chartPadding.top), Offset(chartPadding.left, size.height - chartPadding.bottom), axisPaint);
    canvas.drawLine(Offset(chartPadding.left, size.height - chartPadding.bottom), Offset(size.width - chartPadding.right, size.height - chartPadding.bottom), axisPaint);

    for (int i = 0; i <= 4; i++) {
      final y = chartPadding.top + (chartHeight * i / 4);
      final value = maxY - ((maxY - minY) * i / 4);
      canvas.drawLine(Offset(chartPadding.left, y), Offset(size.width - chartPadding.right, y), gridPaint);
      final textSpan = TextSpan(text: '${value.toStringAsFixed(0)}%', style: textStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: ui.TextDirection.ltr);
      textPainter.layout();
      textPainter.paint(canvas, Offset(chartPadding.left - textPainter.width - 4, y - textPainter.height / 2));
    }

    for (int sec = 0; sec <= (maxTimeMs / 1000).ceil(); sec += 2) {
      final x = chartPadding.left + (chartWidth * (sec * 1000) / maxTimeMs);
      final textSpan = TextSpan(text: '${sec}s', style: textStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: ui.TextDirection.ltr);
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, size.height - chartPadding.bottom + 4));
    }

    final flashX = chartPadding.left + (chartWidth * flashTimeMs / maxTimeMs);
    final flashPaint = Paint()..color = Colors.yellow..strokeWidth = 2;
    canvas.drawLine(Offset(flashX, chartPadding.top), Offset(flashX, size.height - chartPadding.bottom), flashPaint);

    if (baselineAvg != null) {
      final baselineY = chartPadding.top + (chartHeight * (maxY - baselineAvg!) / (maxY - minY));
      final baselinePaint = Paint()..color = Colors.blue.withOpacity(0.5)..strokeWidth = 1..style = PaintingStyle.stroke;
      final path = Path();
      path.moveTo(chartPadding.left, baselineY);
      for (double x = chartPadding.left; x <= flashX; x += 8) {
        path.lineTo(x + 4, baselineY);
        path.moveTo(x + 8, baselineY);
      }
      canvas.drawPath(path, baselinePaint);
    }

    final linePaint = Paint()..color = Colors.cyan..strokeWidth = 2..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final path = Path();
    bool first = true;
    for (final result in results) {
      final x = chartPadding.left + (chartWidth * result.timestampMs / maxTimeMs);
      final y = chartPadding.top + (chartHeight * (maxY - result.pupilIrisRatio!) / (maxY - minY));
      if (first) { path.moveTo(x, y); first = false; } else { path.lineTo(x, y); }
    }
    canvas.drawPath(path, linePaint);

    final pointPaint = Paint()..style = PaintingStyle.fill;
    for (final result in results) {
      final x = chartPadding.left + (chartWidth * result.timestampMs / maxTimeMs);
      final y = chartPadding.top + (chartHeight * (maxY - result.pupilIrisRatio!) / (maxY - minY));
      pointPaint.color = _getPhaseColorStatic(result.timestampMs);
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
      final borderPaint = Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = 0.8;
      canvas.drawCircle(Offset(x, y), 3, borderPaint);
    }

    if (minAfterFlash != null) {
      final minResult = results.where((r) => r.pupilIrisRatio == minAfterFlash).firstOrNull;
      if (minResult != null) {
        final x = chartPadding.left + (chartWidth * minResult.timestampMs / maxTimeMs);
        final y = chartPadding.top + (chartHeight * (maxY - minAfterFlash!) / (maxY - minY));
        final minPaint = Paint()..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 1.5;
        canvas.drawCircle(Offset(x, y), 6, minPaint);
      }
    }
  }

  Color _getPhaseColorStatic(int timestampMs) {
    if (timestampMs < 3000) return Colors.blue;
    if (timestampMs == 3000) return Colors.yellow;
    if (timestampMs < 5000) return Colors.purple;
    return Colors.green;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ============================================================
// PLR FRAME RESULT
// ============================================================
class PLRFrameResult {
  final int timestampMs;
  final bool success;
  final Uint8List? frameBytes;
  final double? pupilIrisRatio;
  final double? confidence;
  final String? qualityGrade;
  final double? irisDiameter;
  final double? pupilDiameter;
  final double? ellipseness;
  final String? error;

  PLRFrameResult({
    required this.timestampMs,
    required this.success,
    this.frameBytes,
    this.pupilIrisRatio,
    this.confidence,
    this.qualityGrade,
    this.irisDiameter,
    this.pupilDiameter,
    this.ellipseness,
    this.error,
  });

  Map<String, dynamic> toJson() => {
    'timestampMs': timestampMs,
    'timeSeconds': timestampMs / 1000,
    'phase': _getPhase(),
    'success': success,
    'pupilIrisRatio': pupilIrisRatio,
    'confidence': confidence,
    'qualityGrade': qualityGrade,
    'irisDiameterPx': irisDiameter,
    'pupilDiameterPx': pupilDiameter,
    'ellipseness': ellipseness,
    'error': error,
  };

  String _getPhase() {
    if (timestampMs < 3000) return 'baseline';
    if (timestampMs == 3000) return 'flash';
    if (timestampMs < 5000) return 'constriction';
    return 'recovery';
  }
}
