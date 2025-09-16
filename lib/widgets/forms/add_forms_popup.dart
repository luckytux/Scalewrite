// File: lib/widgets/forms/add_forms_popup.dart

import 'package:flutter/material.dart';
import '../../data/static/ipo_checklists.dart';

typedef OnFormSelected = void Function(String formType, {String? ipoType});

class AddFormsPopup extends StatelessWidget {
  final OnFormSelected onFormSelected;
  const AddFormsPopup({Key? key, required this.onFormSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Form'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Weight Test'),
              onPressed: () {
                Navigator.of(context).pop();
                onFormSelected('Weight Test');
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('Inspection Procedure'),
              onPressed: () {
                _showIpoDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showIpoDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false, // optional: prevent accidental dismissal
      builder: (context) {
        return AlertDialog(
          title: const Text('Select IPO Type'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView(
              shrinkWrap: true,
              children: ipoChecklists.entries.map((e) {
                final id = e.key;
                final title = e.value.title;
                return ListTile(
                  title: Text('$id — $title'),
                  onTap: () {
                    Navigator.of(context).pop(); // close IPO list
                    Navigator.of(context).pop(); // close parent dialog
                    onFormSelected('Inspection Procedure', ipoType: id);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
