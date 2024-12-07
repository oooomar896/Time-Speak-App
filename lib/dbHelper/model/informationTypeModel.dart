// To parse this JSON data, do
//
//     final mongoModel = mongoModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoModelAdd mongoModelAddFromJson(String str) => MongoModelAdd.fromJson(json.decode(str));
String mongoModelAddToJson(MongoModelAdd data) => json.encode(data.toJson());

class MongoModelAdd {
     ObjectId id;
    String typeProduct;
    String usingTo;
    String price;
    String exes;
    String city;
    String details;
    String urlImage;
    ObjectId id_user;
    String typeAvailable;
    String likes;

    MongoModelAdd({
        required this.id,
        required this.typeProduct,
        required this.usingTo,
        required this.price,
        required this.exes,
        required this.city,
        required this.details,
        required this.urlImage,
        required this.id_user,
        required this.typeAvailable,
        required this.likes,

    });
    factory MongoModelAdd.fromJson(Map<String, dynamic> json) => MongoModelAdd(
        id: json["id"],
        typeProduct: json["typeProduct"],
        usingTo: json["usingTo"],
        price: json["price"],
        exes: json["exes"],
        city: json["city"],
        details: json["details"],
        urlImage: json["urlImage"],
        id_user: json["id_user"],
        typeAvailable: json["typeAvailable"],
        likes: json["likes"],

    );
    Map<String, dynamic> toJson() => {
        "id": id,
        "typeProduct": typeProduct,
        "usingTo": usingTo,
        "price": price,
        "exes": exes,
        "city": city,
        "details": details,
        "urlImage": urlImage,
        "id_user": id_user,
        "typeAvailable": typeAvailable,
        "likes": likes,
    };
}
