// File: lib/dev/seed_inventory.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/drift_providers.dart';
import '../data/database.dart';
import 'package:drift/drift.dart';

Future<void> seedInventory(AppDatabase db) async {
  final dao = db.inventoryDao;

  final jsonString = await rootBundle.loadString('assets/seed_inventory_items.json');
  final List<dynamic> jsonList = jsonDecode(jsonString);

  int success = 0;
  int failed = 0;

  for (final item in jsonList) {
    try {
      final entry = InventoryItemsCompanion(
        partNumber: Value(item['partNumber']),
        description: Value(item['description']),
        type: Value(item['type']),
        location: Value(item['location']),
        price: Value((item['price'] as num).toDouble()),
        quantity: Value(item['quantity']),
        isSold: Value(item['isSold']),
        make: Value(item['make']),
        model: Value(item['model']),
        serial: Value(item['serial']),
      );

      await dao.insertInventory(entry);
      success++;
    } catch (e) {
      print('❌ Failed: ${item['partNumber']} — $e');
      failed++;
    }
  }

  print('✅ Seed complete: $success inserted, $failed failed');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final db = container.read(databaseProvider);

  await seedInventory(db);
  await db.close();

  Future.delayed(const Duration(milliseconds: 500), () {
    print('👋 Done.');
  });
}
