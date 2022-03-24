import 'package:flutter/material.dart';
import 'package:football_news/data/memory_repository.dart';
import 'package:football_news/football_news_theme.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/routes/router.gr.dart';
import 'package:football_news/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          lazy: true,
          create: (_) => AppStateManager(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => AppDateManager()..init(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => SettingsManager()..init(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (_) => MemoryRepository()..init(),
        ),
      ],
      child: Consumer<SettingsManager>(
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
