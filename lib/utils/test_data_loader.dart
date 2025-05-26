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

  final Map<String, String> _provinceMap = {
    'Alberta': 'AB',
    'British Columbia': 'BC',
    'Saskatchewan': 'SK',
    'Manitoba': 'MB',
    'Ontario': 'ON',
    'Quebec': 'QC',
    'New Brunswick': 'NB',
    'Nova Scotia': 'NS',
    'Prince Edward Island': 'PE',
    'Newfoundland and Labrador': 'NL',
    'Yukon': 'YT',
    'Northwest Territories': 'NT',
    'Nunavut': 'NU'
  };

  String _abbrev(String? fullName) => _provinceMap[fullName?.trim() ?? ''] ?? fullName ?? '';

  Future<bool> loadTestData() async {
    loading = true;
    notifyListeners();

    try {
      final jsonString = await rootBundle.loadString('assets/test_data.json');
      final Map<String, dynamic> data = jsonDecode(jsonString);
      final db = ref.read(databaseProvider);

      await db.delete(db.weightTests).go();
      await db.delete(db.serviceReports).go();
      await db.delete(db.scales).go();
      await db.delete(db.workOrders).go();
      await db.delete(db.contacts).go();
      await db.delete(db.customers).go();

      int scaleIndex = 1;
      int workOrderIndex = 1;
      int serviceReportIndex = 1;

      final List customers = data['customers'] ?? [];
      for (final c in customers) {
        final customerId = await db.customerDao.insertCustomer(CustomersCompanion(
          businessName: Value(c['businessName'] ?? c['name'] ?? ''),
          siteAddress: Value(c['siteAddress'] ?? ''),
          siteCity: Value(c['siteCity'] ?? ''),
          siteProvince: Value(_abbrev(c['siteProvince'])),
          sitePostalCode: Value(c['sitePostalCode'] ?? ''),
          billingAddress: Value(c['billingAddress'] ?? c['siteAddress'] ?? ''),
          billingCity: Value(c['billingCity'] ?? c['siteCity'] ?? ''),
          billingProvince: Value(_abbrev(c['billingProvince'] ?? c['siteProvince'])),
          billingPostalCode: Value(c['billingPostalCode'] ?? c['sitePostalCode'] ?? ''),
          gpsLocation: Value(c['gpsLocation'] ?? ''),
          notes: const Value(''),
          deactivate: const Value(false),
          auditFlag: const Value(false),
          synced: const Value(false),
        ));

        final List contacts = c['contacts'] ?? [];
        for (final ct in contacts) {
          await db.contactDao.insertContact(ContactsCompanion(
            customerId: Value(customerId),
            name: Value(ct['name']),
            phone: Value(ct['phone']?.toString() ?? ''),
            email: Value(ct['email'] ?? ''),
            notes: Value(ct['notes'] ?? ''),
            isMain: Value(ct['isMain'] ?? false),
            deactivate: const Value(false),
            auditFlag: const Value(false),
            synced: const Value(true),
          ));
        }

        final List scales = c['scales'] ?? [];
        final List<int> insertedScaleIds = [];
        for (final sc in scales) {
          final scaleId = await db.scaleDao.insertScale(ScalesCompanion(
            customerId: Value(customerId),
            configuration: Value(sc['configuration']),
            scaleType: Value(sc['scaleType']),
            scaleSubtype: Value(sc['scaleSubtype']),
            customTypeDescription: Value(sc['customTypeDescription']),
            indicatorMake: Value(sc['indicatorMake']),
            indicatorModel: Value(sc['indicatorModel']),
            indicatorSerial: Value(sc['indicatorSerial']),
            approvalPrefix: Value(sc['approvalPrefix']),
            approvalNumber: Value(sc['approvalNumber']),
            baseMake: Value(sc['baseMake']),
            baseModel: Value(sc['baseModel']),
            baseSerial: Value(sc['baseSerial']),
            baseApprovalPrefix: Value(sc['baseApprovalPrefix']),
            baseApprovalNumber: Value(sc['baseApprovalNumber']),
            capacity: Value((sc['capacity'] as num?)?.toDouble() ?? 0),
            capacityUnit: Value(sc['capacityUnit']),
            division: Value((sc['division'] as num?)?.toDouble() ?? 0),
            numberOfLoadCells: Value(sc['numberOfLoadCells']),
            numberOfSections: Value(sc['numberOfSections']),
            loadCellModel: Value(sc['loadCellModel']),
            loadCellCapacity: Value((sc['loadCellCapacity'] as num?)?.toDouble() ?? 0),
            loadCellCapacityUnit: Value(sc['loadCellCapacityUnit']),
            notes: Value(sc['notes'] ?? ''),
            legalForTrade: Value(sc['legalForTrade'] ?? false),
            inspectionExpiry: Value(DateTime.tryParse(sc['inspectionExpiry'] ?? '') ?? DateTime.now()),
            sealStatus: Value(sc['sealStatus']),
            inspectionResult: Value(sc['inspectionResult']),
            auditFlag: const Value(false),
            deactivate: const Value(false),
            synced: const Value(true),
          ));
          insertedScaleIds.add(scaleId);
          scaleIndex++;
        }

        final List workOrders = c['workOrders'] ?? [];
        for (final wo in workOrders) {
          final woId = await db.workOrderDao.insertWorkOrder(WorkOrdersCompanion(
            customerId: Value(customerId),
            workOrderNumber: Value(wo['workOrderNumber']),
            siteAddress: Value(wo['siteAddress']),
            siteCity: Value(wo['siteCity']),
            siteProvince: Value(_abbrev(wo['siteProvince'])),
            sitePostalCode: Value(wo['sitePostalCode']),
            billingAddress: Value(wo['billingAddress']),
            billingCity: Value(wo['billingCity']),
            billingProvince: Value(_abbrev(wo['billingProvince'])),
            billingPostalCode: Value(wo['billingPostalCode']),
            gpsLocation: Value(wo['gpsLocation']),
            customerNotes: Value(wo['customerNotes']),
            auditFlag: const Value(false),
            synced: const Value(false),
            lastModified: Value(DateTime.tryParse(wo['lastModified'] ?? '') ?? DateTime.now()),
          ));
          workOrderIndex++;

          final List reports = wo['serviceReports'] ?? [];
          for (final sr in reports) {
            final srId = await db.serviceReportDao.insertReport(ServiceReportsCompanion(
              workOrderId: Value(woId),
              scaleId: Value(insertedScaleIds.first),
              reportType: Value(sr['reportType']),
              notes: Value(sr['notes']),
              createdAt: Value(DateTime.tryParse(sr['createdAt'] ?? '') ?? DateTime.now()),
              complete: const Value(false),
              synced: const Value(false),
            ));
            serviceReportIndex++;

            final List weightTests = sr['weightTests'] ?? [];
            for (final wt in weightTests) {
              await db.weightTestDao.insertWeightTest(WeightTestsCompanion(
                serviceReportId: Value(srId),
                eccentricityType: Value(wt['eccentricityType']),
                eccentricityPoints: Value(wt['eccentricityPoints']),
                eccentricityDirections: Value(wt['eccentricityDirections']),
                eccentricity1: Value((wt['eccentricity1'] as num?)?.toDouble() ?? 0),
                eccentricity2: Value((wt['eccentricity2'] as num?)?.toDouble() ?? 0),
                eccentricity3: Value((wt['eccentricity3'] as num?)?.toDouble() ?? 0),
                eccentricity4: Value((wt['eccentricity4'] as num?)?.toDouble() ?? 0),
                eccentricityError: Value(wt['eccentricityError']),
                asFoundTest1: Value((wt['asFoundTest1'] as num?)?.toDouble() ?? 0),
                asFoundRead1: Value((wt['asFoundRead1'] as num?)?.toDouble() ?? 0),
                asFoundDiff1: Value((wt['asFoundDiff1'] as num?)?.toDouble() ?? 0),
                asLeftTest1: Value((wt['asLeftTest1'] as num?)?.toDouble() ?? 0),
                asLeftRead1: Value((wt['asLeftRead1'] as num?)?.toDouble() ?? 0),
                asLeftDiff1: Value((wt['asLeftDiff1'] as num?)?.toDouble() ?? 0),
                weightTestUnit: Value(wt['weightTestUnit']),
                timestamp: Value(DateTime.tryParse(wt['timestamp'] ?? '') ?? DateTime.now()),
              ));
            }
          }
        }
      }

      debugPrint('✅ Test data loaded successfully');
      loading = false;
      notifyListeners();
      return true;
    } catch (e, stack) {
      debugPrint('❌ Error loading test data: \$e');
      debugPrint(stack.toString());
      loading = false;
      notifyListeners();
      return false;
    }
  }
}