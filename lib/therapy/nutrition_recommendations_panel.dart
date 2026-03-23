// lib/therapy/nutrition_recommendations_panel.dart
// Collapsible panel shown in AnalysisScreen when Nutrition mode is active.
// Displays 7-color diet foods, key nutrients, and herbs per detected iris zone.

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/therapy/nutrition_engine.dart';

class NutritionRecommendationsPanel extends StatefulWidget {
  final List<ZoneNutritionRecommendation> recommendations;

  const NutritionRecommendationsPanel({super.key, required this.recommendations});

  @override
  State<NutritionRecommendationsPanel> createState() =>
      _NutritionRecommendationsPanelState();
}

class _NutritionRecommendationsPanelState
    extends State<NutritionRecommendationsPanel> {
  final Set<int> _expanded = {0};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (widget.recommendations.isEmpty) return _emptyState(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.restaurant, color: Colors.orange, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.therapyNutritionTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(l10n.therapyNutritionSubtitle,
                        style: const TextStyle(color: Colors.white54, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Zone cards
        ...widget.recommendations.asMap().entries.map((entry) {
          final i = entry.key;
          final rec = entry.value;
          final isOpen = _expanded.contains(i);
          return _NutritionZoneCard(
            rec: rec,
            isExpanded: isOpen,
            onToggle: () => setState(() {
              if (isOpen) _expanded.remove(i);
              else _expanded.add(i);
            }),
          );
        }),

        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white12),
          ),
          child: Text(
            l10n.therapyNutritionDisclaimer,
            style: const TextStyle(color: Colors.white38, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white38, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.therapyNoFindings,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Zone card ─────────────────────────────────────────────────────────────────

class _NutritionZoneCard extends StatelessWidget {
  final ZoneNutritionRecommendation rec;
  final bool isExpanded;
  final VoidCallback onToggle;

  const _NutritionZoneCard(
      {required this.rec, required this.isExpanded, required this.onToggle});

  Color get _findingColor {
    switch (rec.findingType) {
      case 'flattening': return Colors.orange;
      case 'protrusion': return Colors.redAccent;
      case 'anw_shift':  return Colors.purple;
      default:           return Colors.teal;
    }
  }

  String get _findingLabel {
    switch (rec.findingType) {
      case 'flattening': return 'FLAT';
      case 'protrusion': return 'PROT';
      case 'anw_shift':  return 'ANW SHIFT';
      default:           return 'FINDING';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final findingLabel = switch (rec.findingType) {
      'flattening' => l10n.therapyFindingFlat,
      'protrusion' => l10n.therapyFindingProt,
      'anw_shift' => l10n.therapyFindingAnw,
      _ => 'FIND',
    };
    return GestureDetector(
      onTap: onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isExpanded ? _findingColor.withOpacity(0.5) : Colors.white12,
            width: isExpanded ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: _findingColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: _findingColor.withOpacity(0.5)),
                    ),
                    child: Text(findingLabel,
                        style: TextStyle(
                            color: _findingColor,
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: rec.isRightEye
                          ? Colors.blue.withOpacity(0.15)
                          : Colors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(rec.eyeLabel,
                        style: TextStyle(
                            color: rec.isRightEye ? Colors.blue : Colors.green,
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      rec.organInfo.organs.take(3).join(' · '),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text('${rec.severity.toStringAsFixed(1)}%',
                      style: TextStyle(
                          color: _findingColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 6),
                  Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white38,
                      size: 18),
                ],
              ),
            ),

            // Expanded content
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rec.organInfo.displayName,
                        style:
                            const TextStyle(color: Colors.white54, fontSize: 11)),
                    const SizedBox(height: 10),

                    // 7-color food grid
                    if (rec.nutrition.colorFoods.isNotEmpty) ...[
                      Text(l10n.therapyNutritionFoodsByColor,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      _ColorFoodsGrid(colorFoods: rec.nutrition.colorFoods),
                      const SizedBox(height: 10),
                    ],

                    // Key nutrients
                    if (rec.nutrition.nutrients.isNotEmpty) ...[
                      Text(l10n.therapyNutritionKeyNutrients,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: rec.nutrition.nutrients
                            .take(12)
                            .map((n) => _NutrientChip(nutrient: n))
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                    ],

                    // Herbs
                    if (rec.nutrition.herbs.isNotEmpty) ...[
                      Text(l10n.therapyNutritionHerbs,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: rec.nutrition.herbs
                            .take(8)
                            .map((h) => _HerbChip(herb: h))
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                    ],

                    // Organ support notes
                    if (rec.nutrition.organSupportNotes.isNotEmpty) ...[
                      Text(l10n.therapyNutritionNotes,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      ...rec.nutrition.organSupportNotes.take(3).map(
                            (note) => _NoteRow(note: note),
                          ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── 7-color food grid ─────────────────────────────────────────────────────────

class _ColorFoodsGrid extends StatelessWidget {
  final Map<String, List<String>> colorFoods;

  const _ColorFoodsGrid({required this.colorFoods});

  @override
  Widget build(BuildContext context) {
    final presentColors =
        kDietColors.where((c) => colorFoods.containsKey(c)).toList();

    return Column(
      children: presentColors.map((color) {
        final foods = colorFoods[color]!;
        final accentColor = Color(kColorAccents[color] ?? 0xFFFFFFFF);
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Color dot + label
              Container(
                width: 72,
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(color,
                          style: TextStyle(
                              color: accentColor,
                              fontSize: 9,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              // Food chips
              Expanded(
                child: Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: foods
                      .map((f) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: accentColor.withOpacity(0.3)),
                            ),
                            child: Text(f,
                                style: TextStyle(
                                    color: accentColor.withOpacity(0.9),
                                    fontSize: 10)),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── Nutrient chip ─────────────────────────────────────────────────────────────

class _NutrientChip extends StatelessWidget {
  final String nutrient;
  const _NutrientChip({required this.nutrient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.cyan.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.withOpacity(0.25)),
      ),
      child: Text(nutrient,
          style: const TextStyle(color: Colors.cyanAccent, fontSize: 10)),
    );
  }
}

// ── Herb chip ─────────────────────────────────────────────────────────────────

class _HerbChip extends StatelessWidget {
  final String herb;
  const _HerbChip({required this.herb});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.spa, color: Colors.green, size: 9),
          const SizedBox(width: 3),
          Text(herb,
              style:
                  const TextStyle(color: Colors.lightGreenAccent, fontSize: 10)),
        ],
      ),
    );
  }
}

// ── Note row ──────────────────────────────────────────────────────────────────

class _NoteRow extends StatelessWidget {
  final String note;
  const _NoteRow({required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(Icons.circle, color: Colors.orange, size: 5),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(note,
                style:
                    const TextStyle(color: Colors.white60, fontSize: 10.5)),
          ),
        ],
      ),
    );
  }
}
