// File: lib/pages/work_order_billing_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/price_providers.dart';   // Price DAO provider
import '../providers/drift_providers.dart';   // databaseProvider -> inventoryDao
import '../widgets/inventory/inventory_picker_sheet.dart';
import '../data/database.dart';               // for InventoryItem
import '../data/static/price_codes.dart';

class WorkOrderBillingPage extends ConsumerStatefulWidget {
  final int workOrderId;

  const WorkOrderBillingPage({super.key, required this.workOrderId});

  @override
  ConsumerState<WorkOrderBillingPage> createState() =>
      _WorkOrderBillingPageState();
}

class _WorkOrderBillingPageState extends ConsumerState<WorkOrderBillingPage> {
  // ===== Non-part billed quantities =====
  final labourHoursCtrl = TextEditingController();
  final ttFlatCountCtrl = TextEditingController(text: '0');
  final ttKmCtrl = TextEditingController();
  final ttOnSiteHoursCtrl = TextEditingController();
  final svcKmCtrl = TextEditingController();
  final miscEachQtyCtrl = TextEditingController();
  final miscEachNoteCtrl = TextEditingController();
  final techTravelHoursCtrl = TextEditingController();

  // Loaded master rates (from Prices table)
  double? labourRate, partsRate, ttFlatRate, ttKmRate, ttOnSiteRate, svcKmRate, miscEachRate, techTravelRate;

  // ===== Parts lines (each part on its own line) =====
  final List<_PartLine> _parts = [];

