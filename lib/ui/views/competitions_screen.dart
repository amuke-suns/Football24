import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football_news/business_logic/models/league_query.dart';

import "package:collection/collection.dart";
import 'package:football_news/business_logic/view_models/games_view_model.dart';
import 'package:football_news/ui/views/screens.dart';
import 'package:football_news/ui/widgets/widgets.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../business_logic/utils/constants.dart';
import '../../business_logic/view_models/settings_view_model.dart';

class CompetitionsScreen extends StatefulWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionsScreen> createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: null,
          subtitle: MyTabs.titles[MyTabs.standings],
        ),
        leading: const SettingsActionButton(),
        actions: const [
          SearchActionButton()
        ],
      ),
      body: _buildStandingsLoader(context),
    );
  }

  Widget _buildStandingsLoader(context) {
    return FutureBuilder<Map<String, List<LeagueDesc>>>(
      future: getCompetitionsData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          }

          var data = snapshot.data!;
          var keys = data.keys.toList();
          bool darkMode =
              Provider.of<SettingsViewModel>(context, listen: false).darkMode;

          return GroupedListView<String, String>(
            elements: keys,
            groupBy: (key) => key == kFavouriteKey ? key : key[0],
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
              List<LeagueDesc> leagues = data[key]!;

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
      BuildContext context, List<LeagueDesc> leaguesDesc) {
    // sort the items
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
                return StandingsScreen(leagueId: desc.league.id);
              }));
            },
          )
      ],
    );
  }

  Widget _buildCompetitionCard(
    List<LeagueDesc> leagues,
    String key,
    BuildContext context,
  ) {
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

  Future<Map<String, List<LeagueDesc>>> getCompetitionsData(
    BuildContext context,
  ) async {
    final favIdList = Provider.of<GamesViewModel>(context, listen: false).favIds;

    // load the sample json string
    final jsonString = await rootBundle.loadString('assets/league1.json');
    // final jsonString = await NewsService().getAllCompetitions();

    LeagueQuery decodedData =
        LeagueQuery.fromJson(jsonDecode(jsonString));

    // group by country name
    Map<String, List<LeagueDesc>> groupedMap =
        decodedData.response.groupListsBy((element) {
      if (favIdList.contains(element.league.id)) {
        return kFavouriteKey;
      }
      return element.country.name;
    });

    return groupedMap;
  }
}
