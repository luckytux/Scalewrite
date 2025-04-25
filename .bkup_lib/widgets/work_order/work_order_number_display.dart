import 'package:flutter/material.dart';

class WorkOrderNumberDisplay extends StatelessWidget {
  final String workOrderNumber;

  const WorkOrderNumberDisplay({super.key, required this.workOrderNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'Work Order #: $workOrderNumber',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
