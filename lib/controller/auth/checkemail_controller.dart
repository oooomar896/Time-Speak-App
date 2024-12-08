import 'package:auctions_mulhmah/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckController extends GetxController {
  checkemail();
  GoToVerfiyCode();
}

class CheckControllerControllerImp extends CheckController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  @override

  // @override
  GoToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCodeSignUp);
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

  @override
  checkemail() {}
}
