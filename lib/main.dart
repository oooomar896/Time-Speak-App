
import 'package:admin_alghozami/binding/intialBinding.dart';
import 'package:admin_alghozami/core/services/services.dart';
import 'package:admin_alghozami/routes.dart';
import 'package:admin_alghozami/view/screen/langauge/localization/changelocal.dart';
import 'package:admin_alghozami/view/screen/langauge/localization/translilation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
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
    // home: MyCustomWidget(),
    );
  }
}
//user:swap_user-password:qVbLtuaUsKoB5qQn
//- SHA1:
//- SHA256: