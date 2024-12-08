
// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace

import 'package:admin_alghozami/core/constant/imageassets.dart';
import 'package:admin_alghozami/view/screen/home/controller_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends PageView {
  MyHomePage({super.key});
@override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
        HomeControllerImp conroller = Get.put(HomeControllerImp());

    return Scaffold(
      appBar: AppBar(
        title:Text('0001'.tr,style: const TextStyle(fontWeight: FontWeight.bold),) ,
        actions:  [
          MaterialButton(onPressed: (){
            conroller.language();
          },child:const Icon(Icons.cabin_outlined),),
        ],
        backgroundColor:Colors.white
      ),
      body:   Center(
        child: ListView(
          children:  [
            Column(
              children: <Widget>[
               Card(child: SizedBox(width: 400,height: 750,child:Column(children: [
                const SizedBox(height: 5,),
                Row(children: [Container(width: 400,height: 160,color: Colors.white,
                child: PageView(children: const [
                  Image(image: AssetImage(AppImageAssets.car2),width:350,),
                  Image(image: AssetImage(AppImageAssets.car1),width: double.infinity,),
                  Image(image: AssetImage(AppImageAssets.othath1),width: double.infinity,),
                ],),)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
              const SizedBox(height: 350,)  ,
              Row(
                children: [
                  const SizedBox(width: 50,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Container(height: 30,width: 45, child: Text('print'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),)),
                  color: const Color.fromARGB(255, 241, 158, 4),),
                 const SizedBox(width: 10,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Text('accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color: Colors.green,),
                 const SizedBox(width: 10,),
                      MaterialButton(
                    onPressed: (){}
                  ,child:Text('not accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color:Colors.red,),
                ],
              )
              ],) ,),color: const Color.fromARGB(255, 238, 237, 236),),     Card(child: SizedBox(width: 400,height: 750,child:Column(children: [
                const SizedBox(height: 5,),
                Row(children: [Container(width: 400,height: 160,color: Colors.white,
                child: PageView(children: const [
                  Image(image: AssetImage(AppImageAssets.car2),width:350,),
                  Image(image: AssetImage(AppImageAssets.car1),width: double.infinity,),
                  Image(image: AssetImage(AppImageAssets.othath1),width: double.infinity,),
                ],),)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
              const SizedBox(height: 350,)  ,
              Row(
                children: [
                  const SizedBox(width: 50,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Container(height: 30,width: 45, child: Text('print'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),)),
                  color: const Color.fromARGB(255, 241, 158, 4),),
                 const SizedBox(width: 10,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Text('accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color: Colors.green,),
                 const SizedBox(width: 10,),
                      MaterialButton(
                    onPressed: (){}
                  ,child:Text('not accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color:Colors.red,),
                ],
              )
              ],) ,),color: const Color.fromARGB(255, 238, 237, 236),),     Card(child: SizedBox(width: 400,height: 750,child:Column(children: [
                const SizedBox(height: 5,),
                Row(children: [Container(width: 400,height: 160,color: Colors.white,
                child: PageView(children: const [
                  Image(image: AssetImage(AppImageAssets.car2),width:350,),
                  Image(image: AssetImage(AppImageAssets.car1),width: double.infinity,),
                  Image(image: AssetImage(AppImageAssets.othath1),width: double.infinity,),
                ],),)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
              const SizedBox(height: 350,)  ,
              Row(
                children: [
                  const SizedBox(width: 50,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Container(height: 30,width: 45, child: Text('print'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),)),
                  color: const Color.fromARGB(255, 241, 158, 4),),
                 const SizedBox(width: 10,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Text('accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color: Colors.green,),
                 const SizedBox(width: 10,),
                      MaterialButton(
                    onPressed: (){}
                  ,child:Text('not accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color:Colors.red,),
                ],
              )
              ],) ,),color: const Color.fromARGB(255, 238, 237, 236),),
          Card(child: SizedBox(width: 400,height: 750,child:Column(children: [
                const SizedBox(height: 5,),
                Row(children: [Container(width: 400,height: 160,color: Colors.white,
                child: PageView(children: const [
                  Image(image: AssetImage(AppImageAssets.car2),width:350,),
                  Image(image: AssetImage(AppImageAssets.car1),width: double.infinity,),
                  Image(image: AssetImage(AppImageAssets.othath1),width: double.infinity,),
                ],),)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
              const SizedBox(height: 350,)  ,
              Row(
                children: [
                  const SizedBox(width: 50,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Container(height: 30,width: 45, child: Text('print'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),)),
                  color: const Color.fromARGB(255, 241, 158, 4),),
                 const SizedBox(width: 10,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Text('accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color: Colors.green,),
                 const SizedBox(width: 10,),
                      MaterialButton(
                    onPressed: (){}
                  ,child:Text('not accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color:Colors.red,),
                ],
              )
              ],) ,),color: const Color.fromARGB(255, 238, 237, 236),),     Card(child: SizedBox(width: 400,height: 750,child:Column(children: [
                const SizedBox(height: 5,),
                Row(children: [Container(width: 400,height: 160,color: Colors.white,
                child: PageView(children: const [
                  Image(image: AssetImage(AppImageAssets.car2),width:350,),
                  Image(image: AssetImage(AppImageAssets.car1),width: double.infinity,),
                  Image(image: AssetImage(AppImageAssets.othath1),width: double.infinity,),
                ],),)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
                const SizedBox(height: 10,),
                Row(children: [Container(width: 400,height: 50,color: Colors.white,)],),
              const SizedBox(height: 350,)  ,
              Row(
                children: [
                  const SizedBox(width: 50,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Container(height: 30,width: 45, child: Text('print'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),)),
                  color: const Color.fromARGB(255, 241, 158, 4),),
                 const SizedBox(width: 10,),
                  MaterialButton(
                    onPressed: (){}
                  ,child:Text('accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color: Colors.green,),
                 const SizedBox(width: 10,),
                      MaterialButton(
                    onPressed: (){}
                  ,child:Text('not accept'.tr,style: const TextStyle(color: Colors.white,fontSize: 20),),color:Colors.red,),
                ],
              )
              ],) ,),color: const Color.fromARGB(255, 238, 237, 236),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
