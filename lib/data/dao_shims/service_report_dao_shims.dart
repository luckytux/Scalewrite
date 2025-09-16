// File: lib/data/dao_shims/service_report_dao_shims.dart

import 'package:drift/drift.dart';
import 'package:scalewrite_v2/data/daos/service_report_dao.dart';
import 'package:scalewrite_v2/data/database.dart';

/// IDE-only shim so the analyzer can "see" these helpers even if older call sites exist.
/// Safe to keep; if your DAO already has the same methods, the real ones win at compile time.
extension ServiceReportDaoShims on ServiceReportDao {
  /// Back-compat + convenience.
  Future<ServiceReport?> getServiceReportById(int id) {
    return (select(serviceReports)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Legacy alias some files might still reference.
  Future<ServiceReport?> getServiceReportId(int id) => getServiceReportById(id);
}
