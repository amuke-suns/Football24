import 'package:football_news/business_logic/models/favourite.dart';

// This is the contract that all favourite services must follow.
abstract class FavouriteService {
  Future<List<Favourite>> getAllFavouriteCompetitions();

  Future<void> saveFavoriteCompetitions(List<Favourite> favourites);

  Future<bool> isFavouriteId(int id);

  Future<List<int>> getAllFavouriteIds();
}

