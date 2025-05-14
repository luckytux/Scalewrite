// File: lib/widgets/common/rounded_container.dart

import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final String? label;

  /// Controls whether the container is in editable (true) or read-only (false) mode.
  final bool editable;

  /// Optional override for background color.
  final Color? fillColor;

  const RoundedContainer({
    super.key,
    required this.child,
    this.label,
    this.editable = false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultFill = editable ? Colors.teal.shade50 : Colors.grey.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
        ],
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: fillColor ?? defaultFill,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal, width: 1),
          ),
          child: child,
        ),
      ],
    );
  }
}
