
// ignore_for_file: unused_local_variable, depend_on_referenced_packages, prefer_const_constructors

import 'dart:io';

import 'package:untitled1/binding/intialBinding.dart';
import 'package:untitled1/core/functions/checkEnternet.dart';
import 'package:untitled1/core/services/services.dart';
import 'package:untitled1/routes.dart';
import 'package:untitled1/view/screen/home/controller/controller_home.dart';
import 'package:untitled1/view/screen/langauge/localization/changelocal.dart';
import 'package:untitled1/view/screen/langauge/localization/translilation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

final homeController = Get.find<HomeController>();

Future<void> main() async {
    Get.put(HomeControllerImp()); // تسجيل HomeController في الذاكرة

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await checkEntrnet();
  await initialServices(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return GetBuilder<LocaleController>(
      init: LocaleController(),
      global: true,
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: MyTranslation(),
          initialBinding: InitialBinding(),
          getPages: routes,
        );
      },);
  }
  }