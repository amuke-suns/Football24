import 'package:flutter/material.dart';
import 'package:football_news/football_news_theme.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/ui/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FootballNewsApp());
}

class FootballNewsApp extends StatefulWidget {
  const FootballNewsApp({Key? key}) : super(key: key);

  @override
  State<FootballNewsApp> createState() => _FootballNewsAppState();
}

class _FootballNewsAppState extends State<FootballNewsApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateManager()),
        ChangeNotifierProvider(create: (context) => SettingsManager()),
      ],
      child: Consumer<SettingsManager>(
        builder: (context, manager, child) {
          ThemeData theme;
          if (manager.darkMode) {
            theme = FootballNewsTheme.dark();
          } else {
            theme = FootballNewsTheme.light();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Football News',
            theme: theme,
            home: const Home(),
          );
        },
      ),
    );
  }
}