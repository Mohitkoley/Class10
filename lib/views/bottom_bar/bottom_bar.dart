import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdfclass/viewmodel/bottom_bar_view_model.dart';
import 'package:pdfclass/viewmodel/get_categories_view_model.dart';
import 'package:pdfclass/views/auth/sign_in_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context
        .read<GetCategoriesAndSubCategoriesViewModel>()
        .getAllCategoriesApi(context);
  }

  @override
  Widget build(BuildContext context) {
    BottomBarViewModel bottomBarViewModel =
        Provider.of<BottomBarViewModel>(context);
    return Scaffold(
      drawer: Drawer(
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
      ),
      appBar: AppBar(
        title: bottomBarViewModel.currentIndex == 0
            ? const Text("Home")
            : const Text("Update"),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 50,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Container(
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          ButtonBar(
            buttonPadding: EdgeInsets.symmetric(horizontal: 8.0),
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.grey,
                  ))
            ],
          ),
        ],
      ),
      body: Center(
        child: bottomBarViewModel.currentScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomBarViewModel.currentIndex,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF302569),
          unselectedItemColor: Colors.grey,
          onTap: (index) =>
              context.read<BottomBarViewModel>().changeIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bookmark),
              label: 'Update',
            ),
          ]),
    );
  }
}
