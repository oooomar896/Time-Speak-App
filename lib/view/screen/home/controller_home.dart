import 'package:admin_alghozami/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  home();
  language();
}

class HomeControllerImp extends HomeController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();




  @override
  home() {
      Get.offNamed(AppRoute.home);

  }
  
  @override
  language() {
      Get.offNamed(AppRoute.Langauge);
  }
}
