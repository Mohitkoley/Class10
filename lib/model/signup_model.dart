// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

import 'package:pdfclass/model/user_model.dart';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  bool success;
  String message;
  User user;
  String token;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user.toJson(),
        "token": token,
      };
}

// class User {
//   User({
//     required this.name,
//     required this.email,
//     required this.disabled,
//     required this.verified,
//     required this.role,
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String name;
//   String email;
//   bool disabled;
//   bool verified;
//   int role;
//   String id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         name: json["name"],
//         email: json["email"],
//         disabled: json["disabled"],
//         verified: json["verified"],
//         role: json["role"],
//         id: json["_id"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "disabled": disabled,
//         "verified": verified,
//         "role": role,
//         "_id": id,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }
