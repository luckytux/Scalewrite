// File: lib/providers/work_order_billing_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';            // brings in the Drift data class `Price`
import 'drift_providers.dart';            // priceDaoProvider, workOrderBillingDaoProvider (your DAO)
import '../data/daos/price_dao.dart' as pricing; // for PriceCodes

final workOrderBillingProvider =
    ChangeNotifierProvider<WorkOrderBillingController>((ref) {
  return WorkOrderBillingController(ref);
});

class WorkOrderBillingController extends ChangeNotifier {
  final Ref ref;
  WorkOrderBillingController(this.ref);

  int? workOrderId;

  // Quantities entered by the user
  final labourHours = TextEditingController(text: '0');
  final overtimeHours = TextEditingController(text: '0');
  final techTravelHours = TextEditingController(text: '0');
  final testTruckOnSiteHours = TextEditingController(text: '0');
  final testTruckFlat = TextEditingController(text: '0');
  final testTruckKm = TextEditingController(text: '0');
  final serviceVehicleKm = TextEditingController(text: '0');

  /// If you want this editable by the user. Otherwise you can seed from defaults.
  final miscMaterialsPct = TextEditingController(text: '0');

  // Unit prices pulled from PriceDao (Drift data class `Price`)
  Price? pLabour;
  Price? pOvertime;
  Price? pTechTravel;
  Price? pTestTruckOnSite;
  Price? pTestTruckKm;
  Price? pServiceVehicleKm;
  Price? pTestTruckFlat;
  Price? pMiscPercent;

  // ---- Helpers ----
  double _num(TextEditingController c) => double.tryParse(c.text.trim()) ?? 0.0;
  double _rate(Price? p) => p?.rate ?? 0.0;
  String _unit(Price? p) => p?.unit ?? '';
  String _rateStr(Price? p) => _rate(p).toStringAsFixed(2);

  Future<void> init(int woId) async {
    workOrderId = woId;
    final prices = ref.read(priceDaoProvider);

    pLabour           = await prices.getByCode(pricing.PriceCodes.labour);
    pOvertime         = await prices.getByCode(pricing.PriceCodes.overtime);
    pTechTravel       = await prices.getByCode(pricing.PriceCodes.techTravel);
    pTestTruckOnSite  = await prices.getByCode(pricing.PriceCodes.testTruckOnSite);
    pTestTruckKm      = await prices.getByCode(pricing.PriceCodes.testTruckKm);
    pServiceVehicleKm = await prices.getByCode(pricing.PriceCodes.serviceVehicleKm);
    pTestTruckFlat    = await prices.getByCode(pricing.PriceCodes.testTruckFlat);
    pMiscPercent      = await prices.getByCode(pricing.PriceCodes.miscPercent);

    // Optionally seed misc % from the table default if the field is 0
    final currentPct = double.tryParse(miscMaterialsPct.text.trim()) ?? 0.0;
    if (currentPct == 0.0 && pMiscPercent != null) {
      // Store with 1 decimal if it looks like a percent value
      miscMaterialsPct.text = pMiscPercent!.rate.toStringAsFixed(1);
    }

    notifyListeners();
  }

  /// Save all entered quantities as upserted charge lines.
  /// Expects a DAO available via `workOrderBillingDaoProvider` with:
  ///   upsertCharge({
  ///     required int workOrderId,
  ///     required String code,
  ///     required String label,
  ///     required double quantity,
  ///     required double unitPrice,
  ///   })
  Future<bool> save() async {
    if (workOrderId == null) return false;
    final dao = ref.read(workOrderBillingDaoProvider);

    // LABOUR
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.labour,
      label: 'Labour (${_unit(pLabour)} @ \$${_rateStr(pLabour)})',
      quantity: _num(labourHours),
      unitPrice: _rate(pLabour),
    );

    // OVERTIME
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.overtime,
      label: 'Overtime (${_unit(pOvertime)} @ \$${_rateStr(pOvertime)})',
      quantity: _num(overtimeHours),
      unitPrice: _rate(pOvertime),
    );

    // TECH TRAVEL
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.techTravel,
      label: 'Technician Travel (${_unit(pTechTravel)} @ \$${_rateStr(pTechTravel)})',
      quantity: _num(techTravelHours),
      unitPrice: _rate(pTechTravel),
    );

    // TEST TRUCK - ON SITE
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.testTruckOnSite,
      label:
          'Test Truck - On Site (${_unit(pTestTruckOnSite)} @ \$${_rateStr(pTestTruckOnSite)})',
      quantity: _num(testTruckOnSiteHours),
      unitPrice: _rate(pTestTruckOnSite),
    );

    // TEST TRUCK - FLAT
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.testTruckFlat,
      label: 'Test Truck - Flat',
      quantity: _num(testTruckFlat),
      unitPrice: _rate(pTestTruckFlat),
    );

    // TEST TRUCK - KM
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.testTruckKm,
      label:
          'Test Truck - km (${_unit(pTestTruckKm)} @ \$${_rateStr(pTestTruckKm)})',
      quantity: _num(testTruckKm),
      unitPrice: _rate(pTestTruckKm),
    );

    // SERVICE VEHICLE - KM
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.serviceVehicleKm,
      label:
          'Service Vehicle - km (${_unit(pServiceVehicleKm)} @ \$${_rateStr(pServiceVehicleKm)})',
      quantity: _num(serviceVehicleKm),
      unitPrice: _rate(pServiceVehicleKm),
    );

    // MISC MATERIALS & EXPENSE (percent of labour + OT + travel)
    final labourAmt = _num(labourHours) * _rate(pLabour);
    final otAmt = _num(overtimeHours) * _rate(pOvertime);
    final travelAmt = _num(techTravelHours) * _rate(pTechTravel);
    final base = labourAmt + otAmt + travelAmt;

    final pct = double.tryParse(miscMaterialsPct.text.trim()) ??
        (pMiscPercent?.rate ?? 0.0);
    final miscAmt = base * (pct / 100.0);

    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: pricing.PriceCodes.miscPercent, // canonical code
      label:
          'Misc Materials & Expense (${pct.toStringAsFixed(1)}% of labour + OT + travel)',
      quantity: 1.0,      // single line
      unitPrice: miscAmt, // total amount
    );

    return true;
  }

  @override
  void dispose() {
    labourHours.dispose();
    overtimeHours.dispose();
    techTravelHours.dispose();
    testTruckOnSiteHours.dispose();
    testTruckFlat.dispose();
    testTruckKm.dispose();
    serviceVehicleKm.dispose();
    miscMaterialsPct.dispose();
    super.dispose();
  }
}
