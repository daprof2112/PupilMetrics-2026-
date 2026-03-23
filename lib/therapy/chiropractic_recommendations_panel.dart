// lib/therapy/chiropractic_recommendations_panel.dart
// Expandable panel shown in AnalysisScreen when Chiropractic mode is active.
// Displays spinal segment data, subluxation symptoms, exercises, and adjusting approach.

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/therapy/chiropractic_engine.dart';
import 'package:ai_eye_capture/therapy/chiropractic_data.dart';

class ChiropracticRecommendationsPanel extends StatefulWidget {
  final List<ChiropracticRecommendation> recommendations;

  const ChiropracticRecommendationsPanel({super.key, required this.recommendations});

  @override
  State<ChiropracticRecommendationsPanel> createState() =>
      _ChiropracticRecommendationsPanelState();
}

class _ChiropracticRecommendationsPanelState
    extends State<ChiropracticRecommendationsPanel> {
  final Set<int> _expanded = {0};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (widget.recommendations.isEmpty) return _emptyState(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.accessibility_new,
                    color: Colors.deepPurpleAccent, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.therapyChiroTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(l10n.therapyChiroSubtitle,
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
          return _ChiroCard(
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
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white12),
          ),
          child: Text(
            l10n.therapyChiroDisclaimer,
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
        color: Colors.white.withValues(alpha: 0.04),
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

// ── Card ──────────────────────────────────────────────────────────────────────

class _ChiroCard extends StatelessWidget {
  final ChiropracticRecommendation rec;
  final bool isExpanded;
  final VoidCallback onToggle;

  const _ChiroCard(
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
      case 'anw_shift':  return 'ANW';
      default:           return 'FIND';
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
            color: isExpanded
                ? Colors.deepPurpleAccent.withValues(alpha: 0.5)
                : Colors.white12,
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
                  _badge(findingLabel, _findingColor),
                  const SizedBox(width: 6),
                  _badge(rec.eyeLabel,
                      rec.isRightEye ? Colors.blue : Colors.green),
                  const SizedBox(width: 8),
                  // Spine icon
                  const Icon(Icons.linear_scale,
                      color: Colors.deepPurpleAccent, size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      rec.spinalData.segmentLabel,
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
                    // Iris zone context
                    Text(rec.organInfo.displayName,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 11)),
                    const SizedBox(height: 12),

                    // Vertebrae row
                    _SectionLabel(icon: Icons.view_week, label: l10n.therapyChiroVertebrae),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: rec.spinalData.vertebrae
                          .map((v) => _VertebralChip(label: v))
                          .toList(),
                    ),
                    const SizedBox(height: 10),

                    // Nerve roots
                    _SectionLabel(icon: Icons.electrical_services, label: l10n.therapyChiroNerveRoots),
                    const SizedBox(height: 4),
                    ...rec.spinalData.nerveRoots
                        .map((n) => _BulletRow(text: n, color: Colors.purpleAccent)),
                    const SizedBox(height: 10),

                    // Innervated structures
                    _SectionLabel(icon: Icons.account_tree, label: l10n.therapyChiroInnervated),
                    const SizedBox(height: 4),
                    ...rec.spinalData.innervatedStructures
                        .map((s) => _BulletRow(text: s, color: Colors.blueAccent)),
                    const SizedBox(height: 10),

                    // Subluxation symptoms
                    _SectionLabel(icon: Icons.warning_amber, label: l10n.therapyChiroSubluxation),
                    const SizedBox(height: 4),
                    ...rec.spinalData.subluxationSymptoms
                        .map((s) => _BulletRow(text: s, color: Colors.orangeAccent)),
                    const SizedBox(height: 10),

                    // Affected muscles
                    _SectionLabel(icon: Icons.fitness_center, label: l10n.therapyChiroMuscles),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: rec.spinalData.affectedMuscles
                          .map((m) => _MuscleChip(label: m))
                          .toList(),
                    ),
                    const SizedBox(height: 10),

                    // Adjusting approach
                    _SectionLabel(icon: Icons.touch_app, label: l10n.therapyChiroAdjusting),
                    const SizedBox(height: 4),
                    ...rec.spinalData.adjustingApproach
                        .map((a) => _BulletRow(text: a, color: Colors.tealAccent)),
                    const SizedBox(height: 10),

                    // Exercises
                    _SectionLabel(icon: Icons.self_improvement, label: l10n.therapyChiroExercises),
                    const SizedBox(height: 4),
                    ...rec.spinalData.exercises
                        .map((e) => _ExerciseRow(text: e)),
                    const SizedBox(height: 10),

                    // Postural note
                    _PosturalNote(note: rec.spinalData.posturalNote),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child: Text(label,
            style: TextStyle(
                color: color, fontSize: 9, fontWeight: FontWeight.bold)),
      );
}

// ── Sub-widgets ───────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SectionLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(icon, color: Colors.deepPurpleAccent, size: 13),
          const SizedBox(width: 5),
          Text(label,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
        ],
      );
}

class _VertebralChip extends StatelessWidget {
  final String label;
  const _VertebralChip({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.deepPurple.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.deepPurpleAccent.withValues(alpha: 0.4)),
        ),
        child: Text(label,
            style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 11,
                fontWeight: FontWeight.bold)),
      );
}

class _MuscleChip extends StatelessWidget {
  final String label;
  const _MuscleChip({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.indigo.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.indigoAccent.withValues(alpha: 0.3)),
        ),
        child: Text(label,
            style: const TextStyle(color: Colors.indigoAccent, fontSize: 10)),
      );
}

class _BulletRow extends StatelessWidget {
  final String text;
  final Color color;
  const _BulletRow({required this.text, required this.color});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(Icons.circle, color: color, size: 5),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(text,
                  style: const TextStyle(color: Colors.white60, fontSize: 10.5)),
            ),
          ],
        ),
      );
}

class _ExerciseRow extends StatelessWidget {
  final String text;
  const _ExerciseRow({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(Icons.chevron_right, color: Colors.greenAccent, size: 14),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Text(text,
                  style: const TextStyle(color: Colors.white70, fontSize: 10.5)),
            ),
          ],
        ),
      );
}

class _PosturalNote extends StatelessWidget {
  final String note;
  const _PosturalNote({required this.note});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.amber.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.amber.withValues(alpha: 0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.lightbulb_outline, color: Colors.amber, size: 14),
            const SizedBox(width: 6),
            Expanded(
              child: Text(note,
                  style: const TextStyle(color: Colors.amber, fontSize: 10.5)),
            ),
          ],
        ),
      );
}
