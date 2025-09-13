import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/utils.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  User? _user;
  User? get user => _user;

  // Signup loading
  bool _signuploading = false;
  bool get signuploading => _signuploading;
  void setsignuploading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  // Login loading
  bool _loginloading = false;
  bool get loginloading => _loginloading;
  void setloginloading(bool value) {
    _loginloading = value;
    notifyListeners();
  }

  //logout
  bool _logoutloading = false;
  bool get logoutloading => _logoutloading;
  void setlogoutloading(bool value) {
    _logoutloading = value;
    notifyListeners();
  }

  // Signup
  Future<void> signupUser(String email, String password, BuildContext context) async {
    setsignuploading(true);
    try {
      final value = await _authRepository.signUp(email, password);
      _user = value;
      setsignuploading(false);
      Utils.snackbar('Signup Successfully', context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNames.homescreen,
            (routes) => false,
      );
      if (kDebugMode) {
        print("Signed up user: $value");
      }
    } catch (error) {
      setsignuploading(false);
      Utils.flushbar(error.toString(), context);
      if (kDebugMode) {
        print("Signup error: $error");
      }
    }
  }

  //login
  Future<void> loginuser(String email, String password, BuildContext context) async {
    setloginloading(true);
    try{
      final value = await _authRepository.login(
          email,
          password
      );
      _user = value;
      setloginloading(false);
      Utils.snackbar('Login Successfully', context);
      Navigator.pushNamedAndRemoveUntil(context,
          RoutesNames.homescreen,
          (routes) => false
      );
      if(kDebugMode){
        print('Logined user: $value');
      }
    } catch (error) {
      setloginloading(false);
    Utils.flushbar(error.toString(), context);
      if(kDebugMode) {
        print('Login error $error');
    }
    }
  }

  //logout
 Future<void> logoutuser(BuildContext context) async {
    setlogoutloading(true);
    try{
      await _authRepository.logout();
      _user = null;
      setlogoutloading(false);
      Utils.snackbar('Logout Successfully', context);
      Navigator.pushNamedAndRemoveUntil(context,
          RoutesNames.wellcome,
          (routes) => false,
      );
    } catch (error){
      setlogoutloading(false);
      Utils.flushbar(error.toString(), context);
    }
 }

 //checkuersecion
  Future<void> checkusersesion(BuildContext context) async {
    try {
      await _authRepository.getCurrentUser();
        if (user != null) {
          // User already logged in
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNames.homescreen,
                (routes) => false,
          );
        } else {
          // User not logged in
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNames.wellcome,
                (routes) => false,
          );
        }
    } catch (e) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNames.wellcome,
            (routes) => false,
      );
    }
  }

}
