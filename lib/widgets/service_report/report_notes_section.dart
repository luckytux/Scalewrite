// File: lib/widgets/service_report/report_notes_section.dart

import 'package:flutter/material.dart';

import '../common/rounded_text_field.dart';

class ReportNotesSection extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;

  const ReportNotesSection({
    super.key,
    required this.controller,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedTextField(
      controller: controller,
      label: 'Report Notes',
      maxLines: 5,
      readOnly: readOnly,
    );
  }
}
