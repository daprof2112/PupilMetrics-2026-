// lib/presentation/analysis_screen.dart
// VERSION 5.3.1 - WITH FULL ANW (COLLARETTE) ASSESSMENT UI & PDF
// ============================================================================
// SECTION 1 of 5: IMPORTS, STATE, INITIALIZATION, AND ANALYSIS METHODS
// ============================================================================

import 'dart:io';
import 'dart:math' as math;
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';
import 'package:ai_eye_capture/utils/ml_pupil_analyzer.dart';
import 'package:ai_eye_capture/utils/hybrid_confidence.dart';
import 'package:ai_eye_capture/utils/app_settings.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_localizations.dart';
import 'package:ai_eye_capture/utils/database_helper.dart';
import 'package:ai_eye_capture/main.dart';
import 'package:ai_eye_capture/models/patient_info.dart';
import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';
import 'package:ai_eye_capture/utils/zone_translations.dart';
import 'package:ai_eye_capture/utils/dynamic_chart_painter.dart';  // v5.3.1: Radial chart warping  // v5.3.1: Polar zone lookup
import 'package:ai_eye_capture/therapy/herbal_engine.dart';
import 'package:ai_eye_capture/therapy/herbal_recommendations_panel.dart';
import 'package:ai_eye_capture/therapy/nutrition_engine.dart';
import 'package:ai_eye_capture/therapy/nutrition_recommendations_panel.dart';
import 'package:ai_eye_capture/therapy/chiropractic_engine.dart';
import 'package:ai_eye_capture/therapy/chiropractic_recommendations_panel.dart';
import 'package:ai_eye_capture/therapy/tcm_engine.dart';
import 'package:ai_eye_capture/therapy/tcm_recommendations_panel.dart';
import 'package:ai_eye_capture/therapy/constitutional_data.dart';
import 'package:ai_eye_capture/therapy/constitutional_panel.dart';
import 'package:ai_eye_capture/widgets/iris_anomaly_picker.dart';

class AnalysisScreen extends StatefulWidget {
  final File? leftEyeImage;
  final File? rightEyeImage;
  final VoidCallback? onComplete;
  final VoidCallback? onRetake;
  final PatientInfo patientInfo;
  final bool skipValidation;

  const AnalysisScreen({
    super.key,
    this.leftEyeImage,
    this.rightEyeImage,
    this.onComplete,
    this.onRetake,
    required this.patientInfo,
    this.skipValidation = false,
  });

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> with SingleTickerProviderStateMixin {
  final _mlAnalyzer = MLPupilAnalyzer();
  EyeAnalysisResult? _leftResult, _rightResult;
  MLAnalysisResult? _mlLeftResult, _mlRightResult;
  HybridConfidenceBreakdown? _hybridLeftConfidence, _hybridRightConfidence;
  AnisocoriaAssessment? _anisocoriaResult;
  AgeNormAssessment? _ageNormResult;
  String? _overlayObserverNotes;  // notes typed in zone overlay dialog, included in exports
  BilateralIrisMetrics? _irisMetrics;
  bool _showMlComparison = AppSettings.defaults.showMlComparison;
  bool _showZoneOverlay = AppSettings.defaults.showZoneOverlay;
  bool _includeImagesInPdf = AppSettings.defaults.includeImagesInPdf;
  bool _autoSavePdf = AppSettings.defaults.autoSavePdf;
  String _clinicName = '';
  bool _herbalModeEnabled = false;
  List<ZoneRecommendation> _herbalRecs = [];
  bool _nutritionModeEnabled = false;
  List<ZoneNutritionRecommendation> _nutritionRecs = [];
  bool _chiropracticModeEnabled = false;
  List<ChiropracticRecommendation> _chiropracticRecs = [];
  bool _tcmModeEnabled = false;
  List<TcmRecommendation> _tcmRecs = [];
  bool _isAnalyzing = true;
  String _statusMessage = '';
  bool get _isDesktop => Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  double _progress = 0;
  String? _errorMessage;
  bool _validationFailed = false;
  int _remainingScans = 10;
  bool _isPremium = false;
  bool _showPaywall = false;
  String? _overlaySearchAnchorPath;
  late AnimationController _animationController;

  Future<void> _checkCreditsAndRun() async {
    final prefs = await SharedPreferences.getInstance();
    _remainingScans = prefs.getInt('remaining_scans') ?? 10;
    _isPremium = prefs.getBool('is_premium') ?? false;

    if (!_isPremium && _remainingScans <= 0) {
      setState(() {
        _isAnalyzing = false;
        _showPaywall = true;
      });
      return;
    }
    if (_isDesktop) {
      _isPremium = true; // Treat desktop as premium
      _runAnalysis();
      return;
    }
    _runAnalysis();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    )..repeat();
    _loadAppSettings();
    _initializeAndRun();
  }

  Future<void> _loadAppSettings() async {
    final settings = await AppSettings.load();
    if (!mounted) return;

    setState(() {
      _showMlComparison = settings.showMlComparison;
      _showZoneOverlay = settings.showZoneOverlay;
      _includeImagesInPdf = settings.includeImagesInPdf;
      _autoSavePdf = settings.autoSavePdf;
      _clinicName = settings.clinicName;
      _herbalModeEnabled = settings.herbalModeEnabled;
      _nutritionModeEnabled = settings.nutritionModeEnabled;
      _chiropracticModeEnabled = settings.chiropracticModeEnabled;
      _tcmModeEnabled = settings.tcmModeEnabled;
    });

    // Pre-load therapy databases in background
    if (settings.herbalModeEnabled) {
      HerbalEngine.load().catchError((_) {});
    }
    if (settings.nutritionModeEnabled) {
      NutritionEngine.load().catchError((_) {});
    }
  }

  void _buildHerbalRecs() {
    if (!_herbalModeEnabled) return;
    if (!HerbalEngine.isLoaded) {
      HerbalEngine.load().then((_) {
        if (!mounted) return;
        setState(() {
          _herbalRecs = HerbalEngine.recommend(
              rightResult: _rightResult, leftResult: _leftResult);
        });
      }).catchError((_) {});
      return;
    }
    setState(() {
      _herbalRecs = HerbalEngine.recommend(
          rightResult: _rightResult, leftResult: _leftResult);
    });
  }

  void _buildNutritionRecs() {
    if (!_nutritionModeEnabled) return;
    if (!NutritionEngine.isLoaded) {
      NutritionEngine.load().then((_) {
        if (!mounted) return;
        setState(() {
          _nutritionRecs = NutritionEngine.recommend(
              rightResult: _rightResult, leftResult: _leftResult);
        });
      }).catchError((_) {});
      return;
    }
    setState(() {
      _nutritionRecs = NutritionEngine.recommend(
          rightResult: _rightResult, leftResult: _leftResult);
    });
  }

  void _buildChiropracticRecs() {
    if (!_chiropracticModeEnabled) return;
    setState(() {
      _chiropracticRecs = ChiropracticEngine.recommend(
          rightResult: _rightResult, leftResult: _leftResult);
    });
  }

  void _buildTcmRecs() {
    if (!_tcmModeEnabled) return;
    setState(() {
      _tcmRecs = TcmEngine.recommend(
          rightResult: _rightResult, leftResult: _leftResult);
    });
  }

  Future<void> _initializeAndRun() async {
    await _mlAnalyzer.initialize();
    _checkCreditsAndRun();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _runAnalysis() async {
    final l10n = AppLocalizations.of(context)!;
    final analyzer = PupilAnalyzer();
    final validator = EyeValidator();

    try {
      // Skip validation for gallery imports
      if (!widget.skipValidation) {
        setState(() {
          _statusMessage = l10n.validatingRightEye;
          _progress = 0.1;
        });
        await Future.delayed(const Duration(milliseconds: 200));

        if (widget.rightEyeImage != null) {
          final rv = await validator.validateEyeImage(widget.rightEyeImage!);
          if (!rv.isValidEye) {
            setState(() {
              _isAnalyzing = false;
              _validationFailed = true;
              _errorMessage = '${l10n.rightEyeOD}: ${rv.rejectionReason}';
            });
            return;
          }
        }

        setState(() {
          _statusMessage = l10n.validatingLeftEye;
          _progress = 0.2;
        });

        if (widget.leftEyeImage != null) {
          final lv = await validator.validateEyeImage(widget.leftEyeImage!);
          if (!lv.isValidEye) {
            setState(() {
              _isAnalyzing = false;
              _validationFailed = true;
              _errorMessage = '${l10n.leftEyeOS}: ${lv.rejectionReason}';
            });
            return;
          }
        }
      } else {
        setState(() {
          _statusMessage = l10n.validatingRightEye;
          _progress = 0.2;
        });
        await Future.delayed(const Duration(milliseconds: 200));
        debugPrint('📷 Skipping eye validation for gallery import');
      }

      // Analyze right eye
      if (widget.rightEyeImage != null) {
        setState(() {
          _statusMessage = l10n.analyzingRightEye;
          _progress = 0.4;
        });
        await Future.delayed(const Duration(milliseconds: 300));
        _rightResult = await analyzer.analyzeEye(widget.rightEyeImage!, isRightEye: true);
        _mlRightResult = await _mlAnalyzer.analyze(
          await widget.rightEyeImage!.readAsBytes(),
          eye: 'OD',
          irisCenterX: _rightResult?.irisCenterX,
          irisCenterY: _rightResult?.irisCenterY,
          irisRadius:  _rightResult != null ? _rightResult!.irisDiameterPx / 2 : null,
        );
        _hybridRightConfidence = HybridConfidenceFusion.fuse(
          classical: _rightResult!,
          ml: _mlRightResult!,
          validationPassed: true,
        );

        debugPrint('👁 RIGHT EYE: Classical=${_rightResult!.pupilIrisRatio.toStringAsFixed(1)}% | ML=${_mlRightResult!.pupilIrisRatio.toStringAsFixed(1)}% | HybridConf=${(_hybridRightConfidence!.fusedConfidence * 100).toStringAsFixed(0)}%');
        // v5.3.0: Log ANW assessment
        if (_rightResult!.anwAssessment != null) {
          final anw = _rightResult!.anwAssessment!;
          debugPrint('🔵 RIGHT ANW: Ratio=${anw.ratio.toStringAsFixed(1)}% (${anw.ratioStatusLabel}), Form=${anw.formTypeName}');
          if (anw.bexelFindings.isNotEmpty) debugPrint('   Findings: ${anw.bexelFindings.join(", ")}' );
        }
      }

      // Analyze left eye
      if (widget.leftEyeImage != null) {
        setState(() {
          _statusMessage = l10n.analyzingLeftEye;
          _progress = 0.6;
        });
        await Future.delayed(const Duration(milliseconds: 300));
        _leftResult = await analyzer.analyzeEye(widget.leftEyeImage!, isRightEye: false);
        _mlLeftResult = await _mlAnalyzer.analyze(
          await widget.leftEyeImage!.readAsBytes(),
          eye: 'OS',
          irisCenterX: _leftResult?.irisCenterX,
          irisCenterY: _leftResult?.irisCenterY,
          irisRadius:  _leftResult != null ? _leftResult!.irisDiameterPx / 2 : null,
        );
        _hybridLeftConfidence = HybridConfidenceFusion.fuse(
          classical: _leftResult!,
          ml: _mlLeftResult!,
          validationPassed: true,
        );

        debugPrint('👁 LEFT EYE: Classical=${_leftResult!.pupilIrisRatio.toStringAsFixed(1)}% | ML=${_mlLeftResult!.pupilIrisRatio.toStringAsFixed(1)}% | HybridConf=${(_hybridLeftConfidence!.fusedConfidence * 100).toStringAsFixed(0)}%');
        // v5.3.0: Log ANW assessment
        if (_leftResult!.anwAssessment != null) {
          final anw = _leftResult!.anwAssessment!;
          debugPrint('🟢 LEFT ANW: Ratio=${anw.ratio.toStringAsFixed(1)}% (${anw.ratioStatusLabel}), Form=${anw.formTypeName}');
          if (anw.bexelFindings.isNotEmpty) debugPrint('   Findings: ${anw.bexelFindings.join(", ")}' );
        }
      }

      // Compare pupils
      if (_leftResult != null && _rightResult != null) {
        setState(() {
          _statusMessage = l10n.comparingPupils;
          _progress = 0.8;
        });
        _anisocoriaResult = _assessAnisocoria(_leftResult!, _rightResult!);
      }

      _ageNormResult = _assessAgeNorms(_leftResult, _rightResult, widget.patientInfo.age);

      if (!_isPremium && !_isDesktop) {
        _remainingScans--;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('remaining_scans', _remainingScans);
      }
      _irisMetrics = BilateralIrisMetrics.calculate(globalRightEyeIrisSize, globalLeftEyeIrisSize);

      if (_irisMetrics != null) {
        debugPrint('📏 IRIS METRICS: OD=${_irisMetrics!.odIrisDiameterPx?.toStringAsFixed(0)}px, OS=${_irisMetrics!.osIrisDiameterPx?.toStringAsFixed(0)}px, Match=${_irisMetrics!.sizeMatchPercent?.toStringAsFixed(1)}%');
      }

      final scanRecord = ScanRecord.fromAnalysis(
        patient: widget.patientInfo,
        date: DateTime.now(),
        rightPath: widget.rightEyeImage?.path,
        leftPath: widget.leftEyeImage?.path,
        rightResult: _rightResult,
        leftResult: _leftResult,
        anisocoria: _anisocoriaResult,
        ageNorm: _ageNormResult,
      );
      await DatabaseHelper.instance.insertScan(scanRecord);

      setState(() {
        _isAnalyzing = false;
        _progress = 1.0;
      });

      // Generate therapy recommendations after analysis completes
      _buildHerbalRecs();
      _buildNutritionRecs();
      _buildChiropracticRecs();
      _buildTcmRecs();

      if (_autoSavePdf) {
        await _exportPdf();
      }

    } catch (e) {
      setState(() {
        _isAnalyzing = false;
        _errorMessage = l10n.analysisFailed(e.toString());
      });
    }
  }

  AnisocoriaAssessment _assessAnisocoria(EyeAnalysisResult left, EyeAnalysisResult right) {
    final l10n = AppLocalizations.of(context)!;
    final diff = (left.pupilIrisRatio - right.pupilIrisRatio).abs();
    final avg = (left.pupilIrisRatio + right.pupilIrisRatio) / 2;
    final relDiff = avg > 0 ? (diff / avg) * 100 : 0;

    String larger = left.pupilIrisRatio > right.pupilIrisRatio ? 'left' : 'right';
    if (diff < 0.5) larger = 'equal';

    AnisocoriaSeverity severity;
    String note;
    bool researchObs = false;

    if (diff < 2) {
      severity = AnisocoriaSeverity.none;
      note = l10n.anisocoriaNone;
    } else if (diff < 4) {
      severity = AnisocoriaSeverity.mild;
      note = l10n.mildSizeDiff;
    } else if (diff < 6) {
      severity = AnisocoriaSeverity.moderate;
      note = l10n.anisocoriaSeverityModerate;
      researchObs = true;
    } else {
      severity = AnisocoriaSeverity.severe;
      note = l10n.anisocoriaSeveritySevere;
      researchObs = true;
    }

    return AnisocoriaAssessment(
        absoluteDifference: diff,
        relativeDifference: relDiff.toDouble(),
        largerPupil: larger,
        severity: severity,
        clinicalNote: note,
        isTBIIndicator: researchObs,
        leftPupilRatio: left.pupilIrisRatio.toDouble(),
        rightPupilRatio: right.pupilIrisRatio.toDouble(),
        leftPupilDiameterPx: left.pupilDiameterPx,
        rightPupilDiameterPx: right.pupilDiameterPx
    );
  }

  AgeNormAssessment _assessAgeNorms(EyeAnalysisResult? left, EyeAnalysisResult? right, int age) {
    final l10n = AppLocalizations.of(context)!;
    final norm = _getPupilNormForAge(age);
    final localizedGroup = _localizedAgeGroup(l10n, norm.group);

    double avgRatio = 0;
    if (left != null && right != null) {
      avgRatio = (left.pupilIrisRatio + right.pupilIrisRatio) / 2;
    } else if (left != null) {
      avgRatio = left.pupilIrisRatio;
    } else if (right != null) {
      avgRatio = right.pupilIrisRatio;
    }

    final estMm = (avgRatio / 100) * 12;
    final dev = ((estMm - norm.expected) / norm.expected) * 100;

    PupilSizeStatus status;
    String interp;

    if (estMm < norm.min) {
      status = PupilSizeStatus.belowNormal;
      interp = l10n.belowBaseline(age, localizedGroup);
    } else if (estMm > norm.max) {
      status = PupilSizeStatus.aboveNormal;
      interp = l10n.aboveBaseline(age, localizedGroup);
    } else {
      status = PupilSizeStatus.normal;
      interp = l10n.withinBaseline(age, localizedGroup);
    }

    return AgeNormAssessment(
        patientAge: age,
        expectedDiameter: norm.expected,
        expectedRange: '${norm.min.toStringAsFixed(1)}-${norm.max.toStringAsFixed(1)}mm',
        measuredDiameter: estMm,
        percentDeviation: dev,
        status: status,
        interpretation: interp,
        ageGroup: localizedGroup,
        normalRatioRange: '20-30%'
    );
  }

  _PupilNormData _getPupilNormForAge(int age) {
    if (age < 1) return _PupilNormData(group: 'Infant', expected: 2.2, min: 2.0, max: 2.5);
    if (age < 6) return _PupilNormData(group: 'Child (1-5)', expected: 4.0, min: 3.5, max: 4.5);
    if (age < 12) return _PupilNormData(group: 'Child (6-11)', expected: 4.3, min: 3.8, max: 4.8);
    if (age < 20) return _PupilNormData(group: 'Teen', expected: 4.2, min: 3.5, max: 5.0);
    if (age < 40) return _PupilNormData(group: 'Adult (20-39)', expected: 3.5, min: 3.0, max: 4.2);
    if (age < 60) return _PupilNormData(group: 'Adult (40-59)', expected: 3.0, min: 2.5, max: 3.5);
    return _PupilNormData(group: 'Senior (60+)', expected: 2.7, min: 2.3, max: 3.2);
  }

  // Helper methods for UI
  Color _gradeColor(String g) => g == 'A' ? Colors.green : g == 'B' ? Colors.lightGreen : g == 'C' ? Colors.orange : Colors.red;
  Color _ratioColor(double r) => (r < 15 || r > 40) ? Colors.orange : Colors.green;

  String _ratioInterp(double r, AppLocalizations l10n) =>
      r < 15 ? l10n.miosis : r < 20 ? l10n.constricted : r <= 30 ? l10n.normal : r <= 40 ? l10n.dilated : l10n.mydriasis;

  String _anwInterp(double r, AppLocalizations l10n) =>
      r < 25 ? l10n.anwSpastic : r <= 35 ? l10n.normal : l10n.anwAtonic;

  String _formatZoneName(String zone) =>
      zone.split('-').map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w).join('-');

  String _localizedAgeGroup(AppLocalizations l10n, String group) {
    switch (group) {
      case 'Infant':
        return l10n.ageGroupInfant;
      case 'Child (1-5)':
        return l10n.ageGroupChild15;
      case 'Child (6-11)':
        return l10n.ageGroupChild611;
      case 'Teen':
        return l10n.ageGroupTeen;
      case 'Adult (20-39)':
        return l10n.ageGroupAdult2039;
      case 'Adult (40-59)':
        return l10n.ageGroupAdult4059;
      case 'Senior (60+)':
        return l10n.ageGroupSenior60Plus;
      default:
        return group;
    }
  }

  // v5.3.0: ANW status color helper
  Color _anwStatusColor(ANWRatioStatus status) {
    switch (status) {
      case ANWRatioStatus.spastic: return Colors.blue;
      case ANWRatioStatus.normal: return Colors.green;
      case ANWRatioStatus.atonic: return Colors.orange;
    }
  }

  String _localizedAnisocoriaSeverity(AnisocoriaSeverity severity, AppLocalizations l10n) {
    switch (severity) {
      case AnisocoriaSeverity.none:
        return l10n.normal;
      case AnisocoriaSeverity.mild:
        return l10n.mild;
      case AnisocoriaSeverity.moderate:
        return l10n.moderate;
      case AnisocoriaSeverity.severe:
        return l10n.significant;
    }
  }

  /// Non-diagnostic observation label for anisocoria — avoids clinical severity terms.
  String _anisocoriaObservationLabel(AnisocoriaSeverity severity, AppLocalizations l10n) {
    switch (severity) {
      case AnisocoriaSeverity.none:     return l10n.anisocoriaObservationSymmetrical;
      case AnisocoriaSeverity.mild:     return l10n.anisocoriaObservationSlight;
      case AnisocoriaSeverity.moderate: return l10n.anisocoriaObservationModerate;
      case AnisocoriaSeverity.severe:   return l10n.anisocoriaObservationMarked;
    }
  }

