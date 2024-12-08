import 'package:auctions_mulhmah/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
