import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ViewModel/auth_viewmodel.dart';
import 'package:todo_app/routes/routes_names.dart';

class SplashVM {
  void goToNextScreen(BuildContext context, mounted) {
    final auth = Provider.of<AuthViewmodel>(context,listen: false);
    Future.delayed(const Duration(seconds: 3), () {
      auth.checkusersesion(context);
    });
  }

}
