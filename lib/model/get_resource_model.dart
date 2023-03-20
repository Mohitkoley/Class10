// To parse this JSON data, do
//
//     final resourceModel = resourceModelFromJson(jsonString);

import 'dart:convert';

ResourceModel resourceModelFromJson(String str) =>
    ResourceModel.fromJson(json.decode(str));

String resourceModelToJson(ResourceModel data) => json.encode(data.toJson());

class ResourceModel {
  ResourceModel({
    required this.success,
    required this.message,
    required this.dataChapter,
  });

  bool success;
  String message;
  List<DataChapter> dataChapter;

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        success: json["success"],
        message: json["message"],
        dataChapter: List<DataChapter>.from(
            json["data"].map((x) => DataChapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(dataChapter.map((x) => x.toJson())),
      };
}

class DataChapter {
  DataChapter({
    required this.id,
    required this.name,
    required this.pdf,
    required this.childCategory,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String pdf;
  ChildCategory childCategory;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DataChapter.fromJson(Map<String, dynamic> json) => DataChapter(
        id: json["_id"],
        name: json["name"],
        pdf: json["pdf"],
        childCategory: ChildCategory.fromJson(json["childCategory"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "pdf": pdf,
        "childCategory": childCategory.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class ChildCategory {
  ChildCategory({
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
  String category;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
