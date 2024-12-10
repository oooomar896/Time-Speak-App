import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {

}

class HomeControllerImp extends HomeController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
    final ThemeData theme = Get.theme;
  // تعريف المتغيرات الملاحظة
  var count = 0.obs;
  var isFavorite = false.obs;
  var showChartCount = 0.obs;

  // دالة لزيادة العدد
  void increment() {
    count++;
  }

  // دالة لتغيير حالة المفضلة
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  // دالة لزيادة عدد العرض
  void incrementChart() {
    showChartCount++;
  }
}