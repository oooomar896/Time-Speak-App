
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/auth/forgetpassword_controller.dart';
import 'package:untitled1/core/functions/valedinput.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextbodyauth.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextfromAuth.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/custombuttonauth.dart';
import 'package:untitled1/view/wedgit/costmtextfrom/costmtexttiltleauth.dart';

class ForgetPassWord2 extends StatefulWidget {
  const ForgetPassWord2({super.key});

  @override
  _Sign_UpPageState createState() => _Sign_UpPageState();
}

class _Sign_UpPageState extends State<ForgetPassWord2> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final ThemeData theme = Get.theme;

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '178'.tr,
          style: TextStyle(color: theme.primaryColorLight, fontSize: 25),
        ),
      ),
      body: Container(
        color: theme.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        child: ListView(
          children: [
            Form(
              key: controller.formState,
              child: Column(
                children: [
                  CostmTextTitleAuth(text: "193".tr),
                  const SizedBox(height: 10),
                  CostmTextBodyAuth(text: "179".tr),
                  const SizedBox(height: 10),
                  Card(
                    color: theme.cardColor,
                    child: CustTextFormSign(
                      valid: (val) {
                        return ValidInput(val!, 9, 100, "email");
                      },
                      isNumber: false,
                      hintText: "175".tr,
                      label: "175".tr,
                      icondata: Icons.email_outlined,
                      mycontroller: controller.email,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButtonAuth(
                    text: "194".tr,
                    onPressed: () async {
                      await controller.validcheckemail();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
