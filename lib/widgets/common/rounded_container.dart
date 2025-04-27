// File: lib/widgets/common/rounded_container.dart

import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final String? label;

  const RoundedContainer({super.key, required this.child, this.label});

  @override
  Widget build(BuildContext context) {
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
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal, width: 1),
          ),
          child: child,
        ),
      ],
    );
  }
}
