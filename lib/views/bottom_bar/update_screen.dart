import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq_H = MediaQuery.of(context).size.height;
    final mq_W = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        // Assign the key to Scaffold.
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: mq_W * 0.8,
                          width: mq_W,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Image.asset(
                                "assets/images/up_2.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: mq_W * 0.8,
                        width: mq_W,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Image.asset(
                              "assets/images/up_1.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: mq_W * 0.8,
                          width: mq_W,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Image.asset(
                                "assets/images/up_3.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
