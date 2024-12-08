// ignore_for_file: sized_box_for_whitespace

import 'package:auctions_mulhmah/core/constant/color.dart';
import 'package:auctions_mulhmah/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class chkrememberme extends StatefulWidget {
  final String? ischeck;

  const chkrememberme({super.key, required this.ischeck});

  @override
  State<chkrememberme> createState() => chkrememberme_state();
}

// ignore: camel_case_types
class chkrememberme_state extends State<chkrememberme> {
  // ignore: non_constant_identifier_names
  bool IsChecked = false;

  MyServices myservices = Get.find();

  @override
  void initState() {
    super.initState();
    // ignore: unrelated_type_equality_checks
    if (IsChecked == "false") {
      IsChecked = false;
      myservices.sharedPreferences.setString("rememberme", "false");
    } else {
      if (myservices.sharedPreferences.getString("onboarding") == "1") {
      } else {
        IsChecked = true;
        myservices.sharedPreferences.setString("rememberme", "true");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text("تذكير".tr),
      value: IsChecked,
      checkColor: IsChecked ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),
      activeColor: IsChecked ? AppColor.primaryOne : const Color.fromARGB(255, 124, 89, 56),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) {
        setState(() {
          IsChecked = value!;
        });
      },
    );
  }
}
