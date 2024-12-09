// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:untitled1/core/constant/imageassets.dart';
import 'package:untitled1/view/screen/home/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnBoarding extends PageView {
  OnBoarding({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  MainScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children:[
                 Column(
                    children: [
                      const SizedBox(height: 300,),
                      Image(image: const AssetImage(AppImageAssets.logo ),),
                       Text("وقت الحديث".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                ),
            ],
          )
        ],
      ),
    );
  }
}