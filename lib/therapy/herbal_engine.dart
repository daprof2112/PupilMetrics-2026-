// lib/therapy/herbal_engine.dart
// Loads herbal_database.json and returns ranked herb recommendations
// based on iris zone findings from the analysis pipeline.

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ai_eye_capture/therapy/iris_zone_map.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

// ── Data models ──────────────────────────────────────────────────────────────

class HerbEntry {
  final String herb;
  final int count; // number of source references (evidence weight)
  final List<String> refs;

  const HerbEntry({required this.herb, required this.count, required this.refs});

  factory HerbEntry.fromJson(Map<String, dynamic> j) => HerbEntry(
        herb: j['herb'] as String,
        count: j['count'] as int,
        refs: List<String>.from(j['refs'] as List),
      );
}

class ConditionMatch {
  final String condition; // e.g. "ARTERIOSCLEROSIS"
  final List<HerbEntry> herbs;

  const ConditionMatch({required this.condition, required this.herbs});
}

class ZoneRecommendation {
  final String zoneName;
  final bool isRightEye;
  final IrisZoneOrgan organInfo;
  final String findingType; // 'flattening' | 'protrusion' | 'constriction' | 'anw_shift'
  final double severity; // percentage deviation
  final List<ConditionMatch> conditions; // top matched conditions from DB

  const ZoneRecommendation({
    required this.zoneName,
    required this.isRightEye,
    required this.organInfo,
    required this.findingType,
    required this.severity,
    required this.conditions,
  });

  String get eyeLabel => isRightEye ? 'OD' : 'OS';
}

// ── Engine ───────────────────────────────────────────────────────────────────

class HerbalEngine {
  static Map<String, List<HerbEntry>>? _db;

  /// Load the herbal database from assets (call once; cached afterwards).
  static Future<void> load() async {
    if (_db != null) return;
    final raw = await rootBundle.loadString('assets/therapy/herbal_database.json');
    final Map<String, dynamic> json = jsonDecode(raw);
    _db = json.map((condition, herbs) => MapEntry(
          condition,
          (herbs as List).map((h) => HerbEntry.fromJson(h)).toList(),
        ));
  }

  /// Returns true if the database is loaded.
  static bool get isLoaded => _db != null;

  /// Look up conditions matching any of the given keywords (prefix match, case-insensitive).
  /// Returns list of (condition, herbs) sorted by best herb evidence count, limited to [maxConditions].
  static List<ConditionMatch> lookup(
    List<String> keywords, {
    int maxConditions = 5,
    int maxHerbsPerCondition = 6,
  }) {
    if (_db == null) return [];

    final List<ConditionMatch> results = [];
    final kwUpper = keywords.map((k) => k.toUpperCase()).toList();

    for (final entry in _db!.entries) {
      final condUpper = entry.key.toUpperCase();
      final matched = kwUpper.any((kw) => condUpper.contains(kw));
      if (!matched) continue;
      if (entry.value.isEmpty) continue;

      results.add(ConditionMatch(
        condition: entry.key,
        herbs: entry.value.take(maxHerbsPerCondition).toList(),
      ));
    }

    // Sort: conditions whose top herb has highest reference count come first
    results.sort((a, b) {
      final aMax = a.herbs.isNotEmpty ? a.herbs.first.count : 0;
      final bMax = b.herbs.isNotEmpty ? b.herbs.first.count : 0;
      return bMax.compareTo(aMax);
    });

    return results.take(maxConditions).toList();
  }

  /// Generate recommendations from a full eye analysis result.
  /// Looks at flattenings, protrusions, and ANW shifts.
  static List<ZoneRecommendation> recommend({
    required EyeAnalysisResult? rightResult,
    required EyeAnalysisResult? leftResult,
    int maxZones = 6,
  }) {
    if (_db == null) return [];

    final List<_ScoredZone> scored = [];

    void processResult(EyeAnalysisResult result, bool isRightEye) {
      // ── Flattenings ────────────────────────────────────────────────────
      for (final flat in result.flattenings) {
        final organ = IrisZoneMap.get(flat.zone, isRightEye);
        if (organ == null) continue;
        final conditions = lookup(organ.conditionKeywords, maxConditions: 4);
        if (conditions.isEmpty) continue;
        scored.add(_ScoredZone(
          zone: ZoneRecommendation(
            zoneName: flat.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            findingType: 'flattening',
            severity: flat.percentage,
            conditions: conditions,
          ),
          score: flat.percentage * 1.2, // flattenings weighted higher
        ));
      }

      // ── Protrusions ────────────────────────────────────────────────────
      for (final prot in result.protrusions) {
        final organ = IrisZoneMap.get(prot.zone, isRightEye);
        if (organ == null) continue;
        final conditions = lookup(organ.conditionKeywords, maxConditions: 4);
        if (conditions.isEmpty) continue;
        scored.add(_ScoredZone(
          zone: ZoneRecommendation(
            zoneName: prot.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            findingType: 'protrusion',
            severity: prot.percentage,
            conditions: conditions,
          ),
          score: prot.percentage,
        ));
      }

      // ── ANW Shift ──────────────────────────────────────────────────────
      final anw = result.anwAssessment;
      if (anw?.primaryShift != null) {
        final shift = anw!.primaryShift!;
        // Convert clock position string to zone name
        final shiftZone = _clockToZone(shift.clockPosition, isRightEye);
        if (shiftZone != null) {
          final organ = IrisZoneMap.get(shiftZone, isRightEye);
          if (organ != null) {
            final conditions = lookup(organ.conditionKeywords, maxConditions: 3);
            if (conditions.isNotEmpty) {
              scored.add(_ScoredZone(
                zone: ZoneRecommendation(
                  zoneName: shiftZone,
                  isRightEye: isRightEye,
                  organInfo: organ,
                  findingType: 'anw_shift',
                  severity: shift.deviationPercent,
                  conditions: conditions,
                ),
                score: shift.deviationPercent * 0.8,
              ));
            }
          }
        }
      }
    }

    if (rightResult != null) processResult(rightResult, true);
    if (leftResult != null) processResult(leftResult, false);

    // Sort by score descending, deduplicate zone+eye combos
    scored.sort((a, b) => b.score.compareTo(a.score));
    final seen = <String>{};
    final List<ZoneRecommendation> out = [];
    for (final s in scored) {
      final key = '${s.zone.isRightEye ? 'R' : 'L'}_${s.zone.zoneName}';
      if (seen.contains(key)) continue;
      seen.add(key);
      out.add(s.zone);
      if (out.length >= maxZones) break;
    }
    return out;
  }

  /// Rough clock-position string → zone name (e.g. "3:30 - 4:30" → "lower-nasal" for right eye)
  static String? _clockToZone(String clockPos, bool isRightEye) {
    // Extract first hour from strings like "2:30 - 3:30"
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

class _ScoredZone {
  final ZoneRecommendation zone;
  final double score;
  const _ScoredZone({required this.zone, required this.score});
}
