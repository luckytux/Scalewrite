// File: lib/providers/drift_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';

// DAO imports
import '../data/daos/customer_dao.dart';
import '../data/daos/contact_dao.dart';
import '../data/daos/work_order_dao.dart';
import '../data/daos/scale_dao.dart';
import '../data/daos/service_report_dao.dart';
import '../data/daos/weight_test_dao.dart'; // ✅ Add this line
import '../data/daos/work_order_with_customer_dao.dart';


/// Provides the singleton Drift database
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

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

final weightTestDaoProvider = Provider<WeightTestDao>((ref) { // ✅ New
  return ref.read(databaseProvider).weightTestDao;
});

final workOrderWithCustomerDaoProvider = Provider<WorkOrderWithCustomerDao>(
  (ref) => ref.read(databaseProvider).workOrderWithCustomerDao,
);

