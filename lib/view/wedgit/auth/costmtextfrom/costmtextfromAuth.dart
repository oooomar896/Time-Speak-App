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
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? borderColor;
  final double borderRadius;

  const CustTextFormSign({
    super.key,
    this.onTapIcon,
    required this.valid,
    required this.hintText,
    required this.label,
    this.icondata,
    this.mycontroller,
    required this.isNumber,
    this.obScureText,
    this.hintStyle,
    this.labelStyle,
    this.borderColor,
    this.borderRadius = 5.0,
  }); 
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Get.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ?? theme.textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        Card(
          color: theme.primaryColor,
          child: TextFormField(
            keyboardType: isNumber
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            validator: valid,
            controller: mycontroller,
            obscureText: obScureText ?? false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 30,
              ),
              hintText: hintText,
              hintStyle: hintStyle ?? const TextStyle(fontSize: 20),
              suffixIcon: icondata != null
                  ? InkWell(
                      onTap: onTapIcon,
                      child: Icon(icondata),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor ?? theme.dividerColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
