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
      flag: 'https://media.api-sports.io/flags/gb.svg',
    )
  ];

  List<Favourite> _favourites = [];

  @override
  Future<List<Favourite>> getAllFavouriteCompetitions() async {
    _favourites = await _storageService.getAllFavoriteCompetitions();
    if (_favourites.isEmpty) {
      _favourites = defaultFavorites;
    }
    return _favourites;
  }

  @override
  Future<void> saveNewFavorites(List<Favourite> favourites) async {
    if (favourites.isEmpty) {
      return;
    }
    _favourites = favourites;
    await _storageService.saveNewFavourites(favourites);
  }

  @override
  Future<bool> isFavouriteId(int id) async {
    return Future<bool>.value(_favourites.any((fav) => fav.id == id));
  }
}
