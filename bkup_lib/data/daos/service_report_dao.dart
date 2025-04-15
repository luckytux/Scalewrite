// File: lib/data/daos/service_report_dao.dart

import 'package:drift/drift.dart' as drift;
import '../database.dart';
import '../tables/service_reports.dart';
import '../tables/scales.dart';

part 'service_report_dao.g.dart';

@drift.DriftAccessor(tables: [ServiceReports, Scales])
class ServiceReportDao extends DatabaseAccessor<AppDatabase> with _$ServiceReportDaoMixin {
  ServiceReportDao(AppDatabase db) : super(db);

  Future<List<ServiceReportsData>> getReportsForWorkOrder(int workOrderId) {
    return (select(serviceReports)..where((r) => r.workOrderId.equals(workOrderId))).get();
  }

  Stream<List<ServiceReportsData>> watchReportsForWorkOrder(int workOrderId) {
    return (select(serviceReports)..where((r) => r.workOrderId.equals(workOrderId))).watch();
  }

  Stream<List<ServiceReportsData>> watchAllReports() {
    return (select(serviceReports)).watch();
  }

  Future<int> insertServiceReport(ServiceReportsCompanion report) {
    return into(serviceReports).insert(report);
  }

  Future<bool> updateReport(ServiceReportsData report) {
    return update(serviceReports).replace(report);
  }

  Future<void> markReportComplete(int reportId) async {
    await (update(serviceReports)..where((r) => r.id.equals(reportId)))
        .write(const ServiceReportsCompanion(complete: drift.Value(true)));
  }
}
