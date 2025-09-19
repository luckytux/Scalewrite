// File: lib/sync/sync_ui.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sync_repository.dart';

Future<void> showSyncPreviewSheet(BuildContext context, WidgetRef ref) async {
  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _SyncPreviewSheet(ref: ref),
  );
}

class _SyncPreviewSheet extends StatefulWidget {
  const _SyncPreviewSheet({required this.ref});
  final WidgetRef ref;

  @override
  State<_SyncPreviewSheet> createState() => _SyncPreviewSheetState();
}

class _SyncPreviewSheetState extends State<_SyncPreviewSheet> {
  bool _loading = true;
  String? _error;

  dynamic _preview; // expects: workOrders, serviceReports, weightTests
  dynamic _payload; // expects: toPrettyJson()

  // Controller for the JSON area's Scrollbar + ScrollView
  late final ScrollController _jsonScrollCtrl;

  @override
  void initState() {
    super.initState();
    _jsonScrollCtrl = ScrollController();
    _load();
  }

  @override
  void dispose() {
    _jsonScrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final repo = widget.ref.read(syncRepositoryProvider);
      final preview = await repo.getPreview();
      final payload = await repo.buildPayload();

      if (!mounted) return;
      setState(() {
        _preview = preview;
        _payload = payload;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  int get _totalToPush {
    if (_preview == null) return 0;
    final wo = (_preview.workOrders as int?) ?? 0;
    final sr = (_preview.serviceReports as int?) ?? 0;
    final wt = (_preview.weightTests as int?) ?? 0;
    return wo + sr + wt;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16 + bottomInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                const Text('Sync Preview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  tooltip: 'Refresh',
                  onPressed: _loading ? null : _load,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(height: 4),

            if (_loading) ...[
              const LinearProgressIndicator(),
              const SizedBox(height: 12),
            ] else if (_error != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.errorContainer,
                  border: Border.all(color: cs.error),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _error!,
                  style: TextStyle(color: cs.onErrorContainer),
                ),
              ),
              const SizedBox(height: 12),
            ] else ...[
              _countTile(icon: Icons.assignment,   label: 'Work Orders',    count: _preview.workOrders ?? 0),
              _countTile(icon: Icons.receipt_long, label: 'Service Reports', count: _preview.serviceReports ?? 0),
              _countTile(icon: Icons.scale,        label: 'Weight Tests',    count: _preview.weightTests ?? 0),
              const SizedBox(height: 8),

              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: const Text('View payload (JSON)'),
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 260),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Scrollbar(
                      controller: _jsonScrollCtrl,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: _jsonScrollCtrl,
                        child: SelectableText(
                          _payload?.toPrettyJson() ?? '',
                          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        onPressed: (_payload == null)
                            ? null
                            : () async {
                                await Clipboard.setData(
                                  ClipboardData(text: _payload.toPrettyJson()),
                                );
                                if (!mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Copied JSON to clipboard')),
                                );
                              },
                        icon: const Icon(Icons.copy),
                        label: const Text('Copy JSON'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],

            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.close),
                    label: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    icon: const Icon(Icons.cloud_upload),
                    label: Text(_loading ? 'Pushing…' : 'Push Now ($_totalToPush)'),
                    onPressed: (_loading || _totalToPush == 0)
                        ? null
                        : () async {
                            setState(() => _loading = true);
                            try {
                              final repo = widget.ref.read(syncRepositoryProvider);
                              final ok = await repo.pushNow();
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(ok ? 'Sync complete' : 'Sync failed')),
                              );
                              if (ok && mounted) Navigator.pop(context);
                            } catch (e) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sync failed: $e')),
                              );
                            } finally {
                              if (mounted) setState(() => _loading = false);
                            }
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _countTile({
    required IconData icon,
    required String label,
    required int count,
  }) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(label),
      trailing: Text(
        count.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
