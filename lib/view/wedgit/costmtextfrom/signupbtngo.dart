// ignore_for_file: sized_box_for_whitespace, use_super_parameters

import 'package:flutter/material.dart';
import 'package:untitled1/core/constant/color.dart';

// ignore: camel_case_types
class signupbtngo extends StatelessWidget {
  final String text;
  final double? btnWidth;
  final double? btnHeight;
  final void Function()? onPressed;

  const signupbtngo({
    Key? key,
    required this.text,
    required this.onPressed,
    this.btnWidth,
    this.btnHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
          color: const Color.fromARGB(255, 46, 79, 100),
          textColor: const Color.fromARGB(255, 0, 0, 0),
          child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),) //Text("16".tr),
          ),
    );
  }
}
