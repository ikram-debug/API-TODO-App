import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';
import 'package:todo_app/Core/widgets/CustomValidator.dart';
import 'package:todo_app/Core/widgets/custom_Inkwellbutton.dart';
import 'package:todo_app/Core/widgets/custom_RoundButton.dart';
import 'package:todo_app/Core/widgets/custom_textfield.dart';
import 'package:todo_app/ViewModel/auth_viewmodel.dart';
import 'package:todo_app/routes/routes_names.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formkey = GlobalKey<FormState>();

  final TextEditingController emialcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emialcontroler.dispose();
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
                      'SignUP',
                      style: AppTextStyle.bodylarge,
                    ),
                    Text(
                      'your productivity starts here!',
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
                              controller: emialcontroler,
                                hintText: 'Enter your email',
                                prefixIcon: Icons.email,
                              validator: EmailValidator(),
                            ),
                            AppGaps.h2(),
                            CustomTextField(
                              controller: passwordcontroler,
                                hintText: 'Enter your password',
                                prefixIcon: Icons.lock,
                              isEyeTrue: true,
                              validator: passwordValidator(),
                            ),
                            AppGaps.h10(),
                            Consumer<AuthViewmodel>(builder: (context, auth, _){
                              return CustomRoundbutton(
                                title: 'SignUP',
                                loading: auth.signuploading,
                                onpressed: () {if(_formkey.currentState!.validate()){
                                  auth.signupUser(
                                      emialcontroler.text.trim(),
                                      passwordcontroler.text.trim(),
                                      context
                                  );
                                }
                                },
                              );
                            }),
                            AppGaps.h2(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account',
                                  style: AppTextStyle.bodywhite,
                                ),
                                AppGaps.w2(),
                                CustomInkwellbutton(
                                    title: 'Login',
                                    onpress: () {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          RoutesNames.loginscreen,
                                          (route) => false
                                      );
                                    }
                                ),
                              ],
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
