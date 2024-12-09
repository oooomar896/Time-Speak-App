// ignore_for_file: file_names
import 'package:untitled1/core/services/services.dart';
import 'package:get/get.dart';
import 'package:untitled1/view/screen/home/controller/controller_home.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyServices, fenix: true);
    Get.put(() => HomeControllerImp());
  }
}
