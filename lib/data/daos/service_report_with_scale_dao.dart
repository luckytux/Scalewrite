// File: lib/data/daos/service_report_with_scale_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/service_reports.dart';
import '../tables/scales.dart';
import '../tables/work_orders.dart';
import '../../models/service_report_with_scale.dart';

part 'service_report_with_scale_dao.g.dart';

@DriftAccessor(tables: [ServiceReports, Scales, WorkOrders])
class ServiceReportWithScaleDao extends DatabaseAccessor<AppDatabase>
    with _$ServiceReportWithScaleDaoMixin {
  ServiceReportWithScaleDao(super.db);

  Future<List<ServiceReportWithScale>> getReportsWithScaleByWorkOrder(int workOrderId) async {
    final query = select(serviceReports).join([
      innerJoin(scales, scales.id.equalsExp(serviceReports.scaleId)),
    ])
      ..where(serviceReports.workOrderId.equals(workOrderId));

    final rows = await query.get();

    return rows.map((row) {
      final report = row.readTable(serviceReports);
      final scale = row.readTable(scales);
      return ServiceReportWithScale(report: report, scale: scale);
    }).toList();
  }

}
