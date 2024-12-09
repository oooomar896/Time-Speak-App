import 'package:get/get.dart';

abstract class HomeController extends GetxController {

}

class HomeControllerImp extends HomeController {
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