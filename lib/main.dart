
// ignore_for_file: unused_local_variable, depend_on_referenced_packages, prefer_const_constructors

import 'package:untitled1/binding/intialBinding.dart';
import 'package:untitled1/core/services/services.dart';
import 'package:untitled1/routes.dart';
import 'package:untitled1/view/screen/langauge/localization/changelocal.dart';
import 'package:untitled1/view/screen/langauge/localization/translilation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // تهيئة Firebase
  await initialServices();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
       return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'SA'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      translations: MyTranslation(),
      initialBinding: InitialBinding(),
      getPages: routes,    
      
      );
  }
}
