import 'package:flutter/material.dart';
import 'package:todo_app/View/Edit_Screen_View/Edit_Screen.dart';
import 'package:todo_app/View/Home_Screen_View/Home_Screen.dart';
import 'package:todo_app/View/Login_Screen_View/Login_Screen.dart';
import 'package:todo_app/View/Post_Screen_View/Post_Screen.dart';
import 'package:todo_app/View/SignUp_Screen_View/SignUp_Screen.dart';
import 'package:todo_app/View/Splash_Screen_View/Splash_Screen.dart';
import 'package:todo_app/View/WellCome_Screen_View/WellCome_Screen.dart';
import 'package:todo_app/routes/routes_names.dart';

class AppRoutes {

  static Route<dynamic>  generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case RoutesNames.SplashScreen:
        return fadeRoute(SplashScreen());

      case RoutesNames.wellcomde:
        return fadeRoute(WellcomeScreen());

      case RoutesNames.loginscreen:
        return fadeRoute(LoginScreen());

      case RoutesNames.signupscreen:
        return fadeRoute(SignupScreen());

      case RoutesNames.homescreen:
        return fadeRoute(HomeScreen());

      case RoutesNames.postscreen:
        return fadeRoute(PostScreen());

      case RoutesNames.editscreen:
        return fadeRoute(EditScreen());

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
        Scaffold(
          body: Center(
            child: Text(
              'No route defined for this path'
            ),
          ),
        )
      );
    }
  }
}

Route<dynamic> fadeRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 1),
  );
}