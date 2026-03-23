// lib/therapy/tcm_recommendations_panel.dart
// TCM meridian/organ panel with Five Element color theming and organ clock display.

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';
import 'package:ai_eye_capture/therapy/tcm_engine.dart';
import 'package:ai_eye_capture/therapy/tcm_data.dart';

class TcmRecommendationsPanel extends StatefulWidget {
  final List<TcmRecommendation> recommendations;

  const TcmRecommendationsPanel({super.key, required this.recommendations});

  @override
  State<TcmRecommendationsPanel> createState() =>
      _TcmRecommendationsPanelState();
}

class _TcmRecommendationsPanelState extends State<TcmRecommendationsPanel> {
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
                  color: const Color(0xFFD32F2F).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('☯', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.therapyTcmTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(l10n.therapyTcmSubtitle,
                        style: const TextStyle(color: Colors.white54, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Cards
        ...widget.recommendations.asMap().entries.map((entry) {
          final i = entry.key;
          final rec = entry.value;
          final isOpen = _expanded.contains(i);
          return _TcmCard(
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
            l10n.therapyTcmDisclaimer,
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

// ── TCM Card ──────────────────────────────────────────────────────────────────

class _TcmCard extends StatefulWidget {
  final TcmRecommendation rec;
  final bool isExpanded;
  final VoidCallback onToggle;

  const _TcmCard({required this.rec, required this.isExpanded, required this.onToggle});

  @override
  State<_TcmCard> createState() => _TcmCardState();
}

class _TcmCardState extends State<_TcmCard> {
  int _activePatternIndex = 0;

  Color get _elementColor => Color(widget.rec.tcmData.element.colorHex);

  Color get _findingColor {
    switch (widget.rec.findingType) {
      case 'flattening': return Colors.orange;
      case 'protrusion': return Colors.redAccent;
      case 'anw_shift':  return Colors.purple;
      default:           return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tcm = widget.rec.tcmData;
    final el = tcm.element;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1B2E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: widget.isExpanded
              ? _elementColor.withValues(alpha: 0.6)
              : Colors.white12,
          width: widget.isExpanded ? 1.5 : 1,
        ),
        // Subtle element-colored top bar
        gradient: widget.isExpanded
            ? LinearGradient(
                colors: [
                  _elementColor.withValues(alpha: 0.08),
                  const Color(0xFF1A1B2E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────
          GestureDetector(
            onTap: widget.onToggle,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Element badge
                  _ElementBadge(element: el, color: _elementColor),
                  const SizedBox(width: 8),
                  // Finding badge
                  _SmallBadge(
                    label: widget.rec.findingType == 'flattening'
                        ? l10n.therapyFindingFlat
                        : widget.rec.findingType == 'protrusion'
                            ? l10n.therapyFindingProt
                            : l10n.therapyFindingAnw,
                    color: _findingColor,
                  ),
                  const SizedBox(width: 6),
                  _SmallBadge(
                    label: widget.rec.eyeLabel,
                    color: widget.rec.isRightEye ? Colors.blue : Colors.green,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tcm.primaryOrgan,
                            style: TextStyle(
                                color: _elementColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text(l10n.therapyPairedOrgan(tcm.pairedOrgan),
                            style: const TextStyle(
                                color: Colors.white38, fontSize: 10)),
                      ],
                    ),
                  ),
                  // Organ clock badge
                  _ClockBadge(time: tcm.organClockTime, color: _elementColor),
                  const SizedBox(width: 6),
                  Text('${widget.rec.severity.toStringAsFixed(1)}%',
                      style: TextStyle(
                          color: _findingColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  Icon(
                      widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white38, size: 18),
                ],
              ),
            ),
          ),

          // ── Expanded content ─────────────────────────────────────────────
          if (widget.isExpanded) ...[
            // Element summary bar
            _ElementBar(element: el, color: _elementColor, yinYang: tcm.yinYang),
            const SizedBox(height: 2),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Iris zone context
                  Text(widget.rec.organInfo.displayName,
                      style: const TextStyle(color: Colors.white38, fontSize: 10)),
                  const SizedBox(height: 12),

                  // Meridian functions
                  _SectionHeader(icon: '⚡', label: l10n.therapyTcmMeridianFunctions, color: _elementColor),
                  const SizedBox(height: 5),
                  ...tcm.meridianFunctions
                      .map((f) => _BulletLine(text: f, color: _elementColor)),
                  const SizedBox(height: 10),

                  // Governs
                  _SectionHeader(icon: '🔗', label: l10n.therapyTcmGoverns, color: _elementColor),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: tcm.governsTissue
                        .map((t) => _PillChip(label: t, color: _elementColor))
                        .toList(),
                  ),
                  const SizedBox(height: 12),

                  // Imbalance patterns — tab row
                  _SectionHeader(icon: '⚖', label: l10n.therapyTcmPatterns, color: _elementColor),
                  const SizedBox(height: 8),
                  if (tcm.patterns.isNotEmpty) ...[
                    // Pattern selector
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: tcm.patterns.asMap().entries.map((e) {
                          final active = _activePatternIndex == e.key;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _activePatternIndex = e.key),
                            child: Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 5),
                              decoration: BoxDecoration(
                                color: active
                                    ? _elementColor.withValues(alpha: 0.25)
                                    : Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: active
                                        ? _elementColor.withValues(alpha: 0.7)
                                        : Colors.white12),
                              ),
                              child: Text(e.value.name,
                                  style: TextStyle(
                                      color: active ? _elementColor : Colors.white54,
                                      fontSize: 10,
                                      fontWeight: active
                                          ? FontWeight.bold
                                          : FontWeight.normal)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Active pattern detail
                    if (_activePatternIndex < tcm.patterns.length)
                      _PatternDetail(
                          pattern: tcm.patterns[_activePatternIndex],
                          color: _elementColor),
                  ],
                  const SizedBox(height: 12),

                  // Key acupoints
                  _SectionHeader(icon: '📍', label: l10n.therapyTcmAcupoints, color: _elementColor),
                  const SizedBox(height: 5),
                  ...tcm.keyAcupoints
                      .map((p) => _AcupointRow(text: p, color: _elementColor)),
                  const SizedBox(height: 12),

                  // Foods
                  _SectionHeader(icon: '🥢', label: l10n.therapyTcmDiet, color: _elementColor),
                  const SizedBox(height: 5),
                  Text(l10n.therapyTcmTonifying,
                      style: const TextStyle(color: Colors.white54, fontSize: 10)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: tcm.tonifyingFoods
                        .map((f) => _FoodChip(food: f, color: _elementColor))
                        .toList(),
                  ),
                  const SizedBox(height: 6),
                  Text(l10n.therapyTcmAvoid,
                      style: const TextStyle(color: Colors.white54, fontSize: 10)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: tcm.avoidFoods
                        .map((f) => _AvoidChip(food: f))
                        .toList(),
                  ),
                  const SizedBox(height: 12),

                  // Clinical note
                  _ClinicalNote(note: tcm.clinicalNote, color: _elementColor),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Element badge ─────────────────────────────────────────────────────────────

class _ElementBadge extends StatelessWidget {
  final TcmElement element;
  final Color color;
  const _ElementBadge({required this.element, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.6)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(element.name.toUpperCase(),
                style: TextStyle(
                    color: color,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
            Text(element.color,
                style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 8)),
          ],
        ),
      );
}

// ── Small badge ───────────────────────────────────────────────────────────────

class _SmallBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _SmallBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Text(label,
            style: TextStyle(
                color: color, fontSize: 9, fontWeight: FontWeight.bold)),
      );
}

// ── Organ clock badge ─────────────────────────────────────────────────────────

class _ClockBadge extends StatelessWidget {
  final String time;
  final Color color;
  const _ClockBadge({required this.time, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.access_time, color: color, size: 10),
            const SizedBox(width: 3),
            Text(time,
                style: TextStyle(color: color.withValues(alpha: 0.9), fontSize: 8)),
          ],
        ),
      );
}

// ── Element bar (horizontal summary) ─────────────────────────────────────────

class _ElementBar extends StatelessWidget {
  final TcmElement element;
  final Color color;
  final String yinYang;
  const _ElementBar({required this.element, required this.color, required this.yinYang});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ElBarItem(icon: Icons.brightness_5, label: l10n.therapySeasonLabel, value: element.season, color: color),
          _ElBarDivider(color: color),
          _ElBarItem(icon: Icons.cloud, label: l10n.therapyClimateLabel, value: element.climate, color: color),
          _ElBarDivider(color: color),
          _ElBarItem(icon: Icons.sentiment_satisfied, label: l10n.therapyEmotionLabel, value: element.emotion.split(' /')[0], color: color),
          _ElBarDivider(color: color),
          _ElBarItem(icon: Icons.restaurant, label: l10n.therapyTasteLabel, value: element.taste, color: color),
          _ElBarDivider(color: color),
          _ElBarItem(icon: Icons.blur_circular, label: l10n.therapyNatureLabel, value: yinYang, color: color),
        ],
      ),
    );
  }
}

class _ElBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  const _ElBarItem({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color.withValues(alpha: 0.7), size: 12),
          const SizedBox(height: 1),
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 8)),
          Text(value,
              style: TextStyle(
                  color: color, fontSize: 9, fontWeight: FontWeight.w600)),
        ],
      );
}

