import 'package:pdfclass/model/user_model.dart';

class SignInModel {
  bool? success;
  String? message;
  User? user;
  String? token;

  SignInModel({this.success, this.message, this.user, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
