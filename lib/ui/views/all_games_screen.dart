import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football_news/business_logic/models/fixtures_query.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';
import 'package:football_news/business_logic/utils/constants.dart';

import 'package:football_news/ui/widgets/widgets.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/view_models.dart';

class AllGamesScreen extends StatefulWidget {
  const AllGamesScreen({Key? key}) : super(key: key);

  @override
  State<AllGamesScreen> createState() => _AllGamesScreenState();
}

class _AllGamesScreenState extends State<AllGamesScreen> {
  @override
  Widget build(BuildContext context) {
    // var dateManager = Provider.of<AppDateManager>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBarTitle(
          title: null,
          subtitle: 'dd.MM.YYYY', //dateManager.getAppDateDescription(),
        ),
        actions: const [SearchActionButton(), CalenderActionButton()],
        centerTitle: true,
        leading: const SettingsActionButton(),
      ),
      body: _buildCompetitionLoader(context),
    );
  }

  Widget _buildCompetitionLoader(context) {
    final model = Provider.of<GamesViewModel>(context, listen: true);

    return FutureBuilder<Map<String, List<FixtureDetails>>>(
      future: model.getAllGames(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print(snapshot.error);

            return const Center(
              child: Text('Error occurred'),
            );
          }

          var data = snapshot.data!;
          var keys = data.keys.toList();
          bool darkMode =
              Provider.of<SettingsViewModel>(context, listen: true).darkMode;

          return GroupedListView<String, String>(
            elements: keys,
            groupBy: (key) =>
                key == kFavouriteKey ? kFavouriteKey : kOtherCompetitionsKey,
            groupSeparatorBuilder: (String groupByValue) {
              return groupByValue == kFavouriteKey
                  ? FavouriteGroupHeader(isDarkMode: darkMode)
                  : OthersGroupHeader(
                      isDarkMode: darkMode,
                      text: groupByValue,
                    );
            },
            useStickyGroupSeparators: true,
            itemBuilder: (context, key) {
              List<FixtureDetails> fixtures = data[key]!;
              return key == kFavouriteKey
                  ? _buildFavouriteTiles(context, model.getFixturesSortGroup(fixtures))
                  : _buildGameTile(fixtures, key, context);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildFavouriteTiles(
    BuildContext context,
    Map<String, List<FixtureDetails>> fixturesSortGroup,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var entry in fixturesSortGroup.entries)
          _buildGameTile(entry.value, entry.key, context)
      ],
    );
  }

  ListTile _buildGameTile(
    List<FixtureDetails> fixtures,
    String key,
    BuildContext context,
  ) {
    return ListTile(
      title: CompetitionCard(
        imageUrl: fixtures.first.league.flag,
        text: key,
        total: fixtures.length,
      ),
      onTap: () {
        context.router.push(
          FixturesRoute(
            title: fixtures.first.league.name,
            fixtures: fixtures,
          ),
        );
      },
    );
  }
}
