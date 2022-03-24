import 'package:shared_preferences/shared_preferences.dart';

class AppCache {

  static const kFavourites = 'favourites';
  static const kFavKeyCached = 'fav_key_cached';
  static const kDarkMode = 'dark_mode';

  Future<bool> isFavListCached() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kFavKeyCached) ?? false;
  }

  void cacheList(List<String> list) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kFavourites, list);
    prefs.setBool(kFavKeyCached, true);
  }

  Future<List<String>> getCachedList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(kFavourites) ?? <String>[];
  }

  void cacheDarkMode(bool darkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(kDarkMode, darkMode);
  }

  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kDarkMode) ?? false;
  }
}
