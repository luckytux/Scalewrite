// File: lib/providers/drift_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';

// DAO imports
import '../data/daos/customer_dao.dart';
import '../data/daos/contact_dao.dart';
import '../data/daos/work_order_dao.dart';
import '../data/daos/scale_dao.dart';
import '../data/daos/service_report_dao.dart';
import '../data/daos/weight_test_dao.dart';
import '../data/daos/work_order_with_customer_dao.dart';
import '../data/daos/user_dao.dart';
import '../data/daos/inventory_dao.dart'; // Add this line

// ✅ Create a singleton instance of AppDatabase
final _singletonDb = AppDatabase();

/// Provides the singleton Drift database
final databaseProvider = Provider<AppDatabase>((ref) => _singletonDb);

/// Individual DAO providers
final customerDaoProvider = Provider<CustomerDao>((ref) {
  return ref.read(databaseProvider).customerDao;
});

final contactDaoProvider = Provider<ContactDao>((ref) {
  return ref.read(databaseProvider).contactDao;
});

final workOrderDaoProvider = Provider<WorkOrderDao>((ref) {
  return ref.read(databaseProvider).workOrderDao;
});

final scaleDaoProvider = Provider<ScaleDao>((ref) {
  return ref.read(databaseProvider).scaleDao;
});

final serviceReportDaoProvider = Provider<ServiceReportDao>((ref) {
  return ref.read(databaseProvider).serviceReportDao;
});

final weightTestDaoProvider = Provider<WeightTestDao>((ref) {
  return ref.read(databaseProvider).weightTestDao;
});

final workOrderWithCustomerDaoProvider = Provider<WorkOrderWithCustomerDao>((ref) {
  return ref.read(databaseProvider).workOrderWithCustomerDao;
});

final userDaoProvider = Provider<UserDao>((ref) {
  return ref.read(databaseProvider).userDao;
});

final inventoryDaoProvider = Provider<InventoryDao>((ref) {
  return ref.read(databaseProvider).inventoryDao;
});
