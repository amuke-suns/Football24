import 'package:flutter/foundation.dart';
import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/services/favourite/favourite_service.dart';
import 'package:football_news/services/service_locator.dart';

class FavouritesViewModel extends ChangeNotifier {
  final FavouriteService _favouriteService = serviceLocator<FavouriteService>();

  List<Favourite> _favourites = [];
  List<Favourite> get favourites => _favourites;

  Future<FavouritesViewModel> init() async {
    loadFavourites();
    return this;
  }

  Future<List<Favourite>> loadFavourites() async {
    _favourites = await _favouriteService.getAllFavouriteCompetitions();
    return _favourites;
  }

  // TODO: Implement saveFavourites
}