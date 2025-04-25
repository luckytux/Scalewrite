import 'package:flutter/material.dart';

class ConfigurationToggle extends StatelessWidget {
  final bool configuration; // true = Modular (M), false = Complete (C)
  final Function(bool?) onChanged;

  const ConfigurationToggle({
    super.key,
    required this.configuration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Configuration Type:'),
        Row(
          children: [
            Expanded(
              child: RadioListTile<bool>(
                title: const Text('Complete (C)'),
                value: false,
                groupValue: configuration,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                title: const Text('Modular (M)'),
                value: true,
                groupValue: configuration,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
