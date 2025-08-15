import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';

import '../constant/app_paddings.dart';
import '../constant/text_sizes.dart';

class CustomRoundbutton extends StatelessWidget {

  final String title;
  final VoidCallback onpressed;

  const CustomRoundbutton({super.key,
  required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, AppSizes.hp(6)),
        backgroundColor: Colors.transparent,
        foregroundColor: kwhitecolor,
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 2,
      ),
      child: Text(
        title,
        style: AppTextStyle.btext,
      ),
    );
  }
}
