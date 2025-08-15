import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import '../constant/text_sizes.dart';

class CustomInkwellbutton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final Color? backgroundColor; // optional

  const CustomInkwellbutton({
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
        padding: AppPaddings.only(left: 2,right: 2),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent, // default transparent
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: AppTextStyle.btext,
        ),
      ),
    );
  }
}
