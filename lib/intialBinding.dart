
import 'package:get/get.dart';
import 'package:untitled1/core/services/services.dart';
import 'package:untitled1/view/screen/home/controller/controller_home.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // تحميل MyServices كـ Singleton طوال عمر التطبيق
    Get.put<MyServices>(MyServices(), permanent: true);

    // تحميل HomeController كـ Singleton طوال عمر التطبيق
    // تحميل HomeController عند الحاجة فقط (lazy loading)
    Get.put(HomeControllerImp());
    Get.lazyPut(()=>HomeControllerImp());

  }
}
