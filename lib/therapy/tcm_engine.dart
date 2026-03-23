// lib/therapy/tcm_engine.dart
// Maps iris zone findings to TCM meridian/organ data.

import 'package:ai_eye_capture/therapy/tcm_data.dart';
import 'package:ai_eye_capture/therapy/iris_zone_map.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

// ── Recommendation model ──────────────────────────────────────────────────────

class TcmRecommendation {
  final String zoneName;
  final bool isRightEye;
  final IrisZoneOrgan organInfo;
  final TcmZoneData tcmData;
  final String findingType;
  final double severity;

  const TcmRecommendation({
    required this.zoneName,
    required this.isRightEye,
    required this.organInfo,
    required this.tcmData,
    required this.findingType,
    required this.severity,
  });

  String get eyeLabel => isRightEye ? 'OD' : 'OS';
}

// ── Engine ───────────────────────────────────────────────────────────────────

class TcmEngine {
  static bool get isLoaded => true; // data is compiled-in

  static TcmZoneData? getData(String zoneName, bool isRightEye) {
    final key = tcmZoneKey(zoneName, isRightEye);
    return kTcmZoneMap[key];
  }

  static List<TcmRecommendation> recommend({
    required EyeAnalysisResult? rightResult,
    required EyeAnalysisResult? leftResult,
    int maxZones = 5,
  }) {
    final List<_Scored> scored = [];

    void processResult(EyeAnalysisResult result, bool isRightEye) {
      for (final flat in result.flattenings) {
        final tcm = getData(flat.zone, isRightEye);
        final organ = IrisZoneMap.get(flat.zone, isRightEye);
        if (tcm == null || organ == null) continue;
        scored.add(_Scored(
          rec: TcmRecommendation(
            zoneName: flat.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            tcmData: tcm,
            findingType: 'flattening',
            severity: flat.percentage,
          ),
          score: flat.percentage * 1.2,
        ));
      }

      for (final prot in result.protrusions) {
        final tcm = getData(prot.zone, isRightEye);
        final organ = IrisZoneMap.get(prot.zone, isRightEye);
        if (tcm == null || organ == null) continue;
        scored.add(_Scored(
          rec: TcmRecommendation(
            zoneName: prot.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            tcmData: tcm,
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
          final tcm = getData(shiftZone, isRightEye);
          final organ = IrisZoneMap.get(shiftZone, isRightEye);
          if (tcm != null && organ != null) {
            scored.add(_Scored(
              rec: TcmRecommendation(
                zoneName: shiftZone,
                isRightEye: isRightEye,
                organInfo: organ,
                tcmData: tcm,
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

    final seen = <String>{};
    final List<TcmRecommendation> out = [];
    for (final s in scored) {
      // Use organ name as dedup key (both eyes can show different TCM organs)
      final key = '${s.rec.tcmData.primaryOrgan}_${s.rec.zoneName}';
      if (seen.contains(key)) continue;
      seen.add(key);
      out.add(s.rec);
      if (out.length >= maxZones) break;
    }
    return out;
  }

  static String? _clockToZone(String clockPos, bool isRightEye) {
    final match = RegExp(r'(\d+):').firstMatch(clockPos);
    if (match == null) return null;
    final hour = int.tryParse(match.group(1)!) ?? -1;
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
  final TcmRecommendation rec;
  final double score;
  const _Scored({required this.rec, required this.score});
}
