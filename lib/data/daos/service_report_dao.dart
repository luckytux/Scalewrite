// File: lib/data/daos/service_report_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/service_reports.dart';

part 'service_report_dao.g.dart';

@DriftAccessor(tables: [ServiceReports])
class ServiceReportDao extends DatabaseAccessor<AppDatabase>
    with _$ServiceReportDaoMixin {
  ServiceReportDao(AppDatabase db) : super(db);

  Future<int> insertReport(ServiceReportsCompanion entry) {
    return into(serviceReports).insert(entry);
  }

  Future<List<ServiceReport>> getAllReports() {
    return select(serviceReports).get();
  }

  Stream<List<ServiceReport>> watchAllReports() {
    return select(serviceReports).watch();
  }

  Future<List<ServiceReport>> getReportsForWorkOrder(int workOrderId) {
    return (select(serviceReports)
          ..where((tbl) => tbl.workOrderId.equals(workOrderId)))
        .get();
  }

  Future<void> markReportComplete(int id) {
    return (update(serviceReports)..where((tbl) => tbl.id.equals(id)))
        .write(const ServiceReportsCompanion(complete: Value(true)));
  }

  Future<void> deleteReport(int id) {
    return (delete(serviceReports)..where((tbl) => tbl.id.equals(id))).go();
  }
}
