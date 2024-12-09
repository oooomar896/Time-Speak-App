import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/routes.dart';

abstract class VerfiycodeController extends GetxController {
  checkcode();
  goTorestpassword();
}

class VerfiycodeControllerImp extends VerfiycodeController {
  late TextEditingController email;
  late String verfiyCode;

  @override
  checkcode() {}

  goTorestpassword() {
    Get.offNamed(AppRoute.restPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
