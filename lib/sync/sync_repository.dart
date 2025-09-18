// File: lib/sync/sync_repository.dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;

import '../data/database.dart';
import '../providers/drift_providers.dart';
import 'sync_models.dart';

/// Simple API facade (stubbed for now). Swap with real HTTP later.
abstract class SyncApi {
  Future<bool> send(SyncPayload payload);
}

/// Logs the payload and returns success (no network).
class DebugLogSyncApi implements SyncApi {
  @override
  Future<bool> send(SyncPayload payload) async {
    debugPrint('🛰️ PUSH PAYLOAD:\n${payload.toPrettyJson()}');
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return true;
  }
}

final syncApiProvider = Provider<SyncApi>((ref) => DebugLogSyncApi());

class SyncRepository {
  final AppDatabase db;
  final SyncApi api;

  SyncRepository({required this.db, required this.api});

  /// Count unsynced rows for the preview UI.
  Future<SyncPreview> getPreview() async {
    // WorkOrders (unsynced)
    final woCountExp = db.workOrders.id.count();
    final woCount = await (db.selectOnly(db.workOrders)
          ..addColumns([woCountExp])
          ..where(db.workOrders.synced.equals(false)))
        .map((row) => row.read(woCountExp) ?? 0)
        .getSingle();

    // ServiceReports (unsynced)
    final srCountExp = db.serviceReports.id.count();
    final srCount = await (db.selectOnly(db.serviceReports)
          ..addColumns([srCountExp])
          ..where(db.serviceReports.synced.equals(false)))
        .map((row) => row.read(srCountExp) ?? 0)
        .getSingle();

    // WeightTests count for UNSYNCED service reports only (no synced flag on WT).
    final unsyncedSrIds = await (db.selectOnly(db.serviceReports)
          ..addColumns([db.serviceReports.id])
          ..where(db.serviceReports.synced.equals(false)))
        .map((row) => row.read(db.serviceReports.id)!)
        .get();

    int wtCount = 0;
    if (unsyncedSrIds.isNotEmpty) {
      final wtCountExp = db.weightTests.id.count();
      wtCount = await (db.selectOnly(db.weightTests)
            ..addColumns([wtCountExp])
            ..where(db.weightTests.serviceReportId.isIn(unsyncedSrIds)))
          .map((row) => row.read(wtCountExp) ?? 0)
          .getSingle();
    }

    return SyncPreview(
      workOrders: woCount,
      serviceReports: srCount,
      weightTests: wtCount,
    );
  }

  /// Build the JSON we will push (WO, SR, WT only).
  Future<SyncPayload> buildPayload() async {
    // WorkOrders (unsynced)
    final unsyncedWOs = await (db.select(db.workOrders)
          ..where((t) => t.synced.equals(false)))
        .get();

    // ServiceReports (unsynced)
    final unsyncedSRs = await (db.select(db.serviceReports)
          ..where((t) => t.synced.equals(false)))
        .get();

    // WeightTests for those unsynced ServiceReports
    final srIds = unsyncedSRs.map((s) => s.id).toList();
    final relatedWTs = srIds.isEmpty
        ? <WeightTest>[]
        : await (db.select(db.weightTests)
              ..where((t) => t.serviceReportId.isIn(srIds)))
            .get();

    // Map rows -> JSON
    final woMaps = unsyncedWOs.map((w) {
      return {
        'id': w.id,
        'customerId': w.customerId,
        'workOrderNumber': w.workOrderNumber,
        'siteAddress': w.siteAddress,
        'siteCity': w.siteCity,
        'siteProvince': w.siteProvince,
        'sitePostalCode': w.sitePostalCode,
        'gpsLocation': w.gpsLocation,
        'billingAddress': w.billingAddress,
        'billingCity': w.billingCity,
        'billingProvince': w.billingProvince,
        'billingPostalCode': w.billingPostalCode,
        'customerNotes': w.customerNotes,
      };
    }).toList();

    final srMaps = unsyncedSRs.map((s) {
      return {
        'id': s.id,
        'workOrderId': s.workOrderId,
        'scaleId': s.scaleId,
        'notes': s.notes,
      };
    }).toList();

    // Keep WeightTests minimal (don’t assume extra columns).
    final wtMaps = relatedWTs.map((t) {
      return {
        'id': t.id,
        'serviceReportId': t.serviceReportId,
      };
    }).toList();

    return SyncPayload(
      workOrders: woMaps,
      serviceReports: srMaps,
      weightTests: wtMaps,
    );
  }

  /// Push and mark synced on success (WO + SR only).
  Future<bool> pushNow() async {
    final preview = await getPreview();
    if (!preview.hasAnything) return true;

    final payload = await buildPayload();
    final ok = await api.send(payload);
    if (!ok) return false;

    // Mark the pushed records as synced (WO + SR).
    await db.transaction(() async {
      // Work Orders
      final woIds = payload.workOrders.map((m) => m['id'] as int).toList();
      if (woIds.isNotEmpty) {
        await (db.update(db.workOrders)
              ..where((t) => t.id.isIn(woIds)))
            .write(const WorkOrdersCompanion(synced: drift.Value(true)));
      }
      // Service Reports
      final srIds = payload.serviceReports.map((m) => m['id'] as int).toList();
      if (srIds.isNotEmpty) {
        await (db.update(db.serviceReports)
              ..where((t) => t.id.isIn(srIds)))
            .write(const ServiceReportsCompanion(synced: drift.Value(true)));
      }
      // WeightTests: no synced flag; nothing to update here.
    });

    return true;
  }
}

final syncRepositoryProvider = Provider<SyncRepository>((ref) {
  final db = ref.read(databaseProvider);
  final api = ref.read(syncApiProvider);
  return SyncRepository(db: db, api: api);
});
