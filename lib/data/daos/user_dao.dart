// File: lib/data/daos/user_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/users.dart';
import 'package:bcrypt/bcrypt.dart';

part 'user_dao.g.dart';

// Utility functions
String hashPassword(String password) {
  return BCrypt.hashpw(password, BCrypt.gensalt());
}

bool verifyPassword(String password, String? storedHash) {
  // Never throw if the hash is missing/garbled
  if (storedHash == null || storedHash.isEmpty) return false;
  try {
    return BCrypt.checkpw(password, storedHash);
  } catch (_) {
    // Malformed hash, treat as invalid
    return false;
  }
}

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<AppUser?> loginWithCredentials(String uid, String password) async {
    final user = await getUserByUid(uid.trim());
    if (user != null && verifyPassword(password, user.passwordHash)) {
      return user;
    }
    return null;
  }

  Future<AppUser?> getUserByUid(String uid) {
    return (select(users)..where((u) => u.uid.equals(uid))).getSingleOrNull();
  }

  Future<int> getNextUidNumber() async {
    final result = await customSelect(
      'SELECT MAX(uid_number) as max FROM users',
      readsFrom: {users},
    ).getSingle();
    final max = result.data['max'] as int?;
    return (max ?? 99) + 1;
  }

  Future<void> insertUser({
    required String uid,
    required String email,
    required String displayName,
    required String password,
    required bool isAdmin,
  }) async {
    final uidNumber = await getNextUidNumber();
    final hashed = hashPassword(password);

    final user = UsersCompanion(
      uid: Value(uid),
      email: Value(email),
      displayName: Value(displayName),
      passwordHash: Value(hashed),
      isAdmin: Value(isAdmin),
      uidNumber: Value(uidNumber),
    );

    await into(users).insert(user);
  }

  Future<void> updateUserPassword(String uid, String plainPassword) async {
    final hashed = hashPassword(plainPassword);
    await (update(users)..where((u) => u.uid.equals(uid))).write(
      UsersCompanion(passwordHash: Value(hashed)),
    );
  }

  Future<void> updateUser(AppUser user) => update(users).replace(user);

  Future<List<AppUser>> getAllUsers() => select(users).get();

  Future<int> deleteUserById(int id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();
}
