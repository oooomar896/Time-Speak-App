// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:untitled1/core/constant/routes.dart';

abstract class SuccessSignUPController extends GetxController {
  GoToPageLogin();
}

class SuccessSignUPControllerControllerImp extends SuccessSignUPController {
  @override
  GoToPageLogin() {
    Get.offNamed(AppRoute.login);
  }  
  home() {
    Get.offNamed(AppRoute.home);
  }
}
