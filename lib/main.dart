
import 'package:untitled1/binding/intialBinding.dart';
import 'package:untitled1/core/services/services.dart';
import 'package:untitled1/routes.dart';
import 'package:untitled1/view/screen/langauge/localization/changelocal.dart';
import 'package:untitled1/view/screen/langauge/localization/translilation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
     return GetMaterialApp(
      color: Colors.white,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,          
      locale: controller.langauge,
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
