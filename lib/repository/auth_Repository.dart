import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/Firebase_Services/auth_services.dart';

class AuthRepository {
  final AuthServices _authServices = AuthServices();

  // Sign Up
  Future<User?> signUp(String email, String password) async {
    try {
      return await _authServices.signUp(email, password);
    } catch (e) {
      rethrow;
    }
  }

  // Login
  Future<User?> login(String email, String password) async {
    try {
      return await _authServices.login(email, password);
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      return await _authServices.logout();
    } catch (e) {
      rethrow;
    }
  }

  // Current User
  User? getCurrentUser() {
    try {
      return _authServices.getcurrentuser();
    } catch (e) {
      rethrow;
    }
  }
}
