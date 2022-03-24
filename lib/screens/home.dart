import 'package:flutter/material.dart';
import 'package:football_news/constants/constants.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/screens/screens.dart';
import 'package:football_news/widgets/custom_appbar_title.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _pages = const [
    AllGamesScreen(),
    LiveScreen(),
    FavouritesScreen(),
    CompetitionsScreen()
  ];

  Widget _buildSearchActionButton() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        const snackBar = SnackBar(
          content: Text('Searching not supported yet'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }

  Widget _buildCalenderActionButton(AppDateManager dateManager) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () {
        showDateDialog(context, dateManager);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /*return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        var selectedTabIndex = tabsRouter.activeIndex;

        return AppBar(
          title: CustomAppBarTitle(
            title: appManager.getAppTitle(selectedTabIndex),
            subtitle: dateManager.getAppDateDescription(
              selectedTab: selectedTabIndex,
            ),
          ),
          actions: [
            if (selectedTabIndex == FootballNewsTab.allGames) ...[
              _buildSearchActionButton(),
              _buildCalenderActionButton(dateManager),
            ] else if (selectedTabIndex == FootballNewsTab.live) ...[
              _buildSearchActionButton(),
            ] else if (selectedTabIndex == FootballNewsTab.favorites)
              ...[]
            else if (selectedTabIndex == FootballNewsTab.standings) ...[
                _buildSearchActionButton(),
              ]
          ],
          centerTitle: true,
          // AutoBackButton is package provided for easy nested route popping
          leading: tabsRouter.canNavigateBack
              ? const AutoBackButton()
              : IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SettingsScreen(
                    darkMode: Provider.of<SettingsManager>(
                      context,
                      listen: false,
                    ).darkMode,
                  );
                }),
              );
            },
          ),
        );
      },
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
              label: FootballNewsTab.tabTitles[FootballNewsTab.allGames],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.live_tv),
              label: FootballNewsTab.tabTitles[FootballNewsTab.live],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star_border),
              label: FootballNewsTab.tabTitles[FootballNewsTab.favorites],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.leaderboard),
              label: FootballNewsTab.tabTitles[FootballNewsTab.standings],
            ),
          ],
        );
      },
    );*/

    // return Consumer<AppStateManager>(builder: (context, manager, child) {
    var appManager = Provider.of<AppStateManager>(context, listen: true);
    var dateManager = Provider.of<AppDateManager>(context, listen: true);
    var selectedTabIndex = appManager.selectedTab;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: appManager.getAppTitle(),
          subtitle: dateManager.getAppDateDescription(
            selectedTab: selectedTabIndex,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SettingsScreen(
                  darkMode: Provider.of<SettingsManager>(context, listen: false)
                      .darkMode,
                );
              }),
            );
          },
        ),
        actions: [
          if (selectedTabIndex == FootballNewsTab.allGames) ...[
            _buildSearchActionButton(),
            _buildCalenderActionButton(dateManager),
          ] else if (selectedTabIndex == FootballNewsTab.live) ...[
            _buildSearchActionButton(),
          ] else if (selectedTabIndex == FootballNewsTab.favorites)
            ...[]
          else if (selectedTabIndex == FootballNewsTab.standings) ...[
            _buildSearchActionButton(),
          ]
        ],
      ),
      body: IndexedStack(
        index: appManager.selectedTab,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: appManager.selectedTab,
        onTap: (index) {
          appManager.goToTab(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: FootballNewsTab.tabTitles[FootballNewsTab.allGames],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.live_tv),
            label: FootballNewsTab.tabTitles[FootballNewsTab.live],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_border),
            label: FootballNewsTab.tabTitles[FootballNewsTab.favorites],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.leaderboard),
            label: FootballNewsTab.tabTitles[FootballNewsTab.standings],
          ),
        ],
      ),
    );
    // });
  }

  void showDateDialog(BuildContext context, AppDateManager manager) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 7),
          title: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CALENDAR',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            color: Theme.of(context).primaryColor,
          ),
          titlePadding: const EdgeInsets.all(0),
          elevation: 10,
          children: [
            for (int i = 0; i < manager.days.length; i++)
              SimpleDialogOption(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  manager.selectedDayIndex = i;
                  Navigator.pop(context);
                },
                child: ListTile(
                  tileColor: i == manager.selectedDayIndex ? Colors.grey : null,
                  shape: kListTileBorder,
                  title: Text(
                    manager.days[i].simpleFormat(),
                    style: TextStyle(
                      fontWeight: i == manager.selectedDayIndex
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
