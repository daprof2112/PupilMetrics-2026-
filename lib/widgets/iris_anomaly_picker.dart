// =============================================================================
// IRIS ANOMALY PICKER WIDGET
// Shown below the zone info panel in the zone overlay dialog.
// Lets the practitioner select an anomaly type (+ optional subtype) for the
// currently identified zone, then appends a structured finding to the
// observer notes field.
// =============================================================================

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/therapy/iris_anomaly_data.dart';
import 'package:ai_eye_capture/l10n/app_localizations.dart';

class IrisAnomalyPicker extends StatefulWidget {
  /// Zone name displayed as the organ label (e.g. "Upper-Nasal")
  final String zoneName;

  /// System string used to resolve organ-specific anomaly types
  /// (e.g. "Cardiac / Respiratory")
  final String zoneSystem;

  /// Called when the practitioner confirms a finding; receives the
  /// formatted string to append to observer notes.
  final void Function(String finding) onAddFinding;

  const IrisAnomalyPicker({
    super.key,
    required this.zoneName,
    required this.zoneSystem,
    required this.onAddFinding,
  });

  @override
  State<IrisAnomalyPicker> createState() => _IrisAnomalyPickerState();
}

class _IrisAnomalyPickerState extends State<IrisAnomalyPicker> {
  IrisAnomalyType? _selectedType;
  String? _selectedSubtype;
  bool _expanded = false;

  static const _kHeaderColor  = Color(0xFF1A1200);
  static const _kAccent       = Color(0xFFFFB300);   // amber
  static const _kBg           = Color(0xFF0F0E1A);
  static const _kBorder       = Color(0xFF2A2840);

  List<IrisAnomalyType> get _types =>
      anomalyTypesForSystem(widget.zoneSystem);

  void _reset() {
    _selectedType    = null;
    _selectedSubtype = null;
  }

  String _buildFinding() {
    final organ = widget.zoneName.isNotEmpty ? '[${widget.zoneName}]' : '';
    final type  = _selectedType?.name ?? '';
    final sub   = (_selectedSubtype?.isNotEmpty == true) ? ' › $_selectedSubtype' : '';
    final conc  = (_selectedType?.conclusion.isNotEmpty == true)
        ? '\n  → ${_selectedType!.conclusion}'
        : '';
    return '$organ $type$sub$conc'.trim();
  }

  @override
  void didUpdateWidget(IrisAnomalyPicker old) {
    super.didUpdateWidget(old);
    // Reset picker when the tapped zone changes
    if (old.zoneName != widget.zoneName || old.zoneSystem != widget.zoneSystem) {
      setState(_reset);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.zoneName.isEmpty) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: _kBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _kAccent.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Header (tap to expand/collapse) ──────────────────────────────
          InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _kHeaderColor,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(10),
                  bottom: _expanded ? Radius.zero : const Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add_circle_outline, color: _kAccent, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      l10n.addFinding,
                      style: TextStyle(
                        color: _kAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: _kAccent,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          // ── Body ─────────────────────────────────────────────────────────
          if (_expanded) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Zone/organ label
                  Text(
                    widget.zoneName,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  if (widget.zoneSystem.isNotEmpty)
                    Text(
                      widget.zoneSystem,
                      style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 10),
                    ),
                  const SizedBox(height: 10),

                  // ── Anomaly type dropdown ─────────────────────────────
                  _label(l10n.anomalyType),
                  const SizedBox(height: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: _kBorder),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<IrisAnomalyType>(
                        value: _selectedType,
                        hint: Text(l10n.selectAnomalyType,
                            style: TextStyle(color: Colors.white38, fontSize: 12)),
                        isExpanded: true,
                        dropdownColor: const Color(0xFF1D1E33),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        items: _types.map((t) => DropdownMenuItem(
                          value: t,
                          child: Text(t.name),
                        )).toList(),
                        onChanged: (t) => setState(() {
                          _selectedType    = t;
                          _selectedSubtype = null;
                        }),
                      ),
                    ),
                  ),

                  // ── Subtype list (conditional) ────────────────────────
                  if (_selectedType != null &&
                      _selectedType!.subtypes.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _label(l10n.anomalySubtype),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: _selectedType!.subtypes.map((s) {
                        final selected = s == _selectedSubtype;
                        return GestureDetector(
                          onTap: () => setState(() =>
                              _selectedSubtype = selected ? null : s),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: selected
                                  ? _kAccent.withOpacity(0.25)
                                  : const Color(0xFF1D1E33),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: selected ? _kAccent : _kBorder,
                              ),
                            ),
                            child: Text(
                              s,
                              style: TextStyle(
                                color:
                                    selected ? _kAccent : Colors.white60,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],

                  // ── Conclusion (conditional) ──────────────────────────
                  if (_selectedType != null &&
                      _selectedType!.conclusion.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    _label(l10n.anomalyConclusion),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF12110A),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: _kAccent.withOpacity(0.3)),
                      ),
                      child: Text(
                        _selectedType!.conclusion,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 11),
                      ),
                    ),
                  ],

                  // ── Add Finding button ────────────────────────────────
                  if (_selectedType != null) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 36,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _kAccent,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.note_add, size: 16),
                        label: Text(l10n.addToNotes,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        onPressed: () {
                          widget.onAddFinding(_buildFinding());
                          setState(_reset);
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
        text,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      );
}
