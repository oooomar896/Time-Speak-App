// ignore: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/auth/successsignup_controller.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/costmtextbodyauth.dart';
import 'package:untitled1/view/wedgit/auth/costmtextfrom/custombuttonauth.dart';

class SuccessSinUp2 extends StatefulWidget {
  const SuccessSinUp2({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SuccessSinUpPageState createState() => _SuccessSinUpPageState();
}
class _SuccessSinUpPageState extends State<SuccessSinUp2> {
  @override
        final ThemeData theme = Get.theme;

  Widget build(BuildContext context) {
    SuccessSignUPControllerControllerImp controller =
        SuccessSignUPControllerControllerImp();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(80),
        child: Column(children: [
           Icon(
              size: 150,
              Icons.check_circle_outline,
              color: theme.primaryColorDark),
          const SizedBox(
            height: 100,
          ),
          CostmTextBodyAuth(text: "192".tr),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
              onPressed: () {
                controller.GoToPageLogin();
              },
              text: "172".tr,
            ),
          )
        ]),
      )),
    );
  }
}
