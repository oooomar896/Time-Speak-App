import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/routes.dart';

abstract class VerfiycodeSignUpController extends GetxController {
  checkcode();
  checkcodeverfiyCode();
  goToSuccessSignUP();
}

class VerfiycodeSignUpControllerImp extends VerfiycodeSignUpController {
  late TextEditingController email;
  late String verificationCode;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser;

  @override
  void onInit() {
    email = TextEditingController();
    currentUser = _auth.currentUser;  // Get the current signed up user
    sendVerificationEmail(); // Send verification email when controller initializes
    super.onInit();
  }

  Future<void> sendVerificationEmail() async {
    try {
      await currentUser?.sendEmailVerification();
      Get.snackbar('Success', 'Verification email sent to ${currentUser?.email}');
    } catch (e) {
      Get.snackbar('Error', 'Failed to send verification email');
    }
  }

  @override
  checkcode() {}

  @override
  goToSuccessSignUP() async {
    try {
      await currentUser?.reload();
      if (currentUser?.emailVerified == true) {
        // Email is verified
        Get.offNamed(AppRoute.success_signUp);
      } else {
        // Email is not verified
        Get.snackbar('Error', 'Email not verified yet');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify email');
    }
  }

  @override
  checkcodeverfiyCode() {
    Get.offNamed(AppRoute.verfiyCodeSignUp);
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
