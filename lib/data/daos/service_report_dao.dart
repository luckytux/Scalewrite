// File: lib/data/daos/service_report_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/service_reports.dart';
import '../tables/scales.dart';
import '../../models/service_report_with_scale.dart';

part 'service_report_dao.g.dart';

@DriftAccessor(tables: [ServiceReports, Scales])
class ServiceReportDao extends DatabaseAccessor<AppDatabase>
    with _$ServiceReportDaoMixin {
  ServiceReportDao(super.db);

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
          ..where((tbl) => tbl.workOrderId.equals(workOrderId))
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc),
          ]))
        .get();
  }

  Future<List<ServiceReportWithScale>> getReportsWithScaleByWorkOrder(int workOrderId) async {
    final query = select(serviceReports).join([
      innerJoin(scales, scales.id.equalsExp(serviceReports.scaleId)),
    ])..where(serviceReports.workOrderId.equals(workOrderId));

    final rows = await query.get();

    return rows.map((row) {
      final report = row.readTable(serviceReports);
      final scale = row.readTable(scales);
      return ServiceReportWithScale(report: report, scale: scale);
    }).toList();
  }

  Future<void> markReportComplete(int id) {
    return (update(serviceReports)..where((tbl) => tbl.id.equals(id)))
        .write(const ServiceReportsCompanion(complete: Value(true)));
  }

  Future<void> deleteReport(int id) {
    return (delete(serviceReports)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<ServiceReportWithScale?> getById(int id) async {
    final query = select(serviceReports).join([
      innerJoin(scales, scales.id.equalsExp(serviceReports.scaleId)),
    ])..where(serviceReports.id.equals(id));

    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return ServiceReportWithScale(
      report: row.readTable(serviceReports),
      scale: row.readTable(scales),
    );
  }

  Future<void> updateIpoState({
    required int reportId,
    required Map<String, dynamic> ipoStateJson,
  }) {
    return (update(serviceReports)..where((tbl) => tbl.id.equals(reportId)))
        .write(ServiceReportsCompanion(ipoStateJson: Value(ipoStateJson)));
  }
}
