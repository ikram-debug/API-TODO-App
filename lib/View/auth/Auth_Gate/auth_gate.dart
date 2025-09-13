import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/routes/routes_names.dart';

import '../../Home_Screen_View/Home_Screen.dart';
import '../WellCome_Screen_View/WellCome_Screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 🔹 Jab tak authStateChanges ka pehla result nahi aata
        if (snapshot.connectionState == ConnectionState.waiting) {
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
                  child: CircularProgressIndicator(color: kwhitecolor),
                ),
              ],
            ),
          );
        }

        // 🔹 Ab hamesha direct screen return karna hai (navigation use mat karo yahan)
        if (snapshot.hasData && snapshot.data != null) {
          // ✅ user logged in hai
          return const HomeScreen();
        } else {
          // ❌ user null hai
          return const WellcomeScreen();
        }
      },
    );
  }
}
