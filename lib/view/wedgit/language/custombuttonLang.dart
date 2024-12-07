// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:admin_alghozami/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;

  const CustomButtonLanguage(
      {super.key, required this.textButton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        textColor: const Color.fromARGB(255, 0, 0, 0),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
