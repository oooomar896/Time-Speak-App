// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/auth/VerfiycodeSignUp_controller.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextbodyauth.dart';
import 'package:untitled1/view/wedgit/costmtextfrom/costmtexttiltleauth.dart';

class VerfiycodeSignUp2 extends StatefulWidget {
  const VerfiycodeSignUp2({super.key});

  @override
  _VerfiycodeSignUpPageState createState() => _VerfiycodeSignUpPageState();
}

class _VerfiycodeSignUpPageState extends State<VerfiycodeSignUp2> {
  final ThemeData theme = Get.theme;

  @override
  Widget build(BuildContext context) {
    VerfiycodeSignUpControllerImp controller =
    Get.put(VerfiycodeSignUpControllerImp());

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "0073".tr,
          style: TextStyle(color: theme.primaryColorLight),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        child: ListView(
          children: [
            Form(
              child: Column(
                children: [
                  CostmTextTitleAuth(text: "0071".tr),
                  const SizedBox(height: 10),
                  CostmTextBodyAuth(text: "0072".tr),
                  const SizedBox(height: 10),
                  OtpTextField(
                    numberOfFields: 5,
                    fillColor: Colors.white,
                    borderColor: Colors.black,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUP();
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
