// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:untitled1/controller/auth/signup_controller.dart';
import 'package:untitled1/core/functions/alertexetapp.dart';
import 'package:untitled1/core/functions/valedinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextfromAuth.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/custombuttonauth.dart';
import 'package:untitled1/view/wedgit/costmtextfrom/costmtexttiltleauth.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Sign_Up> {
  File? _imageFile;
  final SinUpControllerImp controller = Get.put(SinUpControllerImp());
  final ThemeData theme = Get.theme;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        controller.setImageFile(_imageFile);  // Pass the image to the controller
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "181".tr,
          style: TextStyle(color: theme.primaryColorLight),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: ListView(
          children: [
            Form(
              key: controller.formState,
              child: Column(
                children: [
                  CostmTextTitleAuth(text: "182".tr),
                  Text(
                    "183".tr,
                    style: TextStyle(color: theme.primaryColorDark, fontSize: 20),
                  ),
                  Card(
                    color: theme.cardColor,
                    child: Column(
                      children: [
                        CustTextFormSign(
                          isNumber: false,
                          valid: (val) {
                            return ValidInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          hintText: "179".tr,
                          label: "175".tr,
                          icondata: Icons.email_outlined,
                        ),
                        GetBuilder<SinUpControllerImp>(
                          builder: (controller) => CustTextFormSign(
                            obScureText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 5, 30, "password");
                            },
                            mycontroller: controller.password,
                            hintText: "177".tr,
                            label: "176".tr,
                            icondata: Icons.password_outlined,
                          ),
                        ),
                        CustTextFormSign(
                          isNumber: false,
                          valid: (val) {
                            return ValidInput(val!, 5, 50, "username");
                          },
                          mycontroller: controller.username,
                          hintText: "184".tr,
                          label: "185".tr,
                          icondata: Icons.supervised_user_circle,
                        ),
                        CustTextFormSign(
                          isNumber: true,
                          valid: (val) {
                            return ValidInput(val!, 9, 15, "phone");
                          },
                          mycontroller: controller.phone,
                          hintText: "186".tr,
                          label: "187".tr,
                          icondata: Icons.phone,
                        ),
                        CustTextFormSign(
                          isNumber: true,
                          valid: (val) {
                            return ValidInput(val!, 9, 15, "ID_city");
                          },
                          mycontroller: controller.numberCity,
                          hintText: "188".tr,
                          label: "189".tr,
                          icondata: Icons.phone,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: _pickImage,
                        child: Row(
                          children: [
                            Text('190'.tr, style: TextStyle(color: theme.primaryColorDark, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 100),
                            Icon(Icons.add, color: theme.primaryColorDark)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  CustomButtonAuth(
                    text: "181".tr,
                    onPressed: () async {
                      controller.signUpValid();
                    },
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.goToLogin();
                    },
                    child: Text(
                      "${"191".tr}\t",
                      style: TextStyle(color: theme.primaryColorDark),
                    ),
                  ),
                ],
              ),
            ),// brother i want using user email will get future messageli
          ],//brother please wait i do only testing here pleae, ok, now test with vlid user email, wait, i will check that with email run
),// look now brother what will new task, ok!!! what new task
//now if all , look 
      ),
    );
  }
}
