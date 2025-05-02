// File: lib/data/daos/weight_test_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/weight_tests.dart';

part 'weight_test_dao.g.dart';

@DriftAccessor(tables: [WeightTests])
class WeightTestDao extends DatabaseAccessor<AppDatabase> with _$WeightTestDaoMixin {
  WeightTestDao(super.db);

  Future<int> insertWeightTest(WeightTestsCompanion entry) =>
      into(weightTests).insert(entry);

  Future<bool> updateWeightTest(WeightTest test) =>
      update(weightTests).replace(test);

  Future<WeightTest?> getByServiceReportId(int serviceReportId) {
    return (select(weightTests)..where((t) => t.serviceReportId.equals(serviceReportId)))
        .getSingleOrNull();
  }

  Future<void> deleteWeightTest(int id) async {
    await (delete(weightTests)..where((t) => t.id.equals(id))).go();
  }

  Future<List<WeightTest>> getAllTests() => select(weightTests).get();
}
