// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedAlertScreen extends StatelessWidget {
  const RedAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("انتهى الوقت!", style: TextStyle(color: Colors.white, fontSize: 30)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed('/'),
              child: Text("العودة إلى الشاشة الرئيسية"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
