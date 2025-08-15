import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';

class CustomPostTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;

  const CustomPostTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.minLines, // optional
    this.maxLines, // optional
  });

  @override
  State<CustomPostTextField> createState() => _CustomPostTextFieldState();
}

class _CustomPostTextFieldState extends State<CustomPostTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: AppTextStyle.body,
      minLines: widget.minLines,
      maxLines: widget.maxLines,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.hinttextgrey,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: kwhitecolor,
        border: InputBorder.none,
        errorStyle: AppTextStyle.error,
      ),
    );
  }
}
