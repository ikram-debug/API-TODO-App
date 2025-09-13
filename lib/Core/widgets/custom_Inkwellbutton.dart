import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import '../constant/text_sizes.dart';

class CustomInkwellbutton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color? backgroundColor;
  final bool? loading;

  const CustomInkwellbutton({
    super.key,
    required this.title,
    required this.onpress,
    this.backgroundColor,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      borderRadius: BorderRadius.circular(AppSizes.hp(5)),
      child: Container(
        height: AppSizes.hp(5),
        padding: AppPaddings.only(left: 2,right: 2),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent, // default transparent
          borderRadius: BorderRadius.circular(10),
        ),
        child:Center(
          child:  loading == true ?
          CircularProgressIndicator(
            color: kwhitecolor,
          ):
        Text(
          title,
          style: AppTextStyle.btext,
        ),
      ),
      )
    );
  }
}


