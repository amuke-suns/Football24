import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football_news/constants/constants.dart';
import 'package:football_news/data/memory_repository.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/network/news_fixture_model.dart';
import 'package:football_news/network/news_service.dart';

import "package:collection/collection.dart";
import 'package:football_news/screens/screens.dart';
import 'package:football_news/widgets/widgets.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class AllGamesScreen extends StatefulWidget {
  const AllGamesScreen({Key? key}) : super(key: key);

  @override
  State<AllGamesScreen> createState() => _AllGamesScreenState();
}

class _AllGamesScreenState extends State<AllGamesScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildCompetitionLoader(context);
  }

  Widget _buildCompetitionLoader(context) {
    bool darkMode =
        Provider.of<SettingsManager>(context, listen: true).darkMode;

    return FutureBuilder<Map<String, List<APIFixtureDetails>>>(
      future: getFixturesData(context),
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
              List<APIFixtureDetails> fixtures = data[key]!;
              return key == kFavouriteKey
                  ? _buildFavouriteTiles(context, fixtures)
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
    List<APIFixtureDetails> fixtures,
  ) {
    // sort fixtures
    fixtures.sort((a, b) => a.league.country.compareTo(b.league.country));

    // group fixtures by competition
    var groupedMap = fixtures.groupListsBy(
      (element) => '${element.league.country}: ${element.league.name}',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var entry in groupedMap.entries)
          _buildGameTile(entry.value, entry.key, context)
      ],
    );
  }

  ListTile _buildGameTile(
      List<APIFixtureDetails> fixtures, String key, BuildContext context) {
    return ListTile(
      title: CompetitionCard(
        imageUrl: fixtures.first.league.flag,
        text: key,
        total: fixtures.length,
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FixturesScreen(
            title: fixtures.first.league.name,
            fixtures: fixtures,
          );
        }));
      },
    );
  }

  Future<Map<String, List<APIFixtureDetails>>> getFixturesData(
      BuildContext context) async {
    String selectedDate = Provider.of<AppDateManager>(context, listen: true)
        .getSelectedDateApiFormat();

    List<String> favIdList =
        Provider.of<MemoryRepository>(context, listen: true).favouriteIds;

    // load the sample json string
    final jsonString = await rootBundle.loadString('assets/fixture2.json');
    // final jsonString = await NewsService().getAllFixtures(date: selectedDate);

    APIFixturesQuery decodedData =
        APIFixturesQuery.fromJson(jsonDecode(jsonString));

    // group by country and league name
    var groupedMap = decodedData.response.groupListsBy(
      (element) {
        if (favIdList.contains(element.league.id.toString())) {
          return kFavouriteKey;
        }
        return '${element.league.country}: ${element.league.name}';
      },
    );

    return groupedMap;
  }
}
