// File: lib/pages/admin/price_admin_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';

import 'package:scalewrite/providers/drift_providers.dart';
import 'package:scalewrite/providers/auth_provider.dart' as auth;
import 'package:scalewrite/data/database.dart';

class PriceAdminPage extends ConsumerWidget {
  const PriceAdminPage({super.key});

  // Include all units you use across the app (added 'percent').
  static const _baseUnits = <String>['hour', 'km', 'flat', 'each', 'percent'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(auth.authControllerProvider)?.isAdmin ?? false;
    if (!isAdmin) {
      return Scaffold(
        appBar: AppBar(title: const Text('Adjust Prices')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'You do not have permission to edit prices.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Adjust Prices')),
      body: StreamBuilder<List<Price>>(
        // Show all rows, ordered for stability.
        stream: (db.select(db.prices)
              ..orderBy([(p) => drift.OrderingTerm.asc(p.code)]))
            .watch(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snap.data ?? const <Price>[];
          if (items.isEmpty) {
            return const Center(child: Text('No price rows yet. Tap + to add one.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120), // <- extra bottom space
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => _PriceRowCard(
              key: ValueKey(items[i].id),
              item: items[i],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add rate'),
        onPressed: () => _showAddDialog(context, ref),
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context, WidgetRef ref) async {
    final codeCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final rateCtrl = TextEditingController();
    String unit = _baseUnits.first;
    bool active = true;

    final formKey = GlobalKey<FormState>();

    await showDialog<void>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add rate'),
          content: Form(
            key: formKey,
            child: SizedBox(
              width: 420,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: codeCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Code (unique, e.g. labour, test_truck_km)',
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: descCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Description (shown to user)',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: unit, // use initialValue (not value)
                          items: _baseUnits
                              .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                              .toList(),
                          onChanged: (v) => setState(() => unit = v ?? unit),
                          decoration: const InputDecoration(labelText: 'Unit type'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: rateCtrl,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: 'Rate',
                            prefixText: unit == 'percent' ? '% ' : '\$ ',
                          ),
                          validator: (v) {
                            final d = double.tryParse((v ?? '').trim());
                            if (d == null) return 'Enter a number';
                            if (d < 0) return 'Must be ≥ 0';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CheckboxListTile(
                    value: active,
                    onChanged: (v) => setState(() => active = v ?? true),
                    title: const Text('Active'),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                final db = ref.read(databaseProvider);
                final rate = double.parse(rateCtrl.text.trim());

                try {
                  await db.into(db.prices).insert(
                        PricesCompanion.insert(
                          code: codeCtrl.text.trim(),
                          description: drift.Value(descCtrl.text.trim()),
                          unit: unit,
                          rate: rate,
                          active: drift.Value(active),
                          createdAt: drift.Value(DateTime.now()),
                          updatedAt: drift.Value(DateTime.now()),
                        ),
                      );
                  if (context.mounted) Navigator.pop(context);
                } catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to insert: $e')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRowCard extends ConsumerStatefulWidget {
  const _PriceRowCard({super.key, required this.item});
  final Price item;

  @override
  ConsumerState<_PriceRowCard> createState() => _PriceRowCardState();
}

class _PriceRowCardState extends ConsumerState<_PriceRowCard> {
  late final TextEditingController _descCtrl;
  late final TextEditingController _rateCtrl;
  late String _unit;
  late bool _active;

  final _tsFmt = DateFormat('yyyy-MM-dd HH:mm');

  @override
  void initState() {
    super.initState();
    _descCtrl = TextEditingController(text: widget.item.description);
    _rateCtrl = TextEditingController(text: widget.item.rate.toStringAsFixed(2));
    _unit = widget.item.unit;
    _active = widget.item.active;
  }

  @override
  void didUpdateWidget(covariant _PriceRowCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item != widget.item) {
      _descCtrl.text = widget.item.description;
      _rateCtrl.text = widget.item.rate.toStringAsFixed(2);
      _unit = widget.item.unit;
      _active = widget.item.active;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _descCtrl.dispose();
    _rateCtrl.dispose();
    super.dispose();
  }

  void _snack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final db = ref.watch(databaseProvider);

    // Ensure the dropdown always contains the current unit, even if unusual.
    final units = {...PriceAdminPage._baseUnits, _unit}.toList()..sort();
    final isPercent = _unit == 'percent';

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.item.code,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                FilterChip(
                  label: Text(_active ? 'Active' : 'Inactive'),
                  selected: _active,
                  onSelected: (v) => setState(() => _active = v),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: _descCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    // Use initialValue and guard against missing unit.
                    initialValue: units.contains(_unit)
                        ? _unit
                        : (units.isNotEmpty ? units.first : null),
                    items: units
                        .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                        .toList(),
                    onChanged: (v) => setState(() => _unit = v ?? _unit),
                    decoration: const InputDecoration(
                      labelText: 'Unit',
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _rateCtrl,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Rate',
                      prefixText: isPercent ? '% ' : '\$ ',
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Updated: ${_tsFmt.format(widget.item.updatedAt)}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(Icons.restore),
                  label: const Text('Reset'),
                  onPressed: () {
                    setState(() {
                      _descCtrl.text = widget.item.description;
                      _rateCtrl.text = widget.item.rate.toStringAsFixed(2);
                      _unit = widget.item.unit;
                      _active = widget.item.active;
                    });
                  },
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                  onPressed: () async {
                    final rate = double.tryParse(_rateCtrl.text.trim());
                    if (rate == null || rate < 0) {
                      _snack('Enter a valid rate');
                      return;
                    }
                    try {
                      await (db.update(db.prices)).replace(
                        widget.item.copyWith(
                          description: _descCtrl.text.trim(),
                          unit: _unit,
                          rate: rate,
                          active: _active,
                          updatedAt: DateTime.now(),
                        ),
                      );
                      _snack('Saved');
                    } catch (e) {
                      _snack('Failed to save: $e');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
