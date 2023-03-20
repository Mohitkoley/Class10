// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) =>
    SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
  SubjectModel({
    required this.success,
    required this.message,
    required this.dataSubject,
  });

  bool success;
  String message;
  List<DataSubject> dataSubject;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        success: json["success"],
        message: json["message"],
        dataSubject: List<DataSubject>.from(
            json["data"].map((x) => DataSubject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(dataSubject.map((x) => x.toJson())),
      };
}

class DataSubject {
  DataSubject({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String image;
  DataSubSubject category;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DataSubject.fromJson(Map<String, dynamic> json) => DataSubject(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        category: DataSubSubject.fromJson(json["category"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "category": category.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class DataSubSubject {
  DataSubSubject({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DataSubSubject.fromJson(Map<String, dynamic> json) => DataSubSubject(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
