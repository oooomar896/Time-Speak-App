
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/color.dart';
import 'package:untitled1/core/constant/routes.dart';
import 'package:untitled1/core/services/services.dart';

abstract class LoginController extends GetxController {
  void home();
  void goToSignUP();
  void goToForgetPassword();
  void logout();
}

class LoginControllerImp extends LoginController {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  late final TextEditingController email;
  late final TextEditingController password;
  final MyServices services = Get.find();
  bool isShowPassword = true;

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  Future<void> login() async {
    if (formState.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        // Save user ID to shared preferences or any other logic after successful login
        services.sharedPreferences.setString("userId", userCredential.user?.uid ?? "");

        Get.offAndToNamed(AppRoute.home);
        Get.snackbar(
          padding: const EdgeInsets.all(30),
          '262'.tr,
          '265'.tr,
          icon: const Icon(
            Icons.workspaces,
            color: Color.fromARGB(255, 65, 91, 129),
          ),
          snackPosition: SnackPosition.BOTTOM,
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found'.tr) {
          errorMessage = 'No user found for that email.'.tr;
        } else if (e.code == 'wrong-password'.tr) {
          errorMessage = 'Wrong password provided.'.tr;
        } else {
          errorMessage = 'An error occurred. Please try again.'.tr;
        }
        Get.snackbar(
          '266'.tr,
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          '266'.tr,
          '267'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void goToSignUP() {
    Get.offNamed(AppRoute.sign_up);
  }

  // ignore: non_constant_identifier_names


  @override
  void home() {
    // Navigation logic for home
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetpassWord);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();

    final savedUserId = services.sharedPreferences.getString("userId");
    if (savedUserId != null && savedUserId.isNotEmpty) {
      // Uncomment and use if necessary
      // Get.offAndToNamed(AppRoute.homeList, arguments: savedUserId);
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void logout() {
    services.sharedPreferences.remove("userId");
    Get.offAllNamed(AppRoute.login);
  }
}
