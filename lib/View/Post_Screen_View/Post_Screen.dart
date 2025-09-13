import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/widgets/Custom_PostTextField.dart';
import 'package:todo_app/Core/widgets/Custom_RoundButton2.dart';
import 'package:todo_app/ViewModel/todo_viewmodel.dart';
import 'package:todo_app/routes/routes_names.dart';

import '../../Core/constant/app_colors.dart';
import '../../Core/constant/text_sizes.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

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
    final todoVM = Provider.of<todoprovider>(context);
    AppSizes.init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kwhitecolor,
          title: Text(
            'Create Here',
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
                padding: AppPaddings.symmetric(5, 3),
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
                          maxLines: 15,
                        ),
                      ),
                    ),
                    AppGaps.h20(),
                    CustomRoundbutton2(
                        title: 'Add',
                        loading: todoVM.postloading,
                        onpressed: () {
                          Map<String, dynamic> data = {
                            "Title" : titlecontroler.text.trim(),
                            "Discriptaion" : discriptioncontroler.text.trim(),
                          };
                          todoVM.posttodo(data, context);
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
