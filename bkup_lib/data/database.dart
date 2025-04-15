// File: lib/data/database.dart

import 'dart:io';
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// Tables
import 'tables/customers.dart';
import 'tables/contacts.dart';
import 'tables/scales.dart';
import 'tables/work_orders.dart';
import 'tables/service_reports.dart';

// DAOs
import 'daos/customer_dao.dart';
import 'daos/contact_dao.dart';
import 'daos/scale_dao.dart';
import 'daos/work_order_dao.dart';
import 'daos/service_report_dao.dart';

part 'database.g.dart';

@drift.DriftDatabase(
  tables: [Customers, Contacts, Scales, WorkOrders, ServiceReports],
  daos: [CustomerDao, ContactDao, ScaleDao, WorkOrderDao, ServiceReportDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'scalewrite.sqlite');
    return NativeDatabase(File(path));
  });
}
