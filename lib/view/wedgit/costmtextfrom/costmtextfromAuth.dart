// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustTextFormSign extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData? icondata;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obScureText;
  final void Function()? onTapIcon;
      final ThemeData theme = Get.theme;

   CustTextFormSign({
    super.key,
    this.onTapIcon,
    required this.valid,
    required this.hintText,
    required this.label,
    this.icondata,
    this.mycontroller,
    required this.isNumber,
    this.obScureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: const EdgeInsets.only(top: 15),
  child: TextFormField(
    keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    validator: valid,
    controller: mycontroller,
    obscureText: obScureText ?? false, // تبسيط شرط obScureText
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16, color: theme.primaryColorLight),
      suffixIcon: icondata != null
          ? InkWell(
              onTap: onTapIcon,
              child: Icon(icondata, color: theme.iconTheme.color),
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: theme.primaryColorLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: theme.dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: theme.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  ),
);
  }
}
