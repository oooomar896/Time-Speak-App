// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class TextSignUpOrSignIn extends StatelessWidget {
  final String text1;
  final String text2;

  final void Function()? onTap;

  const TextSignUpOrSignIn({
    Key? key,
    required this.text1,
    required this.onTap,
    required this.text2,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
