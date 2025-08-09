import 'package:flutter/material.dart';
import 'package:todo_app/ViewModel/SplashVModel.dart';
import 'package:todo_app/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashVM _VModel = SplashVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _VModel.goToNextScreen(context, RoutesNames.homescreen,mounted);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/BackGround Image.jpeg',
            fit: BoxFit.cover,
          ),
        ),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/Logo.png',
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
    );
  }
}
