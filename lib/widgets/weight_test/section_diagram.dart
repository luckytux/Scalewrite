// File: lib/widgets/section_diagram.dart

import 'package:flutter/material.dart';
import 'dart:math';

class SectionDiagram extends StatelessWidget {
  final int sections;

  const SectionDiagram({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(150, 150),
      painter: SectionDiagramPainter(sections),
    );
  }
}

class SectionDiagramPainter extends CustomPainter {
  final int sections;

  SectionDiagramPainter(this.sections);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    textPaint(String text, Offset offset) {
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, offset);
    }

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 3;

    switch (sections) {
      case 1:
        canvas.drawCircle(center, 5, paint..style = PaintingStyle.fill);
        textPaint('1', center.translate(8, -8));
        break;

      case 2:
        final start = Offset(center.dx - radius / 2, center.dy);
        final end = Offset(center.dx + radius / 2, center.dy);
        canvas.drawLine(start, end, paint);
        textPaint('1', start.translate(-15, -10));
        textPaint('2', end.translate(5, -10));
        break;

      case 3:
        for (int i = 0; i < 3; i++) {
          final angle = i * 2 * pi / 3;
          final x = center.dx + radius * cos(angle);
          final y = center.dy + radius * sin(angle);
          canvas.drawCircle(Offset(x, y), 3, paint..style = PaintingStyle.fill);
          textPaint('${i + 1}', Offset(x + 5, y - 5));
        }
        break;

      case 4:
        final rect = Rect.fromCenter(center: center, width: radius * 2, height: radius * 2);
        canvas.drawRect(rect, paint);
        textPaint('1', rect.topLeft.translate(-10, -10));
        textPaint('2', rect.topRight.translate(5, -10));
        textPaint('3', rect.bottomRight.translate(5, 5));
        textPaint('4', rect.bottomLeft.translate(-10, 5));
        break;

      case 5:
        for (int i = 0; i < 5; i++) {
          final angle = i * 2 * pi / 5 - pi / 2;
          final x = center.dx + radius * cos(angle);
          final y = center.dy + radius * sin(angle);
          canvas.drawCircle(Offset(x, y), 3, paint..style = PaintingStyle.fill);
          textPaint('${i + 1}', Offset(x + 5, y - 5));
        }
        break;

      case 6:
      case 8:
      case 10:
        final width = radius * 2;
        final height = radius * (sections == 6 ? 1 : (sections == 8 ? 1.2 : 1.5));
        final rect = Rect.fromCenter(center: center, width: width, height: height);
        canvas.drawRect(rect, paint);

        final stepX = rect.width / (sections ~/ 2 + 1);

        for (int i = 0; i < sections ~/ 2; i++) {
          final x = rect.left + (i + 1) * stepX;
          textPaint('${i + 1}', Offset(x, rect.top - 16)); // Top side
          textPaint('${sections - i}', Offset(x, rect.bottom + 2)); // Bottom side
        }
        break;

      default:
        textPaint('Unsupported Sections', center.translate(-50, 0));
        break;
    }
  }

  @override
  bool shouldRepaint(covariant SectionDiagramPainter oldDelegate) {
    return oldDelegate.sections != sections;
  }
}
