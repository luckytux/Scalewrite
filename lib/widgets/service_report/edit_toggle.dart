// File: lib/widgets/service_report/edit_toggle.dart

import 'package:flutter/material.dart';

class EditToggle extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;

  const EditToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text('Edit Scale Fields'),
      value: value,
      onChanged: onChanged,
    );
  }
}
