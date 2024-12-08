import 'package:flutter/material.dart';

class CostmTextBodyAuth extends StatelessWidget {
  final String text;

  const CostmTextBodyAuth({
    Key? key,
    required this.text,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        //"13".tr,
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
