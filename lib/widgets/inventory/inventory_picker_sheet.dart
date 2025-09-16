// File: lib/widgets/inventory/inventory_picker_sheet.dart

import 'package:flutter/material.dart';
import '../../data/database.dart'; // for InventoryItem type
import '../../data/daos/inventory_dao.dart';

/// Bottom sheet that lets you search & pick an InventoryItem.
/// - Starts with the whole list (getAllInventory)
/// - Filters with live DB search (searchInventory)
class InventoryPickerSheet extends StatefulWidget {
  final InventoryDao dao;

  const InventoryPickerSheet({super.key, required this.dao});

  @override
  State<InventoryPickerSheet> createState() => _InventoryPickerSheetState();
}

class _InventoryPickerSheetState extends State<InventoryPickerSheet> {
  final _searchCtrl = TextEditingController();
  List<InventoryItem> _items = [];
  bool _loading = true;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _loadAll();
    _searchCtrl.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchCtrl.removeListener(_onSearchChanged);
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadAll() async {
    setState(() => _loading = true);
    final list = await widget.dao.getAllInventory();
    setState(() {
      _items = list;
      _loading = false;
    });
  }

  Future<void> _onSearchChanged() async {
    final q = _searchCtrl.text.trim();
    if (q == _query) return;
    _query = q;

    if (q.isEmpty) {
      // show all
      await _loadAll();
      return;
    }

    setState(() => _loading = true);
    final list = await widget.dao.searchInventory(q);
    setState(() {
      _items = list;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Text('Pick a part', style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _searchCtrl,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search by part #, description, barcode…',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _items.isEmpty
                        ? const Center(child: Text('No matching items.'))
                        : ListView.separated(
                            itemCount: _items.length,
                            separatorBuilder: (_, __) => const Divider(height: 1),
                            itemBuilder: (context, i) {
                              final it = _items[i];
                              final title = '${it.partNumber} — ${it.description}';
                              final subtitleParts = <String>[];
                              if (it.location != null && it.location!.isNotEmpty) {
                                subtitleParts.add('Loc: ${it.location}');
                              }
                              subtitleParts.add('Qty: ${it.quantity}');
                              if (it.price != null) {
                                subtitleParts.add('Price: ${_fmtCurrency(it.price!)}');
                              }

                              return ListTile(
                                title: Text(title),
                                subtitle: Text(subtitleParts.join(' • ')),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () => Navigator.of(context).pop(it),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _fmtCurrency(double v) => '\$${v.toStringAsFixed(2)}';
}
