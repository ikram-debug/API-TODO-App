import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import '../constant/text_sizes.dart';

class CustomInkwellbutton2 extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color? backgroundColor; // optional

  const CustomInkwellbutton2({
    super.key,
    required this.title,
    required this.onpress,
    this.backgroundColor, // optional param
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      borderRadius: BorderRadius.circular(AppSizes.hp(5)),
      child: Container(
        padding: AppPaddings.symmetric(2, 2),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent, // default transparent
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: AppTextStyle.btext.copyWith(
            color: kblackcolor,
          ),
        ),
      ),
    );
  }
}
