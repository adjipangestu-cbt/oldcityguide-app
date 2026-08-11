import 'package:flutter/material.dart';

class BottomNavigationViewmodel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateNavigationIndex(int index) {
    _selectedIndex = index;
    print(index);
    notifyListeners();
  }
}