  bool _loadingRates = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final priceDao = ref.read(priceDaoProvider);
      await priceDao.ensureDefaultPrices();
      await _loadRates();
    });
  }

  Future<void> _loadRates() async {
    final priceDao = ref.read(priceDaoProvider);

    final labour = await priceDao.getByCode(PriceCodes.labour);
    final parts  = await priceDao.getByCode(PriceCodes.parts);
    final ttFlat = await priceDao.getByCode(PriceCodes.testTruckFlat);
    final ttKm   = await priceDao.getByCode(PriceCodes.testTruckKm);
    final ttOn   = await priceDao.getByCode(PriceCodes.testTruckOnSite);
    final svcKm  = await priceDao.getByCode(PriceCodes.serviceVehicleKm);
    final misc   = await priceDao.getByCode(PriceCodes.miscExpense);
    final travel = await priceDao.getByCode(PriceCodes.techTravel);

    setState(() {
      labourRate     = labour?.rate;
      partsRate      = parts?.rate;     // fallback when inventory.price is null
      ttFlatRate     = ttFlat?.rate;
      ttKmRate       = ttKm?.rate;
      ttOnSiteRate   = ttOn?.rate;
      svcKmRate      = svcKm?.rate;
      miscEachRate   = misc?.rate;
      techTravelRate = travel?.rate;
      _loadingRates  = false;
    });
  }

  // ---------- Math helpers ----------
  double _p(String v) => double.tryParse(v.trim()) ?? 0.0;

  double get _lineLabour   => _p(labourHoursCtrl.text)     * (labourRate ?? 0);
  double get _lineTTFlat   => _p(ttFlatCountCtrl.text)     * (ttFlatRate ?? 0);
  double get _lineTTKm     => _p(ttKmCtrl.text)            * (ttKmRate ?? 0);
  double get _lineTTOnSite => _p(ttOnSiteHoursCtrl.text)   * (ttOnSiteRate ?? 0);
  double get _lineSvcKm    => _p(svcKmCtrl.text)           * (svcKmRate ?? 0);
  double get _lineMiscEach => _p(miscEachQtyCtrl.text)     * (miscEachRate ?? 0);
  double get _lineTravel   => _p(techTravelHoursCtrl.text) * (techTravelRate ?? 0);
  double get _partsTotal   => _parts.fold(0.0, (s, e) => s + e.total);

  double get _grandTotal =>
      _lineLabour +
      _lineTTFlat +
      _lineTTKm +
      _lineTTOnSite +
      _lineSvcKm +
      _lineMiscEach +
      _lineTravel +
      _partsTotal;

  @override
  void dispose() {
    labourHoursCtrl.dispose();
    ttFlatCountCtrl.dispose();
    ttKmCtrl.dispose();
    ttOnSiteHoursCtrl.dispose();
    svcKmCtrl.dispose();
    miscEachQtyCtrl.dispose();
    miscEachNoteCtrl.dispose();
    techTravelHoursCtrl.dispose();
    for (final p in _parts) {
      p.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormatCurrency.maybeCAD();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Order Billing'),
        // 🔒 No Edit Rates here — keep in Admin only.
      ),
      body: _loadingRates
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _sectionHeader('Parts (from Inventory)'),
                _partsBuilder(currency),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add part from Inventory'),
                    onPressed: () async {
                      final db = ref.read(databaseProvider);
                      final invItem = await showModalBottomSheet<InventoryItem>(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => InventoryPickerSheet(dao: db.inventoryDao),
                      );
                      if (!mounted || invItem == null) return;

                      final unit = invItem.price ?? (partsRate ?? 0);
                      setState(() {
                        _parts.add(_PartLine(
                          itemId: invItem.id,
                          workOrderId: widget.workOrderId,
                          name: '${invItem.partNumber} — ${invItem.description}',
                          unitPrice: unit,
                          defaultPriceSource: invItem.price != null ? 'Item' : 'Parts rate',
                        ));
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                _sectionHeader('Other billable entries'),
                _qtyMoneyRow(
                  context,
                  label: 'Labour (hours)',
                  qtyCtrl: labourHoursCtrl,
                  amount: _lineLabour,
                  currency: currency,
                  unitRate: labourRate,
                  unitLabel: '/ hr',
                ),
                _qtyMoneyRow(
                  context,
                  label: 'Test Truck – flat (0/1/2...)',
                  qtyCtrl: ttFlatCountCtrl,
                  amount: _lineTTFlat,
                  currency: currency,
                  unitRate: ttFlatRate,
                  unitLabel: 'each',
                ),
                _qtyMoneyRow(
                  context,
                  label: 'Test Truck – kilometres',
                  qtyCtrl: ttKmCtrl,
                  amount: _lineTTKm,
                  currency: currency,
                  unitRate: ttKmRate,
                  unitLabel: '/ km',
                ),
                _qtyMoneyRow(
                  context,
                  label: 'Test Truck – on site (hours)',
                  qtyCtrl: ttOnSiteHoursCtrl,
                  amount: _lineTTOnSite,
                  currency: currency,
                  unitRate: ttOnSiteRate,
                  unitLabel: '/ hr',
                ),
                _qtyMoneyRow(
                  context,
                  label: 'Service Vehicle – kilometres',
                  qtyCtrl: svcKmCtrl,
                  amount: _lineSvcKm,
                  currency: currency,
                  unitRate: svcKmRate,
                  unitLabel: '/ km',
                ),
                _qtyMoneyRow(
                  context,
                  label: 'Misc material & expense (qty)',
                  qtyCtrl: miscEachQtyCtrl,
                  amount: _lineMiscEach,
                  currency: currency,
                  unitRate: miscEachRate,
                  unitLabel: 'each',
                ),
                TextField(
                  controller: miscEachNoteCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Misc description (optional)',
                  ),
                ),
                _qtyMoneyRow(
                  context,
                  label: 'Technician travel (hours)',
                  qtyCtrl: techTravelHoursCtrl,
                  amount: _lineTravel,
                  currency: currency,
                  unitRate: techTravelRate,
                  unitLabel: '/ hr',
                ),

                const Divider(height: 32),
                ListTile(
                  title: const Text(
                    'Grand total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    currency.format(_grandTotal),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    // TODO (next step): Persist billing lines
                    //   - Parts → inventory_transactions (type: 'used' or 'sold'), referencing the workOrderId
                    //   - Services → billing_lines (new table) with code + qty + rate snapshot
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Calculated totals (not saved).')),
                    );
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save Billing'),
                ),
              ],
            ),
    );
  }

  // ---- UI helpers ----

  Widget _partsBuilder(NumberFormatCurrency currency) {
    if (_parts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Text('No parts added.'),
      );
    }

    return Column(
      children: [
        ..._parts.asMap().entries.map((entry) {
          final i = entry.key;
          final line = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: line.nameCtrl,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Part',
                      isDense: true,
                      border: const OutlineInputBorder(),
                      helperText: line.defaultPriceSource == null
                          ? null
                          : 'Default: ${line.defaultPriceSource}',
                      helperMaxLines: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: line.qtyCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'Qty',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: line.unitCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'Unit price',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Line total',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    child: Text(
                      currency.format(line.total),
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Remove',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => setState(() => _parts.removeAt(i)),
                ),
              ],
            ),
          );
        }),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Parts total: ${currency.format(_partsTotal)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _qtyMoneyRow(
    BuildContext context, {
    required String label,
    required TextEditingController qtyCtrl,
    required double amount,
    required NumberFormatCurrency currency,
    double? unitRate,
    String? unitLabel,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: qtyCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
                isDense: true,
                helperText: unitRate == null
                    ? null
                    : 'Rate: ${currency.format(unitRate)}${unitLabel == null ? '' : ' $unitLabel'}',
                helperMaxLines: 1,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 160,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              child: Text(
                currency.format(amount),
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Parts line UI model ----------

class _PartLine {
  final int itemId;        // inventory id
  final int workOrderId;   // for future persistence
  final TextEditingController nameCtrl;
  final TextEditingController qtyCtrl;
  final TextEditingController unitCtrl;
  final String? defaultPriceSource;

  _PartLine({
    required this.itemId,
    required this.workOrderId,
    required String name,
    required double unitPrice,
    this.defaultPriceSource,
    double qty = 1,
  })  : nameCtrl = TextEditingController(text: name),
        qtyCtrl  = TextEditingController(text: qty.toStringAsFixed(2)),
        unitCtrl = TextEditingController(text: unitPrice.toStringAsFixed(2));

  double get total {
    final q = double.tryParse(qtyCtrl.text) ?? 0;
    final u = double.tryParse(unitCtrl.text) ?? 0;
    return q * u;
  }

  void dispose() {
    nameCtrl.dispose();
    qtyCtrl.dispose();
    unitCtrl.dispose();
  }
}

/// Tiny helper to format currency without intl dependency.
class NumberFormatCurrency {
  final String symbol;
  NumberFormatCurrency._(this.symbol);
  static NumberFormatCurrency maybeCAD() => NumberFormatCurrency._('\$');
  String format(double v) => '$symbol${v.toStringAsFixed(2)}';
}
