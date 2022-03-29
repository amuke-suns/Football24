import 'package:flutter/foundation.dart';
import 'package:football_news/business_logic/models/fixtures_query.dart';
import 'package:football_news/business_logic/utils/constants.dart';
import 'package:football_news/services/favourite/favourite_service.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/services/web_api/web_api.dart';

import "package:collection/collection.dart";

class AllGamesViewModel extends ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();
  final FavouriteService _favouriteService = serviceLocator<FavouriteService>();

  /*List<Favourite> _favourites = [];
  List<Favourite> get favourites => _favourites;*/

  Future<AllGamesViewModel> init() async {
    getAllGames();
    return this;
  }

  Future<Map<String, List<FixtureDetails>>> getAllGames() async {
    List<int> ids = await _favouriteService.getAllFavouriteIds();
    FixturesQuery decodedData = await _webService.getAllFixtures(date: '');

    // group by country and league name
    var groupedMap = decodedData.response.groupListsBy(
          (element) {
        if (ids.contains(element.league.id)) {
          return kFavouriteKey;
        }
        return '${element.league.country}: ${element.league.name}';
      },
    );

    return groupedMap;
  }
}