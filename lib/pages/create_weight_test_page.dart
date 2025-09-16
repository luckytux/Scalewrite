// File: lib/pages/create_weight_test_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../providers/weight_test_form_provider.dart';
import '../widgets/weight_test/section_diagram.dart';
import '../widgets/common/rounded_text_field.dart';

import '../utils/scale_precision.dart';
import '../utils/critical_test_points.dart';
import '../utils/scale_classification.dart';
import '../utils/test_plan_suggester.dart';
import '../utils/eccentricity_load.dart';

class CreateWeightTestPage extends ConsumerStatefulWidget {
  final int serviceReportId;
  final double division;
  final int numberOfSections;

  /// Optional: pass if available; otherwise we infer.
  final String? scaleClass;   // e.g. 'III', 'IIIHD', 'IIII'
  final double? maxCapacity;  // same unit as division (kg or lb)

  final WeightTest? existingWeightTest;

  const CreateWeightTestPage({
    super.key,
    required this.serviceReportId,
    required this.numberOfSections,
    this.division = 10,
    this.scaleClass,
    this.maxCapacity,
    this.existingWeightTest,
  });

  @override
  ConsumerState<CreateWeightTestPage> createState() => _CreateWeightTestPageState();
}

class _CreateWeightTestPageState extends ConsumerState<CreateWeightTestPage> {
  late final WeightTestFormController controller;

  String? _cachedScaleClass;
  int? _cachedN; // counts = capacity / e

  // Suggested eccentricity range (25–35% capacity), snapped to kit + division rules
  double? _eccLow;
  double? _eccHigh;

  /// Local, *unsaved* edits while user types.
  /// We only commit to the provider when a field loses focus (or user hits Save).
  final Map<String, String> _pending = {};

