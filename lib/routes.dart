
import 'package:admin_alghozami/core/constant/routes.dart';
import 'package:admin_alghozami/view/screen/home/HomePage.dart';
import 'package:admin_alghozami/view/screen/OnBoarding.dart';
import 'package:admin_alghozami/view/screen/langauge/langauge.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  
  // GetPage(name: "/", page: () => test(), middlewares: [MyMiddeleWare()]),
  GetPage(name: "/", page: () =>  OnBoarding()),
  GetPage(name: AppRoute.home, page: () =>  MyHomePage()),
  GetPage(name: AppRoute.Langauge, page: () => const Langauge()),
  
  ];