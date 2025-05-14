// File: lib/models/service_report_with_scale.dart

import '../data/database.dart';

class ServiceReportWithScale {
  final ServiceReport report;
  final Scale scale;

  ServiceReportWithScale({
    required this.report,
    required this.scale,
  });
}
