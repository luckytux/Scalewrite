// File: lib/widgets/work_order/work_order_number_box.dart
import 'package:flutter/material.dart';

class WorkOrderNumberBox extends StatelessWidget {
  final String workOrderNumber;

  const WorkOrderNumberBox({super.key, required this.workOrderNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.confirmation_number, color: Colors.teal),
          const SizedBox(width: 10),
          Text(
            workOrderNumber,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
