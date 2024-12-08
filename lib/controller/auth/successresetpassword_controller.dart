import 'package:auctions_mulhmah/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SuccessRestpasswordController extends GetxController {
  validSuccessPassword();
  resetPassword();
}

class SuccessRestpasswordControllerImp extends SuccessRestpasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;
  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  validSuccessPassword() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppRoute.SuccessRestpassword);
    } else {
      print("not valid");
    }
  }

  @override
  resetPassword() {}

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
