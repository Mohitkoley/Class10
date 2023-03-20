import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdfclass/views/bottom_bar/bottom_bar.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => BottomBarScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heightH = MediaQuery.of(context).size.height;
    final widthW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: heightH / 2,
              width: widthW,
              color: Colors.green,
            ),
            Container(
              height: heightH / 2,
              width: widthW,
              color: Colors.white10,
            ),
          ],
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 180,
                    width: 180,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 180,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        backgroundImage:
                            AssetImage("assets/images/logo_10.png"),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
