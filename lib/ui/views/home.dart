import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../business_logic/routes/router.gr.dart';
import '../../business_logic/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        AllGamesRouter(),
        LiveRouter(),
        FavouriteRouter(),
        CompetitionsRouter()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: MyTabs.titles[MyTabs.allGames],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.live_tv),
              label: MyTabs.titles[MyTabs.live],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star_border),
              label: MyTabs.titles[MyTabs.favorites],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.leaderboard),
              label: MyTabs.titles[MyTabs.standings],
            ),
          ],
        );
      },
    );
  }
}
