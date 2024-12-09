import 'dart:async';
import 'package:untitled1/view/screen/home/HomePage.dart';
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
                       const Icon(Icons.cabin_outlined,size: 100,color: Color.fromARGB(255, 44, 104, 46),),
                       Text("0001".tr,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                ),
            ],
          )
        ],
      ),
    );
  }
}