import 'package:flutter/material.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/ui/all_games_screen.dart';
import 'package:football_news/ui/favorites_screen.dart';
import 'package:football_news/ui/live_screen.dart';
import 'package:football_news/ui/competitions_screen.dart';
import 'package:football_news/ui/settings_screen.dart';
import 'package:football_news/widgets/custom_appbar_title.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final titles = ['All Games', 'LIVE', 'Favourites', 'Standings'];
  static final appBarText = [
    [null, '17.03.2022, THURSDAY'],
    [null, 'LIVE'],
    ['FAVOURITES', null],
    [null, 'Standings'],
  ];

  final List<Widget> _pages = const [
    AllGamesScreen(),
    LiveScreen(),
    FavouritesScreen(),
    CompetitionsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(builder: (context, manager, child) {
      final int index = manager.selectedTab;

      return Scaffold(
        appBar: AppBar(
          title: CustomAppBarTitle(
            title: appBarText[index][0],
            subtitle: appBarText[index][1],
          ),
          leading: IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SettingsScreen(
                    darkMode:
                        Provider.of<SettingsManager>(context, listen: false)
                            .darkMode,
                  );
                }),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('search button clicked');
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                print('calender button clicked');
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: manager.selectedTab,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (index) {
            manager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: titles[0],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.live_tv),
              label: titles[1],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star_border),
              label: titles[2],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.leaderboard),
              label: titles[3],
            ),
          ],
        ),
      );
    });
  }
}
