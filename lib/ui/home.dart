import 'package:flutter/material.dart';
import 'package:football_news/ui/all_games_screen.dart';
import 'package:football_news/ui/favorites_screen.dart';
import 'package:football_news/ui/live_screen.dart';
import 'package:football_news/ui/competitions_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _screens = const [
    AllGamesScreen(),
    LiveScreen(),
    FavouritesScreen(),
    CompetitionsScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football News')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'All Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: 'LIVE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Standings',
          ),
        ],
      ),
    );
  }
}
