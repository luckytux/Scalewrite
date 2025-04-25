// File: lib/widgets/service_report/configuration_toggle.dart
import 'package:flutter/material.dart';

class ConfigurationToggle extends StatelessWidget {
  final bool configuration; // true = Modular (M), false = Complete (C)
  final bool enabled;
  final Function(bool?) onChanged;

  const ConfigurationToggle({
    super.key,
    required this.configuration,
    required this.onChanged,
    this.enabled = true,
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
                onChanged: enabled ? onChanged : null,
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                title: const Text('Modular (M)'),
                value: true,
                groupValue: configuration,
                onChanged: enabled ? onChanged : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
