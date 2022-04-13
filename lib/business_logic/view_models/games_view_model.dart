import 'package:flutter/foundation.dart';
import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/services/favourite/favourite_service.dart';
import 'package:football_news/services/service_locator.dart';

import '../../services/web_api/web_api.dart';
import '../models/fixtures_query.dart';

import "package:collection/collection.dart";

import '../models/league_query.dart';
import '../utils/constants.dart';

class GamesViewModel extends ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();
  final FavouriteService _favouriteService = serviceLocator<FavouriteService>();

  List<Favourite> _favourites = [];

  List<Favourite> get favourites => _favourites;

  final Set<int> _favIds = {};

  Set<int> get favIds => _favIds;

  List<FixtureDetails> _allFixtureDetailsList = [];
  List<LeagueDesc> _allCompetitionsList = [];

  GamesViewModel() {
    _loadFavourites();
    _loadCompetitionData();
  }

  List<int> getSeasonYears({required int leagueId}) {
    return _allCompetitionsList
        .firstWhere((element) => element.league.id == leagueId)
        .getSeasonYears();
  }

  bool isFavourite(int id) => _favIds.contains(id);

  void _loadFavourites() async {
    _favourites = await _favouriteService.getAllFavouriteCompetitions();
    for (var favourite in _favourites) {
      _favIds.add(favourite.id);
    }
  }

  void saveToFavourites(Favourite favourite) {
    _favourites.add(favourite);
    _favIds.add(favourite.id);
    notifyListeners();
    _favouriteService.saveNewFavorites(favourites);
  }

  void removeFavourites(int id) {
    _favourites.removeWhere((favourite) => favourite.id == id);
    _favIds.remove(id);
    notifyListeners();
    _favouriteService.saveNewFavorites(favourites);
  }

  Future<void> _loadAllGames(String date) async {
    FixturesQuery decodedData = await _webService.getAllFixtures(date: date);
    _allFixtureDetailsList = decodedData.response;
  }

  Future<Map<String, List<FixtureDetails>>> getAllGames(String date) async {
    await _loadAllGames(date);
    print(date);

    // group by country and league name
    var groupedMap = _allFixtureDetailsList.groupListsBy(
      (element) {
        if (_favIds.contains(element.league.id)) {
          return kFavouriteKey;
        }
        return '${element.league.country}: ${element.league.name}';
      },
    );
    return Future.value(groupedMap);
  }

  void _loadCompetitionData() async {
    LeagueQuery decodedData = await _webService.getALlLeagues();
    _allCompetitionsList = decodedData.response;
  }

  Future<Map<String, List<LeagueDesc>>> getCompetitionData() {
    // group by country name
    Map<String, List<LeagueDesc>> groupedMap =
        _allCompetitionsList.groupListsBy((element) {
      if (favIds.contains(element.league.id)) {
        return kFavouriteKey;
      }
      return element.country.name;
    });

    return Future.value(groupedMap);
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

  List<LeagueDesc> sortLeagueDescs(List<LeagueDesc> leagues) {
    return leagues..sort((a, b) => a.country.name.compareTo(b.country.name));
  }
}
