import 'package:flutter/material.dart';

class SaveWorkOrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveWorkOrderButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.save),
      label: const Text('Save Work Order'),
    );
  }
}
