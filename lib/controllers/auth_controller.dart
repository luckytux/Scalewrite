// File: lib/controllers/auth_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../data/daos/user_dao.dart';

class AuthController extends StateNotifier<AppUser?> {
  final UserDao userDao;

  AuthController(this.userDao) : super(null);

  Future<bool> login(String uid, String password) async {
    final user = await userDao.loginWithCredentials(uid, password);
    if (user != null) {
      state = user;
      return true;
    }
    return false;
  }

  void logout() {
    state = null;
  }

  bool get isLoggedIn => state != null;
}