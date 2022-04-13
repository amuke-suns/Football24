import 'package:flutter/foundation.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/services/storage/storage_service.dart';

class SettingsViewModel extends ChangeNotifier {

  final StorageService _storageService = serviceLocator<StorageService>();

  bool _darkMode;
  bool get darkMode => _darkMode;

  SettingsViewModel({required bool mode}) : _darkMode = mode;

  Future<void> setDarkMode(bool isDarkMode) async {
    _darkMode = isDarkMode;
    notifyListeners();
    _storageService.setDarkMode(isDarkMode);
  }
}