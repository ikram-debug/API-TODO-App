import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double sizebox;
  final bool? loading;

  const CustomListTile({
    Key? key,
    this.loading,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.sizebox
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: AppSizes.hp(3),
        color: kwhitecolor
      ),
      minLeadingWidth:AppSizes.wp(10),
      title: Center(
        child: loading == true ? CircularProgressIndicator(
          color: kwhitecolor,
        ) : Text(
          text,
          style: AppTextStyle.drawer,
        ),
      ),
      onTap: onTap,
    );
  }
}