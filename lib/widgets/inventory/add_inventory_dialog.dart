// File: lib/widgets/inventory/add_inventory_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;

import '../../data/database.dart';
import '../../providers/inventory_provider.dart';
import '../../providers/auth_provider.dart'; // ✅ For UID access
import '../common/rounded_text_field.dart';
import '../common/rounded_dropdown_field.dart';

class AddInventoryDialog extends ConsumerStatefulWidget {
  final bool isDuplicate;
  final InventoryItem? lastItem;

  const AddInventoryDialog({
    super.key,
    this.isDuplicate = false,
    this.lastItem,
  });

  @override
  ConsumerState<AddInventoryDialog> createState() => _AddInventoryDialogState();
}

class _AddInventoryDialogState extends ConsumerState<AddInventoryDialog> {
  final _makeController = TextEditingController();
  final _typeController = TextEditingController();
  final _modelController = TextEditingController();
  final _partNumberController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _serialController = TextEditingController();
  final _capacityController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  String _location = 'Calgary';

  @override
  void initState() {
    super.initState();

    final item = widget.lastItem;
    if (item != null) {
      _makeController.text = item.make ?? '';
      _typeController.text = item.type ?? '';
      _modelController.text = item.model ?? '';
      _partNumberController.text = item.partNumber;
      _descriptionController.text = item.description;
      _capacityController.text = item.capacity ?? '';
      _priceController.text = item.price?.toStringAsFixed(2) ?? '';
      _location = item.location ?? 'Calgary';
      _quantityController.text = (item.serial?.isNotEmpty ?? false)
          ? '1'
          : item.quantity.toString();

      if (widget.isDuplicate) {
        _serialController.clear();
      } else {
        _serialController.text = item.serial ?? '';
      }
    }
  }

  void _autofillFromPart() {
    final part = _partNumberController.text.trim().toUpperCase();

    final typeMap = {
      'LC': 'Loadcell',
      'EQ': 'Equipment',
      'IND': 'Indicator',
      'RE': 'Remote',
      'PR': 'Printer',
      'PRO': 'Program',
      'PROG': 'Program',
      'TW': 'Test Weight',
      'WB': 'Weighbar',
      'WE': 'Weighbar',
    };

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

    _typeController.text = typeMap.entries.firstWhere(
      (e) => part.startsWith(e.key),
      orElse: () => const MapEntry('', 'Other'),
    ).value;

    _makeController.text = makeMap.entries.firstWhere(
      (e) => part.startsWith(e.key),
      orElse: () => const MapEntry('', 'N/A'),
    ).value;
  }

  void _autofillFromModel() {
    final model = _modelController.text.trim().toUpperCase();
    _partNumberController.text = model;
    _autofillFromPart();
  }

  void _addOrDuplicateItem({bool isDuplicate = false}) {
    final provider = ref.read(inventoryProvider);
    final hasSerial = _serialController.text.trim().isNotEmpty;
    final quantity = hasSerial ? 1 : int.tryParse(_quantityController.text) ?? 1;

    final currentUser = ref.read(authControllerProvider);
    final uid = currentUser?.uid ?? 'unknown'; // ✅ Fallback in case not logged in

    provider.addInventory(
      InventoryItemsCompanion(
        make: Value(_makeController.text.trim()),
        type: Value(_typeController.text.trim()),
        model: Value(_modelController.text.trim()),
        partNumber: Value(_partNumberController.text.trim()),
        description: Value(_descriptionController.text.trim()),
        serial: Value(_serialController.text.trim()),
        capacity: Value(_capacityController.text.trim()),
        location: Value(_location),
        price: Value(double.tryParse(_priceController.text.trim()) ?? 0.0),
        quantity: Value(quantity),
        isSold: const Value(false),
        uid: Value(uid), // ✅ Tag entry globally
      ),
    );

    if (!isDuplicate) {
      Navigator.of(context).pop();
    } else {
      setState(() => _serialController.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasSerial = _serialController.text.trim().isNotEmpty;

    return AlertDialog(
      title: const Text('Add Inventory Item'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundedTextField(label: 'Make', controller: _makeController),
            RoundedTextField(label: 'Type', controller: _typeController),
            RoundedTextField(label: 'Model', controller: _modelController, onChanged: (_) => _autofillFromModel()),
            RoundedTextField(label: 'Part Number', controller: _partNumberController, onChanged: (_) => _autofillFromPart()),
            RoundedTextField(label: 'Description', controller: _descriptionController),
            RoundedTextField(label: 'Serial', controller: _serialController),
            RoundedTextField(label: 'Capacity', controller: _capacityController),
            RoundedDropdownField<String>(
              label: 'Location',
              value: _location,
              items: const [
                DropdownMenuItem(value: 'Calgary', child: Text('Calgary')),
                DropdownMenuItem(value: 'Lethbridge', child: Text('Lethbridge')),
              ],
              onChanged: (val) => setState(() => _location = val ?? 'Calgary'),
            ),
            RoundedTextField(label: 'Price', controller: _priceController, keyboardType: TextInputType.number),
            if (!hasSerial)
              RoundedTextField(label: 'Quantity', controller: _quantityController, keyboardType: TextInputType.number),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton.icon(
          onPressed: () => _addOrDuplicateItem(isDuplicate: false),
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
        ElevatedButton.icon(
          onPressed: () => _addOrDuplicateItem(isDuplicate: true),
          icon: const Icon(Icons.copy),
          label: const Text('Duplicate'),
        ),
      ],
    );
  }
}