  String _localizedAnisocoriaNote(AnisocoriaAssessment assessment, AppLocalizations l10n) {
    switch (assessment.severity) {
      case AnisocoriaSeverity.none:
        return l10n.anisocoriaNone;
      case AnisocoriaSeverity.mild:
        return l10n.mildSizeDiff;
      case AnisocoriaSeverity.moderate:
        return l10n.anisocoriaSeverityModerate;
      case AnisocoriaSeverity.severe:
        return l10n.anisocoriaSeveritySevere;
    }
  }

  String _localizedAgeNormInterpretation(AgeNormAssessment assessment, AppLocalizations l10n) {
    final group = _localizedAgeGroup(l10n, assessment.ageGroup);
    switch (assessment.status) {
      case PupilSizeStatus.belowNormal:
        return l10n.belowBaseline(assessment.patientAge, group);
      case PupilSizeStatus.aboveNormal:
        return l10n.aboveBaseline(assessment.patientAge, group);
      case PupilSizeStatus.normal:
        return l10n.withinBaseline(assessment.patientAge, group);
    }
  }

  HybridConfidenceBreakdown? _hybridForEye(bool isRightEye) {
    return isRightEye ? _hybridRightConfidence : _hybridLeftConfidence;
  }

  double _displayConfidence(EyeAnalysisResult r, {required bool isRightEye}) {
    return (_hybridForEye(isRightEye)?.fusedConfidence ?? r.confidence)
        .clamp(0.0, 1.0)
        .toDouble();
  }

  String _gradeFromConfidence(double confidence) {
    final l10n = AppLocalizations.of(context)!;
    if (confidence >= 0.85) return l10n.gradeA;
    if (confidence >= 0.70) return l10n.gradeB;
    if (confidence >= 0.55) return l10n.gradeC;
    return l10n.gradeD;
  }

  String _displayGrade(EyeAnalysisResult r, {required bool isRightEye}) {
    final hybrid = _hybridForEye(isRightEye);
    if (hybrid == null) return r.qualityGrade;
    return _gradeFromConfidence(hybrid.fusedConfidence);
  }
// ============================================================================
// END OF SECTION 1 - Continue with SECTION 2
// ============================================================================
// ============================================================================
// SECTION 2 of 5: UI BUILDING METHODS
// Paste directly after SECTION 1
// ============================================================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_showPaywall) return _buildPaywall(l10n);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
              l10n.pupilAnalysis,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context)
          ),
          actions: [
            if (!_isPremium && !_isAnalyzing && !_isDesktop)  // Added !_isDesktop
              Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: _remainingScans > 3 ? Colors.green.withOpacity(0.3) : Colors.orange.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _remainingScans > 3 ? Colors.green : Colors.orange)
                  ),
                  child: Text(
                      l10n.scansLeft(_remainingScans),
                      style: TextStyle(
                          color: _remainingScans > 3 ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      )
                  )
              )
          ]
      ),
      body: _isAnalyzing
          ? _buildLoading(l10n)
          : _validationFailed
          ? _buildValidationFailed(l10n)
          : _errorMessage != null
          ? _buildError(l10n)
          : _buildResults(l10n),
    );
  }

  Widget _buildLoading(AppLocalizations l10n) => Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _animationController,
                builder: (_, __) => Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00D9FF), width: 3),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF00D9FF).withOpacity(
                                  0.3 + 0.2 * math.sin(_animationController.value * 2 * math.pi)
                              ),
                              blurRadius: 20,
                              spreadRadius: 5
                          )
                        ]
                    ),
                    child: const Icon(Icons.remove_red_eye, size: 60, color: Color(0xFF00D9FF))
                )
            ),
            const SizedBox(height: 40),
            SizedBox(
                width: 250,
                child: LinearProgressIndicator(
                    value: _progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[800],
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF00D9FF))
                )
            ),
            const SizedBox(height: 20),
            Text(_statusMessage, style: const TextStyle(color: Colors.white70, fontSize: 16)),
            const SizedBox(height: 12),
            Text(
                l10n.person(widget.patientInfo.name),
                style: const TextStyle(color: Colors.white38, fontSize: 14)
            )
          ]
      )
  );

  Widget _buildValidationFailed(AppLocalizations l10n) => Center(
      child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.withOpacity(0.2),
                        border: Border.all(color: Colors.red, width: 3)
                    ),
                    child: const Icon(Icons.visibility_off, size: 60, color: Colors.red)
                ),
                const SizedBox(height: 32),
                Text(
                    l10n.invalidEyeImage,
                    style: const TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 16),
                Text(
                    _errorMessage ?? '',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                    onPressed: widget.onRetake,
                    icon: const Icon(Icons.camera_alt),
                    label: Text(l10n.retake),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D9FF),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32)
                    )
                )
              ]
          )
      )
  );

  Widget _buildError(AppLocalizations l10n) => Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 24),
            Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
                onPressed: widget.onRetake,
                icon: const Icon(Icons.camera_alt),
                label: Text(l10n.retake),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: Colors.black
                )
            )
          ]
      )
  );

  Widget _buildResults(AppLocalizations l10n) => SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
          children: [
            _buildResearchDisclaimer(l10n),
            const SizedBox(height: 16),
            if (!_isPremium && _remainingScans <= 5 && !_isDesktop) _buildCreditBanner(l10n),
            _buildPatientInfoCard(l10n),
            const SizedBox(height: 16),
            _buildEyeImagesRow(l10n),
            const SizedBox(height: 20),
            if (_anisocoriaResult != null && _anisocoriaResult!.severity != AnisocoriaSeverity.none)
              _buildAnisocoriaCard(l10n),
            if (_ageNormResult != null) _buildAgeNormCard(l10n),
            if (_irisMetrics != null && _irisMetrics!.odIrisDiameterPx != null)
              _buildIrisMetricsCard(l10n),
            if (_rightResult != null)
              _buildResultCard(_rightResult!, l10n.rightEyeOD, true, l10n),
            if (_leftResult != null)
              _buildResultCard(_leftResult!, l10n.leftEyeOS, false, l10n),
            if (_leftResult != null && _rightResult != null)
              _buildComparisonCard(l10n),
            if (globalSelectedConstitution != null) ...[
              const SizedBox(height: 20),
              ConstitutionalPanel(
                constitution: findConstitution(globalSelectedConstitution!)!,
              ),
            ],
            if (_herbalModeEnabled) ...[
              const SizedBox(height: 20),
              HerbalRecommendationsPanel(recommendations: _herbalRecs),
            ],
            if (_nutritionModeEnabled) ...[
              const SizedBox(height: 20),
              NutritionRecommendationsPanel(recommendations: _nutritionRecs),
            ],
            if (_chiropracticModeEnabled) ...[
              const SizedBox(height: 20),
              ChiropracticRecommendationsPanel(recommendations: _chiropracticRecs),
            ],
            if (_tcmModeEnabled) ...[
              const SizedBox(height: 20),
              TcmRecommendationsPanel(recommendations: _tcmRecs),
            ],
            const SizedBox(height: 24),
            _buildActionButtons(l10n),
            const SizedBox(height: 32)
          ]
      )
  );

  Widget _buildResearchDisclaimer(AppLocalizations l10n) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.amber.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.amber, width: 2),
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              children: [
                const Icon(Icons.science, color: Colors.amber, size: 28),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(
                        l10n.researchEducationalToolOnly,
                        style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )
                    )
                ),
              ]
          ),
          const SizedBox(height: 12),
          Text(
            l10n.resultsNotMedicalDiagnoses,
            style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4),
          ),
        ]
    ),
  );

  Widget _buildPatientInfoCard(AppLocalizations l10n) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3))
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: const Color(0xFF00D9FF).withOpacity(0.2),
                          shape: BoxShape.circle
                      ),
                      child: Icon(
                          widget.patientInfo.sex == Sex.male ? Icons.male : Icons.female,
                          color: widget.patientInfo.sex == Sex.male ? Colors.blue : Colors.pink,
                          size: 24
                      )
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                widget.patientInfo.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Text(
                                '${widget.patientInfo.sexString}, ${widget.patientInfo.age} ${l10n.years}',
                                style: const TextStyle(color: Colors.white60, fontSize: 14)
                            )
                          ]
                      )
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.purple)
                      ),
                      child: Text(
                          '${l10n.ageYears.split(' ')[0]} ${widget.patientInfo.age}',
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          )
                      )
                  )
                ]
            ),
            if (widget.patientInfo.mainComplaints != null && widget.patientInfo.mainComplaints!.isNotEmpty) ...[
              const Divider(color: Colors.white12, height: 24),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.medical_information, color: Colors.orange, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${l10n.mainComplaints}:',
                                  style: const TextStyle(color: Colors.white54, fontSize: 12)
                              ),
                              const SizedBox(height: 4),
                              Text(
                                  widget.patientInfo.mainComplaints!,
                                  style: const TextStyle(color: Colors.white70, fontSize: 13)
                              )
                            ]
                        )
                    )
                  ]
              )
            ]
          ]
      )
  );

  Widget _buildEyeImagesRow(AppLocalizations l10n) => Row(
      children: [
        if (widget.rightEyeImage != null)
          Expanded(child: _buildThumb(widget.rightEyeImage!, l10n.rightEyeOD, _rightResult, isRightEye: true)),
        if (widget.rightEyeImage != null && widget.leftEyeImage != null)
          const SizedBox(width: 12),
        if (widget.leftEyeImage != null)
          Expanded(child: _buildThumb(widget.leftEyeImage!, l10n.leftEyeOS, _leftResult, isRightEye: false))
      ]
  );

