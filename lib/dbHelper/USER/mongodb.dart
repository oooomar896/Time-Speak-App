// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:developer';
import 'package:admin_alghozami/dbHelper/constant.dart';
import 'package:admin_alghozami/dbHelper/model/userModel.dart';
class MongoDatabase{
  static var db, userCollectuion,swapAddCollectuion;
  static connect()async{
    db = await db.create(Home_CONN_URL);
    await db.open();
    inspect(db);
    userCollectuion =db.collection(USER_COLLECTION);
  }
  static Future<String> insert(MongoModel data) async{
    try{
      var result = await  userCollectuion.insertOne(data.toJson());
      if(result.isSuccess){
        return "Data inserted";
      }else{
        return "Somthing Wrong while inserting data.";
      }
    }catch(e){
      return e.toString();
    }
  }
   static Future id_Users({required Object id_Users}) async {
    db = await db.create(Home_CONN_URL);
    await db.open();
    var collection = db.collection('user');
    var data = await collection.find({'id': id_Users}).toList();
    return data;
  }
  
}


