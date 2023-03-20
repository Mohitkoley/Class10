import 'package:flutter/material.dart';
import 'package:pdfclass/views/bottom_bar/home_screen.dart';
import 'package:pdfclass/views/bottom_bar/update_screen.dart';

class BottomBarViewModel extends ChangeNotifier {
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    UpdateScreen(),
  ];
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget get currentScreen => _widgetOptions.elementAt(_currentIndex);
}
