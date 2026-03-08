import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'pupil_analyzer.dart';

/// Widget to visualize pupil analysis results overlaid on eye image
class PupilAnalysisOverlay extends StatelessWidget {
  final EyeAnalysisResult analysis;
  final double imageWidth;
  final double imageHeight;
  final bool showIris;
  final bool showPupil;
  final bool showANW;
  final bool showMeasurements;
  final Color irisColor;
  final Color pupilColor;
  final Color anwColor;

  const PupilAnalysisOverlay({
    super.key,
    required this.analysis,
    required this.imageWidth,
    required this.imageHeight,
    this.showIris = true,
    this.showPupil = true,
    this.showANW = true,
    this.showMeasurements = true,
    this.irisColor = Colors.green,
    this.pupilColor = Colors.cyan,
    this.anwColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(imageWidth, imageHeight),
      painter: _AnalysisPainter(
        analysis: analysis,
        showIris: showIris,
        showPupil: showPupil,
        showANW: showANW,
        showMeasurements: showMeasurements,
        irisColor: irisColor,
        pupilColor: pupilColor,
        anwColor: anwColor,
      ),
    );
  }
}

class _AnalysisPainter extends CustomPainter {
  final EyeAnalysisResult analysis;
  final bool showIris;
  final bool showPupil;
  final bool showANW;
  final bool showMeasurements;
  final Color irisColor;
  final Color pupilColor;
  final Color anwColor;

  _AnalysisPainter({
    required this.analysis,
    required this.showIris,
    required this.showPupil,
    required this.showANW,
    required this.showMeasurements,
    required this.irisColor,
    required this.pupilColor,
    required this.anwColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw iris circle
    if (showIris) {
      final irisPaint = Paint()
        ..color = irisColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      canvas.drawCircle(
        Offset(analysis.irisCenterX, analysis.irisCenterY),
        analysis.irisRadius,
        irisPaint,
      );

      // Draw center crosshair
      const crossSize = 10.0;
      canvas.drawLine(
        Offset(analysis.irisCenterX - crossSize, analysis.irisCenterY),
        Offset(analysis.irisCenterX + crossSize, analysis.irisCenterY),
        irisPaint,
      );
      canvas.drawLine(
        Offset(analysis.irisCenterX, analysis.irisCenterY - crossSize),
        Offset(analysis.irisCenterX, analysis.irisCenterY + crossSize),
        irisPaint,
      );
    }

    // Draw ANW circle
    if (showANW && analysis.anwRadius != null) {
      final anwPaint = Paint()
        ..color = anwColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      canvas.drawCircle(
        Offset(analysis.irisCenterX, analysis.irisCenterY),
        analysis.anwRadius!,
        anwPaint,
      );
    }

    // Draw pupil ellipse
    if (showPupil) {
      final pupilPaint = Paint()
        ..color = pupilColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;

      canvas.save();
      canvas.translate(analysis.pupilCenterX, analysis.pupilCenterY);
      canvas.rotate(analysis.pupilAngle * math.pi / 180);

      final pupilRect = Rect.fromCenter(
        center: Offset.zero,
        width: analysis.pupilMajorAxis * 2,
        height: analysis.pupilMinorAxis * 2,
      );
      canvas.drawOval(pupilRect, pupilPaint);

      canvas.restore();

      // Draw pupil center
      final centerPaint = Paint()
        ..color = pupilColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(analysis.pupilCenterX, analysis.pupilCenterY),
        4,
        centerPaint,
      );
    }

    // Draw decentralization line
    if (showMeasurements && analysis.decentralization > 1.0) {
      final linePaint = Paint()
        ..color = Colors.red.withOpacity(0.7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      canvas.drawLine(
        Offset(analysis.irisCenterX, analysis.irisCenterY),
        Offset(analysis.pupilCenterX, analysis.pupilCenterY),
        linePaint,
      );
    }

    // Draw measurement labels
    if (showMeasurements) {
      _drawMeasurementLabels(canvas, size);
    }
  }

  void _drawMeasurementLabels(Canvas canvas, Size size) {
    final textStyle = ui.TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: ui.FontWeight.bold,
    );

    // Pupil ratio label
    final ratioText = 'P/I: ${analysis.pupilIrisRatio.toStringAsFixed(1)}%';
    _drawLabel(
      canvas,
      ratioText,
      Offset(analysis.irisCenterX, analysis.irisCenterY - analysis.irisRadius - 20),
      textStyle,
      Colors.cyan.withOpacity(0.8),
    );

    // Decentralization label (if significant)
    if (analysis.decentralization >= 3.0) {
      final decentText = 'Dec: ${analysis.decentralization.toStringAsFixed(1)}%';
      _drawLabel(
        canvas,
        decentText,
        Offset(analysis.pupilCenterX + 10, analysis.pupilCenterY - 10),
        textStyle,
        Colors.red.withOpacity(0.8),
      );
    }
  }

