import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';



class AppTextStyle {


  // Black colors text
  static TextStyle body = TextStyle(
    fontSize: AppSizes.sp(14),
    color: kblackcolor,
  );

  static TextStyle Title = GoogleFonts.aboreto(
    fontSize: AppSizes.sp(16),
    color: kblackcolor,
    fontWeight: FontWeight.bold,
  );


 // grey color text
  static TextStyle error = TextStyle(
    fontSize: AppSizes.sp(14),
    color: errortcolor,
  );

 // Red Color Text
  static TextStyle btext2 = TextStyle(
      fontSize: AppSizes.sp(16),
      color: kredcolor,
      fontWeight: FontWeight.bold
  );


  static TextStyle TD = GoogleFonts.aboreto(
    fontSize: AppSizes.sp(20),
    color: kredcolor,
    fontWeight: FontWeight.bold,
  );


  // White Colors Text
  static TextStyle bodylarge = GoogleFonts.aboreto(
    fontSize: AppSizes.sp(30),
    color: kwhitecolor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodywhite = GoogleFonts.poppins(
    fontSize: AppSizes.sp(14),
    color: kwhitecolor,
  );

  static TextStyle btext = TextStyle(
      fontSize: AppSizes.sp(16),
      color: kwhitecolor,
      fontWeight: FontWeight.bold
  );

  static TextStyle drawer = TextStyle(
      fontSize: AppSizes.sp(18),
      color: kwhitecolor,
      fontWeight: FontWeight.w300
  );

  static TextStyle input = TextStyle(
    fontSize: AppSizes.sp(16),
    color: kwhitecolor,
  );

  static TextStyle hinttext = TextStyle(
    fontSize: AppSizes.sp(14),
    color: klightcolor,
  );


  // grey color text
  static TextStyle hinttextgrey = TextStyle(
    fontSize: AppSizes.sp(14),
    color: kTextLightColor,
  );
}