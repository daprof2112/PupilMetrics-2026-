// lib/therapy/constitutional_panel.dart
// Display widget for selected constitutional type in AnalysisScreen.

import 'package:flutter/material.dart';
import 'package:ai_eye_capture/therapy/constitutional_data.dart';

class ConstitutionalPanel extends StatefulWidget {
  final ConstitutionalType constitution;

  const ConstitutionalPanel({super.key, required this.constitution});

  @override
  State<ConstitutionalPanel> createState() => _ConstitutionalPanelState();
}

class _ConstitutionalPanelState extends State<ConstitutionalPanel> {
  bool _irisExpanded = true;
  bool _predExpanded = true;
  bool _remediesExpanded = false;

  static const _amber = Color(0xFFFFB300);
  static const _amberLight = Color(0xFF1A1500);

  Color _groupColor(String group) {
    switch (group) {
      case 'Lymphatic':
        return Colors.blue;
      case 'Haematogenic':
        return Colors.brown;
      case 'Biliary / Mixed':
        return Colors.orange;
      case 'Pathological':
        return Colors.red;
      case 'Syndrome':
        return Colors.purple;
      case 'Pre-Cancerous':
        return Colors.deepOrange;
      default:
        return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.constitution;
    final groupColor = _groupColor(c.group);

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: _amberLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _amber, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _amber.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.remove_red_eye_outlined, color: _amber, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Constitutional Iridology',
                        style: TextStyle(color: _amber, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        c.name,
                        style: const TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: groupColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: groupColor.withOpacity(0.6)),
                  ),
                  child: Text(
                    c.group,
                    style: TextStyle(color: groupColor, fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFF2A2000)),

          // ── Iris Description ─────────────────────────────────────────────────
          _buildSection(
            icon: Icons.circle_outlined,
            color: Colors.cyan,
            title: 'Iris Description',
            expanded: _irisExpanded,
            onTap: () => setState(() => _irisExpanded = !_irisExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                c.irisDescription,
                style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
              ),
            ),
          ),

          // ── Predispositions ──────────────────────────────────────────────────
          _buildSection(
            icon: Icons.warning_amber_rounded,
            color: Colors.orange,
            title: 'Health Predispositions',
            expanded: _predExpanded,
            onTap: () => setState(() => _predExpanded = !_predExpanded),
            child: Column(
              children: c.predispositions
                  .map((p) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('•  ', style: TextStyle(color: Colors.orange, fontSize: 14)),
                            Expanded(
                              child: Text(p,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 13, height: 1.45)),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),

          // ── Homeopathic Remedies ─────────────────────────────────────────────
          _buildSection(
            icon: Icons.local_pharmacy_outlined,
            color: Colors.green,
            title: 'Homeopathic Remedies',
            expanded: _remediesExpanded,
            onTap: () => setState(() => _remediesExpanded = !_remediesExpanded),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: c.homeopathicRemedies
                    .map((r) => Chip(
                          label: Text(r,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                          backgroundColor: Colors.green.withOpacity(0.15),
                          side: BorderSide(color: Colors.green.withOpacity(0.5)),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        ))
                    .toList(),
              ),
            ),
          ),

          // ── Footer disclaimer ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
            child: Text(
              'Based on Dr. Josef Deck\'s Constitutional Iridology — for educational reference only.',
              style: TextStyle(color: Colors.amber.withOpacity(0.5), fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required Color color,
    required String title,
    required bool expanded,
    required VoidCallback onTap,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Icon(icon, color: color, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(title,
                      style: TextStyle(
                          color: color, fontSize: 13, fontWeight: FontWeight.w600)),
                ),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white38,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        if (expanded) ...[
          child,
          const SizedBox(height: 4),
        ],
        const Divider(height: 1, color: Color(0xFF2A2000)),
      ],
    );
  }
}
