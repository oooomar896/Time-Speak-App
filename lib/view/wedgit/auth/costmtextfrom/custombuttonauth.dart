// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtonAuth({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onPressed,
          color: Colors.black,
          textColor: const Color.fromARGB(255, 255, 255, 255),
          child: Text(text) //Text("16".tr),
          ),
    );
  }
}
