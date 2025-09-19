// File: lib/sync/sync_repository.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../providers/drift_providers.dart';
import 'sync_models.dart';

/// ---- Toggle / configuration -------------------------------------------------

/// Flip this to `true` when you want to POST to a server instead of just logging.
const bool kUseHttpSync = false;

/// Change this when you have a central server or when testing on device/emulator.
/// - Windows app on same PC as server: http://localhost:8080
/// - Android emulator:                  http://10.0.2.2:8080
/// - Android phone on same LAN:         http://<PC-LAN-IP>:8080
final syncBaseUrlProvider = Provider<String>((ref) => 'http://localhost:8080');

/// ---- API facades ------------------------------------------------------------

abstract class SyncApi {
  Future<bool> send(SyncPayload payload);
}

/// Logs the payload and returns success (no network).
class DebugLogSyncApi implements SyncApi {
  @override
  Future<bool> send(SyncPayload payload) async {
    debugPrint('🛰️ PUSH PAYLOAD (debug only):\n${payload.toPrettyJson()}');
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return true;
  }
}

/// Basic HTTP client using dart:io HttpClient (no extra dependency).
/// Expects a POST /sync/push that returns 2xx on success.
class HttpSyncApi implements SyncApi {
  final String baseUrl;
  HttpSyncApi(this.baseUrl);

  @override
  Future<bool> send(SyncPayload payload) async {
    final uri = Uri.parse('$baseUrl/sync/push');
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 10);
    try {
      final req = await client.postUrl(uri);
      req.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      req.add(utf8.encode(jsonEncode(payload.toJson())));
      final resp = await req.close();
      if (resp.statusCode >= 200 && resp.statusCode < 300) return true;

      final body = await resp.transform(utf8.decoder).join();
      debugPrint('❌ Sync server responded ${resp.statusCode}: $body');
      return false;
    } catch (e) {
      debugPrint('❌ Sync HTTP error: $e');
      return false;
    } finally {
      client.close(force: true);
    }
  }
}

/// Pick Debug or HTTP based on the toggle above.
final syncApiProvider = Provider<SyncApi>((ref) {
  if (kUseHttpSync) {
    final baseUrl = ref.watch(syncBaseUrlProvider);
    return HttpSyncApi(baseUrl);
    }
  return DebugLogSyncApi();
});

/// ---- Repository -------------------------------------------------------------

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

  /// Build the JSON we will push (WO, SR, WT only), including ALL columns via `SELECT *`.
  Future<SyncPayload> buildPayload() async {
    // WorkOrders (unsynced) — SELECT *
    final woRows = await db
        .customSelect('SELECT * FROM work_orders WHERE synced = 0')
        .get();
    final workOrders = woRows.map((r) => _jsonifyRow(r.data)).toList();

    // ServiceReports (unsynced) — SELECT *
    final srRows = await db
        .customSelect('SELECT * FROM service_reports WHERE synced = 0')
        .get();
    final serviceReports = srRows.map((r) => _jsonifyRow(r.data)).toList();

    // WeightTests for those unsynced ServiceReports — SELECT *
    final srIds = serviceReports
        .map((m) => m['id'])
        .whereType<int>()
        .toList(growable: false);

    List<Map<String, Object?>> weightTests = const [];
    if (srIds.isNotEmpty) {
      final idList = srIds.join(',');
      final wtRows = await db
          .customSelect(
              'SELECT * FROM weight_tests WHERE service_report_id IN ($idList)')
          .get();
      weightTests = wtRows.map((r) => _jsonifyRow(r.data)).toList();
    }

    return SyncPayload(
      workOrders: workOrders,
      serviceReports: serviceReports,
      weightTests: weightTests,
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
      final woIds = payload.workOrders
          .map((m) => m['id'])
          .whereType<int>()
          .toList(growable: false);
      if (woIds.isNotEmpty) {
        await (db.update(db.workOrders)..where((t) => t.id.isIn(woIds)))
            .write(const WorkOrdersCompanion(synced: drift.Value(true)));
      }

      // Service Reports
      final srIds = payload.serviceReports
          .map((m) => m['id'])
          .whereType<int>()
          .toList(growable: false);
      if (srIds.isNotEmpty) {
        await (db.update(db.serviceReports)..where((t) => t.id.isIn(srIds)))
            .write(const ServiceReportsCompanion(synced: drift.Value(true)));
      }
      // WeightTests: no synced flag; nothing to update here.
    });

    return true;
  }

  // ---- helpers ---------------------------------------------------------------

  /// Make row JSON-safe: DateTime -> ISO, blobs -> base64, others unchanged.
  Map<String, Object?> _jsonifyRow(Map<String, Object?> raw) {
    final out = <String, Object?>{};
    raw.forEach((k, v) {
      if (v is DateTime) {
        out[k] = v.toIso8601String();
      } else if (v is Uint8List) {
        out[k] = base64Encode(v);
      } else {
        out[k] = v;
      }
    });
    return out;
  }
}

final syncRepositoryProvider = Provider<SyncRepository>((ref) {
  final db = ref.read(databaseProvider);
  final api = ref.read(syncApiProvider);
  return SyncRepository(db: db, api: api);
});
