
import 'package:untitled1/core/constant/routes.dart';
import 'package:untitled1/view/screen/home/HomePage.dart';
import 'package:untitled1/view/screen/OnBoarding.dart';
import 'package:untitled1/view/screen/langauge/langauge.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  
  // GetPage(name: "/", page: () => test(), middlewares: [MyMiddeleWare()]),
  GetPage(name: "/", page: () =>  OnBoarding()),
  GetPage(name: AppRoute.home, page: () =>  MyHomePage()),
  GetPage(name: AppRoute.Langauge, page: () => const Langauge()),
  
  ];