import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football_news/constants/constants.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/network/news_fixture_model.dart';
import 'package:football_news/network/news_service.dart';

import "package:collection/collection.dart";
import 'package:football_news/ui/fixtures_screen.dart';
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
      future: getFixturesData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!;
          var keys = data.keys.toList();

          return GroupedListView<String, String>(
            elements: keys,
            groupBy: (key) =>
                key == kFavouriteKey ? kFavouriteKey : kOtherCompetitionsKey,
            groupSeparatorBuilder: (String groupByValue) {
              return groupByValue == kFavouriteKey
                  ? FavouriteGroupTextContainer(isDarkMode: darkMode)
                  : OthersGroupTextContainer(
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

  Future<Map<String, List<APIFixtureDetails>>> getFixturesData() async {
    // var date = DateTime.now();
    // load the sample json string
    final jsonString = await rootBundle.loadString('assets/fixture2.json');
    // final jsonString = await NewsService().getAllFixtures(date: '2022-03-17');

    APIFixturesQuery decodedData =
        APIFixturesQuery.fromJson(jsonDecode(jsonString));

    // group by country and league name
    var groupedMap = decodedData.response.groupListsBy(
      (element) {
        if (kFavIdList.contains(element.league.id)) {
          return kFavouriteKey;
        }
        return '${element.league.country}: ${element.league.name}';
      },
    );

    return groupedMap;
  }
}
