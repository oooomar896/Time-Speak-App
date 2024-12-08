import 'package:auctions_mulhmah/controller/auth/login_controller.dart';
import 'package:auctions_mulhmah/core/constant/imageassets.dart';
import 'package:auctions_mulhmah/core/functions/alertexetapp.dart';
import 'package:auctions_mulhmah/core/functions/valedinput.dart';
import 'package:auctions_mulhmah/core/services/services.dart';
import 'package:auctions_mulhmah/view/widget/auth/costmtextfrom/chkrememberme.dart';
import 'package:auctions_mulhmah/view/widget/auth/costmtextfrom/costmtextfromAuth.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/costmtextbodyauth.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/costmtexttiltleauth.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/custombuttonauth.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/signupbtngo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  MyServices services = Get.find();
  @override
  Widget build(BuildContext context) {
    LoginControllerImp conroller = Get.put(LoginControllerImp());
      final ThemeData theme = Get.theme;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
          child: ListView(
            children: [
              Form(
                key: conroller.formState,
                child: Column(
                  children: [
                     SizedBox(
                      width: 200,
                      height: 200,
                      child: Image(image: const AssetImage(AppImageAssets.auctions),color: theme.primaryColorDark),
                    ),
                    CostmTextTitleAuth(text: "174".tr,),
                    const SizedBox(height: 20),

                    Card(
                      color: theme.cardColor,
                      child: Column(
                        children: [
                          CustTextFormSign(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 5, 100, "email");
                            },
                            mycontroller: conroller.email,
                            hintText: "175".tr,
                            label: "179".tr,
                            icondata: Icons.account_circle_sharp,
                          ),
                           const SizedBox(height: 15),

                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustTextFormSign(
                        obScureText: conroller.isShowPassword,
                        onTapIcon: () {
                          conroller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return ValidInput(val!, 5, 30, "password");
                        },
                        mycontroller: conroller.password,
                        hintText: "177".tr,
                        label: "177".tr,
                        icondata: conroller.isShowPassword
                            ? Icons.lock
                            : Icons.lock_open_outlined,
                      ),
                    ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Flexible(
                          child: chkrememberme(
                            ischeck: "false",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            conroller.goToForgetPassword();
                          },
                          child: Text(
                            "178".tr,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButtonAuth(
                      text: "172".tr,
                      onPressed: (()  {
                        conroller.login();
                      }),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CostmTextBodyAuth(
                            text: "${"180".tr}\t",
                          ),
                          signupbtngo(
                            text: "214".tr,
                            btnWidth: 80,
                            onPressed: (() async {
                              conroller.goToSignUP();
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


