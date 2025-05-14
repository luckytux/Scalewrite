// File: lib/widgets/service_report/notes_section.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../common/rounded_container.dart';

class NotesSection extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;

  const NotesSection({
    super.key,
    required this.controller,
    required this.enabled,
  });

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  final newNoteController = TextEditingController();

  void addTimestampedNote() {
    final input = newNoteController.text.trim();
    if (input.isEmpty) return;

    final now = DateTime.now();
    final timestamp = DateFormat('yyyy-MM-dd HH:mm').format(now);
    final entry = '\n[$timestamp] $input';

    setState(() {
      widget.controller.text += entry;
      newNoteController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      label: 'Notes / Location (Optional)',
      editable: widget.enabled,
      child: Column(
        children: [
          // Display existing notes
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 100, maxHeight: 300),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: SelectableText(
                  widget.controller.text.isNotEmpty
                      ? widget.controller.text.trim()
                      : 'No notes yet.',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Entry input
          if (widget.enabled) ...[
            TextFormField(
              controller: newNoteController,
              decoration: const InputDecoration(
                hintText: 'Add new note...',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              minLines: 1,
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: addTimestampedNote,
                icon: const Icon(Icons.add),
                label: const Text('Add Note'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
