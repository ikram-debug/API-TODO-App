import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';


class Utils {
  static void flushbar(String message, BuildContext context) {
    Flushbar(
      forwardAnimationCurve: Curves.fastOutSlowIn,
      reverseAnimationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      positionOffset: 10,

      backgroundColor: kredcolor,
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(12),
      boxShadows: [
        BoxShadow(
          color: Colors.black26,
          offset: const Offset(0, 3),
          blurRadius: 8,
        ),
      ],

      messageText: Text(
        message,
        style: TextStyle(
          color: kwhitecolor,
          fontSize: AppSizes.hp(1.5),
          fontWeight: FontWeight.w600,
        ),
      ),

      icon: Icon(
        Icons.error_outline,
        size: AppSizes.hp(2),
        color: kwhitecolor,
      ),
    ).show(context);
  }



  static void snackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyle.bodywhite,
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      ),
    );
  }

}