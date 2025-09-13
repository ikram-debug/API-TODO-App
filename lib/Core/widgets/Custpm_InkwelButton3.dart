import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';

class CustpmInkwelbutton3 extends StatelessWidget {

  final String title;
  final VoidCallback onpressed;

  const CustpmInkwelbutton3({super.key,
  required this.title,
    required this.onpressed

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Text(
        title,
        style: AppTextStyle.btext,
      ),
    );
  }
}
