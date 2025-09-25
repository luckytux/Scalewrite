// File: lib/providers/sync_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite/providers/drift_providers.dart';
import 'package:scalewrite/sync/sync_service.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  final db = ref.read(databaseProvider);
  // TODO: set your real server URL here when ready
  return SyncService(db, baseUrl: 'http://localhost:8080');
});
