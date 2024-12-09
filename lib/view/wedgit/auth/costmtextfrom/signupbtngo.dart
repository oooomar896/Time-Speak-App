// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

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
      width: btnWidth,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
          color: Colors.black,
          textColor: const Color.fromARGB(255, 255, 255, 255),
          child: Text(text) //Text("16".tr),
          ),
    );
  }
}
