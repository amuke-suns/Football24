import 'package:flutter/material.dart';
import 'package:football_news/models/app_cache.dart';

class SettingsManager extends ChangeNotifier {
  final _appCache = AppCache();

  late bool _darkMode = true;
  bool get darkMode => _darkMode;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    _appCache.cacheDarkMode(darkMode);
    notifyListeners();
  }

  void init() async {
    _darkMode = await _appCache.isDarkMode();
  }
}