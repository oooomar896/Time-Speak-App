import 'package:flutter/material.dart';

class CostmTextBodyAuth extends StatelessWidget {
  final String text;
  const CostmTextBodyAuth({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        //"13".tr,
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
