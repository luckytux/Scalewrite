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

      final Map<int, int> workOrderIdMap = {};
      final Map<int, int> scaleIdMap = {};
      final Map<int, int> serviceReportIdMap = {};

      final List customers = data['customers'] ?? [];
      for (final c in customers) {
        await db.customerDao.insertCustomer(CustomersCompanion(
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
      }

      final List contacts = data['contacts'] ?? [];
      for (final ct in contacts) {
        await db.contactDao.insertContact(ContactsCompanion(
          customerId: Value(ct['customerId']),
          name: Value(ct['name']),
          phone: Value(ct['phone'] ?? ''),
          email: Value(ct['email'] ?? ''),
          notes: const Value(''),
          isMain: Value(ct['isMain'] ?? false),
          deactivate: const Value(false),
          auditFlag: const Value(false),
          synced: const Value(false),
        ));
      }

      final List workOrders = data['work_orders'] ?? [];
      for (final wo in workOrders) {
        final id = await db.workOrderDao.insertWorkOrder(WorkOrdersCompanion(
          customerId: Value(wo['customerId']),
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
          auditFlag: Value(wo['auditFlag']),
          synced: Value(wo['synced']),
          lastModified: Value(DateTime.tryParse(wo['lastModified']) ?? DateTime.now()),
        ));
        workOrderIdMap[wo['id']] = id;
      }

      final List scales = data['scales'] ?? [];
      for (final sc in scales) {
        final id = await db.scaleDao.insertScale(ScalesCompanion(
          customerId: Value(sc['customerId']),
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
          capacity: Value((sc['capacity'] ?? 0).toDouble()),
          capacityUnit: Value(sc['capacityUnit']),
          division: Value((sc['division'] ?? 0).toDouble()),
          numberOfLoadCells: Value(sc['numberOfLoadCells']),
          numberOfSections: Value(sc['numberOfSections']),
          loadCellModel: Value(sc['loadCellModel']),
          loadCellCapacity: Value((sc['loadCellCapacity'] ?? 0).toDouble()),
          loadCellCapacityUnit: Value(sc['loadCellCapacityUnit']),
          notes: Value(sc['notes'] ?? ''),
          legalForTrade: Value(sc['legalForTrade'] ?? false),
          inspectionExpiry: Value(DateTime.tryParse(sc['inspectionExpiry']) ?? DateTime.now()),
          sealStatus: Value(sc['sealStatus']),
          inspectionResult: Value(sc['inspectionResult']),
          auditFlag: const Value(false),
          deactivate: const Value(false),
          synced: const Value(false),
        ));
        scaleIdMap[sc['id']] = id;
      }

      final List serviceReports = data['service_reports'] ?? [];
      for (final sr in serviceReports) {
        final id = await db.serviceReportDao.insertReport(ServiceReportsCompanion(
          workOrderId: Value(workOrderIdMap[sr['workOrderId']] ?? 0),
          scaleId: Value(scaleIdMap[sr['scaleId']] ?? 0),
          reportType: Value(sr['reportType']),
          notes: Value(sr['notes']),
          createdAt: Value(DateTime.tryParse(sr['createdAt']) ?? DateTime.now()),
          complete: Value(sr['complete']),
          synced: Value(sr['synced']),
        ));
        serviceReportIdMap[sr['id']] = id;
      }

      final List weightTests = data['weight_tests'] ?? [];
      for (final wt in weightTests) {
        await db.weightTestDao.insertWeightTest(WeightTestsCompanion(
          serviceReportId: Value(serviceReportIdMap[wt['serviceReportId']] ?? 0),
          eccentricityType: Value(wt['eccentricityType']),
          eccentricityPoints: Value(wt['eccentricityPoints']),
          eccentricityDirections: Value(wt['eccentricityDirections']),
          eccentricity1: Value((wt['eccentricity1'] ?? 0).toDouble()),
          eccentricity2: Value((wt['eccentricity2'] ?? 0).toDouble()),
          eccentricity3: Value((wt['eccentricity3'] ?? 0).toDouble()),
          eccentricity4: Value((wt['eccentricity4'] ?? 0).toDouble()),
          eccentricityError: Value(wt['eccentricityError']),
          asFoundTest1: Value((wt['asFoundTest1'] ?? 0).toDouble()),
          asFoundRead1: Value((wt['asFoundRead1'] ?? 0).toDouble()),
          asFoundDiff1: Value((wt['asFoundDiff1'] ?? 0).toDouble()),
          asLeftTest1: Value((wt['asLeftTest1'] ?? 0).toDouble()),
          asLeftRead1: Value((wt['asLeftRead1'] ?? 0).toDouble()),
          asLeftDiff1: Value((wt['asLeftDiff1'] ?? 0).toDouble()),
          weightTestUnit: Value(wt['weightTestUnit']),
          timestamp: Value(DateTime.tryParse(wt['timestamp']) ?? DateTime.now()),
        ));
      }

      debugPrint('✅ Test data loaded successfully');
      loading = false;
      notifyListeners();
      return true;
    } catch (e, stack) {
      debugPrint('❌ Error loading test data: $e');
      debugPrint('$stack');
      loading = false;
      notifyListeners();
      return false;
    }
  }
}
