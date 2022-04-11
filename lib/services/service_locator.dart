import 'package:football_news/services/web_api/web_api_fake.dart';
import 'package:get_it/get_it.dart';

import 'favourite/favourite_service.dart';
import 'favourite/favourite_service_impl.dart';
import 'storage/storage_service.dart';
import 'storage/storage_service_impl.dart';
import 'web_api/web_api.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiFake());

  serviceLocator
      .registerLazySingleton<StorageService>(() => StorageServiceImpl());
  serviceLocator
      .registerLazySingleton<FavouriteService>(() => FavouriteServiceImpl());

}
