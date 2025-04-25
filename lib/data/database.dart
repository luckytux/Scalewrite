// File: lib/data/database.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Tables
import 'tables/customers.dart';
import 'tables/contacts.dart';
import 'tables/work_orders.dart';
import 'tables/scales.dart';
import 'tables/service_reports.dart';

// DAOs
import 'daos/customer_dao.dart';
import 'daos/contact_dao.dart';
import 'daos/work_order_dao.dart';
import 'daos/scale_dao.dart';
import 'daos/service_report_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Customers, Contacts, WorkOrders, Scales, ServiceReports],
  daos: [CustomerDao, ContactDao, WorkOrderDao, ScaleDao, ServiceReportDao],
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
    print('📂 SQLite DB Path: $path'); // Add this line
    return NativeDatabase(File(path));
  });
}
