import 'package:flutter/material.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';
import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/ui/theme.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
        ChangeNotifierProvider(create: (_) => GamesViewModel()),
        ChangeNotifierProvider(create: (_) => CalendarViewModel()),
        ChangeNotifierProvider(create: (_) => StandingsViewModel()),
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
        },
      ),
    );
  }
}
