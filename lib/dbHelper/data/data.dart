// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:admin_alghozami/dbHelper/constant.dart';
import 'package:admin_alghozami/dbHelper/model/informationTypeModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseData {
  static var db, swapAddCollectuion;
  static connect2() async {
    db = await Db.create(Home_CONN_URL);
    await db.open();
    inspect(db);
    swapAddCollectuion = db.collection(DATA_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrdata = await swapAddCollectuion.find().toList();
    return arrdata;
  }

  static Future<String> insert2(MongoModelAdd data) async {
    try {
      var result = await swapAddCollectuion.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Somthing Wrong while inserting data.";
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return e.toString();
    }
  }

  static Future productDetails({required ObjectId productId}) async {
    db = await Db.create(Home_CONN_URL);
    await db.open();
    var collection = db.collection('add');
    var data = await collection.find({'id': productId}).toList();
    return data;
  }
  // ignore: non_constant_identifier_names
  static Future id_product_user({required ObjectId productId}) async {
    db = await Db.create(Home_CONN_URL);
    await db.open();
    var collection = db.collection('add');
    var data = await collection.find({'id_user': productId}).toList();
    return data;
  }
  // ignore: non_constant_identifier_names
 
}

