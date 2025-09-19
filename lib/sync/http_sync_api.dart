// File: lib/sync/http_sync_api.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'sync_models.dart';
import 'sync_repository.dart';

/// Minimal HTTP implementation of SyncApi.
/// POSTs payload to {baseUrl}/sync/push
class HttpSyncApi implements SyncApi {
  final String baseUrl;

  /// For Android emulator use http://10.0.2.2:8080
  /// For real device on LAN, use your PC's LAN IP, e.g. http://192.168.1.50:8080
  const HttpSyncApi({this.baseUrl = 'http://localhost:8080'});

  @override
  Future<bool> send(SyncPayload payload) async {
    final uri = Uri.parse('$baseUrl/sync/push');
    try {
      final client = HttpClient();
      client.connectionTimeout = const Duration(seconds: 10);

      final req = await client.postUrl(uri);
      req.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
      req.add(utf8.encode(payload.toPrettyJson())); // same JSON you preview

      final resp = await req.close();
      final body = await resp.transform(utf8.decoder).join();
      client.close(force: true);

      if (resp.statusCode >= 200 && resp.statusCode < 300) {
        if (kDebugMode) {
          debugPrint('✅ Server OK (${resp.statusCode}): $body');
        }
        return true;
      } else {
        if (kDebugMode) {
          debugPrint('❌ Server ${resp.statusCode}: $body');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) debugPrint('❌ HTTP sync failed: $e');
      return false;
    }
  }
}
