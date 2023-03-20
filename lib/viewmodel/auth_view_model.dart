import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pdfclass/Utils/constant.dart';
import 'package:pdfclass/Utils/utils.dart';
import 'package:pdfclass/model/signin_model.dart';
import 'package:pdfclass/model/signup_model.dart';
import 'package:pdfclass/repository/auth_repository.dart';
import 'package:pdfclass/routes/route_name.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;

  bool _isLoadingSignup = false;
  bool get getIsLoadingSignUp => _isLoadingSignup;

  final AuthRepository _repo = AuthRepository();

  Future signInApi(BuildContext context, String email, String password) async {
    Map data = {"email": email, "password": password};
    log(data.toString());
    print("object");
    _isLoading = true;
    notifyListeners();
    await _repo.signIn(data).then((value) {
      _isLoading = false;

      SignInModel signInModel =
          SignInModel.fromJson(value as Map<String, dynamic>);
      log(value.runtimeType.toString());
      Utils.showSnackBar(context, signInModel.message!, green);
      Navigator.popAndPushNamed(context, RouteName.bottomBarScreen);
      notifyListeners();
    }).onError((error, stackTrace) {
      _isLoading = false;
      notifyListeners();
      if (error.toString().contains("401")) {
        Utils.showSnackBar(context, "Invalid Email or Password", red);
      } else {
        Utils.showSnackBar(context, error.toString(), red);
      }
    });
  }

  Future signUpApi(BuildContext context, String userName, String email,
      String password, String confirmPassword) async {
    Map data = {
      "userName": userName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    };
    _isLoadingSignup = true;
    notifyListeners();
    await _repo.signUp(data).then((value) {
      _isLoadingSignup = false;
      SignUpModel model = SignUpModel.fromJson(value as Map<String, dynamic>);
      Utils.showSnackBar(context, model.message, green);
      notifyListeners();
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      _isLoadingSignup = false;
      notifyListeners();
      if (error.toString().contains("401")) {
        Utils.showSnackBar(context, "Account already created ", red);
      } else {
        Utils.showSnackBar(context, error.toString(), red);
      }
    });
  }
}
