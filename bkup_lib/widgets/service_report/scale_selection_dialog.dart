// File: lib/widgets/service_report/scale_selection_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/tables/scales.dart';
import '../../providers/scale_provider.dart';

class ScaleSelectionDialog extends ConsumerWidget {
  final int customerId;
  final void Function(Scale selected) onSelected;

  const ScaleSelectionDialog({
    super.key,
    required this.customerId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaleStream = ref.watch(scaleListByCustomerProvider(customerId));

    return AlertDialog(
      title: const Text('Select Scale'),
      content: scaleStream.when(
        data: (scales) {
          if (scales.isEmpty) {
            return const Text('No scales found for this customer.');
          }

          return SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: scales.length,
              itemBuilder: (context, index) {
                final scale = scales[index];
                return ListTile(
                  title: Text('${scale.scaleType} - ${scale.indicatorModel}'),
                  subtitle: Text('Division: ${scale.division}'),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(scale);
                  },
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Text('Error: $e'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