class _ElBarDivider extends StatelessWidget {
  final Color color;
  const _ElBarDivider({required this.color});
  @override
  Widget build(BuildContext context) =>
      Container(width: 1, height: 28, color: color.withValues(alpha: 0.15));
}

// ── Pattern detail ────────────────────────────────────────────────────────────

class _PatternDetail extends StatelessWidget {
  final TcmPattern pattern;
  final Color color;
  const _PatternDetail({required this.pattern, required this.color});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Symptoms
            Text(l10n.therapyTcmSymptoms,
                style: TextStyle(
                    color: color, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Wrap(
              spacing: 5,
              runSpacing: 4,
              children: pattern.symptoms
                  .map((s) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: Text(s,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 9.5)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),

            // Classic formulas
            if (pattern.classicFormulas.isNotEmpty) ...[
              Text(l10n.therapyTcmFormulas,
                  style: TextStyle(
                      color: color, fontSize: 10, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              ...pattern.classicFormulas.map((f) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(children: [
                      Icon(Icons.local_pharmacy, color: color, size: 10),
                      const SizedBox(width: 4),
                      Text(f,
                          style: TextStyle(
                              color: color.withValues(alpha: 0.85),
                              fontSize: 10)),
                    ]),
                  )),
              const SizedBox(height: 8),
            ],

            // Key points for pattern
            Text(l10n.therapyTcmKeyPoints,
                style: TextStyle(
                    color: color, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Wrap(
              spacing: 5,
              runSpacing: 4,
              children: pattern.acupoints
                  .map((p) => _PillChip(label: p, color: color))
                  .toList(),
            ),
          ],
        ),
      );
  }
}

// ── Acupoint row ──────────────────────────────────────────────────────────────

class _AcupointRow extends StatelessWidget {
  final String text;
  final Color color;
  const _AcupointRow({required this.text, required this.color});

  // Format: "HT7 Shenmen — description"
  static final _re = RegExp(r'^([A-Z]+\d+\s+\w+)\s+—\s+(.+)$');

  @override
  Widget build(BuildContext context) {
    final m = _re.firstMatch(text);
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: color.withValues(alpha: 0.4)),
            ),
            child: Text(m?.group(1) ?? text.split(' — ').first,
                style: TextStyle(
                    color: color, fontSize: 9.5, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(m?.group(2) ?? '',
                style: const TextStyle(color: Colors.white60, fontSize: 10)),
          ),
        ],
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  const _SectionHeader({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  color: color, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      );
}

// ── Pill chip ─────────────────────────────────────────────────────────────────

class _PillChip extends StatelessWidget {
  final String label;
  final Color color;
  const _PillChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Text(label,
            style:
                TextStyle(color: color.withValues(alpha: 0.9), fontSize: 10)),
      );
}

// ── Food chip ─────────────────────────────────────────────────────────────────

class _FoodChip extends StatelessWidget {
  final String food;
  final Color color;
  const _FoodChip({required this.food, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Text(food,
            style: TextStyle(
                color: color.withValues(alpha: 0.85), fontSize: 10)),
      );
}

class _AvoidChip extends StatelessWidget {
  final String food;
  const _AvoidChip({required this.food});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.remove_circle_outline, color: Colors.redAccent, size: 9),
            const SizedBox(width: 3),
            Text(food,
                style: const TextStyle(color: Colors.redAccent, fontSize: 10)),
          ],
        ),
      );
}

class _BulletLine extends StatelessWidget {
  final String text;
  final Color color;
  const _BulletLine({required this.text, required this.color});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(Icons.circle, color: color, size: 4),
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

class _ClinicalNote extends StatelessWidget {
  final String note;
  final Color color;
  const _ClinicalNote({required this.note, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('☯', style: TextStyle(color: color, fontSize: 13)),
            const SizedBox(width: 7),
            Expanded(
              child: Text(note,
                  style: TextStyle(
                      color: color.withValues(alpha: 0.85), fontSize: 10.5)),
            ),
          ],
        ),
      );
}
