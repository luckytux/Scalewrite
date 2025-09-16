// File: lib/data/daos/weight_test_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/weight_tests.dart';

part 'weight_test_dao.g.dart';

@DriftAccessor(tables: [WeightTests])
class WeightTestDao extends DatabaseAccessor<AppDatabase>
    with _$WeightTestDaoMixin {
  WeightTestDao(super.db);

  /// Insert a new weight test row.
  Future<int> insertWeightTest(WeightTestsCompanion entry) =>
      into(weightTests).insert(entry);

  /// Replace an existing row by primary key (id).
  Future<bool> updateWeightTest(WeightTest test) =>
      update(weightTests).replace(test);

  /// Update fields for the row identified by [serviceReportId].
  Future<int> updateByServiceReportId(
    int serviceReportId,
    WeightTestsCompanion entry,
  ) {
    return (update(weightTests)
          ..where((t) => t.serviceReportId.equals(serviceReportId)))
        .write(entry);
  }

  /// Read a row by unique(service_report_id).
  Future<WeightTest?> getByServiceReportId(int serviceReportId) {
    return (select(weightTests)
          ..where((t) => t.serviceReportId.equals(serviceReportId)))
        .getSingleOrNull();
  }

  /// Delete by primary key (id).
  Future<void> deleteWeightTest(int id) async {
    await (delete(weightTests)..where((t) => t.id.equals(id))).go();
  }

  /// Get all rows.
  Future<List<WeightTest>> getAllTests() => select(weightTests).get();

  /// Insert or update based on the UNIQUE(service_report_id) constraint.
  Future<void> upsertByServiceReportId(WeightTestsCompanion entry) async {
    final srId = entry.serviceReportId.value;
    // Ensure srId is present
    assert(srId != null, 'serviceReportId must be provided for upsert');

    final existing = await getByServiceReportId(srId);
    if (existing == null) {
      await insertWeightTest(entry);
    } else {
      await updateByServiceReportId(srId, entry);
    }
  }
}
