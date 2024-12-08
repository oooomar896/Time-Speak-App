// ignore_for_file: unused_import

import 'package:untitled1/core/constant/appTheme.dart';
import 'package:untitled1/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? langauge;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) { 
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreflang = myServices.sharedPreferences.getString("lang");
    if (sharedPreflang == "ar") {
      langauge = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPreflang == "en") {
      langauge = const Locale("en");
      appTheme = themeEnglish;
    } else {
      langauge = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
