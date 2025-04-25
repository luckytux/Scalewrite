// File: lib/providers/contact_list_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';

final contactListProvider = FutureProvider.family.autoDispose(
  (ref, int customerId) async {
    final db = ref.read(databaseProvider);
    return db.contactDao.getContactsForCustomer(customerId);
  },
);
