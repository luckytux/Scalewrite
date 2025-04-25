// File: lib/pages/manage_scales_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/tables/scales.dart';
import '../../providers/drift_providers.dart';
import 'create_edit_scale_page.dart';

class ManageScalesPage extends ConsumerWidget {
  final int customerId;

  const ManageScalesPage({super.key, required this.customerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaleDao = ref.watch(scaleDaoProvider);
    final scalesStream = scaleDao.watchScalesForCustomer(customerId);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Scales')),
      body: StreamBuilder<List<Scale>>(
        stream: scalesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final scales = snapshot.data!;
          if (scales.isEmpty) {
            return const Center(child: Text('No scales found for this customer.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: scales.length,
            itemBuilder: (context, index) {
              final scale = scales[index];
              return Card(
                child: ListTile(
                  title: Text('${scale.scaleType} (${scale.scaleSubtype})'),
                  subtitle: Text('Capacity: ${scale.capacityValue} ${scale.capacityUnit}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CreateEditScalePage(
                            customerId: customerId,
                            existingScale: scale,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CreateEditScalePage(customerId: customerId),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
