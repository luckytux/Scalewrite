// File: lib/pages/admin/manage_inventory_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../providers/inventory_provider.dart';
import '../../widgets/common/rounded_dropdown_field.dart';
import '../../widgets/common/rounded_text_field.dart';
import '../../widgets/inventory/add_inventory_dialog.dart';

class ManageInventoryPage extends ConsumerStatefulWidget {
  const ManageInventoryPage({super.key});

  @override
  ConsumerState<ManageInventoryPage> createState() => _ManageInventoryPageState();
}

class _ManageInventoryPageState extends ConsumerState<ManageInventoryPage> {
  String _filterType = '';
  final TextEditingController _searchController = TextEditingController();

  int? _sortColumnIndex;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(inventoryProvider).loadInventory();
    });
  }

  void _openAddInventoryDialog({bool isDuplicate = false, InventoryItem? lastItem}) {
    showDialog(
      context: context,
      builder: (_) => AddInventoryDialog(
        isDuplicate: isDuplicate,
        lastItem: lastItem,
      ),
    );
  }

  void _sort<T>(
    List<InventoryItem> items,
    Comparable<T> Function(InventoryItem d) getField,
    int columnIndex,
    bool ascending,
  ) {
    items.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(inventoryProvider);
    final items = [...controller.filteredItems]; // clone for sort safety

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RoundedTextField(
                    controller: _searchController,
                    label: 'Search',
                    onChanged: (value) => controller.search(value),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RoundedDropdownField<String>(
                    label: 'Type',
                    value: _filterType,
                    onChanged: (value) {
                      setState(() => _filterType = value ?? '');
                      controller.filterByType(value);
                    },
                    items: const [
                      DropdownMenuItem(value: '', child: Text('All')),
                      DropdownMenuItem(value: 'Equipment', child: Text('Equipment')),
                      DropdownMenuItem(value: 'Loadcell', child: Text('Loadcell')),
                      DropdownMenuItem(value: 'Indicator', child: Text('Indicator')),
                      DropdownMenuItem(value: 'Remote', child: Text('Remote')),
                      DropdownMenuItem(value: 'Printer', child: Text('Printer')),
                      DropdownMenuItem(value: 'Program', child: Text('Program')),
                      DropdownMenuItem(value: 'Test Weight', child: Text('Test Weight')),
                      DropdownMenuItem(value: 'Weighbar', child: Text('Weighbar')),
                      DropdownMenuItem(value: 'Part', child: Text('Part')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  onPressed: () => _openAddInventoryDialog(),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.compare_arrows),
                  label: const Text('Transfer'),
                  onPressed: () {
                    // Transfer dialog logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: items.isEmpty
                  ? const Center(child: Text('No items found.'))
                  : SingleChildScrollView(
                      child: PaginatedDataTable(
                        header: const Text('Inventory Items'),
                        sortColumnIndex: _sortColumnIndex,
                        sortAscending: _sortAscending,
                        rowsPerPage: 10,
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(
                            label: const Text('Part#'),
                            onSort: (index, ascending) =>
                                _sort(items, (d) => d.partNumber, index, ascending),
                          ),
                          DataColumn(
                            label: const Text('Description'),
                            onSort: (index, ascending) =>
                                _sort(items, (d) => d.description, index, ascending),
                          ),
                          DataColumn(
                            label: const Text('Type'),
                            onSort: (index, ascending) =>
                                _sort(items, (d) => d.type ?? '', index, ascending),
                          ),
                          const DataColumn(label: Text('Make')),
                          const DataColumn(label: Text('Model')),
                          const DataColumn(label: Text('Serial')),
                          const DataColumn(label: Text('Qty')),
                          const DataColumn(label: Text('Location')),
                          DataColumn(
                            label: const Text('Price'),
                            numeric: true,
                            onSort: (index, ascending) =>
                                _sort(items, (d) => d.price ?? 0, index, ascending),
                          ),
                        ],
                        source: InventoryDataSource(items),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryDataSource extends DataTableSource {
  final List<InventoryItem> items;

  InventoryDataSource(this.items);

  @override
  DataRow? getRow(int index) {
    if (index >= items.length) return null;
    final item = items[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(item.partNumber)),
        DataCell(Text(item.description)),
        DataCell(Text(item.type ?? '')),
        DataCell(Text(item.make ?? '')),
        DataCell(Text(item.model ?? '')),
        DataCell(Text(item.serial ?? '')),
        DataCell(Text(item.quantity.toString())),
        DataCell(Text(item.location ?? '')),
        DataCell(Text('\$${item.price?.toStringAsFixed(2) ?? '0.00'}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;
}
