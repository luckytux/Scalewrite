// File: lib/widgets/weight_test/section_diagram_painter.dart

import 'dart:math';
import 'package:flutter/material.dart';

class SectionDiagramPainter extends CustomPainter {
  final int sections;

  SectionDiagramPainter({required this.sections});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Helper function to paint text centered on position
    void drawText(String text, Offset offset) {
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, offset - Offset(tp.width / 2, tp.height / 2));
    }

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2.5;

    switch (sections) {
      case 1:
        canvas.drawRect(
          Rect.fromCenter(center: center, width: 20, height: 20),
          paint..style = PaintingStyle.fill,
        );
        drawText('1', center);
        break;

      case 2:
        final p1 = center.translate(-40, 0);
        final p2 = center.translate(40, 0);
        canvas.drawLine(p1, p2, paint);
        drawText('1', p1);
        drawText('2', p2);
        break;

      case 3:
        for (int i = 0; i < 3; i++) {
          final angle = (2 * pi / 3) * i - pi / 2;
          final p = Offset(
            center.dx + radius * cos(angle),
            center.dy + radius * sin(angle),
          );
          drawText('${i + 1}', p);
        }
        canvas.drawCircle(center, radius, paint);
        break;

      case 4:
        final square = Rect.fromCenter(center: center, width: radius * 1.5, height: radius * 1.5);
        canvas.drawRect(square, paint);
        final corners = [
          square.topLeft,
          square.topRight,
          square.bottomRight,
          square.bottomLeft,
        ];
        for (int i = 0; i < corners.length; i++) {
          drawText('${i + 1}', corners[i]);
        }
        break;

      case 5:
        canvas.drawCircle(center, radius, paint);
        for (int i = 0; i < 5; i++) {
          final angle = (2 * pi / 5) * i - pi / 2;
          final p = Offset(
            center.dx + radius * cos(angle),
            center.dy + radius * sin(angle),
          );
          drawText('${i + 1}', p);
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
          drawText('${i + 1}', Offset(x, rect.top));       // Top side numbering
          drawText('${sections - i}', Offset(x, rect.bottom)); // Bottom side numbering
        }
        break;


      default:
        // fallback if unexpected number
        drawText('Invalid sections', center);
      break;
    }
  }

  @override
  bool shouldRepaint(covariant SectionDiagramPainter oldDelegate) {
    return oldDelegate.sections != sections;
  }
}
