// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostmTextTitleAuth extends StatelessWidget {
  final String text;
      final ThemeData theme = Get.theme;

  // ignore: use_super_parameters
   CostmTextTitleAuth({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      //"12".tr,
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold,color: theme.primaryColorLight)
    );
  }
}
