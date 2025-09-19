// File: lib/widgets/service_report/report_notes_section.dart
import 'package:flutter/material.dart';
import '../common/rounded_text_field.dart';

class ReportNotesSection extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;

  /// Optional: explicit focus order so Tab lands here at the right time.
  final double? focusOrder;

  const ReportNotesSection({
    super.key,
    required this.controller,
    required this.readOnly,
    this.focusOrder,
  });

  @override
  Widget build(BuildContext context) {
    final field = RoundedTextField(
      controller: controller,
      label: 'Report Notes',
      maxLines: 5,
      readOnly: readOnly,
      // Make multi-line behave nicely with Tab/Enter on desktop:
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
    );

    // If a focus order was provided, apply it directly to the focusable child.
    if (focusOrder != null) {
      return FocusTraversalOrder(
        order: NumericFocusOrder(focusOrder!),
        child: field,
      );
    }
    return field;
  }
}
