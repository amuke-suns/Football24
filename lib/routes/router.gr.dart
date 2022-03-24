// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../screens/screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    AllGamesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    LiveRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LiveScreen());
    },
    FavouriteRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FavouritesScreen());
    },
    CompetitionsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    AllGamesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AllGamesScreen());
    },
    CompetitionsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CompetitionsScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(Home.name, path: '/', children: [
          _i2.RouteConfig(AllGamesRouter.name,
              path: 'allgames',
              parent: Home.name,
              children: [
                _i2.RouteConfig(AllGamesRoute.name,
                    path: '', parent: AllGamesRouter.name)
              ]),
          _i2.RouteConfig(LiveRouter.name, path: 'live', parent: Home.name),
          _i2.RouteConfig(FavouriteRouter.name,
              path: 'favourites', parent: Home.name),
          _i2.RouteConfig(CompetitionsRouter.name,
              path: 'competitions',
              parent: Home.name,
              children: [
                _i2.RouteConfig(CompetitionsRoute.name,
                    path: '', parent: CompetitionsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i2.PageRouteInfo<void> {
  const Home({List<_i2.PageRouteInfo>? children})
      : super(Home.name, path: '/', initialChildren: children);

  static const String name = 'Home';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AllGamesRouter extends _i2.PageRouteInfo<void> {
  const AllGamesRouter({List<_i2.PageRouteInfo>? children})
      : super(AllGamesRouter.name, path: 'allgames', initialChildren: children);

  static const String name = 'AllGamesRouter';
}

/// generated route for
/// [_i1.LiveScreen]
class LiveRouter extends _i2.PageRouteInfo<void> {
  const LiveRouter() : super(LiveRouter.name, path: 'live');

  static const String name = 'LiveRouter';
}

/// generated route for
/// [_i1.FavouritesScreen]
class FavouriteRouter extends _i2.PageRouteInfo<void> {
  const FavouriteRouter() : super(FavouriteRouter.name, path: 'favourites');

  static const String name = 'FavouriteRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CompetitionsRouter extends _i2.PageRouteInfo<void> {
  const CompetitionsRouter({List<_i2.PageRouteInfo>? children})
      : super(CompetitionsRouter.name,
            path: 'competitions', initialChildren: children);

  static const String name = 'CompetitionsRouter';
}

/// generated route for
/// [_i1.AllGamesScreen]
class AllGamesRoute extends _i2.PageRouteInfo<void> {
  const AllGamesRoute() : super(AllGamesRoute.name, path: '');

  static const String name = 'AllGamesRoute';
}

/// generated route for
/// [_i1.CompetitionsScreen]
class CompetitionsRoute extends _i2.PageRouteInfo<void> {
  const CompetitionsRoute() : super(CompetitionsRoute.name, path: '');

  static const String name = 'CompetitionsRoute';
}
