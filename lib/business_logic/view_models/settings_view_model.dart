import 'package:flutter/foundation.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/services/storage/storage_service.dart';

class SettingsViewModel extends ChangeNotifier {

  final StorageService _storageService = serviceLocator<StorageService>();

  late bool _darkMode = false;
  bool get darkMode => _darkMode;

  Future<SettingsViewModel> init() async {
    isDarkMode();
    return this;
  }

  Future<bool> isDarkMode() async {
    _darkMode =  await _storageService.isDarkMode();
    return Future<bool>.value(_darkMode);
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    _storageService.setDarkMode(isDarkMode);
    _darkMode = isDarkMode;
    notifyListeners();
  }
}