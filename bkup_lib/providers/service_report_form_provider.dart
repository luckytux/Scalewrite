// File: lib/providers/service_report_form_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/service_report_form_controller.dart';

final serviceReportFormProvider = ChangeNotifierProvider<ServiceReportFormController>(
  (ref) => ServiceReportFormController(),
);
