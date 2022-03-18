import 'package:flutter/material.dart';

class FootballNewsTab {
  static const int allGames = 0;
  static const int live = 1;
  static const int favorites = 2;
  static const int standings = 3;
}

class AppStateManager extends ChangeNotifier {

  int _selectedTab = FootballNewsTab.allGames;
  int get selectedTab => _selectedTab;


  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = 1;
    notifyListeners();
  }
}
