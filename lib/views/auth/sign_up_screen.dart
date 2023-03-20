import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfclass/Utils/constant.dart';
import 'package:pdfclass/viewmodel/auth_view_model.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  final RegExp emailRegex = RegExp("[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: userName,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "User Name",
                    hintText: "User Name",
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    ///
                    /////
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    ///
                    /////
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.phone,
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    hintText: "Phone",
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    ///
                    /////
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    } else if (value != confirmPasswordController.text) {
                      return 'Password not matched';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    ///
                    /////
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    } else if (value != passwordController.text) {
                      return 'Password not matched';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Confirm Password",
                    filled: true,
                    fillColor: Colors.white,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),

                    ///
                    /////
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: context.watch<AuthViewModel>().getIsLoadingSignUp
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: green,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthViewModel>().signUpApi(
                                  context,
                                  userName.text,
                                  emailController.text,
                                  passwordController.text,
                                  confirmPasswordController.text);
                            }
                          },
                          child: const Text('Sign up')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