Widget _buildThumb(File f, String label, EyeAnalysisResult? r, {required bool isRightEye}) {
    final grade = r != null ? _displayGrade(r, isRightEye: isRightEye) : null;
    final c = grade != null ? _gradeColor(grade) : Colors.grey;
    return Container(
        height: 180,
        decoration: BoxDecoration(
            color: const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: c, width: 2)
        ),
        child: Column(
            children: [
              Expanded(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              color: Colors.black,
                              child: Image.file(f, fit: BoxFit.contain, width: double.infinity),
                            ),
                          ),
                          if (r != null && _showZoneOverlay)
                            Positioned(
                              top: 6,
                              right: 6,
                              child: Material(
                                color: Colors.black.withOpacity(0.55),
                                borderRadius: BorderRadius.circular(20),
                                child: IconButton(
                                  tooltip: AppLocalizations.of(context)!.openZoneOverlay,
                                  onPressed: () => _openZoneOverlayDialog(
                                    f,
                                    label,
                                    r,
                                    isRightEye: widget.rightEyeImage?.path == f.path,
                                    irisDiameterPx: widget.rightEyeImage?.path == f.path
                                        ? _irisMetrics?.odIrisDiameterPx
                                        : _irisMetrics?.osIrisDiameterPx,
                                  ),
                                  icon: const Icon(Icons.radar, color: Color(0xFF00D9FF), size: 20),
                                ),
                              ),
                            ),
                        ],
                      )
                  )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: c.withOpacity(0.2),
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10))
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        if (r != null) ...[
                          const SizedBox(width: 8),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                  grade!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                          )
                        ]
                      ]
                  )
              )
            ]
        )
    );
  }

  void _openZoneOverlayDialog(
    File imageFile,
    String label,
    EyeAnalysisResult result, {
    required bool isRightEye,
    double? irisDiameterPx,   // iris diameter in original image pixels from analyzer
  }) {
    _overlaySearchAnchorPath = imageFile.path;
    bool showIris = true;
    bool showPupil = true;
    bool showANW = true;
    bool showAxis = true;
    bool showChart = false;
    String chartPreset = 'Jensen';  // Single chart — Integrative Iridology
    Offset imageOffset = Offset.zero;
    String hoveredZoneName = '';
    String hoveredZoneSystem = '';
    // Locked zone: set on tap only, persists while mouse moves away so the
    // Add Finding picker stays visible and interactive.
    String lockedZoneName = '';
    String lockedZoneSystem = '';
    // Observer notes: persists for this session, included in PDF/TXT/JSON exports
    final observerNotesController = TextEditingController(
      text: _overlayObserverNotes ?? '',
    );
    Map<String, dynamic>? loadedZoneData;
    PolarZoneData? polarZoneData;  // v5.3.1: Polar zone lookup

    // Auto-fit: compute irisRadiusFraction from analysis data + image natural size.
    // Falls back to 0.48 if iris size unavailable (better default than 0.38).
    double irisRadiusFraction = 0.48;
    double scaleAdjust = 1.0;     // user size fine-tune (slider)
    double chartOpacity = 0.85;   // user opacity (0=invisible hover-only, 1=full)
    double pupilRingScale = 1.0;  // fine-tune pupil ring size
    double anwRingScale = 1.0;    // fine-tune ANW/collarette ring size
    double irisLimbusScale = 1.0; // fine-tune iris limbus ring size
    Size _lastAutoFitSize = Size.zero; // re-run autoFit if container size changes

    // Decode image natural size to compute BoxFit.cover scale.
    // Called every time container resizes so the fraction stays correct.
    Future<void> autoFitIrisScale(Size containerSize, void Function(void Function()) setState) async {
      if (irisDiameterPx == null || irisDiameterPx! <= 0) return;
      try {
        final bytes = await imageFile.readAsBytes();
        final codec = await ui.instantiateImageCodec(bytes);
        final frame = await codec.getNextFrame();
        final imgW = frame.image.width.toDouble();
        final imgH = frame.image.height.toDouble();
        frame.image.dispose();

        // BoxFit.cover scale: the larger axis fills the container
        final cS = containerSize.width; // container is square
        final coverScale = math.max(cS / imgW, cS / imgH);

        // Iris radius in container pixels → fraction of container
        final irisRadiusInContainer = (irisDiameterPx! / 2.0) * coverScale;
        // Max fraction = pngIrisRadius/512 = 200/512 ≈ 0.390625
        // Above this value chartBoxSize = fraction * 2.56 * S > S, causing overflow + hit-test errors.
        // The scaleAdjust slider lets the user zoom up to 3x if they want smaller chart.
        final fraction = (irisRadiusInContainer / cS).clamp(0.10, 200.0 / 512.0);

        setState(() { irisRadiusFraction = fraction; });
      } catch (_) { /* keep default */ }
    }

    // Load zone JSON for hover hit-testing
    // v5.3.1: Load polar zone data first (anatomy-adaptive), fallback to old grid
    Future<void> loadZoneData(String preset, bool rightEye, void Function(void Function()) setState) async {
      final polar = await PolarZoneData.load(preset, rightEye);
      if (polar != null) {
        setState(() { polarZoneData = polar; loadedZoneData = null; });
        debugPrint('LOADED POLAR: ${preset}_${rightEye ? "od" : "os"}');
        return;
      }
      try {
        final side = rightEye ? 'od' : 'os';
        final prefix = preset.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_');
        final assetPath = 'assets/charts/${prefix}_${side}_zones.json';
        final jsonStr = await rootBundle.loadString(assetPath);
        final decoded = json.decode(jsonStr) as Map<String, dynamic>;
        debugPrint('LOADED CARTESIAN FALLBACK: ' + assetPath);
        setState(() { loadedZoneData = decoded; polarZoneData = null; });
      } catch (_) {
        setState(() { loadedZoneData = null; polarZoneData = null; });
      }
    }

    // PNG overlay constants: iris centered at (256,256) radius 200 in 512x512 PNG space.
    const double pngIrisCenter = 256.0;
    const double pngIrisRadius = 200.0;

    // Hit-test: grid-based direct lookup using Voronoi-filled 128×128 zone grid.
    // Each cell = 4×4 PNG pixels. Far more accurate than centroid distance scoring
    // because it handles the 60% background area correctly.
    // v5.3.1: Hit-test using polar zones (preferred) with old grid fallback
    Map<String, String> hitTestZone(Offset tapPos, Size containerSize, Map<String, dynamic>? zoneData) {
      // Polar lookup (anatomy-adaptive) — preferred path
      if (polarZoneData != null) {
        return polarZoneData!.hitTest(
          tapPos: tapPos, containerSize: containerSize,
          pupilIrisRatio: result.pupilIrisRatio,
          anwRingScale: anwRingScale,
          irisRadiusFraction: irisRadiusFraction * scaleAdjust,
        );
      }
      // Old Cartesian grid fallback
      if (zoneData == null) return {};
      final S = containerSize.width;

      // Map screen tap → PNG pixel coords (same formula as chart SizedBox rendering)
      final rawBox = S * irisRadiusFraction * scaleAdjust * (512.0 / pngIrisRadius);
      final chartBoxSize = rawBox.clamp(0.0, S);
      final H = containerSize.height;
      final chartLeft = (S - chartBoxSize) / 2.0;
      // Use container HEIGHT for vertical offset — Stack(expand) centers the
      // chart SizedBox at (H-chartBoxSize)/2, not (S-chartBoxSize)/2.
      final chartTop  = (H - chartBoxSize) / 2.0;
      final px = (tapPos.dx - chartLeft) / chartBoxSize * 512.0;
      final py = (tapPos.dy - chartTop)  / chartBoxSize * 512.0;

      // Reject outside iris limbus or inside pupil
      final tapR = math.sqrt((px - pngIrisCenter) * (px - pngIrisCenter) +
                             (py - pngIrisCenter) * (py - pngIrisCenter));
      if (tapR > pngIrisRadius + 8) return {};
      final pngPupilRadius = pngIrisRadius * (result.pupilIrisRatio / 100.0).clamp(0.05, 0.60);
      if (tapR < pngPupilRadius) return {'name': 'Pupil', 'system': 'Autonomic Center'};

      // 2-Point Radial Warp: correct for eye-specific P/I ratio and ANW position.
      // Chart constants (from PR file analysis):
      const double chartPupilR = 41.0;   // pupil zone boundary in chart PNG space
      const double chartAnwR   = 82.0;   // collarette/ANW ring in chart PNG space
      const double chartIrisR  = 200.0;  // iris limbus in chart PNG space
      // Real-eye radii in PNG coordinate space (pngIrisRadius = 200):
      final double realPupilR  = pngIrisRadius * (result.pupilIrisRatio / 100.0).clamp(0.05, 0.55);
      final double realAnwR    = realPupilR + pngIrisRadius * 0.15 * anwRingScale;
      // Inverse warp: convert tap radius in PNG space → chart radius in PNG space
      double warpedR;
      if (tapR <= 0) {
        warpedR = 0;
      } else if (tapR <= realPupilR) {
        warpedR = tapR * (chartPupilR / realPupilR);
      } else if (tapR <= realAnwR) {
        final frac = (tapR - realPupilR) / (realAnwR - realPupilR);
        warpedR = chartPupilR + frac * (chartAnwR - chartPupilR);
      } else {
        final frac = (tapR - realAnwR) / (chartIrisR - realAnwR);
        warpedR = chartAnwR + frac * (chartIrisR - chartAnwR);
      }
      // Recompute lookup coords using warped radius (same angle, corrected radius)
      final double warpScale = (tapR > 0.5) ? (warpedR / tapR) : 1.0;
      final double wpx = pngIrisCenter + (px - pngIrisCenter) * warpScale;
      final double wpy = pngIrisCenter + (py - pngIrisCenter) * warpScale;

      // Grid lookup: map warped PNG coords → grid cell index
      final gridSize = (zoneData['gridSize'] as int? ?? 128);
      final step = 512.0 / gridSize;
      final gx = (wpx / step).floor().clamp(0, gridSize - 1);
      final gy = (wpy / step).floor().clamp(0, gridSize - 1);
      final flat = zoneData['grid'] as List<dynamic>;
      final zoneId = flat[gy * gridSize + gx] as int;
      // TEMP DEBUG: see console for coordinate trace
      debugPrint('HIT tap=' + tapPos.dx.toStringAsFixed(1) + ',' + tapPos.dy.toStringAsFixed(1)
        + ' S=' + S.toStringAsFixed(1) + ' H=' + H.toStringAsFixed(1)
        + ' box=' + chartBoxSize.toStringAsFixed(1)
        + ' png=' + px.toStringAsFixed(1) + ',' + py.toStringAsFixed(1)
        + ' tapR=' + tapR.toStringAsFixed(1)
        + ' gx=' + gx.toString() + ' gy=' + gy.toString()
        + ' zone=' + zoneId.toString());

      if (zoneId == 0 || zoneId == 255) return {};

      final idToName = zoneData['idToName'] as Map<String, dynamic>?;
      final idToSys  = zoneData['idToSys']  as Map<String, dynamic>?;
      final name = idToName?[zoneId.toString()] as String? ?? '';
      final sys  = idToSys?[zoneId.toString()] as String? ?? '';
      if (name.isEmpty) return {};
      return {'name': name, 'system': sys};
    }

    // Approximate auto-centering from decentration vector (educational estimate only).
    final decentrationRatio = _normalizeDecentrationRatio(result.decentralization);
    final angleRad = (result.decentralizationAngle - 90) * math.pi / 180;
    final autoCenterOffset = Offset(
      -math.cos(angleRad) * (decentrationRatio * 90),
      -math.sin(angleRad) * (decentrationRatio * 90),
    );

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocalState) {
          // Kick off zone data load on first build and when preset changes
          if (showChart && loadedZoneData == null && polarZoneData == null) {
            loadZoneData(chartPreset, isRightEye, setLocalState);
          }
          final l10n = AppLocalizations.of(ctx)!;
          return AlertDialog(
          backgroundColor: const Color(0xFF1D1E33),
          title: Row(
            children: [
              const Icon(Icons.radar, color: Color(0xFF00D9FF)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$label • ${l10n.zoneOverlay}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: 760,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  children: [
                    FilterChip(
                      selectedColor: const Color(0x3300D9FF),
                      checkmarkColor: const Color(0xFF00D9FF),
                      label: Text(AppLocalizations.of(context)!.iris, style: const TextStyle(color: Colors.white)),
                      selected: showIris,
                      onSelected: (v) => setLocalState(() => showIris = v),
                    ),
                    FilterChip(
                      selectedColor: const Color(0x3300D9FF),
                      checkmarkColor: const Color(0xFF00D9FF),
                      label: Text(l10n.pupil, style: const TextStyle(color: Colors.white)),
                      selected: showPupil,
                      onSelected: (v) => setLocalState(() => showPupil = v),
                    ),
                    FilterChip(
                      selectedColor: const Color(0x3300D9FF),
                      checkmarkColor: const Color(0xFF00D9FF),
                      label: Text(l10n.anwRing, style: const TextStyle(color: Colors.white)),
                      selected: showANW,
                      onSelected: (v) => setLocalState(() => showANW = v),
                    ),
                    FilterChip(
                      selectedColor: const Color(0x3300D9FF),
                      checkmarkColor: const Color(0xFF00D9FF),
                      label: Text(l10n.axisGrid, style: const TextStyle(color: Colors.white)),
                      selected: showAxis,
                      onSelected: (v) => setLocalState(() => showAxis = v),
                    ),
                    FilterChip(
                      selectedColor: const Color(0x3300D9FF),
                      checkmarkColor: const Color(0xFF00D9FF),
                      label: Text(l10n.chart, style: const TextStyle(color: Colors.white)),
                      selected: showChart,
                      onSelected: (v) => setLocalState(() => showChart = v),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => setLocalState(() => imageOffset = autoCenterOffset),
                      icon: const Icon(Icons.center_focus_strong, size: 16),
                      label: Text(l10n.autoCenter),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => setLocalState(() {
                        imageOffset = Offset.zero;
                        scaleAdjust = 1.0;
                        chartOpacity = 0.85;
                        pupilRingScale = 1.0;
                        anwRingScale = 1.0;
                        irisLimbusScale = 1.0;
                        _lastAutoFitSize = Size.zero; // force autoFit re-run
                      }),
                      icon: const Icon(Icons.restart_alt, size: 16),
                      label: Text(l10n.reset),
                    ),
                    if (showChart) ...[
                      // Size slider (expanded max to 3.0 for larger screens)
                      const SizedBox(width: 4),
                      Tooltip(message: l10n.chartSizeTooltip, child: const Icon(Icons.zoom_out, color: Colors.white38, size: 14)),
                      SizedBox(
                        width: 90,
                        child: Slider(
                          value: scaleAdjust, min: 0.5, max: 3.0, divisions: 50,
                          activeColor: const Color(0xFF00D9FF), inactiveColor: Colors.white12,
                          onChanged: (v) => setLocalState(() => scaleAdjust = v),
                        ),
                      ),
                      Tooltip(message: l10n.chartSizeTooltip, child: const Icon(Icons.zoom_in, color: Colors.white38, size: 14)),
                      const SizedBox(width: 8),
                      // Opacity slider
                      Tooltip(message: l10n.chartOpacityAdvancedTooltip, child: const Icon(Icons.visibility_off, color: Colors.white38, size: 14)),
                      SizedBox(
                        width: 90,
                        child: Slider(
                          value: chartOpacity, min: 0.0, max: 1.0, divisions: 20,
                          activeColor: Colors.purpleAccent, inactiveColor: Colors.white12,
                          onChanged: (v) => setLocalState(() => chartOpacity = v),
                        ),
                      ),
                      Tooltip(message: AppLocalizations.of(context)!.chartOpacity, child: const Icon(Icons.visibility, color: Colors.white38, size: 14)),
                    ],
                    // Ring size controls — shown in a tidy row below chart sliders
                    if (showIris || showPupil || showANW) ...[
                      const SizedBox(width: 4),
                      Text(AppLocalizations.of(context)!.iris, style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 10)),
                      SizedBox(width: 60, child: Slider(value: irisLimbusScale, min: 0.5, max: 2.0, divisions: 30, activeColor: const Color(0xFF00D9FF), inactiveColor: Colors.white12, onChanged: (v) => setLocalState(() => irisLimbusScale = v))),
                      Text(l10n.pupil, style: const TextStyle(color: Colors.greenAccent, fontSize: 10)),
                      SizedBox(width: 60, child: Slider(value: pupilRingScale, min: 0.5, max: 2.0, divisions: 30, activeColor: Colors.greenAccent, inactiveColor: Colors.white12, onChanged: (v) => setLocalState(() => pupilRingScale = v))),
                      Text(l10n.anwLabel, style: const TextStyle(color: Colors.orangeAccent, fontSize: 10)),
                      SizedBox(width: 60, child: Slider(value: anwRingScale, min: 0.5, max: 2.5, divisions: 40, activeColor: Colors.orangeAccent, inactiveColor: Colors.white12, onChanged: (v) => setLocalState(() => anwRingScale = v))),
                    ],

                    Text(
                      l10n.tipDragImage,
                      style: TextStyle(color: Colors.white54, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: LayoutBuilder(
                              builder: (lbCtx, lbConstraints) {
                                final containerSize = Size(lbConstraints.maxWidth, lbConstraints.maxHeight);
                                final S = containerSize.width;
                                // Re-run autoFit every time the container size changes
                                // This keeps the chart correctly sized after window resize
                                if (S > 0 && containerSize != _lastAutoFitSize) {
                                  _lastAutoFitSize = containerSize;
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    autoFitIrisScale(containerSize, setLocalState);
                                  });
                                }
                                final effectiveFraction = irisRadiusFraction * scaleAdjust;
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: MouseRegion(
                                    onHover: (event) {
                                      if (showChart && (loadedZoneData != null || polarZoneData != null)) {
                                        final hit = hitTestZone(event.localPosition, containerSize, loadedZoneData);
                                        setLocalState(() { hoveredZoneName = hit['name'] ?? ''; hoveredZoneSystem = hit['system'] ?? ''; });
                                      }
                                    },
                                    onExit: (_) => setLocalState(() { hoveredZoneName = ''; hoveredZoneSystem = ''; }),
                                    child: GestureDetector(
                                      onPanUpdate: (details) => setLocalState(() => imageOffset += details.delta),
                                      onTapDown: (details) {
                                        if (showChart && (loadedZoneData != null || polarZoneData != null)) {
                                          final hit = hitTestZone(details.localPosition, containerSize, loadedZoneData);
                                          final zoneName = hit['name'] ?? '';
                                          final zoneSys  = hit['system'] ?? '';
                                          if (zoneName.isNotEmpty) {
                                            setLocalState(() {
                                              hoveredZoneName = zoneName;
                                              hoveredZoneSystem = zoneSys;
                                              lockedZoneName = zoneName;
                                              lockedZoneSystem = zoneSys;
                                            });
                                            final lang = Localizations.localeOf(ctx).languageCode;
                                            final label = ZoneTranslations.translate(zoneName, lang);
                                            final sys   = zoneSys.isNotEmpty ? ZoneTranslations.translateSystem(zoneSys, lang) : '';
                                            final entry = sys.isNotEmpty ? '$label — $sys' : label;
                                            final existing = observerNotesController.text;
                                            if (!existing.contains(entry)) {
                                              observerNotesController.text = existing.isEmpty ? entry : '$existing\n$entry';
                                              observerNotesController.selection = TextSelection.collapsed(offset: observerNotesController.text.length);
                                            }
                                          }
                                        }
                                      },
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Transform.translate(offset: imageOffset, child: Image.file(imageFile, fit: BoxFit.cover)),
                                          CustomPaint(
                                            painter: _EyeZoneOverlayPainter(
                                              result: result, showIris: showIris, showPupil: showPupil,
                                              showANW: showANW, showAxis: showAxis,
                                              showChart: false,
                                              chartPreset: chartPreset,
                                              irisRadiusFraction: irisRadiusFraction * scaleAdjust,
                                              pupilRingScale: pupilRingScale, anwRingScale: anwRingScale,
                                              irisLimbusScale: irisLimbusScale,
                                            ),
                                          ),
                                          if (showChart)
                                            // Chart overlay: SizedBox sized to chartBoxSize×chartBoxSize,
                                            // centered in the container. ClipRect hard-clips at container boundary.
                                            // Formula matches hitTestZone exactly: S * fraction * scaleAdjust * (512/pngIrisRadius)
                                            IgnorePointer(
                                              child: ClipRect(
                                                clipBehavior: Clip.hardEdge,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width:  (S * irisRadiusFraction * scaleAdjust * (512.0 / pngIrisRadius)).clamp(0.0, S),
                                                    height: (S * irisRadiusFraction * scaleAdjust * (512.0 / pngIrisRadius)).clamp(0.0, S),
                                                    child: _buildChartAssetOverlay(
                                                      chartPreset: chartPreset,
                                                      isRightEye: isRightEye,
                                                      fallback: Opacity(
                                                        opacity: chartOpacity,
                                                        child: polarZoneData != null
                                                            ? CustomPaint(
                                                                painter: DynamicChartPainter(
                                                                  polarData: polarZoneData!,
                                                                  realPupilFrac: (result.pupilIrisRatio / 100.0).clamp(0.05, 0.55),
                                                                  realCollaretteFrac: ((result.pupilIrisRatio / 100.0) + 0.15 * anwRingScale).clamp(0.20, 0.70),
                                                                  opacity: chartOpacity,
                                                                  showLabels: true,
                                                                  outlineOnly: chartOpacity > 0.3,
                                                                ),
                                                                size: Size.infinite,
                                                              )
                                                            : const SizedBox.expand(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          if (showChart)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 6),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A0E21),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: chartOpacity < 0.05 ? Colors.purpleAccent.withOpacity(0.6) : const Color(0xFF00D9FF).withOpacity(0.4)),
                              ),
                              child: hoveredZoneName.isEmpty
                                ? Text(chartOpacity < 0.05 ? l10n.organsMode : l10n.hoverToIdentify,
                                    style: TextStyle(color: chartOpacity < 0.05 ? Colors.purpleAccent.withOpacity(0.8) : Colors.white38, fontSize: 12, fontStyle: FontStyle.italic))
                                : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text(ZoneTranslations.translate(hoveredZoneName, Localizations.localeOf(ctx).languageCode), style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                                    if (hoveredZoneSystem.isNotEmpty)
                                      Text(ZoneTranslations.translateSystem(hoveredZoneSystem, Localizations.localeOf(ctx).languageCode), style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 11)),
                                  ]),
                            ),
                          const SizedBox(height: 6),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0A0E21), borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.observerNotes, style: const TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                                const SizedBox(height: 4),
                                TextField(
                                  controller: observerNotesController, maxLines: 3, minLines: 2,
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                  decoration: InputDecoration(
                                    hintText: l10n.observerNotesHint,
                                    hintStyle: const TextStyle(color: Colors.white30, fontSize: 11),
                                    border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IrisAnomalyPicker(
                            zoneName: lockedZoneName,
                            zoneSystem: lockedZoneSystem,
                            onAddFinding: (finding) {
                              final existing = observerNotesController.text;
                              observerNotesController.text = existing.isEmpty
                                  ? finding
                                  : '$existing\n$finding';
                              observerNotesController.selection =
                                  TextSelection.collapsed(
                                      offset: observerNotesController.text.length);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: _buildOverlayMetricsPanel(result, isRightEye: isRightEye),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Persist observer notes to class field for export
                      if (observerNotesController.text.trim().isNotEmpty) {
                        _overlayObserverNotes = observerNotesController.text.trim();
                      }
                      Navigator.pop(ctx);
                    },
                    child: Text(l10n.close),
                  ),
                ),
              ],
            ),
            ),
          ),
        );
        }, // end StatefulBuilder builder
      ),
    );
  }

  double _normalizeDecentrationRatio(dynamic value) {
  if (value is EyeAnalysisResult) {
    return (value.decentralization.clamp(0.0, 30.0) / 100).toDouble();
  }
  if (value is num) {
    return (value.toDouble().clamp(0.0, 30.0) / 100).toDouble();
  }
  return 0.0;
}

  List<String> _chartOverlayCandidates({
    required String chartPreset,
    required bool isRightEye,
  }) {
    final preset = chartPreset.toLowerCase().replaceAll(' ', '-');
    final side = isRightEye ? 'od' : 'os';
    return <String>[
      'assets/charts/${preset}_${side}_overlay.png',
      'assets/charts/${preset}_${side}_mask.png',
      'assets/charts/${preset}_overlay.png',
      'assets/charts/${preset}_mask.png',
    ];
  }

bool _hasGeneratedChartOverlay({
  required String chartPreset,
  required bool isRightEye,
}) {
  return _chartOverlayCandidates(chartPreset: chartPreset, isRightEye: isRightEye).isNotEmpty;
}

String _chartSourceLabel({
  required String chartPreset,
  required bool isRightEye,
}) {
  return _hasGeneratedChartOverlay(chartPreset: chartPreset, isRightEye: isRightEye)
      ? 'Bundled chart asset'
      : 'Built-in fallback';
}

String? _chartSourcePathPreview({
  required String chartPreset,
  required bool isRightEye,
}) {
  final candidates = _chartOverlayCandidates(chartPreset: chartPreset, isRightEye: isRightEye);
  return candidates.isEmpty ? null : candidates.first;
}

  String _chartSearchRootsPreview() {
  return 'assets/charts';
}
  Widget _buildChartAssetOverlay({
    required String chartPreset,
    required bool isRightEye,
    required Widget fallback,
  }) {
    final candidates = _chartOverlayCandidates(
      chartPreset: chartPreset,
      isRightEye: isRightEye,
    );
    return _buildFallbackChartAsset(candidates, fallback: fallback, applyTint: true);
  }

  Widget _buildFallbackChartAsset(
    List<String> candidates, {
    required Widget fallback,
    bool applyTint = false,
  }) {
    if (candidates.isEmpty) return fallback;
    Widget image = Image.asset(
      candidates.first,
      fit: BoxFit.fill,
      errorBuilder: (_, __, ___) => _buildFallbackChartAsset(
        candidates.sublist(1),
        fallback: fallback,
        applyTint: applyTint,
      ),
    );
    if (applyTint) {
      image = ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        child: image,
      );
    }
    return image;
  }

Widget _buildOverlayMetricsPanel(EyeAnalysisResult r, {required bool isRightEye}) {
  final l10n = AppLocalizations.of(context)!;
  Widget metric(String label, double value, String unit, Color color) {
    final clamped = (value / 100).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ${value.toStringAsFixed(1)}$unit', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: clamped,
              minHeight: 8,
              valueColor: AlwaysStoppedAnimation(color),
              backgroundColor: Colors.white12,
            ),
          ),
        ],
      ),
    );
  }

  final anomalies = _buildPupilAnomalyNotes(r, isRightEye: isRightEye);

  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFF131426),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF00D9FF).withOpacity(0.3)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.overlayMetrics, style: const TextStyle(color: Color(0xFF00D9FF), fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        metric(l10n.piRatioLabel.replaceAll(':', ''), r.pupilIrisRatio, '%', const Color(0xFF00D9FF)),
        metric(l10n.ellipsenessLabel.replaceAll(':', ''), r.ellipseness, '%', Colors.greenAccent),
        metric(l10n.decentralizationLabel.replaceAll(':', ''), r.decentralization, '%', Colors.orangeAccent),
        metric(l10n.confidence, _displayConfidence(r, isRightEye: isRightEye) * 100, '%', Colors.purpleAccent),
        const SizedBox(height: 6),
        Text(l10n.detectedFindings, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        ...anomalies,
        const SizedBox(height: 4),
        Text(
          l10n.manualAlignmentAid,
          style: TextStyle(color: Colors.white54, fontSize: 11),
        ),
      ],
    ),
  );
}