  void _drawLabel(Canvas canvas, String text, Offset position,
      ui.TextStyle style, Color bgColor) {
    final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.center,
    ))
      ..pushStyle(style)
      ..addText(text);

    final paragraph = paragraphBuilder.build()
      ..layout(const ui.ParagraphConstraints(width: 100));

    // Background
    final bgRect = Rect.fromCenter(
      center: position,
      width: paragraph.maxIntrinsicWidth + 8,
      height: paragraph.height + 4,
    );

    final bgPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(bgRect, const Radius.circular(4)),
      bgPaint,
    );

    // Text
    canvas.drawParagraph(
      paragraph,
      Offset(position.dx - paragraph.maxIntrinsicWidth / 2, position.dy - paragraph.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Complete analysis result card widget
class AnalysisResultCard extends StatelessWidget {
  final EyeAnalysisResult analysis;
  final String eyeLabel;

  const AnalysisResultCard({
    super.key,
    required this.analysis,
    required this.eyeLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: _getGradeColor(analysis.qualityGrade),
                ),
                const SizedBox(width: 8),
                Text(
                  '$eyeLabel Eye',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getGradeColor(analysis.qualityGrade),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Grade ${analysis.qualityGrade}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),

            // Measurements
            _buildMeasurementRow(
              'Pupil/Iris Ratio',
              '${analysis.pupilIrisRatio.toStringAsFixed(1)}%',
              _getRatioStatus(analysis.pupilIrisRatio),
            ),
            _buildMeasurementRow(
              'Ellipseness',
              '${analysis.ellipseness.toStringAsFixed(1)}%',
              analysis.ellipseness >= 90 ? 'Normal' : 'Abnormal',
            ),
            _buildMeasurementRow(
              'Decentralization',
              '${analysis.decentralization.toStringAsFixed(1)}%',
              analysis.decentralization < 3 ? 'Normal' : analysis.decentralizationZone,
            ),
            if (analysis.anwRatio != null)
              _buildMeasurementRow(
                'ANW Ratio',
                '${analysis.anwRatio!.toStringAsFixed(1)}%',
                'Detected',
              ),

            const SizedBox(height: 8),

            // Clinical significance
            if (analysis.isDeformationSignificant)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Clinically significant findings detected',
                        style: TextStyle(color: Colors.orange[800]),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementRow(String label, String value, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontFamily: 'monospace')),
          ),
          Expanded(
            child: Text(
              status,
              style: TextStyle(
                color: status == 'Normal' ? Colors.green : Colors.orange,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.lightGreen;
      case 'C':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  String _getRatioStatus(double ratio) {
    if (ratio < 15) return 'Miosis';
    if (ratio > 40) return 'Mydriasis';
    return 'Normal';
  }
}

/// Bilateral comparison widget
class BilateralComparisonWidget extends StatelessWidget {
  final BilateralAnalysisResult result;

  const BilateralComparisonWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bilateral Comparison',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),

            // Comparison table header
            const Row(
              children: [
                Expanded(flex: 2, child: Text('Parameter', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Left', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Right', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Diff', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 8),

            // Pupil ratio
            if (result.leftEye != null && result.rightEye != null) ...[
              _buildComparisonRow(
                'P/I Ratio',
                result.leftEye!.pupilIrisRatio,
                result.rightEye!.pupilIrisRatio,
              ),
              _buildComparisonRow(
                'Ellipseness',
                result.leftEye!.ellipseness,
                result.rightEye!.ellipseness,
              ),
              _buildComparisonRow(
                'Decentralization',
                result.leftEye!.decentralization,
                result.rightEye!.decentralization,
              ),
              if (result.leftEye!.anwRatio != null && result.rightEye!.anwRatio != null)
                _buildComparisonRow(
                  'ANW Ratio',
                  result.leftEye!.anwRatio!,
                  result.rightEye!.anwRatio!,
                ),
            ],

            const SizedBox(height: 16),

            // Clinical notes
            if (result.clinicalNotes.isNotEmpty) ...[
              const Text(
                'Clinical Notes:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...result.clinicalNotes.map((note) => Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• '),
                        Expanded(child: Text(note)),
                      ],
                    ),
                  )),
            ],

            // Warnings
            if (result.warnings.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...result.warnings.map((warning) => Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.red, size: 16),
                        const SizedBox(width: 8),
                        Expanded(child: Text(warning)),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonRow(String label, double left, double right) {
    final diff = (left - right).abs();
    final isSignificant = diff > 5.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
            child: Text(
              '${left.toStringAsFixed(1)}%',
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'monospace'),
            ),
          ),
          Expanded(
            child: Text(
              '${right.toStringAsFixed(1)}%',
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'monospace'),
            ),
          ),
          Expanded(
            child: Text(
              '${diff.toStringAsFixed(1)}%',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
                color: isSignificant ? Colors.red : Colors.green,
                fontWeight: isSignificant ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
