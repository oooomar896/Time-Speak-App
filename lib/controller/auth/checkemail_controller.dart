import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/routes.dart';

abstract class CheckController extends GetxController {
  checkemail();
}

class CheckControllerControllerImp extends CheckController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  @override

  // @override


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
