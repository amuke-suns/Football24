import 'package:football_news/business_logic/models/favourite.dart';

// This is a contract all storage services must follow
abstract class StorageService {

  Future<List<Favourite>> getAllFavoriteCompetitions();

  Future<void> saveNewFavourites(List<Favourite> favourite);

  Future<bool> isDarkMode();

  Future<void> setDarkMode(bool isDarkMode);

  Future<bool> isFavouriteId(int id);
}