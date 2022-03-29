import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/services/favourite/favourite_service.dart';
import 'package:football_news/services/service_locator.dart';

import '../storage/storage_service.dart';

// This class is the concrete implementation of [Favourite]. It is a
// wrapper around the WebApi and StorageService services. This way the view models
// don't actually have to know anything about the web or storage details.
class FavouriteServiceImpl implements FavouriteService {
  final StorageService _storageService = serviceLocator<StorageService>();

  static final defaultFavorites = [
    Favourite(
      id: 39,
      country: 'England',
      league: 'Premier League',
      flag: 'https://media.api-sports.io/football/leagues/39.png',
      type: 'League',
    )
  ];

  List<Favourite> _favourites = [];

  @override
  Future<List<Favourite>> getAllFavouriteCompetitions() async {
    _favourites = await _storageService.getFavoriteCompetitions();
    if (_favourites.isEmpty) {
      _favourites = defaultFavorites;
    }
    return _favourites;
  }

  @override
  Future<void> saveFavoriteCompetitions(List<Favourite> favourites) async {
    if (favourites.isEmpty) {
      return;
    }
    await _storageService.saveFavoriteCompetitions(favourites);
  }

  @override
  Future<bool> isFavouriteId(int id) async {
    return Future<bool>.value(_favourites.any((fav) => fav.id == id));
    // return await _storageService.isFavouriteId(id);
  }

  @override
  Future<List<int>> getAllFavouriteIds() async {
    var favourites = await getAllFavouriteCompetitions();
    List<int> ids = [];

    for (var favourite in favourites) {
      ids.add(favourite.id);
    }

    return Future<List<int>>.value(ids);
  }
}
