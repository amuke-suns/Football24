import 'package:football_news/business_logic/view_models/all_games_view_model.dart';
import 'package:football_news/business_logic/view_models/favourites_view_model.dart';
import 'package:football_news/business_logic/view_models/settings_view_model.dart';
import 'package:football_news/services/web_api/web_api_fake.dart';
import 'package:get_it/get_it.dart';

import 'favourite/favourite_service.dart';
import 'favourite/favourite_service_impl.dart';
import 'storage/storage_service.dart';
import 'storage/storage_service_impl.dart';
import 'web_api/web_api.dart';
import 'web_api/web_api_impl.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiFake());

  serviceLocator
      .registerLazySingleton<StorageService>(() => StorageServiceImpl());
  serviceLocator
      .registerLazySingleton<FavouriteService>(() => FavouriteServiceImpl());

  // serviceLocator.isReady()
  /*serviceLocator.registerFactoryAsync<FavouritesViewModel>(
      () async => FavouritesViewModel().init());
  serviceLocator.registerFactoryAsync<SettingsViewModel>(
      () async => SettingsViewModel().init());
  serviceLocator.registerFactoryAsync<AllGamesViewModel>(
          () async => AllGamesViewModel().init());*/

  serviceLocator.registerFactory<FavouritesViewModel>(
          () => FavouritesViewModel()..init());
  serviceLocator.registerFactory<SettingsViewModel>(
          () => SettingsViewModel()..init());
  serviceLocator.registerFactory<AllGamesViewModel>(
          () => AllGamesViewModel()..init());
}
