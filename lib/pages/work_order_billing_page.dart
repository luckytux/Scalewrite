// File: lib/pages/work_order_billing_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/drift_providers.dart';
import '../data/daos/price_dao.dart'; // PriceCodes + dao methods
import '../data/database.dart'; // InventoryItem type
import '../widgets/inventory/inventory_picker_sheet.dart';

class WorkOrderBillingPage extends ConsumerStatefulWidget {
  final int workOrderId;
  /// Optional – some entry points may not have created a Service Report yet.
  final int? serviceReportId;

  const WorkOrderBillingPage({
    super.key,
    required this.workOrderId,
    this.serviceReportId,
  });

  @override
  ConsumerState<WorkOrderBillingPage> createState() => _WorkOrderBillingPageState();
}

class _WorkOrderBillingPageState extends ConsumerState<WorkOrderBillingPage> {
  final _currency = NumberFormat.currency(symbol: r'$');

  // qty controllers
  final labourHrsCtrl = TextEditingController(text: '0');
  final overtimeHrsCtrl = TextEditingController(text: '0');
  final techTravelHrsCtrl = TextEditingController(text: '0');   // technician travel time
  final ttOnsiteHrsCtrl = TextEditingController(text: '0');     // test truck on-site hours
  final ttFlatCtrl = TextEditingController(text: '0');          // count (0/1/2…)
  final ttKmCtrl = TextEditingController(text: '0');            // km
  final svcKmCtrl = TextEditingController(text: '0');           // km

  // Picked parts from inventory (1 line per item)
  final List<InventoryItem> _parts = [];

  // Rates (loaded from DB)
  final Map<String, double> _rates = {
    PriceCodes.labour: 0,
    PriceCodes.overtime: 0,
    PriceCodes.techTravel: 0,
    PriceCodes.testTruckOnSite: 0,
    PriceCodes.testTruckFlat: 0,
    PriceCodes.testTruckKm: 0,
    PriceCodes.serviceVehicleKm: 0,
    PriceCodes.miscPercent: 0, // stored as percent (e.g., 10 means 10%)
    PriceCodes.taxGst: 5,      // stored as percent
  };

  // Helpers
  double _qty(TextEditingController c) => double.tryParse(c.text.trim()) ?? 0;

  // Amounts
  double get _labourAmt   => _qty(labourHrsCtrl)   * (_rates[PriceCodes.labour] ?? 0);
  double get _otAmt       => _qty(overtimeHrsCtrl) * (_rates[PriceCodes.overtime] ?? 0);

  // Travel time (hours-based)
  double get _techTravelAmt =>
      _qty(techTravelHrsCtrl) * (_rates[PriceCodes.techTravel] ?? 0);
  double get _ttOnsiteAmt =>
      _qty(ttOnsiteHrsCtrl) * (_rates[PriceCodes.testTruckOnSite] ?? 0);

  // Truck flat / kms / service vehicle kms
  double get _ttFlatAmt => _qty(ttFlatCtrl) * (_rates[PriceCodes.testTruckFlat] ?? 0);
  double get _ttKmAmt   => _qty(ttKmCtrl)   * (_rates[PriceCodes.testTruckKm] ?? 0);
  double get _svcKmAmt  => _qty(svcKmCtrl)  * (_rates[PriceCodes.serviceVehicleKm] ?? 0);

  // Parts subtotal (from picked inventory items)
  double get _partsSubtotal =>
      _parts.fold(0.0, (sum, it) => sum + (it.price ?? 0.0));

  // Travel *time* bucket for misc %
  double get _travelTimeAmt => _techTravelAmt + _ttOnsiteAmt;

  // Misc is % of (labour + overtime + travel time)
  double get _miscAmt {
    final pct = _rates[PriceCodes.miscPercent] ?? 0; // e.g., 10 = 10%
    final base = _labourAmt + _otAmt + _travelTimeAmt;
    return (pct / 100.0) * base;
  }

  // Subtotals & tax
  double get _subtotalTaxable =>
      _labourAmt +
      _otAmt +
      _techTravelAmt +
      _ttOnsiteAmt +
      _ttFlatAmt +
      _ttKmAmt +
      _svcKmAmt +
      _miscAmt +
      _partsSubtotal;

  double get _gstAmt =>
      (_rates[PriceCodes.taxGst] ?? 5) / 100.0 * _subtotalTaxable;

  double get _grandTotal => _subtotalTaxable + _gstAmt;

  @override
  void initState() {
    super.initState();

    // Recalc on any qty change
    for (final c in [
      labourHrsCtrl,
      overtimeHrsCtrl,
      techTravelHrsCtrl,
      ttOnsiteHrsCtrl,
      ttFlatCtrl,
      ttKmCtrl,
      svcKmCtrl,
    ]) {
      c.addListener(() => setState(() {}));
    }

    _loadRates();
  }

  Future<void> _loadRates() async {
    final priceDao = ref.read(priceDaoProvider);

    Future<void> loadOne(String code) async {
      final p = await priceDao.getByCode(code);
      if (p != null) _rates[code] = p.rate;
    }

    await Future.wait([
      loadOne(PriceCodes.labour),
      loadOne(PriceCodes.overtime),
      loadOne(PriceCodes.techTravel),
      loadOne(PriceCodes.testTruckOnSite),
      loadOne(PriceCodes.testTruckFlat),
      loadOne(PriceCodes.testTruckKm),
      loadOne(PriceCodes.serviceVehicleKm),
      loadOne(PriceCodes.miscPercent),
      loadOne(PriceCodes.taxGst),
    ]);

    // Sensible default for overtime if not set: 1.5x labour
    if ((_rates[PriceCodes.overtime] ?? 0) <= 0) {
      _rates[PriceCodes.overtime] = (_rates[PriceCodes.labour] ?? 0) * 1.5;
    }

    if (mounted) setState(() {});
  }

