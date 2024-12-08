import 'package:firebase_auth/firebase_auth.dart';
import 'package:auctions_mulhmah/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  validcheckemail();
  goToForgetPassword();
  goToVerfiycode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  @override
  goToVerfiycode() {}

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetpassWord);
  }

  @override
  validcheckemail() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      try {
        await _auth.sendPasswordResetEmail(email: email.text);
        Get.snackbar('Success', 'Password reset email sent to ${email.text}');
        Get.offNamed(AppRoute.SuccessRestpassword); // Redirect to a verification page if needed
      } catch (e) {
        Get.snackbar('Error', 'Failed to send password reset email: ${e.toString()}');
      }
    } else {
      Get.snackbar('Error', 'Invalid email');
    }
  }
}