  /// Epoch to force input fields to rebuild (so `initialValue` applies
  /// after we programmatically seed or copy values).
  int _fieldEpoch = 0;
  void _bumpFieldEpoch() {
    _pending.clear();
    if (mounted) setState(() => _fieldEpoch++);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller = ref.read(weightTestFormProvider.notifier);

      // Fresh slate for a new page instance
      controller.reset(
        newDivision: widget.division,
        newEccPoints: widget.numberOfSections,
      );
      controller.setServiceReportId(widget.serviceReportId);

      // Derive counts (n) and class
      _cachedN = countsFromCapacity(
        capacity: widget.maxCapacity,
        division: widget.division,
      );
      _cachedScaleClass =
          widget.scaleClass ?? inferScaleClass(division: widget.division, n: _cachedN);

      if (widget.existingWeightTest != null) {
        // Editing: load saved values
        await controller.loadFromExisting(widget.existingWeightTest!);
        _bumpFieldEpoch(); // ensure inputs show loaded values
      } else {
        // New test: set ECC points and auto-suggest test masses (crit points + fillers)
        controller.setEccentricityPoints(widget.numberOfSections);

        // Capacity to plan against (capped later by suggester to 10,000)
        final effectiveCapacity =
            widget.maxCapacity ?? ((_cachedN != null) ? widget.division * _cachedN! : 0);

        final masses = suggestTestMasses(
          scaleClass: _cachedScaleClass ?? 'III',
          division: widget.division,
          capacity: effectiveCapacity,
          n: _cachedN,
          maxPoints: 6,
        );

        for (var i = 0; i < masses.length && i < 6; i++) {
          final m = masses[i];
          controller.setAsFoundTest(i, m);
          controller.setAsFoundRead(i, quantizeToDivision(m, widget.division));
        }

        _bumpFieldEpoch(); // ensure inputs show suggested values
      }

      // Compute & show suggested ECC **range** (25–35%), kit & division aligned
      final eccCap =
          widget.maxCapacity ?? ((_cachedN != null) ? widget.division * _cachedN! : 0);
      if (eccCap > 0) {
        final range = suggestEccentricityRange(
          division: widget.division,
          capacity: eccCap,
        );
        _eccLow = range.$1;
        _eccHigh = range.$2;
        if (mounted) setState(() {}); // refresh label
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weightTestFormProvider);
    final decimals = decimalsForDivision(widget.division);
    String _fmt(double? v) => v == null ? '' : v.toStringAsFixed(decimals);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Weight Test')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: state.formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  const Text('Type:'),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: state.eccentricityType,
                    items: ['Section', 'Directional']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => ref
                        .read(weightTestFormProvider.notifier)
                        .setEccentricityType(val ?? 'Section'),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: state.weightTestUnit,
                    items: ['kg', 'lb']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => ref
                        .read(weightTestFormProvider.notifier)
                        .setWeightTestUnit(val ?? 'kg'),
                  ),
                  const SizedBox(width: 8),
                  if (state.isDirectional)
                    DropdownButton<String>(
                      value: state.eccentricityDirections,
                      hint: const Text('Direction'),
                      items: state.directionOptions
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => ref
                          .read(weightTestFormProvider.notifier)
                          .setEccentricityDirections(val),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              // Each section gets its own traversal group so Tab cycles locally.
              FocusTraversalGroup(
                policy: OrderedTraversalPolicy(),
                child: _buildSection(context, state, asLeft: false, fmt: _fmt),
              ),
              const Divider(height: 32),
              Row(
                children: [
                  Switch(
                    value: state.showAsLeft,
                    onChanged: (val) => ref
                        .read(weightTestFormProvider.notifier)
                        .toggleShowAsLeft(val),
                  ),
                  const Text('Show As Left Section')
                ],
              ),
              if (state.showAsLeft) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.read(weightTestFormProvider.notifier).copyEccentricityValues();
                          _bumpFieldEpoch(); // refresh UI to show copied ECC values
                        },
                        child: const Text('Copy Eccentricity'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(weightTestFormProvider.notifier).copyIncreasingValues();
                          _bumpFieldEpoch(); // refresh UI to show copied Test/Read
                        },
                        child: const Text('Copy Increasing'),
                      ),
                    ],
                  ),
                ),
                FocusTraversalGroup(
                  policy: OrderedTraversalPolicy(),
                  child: _buildSection(context, state, asLeft: true, fmt: _fmt),
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () async {
                  // Commit any field currently focused.
                  FocusScope.of(context).unfocus();

                  final nav = Navigator.of(context);

                  // Warn for non-multiples of e and missing critical points
                  final testMasses = state.asFoundTests.whereType<double>().toList();

                  final nonMultiples = <double>[];
                  for (final m in testMasses) {
                    if (!isMultipleOfDivision(m, widget.division)) {
                      nonMultiples.add(m);
                    }
                  }
                  final missing = missingCriticalMasses(
                    scaleClass: _cachedScaleClass ?? 'III',
                    division: widget.division,
                    testMasses: testMasses,
                    n: _cachedN,
                  );

                  if (nonMultiples.isNotEmpty || missing.isNotEmpty) {
                    final dec = decimalsForDivision(widget.division);
                    final msg = [
                      if (nonMultiples.isNotEmpty)
                        'Entries not multiples of ${widget.division}:\n'
                            '${nonMultiples.map((m) => '• ${formatFixed(m, dec)}').join('\n')}',
                      if (missing.isNotEmpty)
                        'Critical points missing:\n'
                            '${missing.map((m) => '• ${formatFixed(m, dec)}').join('\n')}',
                      'Proceed anyway?',
                    ].join('\n\n');

                    final proceed = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Review test entries'),
                            content: Text(msg),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                              ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Proceed')),
                            ],
                          ),
                        ) ??
                        false;

                    if (!proceed) return;
                  }

                  final ok = await ref.read(weightTestFormProvider.notifier).save();

                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(ok ? 'Weight Test Saved' : 'Error Saving Weight Test')),
                  );
                  if (ok) nav.pop();
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Weight Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    WeightTestFormController state, {
    required bool asLeft,
    required String Function(double?) fmt,
  }) {
    final eccLabel = asLeft ? 'As Left Section' : 'As Found Section';
    final unit = state.weightTestUnit;
    final decimals = decimalsForDivision(widget.division);

    String _fmtNum(double? v) => v == null ? '—' : v.toStringAsFixed(decimals);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eccLabel, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        if (!asLeft && (_eccLow ?? 0) > 0 && (_eccHigh ?? 0) > 0) ...[
          const SizedBox(height: 4),
          Text(
            'Suggested eccentricity load (25–35%): '
            '${_fmtNum(_eccLow)}–${_fmtNum(_eccHigh)} $unit (kit & division aligned)',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
        ],
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ECCENTRICITY GRID
            Expanded(
              flex: 2,
              child: _buildEccentricityInputs(context, state, asLeft: asLeft, fmt: fmt),
            ),
            const SizedBox(width: 12),
            // DIAGRAM
            Expanded(
              flex: 1,
              child: SectionDiagram(
                sections: state.eccentricityPoints,
                isDirectional: state.isDirectional,
              ),
            ),
            const SizedBox(width: 12),
            // INCREASING TESTS
            Expanded(
              flex: 2,
              child: _buildIncTestList(
                state,
                asLeft: asLeft,
                fmt: fmt,
                eccCount: state.isDirectional ? state.eccentricityPoints * 2 : state.eccentricityPoints,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// ECC inputs commit changes **when focus leaves** the field.
  /// Tab order inside the section:
  ///   E1, E2, ... E(n), then Test/Read pairs (handled in _buildIncTestList).
  Widget _buildEccentricityInputs(
    BuildContext context,
    WeightTestFormController state, {
    required bool asLeft,
    required String Function(double?) fmt,
  }) {
    final isDirectional = state.isDirectional;
    final points = state.eccentricityPoints;
    final ctrl = ref.read(weightTestFormProvider.notifier);

    if (isDirectional) {
      // Two columns: indexes 0..(points-1) and (points)..(points+9)
      return Column(
        children: List.generate(points, (i) {
          // Order: E1..E(points), then E(points+1)..E(points*2)
          final leftOrder = (i + 1).toDouble();
          final rightOrder = (points + (i + 1)).toDouble();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: FocusTraversalOrder(
                    order: NumericFocusOrder(leftOrder),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        if (!hasFocus) {
                          final id = _eccId(asLeft, i);
                          final parsed = double.tryParse(_pending[id] ?? '');
                          asLeft ? ctrl.setAsLeftEccentricityValue(i, parsed)
                                 : ctrl.setEccentricityValue(i, parsed);
                        }
                      },
                      child: RoundedTextField(
                        key: ValueKey('ecc_${asLeft ? 'L' : 'F'}_${i}_v$_fieldEpoch'),
                        label: 'E${i + 1}',
                        initialValue: fmt(asLeft
                            ? state.getAsLeftEccentricityValue(i)
                            : state.getEccentricityValue(i)),
                        onChanged: (val) => _pending[_eccId(asLeft, i)] = val,
                        fillColor: Colors.green.shade50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FocusTraversalOrder(
                    order: NumericFocusOrder(rightOrder),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        if (!hasFocus) {
                          final j = i + points;
                          final id = _eccId(asLeft, j);
                          final parsed = double.tryParse(_pending[id] ?? '');
                          asLeft ? ctrl.setAsLeftEccentricityValue(j, parsed)
                                 : ctrl.setEccentricityValue(j, parsed);
                        }
                      },
                      child: RoundedTextField(
                        key: ValueKey('ecc_${asLeft ? 'L' : 'F'}_${i + points}_v$_fieldEpoch'),
                        label: 'E${i + 1 + points}',
                        initialValue: fmt(asLeft
                            ? state.getAsLeftEccentricityValue(i + points)
                            : state.getEccentricityValue(i + points)),
                        onChanged: (val) => _pending[_eccId(asLeft, i + points)] = val,
                        fillColor: Colors.green.shade50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    } else {
      // Non-directional: rows of two, but traversal order is E1, E2, E3, ...
      return Column(
        children: List.generate((points / 2).ceil(), (row) {
          final leftIndex = row * 2;
          final rightIndex = row * 2 + 1;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: FocusTraversalOrder(
                    order: NumericFocusOrder((leftIndex + 1).toDouble()),
                    child: Focus(
                      onFocusChange: (hasFocus) {
                        if (!hasFocus) {
                          final id = _eccId(asLeft, leftIndex);
                          final parsed = double.tryParse(_pending[id] ?? '');
                          asLeft ? ctrl.setAsLeftEccentricityValue(leftIndex, parsed)
                                 : ctrl.setEccentricityValue(leftIndex, parsed);
                        }
                      },
                      child: RoundedTextField(
                        key: ValueKey('ecc_${asLeft ? "L" : "F"}_${leftIndex}_v$_fieldEpoch'),
                        label: 'E${leftIndex + 1}',
                        initialValue: fmt(asLeft
                            ? state.getAsLeftEccentricityValue(leftIndex)
                            : state.getEccentricityValue(leftIndex)),
                        onChanged: (val) => _pending[_eccId(asLeft, leftIndex)] = val,
                        fillColor: Colors.green.shade50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: rightIndex < points
                      ? FocusTraversalOrder(
                          order: NumericFocusOrder((rightIndex + 1).toDouble()),
                          child: Focus(
                            onFocusChange: (hasFocus) {
                              if (!hasFocus) {
                                final id = _eccId(asLeft, rightIndex);
                                final parsed = double.tryParse(_pending[id] ?? '');
                                asLeft ? ctrl.setAsLeftEccentricityValue(rightIndex, parsed)
                                       : ctrl.setEccentricityValue(rightIndex, parsed);
                              }
                            },
                            child: RoundedTextField(
                              key: ValueKey('ecc_${asLeft ? "L" : "F"}_${rightIndex}_v$_fieldEpoch'),
                              label: 'E${rightIndex + 1}',
                              initialValue: fmt(asLeft
                                  ? state.getAsLeftEccentricityValue(rightIndex)
                                  : state.getEccentricityValue(rightIndex)),
                              onChanged: (val) => _pending[_eccId(asLeft, rightIndex)] = val,
                              fillColor: Colors.green.shade50,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          );
        }),
      );
    }
  }

  /// Increasing test list (Test/Read pairs), committing on focus loss.
  /// Tab order continues after the last ECC entry:
  ///   ... E(n), then T1, R1, T2, R2, ..., T6, R6
  Widget _buildIncTestList(
    WeightTestFormController state, {
    required bool asLeft,
    required String Function(double?) fmt,
    required int eccCount,
  }) {
    final tests = asLeft ? state.asLeftTests : state.asFoundTests;
    final reads = asLeft ? state.asLeftReads : state.asFoundReads;
    final diffs = asLeft ? state.asLeftDiffs : state.asFoundDiffs;
    final ctrl = ref.read(weightTestFormProvider.notifier);

    return Column(
      children: List.generate(6, (i) {
        final t = tests[i];
        final r = reads[i];
        final diff = diffs[i];
        final isZero = diff != null && (diff / state.division).round() == 0;

        // Order positions after ECC:
        // Test i => eccCount + (2*i + 1)
        // Read i => eccCount + (2*i + 2)
        final tOrder = (eccCount + (2 * i + 1)).toDouble();
        final rOrder = (eccCount + (2 * i + 2)).toDouble();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: FocusTraversalOrder(
                  order: NumericFocusOrder(tOrder),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        final id = _testId(asLeft, i);
                        final parsed = double.tryParse(_pending[id] ?? '');
                        asLeft ? ctrl.setAsLeftTest(i, parsed)
                               : ctrl.setAsFoundTest(i, parsed);
                      }
                    },
                    child: RoundedTextField(
                      key: ValueKey('t_${asLeft ? "L" : "F"}_${i}_v$_fieldEpoch'),
                      label: 'Test ${i + 1}',
                      initialValue: fmt(t),
                      onChanged: (val) => _pending[_testId(asLeft, i)] = val,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: FocusTraversalOrder(
                  order: NumericFocusOrder(rOrder),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        final id = _readId(asLeft, i);
                        final parsed = double.tryParse(_pending[id] ?? '');
                        asLeft ? ctrl.setAsLeftRead(i, parsed)
                               : ctrl.setAsFoundRead(i, parsed);
                      }
                    },
                    child: RoundedTextField(
                      key: ValueKey('r_${asLeft ? "L" : "F"}_${i}_v$_fieldEpoch'),
                      label: 'Read ${i + 1}',
                      initialValue: fmt(r),
                      onChanged: (val) => _pending[_readId(asLeft, i)] = val,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Text(
                  diff != null ? state.formatDiff(diff) : '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isZero ? Colors.black : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // --- helpers for ids -------------------------------------------------------

  String _eccId(bool asLeft, int index) => 'ecc_${asLeft ? 'L' : 'F'}_$index';
  String _testId(bool asLeft, int i) => 't_${asLeft ? 'L' : 'F'}_$i';
  String _readId(bool asLeft, int i) => 'r_${asLeft ? 'L' : 'F'}_$i';
}