  String _rateText(String code, {required String unit}) {
    final r = _rates[code] ?? 0;
    final money = _currency.format(r);
    return ' @ $money / $unit';
  }

  @override
  void dispose() {
    labourHrsCtrl.dispose();
    overtimeHrsCtrl.dispose();
    techTravelHrsCtrl.dispose();
    ttOnsiteHrsCtrl.dispose();
    ttFlatCtrl.dispose();
    ttKmCtrl.dispose();
    svcKmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The labels already show current rates; no separate “rates” box needed.
    return Scaffold(
      appBar: AppBar(title: const Text('Work Order Billing')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------------- Parts from Inventory ----------------
          const Text('Parts (from Inventory)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          if (_parts.isEmpty)
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('No parts added.'),
            )
          else
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.teal.shade100),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: List.generate(_parts.length, (i) {
                  final it = _parts[i];
                  return ListTile(
                    dense: true,
                    title: Text(it.description),
                    subtitle: Text(
                      '${it.partNumber.isNotEmpty ? 'PN ${it.partNumber} • ' : ''}'
                      'Unit: ${_currency.format(it.price ?? 0)}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => setState(() => _parts.removeAt(i)),
                    ),
                  );
                }),
              ),
            ),

          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add part from Inventory'),
              onPressed: () async {
                final picked = await showModalBottomSheet<InventoryItem?>(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => InventoryPickerSheet(
                    dao: ref.read(inventoryDaoProvider),
                  ),
                );
                if (picked != null) {
                  setState(() {
                    _parts.add(picked);
                  });
                }
              },
            ),
          ),

          const SizedBox(height: 24),

          // ---------------- Other billable entries ----------------
          const Text('Other billable entries',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          _qtyLine(
            label: 'Labour (hours${_rateText(PriceCodes.labour, unit: 'hour')})',
            controller: labourHrsCtrl,
            amount: _labourAmt,
          ),
          _qtyLine(
            label: 'Overtime (hours${_rateText(PriceCodes.overtime, unit: 'hour')})',
            controller: overtimeHrsCtrl,
            amount: _otAmt,
          ),
          _qtyLine(
            label: 'Technician Travel (hours${_rateText(PriceCodes.techTravel, unit: 'hour')})',
            controller: techTravelHrsCtrl,
            amount: _techTravelAmt,
          ),
          _qtyLine(
            label: 'Test Truck - On Site (hours${_rateText(PriceCodes.testTruckOnSite, unit: 'hour')})',
            controller: ttOnsiteHrsCtrl,
            amount: _ttOnsiteAmt,
          ),
          _qtyLine(
            label: 'Test Truck - flat (0/1/2…${_rateText(PriceCodes.testTruckFlat, unit: 'flat')})',
            controller: ttFlatCtrl,
            amount: _ttFlatAmt,
          ),
          _qtyLine(
            label: 'Test Truck - km${_rateText(PriceCodes.testTruckKm, unit: 'km')}',
            controller: ttKmCtrl,
            amount: _ttKmAmt,
          ),
          _qtyLine(
            label: 'Service Vehicle - km${_rateText(PriceCodes.serviceVehicleKm, unit: 'km')}',
            controller: svcKmCtrl,
            amount: _svcKmAmt,
          ),

          // Read-only computed misc total (no qty, no "each")
          _readOnlyTotal(
            label:
                'Misc Materials & Expense (${(_rates[PriceCodes.miscPercent] ?? 0).toStringAsFixed(1)}% of labour + OT + travel time)',
            amount: _miscAmt,
          ),

          const Divider(height: 32),

          // ---------------- Totals ----------------
          _totalsRow('Parts Subtotal', _partsSubtotal),
          const SizedBox(height: 4),
          _totalsRow('Subtotal (taxable)', _subtotalTaxable),
          const SizedBox(height: 4),
          _totalsRow('GST ${(_rates[PriceCodes.taxGst] ?? 5).toStringAsFixed(1)}%', _gstAmt),
          const SizedBox(height: 8),
          _totalsRow('Grand Total', _grandTotal, strong: true),

          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _saveBilling,
            icon: const Icon(Icons.save),
            label: const Text('Save Billing'),
          ),
        ],
      ),
    );
  }

  // --------- Widgets ---------

  Widget _qtyLine({
    required String label,
    required TextEditingController controller,
    required double amount,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 160,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              child: Text(
                _currency.format(amount),
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _readOnlyTotal({
    required String label,
    required double amount,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
                fillColor: Colors.grey.shade100,
                filled: true,
              ),
              child: const SizedBox(height: 20), // keep height consistent
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 160,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              child: Text(
                _currency.format(amount),
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _totalsRow(String label, double amount, {bool strong = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: strong ? 18 : 16,
            fontWeight: strong ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          _currency.format(amount),
          style: TextStyle(
            fontSize: strong ? 18 : 16,
            fontWeight: strong ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // --------- Persistence Stub ---------

  Future<void> _saveBilling() async {
    // TODO: Persist _parts and line quantities -> your billing schema.
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Billing saved (stub).')),
    );
  }
}
