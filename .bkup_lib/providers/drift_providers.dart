// File: lib/providers/drift_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';

// DAO imports
import '../data/daos/customer_dao.dart';
import '../data/daos/contact_dao.dart';
import '../data/daos/service_report_dao.dart';
import '../data/daos/scale_dao.dart';
import '../data/daos/work_order_dao.dart';

/// Provides a single instance of the Drift database
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

/// DAO Providers
final customerDaoProvider = Provider<CustomerDao>((ref) {
  return ref.read(databaseProvider).customerDao;
});

final contactDaoProvider = Provider<ContactDao>((ref) {
  return ref.read(databaseProvider).contactDao;
});

final serviceReportDaoProvider = Provider<ServiceReportDao>((ref) {
  return ref.read(databaseProvider).serviceReportDao;
});

final scaleDaoProvider = Provider<ScaleDao>((ref) {
  return ref.read(databaseProvider).scaleDao;
});

final workOrderDaoProvider = Provider<WorkOrderDao>((ref) {
  return ref.read(databaseProvider).workOrderDao;
});
