// File: lib/widgets/common/rounded_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefixIcon; // ✅ Added prefixIcon

  const RoundedTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.onTap,
    this.fillColor,
    this.inputFormatters,
    this.suffixIcon,
    this.prefixIcon, // ✅ Added prefixIcon
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final defaultFill = widget.readOnly ? Colors.grey.shade200 : Colors.teal.shade50;

    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLines,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon, // ✅ Added prefixIcon
        suffixIcon: widget.suffixIcon ??
            (widget.obscureText
                ? IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  )
                : null),
        filled: true,
        fillColor: widget.fillColor ?? defaultFill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
