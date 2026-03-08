// =============================================================================
// POLAR ZONE HIT-TESTING v5.3.2
// =============================================================================

import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PolarZoneData {
  final int angleBins;
  final int radiusBins;
  final double collaretteNorm;
  final double chartPupilFrac;
  final double chartCollaretteFrac;
  final Uint8List grid;
  final Map<String, String> idToName;
  final Map<String, String> idToSys;

  PolarZoneData({
    required this.angleBins,
    required this.radiusBins,
    required this.collaretteNorm,
    required this.chartPupilFrac,
    required this.chartCollaretteFrac,
    required this.grid,
    required this.idToName,
    required this.idToSys,
  });

  static Future<PolarZoneData?> load(String chartPreset, bool isRightEye) async {
    final side = isRightEye ? 'od' : 'os';
    final prefix = chartPreset.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_');
    final assetPath = 'assets/charts/${prefix}_${side}_polar.json';

    try {
      final jsonStr = await rootBundle.loadString(assetPath);
      final data = json.decode(jsonStr) as Map<String, dynamic>;
      final gridB64 = data['grid'] as String;
      final gridBytes = base64.decode(gridB64);
      final anatomy = data['chartAnatomy'] as Map<String, dynamic>;
      final aBins = data['angleBins'] as int;
      final rBins = data['radiusBins'] as int;

      if (gridBytes.length != aBins * rBins) return null;

      return PolarZoneData(
        angleBins: aBins, radiusBins: rBins,
        collaretteNorm: (data['collaretteNorm'] as num).toDouble(),
        chartPupilFrac: (anatomy['pupilFrac'] as num).toDouble(),
        chartCollaretteFrac: (anatomy['collaretteFrac'] as num).toDouble(),
        grid: Uint8List.fromList(gridBytes),
        idToName: (data['idToName'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v.toString())),
        idToSys: (data['idToSys'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v.toString())),
      );
    } catch (e) {
      debugPrint('POLAR: Failed to load $assetPath — $e');
      return null;
    }
  }

  Map<String, String> hitTest({
    required Offset tapPos,
    required Size containerSize,
    required double pupilIrisRatio,
    double anwRingScale = 1.0,
    double irisRadiusFraction = 0.48,
    double scaleAdjust = 1.0,
  }) {
    final S = containerSize.width;
    final H = containerSize.height;
    const double pngIrisRadius = 200.0;
    final rawBox = S * irisRadiusFraction * scaleAdjust * (512.0 / pngIrisRadius);
    final chartBoxSize = rawBox.clamp(0.0, S);
    final dx = tapPos.dx - S / 2.0;
    final dy = tapPos.dy - H / 2.0;
    final irisRadiusPx = chartBoxSize * pngIrisRadius / 512.0;
    if (irisRadiusPx < 1) return {};
    final tapR = math.sqrt(dx * dx + dy * dy);
    final rFrac = tapR / irisRadiusPx;
    if (rFrac > 1.05) return {};
    final realPupilFrac = (pupilIrisRatio / 100.0).clamp(0.05, 0.55);
    final realCollaretteFrac = (realPupilFrac + 0.15 * anwRingScale).clamp(realPupilFrac + 0.05, 0.70);
    if (rFrac < realPupilFrac) return {'name': 'Pupil', 'system': 'Autonomic Center'};

    double normR;
    if (rFrac <= realCollaretteFrac) {
      normR = ((rFrac - realPupilFrac) / (realCollaretteFrac - realPupilFrac)) * collaretteNorm;
    } else {
      normR = collaretteNorm + ((rFrac - realCollaretteFrac) / (1.0 - realCollaretteFrac)) * (1.0 - collaretteNorm);
    }
    normR = normR.clamp(0.0, 1.0);

    double angle = math.atan2(dy, dx) * 180.0 / math.pi;
    if (angle < 0) angle += 360.0;

    final ai = angle.floor() % angleBins;
    final ri = (normR * (radiusBins - 1)).round().clamp(0, radiusBins - 1);
    final zoneId = grid[ai * radiusBins + ri];
    if (zoneId == 0 || zoneId == 255) return {};

    final name = idToName[zoneId.toString()] ?? '';
    final sys = idToSys[zoneId.toString()] ?? '';
    if (name.isEmpty) return {};
    return {'name': name, 'system': sys};
  }
}
