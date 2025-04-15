import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const DescriptionField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.teal.shade50,
      ),
    );
  }
}
