// File: lib/providers/user_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../data/daos/user_dao.dart';
import '../providers/drift_providers.dart';

/// Provide list of all users
final userListProvider = FutureProvider<List<AppUser>>((ref) async {
  final dao = ref.read(userDaoProvider);
  return dao.getAllUsers();
});

/// Provide high-level user actions like add/delete/reset password
final userActionsProvider = Provider<UserActions>((ref) {
  final dao = ref.read(userDaoProvider);
  return UserActions(dao);
});

class UserActions {
  final UserDao dao;
  UserActions(this.dao);

  Future<void> addUser(String uid, String email, String displayName, String password, bool isAdmin) async {
    await dao.insertUser(
      uid: uid,
      email: email,
      displayName: displayName,
      password: password,
      isAdmin: isAdmin,
    );
  }

  Future<void> deleteUser(int id) async {
    await dao.deleteUserById(id);
  }

  Future<void> resetPassword(String uid) async {
    await dao.updateUserPassword(uid, 'password'); // default reset password
  }
}
