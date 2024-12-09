import 'package:untitled1/core/constant/routes.dart';
import 'package:untitled1/view/screen/auth/Login.dart';
import 'package:untitled1/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:untitled1/view/screen/auth/forgetpassword/restpassword.dart';
import 'package:untitled1/view/screen/auth/forgetpassword/success_restpassword.dart';
import 'package:untitled1/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:untitled1/view/screen/auth/sign_up.dart';
import 'package:untitled1/view/screen/auth/success_signUp.dart';
import 'package:untitled1/view/screen/auth/verfiycodeSignUp.dart';
import 'package:untitled1/view/screen/home/HomePage.dart';
import 'package:untitled1/view/screen/OnBoarding.dart';
import 'package:untitled1/view/screen/langauge/langauge.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => test(), middlewares: [MyMiddeleWare()]),
  GetPage(name: "/", page: () => OnBoarding()),
  GetPage(name: AppRoute.home, page: () => MainScreen()),
     GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.sign_up, page: () => const Sign_Up()),
  GetPage(name: AppRoute.forgetpassWord, page: () => const ForgetPassWord2()),
  GetPage(name: AppRoute.verfiyCode, page: () => const Verfiycode2()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiycodeSignUp2()),
  GetPage(name: AppRoute.restPassword, page: () => const Restpassword()),
  GetPage(
      name: AppRoute.SuccessRestpassword,
      page: () => const SuccessRestpassword()),
  GetPage(name: AppRoute.success_signUp, page: () => const SuccessSinUp2()),
];
