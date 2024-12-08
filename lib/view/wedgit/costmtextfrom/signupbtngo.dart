// ignore_for_file: sized_box_for_whitespace, use_super_parameters

import 'package:auctions_mulhmah/core/constant/color.dart';
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
      width: 120,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
          color: AppColor.primaryColor2,
          textColor: AppColor.textColorBack,
          child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),) //Text("16".tr),
          ),
    );
  }
}
