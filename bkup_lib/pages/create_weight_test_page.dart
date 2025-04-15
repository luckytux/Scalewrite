// File: lib/pages/create_weight_test_page.dart

import 'package:flutter/material.dart';

class CreateWeightTestPage extends StatefulWidget {
  final int serviceReportId;

  const CreateWeightTestPage({super.key, required this.serviceReportId});

  @override
  State<CreateWeightTestPage> createState() => _CreateWeightTestPageState();
}

class _CreateWeightTestPageState extends State<CreateWeightTestPage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> testPointControllers = [];
  final notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      testPointControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (final controller in testPointControllers) {
      controller.dispose();
    }
    notesController.dispose();
    super.dispose();
  }

  void saveWeightTest() {
    if (!_formKey.currentState!.validate()) return;

    // TODO: Replace with Drift DAO insert once `WeightTestResults` table is available
    final results = testPointControllers.map((c) => c.text).toList();
    final notes = notesController.text;

    // Simulate save
    debugPrint("Saving weight test for ServiceReport ID: ${widget.serviceReportId}");
    debugPrint("Test Points: $results");
    debugPrint("Notes: $notes");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Weight test saved (stub)")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Weight Test")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...List.generate(testPointControllers.length, (i) {
                return TextFormField(
                  controller: testPointControllers[i],
                  decoration: InputDecoration(labelText: 'Test Point ${i + 1}'),
                  keyboardType: TextInputType.number,
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                );
              }),
              const SizedBox(height: 20),
              TextFormField(
                controller: notesController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Notes'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveWeightTest,
                child: const Text('Save Weight Test'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
