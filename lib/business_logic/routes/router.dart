import 'package:auto_route/auto_route.dart';
import 'package:football_news/ui/views/screens.dart';

@MaterialAutoRouter(
  // makes our routes names less redundant
  // replaces *Page with *Route
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
        path: '/',
        page: Home,
        children: [
          AutoRoute(
            // path name
            path: 'allgames',
            // this will be used to generate the name for the router
            name: 'AllGamesRouter',
            // thus defined because this specific bottom tab has nested tab
            page: EmptyRouterPage,
            // this is a list of nested routes
            children: [
              // the empty string path is the initial
              AutoRoute(path: '', page: AllGamesScreen),
              AutoRoute(path: 'leagueName', page: FixturesScreen),
              AutoRoute(path: 'standings', page: StandingsScreen)
            ],
          ),
          AutoRoute(
            path: 'live',
            name: 'LiveRouter',
            page: LiveScreen,
          ),
          AutoRoute(
            path: 'favourites',
            name: 'FavouriteRouter',
            // no need for EmptyRouterPage since there are no nested routes
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: FavouritesScreen),
              AutoRoute(path: 'standings', page: StandingsScreen)
            ]
          ),
          AutoRoute(
            path: 'competitions',
            name: 'CompetitionsRouter',
            // no need for EmptyRouterPage since there are no nested routes
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: CompetitionsScreen),
              AutoRoute(path: 'league', page: LeaguesScreen),
              AutoRoute(path: 'standings', page: StandingsScreen)
            ],
          ),
        ]
    ),
    AutoRoute(
      path: '/settings',
      page: SettingsScreen,
    ),
  ],
)

class $AppRouter {}