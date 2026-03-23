// lib/therapy/nutrition_engine.dart
// Loads nutrition_database.json (from 7 Color Diet manuscript) and returns
// nutrition recommendations based on iris zone findings.

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ai_eye_capture/therapy/iris_zone_map.dart';
import 'package:ai_eye_capture/utils/pupil_analyzer_fixed.dart';

// ── Data models ──────────────────────────────────────────────────────────────

/// Merged nutrition data for a zone (may aggregate multiple organs).
class ZoneNutrition {
  final List<String> nutrients;
  final Map<String, List<String>> colorFoods; // color → food names
  final List<String> herbs;
  final List<String> organSupportNotes;
  final List<String> matchedOrgans; // which DB organs contributed

  const ZoneNutrition({
    required this.nutrients,
    required this.colorFoods,
    required this.herbs,
    required this.organSupportNotes,
    required this.matchedOrgans,
  });
}

/// One nutrition recommendation card — one per significant iris zone finding.
class ZoneNutritionRecommendation {
  final String zoneName;
  final bool isRightEye;
  final IrisZoneOrgan organInfo;
  final String findingType; // 'flattening' | 'protrusion' | 'anw_shift'
  final double severity;
  final ZoneNutrition nutrition;

  const ZoneNutritionRecommendation({
    required this.zoneName,
    required this.isRightEye,
    required this.organInfo,
    required this.findingType,
    required this.severity,
    required this.nutrition,
  });

  String get eyeLabel => isRightEye ? 'OD' : 'OS';
}

// ── Color order (7-color diet) ────────────────────────────────────────────────

const List<String> kDietColors = [
  'Red', 'Orange', 'Yellow', 'Green', 'Blue/Purple', 'White', 'Brown',
];

// Accent colors for each diet color
const Map<String, int> kColorAccents = {
  'Red':        0xFFEF5350,
  'Orange':     0xFFFF7043,
  'Yellow':     0xFFFFD740,
  'Green':      0xFF66BB6A,
  'Blue/Purple':0xFF7E57C2,
  'White':      0xFFEEEEEE,
  'Brown':      0xFF8D6E63,
};

// ── Engine ───────────────────────────────────────────────────────────────────

class NutritionEngine {
  // DB structure: { "Brain": { "nutrients": [...], "colorFoods": {...}, "herbs": [...], "organSupportNotes": [...] }, ... }
  static Map<String, Map<String, dynamic>>? _db;

  /// Load the nutrition database from assets (cached after first load).
  static Future<void> load() async {
    if (_db != null) return;
    final raw = await rootBundle.loadString('assets/therapy/nutrition_database.json');
    final Map<String, dynamic> json = jsonDecode(raw);
    _db = json.map((k, v) => MapEntry(k, v as Map<String, dynamic>));
  }

  static bool get isLoaded => _db != null;

  /// Look up organs by name (partial, case-insensitive match against DB keys).
  /// Returns merged ZoneNutrition combining all matched organs.
  static ZoneNutrition? lookup(List<String> organNames) {
    if (_db == null) return null;

    final List<String> matched = [];
    final Set<String> nutrients = {};
    final Map<String, List<String>> colorFoods = {};
    final Set<String> herbs = {};
    final List<String> notes = [];

    for (final organ in organNames) {
      // Normalize: strip "(R)", "(L)" suffixes for lookup
      final base = organ
          .replaceAll(RegExp(r'\s*\([LR]\)'), '')
          .replaceAll(RegExp(r'\s*\(.*\)'), '')
          .trim();

      // Find best-matching DB key
      String? dbKey;
      for (final key in _db!.keys) {
        if (key.toLowerCase() == base.toLowerCase() ||
            key.toLowerCase().contains(base.toLowerCase()) ||
            base.toLowerCase().contains(key.toLowerCase())) {
          dbKey = key;
          break;
        }
      }
      if (dbKey == null) continue;
      matched.add(dbKey);

      final entry = _db![dbKey]!;

      // Merge nutrients
      final nut = entry['nutrients'] as List<dynamic>? ?? [];
      nutrients.addAll(nut.cast<String>());

      // Merge color foods (deduplicate per color)
      final cf = entry['colorFoods'] as Map<String, dynamic>? ?? {};
      for (final color in kDietColors) {
        final foods = (cf[color] as List<dynamic>?)?.cast<String>() ?? [];
        if (foods.isEmpty) continue;
        colorFoods.putIfAbsent(color, () => []);
        for (final food in foods) {
          // Skip nutrient names accidentally parsed as foods
          if (_isNutrientName(food)) continue;
          if (!colorFoods[color]!.contains(food)) {
            colorFoods[color]!.add(food);
          }
        }
        // Cap at 6 foods per color
        if (colorFoods[color]!.length > 6) {
          colorFoods[color] = colorFoods[color]!.sublist(0, 6);
        }
      }

      // Merge herbs
      final h = entry['herbs'] as List<dynamic>? ?? [];
      herbs.addAll(h.cast<String>());

      // Merge organ support notes (max 3 per organ)
      final n = entry['organSupportNotes'] as List<dynamic>? ?? [];
      for (final note in n.take(3)) {
        final s = note as String;
        if (!notes.contains(s)) notes.add(s);
      }
    }

    if (matched.isEmpty) return null;

    return ZoneNutrition(
      nutrients: nutrients.toList()..sort(),
      colorFoods: colorFoods,
      herbs: herbs.toList()..sort(),
      organSupportNotes: notes.take(6).toList(),
      matchedOrgans: matched,
    );
  }

