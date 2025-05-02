// File: lib/data/daos/scale_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/scales.dart';

part 'scale_dao.g.dart';

@DriftAccessor(tables: [Scales])
class ScaleDao extends DatabaseAccessor<AppDatabase> with _$ScaleDaoMixin {
  ScaleDao(super.db);

  Future<int> insertScale(ScalesCompanion entry) {
    return into(scales).insert(entry);
  }

  Future<Scale?> getScaleById(int id) {
    return (select(scales)..where((s) => s.id.equals(id))).getSingleOrNull();
  }
  
  Future<List<Scale>> getAllScales() {
    return select(scales).get();
  }

  Stream<List<Scale>> watchAllScales() {
    return select(scales).watch();
  }

  Future<List<Scale>> getScalesForCustomer(int customerId) {
    return (select(scales)..where((tbl) => tbl.customerId.equals(customerId))).get();
  }

  Future<bool> updateScale(Scale updated) {
    return update(scales).replace(updated);
  }

  Future<int> deleteScale(int id) {
    return (delete(scales)..where((tbl) => tbl.id.equals(id))).go();
  }
}
