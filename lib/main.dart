import 'package:flutter/material.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';
import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/services/storage/storage_service.dart';
import 'package:football_news/ui/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  setupServiceLocator();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<bool>(
    future: serviceLocator<StorageService>().isDarkMode(),
    builder: (_, snapshot) {
      return snapshot.hasData
          ? FootballNewsApp(
              isDarkMode: snapshot.data!,
            )
          : Container();
    },
  ));
}

class FootballNewsApp extends StatefulWidget {
  final bool isDarkMode;

  const FootballNewsApp({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

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
            create: (_) => SettingsViewModel(mode: widget.isDarkMode)),
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
            theme: theme,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
          );
        },
      ),
    );
  }
}
