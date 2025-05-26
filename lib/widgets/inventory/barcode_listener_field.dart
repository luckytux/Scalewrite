// File: lib/widgets/inventory/barcode_listener_field.dart

import 'package:flutter/material.dart';

class BarcodeListenerField extends StatefulWidget {
  final void Function(String barcode) onScan;

  const BarcodeListenerField({super.key, required this.onScan});

  @override
  State<BarcodeListenerField> createState() => _BarcodeListenerFieldState();
}

class _BarcodeListenerFieldState extends State<BarcodeListenerField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void _handleScan(String value) {
    if (value.isNotEmpty) {
      widget.onScan(value.trim());
      _controller.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.0,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: true,
        onSubmitted: _handleScan,
      ),
    );
  }
}
