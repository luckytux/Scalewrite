// File: lib/dev/seed_users.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/drift_providers.dart';
import '../data/database.dart';

Future<void> seedUsers(AppDatabase db) async {
  final seedData = [
    {
      'uid': 'admin',
      'email': 'info@southernscaleco.com',
      'displayName': 'Admin',
      'password': 'password',
      'isAdmin': true,
    },
    {
      'uid': 'bruce',
      'email': 'bruceb@southernscaleco.com',
      'displayName': 'Bruce Barton',
      'password': 'password',
      'isAdmin': false,
    },
  ];

  for (final user in seedData) {
    await db.userDao.insertUser(
      uid: user['uid'] as String,
      email: user['email'] as String,
      displayName: user['displayName'] as String,
      password: user['password'] as String,
      isAdmin: user['isAdmin'] as bool,
    );
  }

  final seeded = await db.userDao.getAllUsers();
  for (final u in seeded) {
    print('✅ ${u.displayName} (${u.uid}) → UID# ${u.uidNumber} | Admin: ${u.isAdmin}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final db = container.read(databaseProvider);

  await seedUsers(db);
  await db.close();
}
