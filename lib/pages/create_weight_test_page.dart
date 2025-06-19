import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weight_test_form_provider.dart';
import '../widgets/weight_test/section_diagram.dart';
import '../widgets/common/rounded_text_field.dart';

class CreateWeightTestPage extends ConsumerStatefulWidget {
  final int serviceReportId;
  final double division;

  const CreateWeightTestPage({
    super.key,
    required this.serviceReportId,
    this.division = 10,
  });

  @override
  ConsumerState<CreateWeightTestPage> createState() =>
      _CreateWeightTestPageState();
}

class _CreateWeightTestPageState extends ConsumerState<CreateWeightTestPage> {
  late final WeightTestFormController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller = ref.read(weightTestFormProvider.notifier);
      controller.setServiceReportId(widget.serviceReportId);
      controller.setDivision(widget.division);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weightTestFormProvider);

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
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => ref
                        .read(weightTestFormProvider.notifier)
                        .setEccentricityType(val ?? 'Section'),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: state.weightTestUnit,
                    items: ['kg', 'lb']
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e)))
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
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => ref
                          .read(weightTestFormProvider.notifier)
                          .setEccentricityDirections(val),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSection(context, state, asLeft: false),
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
                        onPressed: () => ref
                            .read(weightTestFormProvider.notifier)
                            .copyEccentricityValues(),
                        child: const Text('Copy Eccentricity'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(weightTestFormProvider.notifier)
                            .copyIncreasingValues(),
                        child: const Text('Copy Increasing'),
                      ),
                    ],
                  ),
                ),
                _buildSection(context, state, asLeft: true),
              ],
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () async {
                  final nav = Navigator.of(context);
                  final ok = await ref
                      .read(weightTestFormProvider.notifier)
                      .save();
                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(ok
                            ? 'Weight Test Saved'
                            : 'Error Saving Weight Test')),
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

  Widget _buildSection(BuildContext context, WeightTestFormController state,
      {required bool asLeft}) {
    final eccLabel = asLeft ? 'As Left Section' : 'As Found Section';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eccLabel,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildEccentricityInputs(context, state, asLeft: asLeft),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: SectionDiagram(
                sections: state.eccentricityPoints,
                isDirectional: state.isDirectional,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: _buildIncTestList(state, asLeft: asLeft),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEccentricityInputs(BuildContext context,
      WeightTestFormController state, {required bool asLeft}) {
    final isDirectional = state.isDirectional;
    final points = state.eccentricityPoints;
    final controller = ref.read(weightTestFormProvider.notifier);

    if (isDirectional) {
      return Column(
        children: List.generate(
          points,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: RoundedTextField(
                    label: 'E${i + 1}',
                    initialValue: asLeft
                        ? state.getAsLeftEccentricityValue(i)?.toString()
                        : state.getEccentricityValue(i)?.toString(),
                    onChanged: (val) {
                      final parsed = double.tryParse(val);
                      if (asLeft) {
                        controller.setAsLeftEccentricityValue(i, parsed);
                      } else {
                        controller.setEccentricityValue(i, parsed);
                      }
                    },
                    fillColor: Colors.green.shade50,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RoundedTextField(
                    label: 'E${i + 11}',
                    initialValue: asLeft
                        ? state.getAsLeftEccentricityValue(i + 10)?.toString()
                        : state.getEccentricityValue(i + 10)?.toString(),
                    onChanged: (val) {
                      final parsed = double.tryParse(val);
                      if (asLeft) {
                        controller.setAsLeftEccentricityValue(i + 10, parsed);
                      } else {
                        controller.setEccentricityValue(i + 10, parsed);
                      }
                    },
                    fillColor: Colors.green.shade50,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      final rows = (points / 2).ceil();
      return Column(
        children: List.generate(rows, (i) {
          final leftIndex = i * 2;
          final rightIndex = i * 2 + 1;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: RoundedTextField(
                    label: 'E${leftIndex + 1}',
                    initialValue: asLeft
                        ? state.getAsLeftEccentricityValue(leftIndex)
                            ?.toString()
                        : state.getEccentricityValue(leftIndex)?.toString(),
                    onChanged: (val) {
                      final parsed = double.tryParse(val);
                      if (asLeft) {
                        controller.setAsLeftEccentricityValue(
                            leftIndex, parsed);
                      } else {
                        controller.setEccentricityValue(leftIndex, parsed);
                      }
                    },
                    fillColor: Colors.green.shade50,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: rightIndex < points
                      ? RoundedTextField(
                          label: 'E${rightIndex + 1}',
                          initialValue: asLeft
                              ? state
                                  .getAsLeftEccentricityValue(rightIndex)
                                  ?.toString()
                              : state
                                  .getEccentricityValue(rightIndex)
                                  ?.toString(),
                          onChanged: (val) {
                            final parsed = double.tryParse(val);
                            if (asLeft) {
                              controller.setAsLeftEccentricityValue(
                                  rightIndex, parsed);
                            } else {
                              controller.setEccentricityValue(
                                  rightIndex, parsed);
                            }
                          },
                          fillColor: Colors.green.shade50,
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

  Widget _buildIncTestList(WeightTestFormController state,
      {required bool asLeft}) {
    final tests = asLeft ? state.asLeftTests : state.asFoundTests;
    final reads = asLeft ? state.asLeftReads : state.asFoundReads;
    final diffs = asLeft ? state.asLeftDiffs : state.asFoundDiffs;
    final controller = ref.read(weightTestFormProvider.notifier);

    return Column(
      children: List.generate(6, (i) {
        final diff = diffs[i];
        final isZero = diff != null && diff == 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: RoundedTextField(
                  label: 'Test ${i + 1}',
                  initialValue: tests[i]?.toString() ?? '',
                  onChanged: (val) {
                    final parsed = double.tryParse(val);
                    asLeft
                        ? controller.setAsLeftTest(i, parsed)
                        : controller.setAsFoundTest(i, parsed);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: RoundedTextField(
                  label: 'Read ${i + 1}',
                  initialValue: reads[i]?.toString() ?? '',
                  onChanged: (val) {
                    final parsed = double.tryParse(val);
                    asLeft
                        ? controller.setAsLeftRead(i, parsed)
                        : controller.setAsFoundRead(i, parsed);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Text(
                  diff != null ? state.formatDiff(diff, state.division) : '',
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
}
