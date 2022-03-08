import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:football_news/network/news_fixture_model.dart';
import 'package:football_news/network/news_service.dart';

import "package:collection/collection.dart";
import 'package:football_news/ui/fixtures_screen.dart';

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
    return FutureBuilder<SplayTreeMap<String, List<APIFixtureDetails>>>(
      future: getFixturesData(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              String key = data.keys.elementAt(index);
              List<APIFixtureDetails> fixtures = data[key]!;

              return ListTile(
                title: Text(key),
                trailing: Text("${fixtures.length}"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FixturesScreen(title: key, fixtures: fixtures);
                  }));
                },
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

  Future<SplayTreeMap<String, List<APIFixtureDetails>>> getFixturesData() async {
    // load the sample json string
    final jsonString = await rootBundle.loadString('assets/fixture1.json');
    // final jsonString = await NewsService().getAllFixtures();

    APIFixturesQuery decodedData = APIFixturesQuery.fromJson(jsonDecode(jsonString));

    // group by country and league name
    var groupedMap = decodedData.response.groupListsBy(
      (element) => '${element.league.country}: ${element.league.name}',
    );

    // SplayTreeMap is used to ordering the keys
    return SplayTreeMap<String, List<APIFixtureDetails>>.from(groupedMap);
  }
}
