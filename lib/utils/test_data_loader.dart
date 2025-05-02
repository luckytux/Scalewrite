// File: lib/utils/test_data_loader.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../data/database.dart';
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

      await db.delete(db.serviceReports).go();
      await db.delete(db.scales).go();
      await db.delete(db.workOrders).go();
      await db.delete(db.contacts).go();
      await db.delete(db.customers).go();

      final List customers = data['customers'] ?? [];
      for (final c in customers) {
        final customerId = await db.customerDao.insertCustomer(CustomersCompanion(
          businessName: Value(c['businessName'] ?? c['name'] ?? ''),
          siteAddress: Value(c['siteAddress'] ?? ''),
          siteCity: Value(c['siteCity'] ?? ''),
          siteProvince: Value(c['siteProvince'] ?? ''),
          sitePostalCode: Value(c['sitePostalCode'] ?? ''),
          billingAddress: Value(c['billingAddress'] ?? c['siteAddress'] ?? ''),
          billingCity: Value(c['billingCity'] ?? c['siteCity'] ?? ''),
          billingProvince: Value(c['billingProvince'] ?? c['siteProvince'] ?? ''),
          billingPostalCode: Value(c['billingPostalCode'] ?? c['sitePostalCode'] ?? ''),
          gpsLocation: Value(c['gpsLocation'] ?? ''),
          notes: Value(c['details'] ?? ''),
          deactivate: const Value(false),
          auditFlag: const Value(false),
          synced: const Value(false),
        ));

        final main = c['mainContact'];
        if (main != null && (main['name'] ?? '').isNotEmpty) {
          await db.contactDao.insertContact(ContactsCompanion(
            customerId: Value(customerId),
            name: Value(main['name']),
            phone: Value(main['phone'] ?? ''),
            email: Value(main['email'] ?? ''),
            notes: Value(main['notes'] ?? ''),
            isMain: const Value(true),
            deactivate: const Value(false),
            auditFlag: const Value(false),
            synced: const Value(false),
          ));
        }

        final List additionalContacts = c['additionalContacts'] ?? [];
        for (final ct in additionalContacts) {
          await db.contactDao.insertContact(ContactsCompanion(
            customerId: Value(customerId),
            name: Value(ct['name']),
            phone: Value(ct['phone'] ?? ''),
            email: Value(ct['email'] ?? ''),
            notes: Value(ct['notes'] ?? ''),
            isMain: const Value(false),
            deactivate: const Value(false),
            auditFlag: const Value(false),
            synced: const Value(false),
          ));
        }

        final List workOrders = c['workOrders'] ?? [];
        for (final wo in workOrders) {
          final workOrderId = await db.workOrderDao.insertWorkOrder(WorkOrdersCompanion(
            customerId: Value(customerId),
            workOrderNumber: Value(wo['number']),
            siteAddress: Value(wo['siteAddress'] ?? 'Test Address'),
            siteCity: Value(wo['siteCity'] ?? 'Test City'),
            siteProvince: Value(wo['siteProvince'] ?? 'AB'),
            sitePostalCode: Value(wo['sitePostalCode'] ?? 'T1T1T1'),
            gpsLocation: Value(wo['gpsLocation'] ?? '51.0000,-114.0000'),
            customerNotes: Value(wo['notes'] ?? ''),
            billingAddress: Value(wo['billingAddress'] ?? 'Test Address'),
            billingCity: Value(wo['billingCity'] ?? 'Test City'),
            billingProvince: Value(wo['billingProvince'] ?? 'AB'),
            billingPostalCode: Value(wo['billingPostalCode'] ?? 'T1T1T1'),
            auditFlag: const Value(false),
          ));

          final List serviceReports = wo['serviceReports'] ?? [];
          for (final sr in serviceReports) {
            final scaleId = await db.scaleDao.insertScale(ScalesCompanion(
              customerId: Value(customerId),
              configuration: Value(sr['configuration'] == 'C'),
              scaleType: Value(sr['scaleType']),
              indicatorMake: Value(sr['indicatorMake']),
              indicatorModel: Value(sr['indicatorModel']),
              indicatorSerial: Value(sr['indicatorSerial']),
              approvalPrefix: Value(sr['approvalPrefix']),
              approvalNumber: Value(sr['approvalCode']),
              baseMake: Value(sr['baseMake']),
              baseModel: Value(sr['baseModel']),
              baseSerial: Value(sr['baseSerial']),
              baseApprovalPrefix: Value(sr['baseApprovalPrefix']),
              baseApprovalNumber: Value(sr['baseApprovalCode']),
              capacity: Value((sr['capacityValue'] ?? 0).toDouble()),
              capacityUnit: Value(sr['capacityUnit']),
              division: Value((sr['division'] ?? 0).toDouble()),
              numberOfLoadCells: Value(sr['numberOfLoadCells']),
              numberOfSections: Value(sr['numberOfSections']),
              loadCellModel: Value(sr['loadCellModel']),
              loadCellCapacity: Value((sr['loadCellCapacity'] ?? 0).toDouble()),
              loadCellCapacityUnit: Value(sr['loadCellCapacityUnit']),
              notes: const Value(null),
              auditFlag: const Value(false),
              deactivate: const Value(false),
              synced: const Value(false),
            ));

            await db.serviceReportDao.insertReport(ServiceReportsCompanion(
              workOrderId: Value(workOrderId),
              scaleId: Value(scaleId),
              reportType: Value('Standard'),
              notes: const Value(''),
              createdAt: Value(DateTime.tryParse(wo['createdAt']) ?? DateTime.now()),
              complete: const Value(true),
              synced: const Value(false),
            ));
          }
        }
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
