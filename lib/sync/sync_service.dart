// File: lib/sync/sync_service.dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:scalewrite/data/database.dart';

/// Push-only sync for beta:
/// - Pushes unsynced WorkOrders (parents)
/// - Pushes unsynced ServiceReports (children)
/// - Bundles WeightTests for the SRs being pushed
/// - Includes Scales referenced by those SRs
/// - Marks ONLY the WorkOrders/ServiceReports we attempted as synced on success
///
/// Notes:
/// - WeightTests do NOT need a `synced` column; they ride with their SR.
/// - If there are unsynced WOs but no SRs, we still push those WOs alone.
class SyncService {
  final AppDatabase db;
  /// e.g. http://localhost:8080 (desktop) or http://10.0.2.2:8080 (Android emulator)
  final String baseUrl;

  SyncService(this.db, {this.baseUrl = 'http://localhost:8080'});

  /// Build a preview payload for the UI.
  Future<SyncPreview> buildPreview() async {
    // 1) Unsynced Work Orders (parents)
    final woRows = await db.customSelect(
      'SELECT * FROM work_orders WHERE synced = 0',
    ).get();
    final woMaps = woRows.map((r) => _jsonifyRow(r.data)).toList();
    final woIds = woMaps.map((m) => m['id']).whereType<int>().toList(growable: false);

    // 2) Unsynced Service Reports (children)
    final srRows = await db.customSelect(
      'SELECT * FROM service_reports WHERE synced = 0',
    ).get();
    final srMaps = srRows.map((r) => _jsonifyRow(r.data)).toList();
    final srIds = srMaps.map((m) => m['id']).whereType<int>().toList(growable: false);

    // 3) WeightTests for the SRs we are sending
    final wtMaps = <Map<String, Object?>>[];
    if (srIds.isNotEmpty) {
      final idsList = srIds.join(',');
      final wtRows = await db.customSelect(
        'SELECT * FROM weight_tests WHERE service_report_id IN ($idsList)',
      ).get();
      wtMaps.addAll(wtRows.map((r) => _jsonifyRow(r.data)));
    }

    // 4) Scales referenced by the SRs we are sending
    final scaleIds = srMaps
        .map((m) => m['scale_id'])
        .whereType<int>()
        .toSet()
        .toList(growable: false);

    final scaleMaps = scaleIds.isEmpty
        ? <Map<String, Object?>>[]
        : (await db
                .customSelect('SELECT * FROM scales WHERE id IN (${scaleIds.join(',')})')
                .get())
            .map((r) => _jsonifyRow(r.data))
            .toList();

    // 5) Assemble payload
    final payload = <String, dynamic>{
      'work_orders': woMaps,
      'service_reports': srMaps,
      'weight_tests': wtMaps,
      'scales': scaleMaps,
    };

    final counts = <String, int>{
      'work_orders': woMaps.length,
      'service_reports': srMaps.length,
      'weight_tests': wtMaps.length,
      'scales': scaleMaps.length,
    };

    final pretty = const JsonEncoder.withIndent('  ').convert(payload);

    return SyncPreview(
      counts: counts,
      jsonPretty: pretty,
      rawPayload: payload,
      woIds: woIds,
      srIds: srIds,
    );
  }

  /// POST the preview payload; on success mark only the pushed WOs / SRs as synced.
  Future<SyncResult> push(SyncPreview preview) async {
    // Nothing to do?
    if (preview.woIds.isEmpty && preview.srIds.isEmpty) {
      return SyncResult.ok();
    }

    final uri = Uri.parse('$baseUrl/sync/push');

    try {
      final client = HttpClient();
      final req = await client.postUrl(uri);
      req.headers.set('Content-Type', 'application/json');
      req.add(utf8.encode(jsonEncode(preview.rawPayload)));
      final resp = await req.close();
      final status = resp.statusCode;
      final body = await resp.transform(utf8.decoder).join();
      client.close(force: true);

      if (status < 200 || status >= 300) {
        return SyncResult.error('Server responded $status: $body');
      }

      // Mark ONLY what we attempted as synced
      if (preview.woIds.isNotEmpty) {
        final ids = preview.woIds.join(',');
        await db.customStatement('UPDATE work_orders SET synced = 1 WHERE id IN ($ids)');
      }
      if (preview.srIds.isNotEmpty) {
        final ids = preview.srIds.join(',');
        await db.customStatement('UPDATE service_reports SET synced = 1 WHERE id IN ($ids)');
      }

      return SyncResult.ok();
    } catch (e) {
      return SyncResult.error('Push failed: $e');
    }
  }

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

class SyncPreview {
  final Map<String, int> counts;
  final String jsonPretty;
  final Map<String, dynamic> rawPayload;

  /// Track which WOs/SRs we’ll mark as synced on success.
  final List<int> woIds;
  final List<int> srIds;

  const SyncPreview({
    required this.counts,
    required this.jsonPretty,
    required this.rawPayload,
    required this.woIds,
    required this.srIds,
  });

  int get total => counts.values.fold(0, (a, b) => a + b);
}

class SyncResult {
  final bool success;
  final String? message;

  const SyncResult._(this.success, this.message);
  factory SyncResult.ok() => const SyncResult._(true, null);
  factory SyncResult.error(String msg) => SyncResult._(false, msg);
}
