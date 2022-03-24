import 'package:flutter/material.dart';
import 'package:football_news/network/news_league_model.dart';
import 'package:football_news/network/news_service.dart';
import 'package:football_news/screens/screens.dart';

class LeaguesScreen extends StatelessWidget {
  final String title;
  final List<APILeagueDesc> leagues;

  const LeaguesScreen({
    Key? key,
    required this.title,
    required this.leagues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: leagues.length,
        itemBuilder: (BuildContext context, int index) {
          var league = leagues[index].league;

          return ListTile(
            title: Text(league.name),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StandingsScreen(leagueId: league.id);
              }));
            },
          );
        },
      ),
    );
  }
}
