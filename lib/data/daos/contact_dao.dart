// File: lib/data/daos/contact_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/contacts.dart';

part 'contact_dao.g.dart';

@DriftAccessor(tables: [Contacts])
class ContactDao extends DatabaseAccessor<AppDatabase> with _$ContactDaoMixin {
  ContactDao(super.db);

  bool? _supportsUpdatedAt; // null = unknown; true/false cached after first check

  Future<void> _detectUpdatedAtSupport() async {
    if (_supportsUpdatedAt != null) return;
    try {
      final rows = await customSelect(
        'PRAGMA table_info(contacts);',
        readsFrom: {contacts},
      ).get();
      final names = rows.map((r) => (r.data['name'] as String).toLowerCase()).toSet();
      _supportsUpdatedAt = names.contains('updated_at');
    } catch (_) {
      _supportsUpdatedAt = false;
    }
  }

  // ---------- Reads ----------

  Future<List<Contact>> getContactsForCustomer(
    int customerId, {
    bool onlyActive = false,
  }) {
    final q = (select(contacts)..where((t) => t.customerId.equals(customerId)));
    if (onlyActive) {
      q.where((t) => t.deactivate.equals(false));
    }
    q.orderBy([
      (t) => OrderingTerm.desc(t.isMain),
      (t) => OrderingTerm.asc(t.name),
    ]);
    return q.get();
  }

  Future<List<Contact>> getAllForCustomer(int customerId) =>
      getContactsForCustomer(customerId, onlyActive: false);

  // ---------- Internal helpers ----------

  Future<int> _writeWithTouch(UpdateStatement<Contacts, Contact> stmt, ContactsCompanion changes) async {
    await _detectUpdatedAtSupport();
    if (_supportsUpdatedAt == true) {
      return stmt.write(
        changes.copyWith(updatedAt: Value(DateTime.now())),
      );
    } else {
      // Fallback: write without touching updated_at (so app won’t crash on stale DB)
      return stmt.write(changes);
    }
  }

  UpdateStatement<Contacts, Contact> _updateById(int id) =>
      (update(contacts)..where((t) => t.id.equals(id)));

  UpdateStatement<Contacts, Contact> _updateByCustomer(int customerId) =>
      (update(contacts)..where((t) => t.customerId.equals(customerId)));

  // ---------- Writes ----------

  Future<int> insertContact(ContactsCompanion entry) => into(contacts).insert(entry);

  Future<int> updateContactById(int id, ContactsCompanion entry) {
    return _writeWithTouch(_updateById(id), entry);
  }

  Future<int> deactivateContactsForCustomer(int customerId) {
    return _writeWithTouch(
      _updateByCustomer(customerId),
      const ContactsCompanion(deactivate: Value(true)),
    );
  }

  Future<int> deactivateContactsExcept(int customerId, List<int> keepIds) async {
    if (keepIds.isEmpty) {
      return deactivateContactsForCustomer(customerId);
    }
    final stmt = (update(contacts)
          ..where((t) => t.customerId.equals(customerId))
          ..where((t) => t.id.isNotIn(keepIds)));
    return _writeWithTouch(
      stmt,
      const ContactsCompanion(deactivate: Value(true)),
    );
  }

  // ---------- Optional convenience ----------

  Future<int> reactivateContactsByIds(int customerId, List<int> ids) {
    if (ids.isEmpty) return Future.value(0);
    final stmt = (update(contacts)
          ..where((t) => t.customerId.equals(customerId))
          ..where((t) => t.id.isIn(ids)));
    return _writeWithTouch(stmt, const ContactsCompanion(deactivate: Value(false)));
  }

  Future<void> setMainContact(int customerId, int contactId) async {
    final unsetStmt = _updateByCustomer(customerId)
      ..where((t) => t.isMain.equals(true));
    await _writeWithTouch(
      unsetStmt,
      const ContactsCompanion(isMain: Value(false)),
    );
    await _writeWithTouch(
      _updateById(contactId),
      const ContactsCompanion(isMain: Value(true)),
    );
  }
}
