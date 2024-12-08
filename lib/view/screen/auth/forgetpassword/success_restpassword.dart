import 'package:auctions_mulhmah/controller/auth/successsignup_controller.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/costmtextbodyauth.dart';
import 'package:auctions_mulhmah/view/widget/costmtextfrom/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRestpassword extends StatefulWidget {
  const SuccessRestpassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SuccessRestpasswordPageState createState() =>
      _SuccessRestpasswordPageState();
}

class _SuccessRestpasswordPageState extends State<SuccessRestpassword> {
          final ThemeData theme = Get.theme;

  @override
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
          CostmTextBodyAuth(text: "201".tr),
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
