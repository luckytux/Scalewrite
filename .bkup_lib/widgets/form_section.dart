import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  final String title;
  final Widget child;

  const FormSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
