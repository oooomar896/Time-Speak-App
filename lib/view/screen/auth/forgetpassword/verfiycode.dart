// ignore_for_file: library_private_types_in_public_api

import 'package:auctions_mulhmah/controller/auth/verfiycode_controller.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/costmtextbodyauth.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/costmtexttiltleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verfiycode2 extends StatefulWidget {
  const Verfiycode2({super.key});

  @override
  _verfiycodePageState createState() => _verfiycodePageState();
}

// ignore: camel_case_types
class _verfiycodePageState extends State<Verfiycode2> {
        final ThemeData theme = Get.theme;

  @override
  Widget build(BuildContext context) {
    VerfiycodeControllerImp controller = Get.put(VerfiycodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '195'.tr,
          style: TextStyle(color: theme.primaryColorDark),
        ),
      ),
      body: Container(
        color: theme.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        child: ListView(
          children: [
            Form(
                child: Column(
              children: [
                CostmTextTitleAuth(text: '196'.tr),
                const SizedBox(height: 10),
                CostmTextBodyAuth(text: "197".tr),
                const SizedBox(height: 10),
                OtpTextField(
                  numberOfFields: 5,
                  fillColor: Colors.white,
                  borderColor: Colors.black,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.goTorestpassword();
                  }, // end onSubmit
                ),
                const SizedBox(height: 10),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
