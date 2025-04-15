// File: lib/utils/test_data_loader.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../data/database.dart';
import '../data/tables/customers.dart';
import '../data/tables/contacts.dart';
import '../data/tables/work_orders.dart';
import '../data/tables/scales.dart';
import '../data/tables/service_reports.dart';
import '../providers/drift_providers.dart';

final testDataLoaderProvider = ChangeNotifierProvider((ref) => TestDataLoader(ref));

class TestDataLoader extends ChangeNotifier {
  final Ref ref;
  bool loading = false;

  TestDataLoader(this.ref);

  Future<bool> loadTestData() async {
    loading = true;
    notifyListeners();

    try {
      final jsonString = await rootBundle.loadString('assets/test_data_fixed.json');
      final Map<String, dynamic> data = jsonDecode(jsonString);
      final db = ref.read(databaseProvider);

      // Customers
      final List customers = data['customers'] ?? [];
      for (final c in customers) {
        await db.customerDao.insertCustomer(CustomersCompanion(
          businessName: Value(c['businessName'] ?? c['name'] ?? ''),
          address: Value(c['address'] ?? ''),
          city: Value(c['city'] ?? ''),
          province: Value(c['province'] ?? ''),
          postalCode: Value(c['postal'] ?? ''),
          notes: Value(c['notes'] ?? ''),
          deactivate: const Value(false),
          auditFlag: const Value(false),
          synced: const Value(false),
        ));
      }

      // Contacts
      final List contacts = data['contacts'] ?? [];
      for (final ct in contacts) {
        await db.contactDao.insertContact(ContactsCompanion(
          customerId: Value(ct['customerId']),
          name: Value(ct['name']),
          phone: Value(ct['phone'] ?? ''),
          email: Value(ct['email'] ?? ''),
          notes: Value(ct['notes'] ?? ''),
          isMain: Value(ct['isMain'] ?? false),
          deactivate: const Value(false),
          auditFlag: const Value(false),
          synced: const Value(false),
        ));
      }

      // Work Orders
      final List workOrders = data['workOrders'] ?? [];
      for (final wo in workOrders) {
        await db.workOrderDao.insertWorkOrder(WorkOrdersCompanion(
          customerId: Value(wo['customerId']),
          businessName: Value(wo['businessName']),
          billingAddress: Value(wo['billingAddress'] ?? ''),
          city: Value(wo['city'] ?? ''),
          province: Value(wo['province'] ?? ''),
          postalCode: Value(wo['postal'] ?? ''),
          workOrderNumber: Value(wo['workOrderNumber']),
          gpsLocation: Value(wo['gpsLocation'] ?? ''),
          customerNotes: Value(wo['customerNotes'] ?? ''),
          deactivate: const Value(false),
          synced: const Value(false),
        ));
      }

      // Scales
      final List scales = data['scales'] ?? [];
      for (final s in scales) {
        await db.scaleDao.insertScale(ScalesCompanion(
          customerId: Value(s['customerId']),
          configuration: Value(s['configuration'] ?? true),
          scaleType: Value(s['scaleType'] ?? ''),
          indicatorMake: Value(s['indicatorMake'] ?? ''),
          indicatorModel: Value(s['indicatorModel'] ?? ''),
          indicatorSerial: Value(s['indicatorSerial'] ?? ''),
          approvalPrefix: Value(s['approvalPrefix'] ?? ''),
          approvalNumber: Value(s['approvalNumber'] ?? ''),
          baseMake: Value(s['baseMake']),
          baseModel: Value(s['baseModel']),
          baseSerial: Value(s['baseSerial']),
          baseApprovalPrefix: Value(s['baseApprovalPrefix']),
          baseApprovalNumber: Value(s['baseApprovalNumber']),
          capacity: Value((s['capacity'] ?? 0).toDouble()),
          capacityUnit: Value(s['capacityUnit'] ?? ''),
          division: Value((s['division'] ?? 0).toDouble()),
          numberOfLoadCells: Value(s['numberOfLoadCells'] ?? 0),
          numberOfSections: Value(s['numberOfSections'] ?? 0),
          loadCellModel: Value(s['loadCellModel'] ?? ''),
          loadCellCapacity: Value((s['loadCellCapacity'] ?? 0).toDouble()),
          loadCellCapacityUnit: Value(s['loadCellCapacityUnit'] ?? ''),
          notes: Value(s['notes']),
          deactivate: const Value(false),
          auditFlag: const Value(false),
          synced: const Value(false),
        ));
      }

      // Service Reports
      final List reports = data['serviceReports'] ?? [];
      for (final r in reports) {
        await db.serviceReportDao.insertServiceReport(ServiceReportsCompanion(
          workOrderId: Value(r['workOrderId']),
          scaleId: Value(r['scaleId']),
          reportType: Value(r['reportType']),
          notes: Value(r['notes']),
          createdAt: Value(DateTime.tryParse(r['createdAt'] ?? '') ?? DateTime.now()),
          complete: Value(r['complete'] ?? false),
          synced: Value(r['synced'] ?? false),
        ));
      }

      debugPrint('✅ Test data loaded successfully');
      loading = false;
      notifyListeners();
      return true;
    } catch (e, stack) {
      debugPrint('❌ Error loading test data: $e\n$stack');
      loading = false;
      notifyListeners();
      return false;
    }
  }
}
