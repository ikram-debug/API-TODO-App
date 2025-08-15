import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool isEyeTrue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.isEyeTrue = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      validator: widget.validator,
      style: AppTextStyle.input,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.hinttext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        isDense: true,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: kwhitecolor,
        ),
        suffixIcon: widget.isEyeTrue ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: kwhitecolor,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.wp(2)),
          borderSide:  BorderSide(
            color: kwhitecolor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.wp(2)),
          borderSide:  BorderSide(
            color: kwhitecolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.wp(2)),
          borderSide: BorderSide(color: kwhitecolor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.wp(2)),
          borderSide:  BorderSide(color: errortcolor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.wp(2)),
          borderSide:  BorderSide(color: errortcolor),
        ),
        errorStyle: AppTextStyle.error,
      ),
    );
  }
}