List<Widget> _buildPupilAnomalyNotes(EyeAnalysisResult r, {required bool isRightEye}) {
  final l10n = AppLocalizations.of(context)!;
  final loc = PupilAnalyzerLocalizations(l10n);

  Widget noteText(String t, {Color color = const Color(0xFFBBBBCC)}) => Padding(
    padding: const EdgeInsets.only(bottom: 3),
    child: Text('• $t', style: TextStyle(color: color, fontSize: 11)),
  );

  Widget sectionLabel(String t, Color c) => Padding(
    padding: const EdgeInsets.only(top: 6, bottom: 2),
    child: Text(t, style: TextStyle(color: c, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.6)),
  );

  final pupilWidgets = <Widget>[];
  final anwWidgets    = <Widget>[];

  // ── Pupil size & age ratio ──────────────────────────────────────────────
  final piPct = r.pupilIrisRatio;
  final ageNorm = _ageNormResult;
  String sizeNote = '${l10n.piRatioLabel} ${piPct.toStringAsFixed(1)}%';
  if (ageNorm != null) {
    final range = ageNorm.expectedRange;
    sizeNote += '  (${l10n.ageBasedResearchBaseline.toLowerCase()}: $range%)';
  }
  pupilWidgets.add(noteText(sizeNote, color: const Color(0xFF00D9FF)));

  // Pupil diameter estimate using measured iris px if available via irisMetrics
  final irisPx = (isRightEye
      ? _irisMetrics?.odIrisDiameterPx
      : _irisMetrics?.osIrisDiameterPx);
  if (irisPx != null && irisPx > 0) {
    // Approximate mm using typical iris diameter of ~11.7mm as reference
    final irisMmEst = 11.7;
    final pupilMm = irisMmEst * (piPct / 100);
    pupilWidgets.add(noteText('${l10n.pupilSizeLabel} ~${pupilMm.toStringAsFixed(2)} mm  |  Iris: ~${irisMmEst.toStringAsFixed(1)} mm est.'));
  }

  // ── Pupil form ──────────────────────────────────────────────────────────
  if (r.ellipseAssessment != null &&
      r.ellipseAssessment!.formType != PupilFormType.circle) {
    pupilWidgets.add(noteText('${l10n.formLabel} ${loc.getFormTypeName(r.ellipseAssessment!.formType)}'));
  }

  // ── Decentration ────────────────────────────────────────────────────────
  if (r.decentrationAssessment != null &&
      r.decentrationAssessment!.pattern != DecentrationPattern.centered) {
    pupilWidgets.add(noteText('${l10n.decentrationLabel} ${loc.getPatternName(r.decentrationAssessment!.pattern)}'));
  }

  // ── Flattenings / protrusions ────────────────────────────────────────────
  if (r.flattenings.isNotEmpty) {
    final top = r.flattenings.reduce((a, b) => a.percentage >= b.percentage ? a : b);
    pupilWidgets.add(noteText('${l10n.flatteningLabel} ${loc.getZoneName(top.zone)} (${top.clockPosition}) ${top.percentage.toStringAsFixed(1)}%'));
  }
  if (r.protrusions.isNotEmpty) {
    final top = r.protrusions.reduce((a, b) => a.percentage >= b.percentage ? a : b);
    pupilWidgets.add(noteText('${l10n.protrusionLabel} ${loc.getZoneName(top.zone)} (${top.clockPosition}) ${top.percentage.toStringAsFixed(1)}%'));
  }

  if (pupilWidgets.isEmpty) {
    pupilWidgets.add(noteText(isRightEye ? l10n.noMajorODAnomalies : l10n.noMajorOSAnomalies));
  }

  // ── ANW / collarette ────────────────────────────────────────────────────
  if (r.anwAssessment != null) {
    final anw = r.anwAssessment!;
    anwWidgets.add(noteText('${l10n.anwRatioLabel} ${anw.ratio.toStringAsFixed(1)}% — ${_getLocalizedRatioStatus(anw.ratioStatus, l10n)}',
        color: anw.isOverallNormal ? const Color(0xFFBBBBCC) : Colors.orangeAccent));
    if (anw.tonicState != null && anw.tonicState!.isNotEmpty) {
      anwWidgets.add(noteText('${l10n.anwToneLabel} ${_getLocalizedTonicState(anw.tonicState!, l10n)}'));
    }
  } else {
    anwWidgets.add(noteText(l10n.anwNotAssessed));
  }

  return [
    sectionLabel(l10n.pupil, Colors.greenAccent.withOpacity(0.8)),
    ...pupilWidgets,
    sectionLabel(l10n.anwCollarette, Colors.orangeAccent.withOpacity(0.8)),
    ...anwWidgets,
  ];
}

  Widget _buildIrisMetricsCard(AppLocalizations l10n) {
    if (_irisMetrics == null) return const SizedBox.shrink();

    final m = _irisMetrics!;
    final hasData = m.odIrisDiameterPx != null && m.osIrisDiameterPx != null;
    final color = m.isWellMatched ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.straighten, color: color, size: 24),
              const SizedBox(width: 12),
              Text(
                l10n.captureDistanceMatch,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (hasData)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    '${m.sizeMatchPercent?.toStringAsFixed(0)}%',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          if (hasData) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _irisMetricItem(l10n.od, '${m.odIrisDiameterPx?.toStringAsFixed(0)}px', Colors.blue),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Text(l10n.diff, style: const TextStyle(color: Colors.white54, fontSize: 10)),
                      Text('${m.sizeDifferencePx?.toStringAsFixed(0)}px', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                _irisMetricItem(l10n.os, '${m.osIrisDiameterPx?.toStringAsFixed(0)}px', Colors.green),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(m.isWellMatched ? Icons.check_circle : Icons.warning, color: color, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(m.distanceMatchStatus, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500))),
                ],
              ),
            ),
          ] else
            Text(AppLocalizations.of(context)!.irisSizeNotAvailable, style: const TextStyle(color: Colors.white54, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _irisMetricItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: color, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(AppLocalizations.of(context)!.irisDiameterLabel, style: const TextStyle(color: Colors.white38, fontSize: 10)),
      ],
    );
  }

  Widget _buildAnisocoriaCard(AppLocalizations l10n) {
    final r = _anisocoriaResult!;
    final c = r.severity == AnisocoriaSeverity.severe
        ? Colors.red
        : (r.severity == AnisocoriaSeverity.moderate ? Colors.orange : Colors.yellow.shade700);

    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: c.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c, width: 2)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Icon(r.isTBIIndicator ? Icons.warning : Icons.info_outline, color: c, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Text(
                            r.isTBIIndicator ? l10n.significantPupilSizeDiff : l10n.pupilSizeDifference,
                            style: TextStyle(color: c, fontSize: 18, fontWeight: FontWeight.bold)
                        )
                    )
                  ]
              ),
              const Divider(color: Colors.white24, height: 24),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        children: [
                          Text(l10n.rightEyeOD, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                          Text('${r.rightPupilRatio.toStringAsFixed(1)}%',
                              style: TextStyle(color: r.largerPupil == 'right' ? Colors.orange : Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                        ]
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(20)),
                        child: Text('${r.absoluteDifference.toStringAsFixed(1)}% ${l10n.diff}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                    ),
                    Column(
                        children: [
                          Text(l10n.leftEyeOS, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                          Text('${r.leftPupilRatio.toStringAsFixed(1)}%',
                              style: TextStyle(color: r.largerPupil == 'left' ? Colors.orange : Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                        ]
                    )
                  ]
              ),
              const SizedBox(height: 16),
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8)),
                  child: Text(_localizedAnisocoriaNote(r, l10n), style: const TextStyle(color: Colors.white, fontSize: 13))
              ),
              if (r.isTBIIndicator)
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber)
                    ),
                    child: Row(
                        children: [
                          const Icon(Icons.science, color: Colors.amber, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                              child: Text(l10n.researchObservationConsult,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))
                          )
                        ]
                    )
                )
            ]
        )
    );
  }

  Widget _buildAgeNormCard(AppLocalizations l10n) {
    final r = _ageNormResult!;
    final c = r.status == PupilSizeStatus.normal
        ? Colors.green
        : (r.status == PupilSizeStatus.belowNormal ? Colors.blue : Colors.orange);
    final statusIcon = r.status == PupilSizeStatus.normal
        ? Icons.check_circle
        : (r.status == PupilSizeStatus.belowNormal ? Icons.arrow_downward : Icons.arrow_upward);

    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.withOpacity(0.5))
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    const Icon(Icons.cake, color: Colors.purple, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Text(l10n.ageBasedResearchBaseline,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
                        child: Text('${l10n.ageYears.split(' ')[0]} ${r.patientAge}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))
                    )
                  ]
              ),
              const Divider(color: Colors.white24, height: 24),
              Text(l10n.group(r.ageGroup), style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),
              Row(
                  children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.researchRange, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                              Text(r.expectedRange, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                            ]
                        )
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.measuredEst, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                              Row(
                                  children: [
                                    Text('~${r.measuredDiameter.toStringAsFixed(1)}mm',
                                        style: TextStyle(color: c, fontSize: 18, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 8),
                                    Icon(statusIcon, color: c, size: 20)
                                  ]
                              )
                            ]
                        )
                    )
                  ]
              ),
              const SizedBox(height: 12),
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: c.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: c.withOpacity(0.3))
                  ),
                  child: Row(
                      children: [
                        Icon(statusIcon, color: c, size: 20),
                        const SizedBox(width: 8),
                        Expanded(child: Text(_localizedAgeNormInterpretation(r, l10n), style: const TextStyle(color: Colors.white, fontSize: 13)))
                      ]
                  )
              )
            ]
        )
    );
  }

// END OF SECTION 2 - Continue with SECTION 3
// ============================================================================
// SECTION 3 of 4: RESULT CARDS, COMPARISON, ACTION BUTTONS, AND PAYWALL
// Paste directly after SECTION 2
// ============================================================================
// ============================================================================
// SECTION 3 of 5: RESULT CARDS, ANW CARD, COMPARISON, ACTION BUTTONS, PAYWALL
// Paste directly after SECTION 2
// ============================================================================

  Widget _buildResultCard(EyeAnalysisResult r, String title, bool isRightEye, AppLocalizations l10n) {
    final localizer = PupilAnalyzerLocalizations.of(context);
    final displayGrade = _displayGrade(r, isRightEye: isRightEye);

    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _gradeColor(displayGrade).withOpacity(0.5))
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Icon(Icons.remove_red_eye, color: _gradeColor(displayGrade), size: 28),
                    const SizedBox(width: 12),
                    Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: _gradeColor(displayGrade), borderRadius: BorderRadius.circular(20)),
                        child: Text('${l10n.grade} $displayGrade',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))
                    )
                  ]
              ),
              const Divider(color: Colors.white24, height: 24),

              _buildMeas(l10n.piRatio, '${r.pupilIrisRatio.toStringAsFixed(1)}%', _ratioColor(r.pupilIrisRatio), _ratioInterp(r.pupilIrisRatio, l10n)),
              _buildMeas(l10n.ellipseness, '${r.ellipseness.toStringAsFixed(1)}%', r.ellipseness >= 90 ? Colors.green : Colors.orange, r.ellipseness >= 90 ? l10n.normal : l10n.elliptical),
              _buildMeas(l10n.circularity, '${r.circularityScore.toStringAsFixed(1)}%', r.circularityScore >= 95 ? Colors.green : Colors.orange, r.circularityScore >= 95 ? l10n.circular : l10n.irregular),
              _buildMeas(l10n.decentralization, '${r.decentralization.toStringAsFixed(1)}%', r.decentralization < 5 ? Colors.green : Colors.orange, r.decentralization < 5 ? l10n.centered : l10n.offset),

              if (r.ellipseAssessment != null) _buildPupilFormCard(r.ellipseAssessment!, localizer, l10n),
              if (r.decentrationAssessment != null && r.decentrationAssessment!.pattern != DecentrationPattern.centered)
                _buildDecentrationCard(r.decentrationAssessment!, localizer, isRightEye, l10n),
              if (r.flattenings.isNotEmpty) _buildAnomalies(l10n.flattenings, r.flattenings, Colors.blue, localizer, isRightEye, l10n),
              if (r.protrusions.isNotEmpty) _buildAnomalies(l10n.protrusions, r.protrusions, Colors.orange, localizer, isRightEye, l10n),

              // v5.3.0: FULL ANW ASSESSMENT CARD (replaces simple anwRatio display)
              if (r.anwAssessment != null) _buildANWAssessmentCard(r.anwAssessment!, isRightEye, l10n),

              _buildMeas(l10n.confidence, '${(r.confidence * 100).toStringAsFixed(0)}%', _displayConfidence(r, isRightEye: isRightEye) > 0.7 ? Colors.green : Colors.orange, _displayConfidence(r, isRightEye: isRightEye) > 0.7 ? l10n.high : l10n.moderate)
            ]
        )
    );
  }

  // ==========================================================================
  // v5.3.0: NEW ANW (COLLARETTE) ASSESSMENT CARD - Bexel-Compatible Display
  // ==========================================================================
