// File: lib/sync/sync_models.dart
import 'dart:convert';

/// What we push to the server (WO, SR, WT only).
/// WeightTests are included for ServiceReports that are not yet synced.
class SyncPayload {
  final List<Map<String, dynamic>> workOrders;
  final List<Map<String, dynamic>> serviceReports;
  final List<Map<String, dynamic>> weightTests;

  SyncPayload({
    required this.workOrders,
    required this.serviceReports,
    required this.weightTests,
  });

  Map<String, dynamic> toJson() => {
        'workOrders': workOrders,
        'serviceReports': serviceReports,
        'weightTests': weightTests,
      };

  String toPrettyJson() =>
      const JsonEncoder.withIndent('  ').convert(toJson());
}

class SyncPreview {
  final int workOrders;
  final int serviceReports;
  final int weightTests;

  const SyncPreview({
    required this.workOrders,
    required this.serviceReports,
    required this.weightTests,
  });

  bool get hasAnything => workOrders + serviceReports + weightTests > 0;
}
