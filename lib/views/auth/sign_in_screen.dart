import 'package:flutter/material.dart';
import 'package:pdfclass/Utils/constant.dart';
import 'package:pdfclass/routes/route_name.dart';
import 'package:pdfclass/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
        title: Text('Login'),
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
                  height: 200,
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
                    labelText: "Email",
                    hintText: "Email",
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
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
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
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: context.watch<AuthViewModel>().getIsLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: green,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthViewModel>().signInApi(
                                  context,
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: Text("Login")),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.signUpScreen);
                      },
                      child: Text('Create an account?'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