// =============================================================================
// LOCALIZED ANW ASSESSMENT CARD - v5.3.0
// Replace the _buildANWAssessmentCard method and related helpers in SECTION 3
// =============================================================================

  // ==========================================================================
  // v5.3.0: ANW (COLLARETTE) ASSESSMENT CARD - Fully Localized
  // ==========================================================================
  Widget _buildANWAssessmentCard(ANWAssessment anw, bool isRightEye, AppLocalizations l10n) {
    final statusColor = _anwStatusColor(anw.ratioStatus);
    final eyeCode = isRightEye ? 'D' : 'S';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.cyan.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.withOpacity(0.5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and overall status
          Row(
            children: [
              const Icon(Icons.trip_origin, color: Colors.cyan, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.anwTitle, // "Autonomic Nerve Wreath (ANW)"
                  style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: anw.isOverallNormal ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  anw.isOverallNormal ? l10n.normal : l10n.anwAbnormal,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Metrics Row: Diameter & Perimeter
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8),
            ),
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

          // Main Parameters Table
          _buildANWParameterRow(
              l10n.anwRatio,
              '${anw.ratio.toStringAsFixed(1)}%',
              _getLocalizedRatioStatus(anw.ratioStatus, l10n),
              statusColor,
              anw.isRatioNormal
          ),
          _buildANWParameterRow(
              l10n.anwAsymmetry,
              '${anw.asymmetryPercent.toStringAsFixed(1)}%',
              anw.isAsymmetryNormal ? l10n.normal : l10n.anwElevated,
              anw.isAsymmetryNormal ? Colors.green : Colors.orange,
              anw.isAsymmetryNormal
          ),
          _buildANWParameterRow(
              l10n.anwFormType,
              _getLocalizedFormType(anw.formType, l10n),
              anw.isFormNormal ? l10n.normal : l10n.anwAbnormal,
              anw.isFormNormal ? Colors.green : Colors.orange,
              anw.isFormNormal
          ),

          // Tonic State (only if abnormal)
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Icon(Icons.psychology, color: statusColor, size: 18),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${l10n.anwTonicState}: ${_getLocalizedTonicState(anw.tonicState!, l10n)}',
                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  if (anw.tonicStateDescription.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      _getLocalizedTonicDescription(anw.ratioStatus, l10n),
                      style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3),
                    ),
                  ],
                ],
              ),
            ),
          ],


          // Shifts (Drawing Out) - if detected
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.call_made, color: Colors.deepOrange, size: 18),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            Text(
                              l10n.anwShiftDetected,
                              style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                PupilAnalyzerLocalizations(l10n).getZoneName(anw.primaryShift!.zoneName),
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$eyeCode: ${_getLocalizedShiftLabel(anw.primaryShift!, l10n)}',
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  if (anw.primaryShift!.clinicalAssociation.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      _getLocalizedShiftAssociation(anw.primaryShift!, isRightEye, l10n),
                      style: const TextStyle(color: Colors.white60, fontSize: 11, fontStyle: FontStyle.italic),
                    ),
                  ],
                ],
              ),
            ),
          ],


          // Constrictions (Drawing In) - if detected
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
                      Expanded(
                        child: Text(
                          l10n.anwConstrictionDetected,
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$eyeCode: ${_getLocalizedConstrictionString(anw, l10n)}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],


          // Bexel-style Findings Summary
          if (anw.bexelFindings.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${l10n.anwFindings}:',
                    style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  const SizedBox(height: 6),
                  ...anw.bexelFindings.map((finding) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      _getLocalizedAnwFinding(finding, l10n),
                      style: const TextStyle(color: Colors.white70, fontSize: 11, height: 1.3),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ==========================================================================
  // ANW LOCALIZATION HELPER METHODS
  // ==========================================================================

// ==========================================================================
  // ANW LOCALIZATION HELPER METHODS - Add these after _buildANWAssessmentCard
  // ==========================================================================

  /// Get localized ANW ratio status (Spastic/Normal/Atonic)
  String _getLocalizedRatioStatus(ANWRatioStatus status, AppLocalizations l10n) {
    switch (status) {
      case ANWRatioStatus.spastic: return l10n.anwSpastic;
      case ANWRatioStatus.normal: return l10n.normal;
      case ANWRatioStatus.atonic: return l10n.anwAtonic;
    }
  }

  /// Get localized ANW form type (Regular/Drawn In/Indented/Lacerated)
  String _getLocalizedFormType(ANWFormType formType, AppLocalizations l10n) {
    switch (formType) {
      case ANWFormType.regular: return l10n.anwRegular;
      case ANWFormType.drawnIn: return l10n.anwDrawnIn;
      case ANWFormType.indented: return l10n.anwIndented;
      case ANWFormType.lacerated: return l10n.anwLacerated;
    }
  }

  /// Get localized tonic state name (Parasympathotonic/Sympathotonic)
  String _getLocalizedTonicState(String tonicState, AppLocalizations l10n) {
    if (tonicState == 'Parasympathotonic') return l10n.anwParasympathotonic;
    if (tonicState == 'Sympathotonic') return l10n.anwSympathotonicState;
    return tonicState;
  }

  /// Get localized tonic state description
  String _getLocalizedTonicDescription(ANWRatioStatus status, AppLocalizations l10n) {
    switch (status) {
      case ANWRatioStatus.spastic: return l10n.anwParasympathotonicDesc;
      case ANWRatioStatus.atonic: return l10n.anwSympathotonicDesc;
      case ANWRatioStatus.normal: return '';
    }
  }

  /// Get localized constriction string
  String _getLocalizedConstrictionString(ANWAssessment anw, AppLocalizations l10n) {
    if (anw.frontalConstricted && anw.basalConstricted) {
      return l10n.anwFrontalBasalConstricted;
    } else if (anw.frontalConstricted) {
      return l10n.anwFrontalConstricted;
    } else if (anw.basalConstricted) {
      return l10n.anwBasalConstricted;
    }
    return '';
  }

  /// Get localized shift clinical association
  String _getLocalizedShiftAssociation(ANWShift shift, bool isRightEye, AppLocalizations l10n) {
    if (!isRightEye && shift.zoneName.toLowerCase().contains('middle-temporal')) {
      return l10n.anwMiddleTemporalShiftCardiac;
    }
    final assoc = shift.clinicalAssociation.trim();
    if (assoc == 'Respiratory and cardiac autonomic patterns.') return l10n.respiratoryCardiac;
    if (assoc == 'Cerebral circulation patterns.') return l10n.cerebralCirculation;
    if (assoc == 'Overloads of the left ventricle. Cardiac stress.') return l10n.anwMiddleTemporalShiftCardiac;
    if (assoc == 'Hypofunction of n. vagus or stellate ganglion.') return l10n.vagusStellateAssociation;
    if (assoc == 'Hemodynamics disturbance in vena cava inferior.') return l10n.venaCavaInferiorAssociation;
    if (assoc == 'Circulation in vertebral artery affected.') return l10n.vertebralArteryAssociation;
    if (assoc == 'Congestive symptoms in small pelvis.') return l10n.smallPelvisAssociation;
    return assoc;
  }

  // ==========================================================================
  // PDF LOCALIZATION HELPER METHODS - For Section 5 PDF generation
  // ==========================================================================

  String _getLocalizedRatioStatusPdf(ANWRatioStatus status, AppLocalizations l10n) {
    switch (status) {
      case ANWRatioStatus.spastic: return l10n.anwSpastic;
      case ANWRatioStatus.normal: return l10n.normal;
      case ANWRatioStatus.atonic: return l10n.anwAtonic;
    }
  }

  String _getLocalizedFormTypePdf(ANWFormType formType, AppLocalizations l10n) {
    switch (formType) {
      case ANWFormType.regular: return l10n.anwRegular;
      case ANWFormType.drawnIn: return l10n.anwDrawnIn;
      case ANWFormType.indented: return l10n.anwIndented;
      case ANWFormType.lacerated: return l10n.anwLacerated;
    }
  }

  String _getLocalizedTonicStatePdf(String tonicState, AppLocalizations l10n) {
    if (tonicState == 'Parasympathotonic') return l10n.anwParasympathotonic;
    if (tonicState == 'Sympathotonic') return l10n.anwSympathotonicState;
    return tonicState;
  }

  String _getLocalizedTonicDescPdf(ANWRatioStatus status, AppLocalizations l10n) {
    switch (status) {
      case ANWRatioStatus.spastic: return l10n.anwParasympathotonicDesc;
      case ANWRatioStatus.atonic: return l10n.anwSympathotonicDesc;
      case ANWRatioStatus.normal: return '';
    }
  }

  String _getLocalizedConstrictionPdf(ANWAssessment anw, AppLocalizations l10n) {
    if (anw.frontalConstricted && anw.basalConstricted) return l10n.anwFrontalBasalConstricted;
    if (anw.frontalConstricted) return l10n.anwFrontalConstricted;
    if (anw.basalConstricted) return l10n.anwBasalConstricted;
    return '';
  }

  String _getLocalizedShiftAssocPdf(ANWShift shift, bool isRightEye, AppLocalizations l10n) {
    if (!isRightEye && shift.zoneName.toLowerCase().contains('middle-temporal')) {
      return l10n.anwMiddleTemporalShiftCardiac;
    }
    final assoc = shift.clinicalAssociation.trim();
    if (assoc == 'Respiratory and cardiac autonomic patterns.') return l10n.respiratoryCardiac;
    if (assoc == 'Cerebral circulation patterns.') return l10n.cerebralCirculation;
    if (assoc == 'Overloads of the left ventricle. Cardiac stress.') return l10n.anwMiddleTemporalShiftCardiac;
    if (assoc == 'Hypofunction of n. vagus or stellate ganglion.') return l10n.vagusStellateAssociation;
    if (assoc == 'Hemodynamics disturbance in vena cava inferior.') return l10n.venaCavaInferiorAssociation;
    if (assoc == 'Circulation in vertebral artery affected.') return l10n.vertebralArteryAssociation;
    if (assoc == 'Congestive symptoms in small pelvis.') return l10n.smallPelvisAssociation;
    return assoc;
  }

  String _getLocalizedShiftLabel(ANWShift shift, AppLocalizations l10n) {
    final zone = shift.zoneName.toLowerCase();
    if (zone.contains('middle-temporal')) return _stripShiftPrefix(l10n.middleTemporalShift);
    if (zone.contains('middle-nasal')) return l10n.middleNasalShift;
    if (zone.contains('upper temporal')) return l10n.upperTemporalShift;
    if (zone.contains('lower temporal')) return l10n.lowerTemporalShift;
    if (zone.contains('basal')) return l10n.basalShift;
    if (zone.contains('frontal')) return _stripShiftPrefix(l10n.frontalShift);
    return '${PupilAnalyzerLocalizations(l10n).getZoneName(shift.zoneName)} shift pattern.';
  }

  String _getLocalizedAnwFinding(String finding, AppLocalizations l10n) {
    final trimmed = finding.trim();
    final match = RegExp(r'^([DS]):\s*(.*)$').firstMatch(trimmed);
    final prefix = match?.group(1);
    final body = match?.group(2) ?? trimmed;

    String withPrefix(String value) {
      if (prefix == null) return value;
      return '$prefix: ${_stripShiftPrefix(value)}';
    }

    if (body == 'Middle-temporal shift.') return withPrefix(l10n.middleTemporalShift);
    if (body == 'Middle-nasal shift.') return withPrefix(l10n.middleNasalShift);
    if (body == 'Upper temporal shift.') return withPrefix(l10n.upperTemporalShift);
    if (body == 'Lower temporal shift.') return withPrefix(l10n.lowerTemporalShift);
    if (body == 'Basal shift.') return withPrefix(l10n.basalShift);
    if (body == 'Frontal shift.') return withPrefix(l10n.frontalShift);
    if (body == 'Respiratory and cardiac autonomic patterns.') return l10n.respiratoryCardiac;
    if (body == 'Cerebral circulation patterns.') return l10n.cerebralCirculation;
    if (body == 'Overloads of the left ventricle. Cardiac stress.') return l10n.anwMiddleTemporalShiftCardiac;
    if (body == 'Hypofunction of n. vagus or stellate ganglion.') return l10n.vagusStellateAssociation;
    if (body == 'Hemodynamics disturbance in vena cava inferior.') return l10n.venaCavaInferiorAssociation;
    if (body == 'Circulation in vertebral artery affected.') return l10n.vertebralArteryAssociation;
    if (body == 'Congestive symptoms in small pelvis.') return l10n.smallPelvisAssociation;
    if (body == 'Frontal zone of pupillary belt is constricted.') return prefix == null ? l10n.anwFrontalConstricted : '$prefix: ${l10n.anwFrontalConstricted}';
    if (body == 'Basal zone of pupillary belt is constricted.') return prefix == null ? l10n.anwBasalConstricted : '$prefix: ${l10n.anwBasalConstricted}';
    if (body == 'Frontal and basal zones of pupillary belt are constricted.') return prefix == null ? l10n.anwFrontalBasalConstricted : '$prefix: ${l10n.anwFrontalBasalConstricted}';
    return trimmed;
  }

  String _stripShiftPrefix(String value) {
    const prefixes = ['D: ', 'S: ', 'D : ', 'S : ', 'D：', 'S：'];
    for (final prefix in prefixes) {
      if (value.startsWith(prefix)) {
        return value.substring(prefix.length);
      }
    }
    return value;
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
          SizedBox(
            width: 80,
            child: Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
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

// =============================================================================
// ALSO UPDATE: _buildComparisonCard to use localized ANW Ratio label
// =============================================================================
// In the _buildComparisonCard method, replace:
//
//   _buildCompRow('ANW Ratio', ...)
//
// With:
//
//   _buildCompRow(l10n.anwRatioComparison, ...)
//
// ==========================================================================
// END OF ANW ASSESSMENT CARD
// ==========================================================================

  Widget _buildPupilFormCard(EllipseAssessment e, PupilAnalyzerLocalizations localizer, AppLocalizations l10n) {
    final isNormal = e.formType == PupilFormType.circle;
    final c = isNormal ? Colors.green : Colors.deepOrange;

    final formTypeName = localizer.getFormTypeName(e.formType);
    final formDescription = localizer.getPupilFormDescription(e.formType);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withOpacity(0.5)),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  Icon(isNormal ? Icons.check_circle : Icons.circle_outlined, color: c, size: 20),
                  const SizedBox(width: 8),
                  Text(l10n.pupilForm, style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 14)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(12)),
                    child: Text(formTypeName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ]
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(6)),
              child: Text(formDescription, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
            ),
          ]
      ),
    );
  }

  Widget _buildDecentrationCard(DecentrationAssessment d, PupilAnalyzerLocalizations localizer, bool isRightEye, AppLocalizations l10n) {
    const c = Colors.purple;

    final patternName = localizer.getPatternName(d.pattern);
    final patternDescription = localizer.getDecentrationDescription(d.pattern, isRightEye);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withOpacity(0.5)),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  const Icon(Icons.gps_fixed, color: c, size: 20),
                  const SizedBox(width: 8),
                  Text(l10n.decentrationPattern, style: const TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 14)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: c.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
                    child: Text('${d.correctedOffsetPercent.toStringAsFixed(1)}%',
                        style: const TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ]
            ),
            const SizedBox(height: 8),
            Text(patternName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(6)),
              child: Text(patternDescription, style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
            ),
          ]
      ),
    );
  }

  Widget _buildMeas(String label, String value, Color c, String sub) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                      Text(sub, style: const TextStyle(color: Colors.white38, fontSize: 11))
                    ]
                )
            ),
            Text(value, style: TextStyle(color: c, fontSize: 16, fontWeight: FontWeight.bold))
          ]
      )
  );

  Widget _buildAnomalies(String label, List<ZoneAnomaly> list, Color c, PupilAnalyzerLocalizations localizer, bool isRightEye, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: c.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(label == l10n.flattenings ? Icons.compress : Icons.expand, color: c, size: 18),
              const SizedBox(width: 8),
              Text('$label (${list.length} ${l10n.zones})', style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 10),
          ...list.map((a) {
            final zoneName = localizer.getZoneName(a.zone);
            final organAssociation = a.anomalyType == AnomalyType.flattening
                ? localizer.getFlatteningDescription(a.zone, isRightEye)
                : localizer.getProtrusionDescription(a.zone, isRightEye);

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: c.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(zoneName.toUpperCase(), style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 9)),
                      ),
                      const SizedBox(width: 8),
                      Text('${a.percentage.toStringAsFixed(1)}%', style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 13)),
                      if (a.clockPosition.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Text('(${a.clockPosition})', style: const TextStyle(color: Colors.white38, fontSize: 10)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(organAssociation, style: const TextStyle(color: Colors.white60, fontSize: 11, height: 1.3)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildComparisonCard(AppLocalizations l10n) {
    final pDiff = (_rightResult!.pupilIrisRatio - _leftResult!.pupilIrisRatio).abs();
    final eDiff = (_rightResult!.ellipseness - _leftResult!.ellipseness).abs();
    final cDiff = (_rightResult!.circularityScore - _leftResult!.circularityScore).abs();

    // v5.3.0: Add ANW comparison if both eyes have ANW data
    final hasANW = _rightResult!.anwAssessment != null && _leftResult!.anwAssessment != null;
    double? anwDiff;
    if (hasANW) {
      anwDiff = (_rightResult!.anwAssessment!.ratio - _leftResult!.anwAssessment!.ratio).abs();
    }

    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.cyan.withOpacity(0.5))
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    const Icon(Icons.compare_arrows, color: Colors.cyan, size: 28),
                    const SizedBox(width: 12),
                    Text(l10n.bilateralComparison, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                  ]
              ),
              const Divider(color: Colors.white24, height: 24),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(l10n.parameter, style: const TextStyle(color: Colors.white54, fontSize: 12))),
                        Expanded(child: Text(l10n.od, style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center)),
                        Expanded(child: Text(l10n.os, style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center)),
                        Expanded(child: Text(l10n.diff, style: const TextStyle(color: Colors.white54, fontSize: 12), textAlign: TextAlign.center))
                      ]
                  )
              ),
              _buildCompRow(l10n.piRatio, _rightResult!.pupilIrisRatio, _leftResult!.pupilIrisRatio, pDiff, pDiff > 5),
              _buildCompRow(l10n.ellipseness, _rightResult!.ellipseness, _leftResult!.ellipseness, eDiff, eDiff > 5),
              _buildCompRow(l10n.circularity, _rightResult!.circularityScore, _leftResult!.circularityScore, cDiff, cDiff > 5),
              // v5.3.0: Add ANW ratio comparison row
              if (hasANW && anwDiff != null)
                _buildCompRow(l10n.anwRatioComparison, _rightResult!.anwAssessment!.ratio, _leftResult!.anwAssessment!.ratio, anwDiff, anwDiff > 5), // NEW STRING: ANW Ratio (for comparison)
            ]
        )
    );
  }

  Widget _buildCompRow(String p, double od, double os, double d, bool sig) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
          children: [
            Expanded(flex: 2, child: Text(p, style: const TextStyle(color: Colors.white70, fontSize: 13))),
            Expanded(child: Text('${od.toStringAsFixed(1)}%', style: const TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center)),
            Expanded(child: Text('${os.toStringAsFixed(1)}%', style: const TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center)),
            Expanded(child: Text('${d.toStringAsFixed(1)}%', style: TextStyle(color: sig ? Colors.red : Colors.green, fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center))
          ]
      )
  );

  Widget _buildCreditBanner(AppLocalizations l10n) => Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple.withOpacity(0.3), Colors.deepPurple.withOpacity(0.3)]),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.purple)
      ),
      child: Row(
          children: [
            const Icon(Icons.info, color: Colors.purple),
            const SizedBox(width: 12),
            Expanded(child: Text(l10n.scansLeftBanner(_remainingScans), style: const TextStyle(color: Colors.white))),
            TextButton(
                onPressed: () => setState(() => _showPaywall = true),
                child: Text(l10n.upgrade, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold))
            )
          ]
      )
  );

  Widget _buildActionButtons(AppLocalizations l10n) => Column(
      children: [
        Row(
            children: [
              Expanded(
                  child: ElevatedButton.icon(
                      onPressed: _saveTxtReport,
                      icon: const Icon(Icons.description, size: 18),
                      label: Text(l10n.txt),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D9FF),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14)
                      )
                  )
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: ElevatedButton.icon(
                      onPressed: _saveJsonReport,
                      icon: const Icon(Icons.data_object, size: 18),
                      label: Text(l10n.json),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14)
                      )
                  )
              )
            ]
        ),
        const SizedBox(height: 12),
        Row(
            children: [
              Expanded(
                  child: ElevatedButton.icon(
                      onPressed: _exportPdf,
                      icon: const Icon(Icons.picture_as_pdf, size: 18),
                      label: Text(l10n.savePdf),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14)
                      )
                  )
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: ElevatedButton.icon(
                      onPressed: _isDesktop ? _exitApp : _sharePdfReport,
                      icon: Icon(_isDesktop ? Icons.exit_to_app : Icons.share, size: 18),
                      label: Text(_isDesktop ? l10n.exitApp : l10n.sharePdf),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14)
                      )
                  )
              )
            ]
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
            onPressed: widget.onRetake,
            icon: const Icon(Icons.camera_alt),
            label: Text(l10n.retakePhotos),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF00D9FF)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50)
            )
        )
      ]
  );

  // ==========================================================================
  // PAYWALL UI
  // ==========================================================================
  Widget _buildPaywall(AppLocalizations l10n) => Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context))
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
              children: [
                Container(
                    width: 100, height: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple.shade800])),
                    child: const Icon(Icons.workspace_premium, size: 50, color: Colors.white)
                ),
                const SizedBox(height: 24),
                Text(l10n.unlockUnlimited, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(l10n.usedAllFreeScans, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 32),
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: const Color(0xFF1D1E33), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                        children: [
                          _feat(Icons.all_inclusive, l10n.unlimitedScans),
                          _feat(Icons.picture_as_pdf, l10n.pdfReports),
                          _feat(Icons.history, l10n.scanHistoryFeature),
                          _feat(Icons.compare_arrows, l10n.bilateralAnalysis)
                        ]
                    )
                ),
                const SizedBox(height: 32),
                _price(l10n.monthly, '\$9.99', l10n.perMonth, false, () => _buy('monthly')),
                const SizedBox(height: 12),
                _price(l10n.annual, '\$49.99', l10n.perYear, true, () => _buy('annual')),
                const SizedBox(height: 12),
                _price(l10n.tenCredits, '\$4.95', l10n.oneTime, false, () => _buy('credits'))
              ]
          )
      )
  );

  Widget _feat(IconData i, String t) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [Icon(i, color: Colors.green, size: 24), const SizedBox(width: 12), Text(t, style: const TextStyle(color: Colors.white, fontSize: 16))])
  );

  Widget _price(String t, String p, String per, bool pop, VoidCallback tap) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
        onTap: tap,
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: pop ? Colors.purple.withOpacity(0.2) : const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: pop ? Colors.purple : Colors.white24, width: pop ? 2 : 1)
            ),
            child: Row(
                children: [
                  Expanded(
                      child: Row(
                          children: [
                            Text(t, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            if (pop)
                              Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8)),
                                  child: Text(l10n.best, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))
                              )
                          ]
                      )
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(p, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(per, style: const TextStyle(color: Colors.white54, fontSize: 12))
                      ]
                  )
                ]
            )
        )
    );
  }

  Future<void> _buy(String type) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      setState(() => _isAnalyzing = true);
      final offerings = await Purchases.getOfferings();
      if (offerings.current == null || offerings.current!.availablePackages.isEmpty) throw Exception('No offerings available');

      String productId;
      switch (type) {
        case 'monthly': productId = 'irido1:monthly'; break;
        case 'annual': productId = 'yearly:yearly'; break;
        case 'credits': productId = '10scan'; break;
        default: throw Exception('Unknown purchase type: $type');
      }

      Package? package;
      for (final pkg in offerings.current!.availablePackages) {
        if (pkg.storeProduct.identifier == productId) { package = pkg; break; }
      }
      if (package == null) throw Exception('Package "$productId" not found in offerings');

      final result = await Purchases.purchasePackage(package);
      if (result.customerInfo.entitlements.active.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        if (type == 'credits') {
          final current = prefs.getInt('remaining_scans') ?? 0;
          await prefs.setInt('remaining_scans', current + 10);
          _remainingScans = current + 10;
        } else {
          await prefs.setBool('is_premium', true);
          _isPremium = true;
        }
        setState(() { _showPaywall = false; _isAnalyzing = true; });
        _runAnalysis();
      }
    } on PlatformException catch (e) {
      setState(() => _isAnalyzing = false);
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.purchaseCancelled), backgroundColor: Colors.orange));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.purchaseFailed(e.message ?? '')), backgroundColor: Colors.red));
      }
    } catch (e) {
      setState(() => _isAnalyzing = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.failed(e.toString())), backgroundColor: Colors.red));
    }
  }

// ============================================================================
// END OF SECTION 3 - Continue with SECTION 4
// ============================================================================
// SECTION 4 of 4: REPORT GENERATION (TXT, JSON, PDF) AND HELPER CLASSES
// Paste directly after SECTION 3, then close the class with }
// ============================================================================

  // ==========================================================================
  // REPORT GENERATION - TXT
  // ==========================================================================
// ============================================================================
// SECTION 4 of 5: REPORT GENERATION - TXT AND JSON
// Paste directly after SECTION 3
// ============================================================================

  // ==========================================================================
  // REPORT GENERATION - TXT (Updated v5.3.0 with ANW)
  // ==========================================================================
  Future<Directory> _getReportsDirectory() async {
  Directory baseDir;

  if (Platform.isAndroid) {
    // Android: Save to public Downloads folder so the file is easy to find.
    // Falls back to app-private external storage if Downloads isn't accessible
    // (e.g. Android 11+ scoped storage without MANAGE_EXTERNAL_STORAGE).
    try {
      final downloadsDir = await getDownloadsDirectory();
      baseDir = downloadsDir ?? await getApplicationDocumentsDirectory();
    } catch (_) {
      final extDir = await getExternalStorageDirectory();
      baseDir = extDir ?? await getApplicationDocumentsDirectory();
    }
  } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    // Desktop: Use Documents folder
    baseDir = await getApplicationDocumentsDirectory();
  } else {
    // iOS or fallback
    baseDir = await getApplicationDocumentsDirectory();
  }

  final reportDir = Directory('${baseDir.path}/PupilReports');
  if (!await reportDir.exists()) {
    await reportDir.create(recursive: true);
  }

  return reportDir;
}

