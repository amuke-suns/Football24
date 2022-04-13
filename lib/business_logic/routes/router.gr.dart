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

import '../../ui/views/screens.dart' as _i1;
import '../models/fixtures_query.dart' as _i4;
import '../models/league_query.dart' as _i5;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    SettingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SettingsScreen());
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
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CompetitionsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    AllGamesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AllGamesScreen());
    },
    FixturesRoute.name: (routeData) {
      final args = routeData.argsAs<FixturesRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.FixturesScreen(
              key: args.key, title: args.title, fixtures: args.fixtures));
    },
    StandingsRoute.name: (routeData) {
      final args = routeData.argsAs<StandingsRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.StandingsScreen(
              key: args.key, leagueId: args.leagueId, year: args.year));
    },
    FavouritesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FavouritesScreen());
    },
    CompetitionsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CompetitionsScreen());
    },
    LeaguesRoute.name: (routeData) {
      final args = routeData.argsAs<LeaguesRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.LeaguesScreen(
              key: args.key, title: args.title, leagues: args.leagues));
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
                    path: '', parent: AllGamesRouter.name),
                _i2.RouteConfig(FixturesRoute.name,
                    path: 'leagueName', parent: AllGamesRouter.name),
                _i2.RouteConfig(StandingsRoute.name,
                    path: 'standings', parent: AllGamesRouter.name)
              ]),
          _i2.RouteConfig(LiveRouter.name, path: 'live', parent: Home.name),
          _i2.RouteConfig(FavouriteRouter.name,
              path: 'favourites',
              parent: Home.name,
              children: [
                _i2.RouteConfig(FavouritesRoute.name,
                    path: '', parent: FavouriteRouter.name),
                _i2.RouteConfig(StandingsRoute.name,
                    path: 'standings', parent: FavouriteRouter.name)
              ]),
          _i2.RouteConfig(CompetitionsRouter.name,
              path: 'competitions',
              parent: Home.name,
              children: [
                _i2.RouteConfig(CompetitionsRoute.name,
                    path: '', parent: CompetitionsRouter.name),
                _i2.RouteConfig(LeaguesRoute.name,
                    path: 'league', parent: CompetitionsRouter.name),
                _i2.RouteConfig(StandingsRoute.name,
                    path: 'standings', parent: CompetitionsRouter.name)
              ])
        ]),
        _i2.RouteConfig(SettingsRoute.name, path: '/settings')
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
/// [_i1.SettingsScreen]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
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
/// [_i2.EmptyRouterPage]
class FavouriteRouter extends _i2.PageRouteInfo<void> {
  const FavouriteRouter({List<_i2.PageRouteInfo>? children})
      : super(FavouriteRouter.name,
            path: 'favourites', initialChildren: children);

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
/// [_i1.FixturesScreen]
class FixturesRoute extends _i2.PageRouteInfo<FixturesRouteArgs> {
  FixturesRoute(
      {_i3.Key? key,
      required String title,
      required List<_i4.FixtureDetails> fixtures})
      : super(FixturesRoute.name,
            path: 'leagueName',
            args:
                FixturesRouteArgs(key: key, title: title, fixtures: fixtures));

  static const String name = 'FixturesRoute';
}

class FixturesRouteArgs {
  const FixturesRouteArgs(
      {this.key, required this.title, required this.fixtures});

  final _i3.Key? key;

  final String title;

  final List<_i4.FixtureDetails> fixtures;

  @override
  String toString() {
    return 'FixturesRouteArgs{key: $key, title: $title, fixtures: $fixtures}';
  }
}

/// generated route for
/// [_i1.StandingsScreen]
class StandingsRoute extends _i2.PageRouteInfo<StandingsRouteArgs> {
  StandingsRoute({_i3.Key? key, required int leagueId, required int year})
      : super(StandingsRoute.name,
            path: 'standings',
            args: StandingsRouteArgs(key: key, leagueId: leagueId, year: year));

  static const String name = 'StandingsRoute';
}

class StandingsRouteArgs {
  const StandingsRouteArgs(
      {this.key, required this.leagueId, required this.year});

  final _i3.Key? key;

  final int leagueId;

  final int year;

  @override
  String toString() {
    return 'StandingsRouteArgs{key: $key, leagueId: $leagueId, year: $year}';
  }
}

/// generated route for
/// [_i1.FavouritesScreen]
class FavouritesRoute extends _i2.PageRouteInfo<void> {
  const FavouritesRoute() : super(FavouritesRoute.name, path: '');

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i1.CompetitionsScreen]
class CompetitionsRoute extends _i2.PageRouteInfo<void> {
  const CompetitionsRoute() : super(CompetitionsRoute.name, path: '');

  static const String name = 'CompetitionsRoute';
}

/// generated route for
/// [_i1.LeaguesScreen]
class LeaguesRoute extends _i2.PageRouteInfo<LeaguesRouteArgs> {
  LeaguesRoute(
      {_i3.Key? key,
      required String title,
      required List<_i5.LeagueDesc> leagues})
      : super(LeaguesRoute.name,
            path: 'league',
            args: LeaguesRouteArgs(key: key, title: title, leagues: leagues));

  static const String name = 'LeaguesRoute';
}

class LeaguesRouteArgs {
  const LeaguesRouteArgs(
      {this.key, required this.title, required this.leagues});

  final _i3.Key? key;

  final String title;

  final List<_i5.LeagueDesc> leagues;

  @override
  String toString() {
    return 'LeaguesRouteArgs{key: $key, title: $title, leagues: $leagues}';
  }
}
