// File: lib/providers/work_order_billing_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';                  // Drift data class `Price`
import 'drift_providers.dart';                   // priceDaoProvider, workOrderBillingDaoProvider
import '../data/daos/price_dao.dart' as pricing; // for PriceCodes

final workOrderBillingProvider =
    ChangeNotifierProvider<WorkOrderBillingController>((ref) {
  return WorkOrderBillingController(ref);
});

class WorkOrderBillingController extends ChangeNotifier {
  final Ref ref;
  WorkOrderBillingController(this.ref);

  int? workOrderId;

  // Quantities entered by the user (blank by default; blank → 0.0 in math)
  final labourHours = TextEditingController();
  final overtimeHours = TextEditingController();
  final techTravelHours = TextEditingController();
  final testTruckOnSiteHours = TextEditingController();
  final testTruckFlat = TextEditingController();
  final testTruckKm = TextEditingController();
  final serviceVehicleKm = TextEditingController();

  // Unit prices (snapshots) from PriceDao
  Price? pLabour;
  Price? pOvertime;
  Price? pTechTravel;
  Price? pTestTruckOnSite;
  Price? pTestTruckKm;
  Price? pServiceVehicleKm;
  Price? pTestTruckFlat;

  // ---- Helpers ----
  double _num(TextEditingController c) => double.tryParse(c.text.trim()) ?? 0.0;
  double _rate(Price? p) => p?.rate ?? 0.0;
  String _unit(Price? p) => p?.unit ?? '';
  String _rateStr(Price? p) => _rate(p).toStringAsFixed(2);
  String _resolveUnit(Price? p, {String? fallback}) {
    final u = _unit(p);
    return u.isNotEmpty ? u : (fallback ?? '');
  }

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

    notifyListeners();
  }

  Future<void> _upsertIfNonZero({
    required String code,
    required String label,
    required double quantity,
    required double unitPrice,
    String? unit,
  }) async {
    if (workOrderId == null) return;
    if (quantity <= 0) return; // 👈 skip zero writes
    final dao = ref.read(workOrderBillingDaoProvider);
    await dao.upsertCharge(
      workOrderId: workOrderId!,
      code: code,
      label: label,
      quantity: quantity,
      unitPrice: unitPrice,
      unit: unit,
    );
  }

  /// Save all entered quantities as upserted charge lines.
  /// Skips any line whose quantity parses to 0 or blank.
  Future<bool> save() async {
    if (workOrderId == null) return false;

    // LABOUR
    final labourUnit = _resolveUnit(pLabour, fallback: 'hour');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.labour,
      label: 'Labour ($labourUnit @ \$${_rateStr(pLabour)})',
      quantity: _num(labourHours),
      unitPrice: _rate(pLabour),
      unit: labourUnit,
    );

    // OVERTIME
    final otUnit = _resolveUnit(pOvertime, fallback: 'hour');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.overtime,
      label: 'Overtime ($otUnit @ \$${_rateStr(pOvertime)})',
      quantity: _num(overtimeHours),
      unitPrice: _rate(pOvertime),
      unit: otUnit,
    );

    // TECH TRAVEL
    final travelUnit = _resolveUnit(pTechTravel, fallback: 'hour');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.techTravel,
      label: 'Technician Travel ($travelUnit @ \$${_rateStr(pTechTravel)})',
      quantity: _num(techTravelHours),
      unitPrice: _rate(pTechTravel),
      unit: travelUnit,
    );

    // TEST TRUCK - ON SITE
    final ttOnSiteUnit = _resolveUnit(pTestTruckOnSite, fallback: 'hour');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.testTruckOnSite,
      label: 'Test Truck - On Site ($ttOnSiteUnit @ \$${_rateStr(pTestTruckOnSite)})',
      quantity: _num(testTruckOnSiteHours),
      unitPrice: _rate(pTestTruckOnSite),
      unit: ttOnSiteUnit,
    );

    // TEST TRUCK - FLAT
    final ttFlatUnit = _resolveUnit(pTestTruckFlat, fallback: 'flat');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.testTruckFlat,
      label: 'Test Truck - Flat',
      quantity: _num(testTruckFlat),
      unitPrice: _rate(pTestTruckFlat),
      unit: ttFlatUnit,
    );

    // TEST TRUCK - KM
    final ttKmUnit = _resolveUnit(pTestTruckKm, fallback: 'km');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.testTruckKm,
      label: 'Test Truck - km ($ttKmUnit @ \$${_rateStr(pTestTruckKm)})',
      quantity: _num(testTruckKm),
      unitPrice: _rate(pTestTruckKm),
      unit: ttKmUnit,
    );

    // SERVICE VEHICLE - KM
    final svKmUnit = _resolveUnit(pServiceVehicleKm, fallback: 'km');
    await _upsertIfNonZero(
      code: pricing.PriceCodes.serviceVehicleKm,
      label: 'Service Vehicle - km ($svKmUnit @ \$${_rateStr(pServiceVehicleKm)})',
      quantity: _num(serviceVehicleKm),
      unitPrice: _rate(pServiceVehicleKm),
      unit: svKmUnit,
    );

    // 👇 Intentionally no "Misc Materials & Expense" line per your request.

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
    super.dispose();
  }
}
