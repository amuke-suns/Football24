import 'package:flutter/foundation.dart';
import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/services/favourite/favourite_service.dart';
import 'package:football_news/services/service_locator.dart';

import '../../services/web_api/web_api.dart';
import '../models/fixtures_query.dart';

import "package:collection/collection.dart";

import '../utils/constants.dart';

class GamesViewModel extends ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();
  final FavouriteService _favouriteService = serviceLocator<FavouriteService>();

  List<Favourite> _favourites = [];

  List<Favourite> get favourites => _favourites;

  final Set<int> _favIds = {};

  Set<int> get favIds => _favIds;

  GamesViewModel() {
    loadFavourites();
  }

  bool isFavourite(int id) => _favIds.contains(id);

  void loadFavourites() async {
    _favourites = await _favouriteService.getAllFavouriteCompetitions();
    for (var favourite in _favourites) {
      _favIds.add(favourite.id);
    }
  }

  Future<void> saveToFavourites(Favourite favourite) async {
    _favourites.add(favourite);
    _favIds.add(favourite.id);
    notifyListeners();
    _favouriteService.saveNewFavorites(favourites);
  }

  Future<void> removeFavourites(int id) async {
    _favourites.removeWhere((favourite) => favourite.id == id);
    _favIds.remove(id);
    notifyListeners();
    _favouriteService.saveNewFavorites(favourites);
  }

  Future<Map<String, List<FixtureDetails>>> getAllGames() async {
    FixturesQuery decodedData = await _webService.getAllFixtures(date: '');

    // group by country and league name
    var groupedMap = decodedData.response.groupListsBy(
      (element) {
        if (_favIds.contains(element.league.id)) {
          return kFavouriteKey;
        }
        return '${element.league.country}: ${element.league.name}';
      },
    );

    return groupedMap;
  }

  Map<String, List<FixtureDetails>> getFixturesSortGroup(
    List<FixtureDetails> fixtures,
  ) {
    // sort fixtures
    fixtures.sort((a, b) => a.league.country.compareTo(b.league.country));

    // group fixtures by competition
    var groupedMap = fixtures.groupListsBy(
      (element) => '${element.league.country}: ${element.league.name}',
    );

    return groupedMap;
  }
}
