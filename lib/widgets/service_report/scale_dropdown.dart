// File: lib/widgets/service_report/scale_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/database.dart';
import '../../../providers/drift_providers.dart';
import '../../../providers/service_report_form_provider.dart';

class ScaleDropdown extends ConsumerWidget {
  final int customerId;
  final int? selectedScaleId;
  final void Function(Scale?) onChanged;

  const ScaleDropdown({
    super.key,
    required this.customerId,
    required this.selectedScaleId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Scale>>(
      future: ref.read(scaleDaoProvider).getScalesForCustomer(customerId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 56,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: 'Scale',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.red.shade50,
            ),
            child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)),
          );
        }

        final scales = snapshot.data ?? <Scale>[];

        // Build entries: all scales + "Create New"
        final entries = <DropdownMenuEntry<Scale?>>[
          for (final s in scales)
            DropdownMenuEntry<Scale?>(
              value: s,
              label: '${s.scaleType} - ${s.indicatorModel} (${s.indicatorSerial})',
            ),
          const DropdownMenuEntry<Scale?>(
            value: null,
            label: '➕ Create New Scale',
          ),
        ];

        // Find currently selected Scale object by id (so identity matches an entry)
        Scale? selectedScale;
        if (selectedScaleId != null) {
          for (final s in scales) {
            if (s.id == selectedScaleId) {
              selectedScale = s;
              break;
            }
          }
        }

        final fill = Colors.teal.shade50;

        return DropdownMenu<Scale?>(
          // replaces: value:
          initialSelection: selectedScale,
          // replaces: items:
          dropdownMenuEntries: entries,
          // replaces: onChanged:
          onSelected: (Scale? value) {
            final controller = ref.read(serviceReportFormProvider);
            if (value == null) {
              // user chose "Create New"
              controller.setIsCreatingNewScale(true);
              onChanged(null);
            } else {
              controller.setIsCreatingNewScale(false);
              onChanged(value);
            }
          },
          label: const Text('Scale'),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: fill,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          menuStyle: MenuStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // Arrow keys & type-to-search work out of the box with DropdownMenu.
          // You can also set width if desired:
          // width: MediaQuery.of(context).size.width, // optional
        );
      },
    );
  }
}
