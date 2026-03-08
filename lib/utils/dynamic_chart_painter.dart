// =============================================================================
// DYNAMIC CHART PAINTER v5.3.4 — Zone boundaries only, no text labels
// =============================================================================

import 'dart:math' as math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ai_eye_capture/utils/polar_zone_hittest.dart';

class DynamicChartPainter extends CustomPainter {
  final PolarZoneData polarData;
  final double realPupilFrac;
  final double realCollaretteFrac;
  final double opacity;
  final bool showLabels;    // kept for API compat but ignored
  final bool outlineOnly;

  DynamicChartPainter({
    required this.polarData,
    required this.realPupilFrac,
    required this.realCollaretteFrac,
    this.opacity = 0.6,
    this.showLabels = false,
    this.outlineOnly = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2.0;
    final cy = size.height / 2.0;
    final irisR = math.min(size.width, size.height) / 2.0;
    if (irisR < 10) return;

    final grid = polarData.grid;
    final angleBins = polarData.angleBins;
    final radiusBins = polarData.radiusBins;
    final CN = polarData.collaretteNorm;
    final rP = realPupilFrac.clamp(0.05, 0.55);
    final rC = realCollaretteFrac.clamp(rP + 0.03, 0.75);

    final screenRadii = Float64List(radiusBins);
    for (int ri = 0; ri < radiusBins; ri++) {
      final normR = ri / (radiusBins - 1);
      if (normR <= CN) {
        screenRadii[ri] = (rP + (normR / CN) * (rC - rP)) * irisR;
      } else {
        screenRadii[ri] = (rC + ((normR - CN) / (1.0 - CN)) * (1.0 - rC)) * irisR;
      }
    }

    final center = Offset(cx, cy);
    final angleStep = 2.0 * math.pi / angleBins;

    // Zone boundary lines
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8
      ..color = Colors.white.withOpacity(opacity * 0.85);

    // Radial boundaries
    for (int ai = 0; ai < angleBins; ai++) {
      final angle = ai * angleStep;
      final cosA = math.cos(angle);
      final sinA = math.sin(angle);
      for (int ri = 0; ri < radiusBins - 1; ri++) {
        final z1 = grid[ai * radiusBins + ri];
        final z2 = grid[ai * radiusBins + ri + 1];
        if (z1 != z2 && z1 != 0 && z2 != 0 && z1 != 255 && z2 != 255) {
          final r = (screenRadii[ri] + screenRadii[ri + 1]) / 2.0;
          canvas.drawCircle(Offset(cx + r * cosA, cy + r * sinA), 0.6, linePaint);
        }
      }
    }

    // Angular boundaries
    for (int ri = 1; ri < radiusBins - 1; ri += 2) {
      for (int ai = 0; ai < angleBins; ai++) {
        final z1 = grid[ai * radiusBins + ri];
        final z2 = grid[((ai + 1) % angleBins) * radiusBins + ri];
        if (z1 != z2 && z1 != 0 && z2 != 0 && z1 != 255 && z2 != 255) {
          final angle = (ai + 0.5) * angleStep;
          final innerR = screenRadii[math.max(0, ri - 2)];
          final outerR = screenRadii[math.min(radiusBins - 1, ri + 2)];
          canvas.drawLine(
            Offset(cx + innerR * math.cos(angle), cy + innerR * math.sin(angle)),
            Offset(cx + outerR * math.cos(angle), cy + outerR * math.sin(angle)),
            linePaint,
          );
        }
      }
    }

    // Reference rings
    canvas.drawCircle(center, rP * irisR, Paint()..style = PaintingStyle.stroke..strokeWidth = 1.2..color = Colors.greenAccent.withOpacity(opacity * 0.5));
    canvas.drawCircle(center, rC * irisR, Paint()..style = PaintingStyle.stroke..strokeWidth = 1.0..color = Colors.amberAccent.withOpacity(opacity * 0.5));
    canvas.drawCircle(center, irisR, Paint()..style = PaintingStyle.stroke..strokeWidth = 1.2..color = Colors.cyanAccent.withOpacity(opacity * 0.4));
  }

  @override
  bool shouldRepaint(DynamicChartPainter oldDelegate) {
    return oldDelegate.polarData != polarData ||
        oldDelegate.realPupilFrac != realPupilFrac ||
        oldDelegate.realCollaretteFrac != realCollaretteFrac ||
        oldDelegate.opacity != opacity ||
        oldDelegate.outlineOnly != outlineOnly;
  }
}
