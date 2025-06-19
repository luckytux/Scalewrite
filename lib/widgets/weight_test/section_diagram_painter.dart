// File: lib/widgets/weight_test/section_diagram_painter.dart

import 'dart:math';
import 'package:flutter/material.dart';

class SectionDiagramPainter extends CustomPainter {
  final int sections;
  final bool isDirectional;

  SectionDiagramPainter({
    required this.sections,
    required this.isDirectional,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final textStyle = const TextStyle(fontSize: 14, color: Colors.black);

    void drawText(String text, Offset position) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, position - Offset(tp.width / 2, tp.height / 2));
    }

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 3;

    if (isDirectional) {
      // DIRECTIONAL: vertical rectangle with label pairs (E1/E11, E2/E12, ...)
      final pairCount = sections;
      final rowHeight = 24.0;
      final startY = center.dy - (rowHeight * pairCount / 2);
      final leftX = center.dx - 40;
      final rightX = center.dx + 40;

      for (int i = 0; i < pairCount; i++) {
        final y = startY + i * rowHeight;
        drawText('E${i + 1}', Offset(leftX, y));
        drawText('E${i + 11}', Offset(rightX, y));
      }

      // Rectangle border around the area
      final rectTop = startY - rowHeight / 2;
      final rectBottom = startY + rowHeight * pairCount - rowHeight / 2;
      final rect = Rect.fromLTRB(leftX - 20, rectTop, rightX + 20, rectBottom);
      canvas.drawRect(rect, paint);
      return;
    }

    // SECTIONAL MODE
    switch (sections) {
      case 1:
        // No drawing or label
        break;

case 2:
  final offset = 24.0;
  final top = Offset(center.dx, center.dy - radius);
  final bottom = Offset(center.dx, center.dy + radius);
  canvas.drawLine(top, bottom, paint);
  drawText('1', top.translate(0, -offset));
  drawText('2', bottom.translate(0, offset));
  break;

case 3:
case 5:
  final angleStep = 2 * pi / sections;
  canvas.drawCircle(center, radius, paint);
  final labelRadius = radius + 18; // Padding
  for (int i = 0; i < sections; i++) {
    final angle = angleStep * i - pi / 2;
    final dx = center.dx + labelRadius * cos(angle);
    final dy = center.dy + labelRadius * sin(angle);
    drawText('${i + 1}', Offset(dx, dy));
  }
  break;

case 4:
  final squareSize = radius * 1.5;
  final padding = 18.0;
  final offsetX = squareSize / 2;
  final offsetY = squareSize / 2;

  final corners = [
    Offset(center.dx - offsetX - padding, center.dy - offsetY - padding), // 1
    Offset(center.dx + offsetX + padding, center.dy - offsetY - padding), // 2
    Offset(center.dx - offsetX - padding, center.dy + offsetY + padding), // 3
    Offset(center.dx + offsetX + padding, center.dy + offsetY + padding), // 4
  ];

  final rect = Rect.fromCenter(center: center, width: squareSize, height: squareSize);
  canvas.drawRect(rect, paint);

  for (int i = 0; i < 4; i++) {
    drawText('${i + 1}', corners[i]);
  }
  break;

case 6:
case 8:
case 10:
  final cols = 2;
  final rows = (sections / cols).ceil();
  final cellWidth = 48.0;
  final cellHeight = 36.0;
  final gridWidth = cellWidth * cols;
  final gridHeight = cellHeight * rows;

  final startX = center.dx - gridWidth / 2;
  final startY = center.dy - gridHeight / 2;

  final rect = Rect.fromLTWH(startX, startY, gridWidth, gridHeight);
  canvas.drawRect(rect, paint);

  for (int i = 0; i < sections; i++) {
    final row = i ~/ cols;
    final col = i % cols;

    final x = startX + (col + 0.5) * cellWidth;
    final y = startY + (row + 0.5) * cellHeight;

    drawText('${i + 1}', Offset(x, y));
  }
  break;

    }
  }

  @override
  bool shouldRepaint(covariant SectionDiagramPainter oldDelegate) {
    return oldDelegate.sections != sections || oldDelegate.isDirectional != isDirectional;
  }
}
