import 'package:flutter/foundation.dart';
import 'package:football_news/models/models.dart';

class MemoryRepository with ChangeNotifier {

  List<String> _favouriteIds = [
    '39', // epl
    '45', // fa cup
    '46', // efl cup
    '528', // community shield
    '2', // ucl
    '3', // europa league
    '848', // conference league
    '140', // la liga
    '135', // serie a
    '78', // bundesliga
    '61', // ligue 1
    '88', // eredivise
    '9', // copa america
  ];
  List<String> get favouriteIds => List.unmodifiable(_favouriteIds);

  final AppCache _appCache = AppCache();

  void init() async {
    if (await _appCache.isFavListCached()) {
      _favouriteIds = await _appCache.getCachedList();
    } else {
      _appCache.cacheList(_favouriteIds);
    }
  }

  void insertId(int id) {
    _favouriteIds.add(id.toString());
    _appCache.cacheList(_favouriteIds);
    notifyListeners();
  }

  void deleteId(int id) {
    bool isRemove = _favouriteIds.remove(id.toString());

    if (isRemove) {
      _appCache.cacheList(_favouriteIds);
    }
    notifyListeners();
  }
}
