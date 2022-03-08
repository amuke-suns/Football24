import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football_news/network/news_fixture_model.dart';
import 'package:football_news/network/news_league_model.dart';
import 'package:football_news/network/news_service.dart';

import "package:collection/collection.dart";
import 'package:football_news/ui/fixtures_screen.dart';
import 'package:football_news/ui/leagues_screen.dart';

class AvailableCountriesScreen extends StatefulWidget {
  const AvailableCountriesScreen({Key? key}) : super(key: key);

  @override
  State<AvailableCountriesScreen> createState() => _AvailableCountriesScreenState();
}

class _AvailableCountriesScreenState extends State<AvailableCountriesScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildStandingsLoader(context);
  }

  Widget _buildStandingsLoader(context) {
    return FutureBuilder<SplayTreeMap<String, List<APILeagueDesc>>>(
      future: getStandingsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {

              String key = data.keys.elementAt(index);
              List<APILeagueDesc> leagues = data[key]!;

              var leagueByCountry =
                  leagues.groupListsBy((element) => element.country.name);

              var sortByCountryName = SplayTreeMap<String, List<APILeagueDesc>>
                  .from(leagueByCountry);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: double.infinity,
                    color: Colors.grey[400],
                    child: Text(key.toUpperCase()),
                  ),
                  for (var i in sortByCountryName.entries)
                    ListTile(
                      title: Text(i.key),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LeaguesScreen(title: i.key, leagues: i.value);
                        }));
                      },
                    ),
                ],
              );
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

  Future<SplayTreeMap<String, List<APILeagueDesc>>>
      getStandingsData() async {
    // load the sample json string
    final jsonString = await rootBundle.loadString('assets/league1.json');
    // final jsonString = await NewsService().getAllLeagues();

    APILeagueQuery decodedData =
        APILeagueQuery.fromJson(jsonDecode(jsonString));

    // group by first character of country name
    Map<String, List<APILeagueDesc>> groupedMap =
        decodedData.response.groupListsBy(
      (element) => element.country.name[0],
    );

    // SplayTreeMap is used to ordering the keys
    return SplayTreeMap<String, List<APILeagueDesc>>.from(groupedMap);
  }
}
