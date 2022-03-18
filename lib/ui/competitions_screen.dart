import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football_news/constants/constants.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/network/news_league_model.dart';
import 'package:football_news/network/news_service.dart';

import "package:collection/collection.dart";
import 'package:football_news/ui/leagues_screen.dart';
import 'package:football_news/ui/standings_screen.dart';
import 'package:football_news/widgets/widgets.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class CompetitionsScreen extends StatefulWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionsScreen> createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildStandingsLoader(context);
  }

  Widget _buildStandingsLoader(context) {
    bool darkMode =
        Provider.of<SettingsManager>(context, listen: true).darkMode;

    return FutureBuilder<Map<String, List<APILeagueDesc>>>(
      future: getCompetitionsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // print(snapshot.error);
            return const Center(
              child: Text('Error occurred'),
            );
          }

          var data = snapshot.data!;
          var keys = data.keys.toList();

          return GroupedListView<String, String>(
            elements: keys,
            groupBy: (key) => key == kFavouriteKey ? key : key[0],
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
              List<APILeagueDesc> leagues = data[key]!;

              return key == kFavouriteKey
                  ? _buildFavouriteList(context, leagues)
                  : _buildCompetitionCard(leagues, key, context);
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

  Widget _buildFavouriteList(
      BuildContext context, List<APILeagueDesc> leaguesDesc) {
    leaguesDesc.sort((a, b) => a.country.name.compareTo(b.country.name));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var desc in leaguesDesc)
          ListTile(
            title: CompetitionCard(
              imageUrl: desc.country.flag,
              text: '${desc.country.name}: ${desc.league.name}',
              total: null,
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StandingsScreen(leagueDesc: desc);
              }));
            },
          )
      ],
    );
  }

  Widget _buildCompetitionCard(
      List<APILeagueDesc> leagues, String key, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: CompetitionCard(
            imageUrl: leagues.first.country.flag,
            text: key,
            total: null,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return LeaguesScreen(
                  title: key,
                  leagues: leagues,
                );
              }),
            );
          },
        ),
      ],
    );
  }

  Future<Map<String, List<APILeagueDesc>>> getCompetitionsData() async {
    // load the sample json string
    final jsonString = await rootBundle.loadString('assets/league1.json');
    // final jsonString = await NewsService().getAllCompetitions();

    APILeagueQuery decodedData =
        APILeagueQuery.fromJson(jsonDecode(jsonString));

    // group by country name
    Map<String, List<APILeagueDesc>> groupedMap =
        decodedData.response.groupListsBy((element) {
      if (kFavIdList.contains(element.league.id)) {
        return kFavouriteKey;
      }
      return element.country.name;
    });

    return groupedMap;
  }
}
