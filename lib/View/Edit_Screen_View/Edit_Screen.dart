import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/widgets/Custom_PostTextField.dart';
import 'package:todo_app/Core/widgets/Custom_RoundButton2.dart';
import 'package:todo_app/routes/routes_names.dart';

import '../../Core/constant/app_colors.dart';
import '../../Core/constant/text_sizes.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final TextEditingController titlecontroler = TextEditingController();
  final TextEditingController discriptioncontroler = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    titlecontroler.dispose();
    discriptioncontroler.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kwhitecolor,
          title: Text(
            'Edit Here',
            style: AppTextStyle.TD,
          ),
          centerTitle: true,

        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/BackGround Image.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: AppPaddings.symmetric(3, 2),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: AppSizes.hp(7),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhitecolor,
                        borderRadius: BorderRadius.circular(AppSizes.hp(2)),
                      ),
                      child: Padding(
                        padding: AppPaddings.symmetric(2, 2),
                        child: CustomPostTextField(
                          controller: titlecontroler,
                          hintText: 'Enter title here....',
                          minLines: null,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    AppGaps.h2(),
                    Container(
                      height: AppSizes.hp(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhitecolor,
                        borderRadius: BorderRadius.circular(AppSizes.hp(2)),
                      ),
                      child: Padding(
                        padding: AppPaddings.symmetric(2, 2),
                        child:
                        CustomPostTextField(
                          controller: discriptioncontroler,
                          hintText: 'Enter discription here...',
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                    ),
                    AppGaps.h20(),
                    CustomRoundbutton2(
                        title: 'Add',
                        onpressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RoutesNames.homescreen,
                                  (routes) => false
                          );
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