Future<void> _saveTxtReport() async {
  final l10n = AppLocalizations.of(context)!;
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator(color: Color(0xFF00D9FF))),
    );

    final report = _generateTxtReport();
    final reportDir = await _getReportsDirectory(); // USE NEW HELPER

    final ts = DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now());
    final safeName = widget.patientInfo.name.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    final txtPath = '${reportDir.path}/${safeName}_$ts.txt';

    await File(txtPath).writeAsString(report);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.txtSaved(txtPath)),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: l10n.open,
          textColor: Colors.white,
          onPressed: () => OpenFile.open(txtPath),
        ),
      ),
    );
    widget.onComplete?.call();
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.failed(e.toString())), backgroundColor: Colors.red),
    );
  }
}

  String _generateTxtReport() {
    final l10n = AppLocalizations.of(context)!;
    final loc = PupilAnalyzerLocalizations(l10n);
    final b = StringBuffer();
    b.writeln('=' * 60);
    b.writeln('  ${l10n.analysisReportTitle}');
    if (_clinicName.isNotEmpty) b.writeln('  $_clinicName');
    b.writeln('=' * 60);
    b.writeln('\nDate: ${DateFormat('MMMM dd, yyyy HH:mm').format(DateTime.now())}');
    b.writeln('\n--- ${l10n.reportPersonInformationTitle.toUpperCase()} ---');
    b.writeln('${l10n.plrNameLabel}: ${widget.patientInfo.name}');
    b.writeln('${l10n.sex}: ${widget.patientInfo.sexString}');
    b.writeln('${l10n.ageYears}: ${widget.patientInfo.age}');
    b.writeln('${l10n.reportAgeGroupLabel}: ${_ageNormResult != null ? _localizedAgeGroup(l10n, _ageNormResult!.ageGroup) : l10n.na}');
    if (widget.patientInfo.mainComplaints?.isNotEmpty ?? false) b.writeln('${l10n.mainComplaints}: ${widget.patientInfo.mainComplaints}');

    if (_anisocoriaResult != null) {
      final ani = _anisocoriaResult!;
      b.writeln('\n--- ${l10n.reportPupilSizeComparisonTitle.toUpperCase()} ---');
      b.writeln('OD: ${ani.rightPupilRatio.toStringAsFixed(2)}%');
      b.writeln('OS: ${ani.leftPupilRatio.toStringAsFixed(2)}%');
      b.writeln('${l10n.diff}: ${ani.absoluteDifference.toStringAsFixed(2)}%');
      b.writeln('Observation: ${_anisocoriaObservationLabel(ani.severity, l10n)}');
      if (ani.largerPupil != 'equal') {
        final largerSide = ani.largerPupil == 'right' ? 'OD' : 'OS';
        b.writeln('Larger pupil: $largerSide');
      }
      if (ani.isTBIIndicator) b.writeln('Note: ${l10n.significantPupilSizeDiff}');
    }

    if (_irisMetrics?.odIrisDiameterPx != null) {
      b.writeln('\n--- ${l10n.reportCaptureDistanceMetricsTitle.toUpperCase()} ---');
      b.writeln('${l10n.od} ${l10n.irisDiameterLabel}: ${_irisMetrics!.odIrisDiameterPx?.toStringAsFixed(0)}px');
      b.writeln('${l10n.os} ${l10n.irisDiameterLabel}: ${_irisMetrics!.osIrisDiameterPx?.toStringAsFixed(0)}px');
      b.writeln('${l10n.reportMatchLabel}: ${_irisMetrics!.sizeMatchPercent?.toStringAsFixed(1)}%');
      b.writeln('${l10n.status}: ${_irisMetrics!.distanceMatchStatus}');
    }

    if (_rightResult != null) { b.writeln('\n--- ${l10n.rightEyeOD.toUpperCase()} ---'); _writeEyeTxt(b, _rightResult!, true, loc, l10n); }
    if (_leftResult != null) { b.writeln('\n--- ${l10n.leftEyeOS.toUpperCase()} ---'); _writeEyeTxt(b, _leftResult!, false, loc, l10n); }

    b.writeln('\n--- ${l10n.reportResearchObservationsTitle.toUpperCase()} ---');
    _writeObsTxt(b, loc, l10n);
    // Observer notes from overlay dialog
    final overlayNotes = _overlayObserverNotes?.trim() ?? '';
    if (overlayNotes.isNotEmpty) {
      b.writeln('\n--- ${l10n.reportObserverNotesZoneOverlayTitle.toUpperCase()} ---');
      b.writeln(overlayNotes);
    }
    b.writeln('\n${'=' * 60}\n${l10n.reportEndOfReport}\n${'=' * 60}');
    return b.toString();
  }

  void _writeEyeTxt(StringBuffer b, EyeAnalysisResult r, bool isRight, PupilAnalyzerLocalizations loc, AppLocalizations l10n) {
    final eyeCode = isRight ? 'D' : 'S';

    b.writeln('${l10n.reportGradeLabel}: ${_displayGrade(r, isRightEye: isRight)}');
    b.writeln('${l10n.piRatio}: ${r.pupilIrisRatio.toStringAsFixed(2)}%');
    b.writeln('${l10n.ellipseness}: ${r.ellipseness.toStringAsFixed(2)}%');
    b.writeln('${l10n.circularity}: ${r.circularityScore.toStringAsFixed(2)}%');
    b.writeln('${l10n.decentralization}: ${r.decentralization.toStringAsFixed(2)}% @ ${r.decentralizationAngle.toStringAsFixed(0)}°');

    if (r.ellipseAssessment != null) {
      b.writeln('\n${l10n.reportPupilFormTitle.toUpperCase()}: ${loc.getFormTypeName(r.ellipseAssessment!.formType)}');
      b.writeln('  ${loc.getPupilFormDescription(r.ellipseAssessment!.formType)}');
    }

    if (r.decentrationAssessment != null && r.decentrationAssessment!.pattern != DecentrationPattern.centered) {
      b.writeln('\n${l10n.reportDecentrationTitle.toUpperCase()}: ${loc.getPatternName(r.decentrationAssessment!.pattern)} (${r.decentralization.toStringAsFixed(2)}% @ ${r.decentralizationAngle.toStringAsFixed(0)}°)');
      b.writeln('  ${loc.getDecentrationDescription(r.decentrationAssessment!.pattern, isRight)}');
    }

    if (r.flattenings.isNotEmpty) {
      b.writeln('\n${l10n.reportFlatteningsTitle.toUpperCase()}:');
      for (final f in r.flattenings) {
        b.writeln('  - ${loc.getZoneName(f.zone)} (${f.clockPosition}): ${f.percentage.toStringAsFixed(2)}%');
        b.writeln('    ${loc.getFlatteningDescription(f.zone, isRight)}');
      }
    }

    if (r.protrusions.isNotEmpty) {
      b.writeln('\n${l10n.reportProtrusionsTitle.toUpperCase()}:');
      for (final p in r.protrusions) {
        b.writeln('  - ${loc.getZoneName(p.zone)} (${p.clockPosition}): ${p.percentage.toStringAsFixed(2)}%');
        b.writeln('    ${loc.getProtrusionDescription(p.zone, isRight)}');
      }
    }

    // v5.3.0: FULL ANW SECTION (Bexel-compatible)
    if (r.anwAssessment != null) {
      final anw = r.anwAssessment!;
      b.writeln('\n${l10n.reportAnwParametersTitle.toUpperCase()}:');
      b.writeln('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      b.writeln('${l10n.anwDiameter}: ${anw.diameterPx.toStringAsFixed(0)} px');
      b.writeln('${l10n.anwPerimeter}: ${anw.perimeterPx.toStringAsFixed(0)} px');
      b.writeln('');
      b.writeln('${l10n.anwRatio}: ${anw.ratio.toStringAsFixed(1)}%'.padRight(28) + _getLocalizedRatioStatus(anw.ratioStatus, l10n));
      b.writeln('${l10n.anwAsymmetry}: ${anw.asymmetryPercent.toStringAsFixed(1)}%'.padRight(28) + (anw.isAsymmetryNormal ? l10n.normal : l10n.anwElevated));
      b.writeln('${l10n.anwFormType}: ${_getLocalizedFormType(anw.formType, l10n)}'.padRight(28) + (anw.isFormNormal ? l10n.normal : l10n.anwAbnormal));

      // Tonic state
      if (anw.tonicState != null) {
        b.writeln('\n${l10n.reportTonicStateLabel}: ${_getLocalizedTonicState(anw.tonicState!, l10n)}');
        if (anw.tonicStateDescription.isNotEmpty) {
          b.writeln('  ${_getLocalizedTonicDescription(anw.ratioStatus, l10n)}');
        }
      }

      // Findings
      if (anw.bexelFindings.isNotEmpty) {
        b.writeln('\n${l10n.findings}');
        for (final finding in anw.bexelFindings) {
          b.writeln('  ${_getLocalizedAnwFinding(finding, l10n)}');
        }
      }

      // Shift details
      if (anw.hasShift && anw.primaryShift != null) {
        b.writeln('\n${l10n.reportShiftDetectedTitle.toUpperCase()}:');
        b.writeln('  $eyeCode: ${PupilAnalyzerLocalizations(l10n).getZoneName(anw.primaryShift!.zoneName)} shift (${anw.primaryShift!.clockPosition}, ${anw.primaryShift!.deviationPercent.toStringAsFixed(1)}%)');
        if (anw.primaryShift!.clinicalAssociation.isNotEmpty) {
          b.writeln('  ${l10n.reportClinicalLabel}: ${_getLocalizedShiftAssociation(anw.primaryShift!, isRight, l10n)}');
        }
      }

      // Constriction details
      if (anw.hasConstrictions) {
        b.writeln('\n${l10n.reportConstrictionDetectedTitle.toUpperCase()}:');
        b.writeln('  $eyeCode: ${_getLocalizedConstrictionString(anw, l10n)}');
      }
    }

    b.writeln('\n${l10n.confidence}: ${(_displayConfidence(r, isRightEye: isRight) * 100).toStringAsFixed(0)}%');
  }
  void _writeObsTxt(StringBuffer b, PupilAnalyzerLocalizations loc, AppLocalizations l10n) {
    for (final entry in [(_rightResult, 'D', true), (_leftResult, 'S', false)]) {
      final r = entry.$1;
      final code = entry.$2;
      if (r == null) continue;

      for (final f in r.flattenings.where((f) => f.percentage >= 3)) {
        b.writeln('$code : ${loc.getZoneName(f.zone)} ${l10n.reportFlatteningsTitle.toLowerCase()} (${f.clockPosition}) - ${f.percentage.toStringAsFixed(2)}%');
      }
      for (final p in r.protrusions.where((p) => p.percentage >= 1)) {
        b.writeln('$code : ${loc.getZoneName(p.zone)} ${l10n.reportProtrusionsTitle.toLowerCase()} (${p.clockPosition}) - ${p.percentage.toStringAsFixed(2)}%');
      }
      if (r.decentrationAssessment != null && r.decentrationAssessment!.pattern != DecentrationPattern.centered) {
        b.writeln('$code : ${loc.getPatternName(r.decentrationAssessment!.pattern)}.');
      }
      if (r.ellipseAssessment != null) {
        b.writeln('$code : ${r.ellipseAssessment!.formType == PupilFormType.circle ? l10n.reportNormalPupilForm : "${loc.getFormTypeName(r.ellipseAssessment!.formType)} ${l10n.pupilForm.toLowerCase()}"}.');
      }

      if (r.anwAssessment != null) {
        final anw = r.anwAssessment!;
        if (!anw.isRatioNormal) {
          b.writeln('$code : ${l10n.anwRatio.toUpperCase()} ${_getLocalizedRatioStatus(anw.ratioStatus, l10n).toLowerCase()} (${anw.ratio.toStringAsFixed(1)}%) - ${anw.tonicState != null ? _getLocalizedTonicState(anw.tonicState!, l10n) : ""}.');
        }
        for (final finding in anw.bexelFindings) {
          b.writeln(_getLocalizedAnwFinding(finding, l10n));
        }
      }
    }

    if (_anisocoriaResult != null && _anisocoriaResult!.severity != AnisocoriaSeverity.none) {
      final larger = _anisocoriaResult!.largerPupil == 'right' ? 'D' : 'S';
      b.writeln('ANISOCORIA ($larger>${larger == 'D' ? 'S' : 'D'}) = ${_anisocoriaResult!.absoluteDifference.toStringAsFixed(0)}%.');
    }

    // v5.3.0: Bilateral ANW comparison
    if (_rightResult?.anwAssessment != null && _leftResult?.anwAssessment != null) {
      final odAnw = _rightResult!.anwAssessment!;
      final osAnw = _leftResult!.anwAssessment!;
      final anwDiff = (odAnw.ratio - osAnw.ratio).abs();
      if (anwDiff > 5) {
        b.writeln('${l10n.bilateralANWComparison.toUpperCase()}: ${l10n.od}=${odAnw.ratio.toStringAsFixed(1)}% vs ${l10n.os}=${osAnw.ratio.toStringAsFixed(1)}% (${anwDiff.toStringAsFixed(1)}% ${l10n.diff}).');
      }
      if ((odAnw.ratioStatus == ANWRatioStatus.spastic && osAnw.ratioStatus == ANWRatioStatus.atonic) ||
          (odAnw.ratioStatus == ANWRatioStatus.atonic && osAnw.ratioStatus == ANWRatioStatus.spastic)) {
        b.writeln('${l10n.bilateralComparison.toUpperCase()}: ${l10n.functionalFrustration}');
      }
    }
  }
  // ==========================================================================
Future<void> _saveJsonReport() async {
  final l10n = AppLocalizations.of(context)!;
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator(color: Colors.green)),
    );

    final json = _generateJson();
    final reportDir = await _getReportsDirectory(); // USE NEW HELPER

    final ts = DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now());
    final safeName = widget.patientInfo.name.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    final jsonPath = '${reportDir.path}/${safeName}_$ts.json';

    await File(jsonPath).writeAsString(json);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.jsonSaved(jsonPath)),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: l10n.open,
          textColor: Colors.white,
          onPressed: () => OpenFile.open(jsonPath),
        ),
      ),
    );
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.failed(e.toString())), backgroundColor: Colors.red),
    );
  }
}

  String _generateJson() {
    // v5.3.0: Enhanced JSON with full ANW assessment
    Map<String, dynamic>? buildANWJson(ANWAssessment? anw) {
      if (anw == null) return null;
      return {
        'diameterPx': anw.diameterPx,
        'perimeterPx': anw.perimeterPx,
        'ratio': anw.ratio,
        'ratioStatus': anw.ratioStatus.name,
        'ratioStatusLabel': anw.ratioStatusLabel,
        'asymmetryPercent': anw.asymmetryPercent,
        'isAsymmetryNormal': anw.isAsymmetryNormal,
        'formType': anw.formType.name,
        'formTypeName': anw.formTypeName,
        'isFormNormal': anw.isFormNormal,
        'tonicState': anw.tonicState,
        'tonicStateDescription': anw.tonicStateDescription,
        'hasShift': anw.hasShift,
        'primaryShift': anw.primaryShift != null ? {
          'zoneName': anw.primaryShift!.zoneName,
          'clockPosition': anw.primaryShift!.clockPosition,
          'deviationPercent': anw.primaryShift!.deviationPercent,
          'clinicalAssociation': anw.primaryShift!.clinicalAssociation,
        } : null,
        'hasConstrictions': anw.hasConstrictions,
        'frontalConstricted': anw.frontalConstricted,
        'basalConstricted': anw.basalConstricted,
        'constrictionString': anw.constrictionString,
        'bexelFindings': anw.bexelFindings,
        'isOverallNormal': anw.isOverallNormal,
      };
    }

    return const JsonEncoder.withIndent('  ').convert({
      'date': DateTime.now().toIso8601String(),
      if (_clinicName.isNotEmpty) 'practice': _clinicName,
      'person': widget.patientInfo.toJson(),
      'ageNorm': _ageNormResult != null ? {
        'ageGroup': _ageNormResult!.ageGroup,
        'expectedRange': _ageNormResult!.expectedRange,
        'measuredMm': _ageNormResult!.measuredDiameter,
        'status': _ageNormResult!.status.name
      } : null,
      'anisocoria': _anisocoriaResult?.toJson(),
      'captureMetrics': _irisMetrics?.toJson(),
      'rightEye': _rightResult != null ? {
        ..._rightResult!.toJson(),
        'anwAssessmentFull': buildANWJson(_rightResult!.anwAssessment),
      } : null,
      'leftEye': _leftResult != null ? {
        ..._leftResult!.toJson(),
        'anwAssessmentFull': buildANWJson(_leftResult!.anwAssessment),
      } : null,
      // v5.3.0: Bilateral ANW comparison
      'bilateralANW': (_rightResult?.anwAssessment != null && _leftResult?.anwAssessment != null) ? {
        'odRatio': _rightResult!.anwAssessment!.ratio,
        'osRatio': _leftResult!.anwAssessment!.ratio,
        'ratioDifference': (_rightResult!.anwAssessment!.ratio - _leftResult!.anwAssessment!.ratio).abs(),
        'odStatus': _rightResult!.anwAssessment!.ratioStatusLabel,
        'osStatus': _leftResult!.anwAssessment!.ratioStatusLabel,
        'hasFunctionalFrustration': (
            (_rightResult!.anwAssessment!.ratioStatus == ANWRatioStatus.spastic && _leftResult!.anwAssessment!.ratioStatus == ANWRatioStatus.atonic) ||
                (_rightResult!.anwAssessment!.ratioStatus == ANWRatioStatus.atonic && _leftResult!.anwAssessment!.ratioStatus == ANWRatioStatus.spastic)
        ),
      } : null,
      if (_overlayObserverNotes?.isNotEmpty == true)
        'observerNotes': _overlayObserverNotes,
    });
  }

// ============================================================================
// END OF SECTION 4 - Continue with SECTION 5
// ============================================================================
// ============================================================================
// SECTION 5 of 5: PDF GENERATION AND HELPER CLASSES
// Paste directly after SECTION 4, then close the class with }
// ============================================================================

  // ==========================================================================
  // REPORT GENERATION - PDF (Updated v5.3.0 with Full ANW Section)
  // ==========================================================================
Future<String?> _exportPdf({bool showSnackbar = true}) async {
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

    Uint8List? rightBytes, leftBytes;
    if (widget.rightEyeImage != null) {
      rightBytes = await ImageCompressor.compressForPdf(widget.rightEyeImage!, maxWidth: 2000, quality: 85);
    }
    if (widget.leftEyeImage != null) {
      leftBytes = await ImageCompressor.compressForPdf(widget.leftEyeImage!, maxWidth: 2000, quality: 85);
    }

    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(40),
      header: (ctx) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(l10n.analysisReportTitle,
                  style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
              pw.Text('v5.3.0', style: const pw.TextStyle(fontSize: 12, color: PdfColors.grey600))
            ],
          ),
          pw.Divider(color: PdfColors.blue900, thickness: 2),
          if (_clinicName.isNotEmpty)
            pw.Container(
              margin: const pw.EdgeInsets.only(top: 8, bottom: 8),
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColors.teal50,
                border: pw.Border.all(color: PdfColors.teal, width: 2),
              ),
              child: pw.Row(
                children: [
                  pw.Text(_clinicName,
                      style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold, color: PdfColors.teal900)),
                ],
              ),
            ),
          pw.Text('${l10n.date}: $dateStr', style: const pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 16)
        ],
      ),
      footer: (ctx) => pw.Container(
        alignment: pw.Alignment.centerRight,
        child: pw.Text(l10n.reportPageXofY(ctx.pageNumber, ctx.pagesCount),
            style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
      ),
      build: (ctx) => [
        _buildPdfPersonInfo(l10n),
        pw.SizedBox(height: 16),
        if (_includeImagesInPdf && (rightBytes != null || leftBytes != null)) _buildPdfImages(rightBytes, leftBytes, l10n),
        if (_includeImagesInPdf && (rightBytes != null || leftBytes != null)) pw.SizedBox(height: 16),
        if (_anisocoriaResult != null) _buildPdfAnisocoria(l10n),
        if (_irisMetrics?.odIrisDiameterPx != null) _buildPdfIrisMetrics(l10n),
        if (_rightResult != null) _buildPdfEyeV53(l10n.rightEyeOD, _rightResult!, true, ml: _mlRightResult),
        pw.SizedBox(height: 12),
        if (_leftResult != null) _buildPdfEyeV53(l10n.leftEyeOS, _leftResult!, false, ml: _mlLeftResult),
        if (_rightResult?.anwAssessment != null && _leftResult?.anwAssessment != null)
          _buildPdfBilateralANW(l10n),
        pw.SizedBox(height: 16),
        if (globalSelectedConstitution != null) _buildPdfConstitution(l10n),
        if (_herbalModeEnabled && _herbalRecs.isNotEmpty) _buildPdfHerbal(l10n),
        if (_nutritionModeEnabled && _nutritionRecs.isNotEmpty) _buildPdfNutrition(l10n),
        if (_chiropracticModeEnabled && _chiropracticRecs.isNotEmpty) _buildPdfChiropractic(l10n),
        if (_tcmModeEnabled && _tcmRecs.isNotEmpty) _buildPdfTcm(l10n),
        _buildPdfReference(l10n)
      ],
    ));

    // USE NEW HELPER for cross-platform directory
    final reportDir = await _getReportsDirectory();
    final ts = DateFormat('yyyy-MM-dd_HH-mm-ss').format(now);
    final safeName = widget.patientInfo.name.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    final pdfPath = '${reportDir.path}/${safeName}_$ts.pdf';

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
              Text(pdfPath, style: const TextStyle(fontSize: 11))
            ],
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: l10n.open,
            textColor: Colors.white,
            onPressed: () => OpenFile.open(pdfPath),
          ),
        ),
      );
    }
    return pdfPath;
  } catch (e) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.pdfFailed(e.toString())), backgroundColor: Colors.red),
    );
    return null;
  }
}

  pw.Widget _buildPdfPersonInfo(AppLocalizations l10n) => pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.blue, width: 2)),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(l10n.reportPersonInformationTitle, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
        pw.SizedBox(height: 8),
        pw.Row(children: [
          pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [pw.Text('${l10n.plrNameLabel}: ${widget.patientInfo.name}'), pw.Text('${l10n.sex}: ${widget.patientInfo.sexString}')])),
          pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [pw.Text('${l10n.ageYears}: ${widget.patientInfo.age}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)), pw.Text('${l10n.reportAgeGroupLabel}: ${_ageNormResult != null ? _localizedAgeGroup(l10n, _ageNormResult!.ageGroup) : l10n.na}')]))
        ]),
        if (widget.patientInfo.mainComplaints?.isNotEmpty ?? false) ...[pw.SizedBox(height: 8), pw.Text('${l10n.mainComplaints}: ${widget.patientInfo.mainComplaints}', style: const pw.TextStyle(fontSize: 10))]
      ]));

  pw.Widget _buildPdfImages(Uint8List? rightBytes, Uint8List? leftBytes, AppLocalizations l10n) => pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly, children: [
    if (rightBytes != null) pw.Column(children: [
      pw.Container(width: 160, height: 160, decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.blue, width: 2)), child: pw.Image(pw.MemoryImage(rightBytes), fit: pw.BoxFit.cover)),
      pw.SizedBox(height: 8), pw.Text(l10n.rightEyeOD, style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
    ]),
    if (leftBytes != null) pw.Column(children: [
      pw.Container(width: 160, height: 160, decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.green, width: 2)), child: pw.Image(pw.MemoryImage(leftBytes), fit: pw.BoxFit.cover)),
      pw.SizedBox(height: 8), pw.Text(l10n.leftEyeOS, style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
    ])
  ]);

  pw.Widget _buildPdfAnisocoria(AppLocalizations l10n) {
    final r = _anisocoriaResult!;
    final isNone = r.severity == AnisocoriaSeverity.none;
    final borderColor = isNone ? PdfColors.green
        : (r.severity == AnisocoriaSeverity.mild ? PdfColors.amber
        : (r.isTBIIndicator ? PdfColors.deepOrange : PdfColors.orange));
    final bgColor = isNone ? PdfColors.green50
        : (r.severity == AnisocoriaSeverity.mild ? PdfColors.yellow50
        : (r.isTBIIndicator ? PdfColors.deepOrange50 : PdfColors.orange50));
    final labelColor = isNone ? PdfColors.green800
        : (r.isTBIIndicator ? PdfColors.deepOrange800 : PdfColors.orange800);
    final observationLabel = _anisocoriaObservationLabel(r.severity, l10n);
    final largerLabel = r.largerPupil == 'right' ? 'OD'
        : (r.largerPupil == 'left' ? 'OS' : null);

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 12), padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(color: bgColor, border: pw.Border.all(color: borderColor, width: 2)),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(l10n.pupilSizeDifference, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: labelColor)),
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            color: borderColor,
            child: pw.Text(observationLabel, style: const pw.TextStyle(color: PdfColors.white, fontSize: 9)),
          ),
        ]),
        pw.SizedBox(height: 8),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceAround, children: [
          pw.Text('${l10n.od}: ${r.rightPupilRatio.toStringAsFixed(1)}%',
              style: pw.TextStyle(fontWeight: r.largerPupil == 'right' ? pw.FontWeight.bold : pw.FontWeight.normal)),
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            color: borderColor,
            child: pw.Text('${r.absoluteDifference.toStringAsFixed(1)}% ${l10n.diff}', style: const pw.TextStyle(color: PdfColors.white)),
          ),
          pw.Text('${l10n.os}: ${r.leftPupilRatio.toStringAsFixed(1)}%',
              style: pw.TextStyle(fontWeight: r.largerPupil == 'left' ? pw.FontWeight.bold : pw.FontWeight.normal)),
        ]),
        if (largerLabel != null) ...[
          pw.SizedBox(height: 4),
          pw.Text('Larger: $largerLabel', style: pw.TextStyle(fontSize: 9, color: labelColor, fontWeight: pw.FontWeight.bold)),
        ],
        pw.SizedBox(height: 6),
        pw.Text(_localizedAnisocoriaNote(r, l10n), style: const pw.TextStyle(fontSize: 9)),
        if (r.isTBIIndicator) ...[
          pw.SizedBox(height: 4),
          pw.Text('* ${l10n.significantPupilSizeDiff}', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.deepOrange800)),
        ],
      ]),
    );
  }

  pw.Widget _buildPdfIrisMetrics(AppLocalizations l10n) => pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 12), padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(color: _irisMetrics!.isWellMatched ? PdfColors.green50 : PdfColors.orange50, border: pw.Border.all(color: _irisMetrics!.isWellMatched ? PdfColors.green : PdfColors.orange, width: 1)),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(l10n.reportCaptureDistanceMetricsTitle, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: _irisMetrics!.isWellMatched ? PdfColors.green800 : PdfColors.orange800)),
        pw.SizedBox(height: 8),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceAround, children: [
          pw.Column(children: [pw.Text('${l10n.od} ${l10n.irisDiameterLabel}', style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)), pw.Text('${_irisMetrics!.odIrisDiameterPx?.toStringAsFixed(0)}px', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))]),
          pw.Column(children: [pw.Text(l10n.diff, style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)), pw.Text('${_irisMetrics!.sizeDifferencePx?.toStringAsFixed(0)}px', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))]),
          pw.Column(children: [pw.Text('${l10n.os} ${l10n.irisDiameterLabel}', style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)), pw.Text('${_irisMetrics!.osIrisDiameterPx?.toStringAsFixed(0)}px', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))]),
          pw.Column(children: [pw.Text(l10n.reportMatchLabel, style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)), pw.Text('${_irisMetrics!.sizeMatchPercent?.toStringAsFixed(0)}%', style: pw.TextStyle(fontWeight: pw.FontWeight.bold))])
        ]),
        pw.SizedBox(height: 6), pw.Text(_irisMetrics!.distanceMatchStatus, style: pw.TextStyle(fontSize: 9, color: _irisMetrics!.isWellMatched ? PdfColors.green700 : PdfColors.orange700))
      ]));

  pw.Widget _buildPdfReference(AppLocalizations l10n) => pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(color: PdfColors.grey100, border: pw.Border.all(color: PdfColors.grey400)),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(l10n.reportReferenceValuesTitle, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 8),
        pw.Text(l10n.reportRefPiRatio, style: const pw.TextStyle(fontSize: 9)),
        pw.Text(l10n.reportRefEllipseness, style: const pw.TextStyle(fontSize: 9)),
        pw.Text(l10n.reportRefDecentralization, style: const pw.TextStyle(fontSize: 9)),
        pw.Text(l10n.reportRefPupilSizeDiff, style: const pw.TextStyle(fontSize: 9)),
        pw.SizedBox(height: 4),
        pw.Text('${l10n.anwRatio}: <25% ${l10n.anwSpastic}, 25-35% ${l10n.normal}, >35% ${l10n.anwAtonic}', style: const pw.TextStyle(fontSize: 9)),
        pw.Text('${l10n.anwAsymmetry}: ${l10n.normal} 0-5%', style: const pw.TextStyle(fontSize: 9)),
      ]));
