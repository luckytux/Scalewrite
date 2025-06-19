// File: lib/widgets/weight_test/section_diagram.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/weight_test_form_provider.dart';
import 'section_diagram_painter.dart';
class SectionDiagram extends ConsumerWidget {
  final int sections;
  final bool isDirectional;

  const SectionDiagram({
    super.key,
    required this.sections,
    required this.isDirectional,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(weightTestFormProvider);
    final unit = controller.weightTestUnit;
    final type = controller.eccentricityType;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Type: $type', style: Theme.of(context).textTheme.titleMedium),
            Text('Units: $unit', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 8),
        Center(
          child: SizedBox(
            width: 120,
            height: 180,
            child: CustomPaint(
              painter: SectionDiagramPainter(
                sections: sections,
                isDirectional: isDirectional,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
