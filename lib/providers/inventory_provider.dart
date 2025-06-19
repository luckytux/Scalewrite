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

class InventoryProvider extends ChangeNotifier {
  final InventoryDao dao;

  InventoryProvider(this.dao);

  List<InventoryItem> _items = [];
  List<InventoryItem> get items => _items;

  List<InventoryItem> _filtered = [];
  List<InventoryItem> get filteredItems => _filtered;

  String _searchQuery = '';
  String _filterType = '';
  String _filterLocation = '';
  bool? _filterSold;

  bool isLoading = false;

  Future<void> loadInventory() async {
    isLoading = true;
    notifyListeners();

    _items = await dao.getAllInventory();

    print('📦 Loaded ${_items.length} inventory items:');
    for (final item in _items) {
      print('  - ${item.id}: ${item.partNumber}, ${item.type}, ${item.location}, sold=${item.isSold}');
    }

    _applyFilters();

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

  Future<void> markItemAsSold({
    required int itemId,
    required int customerId,
    required int workOrderId,
    required int userId,
    String? note,
  }) async {
    await dao.markAsSold(
      itemId: itemId,
      customerId: customerId,
      workOrderId: workOrderId,
      userId: userId,
      note: note,
    );
    await loadInventory();
  }

  void search(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilters();
  }

  void filterByType(String? type) {
    _filterType = type ?? '';
    _applyFilters();
  }

  void filterByLocation(String? location) {
    _filterLocation = location ?? '';
    _applyFilters();
  }

  void filterBySoldStatus(bool? sold) {
    _filterSold = sold;
    _applyFilters();
  }

  void _applyFilters() {
    print('🔍 Applying Filters:');
    print('- Search Query: "$_searchQuery"');
    print('- Type Filter: "$_filterType"');
    print('- Location Filter: "$_filterLocation"');
    print('- Sold Filter: $_filterSold');
    print('- Total Items Before Filter: ${_items.length}');

    _filtered = _items.where((item) {
      final matchesSearch =
          _searchQuery.isEmpty ||
          item.partNumber.toLowerCase().contains(_searchQuery) ||
          item.description.toLowerCase().contains(_searchQuery) ||
          (item.type ?? '').toLowerCase().contains(_searchQuery) ||
          (item.barcode ?? '').toLowerCase().contains(_searchQuery) ||
          (item.make ?? '').toLowerCase().contains(_searchQuery) ||
          (item.model ?? '').toLowerCase().contains(_searchQuery);

      final matchesType = _filterType.isEmpty ||
          (item.type?.toLowerCase() == _filterType.toLowerCase());

      final matchesLocation = _filterLocation.isEmpty ||
          (item.location?.toLowerCase() == _filterLocation.toLowerCase());

      final matchesSold = _filterSold == null || item.isSold == _filterSold;

      final result = matchesSearch && matchesType && matchesLocation && matchesSold;

      print('🔎 [${item.partNumber}] => '
            'search: $matchesSearch, type: $matchesType, '
            'location: $matchesLocation, sold: $matchesSold => result: $result');

      return result;
    }).toList();

    print('- Filtered Count After: ${_filtered.length}');
    notifyListeners();
  }

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
