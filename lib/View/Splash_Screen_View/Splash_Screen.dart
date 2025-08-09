import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/Logo.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
