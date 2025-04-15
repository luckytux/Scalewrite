// File: lib/providers/customer_list_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';

final customerListProvider = FutureProvider((ref) async {
  final db = ref.read(databaseProvider);
  return db.customerDao.getAllActiveCustomers();
});
