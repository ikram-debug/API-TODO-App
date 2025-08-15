import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/widgets/CustomValidator.dart';
import 'package:todo_app/Core/widgets/Custom_RoundButton2.dart';
import 'package:todo_app/Core/widgets/custom_Inkwellbutton.dart';
import 'package:todo_app/Core/widgets/custom_RoundButton.dart';
import 'package:todo_app/Core/widgets/custom_textfield.dart';
import 'package:todo_app/routes/routes_names.dart';

import '../../Core/constant/text_sizes.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();


  @override
  void dispose() {
    emailcontroler.dispose();
    passwordcontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(

        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/BackGround Image.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: AppPaddings.symmetric(5, 2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: AppSizes.hp(30),
                        width: AppSizes.wp(30),
                        child: Image.asset(
                          'assets/Logo.png',
                          color: kwhitecolor,
                        ),
                      ),
                    ),
                    Text(
                      'LOGIN',
                      style: AppTextStyle.bodylarge,
                    ),
                    Text(
                      'and take control of your day!',
                      style: AppTextStyle.bodywhite,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppGaps.h5(),
                          CustomTextField(
                            controller: emailcontroler,
                            hintText: 'Enter your email',
                            prefixIcon: Icons.email,
                            validator: EmailValidator(),
                          ),
                          AppGaps.h2(),
                          CustomTextField(
                            hintText: 'Enter your password',
                            prefixIcon: Icons.lock,
                            isEyeTrue: true,
                            validator: passwordValidator(),
                          ),
                          AppGaps.h2(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CustomInkwellbutton(
                                title: 'Forgot Password?',
                                onpress: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RoutesNames.forgotpassword,
                                          (routes) => true
                                  );
                                }
                            ),
                          ),
                          AppGaps.h5(),
                          CustomRoundbutton(
                            title: 'Login',
                            onpressed: () { if(_formkey.currentState!.validate())
                            {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RoutesNames.homescreen,
                                      (routes) => false
                              );
                            }
                            },
                          ),
                          AppGaps.h2(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Dont have an Account? ',
                                style: AppTextStyle.bodywhite,
                              ),
                              AppGaps.w2(),
                              CustomInkwellbutton(
                                  title: 'SignUp',
                                  onpress: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        RoutesNames.signupscreen,
                                            (route) => true
                                    );
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}