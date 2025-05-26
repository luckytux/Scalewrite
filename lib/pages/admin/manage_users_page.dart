// File: lib/pages/admin/manage_users_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/user_providers.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';

class ManageUsersPage extends ConsumerWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Users')),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error loading users: $e')),
        data: (users) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.person_add),
                label: const Text('Add New User'),
                onPressed: () => _showUserDialog(context, ref),
              ),
              const SizedBox(height: 24),
              const Text('Users:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.uid),
                      subtitle: Text(user.isAdmin ? 'Admin' : 'Standard User'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            tooltip: 'Reset Password',
                            onPressed: () => ref.read(userActionsProvider).resetPassword(user.uid),

                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            tooltip: 'Delete User',
                            onPressed: () => ref.read(userActionsProvider).deleteUser(user.id),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showUserDialog(BuildContext context, WidgetRef ref) {
    final uidController = TextEditingController();
    final passwordController = TextEditingController();
    bool isAdmin = false;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New User'),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundedTextField(controller: uidController, label: 'User ID'),
              const SizedBox(height: 12),
              RoundedTextField(controller: passwordController, label: 'Password', obscureText: true),
              const SizedBox(height: 12),
              CheckboxListTile(
                value: isAdmin,
                onChanged: (val) => setState(() => isAdmin = val ?? false),
                title: const Text('Grant Admin Access'),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('Create'),
            onPressed: () async {
              final actions = ref.read(userActionsProvider);
              await actions.addUser(
                uidController.text.trim(),
                '${uidController.text.trim()}@example.com', // email
                uidController.text.trim(),                 // display name
                passwordController.text.trim(),
                isAdmin,
              );
              Navigator.pop(context);
              ref.invalidate(userListProvider);
            },
          ),
        ],
      ),
    );
  }
}
