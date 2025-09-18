// File: lib/data/daos/weight_test_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/weight_tests.dart';
import '../tables/service_reports.dart';

part 'weight_test_dao.g.dart';

@DriftAccessor(tables: [WeightTests, ServiceReports])
class WeightTestDao extends DatabaseAccessor<AppDatabase>
    with _$WeightTestDaoMixin {
  WeightTestDao(super.db);

  // ---------- READ ----------
  Future<WeightTest?> getByServiceReportId(int serviceReportId) {
    return (select(weightTests)..where((t) => t.serviceReportId.equals(serviceReportId)))
        .getSingleOrNull();
  }

  Stream<WeightTest?> watchByServiceReportId(int serviceReportId) {
    return (select(weightTests)..where((t) => t.serviceReportId.equals(serviceReportId)))
        .watchSingleOrNull();
  }

  Future<List<WeightTest>> getAllTests() => select(weightTests).get();

  // ---------- WRITE (SR-driven sync: always mark parent SR unsynced) ----------

  /// Insert a new weight test row and mark its parent SR as unsynced.
  Future<int> insertWeightTest(WeightTestsCompanion entry) async {
    if (!entry.serviceReportId.present) {
      throw ArgumentError('serviceReportId must be provided on insert');
    }
    final srId = entry.serviceReportId.value;

    return transaction(() async {
      final id = await into(weightTests).insert(entry);
      await _markServiceReportUnsynced(srId);
      return id;
    });
  }

  /// Replace an existing row by PK and mark its parent SR as unsynced.
  Future<bool> updateWeightTest(WeightTest test) async {
    return transaction(() async {
      final ok = await update(weightTests).replace(test);
      // Use the row’s own SR id
      await _markServiceReportUnsynced(test.serviceReportId);
      return ok;
    });
  }

  /// Update by unique(service_report_id) and mark that SR as unsynced.
  Future<int> updateByServiceReportId(
    int serviceReportId,
    WeightTestsCompanion entry,
  ) async {
    return transaction(() async {
      final rows = await (update(weightTests)
            ..where((t) => t.serviceReportId.equals(serviceReportId)))
          .write(entry);
      await _markServiceReportUnsynced(serviceReportId);
      return rows;
    });
  }

  /// Upsert based on UNIQUE(service_report_id), then mark that SR as unsynced.
  Future<void> upsertByServiceReportId(WeightTestsCompanion entry) async {
    if (!entry.serviceReportId.present) {
      throw ArgumentError('serviceReportId must be provided for upsert');
    }
    final srId = entry.serviceReportId.value;

    await transaction(() async {
      final existing = await getByServiceReportId(srId);
      if (existing == null) {
        await into(weightTests).insert(entry);
      } else {
        await (update(weightTests)..where((t) => t.serviceReportId.equals(srId)))
            .write(entry);
      }
      await _markServiceReportUnsynced(srId);
    });
  }

  /// Delete by PK and mark that test’s parent SR as unsynced.
  Future<void> deleteWeightTest(int id) async {
    await transaction(() async {
      final row = await (select(weightTests)..where((t) => t.id.equals(id))).getSingleOrNull();
      await (delete(weightTests)..where((t) => t.id.equals(id))).go();
      final srId = row?.serviceReportId;
      if (srId != null) {
        await _markServiceReportUnsynced(srId);
      }
    });
  }

  // ---------- INTERNAL ----------
  Future<void> _markServiceReportUnsynced(int serviceReportId) async {
    await (update(serviceReports)..where((sr) => sr.id.equals(serviceReportId)))
        .write(const ServiceReportsCompanion(synced: Value(false)));
  }
}
