import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    buttonColor: Colors.amber[700],
    cancelTextColor: Colors.white,
    title: "33".tr,
    middleText: "32".tr,
    actions: [
      ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("34".tr)),
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("35".tr)),
    ],
  );
  return Future.value(true);
}
