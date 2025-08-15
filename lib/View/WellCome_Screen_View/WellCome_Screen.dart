import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';
import 'package:todo_app/Core/widgets/Custom_RoundButton2.dart';
import 'package:todo_app/Core/widgets/custom_RoundButton.dart';
import 'package:todo_app/routes/routes_names.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
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
            Padding(
              padding: AppPaddings.only(
                  left: 5,
                  right: 5,
                  bottom: 0,
                  top: 15
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'WelCome To \n TaskMate',
                      style: AppTextStyle.bodylarge,
                    ),
                    AppGaps.h5(),
                    Text(
                      'Let’s make every day a productive day',
                      style: AppTextStyle.bodywhite,
                    ),
                    AppGaps.h35(),
                    CustomRoundbutton2(
                        title: 'Login',
                        onpressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RoutesNames.loginscreen,
                                  (route) => false
                          );
                        }
                    ),
                    AppGaps.h5(),
                    CustomRoundbutton(
                        title: 'SignUp',
                        onpressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RoutesNames.signupscreen,
                                  (route) => false)
                          ;
                        }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