// ==========================================================================
  pw.Widget _buildPdfEyeV53(String title, EyeAnalysisResult r, bool isRightEye, {MLAnalysisResult? ml}) {
    final l10n = AppLocalizations.of(context)!;
    final loc = PupilAnalyzerLocalizations(l10n);
    final eyeCode = isRightEye ? 'D' : 'S';
    final displayGrade = _displayGrade(r, isRightEye: isRightEye);

    List<pw.Widget> children = [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Text(title, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
        pw.Container(padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4), color: displayGrade == 'A' ? PdfColors.green : (displayGrade == 'B' ? PdfColors.orange : (displayGrade == 'C' ? PdfColors.deepOrange : PdfColors.red)), child: pw.Text('${l10n.reportGradeLabel} $displayGrade', style: const pw.TextStyle(color: PdfColors.white, fontSize: 10)))
      ]),
      pw.SizedBox(height: 8),
      pw.Row(children: [
        pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('${l10n.piRatioLabel} ${r.pupilIrisRatio.toStringAsFixed(1)}%${_showMlComparison && ml != null ? " (ML: ${ml.piRatio.toStringAsFixed(1)}%)" : ""}', style: const pw.TextStyle(fontSize: 10)),
          pw.Text('${l10n.ellipsenessLabel} ${r.ellipseness.toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 10)),
          pw.Text('${l10n.circularity}: ${r.circularityScore.toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 10))
        ])),
        pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('${l10n.decentralizationLabel} ${r.decentralization.toStringAsFixed(1)}% @ ${r.decentralizationAngle.toStringAsFixed(0)}°', style: const pw.TextStyle(fontSize: 10)),
          pw.Text('${l10n.confidence}: ${(_displayConfidence(r, isRightEye: isRightEye) * 100).toStringAsFixed(0)}%', style: const pw.TextStyle(fontSize: 10))
        ]))
      ]),
      pw.SizedBox(height: 10)
    ];

    // Pupil Form
    if (r.ellipseAssessment != null) {
      final isNormal = r.ellipseAssessment!.formType == PupilFormType.circle;
      children.add(pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(color: isNormal ? PdfColors.green50 : PdfColors.orange50, border: pw.Border.all(color: isNormal ? PdfColors.green : PdfColors.orange)),
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('${l10n.pupilForm}: ${loc.getFormTypeName(r.ellipseAssessment!.formType)}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: isNormal ? PdfColors.green800 : PdfColors.orange800)),
          pw.SizedBox(height: 4),
          pw.Text(loc.getPupilFormDescription(r.ellipseAssessment!.formType), style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700))
        ])
      ));
    }

    // Decentration
    if (r.decentrationAssessment != null && r.decentrationAssessment!.pattern != DecentrationPattern.centered) {
      children.add(pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(color: PdfColors.purple50, border: pw.Border.all(color: PdfColors.purple)),
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('${loc.getPatternName(r.decentrationAssessment!.pattern)} (${r.decentralization.toStringAsFixed(1)}%)', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.purple800)),
          pw.SizedBox(height: 4),
          pw.Text(loc.getDecentrationDescription(r.decentrationAssessment!.pattern, isRightEye), style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700))
        ])
      ));
    }

    // Flattenings
    if (r.flattenings.isNotEmpty) {
      children.add(pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(color: PdfColors.blue50, border: pw.Border.all(color: PdfColors.blue)),
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('${l10n.flattenings} (${r.flattenings.length})', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.blue800)),
          pw.SizedBox(height: 6),
          ...r.flattenings.map((f) => pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 6),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Row(children: [
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: const pw.BoxDecoration(color: PdfColors.blue200),
                  child: pw.Text(loc.getZoneName(f.zone).toUpperCase(), style: const pw.TextStyle(fontSize: 8, color: PdfColors.blue900))
                ),
                pw.SizedBox(width: 6),
                pw.Text('${f.percentage.toStringAsFixed(1)}%', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.blue)),
                if (f.clockPosition.isNotEmpty) ...[
                  pw.SizedBox(width: 6),
                  pw.Text('(${f.clockPosition})', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600))
                ]
              ]),
              pw.SizedBox(height: 3),
              pw.Text(loc.getFlatteningDescription(f.zone, isRightEye), style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey700))
            ])
          ))
        ])
      ));
    }

    // Protrusions
    if (r.protrusions.isNotEmpty) {
      children.add(pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(color: PdfColors.orange50, border: pw.Border.all(color: PdfColors.orange)),
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('${l10n.protrusions} (${r.protrusions.length})', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.orange800)),
          pw.SizedBox(height: 6),
          ...r.protrusions.map((p) => pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 6),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Row(children: [
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: const pw.BoxDecoration(color: PdfColors.orange200),
                  child: pw.Text(loc.getZoneName(p.zone).toUpperCase(), style: const pw.TextStyle(fontSize: 8, color: PdfColors.orange900))
                ),
                pw.SizedBox(width: 6),
                pw.Text('${p.percentage.toStringAsFixed(1)}%', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.orange)),
                if (p.clockPosition.isNotEmpty) ...[
                  pw.SizedBox(width: 6),
                  pw.Text('(${p.clockPosition})', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600))
                ]
              ]),
              pw.SizedBox(height: 3),
              pw.Text(loc.getProtrusionDescription(p.zone, isRightEye), style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey700))
            ])
          ))
        ])
      ));
    }

    // ANW Section
    if (r.anwAssessment != null) {
      final anw = r.anwAssessment!;
      final statusColor = anw.isRatioNormal ? PdfColors.green : (anw.ratioStatus == ANWRatioStatus.spastic ? PdfColors.blue : PdfColors.orange);

      List<pw.Widget> anwWidgets = [
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(l10n.anwTitle.toUpperCase(), style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.cyan800)),
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            color: anw.isOverallNormal ? PdfColors.green : PdfColors.orange,
            child: pw.Text(anw.isOverallNormal ? l10n.normal : l10n.anwAbnormal, style: const pw.TextStyle(fontSize: 8, color: PdfColors.white)),
          ),
        ]),
        pw.SizedBox(height: 8),
        pw.Row(children: [
          pw.Text('${l10n.anwDiameter}: ${anw.diameterPx.toStringAsFixed(0)} px', style: const pw.TextStyle(fontSize: 9)),
          pw.SizedBox(width: 20),
          pw.Text('${l10n.anwPerimeter}: ${anw.perimeterPx.toStringAsFixed(0)} px', style: const pw.TextStyle(fontSize: 9)),
        ]),
        pw.SizedBox(height: 6),
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
          columnWidths: {
            0: const pw.FlexColumnWidth(2),
            1: const pw.FlexColumnWidth(1.5),
            2: const pw.FlexColumnWidth(1.5),
          },
          children: [
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.parameter, style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold))),
                pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.reportValueLabel, style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold))),
                pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.status, style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold))),
              ],
            ),
            pw.TableRow(children: [
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.anwRatio, style: const pw.TextStyle(fontSize: 8))),
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text('${anw.ratio.toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 8))),
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(_getLocalizedRatioStatusPdf(anw.ratioStatus, l10n), style: pw.TextStyle(fontSize: 8, color: statusColor))),
            ]),
            pw.TableRow(children: [
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.anwAsymmetry, style: const pw.TextStyle(fontSize: 8))),
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text('${anw.asymmetryPercent.toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 8))),
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(anw.isAsymmetryNormal ? l10n.normal : l10n.anwElevated, style: pw.TextStyle(fontSize: 8, color: anw.isAsymmetryNormal ? PdfColors.green : PdfColors.orange))),
            ]),
            pw.TableRow(children: [
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(l10n.anwFormType, style: const pw.TextStyle(fontSize: 8))),
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(_getLocalizedFormTypePdf(anw.formType, l10n), style: const pw.TextStyle(fontSize: 8))),
              pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(anw.isFormNormal ? l10n.normal : l10n.anwAbnormal, style: pw.TextStyle(fontSize: 8, color: anw.isFormNormal ? PdfColors.green : PdfColors.orange))),
            ]),
          ],
        ),
      ];

      // Tonic State
      if (anw.tonicState != null) {
        anwWidgets.add(pw.SizedBox(height: 6));
        anwWidgets.add(pw.Container(
          padding: const pw.EdgeInsets.all(6),
          decoration: pw.BoxDecoration(color: statusColor == PdfColors.blue ? PdfColors.blue50 : PdfColors.orange50, border: pw.Border.all(color: statusColor)),
          child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text('${l10n.reportTonicStateLabel}: ${_getLocalizedTonicStatePdf(anw.tonicState!, l10n)}', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: statusColor)),
            if (anw.tonicStateDescription.isNotEmpty) ...[
              pw.SizedBox(height: 3),
              pw.Text(_getLocalizedTonicDescPdf(anw.ratioStatus, l10n), style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey700)),
            ],
          ]),
        ));
      }

      // Shift - CLEANER FORMAT
      if (anw.hasShift && anw.primaryShift != null) {
        anwWidgets.add(pw.SizedBox(height: 6));
        anwWidgets.add(pw.Container(
          padding: const pw.EdgeInsets.all(6),
          decoration: pw.BoxDecoration(color: PdfColors.deepOrange50, border: pw.Border.all(color: PdfColors.deepOrange)),
          child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text('${l10n.reportShiftDetectedTitle}: $eyeCode: ${_getLocalizedShiftLabel(anw.primaryShift!, l10n)} (${anw.primaryShift!.clockPosition}, ${anw.primaryShift!.deviationPercent.toStringAsFixed(1)}%)', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.deepOrange800)),
            if (anw.primaryShift!.clinicalAssociation.isNotEmpty) ...[
              pw.SizedBox(height: 3),
              pw.Text(_getLocalizedShiftAssocPdf(anw.primaryShift!, isRightEye, l10n), style: pw.TextStyle(fontSize: 7, color: PdfColors.grey700, fontStyle: pw.FontStyle.italic)),
            ],
          ]),
        ));
      }

      // Constriction
      if (anw.hasConstrictions) {
        anwWidgets.add(pw.SizedBox(height: 6));
        anwWidgets.add(pw.Container(
          padding: const pw.EdgeInsets.all(6),
          decoration: pw.BoxDecoration(color: PdfColors.blue50, border: pw.Border.all(color: PdfColors.blue)),
          child: pw.Text('${l10n.reportConstrictionDetectedTitle}: $eyeCode: ${_getLocalizedConstrictionPdf(anw, l10n)}', style: const pw.TextStyle(fontSize: 9)),
        ));
      }

      // Findings
      if (anw.bexelFindings.isNotEmpty) {
        anwWidgets.add(pw.SizedBox(height: 6));
        anwWidgets.add(pw.Container(
          padding: const pw.EdgeInsets.all(6),
          decoration: pw.BoxDecoration(color: PdfColors.grey100, border: pw.Border.all(color: PdfColors.grey400)),
          child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text(l10n.findings, style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold, color: PdfColors.cyan800)),
            pw.SizedBox(height: 3),
            ...anw.bexelFindings.map((f) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 2),
              child: pw.Text(_getLocalizedAnwFinding(f, l10n), style: const pw.TextStyle(fontSize: 8)),
            )),
          ]),
        ));
      }

      children.add(pw.Container(
        margin: const pw.EdgeInsets.only(top: 8),
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(color: PdfColors.cyan50, border: pw.Border.all(color: PdfColors.cyan, width: 1.5)),
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: anwWidgets),
      ));
    }

    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.blue)),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: children)
    );
  }

  // ==========================================================================
  // IMPROVED BILATERAL ANW COMPARISON - CLEANER FORMAT
  // ==========================================================================
  // IMPROVED BILATERAL ANW COMPARISON - CLEANER FORMAT
  // ==========================================================================
  pw.Widget _buildPdfBilateralANW(AppLocalizations l10n) {
    final odAnw = _rightResult!.anwAssessment!;
    final osAnw = _leftResult!.anwAssessment!;
    final ratioDiff = (odAnw.ratio - osAnw.ratio).abs();

    final hasFunctionalFrustration =
        (odAnw.ratioStatus == ANWRatioStatus.spastic && osAnw.ratioStatus == ANWRatioStatus.atonic) ||
            (odAnw.ratioStatus == ANWRatioStatus.atonic && osAnw.ratioStatus == ANWRatioStatus.spastic);

    final isSymmetric = ratioDiff <= 5;
    final borderColor = hasFunctionalFrustration ? PdfColors.red : (isSymmetric ? PdfColors.green : PdfColors.orange);

    return pw.Container(
      margin: const pw.EdgeInsets.only(top: 12),
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: hasFunctionalFrustration ? PdfColors.red50 : (isSymmetric ? PdfColors.green50 : PdfColors.orange50),
        border: pw.Border.all(color: borderColor, width: 2),
      ),
      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Text(l10n.bilateralANWComparison, style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: borderColor)),
        pw.SizedBox(height: 10),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceAround, children: [
          pw.Column(children: [
            pw.Text(l10n.od, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.Text('${odAnw.ratio.toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 14)),
            pw.Text(_getLocalizedRatioStatusPdf(odAnw.ratioStatus, l10n), style: pw.TextStyle(fontSize: 9, color: _pdfAnwStatusColor(odAnw.ratioStatus))),
          ]),
          pw.Column(children: [
            pw.Text(l10n.diff, style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              color: borderColor,
              child: pw.Text('${ratioDiff.toStringAsFixed(1)}%', style: const pw.TextStyle(color: PdfColors.white, fontSize: 12)),
            ),
          ]),
          pw.Column(children: [
            pw.Text(l10n.os, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.Text('${osAnw.ratio.toStringAsFixed(1)}%', style: const pw.TextStyle(fontSize: 14)),
            pw.Text(_getLocalizedRatioStatusPdf(osAnw.ratioStatus, l10n), style: pw.TextStyle(fontSize: 9, color: _pdfAnwStatusColor(osAnw.ratioStatus))),
          ]),
        ]),
        pw.SizedBox(height: 10),
        if (hasFunctionalFrustration)
          pw.Container(
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(color: PdfColors.red100, border: pw.Border.all(color: PdfColors.red)),
            child: pw.Text(
              l10n.functionalFrustration,
              style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.red900),
            ),
          )
        else
          pw.Text(
            isSymmetric ? l10n.anwSymmetryNormal : l10n.anwAsymmetryDetected,
            style: pw.TextStyle(fontSize: 9, color: borderColor),
          ),
      ]),
    );
  }

