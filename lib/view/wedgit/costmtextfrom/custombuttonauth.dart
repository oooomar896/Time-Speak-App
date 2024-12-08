// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({
    super.key,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Get.theme;
    return SizedBox(
      width: 350,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: theme.canvasColor,
          backgroundColor: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primaryColorDark,
          ),
        ),
      ),
    );
  }
}
