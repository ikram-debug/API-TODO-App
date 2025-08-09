import 'package:flutter/material.dart';


class SplashVM {
  void goToNextScreen(BuildContext context, String nextScreen, mounted) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        if(!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          nextScreen, (routes) => false,
        );
      });
    });
  }
}