// ── CONSTITUTIONAL IRIDOLOGY PDF SECTION ─────────────────────────────────────

  pw.Widget _buildPdfConstitution(AppLocalizations l10n) {
    final c = findConstitution(globalSelectedConstitution!);
    if (c == null) return pw.SizedBox();

    // Light theme — easy to read on printed/exported PDF
    const amberDark  = PdfColor(0.75, 0.45, 0.0);   // deep amber for headers
    const headerBg   = PdfColor(1.0,  0.94, 0.80);  // warm cream header background
    const subHdrBg   = PdfColor(0.94, 0.97, 1.0);   // very light blue for iris section
    const predBg     = PdfColor(1.0,  0.97, 0.92);  // light peach for predispositions
    const remedyBg   = PdfColor(0.92, 1.0,  0.92);  // light green for remedies
    const bodyText   = PdfColors.black;
    const mutedText  = PdfColor(0.35, 0.35, 0.35);
    const divider    = PdfColor(0.85, 0.75, 0.55);

    pw.Widget sectionLabel(String title, PdfColor bg, PdfColor textColor) =>
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: bg,
          child: pw.Text(title,
              style: pw.TextStyle(
                  color: textColor,
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                  letterSpacing: 0.8)),
        );

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 16),
      decoration: pw.BoxDecoration(
        color: PdfColors.white,
        border: pw.Border.all(color: amberDark, width: 1.5),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // ── Header bar ──────────────────────────────────────────────────────
          pw.Container(
            width: double.infinity,
            padding: const pw.EdgeInsets.all(10),
            color: headerBg,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                  pw.Text('CONSTITUTIONAL IRIDOLOGY',
                      style: pw.TextStyle(
                          color: amberDark,
                          fontSize: 8,
                          fontWeight: pw.FontWeight.bold,
                          letterSpacing: 1.2)),
                  pw.SizedBox(height: 3),
                  pw.Text(c.name,
                      style: pw.TextStyle(
                          color: bodyText,
                          fontSize: 13,
                          fontWeight: pw.FontWeight.bold)),
                ]),
                pw.Container(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: pw.BoxDecoration(
                    color: amberDark,
                    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(10)),
                  ),
                  child: pw.Text(c.group,
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold)),
                ),
              ],
            ),
          ),

          pw.Divider(color: divider, thickness: 0.5),

          // ── Iris Description ─────────────────────────────────────────────
          sectionLabel('IRIS DESCRIPTION', subHdrBg, const PdfColor(0.0, 0.35, 0.65)),
          pw.Padding(
            padding: const pw.EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: pw.Text(c.irisDescription,
                style: pw.TextStyle(color: bodyText, fontSize: 9, lineSpacing: 2.5)),
          ),

          pw.Divider(color: divider, thickness: 0.5),

          // ── Health Predispositions ────────────────────────────────────────
          sectionLabel('HEALTH PREDISPOSITIONS', predBg, const PdfColor(0.55, 0.25, 0.0)),
          pw.Padding(
            padding: const pw.EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: c.predispositions
                  .map((p) => pw.Padding(
                        padding: const pw.EdgeInsets.only(bottom: 5),
                        child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('- ',
                                style: pw.TextStyle(
                                    color: amberDark,
                                    fontSize: 9,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Expanded(
                              child: pw.Text(p,
                                  style: pw.TextStyle(
                                      color: bodyText, fontSize: 9, lineSpacing: 2)),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),

          pw.Divider(color: divider, thickness: 0.5),

          // ── Homeopathic Remedies ──────────────────────────────────────────
          sectionLabel('HOMEOPATHIC REMEDIES', remedyBg, const PdfColor(0.0, 0.45, 0.15)),
          pw.Padding(
            padding: const pw.EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: pw.Wrap(
              spacing: 8,
              runSpacing: 6,
              children: c.homeopathicRemedies
                  .map((r) => pw.Container(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: pw.BoxDecoration(
                          color: const PdfColor(0.90, 1.0, 0.90),
                          border: pw.Border.all(
                              color: const PdfColor(0.0, 0.55, 0.20), width: 0.8),
                          borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                        ),
                        child: pw.Text(r,
                            style: pw.TextStyle(
                                color: const PdfColor(0.0, 0.35, 0.10),
                                fontSize: 9,
                                fontWeight: pw.FontWeight.bold)),
                      ))
                  .toList(),
            ),
          ),

          // ── Footer ────────────────────────────────────────────────────────
          pw.Padding(
            padding: const pw.EdgeInsets.fromLTRB(10, 0, 10, 8),
            child: pw.Text(
              'Based on Dr. Josef Deck\'s Constitutional Iridology - for educational reference only.',
              style: pw.TextStyle(color: mutedText, fontSize: 7, lineSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }

// ── THERAPY PDF SECTIONS ─────────────────────────────────────────────────────

  pw.Widget _buildPdfHerbal(AppLocalizations l10n) {
    const hdrColor = PdfColors.green800;
    pw.Widget badge(String label, PdfColor color) => pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          color: color,
          child: pw.Text(label,
              style: const pw.TextStyle(color: PdfColors.white, fontSize: 8)),
        );
    String fLabel(String t) => t == 'flattening' ? 'FLAT' : (t == 'protrusion' ? 'PROT' : 'ANW');
    PdfColor fColor(String t) => t == 'flattening' ? PdfColors.orange : (t == 'protrusion' ? PdfColors.red : PdfColors.purple);

    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.SizedBox(height: 16),
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: hdrColor,
        child: pw.Text(l10n.therapyHerbalTitle,
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
      ),
      pw.SizedBox(height: 6),
      ..._herbalRecs.map((rec) => pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 6),
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
                color: PdfColors.green50, border: pw.Border.all(color: PdfColors.green200)),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Row(children: [
                badge(fLabel(rec.findingType), fColor(rec.findingType)),
                pw.SizedBox(width: 5),
                badge(rec.eyeLabel, rec.isRightEye ? PdfColors.blue : PdfColors.green700),
                pw.SizedBox(width: 8),
                pw.Expanded(
                    child: pw.Text(rec.organInfo.organs.take(3).join(' · '),
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold, color: hdrColor))),
                pw.Text('${rec.severity.toStringAsFixed(1)}%',
                    style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
              ]),
              if (rec.conditions.isNotEmpty) ...[
                pw.SizedBox(height: 5),
                ...rec.conditions.take(4).map((cond) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 3),
                      child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                        pw.Text(cond.condition,
                            style: pw.TextStyle(
                                fontSize: 9,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.teal800)),
                        pw.Text(
                            cond.herbs.take(8).map((h) => '${h.herb} (x${h.count})').join(', '),
                            style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                      ]),
                    )),
              ],
            ]),
          )),
      pw.Container(
        padding: const pw.EdgeInsets.all(6),
        color: PdfColors.grey100,
        child: pw.Text(l10n.therapyHerbalDisclaimer,
            style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey600)),
      ),
    ]);
  }

  pw.Widget _buildPdfNutrition(AppLocalizations l10n) {
    const hdrColor = PdfColors.orange800;
    pw.Widget badge(String label, PdfColor color) => pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          color: color,
          child: pw.Text(label,
              style: const pw.TextStyle(color: PdfColors.white, fontSize: 8)),
        );
    String fLabel(String t) => t == 'flattening' ? 'FLAT' : (t == 'protrusion' ? 'PROT' : 'ANW');
    PdfColor fColor(String t) => t == 'flattening' ? PdfColors.orange : (t == 'protrusion' ? PdfColors.red : PdfColors.purple);

    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.SizedBox(height: 16),
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: hdrColor,
        child: pw.Text(l10n.therapyNutritionTitle,
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
      ),
      pw.SizedBox(height: 6),
      ..._nutritionRecs.map((rec) => pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 6),
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
                color: PdfColors.orange50, border: pw.Border.all(color: PdfColors.orange200)),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Row(children: [
                badge(fLabel(rec.findingType), fColor(rec.findingType)),
                pw.SizedBox(width: 5),
                badge(rec.eyeLabel, rec.isRightEye ? PdfColors.blue : PdfColors.green700),
                pw.SizedBox(width: 8),
                pw.Expanded(
                    child: pw.Text(rec.organInfo.organs.take(2).join(' · '),
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold, color: hdrColor))),
              ]),
              pw.SizedBox(height: 5),
              if (rec.nutrition.nutrients.isNotEmpty)
                pw.Text(
                    '${l10n.therapyNutritionKeyNutrients}: ${rec.nutrition.nutrients.take(10).join(', ')}',
                    style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey800)),
              if (rec.nutrition.colorFoods.isNotEmpty) ...[
                pw.SizedBox(height: 3),
                ...rec.nutrition.colorFoods.entries.take(4).map((e) => pw.Text(
                      '${e.key}: ${e.value.take(4).join(", ")}',
                      style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700),
                    )),
              ],
              if (rec.nutrition.organSupportNotes.isNotEmpty) ...[
                pw.SizedBox(height: 3),
                pw.Text(rec.nutrition.organSupportNotes.first,
                    style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
              ],
            ]),
          )),
      pw.Container(
        padding: const pw.EdgeInsets.all(6),
        color: PdfColors.grey100,
        child: pw.Text(l10n.therapyNutritionDisclaimer,
            style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey600)),
      ),
    ]);
  }

  pw.Widget _buildPdfChiropractic(AppLocalizations l10n) {
    const hdrColor = PdfColors.purple800;
    pw.Widget badge(String label, PdfColor color) => pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          color: color,
          child: pw.Text(label,
              style: const pw.TextStyle(color: PdfColors.white, fontSize: 8)),
        );
    String fLabel(String t) => t == 'flattening' ? 'FLAT' : (t == 'protrusion' ? 'PROT' : 'ANW');
    PdfColor fColor(String t) => t == 'flattening' ? PdfColors.orange : (t == 'protrusion' ? PdfColors.red : PdfColors.purple);

    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.SizedBox(height: 16),
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: hdrColor,
        child: pw.Text(l10n.therapyChiroTitle,
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
      ),
      pw.SizedBox(height: 6),
      ..._chiropracticRecs.map((rec) => pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 6),
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
                color: PdfColors.purple50, border: pw.Border.all(color: PdfColors.purple200)),
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Row(children: [
                badge(fLabel(rec.findingType), fColor(rec.findingType)),
                pw.SizedBox(width: 5),
                badge(rec.eyeLabel, rec.isRightEye ? PdfColors.blue : PdfColors.green700),
                pw.SizedBox(width: 8),
                pw.Expanded(
                    child: pw.Text(rec.spinalData.segmentLabel,
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold, color: hdrColor))),
                pw.Text('${rec.severity.toStringAsFixed(1)}%',
                    style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
              ]),
              pw.SizedBox(height: 2),
              pw.Text(rec.organInfo.displayName,
                  style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
              pw.SizedBox(height: 5),
              pw.Text(
                  '${l10n.therapyChiroNerveRoots}: ${rec.spinalData.nerveRoots.join(", ")}',
                  style: const pw.TextStyle(fontSize: 9)),
              pw.SizedBox(height: 3),
              pw.Text('${l10n.therapyChiroSubluxation}:',
                  style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: hdrColor)),
              ...rec.spinalData.subluxationSymptoms.take(3).map(
                    (s) => pw.Text('  - $s', style: const pw.TextStyle(fontSize: 8)),
                  ),
              pw.SizedBox(height: 3),
              pw.Text('${l10n.therapyChiroExercises}:',
                  style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: hdrColor)),
              ...rec.spinalData.exercises.take(3).map(
                    (e) => pw.Text('  > $e', style: const pw.TextStyle(fontSize: 8)),
                  ),
              if (rec.spinalData.posturalNote.isNotEmpty) ...[
                pw.SizedBox(height: 4),
                pw.Container(
                  padding: const pw.EdgeInsets.all(5),
                  color: PdfColors.amber50,
                  child: pw.Text(rec.spinalData.posturalNote,
                      style: const pw.TextStyle(fontSize: 8, color: PdfColors.brown)),
                ),
              ],
            ]),
          )),
      pw.Container(
        padding: const pw.EdgeInsets.all(6),
        color: PdfColors.grey100,
        child: pw.Text(l10n.therapyChiroDisclaimer,
            style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey600)),
      ),
    ]);
  }

  pw.Widget _buildPdfTcm(AppLocalizations l10n) {
    const hdrColor = PdfColors.red800;

    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.SizedBox(height: 16),
      pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: hdrColor,
        child: pw.Text(l10n.therapyTcmTitle,
            style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
      ),
      pw.SizedBox(height: 6),
      ..._tcmRecs.map((rec) {
        final tcm = rec.tcmData;
        final el = tcm.element;
        final pattern = tcm.patterns.isNotEmpty ? tcm.patterns.first : null;
        return pw.Container(
          margin: const pw.EdgeInsets.only(bottom: 6),
          padding: const pw.EdgeInsets.all(8),
          decoration: pw.BoxDecoration(
              color: PdfColors.red50, border: pw.Border.all(color: PdfColors.red200)),
          child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            // Organ + element + clock
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
              pw.Expanded(
                  child: pw.Text('${tcm.primaryOrgan}  |  ${el.name} Element',
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold, color: hdrColor))),
              pw.Text(tcm.organClockTime,
                  style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
            ]),
            pw.Text(
                '${l10n.therapyPairedOrgan(tcm.pairedOrgan)}  |  ${el.season}  |  ${l10n.therapyTasteLabel}: ${el.taste}',
                style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
            pw.SizedBox(height: 5),
            // Meridian functions
            pw.Text('${l10n.therapyTcmMeridianFunctions}:',
                style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: hdrColor)),
            ...tcm.meridianFunctions.take(2).map(
                  (f) => pw.Text('  - $f', style: const pw.TextStyle(fontSize: 8)),
                ),
            // Pattern
            if (pattern != null) ...[
              pw.SizedBox(height: 5),
              pw.Container(
                padding: const pw.EdgeInsets.all(6),
                color: PdfColors.red100,
                child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                  pw.Text('${l10n.therapyTcmPatterns}: ${pattern.name}',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.red800)),
                  pw.Text(
                      '${l10n.therapyTcmSymptoms}: ${pattern.symptoms.take(5).join(", ")}',
                      style: const pw.TextStyle(fontSize: 8)),
                  if (pattern.classicFormulas.isNotEmpty)
                    pw.Text('${l10n.therapyTcmFormulas}: ${pattern.classicFormulas.first}',
                        style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey700)),
                ]),
              ),
            ],
            if (tcm.tonifyingFoods.isNotEmpty) ...[
              pw.SizedBox(height: 5),
              pw.Text(
                  '${l10n.therapyTcmTonifying} ${tcm.tonifyingFoods.take(6).join(", ")}',
                  style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey800)),
            ],
          ]),
        );
      }),
      pw.Container(
        padding: const pw.EdgeInsets.all(6),
        color: PdfColors.grey100,
        child: pw.Text(l10n.therapyTcmDisclaimer,
            style: const pw.TextStyle(fontSize: 7, color: PdfColors.grey600)),
      ),
    ]);
  }

  PdfColor _pdfAnwStatusColor(ANWRatioStatus status) {
    switch (status) {
      case ANWRatioStatus.spastic: return PdfColors.blue;
      case ANWRatioStatus.normal: return PdfColors.green;
      case ANWRatioStatus.atonic: return PdfColors.orange;
    }
  }
// DESKTOP: Exit the application
  void _exitApp() {
    exit(0);
  }
  Future<void> _sharePdfReport() async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final pdfPath = await _exportPdf(showSnackbar: false);
      if (pdfPath != null) {
        final dateStr = DateFormat('MMMM dd, yyyy HH:mm').format(DateTime.now());

        // Use share dialog on all platforms (share_plus supports Windows/macOS/Linux)
        await Share.shareXFiles(
          [XFile(pdfPath)],
          subject: l10n.reportShareSubject(widget.patientInfo.name),
          text: l10n.reportShareBody(widget.patientInfo.name, dateStr),
        );
      }
    } catch (e) {
      // If share fails on desktop, fall back to opening the file
      if (_isDesktop) {
        try {
          final pdfPath = await _exportPdf(showSnackbar: false);
          if (pdfPath != null) {
            await OpenFile.open(pdfPath);
            // ... shows snackbar
          }
        } catch (e2) { /* error handling */ }
      } else {
        // Mobile error handling
      }
    }
  }
} // END OF _AnalysisScreenState CLASS

// ==========================================================================
// HELPER CLASSES
// ==========================================================================
class _PupilNormData {
  final String group;
  final double expected, min, max;
  _PupilNormData({required this.group, required this.expected, required this.min, required this.max});
}

class BilateralIrisMetrics {
  final double? odIrisDiameterPx, osIrisDiameterPx, sizeDifferencePx, sizeMatchPercent;
  final String distanceMatchStatus;
  final bool isWellMatched;

  BilateralIrisMetrics({this.odIrisDiameterPx, this.osIrisDiameterPx, this.sizeDifferencePx, this.sizeMatchPercent, required this.distanceMatchStatus, required this.isWellMatched});

  factory BilateralIrisMetrics.calculate(double? odSize, double? osSize) {
    if (odSize == null || osSize == null) return BilateralIrisMetrics(odIrisDiameterPx: odSize, osIrisDiameterPx: osSize, distanceMatchStatus: 'Incomplete data', isWellMatched: false);

    final diff = (odSize - osSize).abs();
    final avg = (odSize + osSize) / 2;
    final matchPercent = avg > 0 ? (1 - (diff / avg)) * 100 : 0.0;

    String status; bool wellMatched;
    if (matchPercent >= 90) { status = 'Excellent match'; wellMatched = true; }
    else if (matchPercent >= 80) { status = 'Good match'; wellMatched = true; }
    else if (matchPercent >= 70) { status = 'Acceptable match'; wellMatched = true; }
    else { status = 'Distance mismatch - consider retaking'; wellMatched = false; }

    return BilateralIrisMetrics(odIrisDiameterPx: odSize, osIrisDiameterPx: osSize, sizeDifferencePx: diff, sizeMatchPercent: matchPercent.toDouble(), distanceMatchStatus: status, isWellMatched: wellMatched);
  }

  Map<String, dynamic> toJson() => {'odIrisDiameterPx': odIrisDiameterPx, 'osIrisDiameterPx': osIrisDiameterPx, 'sizeDifferencePx': sizeDifferencePx, 'sizeMatchPercent': sizeMatchPercent, 'distanceMatchStatus': distanceMatchStatus, 'isWellMatched': isWellMatched};
}

class _EyeZoneOverlayPainter extends CustomPainter {
  final EyeAnalysisResult result;
  final bool showIris;
  final bool showPupil;
  final bool showANW;
  final bool showAxis;
  final bool showChart;
  final String chartPreset;
  final double irisRadiusFraction;
  final double pupilRingScale;   // user fine-tune of pupil ring radius
  final double anwRingScale;     // user fine-tune of ANW/collarette ring radius
  final double irisLimbusScale;  // user fine-tune of iris limbus ring radius

  _EyeZoneOverlayPainter({
    required this.result,
    required this.showIris,
    required this.showPupil,
    required this.showANW,
    required this.showAxis,
    required this.showChart,
    required this.chartPreset,
    this.irisRadiusFraction = 0.48,
    this.pupilRingScale = 1.0,
    this.anwRingScale = 1.0,
    this.irisLimbusScale = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final irisCenter = Offset(size.width / 2, size.height / 2);

    final irisRadius = math.min(size.width, size.height) * irisRadiusFraction;
    // Apply user iris limbus scale (independent of chart scale)
    final displayIrisRadius = irisRadius * irisLimbusScale;
    final pupilRatio = (result.pupilIrisRatio / 100).clamp(0.05, 0.95);
    // Apply user pupil ring scale
    final pupilRadius = irisRadius * pupilRatio * pupilRingScale;

    final ellipseness = (result.ellipseness / 100).clamp(0.4, 1.0);
    final pupilMajor = pupilRadius;
    final pupilMinor = pupilRadius * ellipseness;
    final pupilAngleDeg = result.ellipseAssessment?.orientationAngle ?? 0.0;

    // ANW/collarette ring: anatomically sits ~1.5mm outside pupil margin.
    // In normalized coords, we place it at pupilRadius + 15% of iris radius,
    // then apply the user's anwRingScale for fine-tuning.
    final anwBaseRadius = pupilRadius + irisRadius * 0.15;
    final anwRadius = anwBaseRadius * anwRingScale;

    if (showAxis) {
      final grid = Paint()
        ..color = Colors.white24
        ..strokeWidth = 1;
      canvas.drawLine(Offset(irisCenter.dx, 0), Offset(irisCenter.dx, size.height), grid);
      canvas.drawLine(Offset(0, irisCenter.dy), Offset(size.width, irisCenter.dy), grid);
    }

    if (showIris) {
      final irisPaint = Paint()
        ..color = const Color(0xFF00D9FF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(irisCenter, displayIrisRadius, irisPaint);
    }

    if (showANW) {
      final anwPaint = Paint()
        ..color = Colors.amberAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;
      canvas.drawCircle(irisCenter, anwRadius, anwPaint);
    }

    if (showPupil) {
      final pupilPaint = Paint()
        ..color = Colors.greenAccent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2;

      canvas.save();
      canvas.translate(irisCenter.dx, irisCenter.dy);
      canvas.rotate(pupilAngleDeg * math.pi / 180);
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset.zero,
          width: pupilMajor * 2,
          height: pupilMinor * 2,
        ),
        pupilPaint,
      );
      canvas.restore();

      canvas.drawCircle(irisCenter, 3, Paint()..color = Colors.greenAccent);
    }

    if (showAxis) {
      final linePaint = Paint()
        ..color = Colors.redAccent.withOpacity(0.8)
        ..strokeWidth = 1.8;
      final radial = Offset(
        irisCenter.dx + math.cos((result.decentralizationAngle - 90) * math.pi / 180) * (irisRadius * (result.decentralization / 100)),
        irisCenter.dy + math.sin((result.decentralizationAngle - 90) * math.pi / 180) * (irisRadius * (result.decentralization / 100)),
      );
      canvas.drawLine(irisCenter, radial, linePaint);
    }

    if (showChart) {
      _drawIridologyChart(canvas, irisCenter, irisRadius);
    }
  }

  void _drawIridologyChart(Canvas canvas, Offset c, double r) {
    final chartPaint = Paint()
      ..color = Colors.white.withOpacity(0.78)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // 4 concentric rings: limbus, ciliary zone, mid-iris, collarette/ANW
    canvas.drawCircle(c, r,        chartPaint);
    canvas.drawCircle(c, r * 0.82, chartPaint);
    canvas.drawCircle(c, r * 0.65, chartPaint);
    canvas.drawCircle(c, r * 0.52, chartPaint);

    // Sector count based on decoded chart data
    final int sectors;
    switch (chartPreset) {
      case 'Velchover': sectors = 36; break;
      case 'Angerer':   sectors = 36; break;
      case 'Jensen':    sectors = 36; break;
      case 'Roberts':   sectors = 36; break;
      default:          sectors = 24; break;
    }
    for (int i = 0; i < sectors; i++) {
      final a = (2 * math.pi * i) / sectors;
      final p1 = Offset(c.dx + math.cos(a) * (r * 0.52), c.dy + math.sin(a) * (r * 0.52));
      final p2 = Offset(c.dx + math.cos(a) * r, c.dy + math.sin(a) * r);
      canvas.drawLine(p1, p2, chartPaint);
    }

    // Small zone blocks in the mid-iris band
    final blockPaint = Paint()
      ..color = Colors.white.withOpacity(0.65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final blocks = (sectors / 2).round();
    for (int i = 0; i < blocks; i++) {
      final a = (2 * math.pi * i) / blocks;
      final rr = r * 0.68;
      final cx = c.dx + math.cos(a) * rr;
      final cy = c.dy + math.sin(a) * rr;
      canvas.drawRect(Rect.fromCenter(center: Offset(cx, cy), width: r * 0.1, height: r * 0.06), blockPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _EyeZoneOverlayPainter oldDelegate) {
    return oldDelegate.result != result ||
        oldDelegate.showIris != showIris ||
        oldDelegate.showPupil != showPupil ||
        oldDelegate.showANW != showANW ||
        oldDelegate.showAxis != showAxis ||
        oldDelegate.showChart != showChart ||
        oldDelegate.chartPreset != chartPreset ||
        oldDelegate.irisRadiusFraction != irisRadiusFraction ||
        oldDelegate.pupilRingScale != pupilRingScale ||
        oldDelegate.anwRingScale != anwRingScale ||
        oldDelegate.irisLimbusScale != irisLimbusScale;
  }
}

// ============================================================================
// END OF SECTION 5 - FILE COMPLETE
// ============================================================================











