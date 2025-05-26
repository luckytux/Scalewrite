// File: lib/pages/admin/manage_inventory_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;

import '../../providers/inventory_provider.dart';
import '../../widgets/common/rounded_text_field.dart';
import '../../widgets/common/rounded_dropdown_field.dart';
import '../../data/database.dart';

class ManageInventoryPage extends ConsumerStatefulWidget {
  const ManageInventoryPage({super.key});

  @override
  ConsumerState<ManageInventoryPage> createState() => _ManageInventoryPageState();
}

class _ManageInventoryPageState extends ConsumerState<ManageInventoryPage> {
  final _searchController = TextEditingController();
  String _typeFilter = '';

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(inventoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(controller),
            const SizedBox(height: 12),
            RoundedTextField(
              controller: _searchController,
              label: 'Search',
              onChanged: (value) => controller.search(value),
            ),
            const SizedBox(height: 12),
            RoundedDropdownField<String>(
              label: 'Filter by Type',
              value: _typeFilter,
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
              onChanged: (value) {
                setState(() => _typeFilter = value ?? '');
                controller.filterByType(value);
              },
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildItemList(controller)),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(InventoryProvider controller) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () => _showAddItemDialog(context, controller),
          icon: const Icon(Icons.add),
          label: const Text('Add Item'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement transfer logic (Calgary <-> Lethbridge)
          },
          icon: const Icon(Icons.swap_horiz),
          label: const Text('Transfer'),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () async {
            final csv = await controller.exportInventoryToCsv();
            debugPrint(csv);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Inventory exported. Check console for CSV.')),
            );
          },
          icon: const Icon(Icons.download),
          label: const Text('Export'),
        ),
      ],
    );
  }

  Widget _buildItemList(InventoryProvider controller) {
    return controller.filteredItems.isEmpty
        ? const Center(child: Text('No items found.'))
        : ListView.separated(
            itemCount: controller.filteredItems.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final item = controller.filteredItems[index];
              return ListTile(
                title: Text(item.description),
                subtitle: Text(
                  'Part #: ${item.partNumber} | Type: ${item.type ?? 'N/A'} | Make: ${item.make ?? 'N/A'} | '
                  'Qty: ${item.quantity} | Price: \$${item.price?.toStringAsFixed(2) ?? '0.00'}',
                ),
                trailing: Text(item.location ?? 'N/A'),
              );
            },
          );
  }

  Future<void> _showAddItemDialog(BuildContext context, InventoryProvider controller) async {
    final partNumberController = TextEditingController();
    final descriptionController = TextEditingController();
    final typeController = TextEditingController();
    final priceController = TextEditingController();
    final makeController = TextEditingController();
    final modelController = TextEditingController();
    final serialController = TextEditingController();
    final locationController = TextEditingController(text: 'Calgary');

    void autofillFields() {
      final partNumber = partNumberController.text.trim().toUpperCase();

      String? detectedType;
      String? detectedMake;

      if (partNumber.startsWith('LC')) {
        detectedType = 'Loadcell';
      } else if (partNumber.startsWith('EQ')) {
        detectedType = 'Equipment';
      } else if (partNumber.startsWith('IND')) {
        detectedType = 'Indicator';
      } else if (partNumber.startsWith('RE')) {
        detectedType = 'Remote';
      } else if (partNumber.startsWith('PR')) {
        detectedType = 'Printer';
      } else if (partNumber.startsWith('PRO') || partNumber.startsWith('PROG')) {
        detectedType = 'Program';
      } else if (partNumber.startsWith('TW')) {
        detectedType = 'Test Weight';
      } else if (partNumber.startsWith('WB') || partNumber.startsWith('WE')) {
        detectedType = 'Weighbar';
      } else {
        detectedType = 'Other';
      }

      final makeMap = {
        'RWS': 'Rice Lake',
        'RLWS': 'Rice Lake',
        'CAR': 'Cardinal',
        'ANY': 'Anyload',
        'EPS': 'Epson',
        'MET': 'Mettler',
        'SUP': 'Superior',
        'ZEB': 'Zebra',
        'AWT': 'Avery',
        'MAS': 'Massload',
        'KIL': 'Kilotech',
        'OHA': 'Ohaus',
        'DIG': 'Digistar',
      };

      detectedMake = makeMap.entries
          .firstWhere(
            (e) => partNumber.startsWith(e.key),
            orElse: () => const MapEntry('', ''),
          )
          .value;

      typeController.text = detectedType ?? '';
      makeController.text = (detectedMake?.isNotEmpty ?? false) ? detectedMake! : 'N/A';
    }

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Inventory Item'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              RoundedTextField(controller: partNumberController, label: 'Part Number', onChanged: (_) => autofillFields()),
              const SizedBox(height: 8),
              RoundedTextField(controller: descriptionController, label: 'Description'),
              const SizedBox(height: 8),
              RoundedTextField(controller: typeController, label: 'Type'),
              const SizedBox(height: 8),
              RoundedTextField(controller: makeController, label: 'Make'),
              const SizedBox(height: 8),
              RoundedTextField(controller: modelController, label: 'Model'),
              const SizedBox(height: 8),
              RoundedTextField(controller: serialController, label: 'Serial'),
              const SizedBox(height: 8),
              RoundedTextField(controller: locationController, label: 'Location'),
              const SizedBox(height: 8),
              RoundedTextField(controller: priceController, label: 'Price', keyboardType: TextInputType.number),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final price = double.tryParse(priceController.text) ?? 0.0;

              controller.addInventory(
                InventoryItemsCompanion(
                  partNumber: Value(partNumberController.text.trim()),
                  description: Value(descriptionController.text.trim()),
                  type: Value(typeController.text.trim()),
                  price: Value(price),
                  make: Value(makeController.text.trim()),
                  model: Value(modelController.text.trim()),
                  serial: Value(serialController.text.trim()),
                  location: Value(locationController.text.trim()),
                  quantity: const Value(0),
                  isSold: const Value(false),
                ),
              );

              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
