import 'dart:convert';

import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService{

  static const sharedPrefFavouriteKey = 'favourite_competitions';
  static const sharedPrefDarkMode = 'dark_mode';

  @override
  Future<List<Favourite>> getFavoriteCompetitions() async {
    String data = await _getStringFromPreferences(sharedPrefFavouriteKey);
    List<Favourite> favs = _deserializeFavourites(data);
    return Future<List<Favourite>>.value(favs);
  }

  @override
  Future<void> saveFavoriteCompetitions(List<Favourite> data) {
    String jsonString = jsonEncode(data);
    _saveStringToPreferences(sharedPrefFavouriteKey, jsonString);
    return Future.value(null);
  }

  @override
  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPrefDarkMode) ?? false;
  }

  @override
  Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(sharedPrefDarkMode, isDarkMode);
  }

  @override
  Future<bool> isFavouriteId(int id) async {
    var favourites = await getFavoriteCompetitions();
    return favourites.any((fav) => fav.id == id);
  }

  List<Favourite> _deserializeFavourites(String data) {
    if (data.isEmpty) {
      return [];
    }
    List<Map> favList = jsonDecode(data);
    return favList.map((favMap) => Favourite.fromJson(favMap)).toList();
  }

  Future<void> _saveStringToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }

}
