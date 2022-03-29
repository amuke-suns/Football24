import 'package:flutter/material.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';
import 'package:football_news/business_logic/view_models/favourites_view_model.dart';
import 'package:football_news/business_logic/view_models/settings_view_model.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/ui/theme.dart';
import 'package:provider/provider.dart';

import 'business_logic/view_models/games_date_manager.dart';

void main() async {
  setupServiceLocator();
  runApp(const FootballNewsApp());
}

class FootballNewsApp extends StatefulWidget {
  const FootballNewsApp({Key? key}) : super(key: key);

  @override
  State<FootballNewsApp> createState() => _FootballNewsAppState();
}

class _FootballNewsAppState extends State<FootballNewsApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => serviceLocator<SettingsViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => serviceLocator<FavouritesViewModel>(),
        ),
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, manager, child) {
          ThemeData theme;
          if (manager.darkMode) {
            theme = FootballNewsTheme.dark();
          } else {
            theme = FootballNewsTheme.light();
          }
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Football News',
            theme: theme.copyWith(
              snackBarTheme: const SnackBarThemeData(
                backgroundColor: Colors.green,
                contentTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
          );

          /*return MaterialApp(
            debugShowCheckedModeBanner: false,

            home: const Home(),
          );*/
        },
      ),
    );
  }
}
