// ignore_for_file: non_constant_identifier_names

import 'package:auctions_mulhmah/core/constant/routes.dart';
import 'package:get/get.dart';

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
