// ignore_for_file: unnecessary_import


import 'package:admin_alghozami/core/constant/routes.dart';
import 'package:admin_alghozami/view/screen/langauge/localization/changelocal.dart';
import 'package:admin_alghozami/view/wedgit/language/custombuttonLang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Langauge extends GetView<LocaleController> {
  const Langauge({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonLanguage(
                textButton: "0002".tr,
                onPressed: () {
                  controller.changeLang("ar");
                   Get.offNamed(AppRoute.home);
                },
              ),
              CustomButtonLanguage(
                textButton: "0003".tr,
                onPressed: () {
                  controller.changeLang("en");
                   Get.offNamed(AppRoute.home);
                },
              )
            ],
          )),
    );
  }
}