  /// Some pdfplumber lines extract nutrient keywords as food names — filter them.
  static bool _isNutrientName(String s) {
    const nutrientWords = [
      'iron', 'protein', 'fiber', 'omega', 'calcium', 'potassium',
      'magnesium', 'phosphorus', 'vitamin', 'zinc', 'iodine', 'selenium',
      'folate', 'beta', 'antioxidant', 'carotene', 'choline', 'collagen',
      'silicon', 'manganese', 'sulfur', 'lecithin', 'coenzyme', 'fatty',
      'amino', 'flavonoid', 'polyphenol', 'carotenoid', 'mineral',
    ];
    final lower = s.toLowerCase();
    return nutrientWords.any((w) => lower.startsWith(w));
  }

  /// Generate nutrition recommendations from eye analysis results.
  static List<ZoneNutritionRecommendation> recommend({
    required EyeAnalysisResult? rightResult,
    required EyeAnalysisResult? leftResult,
    int maxZones = 6,
  }) {
    if (_db == null) return [];

    final List<_ScoredNutrition> scored = [];

    void processResult(EyeAnalysisResult result, bool isRightEye) {
      for (final flat in result.flattenings) {
        final organ = IrisZoneMap.get(flat.zone, isRightEye);
        if (organ == null) continue;
        final nutrition = lookup(organ.organs);
        if (nutrition == null) continue;
        scored.add(_ScoredNutrition(
          rec: ZoneNutritionRecommendation(
            zoneName: flat.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            findingType: 'flattening',
            severity: flat.percentage,
            nutrition: nutrition,
          ),
          score: flat.percentage * 1.2,
        ));
      }

      for (final prot in result.protrusions) {
        final organ = IrisZoneMap.get(prot.zone, isRightEye);
        if (organ == null) continue;
        final nutrition = lookup(organ.organs);
        if (nutrition == null) continue;
        scored.add(_ScoredNutrition(
          rec: ZoneNutritionRecommendation(
            zoneName: prot.zone,
            isRightEye: isRightEye,
            organInfo: organ,
            findingType: 'protrusion',
            severity: prot.percentage,
            nutrition: nutrition,
          ),
          score: prot.percentage,
        ));
      }

      final anw = result.anwAssessment;
      if (anw?.primaryShift != null) {
        final shift = anw!.primaryShift!;
        final shiftZone = _clockToZone(shift.clockPosition, isRightEye);
        if (shiftZone != null) {
          final organ = IrisZoneMap.get(shiftZone, isRightEye);
          if (organ != null) {
            final nutrition = lookup(organ.organs);
            if (nutrition != null) {
              scored.add(_ScoredNutrition(
                rec: ZoneNutritionRecommendation(
                  zoneName: shiftZone,
                  isRightEye: isRightEye,
                  organInfo: organ,
                  findingType: 'anw_shift',
                  severity: shift.deviationPercent,
                  nutrition: nutrition,
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

    scored.sort((a, b) => b.score.compareTo(a.score));
    final seen = <String>{};
    final List<ZoneNutritionRecommendation> out = [];
    for (final s in scored) {
      final key = '${s.rec.isRightEye ? 'R' : 'L'}_${s.rec.zoneName}';
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

class _ScoredNutrition {
  final ZoneNutritionRecommendation rec;
  final double score;
  const _ScoredNutrition({required this.rec, required this.score});
}
