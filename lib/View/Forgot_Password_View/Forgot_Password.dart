import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';
import 'package:todo_app/Core/widgets/CustomValidator.dart';
import 'package:todo_app/Core/widgets/custom_RoundButton.dart';
import 'package:todo_app/Core/widgets/custom_textfield.dart';
import 'package:todo_app/routes/routes_names.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  final TextEditingController emailcontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
                      'Forgot Password?',
                      style: AppTextStyle.bodylarge,
                    ),
                    Text(
                      'Your productivity awaits—reset your password now!',
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
                        ],
                      ),
                    ),
                    AppGaps.h10(),
                    CustomRoundbutton(
                        title: 'SendPassword',
                        onpressed: () {
                          if(_formkey.currentState!.validate()){
                            Navigator.pushNamedAndRemoveUntil(context,
                                RoutesNames.loginscreen,
                                (routes) => true,
                            );
                          }
                        }
                    ),
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
