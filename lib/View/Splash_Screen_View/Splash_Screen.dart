import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/ViewModel/SplashVModel.dart';
import 'package:todo_app/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashVM _splashVM = SplashVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashVM.goToNextScreen(context, mounted);
  }
  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
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
              height: AppSizes.hp(50),
              width: AppSizes.wp(50),
              child: Image.asset(
                'assets/Logo.png',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
