// File: lib/pages/create_weight_test_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weight_test_form_provider.dart';
import '../widgets/weight_test/section_diagram.dart';

class CreateWeightTestPage extends ConsumerStatefulWidget {
  final int serviceReportId;
  final double division;

  const CreateWeightTestPage({super.key, required this.serviceReportId, this.division = 10});

  @override
  ConsumerState<CreateWeightTestPage> createState() => _CreateWeightTestPageState();
}

class _CreateWeightTestPageState extends ConsumerState<CreateWeightTestPage> {
  late final WeightTestFormController controller;

  @override
  void initState() {
    super.initState();
    controller = ref.read(weightTestFormProvider.notifier);
    controller.setServiceReportId(widget.serviceReportId);
    controller.setDivision(widget.division);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weightTestFormProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Weight Test')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              // --- Type & Direction Toggle ---
              Row(
                children: [
                  const Text('Type:'),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: state.eccentricityType,
                    items: ['Section', 'Directional'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => controller.setEccentricityType(val ?? 'Section'),
                  ),
                  const Spacer(),
                  if (state.eccentricityType == 'Directional')
                    DropdownButton<String>(
                      value: state.eccentricityDirections,
                      hint: const Text('Direction'),
                      items: ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => controller.setEccentricityDirections(val),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // --- Section Diagram + ECC Fields ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        for (int i = 0; i < state.eccentricityPoints; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TextFormField(
                              initialValue: state.eccentricityValues[i]?.toString() ?? '',
                              decoration: InputDecoration(
                                labelText: 'Pt ${i + 1}',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              ),
                              onChanged: (val) => controller.setEccentricityValue(i, double.tryParse(val)),
                              keyboardType: TextInputType.number,
                            ),
                          ),

                        if (state.eccentricityType == 'Directional')
                          const SizedBox(height: 16),

                        if (state.eccentricityType == 'Directional')
                          for (int i = 0; i < state.eccentricityPoints; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: TextFormField(
                                initialValue: state.eccentricityValues[i + 10]?.toString() ?? '',
                                decoration: InputDecoration(
                                  labelText: 'Ret ${state.eccentricityPoints - i}',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                ),
                                onChanged: (val) => controller.setEccentricityValue(i + 10, double.tryParse(val)),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(flex: 1, child: SectionDiagram(sections: state.eccentricityPoints)),
                ],
              ),

              const Divider(height: 32),

              // --- As Found: ECC + INC ---
              const Text('As Found: Eccentricity + Increasing Load Test', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildIncTestList(asLeft: false),

              const Divider(height: 32),

              // --- As Left Toggle ---
              Row(
                children: [
                  Switch(
                    value: state.showAsLeft,
                    onChanged: (val) => controller.toggleShowAsLeft(val),
                  ),
                  const Text('Show As Left Section')
                ],
              ),

              if (state.showAsLeft) ...[
                const SizedBox(height: 8),
                const Text('As Left: Eccentricity + Increasing Load Test', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildIncTestList(asLeft: true),
              ],

              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () async {
                  final nav = Navigator.of(context);
                  final ok = await controller.save();
                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(ok ? 'Weight Test Saved' : 'Error Saving')),
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

  Widget _buildIncTestList({required bool asLeft}) {
    final state = ref.watch(weightTestFormProvider);

    final tests = asLeft ? state.asLeftTests : state.asFoundTests;
    final reads = asLeft ? state.asLeftReads : state.asFoundReads;

    return Column(
      children: List.generate(6, (i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: tests[i]?.toString() ?? '',
                  decoration: InputDecoration(
                    labelText: 'Test ${i + 1}',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => asLeft
                      ? controller.setAsLeftTest(i, double.tryParse(val))
                      : controller.setAsFoundTest(i, double.tryParse(val)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  initialValue: reads[i]?.toString() ?? '',
                  decoration: InputDecoration(
                    labelText: 'Read ${i + 1}',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => asLeft
                      ? controller.setAsLeftRead(i, double.tryParse(val))
                      : controller.setAsFoundRead(i, double.tryParse(val)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
