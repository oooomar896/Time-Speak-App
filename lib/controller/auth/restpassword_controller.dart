// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/routes.dart';

abstract class RestpasswordController extends GetxController {
  validVerfiycode();
  goToVerfiycode();
}

class RestpasswordControllerImp extends RestpasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  @override
  goToVerfiycode() {
    // Get.offNamed(AppRoute.verfiyCode);
  }

  validVerfiycode() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      print("valid");
      Get.offNamed(AppRoute.verfiyCode);
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
