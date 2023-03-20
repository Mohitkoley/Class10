import 'package:flutter/material.dart';
import 'package:pdfclass/views/auth/sign_in_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            color: Colors.green,
            child: Stack(
              children: [
                Positioned(
                  bottom: 100,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 80,
                    width: 80,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    height: 50,
                    width: 200,
                    child: Text(
                      "CBSC 10",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInScreen(),
                ),
              );
            },
            child: ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.leaderboard),
              title: Text("Leadig board"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.download_done),
              title: Text("Download"),
            ),
          ),
        ],
      ),
    );
  }
}
