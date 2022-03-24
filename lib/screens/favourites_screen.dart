import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_news/data/memory_repository.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/network/news_league_model.dart';
import 'package:football_news/network/news_service.dart';
import 'package:football_news/screens/screens.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildStandingsLoader(context);
  }

  Widget _buildFavouriteCard(
    BuildContext context,
    APILeagueDesc lg,
  ) {
    return ListTile(
      title: CompetitionCard(
        imageUrl: lg.country.flag,
        text: '${lg.country.name}: ${lg.league.name}',
        total: null,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return StandingsScreen(leagueId: lg.league.id);
          }),
        );
      },
    );
  }

  Future<List<APILeagueDesc>> getCompetitionsData(
    BuildContext context,
  ) async {
    List<String> favIdList =
        Provider.of<MemoryRepository>(context, listen: true).favouriteIds;

    // load the sample json string
    // final jsonString = await rootBundle.loadString('assets/league1.json');
    final jsonString = await NewsService().getAllCompetitions();

    APILeagueQuery decodedData =
        APILeagueQuery.fromJson(jsonDecode(jsonString));

    var toReturn = decodedData.response
        .where((element) => favIdList.contains(element.league.id.toString()))
        .toList()
      ..sort((val1, val2) {
        return val1.country.name.compareTo(val2.country.name);
      });

    return toReturn;
  }

  Widget _buildStandingsLoader(context) {
    bool darkMode =
        Provider.of<SettingsManager>(context, listen: true).darkMode;

    return FutureBuilder<List<APILeagueDesc>>(
      future: getCompetitionsData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          }

          var data = snapshot.data!;

          return ListView(
            children: [
              FavouriteGroupHeader(isDarkMode: darkMode),
              for (var i in data) _buildFavouriteCard(context, i),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
