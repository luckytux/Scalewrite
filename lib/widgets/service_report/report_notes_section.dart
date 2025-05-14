// File: lib/widgets/service_report/report_notes_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/service_report_form_provider.dart';
import '../common/rounded_text_field.dart';

class ReportNotesSection extends ConsumerWidget {
  const ReportNotesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(serviceReportFormProvider);

    return RoundedTextField(
      controller: controller.scaleNotesController,
      label: 'Report Notes',
      maxLines: 5,
      readOnly: !controller.editable,
      onChanged: (val) => controller.setNotes(val),
    );
  }
}
