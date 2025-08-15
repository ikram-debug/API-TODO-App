import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_colors.dart';

class CustomFloatingbutton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomFloatingbutton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.red.withOpacity(0.5),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color:kwhitecolor
        ),
      ),
      foregroundColor:kwhitecolor,
      elevation: 2,
      child: Icon(
        icon,
        color: kwhitecolor,
      ),
    );
  }
}

