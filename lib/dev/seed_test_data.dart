// File: lib/dev/seed_test_data.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:drift/drift.dart' show Value, InsertMode;

import '../data/database.dart'; // AppDatabase

Future<void> seedTestData(AppDatabase db) async {
  // If there are already work orders OR service reports, assume we've seeded.
  final woExists = await (db.select(db.workOrders)..limit(1)).get();
  final srExists = await (db.select(db.serviceReports)..limit(1)).get();
  if (woExists.isNotEmpty || srExists.isNotEmpty) {
    // Already seeded — bail out quietly.
    return;
  }

  final jsonString = await rootBundle.loadString('assets/test_data.json');
  final Map<String, dynamic> data = jsonDecode(jsonString) as Map<String, dynamic>;

  // Province normalization
  const provinceMap = <String, String>{
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
    'Nunavut': 'NU',
  };
  String abbrev(String? full) => provinceMap[full?.trim() ?? ''] ?? (full ?? '');

  final List customers = (data['customers'] as List?) ?? const [];

  for (final c in customers) {
    final customerId = await db.customerDao.insertCustomer(CustomersCompanion(
      businessName: Value(c['businessName'] ?? c['name'] ?? ''),
      siteAddress: Value(c['siteAddress'] ?? ''),
      siteCity: Value(c['siteCity'] ?? ''),
      siteProvince: Value(abbrev(c['siteProvince'])),
      sitePostalCode: Value(c['sitePostalCode'] ?? ''),
      billingAddress: Value(c['billingAddress'] ?? c['siteAddress'] ?? ''),
      billingCity: Value(c['billingCity'] ?? c['siteCity'] ?? ''),
      billingProvince: Value(abbrev(c['billingProvince'] ?? c['siteProvince'])),
      billingPostalCode: Value(c['billingPostalCode'] ?? c['sitePostalCode'] ?? ''),
      gpsLocation: Value(c['gpsLocation'] ?? ''),
      notes: const Value(''),
      deactivate: const Value(false),
      auditFlag: const Value(false),
      synced: const Value(false),
    ));

    // Contacts
    for (final ct in (c['contacts'] as List?) ?? const []) {
      await db.contactDao.insertContact(ContactsCompanion(
        customerId: Value(customerId),
        name: Value(ct['name'] ?? ''),
        phone: Value((ct['phone'] ?? '').toString()),
        email: Value(ct['email'] ?? ''),
        notes: Value(ct['notes'] ?? ''),
        isMain: Value(ct['isMain'] ?? false),
        deactivate: const Value(false),
        auditFlag: const Value(false),
        synced: const Value(true),
      ));
    }

    // Scales (collect IDs to match service reports later)
    final scaleIds = <int>[];
    for (final sc in (c['scales'] as List?) ?? const []) {
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
      scaleIds.add(scaleId);
    }

    // Work orders (+ service reports + weight tests)
    for (final wo in (c['workOrders'] as List?) ?? const []) {
      final woId = await db.workOrderDao.insertWorkOrder(WorkOrdersCompanion(
        customerId: Value(customerId),
        workOrderNumber: Value(wo['workOrderNumber']),
        siteAddress: Value(wo['siteAddress']),
        siteCity: Value(wo['siteCity']),
        siteProvince: Value(abbrev(wo['siteProvince'])),
        sitePostalCode: Value(wo['sitePostalCode']),
        billingAddress: Value(wo['billingAddress']),
        billingCity: Value(wo['billingCity']),
        billingProvince: Value(abbrev(wo['billingProvince'])),
        billingPostalCode: Value(wo['billingPostalCode']),
        gpsLocation: Value(wo['gpsLocation']),
        customerNotes: Value(wo['customerNotes']),
        auditFlag: const Value(false),
        synced: const Value(false),
        lastModified: Value(DateTime.tryParse(wo['lastModified'] ?? '') ?? DateTime.now()),
      ));

      final srs = (wo['serviceReports'] as List?) ?? const [];
      for (var i = 0; i < srs.length; i++) {
        final sr = srs[i] as Map<String, dynamic>;

        // Choose scale: JSON can provide 'scaleIndex' (0-based). Otherwise rotate across scaleIds.
        int? chosenScaleId;
        if (sr['scaleIndex'] is int &&
            (sr['scaleIndex'] as int) >= 0 &&
            (sr['scaleIndex'] as int) < scaleIds.length) {
          chosenScaleId = scaleIds[sr['scaleIndex'] as int];
        } else if (scaleIds.isNotEmpty) {
          chosenScaleId = scaleIds[i % scaleIds.length];
        }

        // If no scales exist, skip SRs for this WO.
        if (chosenScaleId == null) continue;
        final int nonNullScaleId = chosenScaleId;

        // Insert service report; ignore if (work_order_id, scale_id) already present.
        final srId = await db.into(db.serviceReports).insert(
          ServiceReportsCompanion(
            workOrderId: Value(woId),
            scaleId: Value(nonNullScaleId),
            reportType: Value(sr['reportType']),
            notes: Value(sr['notes']),
            createdAt: Value(DateTime.tryParse(sr['createdAt'] ?? '') ?? DateTime.now()),
            complete: const Value(false),
            synced: const Value(false),
            ipoStateJson: sr['ipoStateJson'] is Map<String, dynamic>
                ? Value(sr['ipoStateJson'] as Map<String, dynamic>)
                : const Value.absent(),
          ),
          mode: InsertMode.insertOrIgnore, // 👈 prevents unique-index crashes
        );

        // If insert was ignored (duplicate), fetch the existing row id via Drift query.
        final existing = await (db.select(db.serviceReports)
              ..where((t) => t.workOrderId.equals(woId))
              ..where((t) => t.scaleId.equals(nonNullScaleId)))
            .getSingleOrNull();

        final effectiveSrId = srId == 0 ? (existing?.id ?? srId) : srId;

        // Weight tests
        for (final wt in (sr['weightTests'] as List?) ?? const []) {
          await db.weightTestDao.insertWeightTest(WeightTestsCompanion(
            serviceReportId: Value(effectiveSrId),
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
}
