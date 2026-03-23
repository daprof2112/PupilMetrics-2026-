// lib/therapy/chiropractic_engine.dart
// Maps iris zone findings (flattenings, protrusions, ANW shifts) to
// chiropractic spinal segment data using the pupillary-border zone convention.

import 'package:ai_eye_capture/therapy/chiropractic_data.dart';
import 'package:ai_eye_capture/therapy/iris_zone_map.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

// ── Data models ──────────────────────────────────────────────────────────────

class ChiropracticRecommendation {
  final String zoneName;
  final bool isRightEye;
  final IrisZoneOrgan organInfo;
  final SpinalSegmentData spinalData;
  final String findingType; // 'flattening' | 'protrusion' | 'anw_shift'
  final double severity;

  const ChiropracticRecommendation({
    required this.zoneName,
    required this.isRightEye,
    required this.organInfo,
    required this.spinalData,
    required this.findingType,
    required this.severity,
  });

  String get eyeLabel => isRightEye ? 'OD' : 'OS';
}

// ── Engine ───────────────────────────────────────────────────────────────────

class ChiropracticEngine {
  /// No async load needed — data is compiled in, not from an asset file.
  static bool get isLoaded => true;

  /// Get spinal data for a given iris zone name.
  /// Both eyes map to the same spinal column.
  static SpinalSegmentData? getSpinalData(String zoneName) =>
      kChiropracticZoneMap[zoneName];

  /// Generate chiropractic recommendations from eye analysis results.
  static List<ChiropracticRecommendation> recommend({
    required EyeAnalysisResult? rightResult,
    required EyeAnalysisResult? leftResult,
    int maxZones = 5,
  }) {
    final List<_Scored> scored = [];

    void processResult(EyeAnalysisResult result, bool isRightEye) {
      for (final flat in result.flattenings) {
        final spinal = getSpinalData(flat.zone);
        final organ = IrisZoneMap.get(flat.zone, isRightEye);
        if (spinal == null || organ == null) continue;
        scored.add(_Scored(
          rec: ChiropracticRecommendation(
            zoneName: flat.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            spinalData: spinal,
            findingType: 'flattening',
            severity: flat.percentage,
          ),
          score: flat.percentage * 1.2,
        ));
      }

      for (final prot in result.protrusions) {
        final spinal = getSpinalData(prot.zone);
        final organ = IrisZoneMap.get(prot.zone, isRightEye);
        if (spinal == null || organ == null) continue;
        scored.add(_Scored(
          rec: ChiropracticRecommendation(
            zoneName: prot.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            spinalData: spinal,
            findingType: 'protrusion',
            severity: prot.percentage,
          ),
          score: prot.percentage,
        ));
      }

      final anw = result.anwAssessment;
      if (anw?.primaryShift != null) {
        final shift = anw!.primaryShift!;
        final shiftZone = _clockToZone(shift.clockPosition, isRightEye);
        if (shiftZone != null) {
          final spinal = getSpinalData(shiftZone);
          final organ = IrisZoneMap.get(shiftZone, isRightEye);
          if (spinal != null && organ != null) {
            scored.add(_Scored(
              rec: ChiropracticRecommendation(
                zoneName: shiftZone,
                isRightEye: isRightEye,
                organInfo: organ,
                spinalData: spinal,
                findingType: 'anw_shift',
                severity: shift.deviationPercent,
              ),
              score: shift.deviationPercent * 0.8,
            ));
          }
        }
      }
    }

    if (rightResult != null) processResult(rightResult, true);
    if (leftResult != null) processResult(leftResult, false);

    scored.sort((a, b) => b.score.compareTo(a.score));

    // Deduplicate by zone (not eye — spinal column is shared)
    final seen = <String>{};
    final List<ChiropracticRecommendation> out = [];
    for (final s in scored) {
      // Deduplicate on zone name alone (both eyes → same spinal level)
      if (seen.contains(s.rec.zoneName)) continue;
      seen.add(s.rec.zoneName);
      out.add(s.rec);
      if (out.length >= maxZones) break;
    }
    return out;
  }

  static String? _clockToZone(String clockPos, bool isRightEye) {
    final match = RegExp(r'(\d+):').firstMatch(clockPos);
    if (match == null) return null;
    final hour = int.tryParse(match.group(1)!) ?? -1;
    if (hour < 0) return null;

    if (isRightEye) {
      if (hour == 12 || hour == 11 || hour == 1) return 'upper-central';
      if (hour == 2) return 'upper-nasal';
      if (hour == 3) return 'middle-nasal';
      if (hour == 4 || hour == 5) return 'lower-nasal';
      if (hour == 6) return 'lower-basal';
      if (hour == 7 || hour == 8) return 'lower-temporal';
      if (hour == 9) return 'middle-temporal';
      if (hour == 10) return 'upper-temporal';
    } else {
      if (hour == 12 || hour == 11 || hour == 1) return 'upper-central';
      if (hour == 2) return 'upper-temporal';
      if (hour == 3) return 'middle-temporal';
      if (hour == 4 || hour == 5) return 'lower-temporal';
      if (hour == 6) return 'lower-basal';
      if (hour == 7 || hour == 8) return 'lower-nasal';
      if (hour == 9) return 'middle-nasal';
      if (hour == 10) return 'upper-nasal';
    }
    return null;
  }
}

class _Scored {
  final ChiropracticRecommendation rec;
  final double score;
  const _Scored({required this.rec, required this.score});
}
