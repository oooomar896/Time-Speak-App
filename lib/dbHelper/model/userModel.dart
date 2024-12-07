// To parse this JSON data, do
//
//     final mongoModel = mongoModelFromJson(jsonString);

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
MongoModel mongoModelFromJson(String str) => MongoModel.fromJson(json.decode(str));
String mongoModelToJson(MongoModel data) => json.encode(data.toJson());

class MongoModel {
    ObjectId id;
    String name;
    String numberPhone;
    String numberId;
    String muprofil;
    String urlImage;
    String email;

    MongoModel({
        required this.id,
        required this.name,
        required this.numberPhone,
        required this.numberId,
        required this.muprofil,
        required this.urlImage,
        required this.email,
    });

    factory MongoModel.fromJson(Map<String, dynamic> json) => MongoModel(
        id: json["id"],
        name: json["name"],
        numberPhone: json["numberPhone"],
        numberId: json["numberId"],
        muprofil: json["muprofil"],
        urlImage: json["urlImage"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "numberPhone": numberPhone,
        "numberId": numberId,
        "muprofil": muprofil,
        "urlImage": urlImage,
        "email": email,
    };
}
