// File: lib/data/daos/scale_dao.dart

import 'package:drift/drift.dart' as drift;
import '../database.dart';
import '../tables/scales.dart';

part 'scale_dao.g.dart';

@drift.DriftAccessor(tables: [Scales])
class ScaleDao extends DatabaseAccessor<AppDatabase> with _$ScaleDaoMixin {
  ScaleDao(AppDatabase db) : super(db);

  Future<List<ScalesData>> getScalesForCustomer(int customerId) async {
    print('[ScaleDao] Fetching scales for customer ID: $customerId');
    final result = await (select(scales)
          ..where((tbl) => tbl.customerId.equals(customerId) & tbl.deactivate.equals(false)))
        .get();
    print('[ScaleDao] Found ${result.length} scales');
    return result;
  }

  Stream<List<ScalesData>> watchScalesForCustomer(int customerId) {
    print('[ScaleDao] Watching scales for customer ID: $customerId');
    return (select(scales)
          ..where((tbl) => tbl.customerId.equals(customerId) & tbl.deactivate.equals(false)))
        .watch();
  }

  Future<int> insertScale(ScalesCompanion scale) async {
    print('[ScaleDao] Inserting scale: $scale');
    final id = await into(scales).insert(scale);
    print('[ScaleDao] Inserted scale with ID: $id');
    return id;
  }

  Future<bool> updateScale(ScalesData scale) async {
    print('[ScaleDao] Updating scale ID: ${scale.id}');
    final success = await update(scales).replace(scale);
    print('[ScaleDao] Update success: $success');
    return success;
  }

  Future<int> deleteScale(int id) async {
    print('[ScaleDao] Deleting scale ID: $id');
    final count = await (delete(scales)..where((tbl) => tbl.id.equals(id))).go();
    print('[ScaleDao] Deleted $count rows');
    return count;
  }
}
