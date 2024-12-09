import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/auth/successresetpassword_controller.dart';
import 'package:untitled1/core/functions/valedinput.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextbodyauth.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextfromAuth.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/custombuttonauth.dart';
import 'package:untitled1/view/wedgit/costmtextfrom/costmtexttiltleauth.dart';

class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _restpasswordPageState createState() => _restpasswordPageState();
}

// ignore: camel_case_types
class _restpasswordPageState extends State<Restpassword> {
  GlobalKey<FormState> formstate = GlobalKey();
        final ThemeData theme = Get.theme;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idmerchant = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SuccessRestpasswordControllerImp controller =
        Get.put(SuccessRestpasswordControllerImp());
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '198'.tr,
          style:TextStyle(color: theme.primaryColorLight,fontSize: 25),
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
                    CostmTextTitleAuth(text: "199".tr),
                    const SizedBox(height: 10),
                    CostmTextBodyAuth(text: "200".tr),
                    const SizedBox(height: 10),
                    Card(
                      color: theme.cardColor,
                      child: Column(
                        children: [
                          GetBuilder<SuccessRestpasswordControllerImp>(
                              builder: (controller) => CustTextFormSign(
                                    obScureText: controller.isShowPassword,
                                    onTapIcon: () {
                                      controller.showPassword();
                                    },
                                    valid: (val) {
                                      return ValidInput(val!, 5, 30, "password");
                                    },
                                    isNumber: false,
                                    mycontroller: controller.password,
                                    hintText: "177".tr,
                                    label: "177".tr,
                                    icondata: Icons.password,
                                  )),
                                    GetBuilder<SuccessRestpasswordControllerImp>(
                        builder: (controller) => CustTextFormSign(
                              obScureText: controller.isShowPassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              valid: (val) {
                                return ValidInput(val!, 5, 30, "password");
                              },
                              isNumber: false,
                              mycontroller: controller.repassword,
                              hintText: "200".tr,
                              label: "200".tr,
                              icondata: Icons.password,
                            )),
                        ],
                      ),
                    ),
                  
                    const SizedBox(height: 10),
                    CustomButtonAuth(
                        text: "194".tr,
                        onPressed: (() async {
                          controller.validSuccessPassword();

                          controller.resetPassword();
                        })),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
