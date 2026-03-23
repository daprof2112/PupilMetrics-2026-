// lib/therapy/herbal_recommendations_panel.dart
// Collapsible panel shown in AnalysisScreen when Herbal therapy mode is active.

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/therapy/herbal_engine.dart';

class HerbalRecommendationsPanel extends StatefulWidget {
  final List<ZoneRecommendation> recommendations;

  const HerbalRecommendationsPanel({super.key, required this.recommendations});

  @override
  State<HerbalRecommendationsPanel> createState() => _HerbalRecommendationsPanelState();
}

class _HerbalRecommendationsPanelState extends State<HerbalRecommendationsPanel> {
  // Which zone cards are expanded
  final Set<int> _expanded = {0}; // first one open by default

  @override
  Widget build(BuildContext context) {
    if (widget.recommendations.isEmpty) {
      return _emptyState();
    }

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
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.local_florist, color: Colors.green, size: 20),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Herbal Recommendations',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Based on iris zone findings — sorted by evidence weight',
                        style: TextStyle(color: Colors.white54, fontSize: 11)),
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
          return _ZoneCard(
            rec: rec,
            isExpanded: isOpen,
            onToggle: () => setState(() {
              if (isOpen) _expanded.remove(i);
              else _expanded.add(i);
            }),
          );
        }),

        const SizedBox(height: 8),
        // Disclaimer note
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white12),
          ),
          child: const Text(
            'Herbal suggestions are cross-referenced from multiple naturopathic '
            'reference works and are provided for educational purposes. '
            'Consult a qualified healthcare practitioner before use.',
            style: TextStyle(color: Colors.white38, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _emptyState() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
        ),
        child: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white38, size: 18),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'No significant iris zone findings detected to generate herbal recommendations.',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),
          ],
        ),
      );
}

// ── Zone card ─────────────────────────────────────────────────────────────────

class _ZoneCard extends StatelessWidget {
  final ZoneRecommendation rec;
  final bool isExpanded;
  final VoidCallback onToggle;

  const _ZoneCard({required this.rec, required this.isExpanded, required this.onToggle});

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
            // Header row
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Finding badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: _findingColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: _findingColor.withOpacity(0.5)),
                    ),
                    child: Text(_findingLabel,
                        style: TextStyle(color: _findingColor, fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  // Eye badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: rec.isRightEye ? Colors.blue.withOpacity(0.15) : Colors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(rec.eyeLabel,
                        style: TextStyle(
                            color: rec.isRightEye ? Colors.blue : Colors.green,
                            fontSize: 9, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      rec.organInfo.organs.take(3).join(' · '),
                      style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text('${rec.severity.toStringAsFixed(1)}%',
                      style: TextStyle(color: _findingColor, fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 6),
                  Icon(isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white38, size: 18),
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
                    // Zone name
                    Text(rec.organInfo.displayName,
                        style: const TextStyle(color: Colors.white54, fontSize: 11)),
                    const SizedBox(height: 10),

                    // Condition + herb list
                    ...rec.conditions.map((cond) => _ConditionBlock(cond: cond)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Condition block ───────────────────────────────────────────────────────────

class _ConditionBlock extends StatelessWidget {
  final ConditionMatch cond;
  const _ConditionBlock({required this.cond});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cond.condition,
              style: const TextStyle(color: Colors.tealAccent, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: cond.herbs.map((h) => _HerbChip(herb: h)).toList(),
          ),
        ],
      ),
    );
  }
}

// ── Herb chip ─────────────────────────────────────────────────────────────────

class _HerbChip extends StatelessWidget {
  final HerbEntry herb;
  const _HerbChip({required this.herb});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: herb.refs.isEmpty ? null : () => _showRefs(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(herb.herb,
                style: const TextStyle(color: Colors.white, fontSize: 11)),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('×${herb.count}',
                  style: const TextStyle(color: Colors.greenAccent, fontSize: 9, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _showRefs(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        title: Text(herb.herb,
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        content: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${herb.count} reference${herb.count != 1 ? 's' : ''}',
                    style: const TextStyle(color: Colors.tealAccent, fontSize: 12)),
                const SizedBox(height: 10),
                ...herb.refs.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${e.key + 1}. ',
                              style: const TextStyle(color: Colors.white54, fontSize: 11)),
                          Expanded(
                            child: Text(e.value,
                                style: const TextStyle(color: Colors.white70, fontSize: 11)),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.tealAccent)),
          ),
        ],
      ),
    );
  }
}
