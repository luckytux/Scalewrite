// File: lib/providers/inventory_provider.dart

import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/daos/inventory_dao.dart';
import '../data/tables/inventory_items.dart';
import 'drift_providers.dart';

// ✅ DAO Provider (used by the ChangeNotifierProvider)
final inventoryDaoProvider = Provider<InventoryDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.inventoryDao;
});

// ✅ InventoryProvider handles inventory operations and state
class InventoryProvider extends ChangeNotifier {
  final InventoryDao dao;

  InventoryProvider(this.dao);

  List<InventoryItem> _items = [];
  List<InventoryItem> get items => _items;

  List<InventoryItem> _filtered = [];
  List<InventoryItem> get filteredItems => _filtered;

  bool isLoading = false;

  Future<void> loadInventory() async {
    isLoading = true;
    notifyListeners();

    _items = await dao.getAllInventory();
    _filtered = List.from(_items);

    isLoading = false;
    notifyListeners();
  }

  Future<void> addInventory(InventoryItemsCompanion newItem) async {
    await dao.insertInventory(newItem);
    await loadInventory();
  }

  Future<void> updateInventory(InventoryItem item) async {
    await dao.updateInventory(item);
    await loadInventory();
  }

  Future<void> deleteInventory(int itemId) async {
    await dao.deleteInventory(itemId);
    await loadInventory();
  }

  /// ✅ Mark item as sold — now includes userId for tracking who performed the transaction
  Future<void> markItemAsSold({
    required int itemId,
    required int customerId,
    required int workOrderId,
    required int userId, // 🆕 Added required userId
    String? note,
  }) async {
    await dao.markAsSold(
      itemId: itemId,
      customerId: customerId,
      workOrderId: workOrderId,
      userId: userId, // 🆕 Pass the userId to the DAO method
      note: note,
    );
    await loadInventory();
  }

  void search(String query) {
    final q = query.toLowerCase();
    _filtered = _items.where((item) {
      return item.partNumber.toLowerCase().contains(q) ||
          item.description.toLowerCase().contains(q) ||
          (item.type?.toLowerCase().contains(q) ?? false) ||
          (item.barcode?.toLowerCase().contains(q) ?? false);
    }).toList();
    notifyListeners();
  }

  void filterByType(String? type) {
    if (type == null || type.isEmpty) {
      _filtered = List.from(_items);
    } else {
      _filtered = _items
          .where((item) => item.type?.toLowerCase() == type.toLowerCase())
          .toList();
    }
    notifyListeners();
  }

  void filterByStockStatus({bool? sold, bool lowStock = false}) {
    _filtered = _items.where((item) {
      final matchSold = sold == null || item.isSold == sold;
      final matchLow = !lowStock || item.quantity <= 5;
      return matchSold && matchLow;
    }).toList();
    notifyListeners();
  }

  /// Export inventory as CSV string
  Future<String> exportInventoryToCsv({bool includeSold = true}) async {
    final itemsToExport =
        includeSold ? _items : _items.where((item) => !item.isSold).toList();

    final csvBuffer = StringBuffer();
    csvBuffer.writeln(
        'ID,Part Number,Description,Type,Quantity,Location,Barcode,Is Sold,Customer ID,Work Order ID,Price,Make,Model,Serial,Last Modified');

    for (final item in itemsToExport) {
      csvBuffer.writeln(
        '${item.id},${item.partNumber},${item.description},${item.type ?? ''},${item.quantity},'
        '${item.location ?? ''},${item.barcode ?? ''},${item.isSold},${item.customerId ?? ''},'
        '${item.workOrderId ?? ''},${item.price ?? ''},${item.make ?? ''},${item.model ?? ''},${item.serial ?? ''},'
        '${item.lastModified}',
      );
    }

    return csvBuffer.toString();
  }
}

// ✅ Global Provider for UI integration (ManageInventoryPage)
final inventoryProvider = ChangeNotifierProvider<InventoryProvider>((ref) {
  final dao = ref.watch(inventoryDaoProvider);
  return InventoryProvider(dao);
});
