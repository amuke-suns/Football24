import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/network/news_fixture_model.dart';
import 'package:football_news/widgets/custom_appbar_title.dart';
import 'package:football_news/widgets/header_text_container.dart';
import 'package:provider/provider.dart';

class FixturesScreen extends StatelessWidget {
  final String title;
  final List<APIFixtureDetails> fixtures;

  const FixturesScreen({
    Key? key,
    required this.title,
    required this.fixtures,
  }) : super(key: key);

  Widget _buildTeamScoreRow({
    required String teamName,
    int? score,
    bool? isWinner,
    required String teamLogo,
  }) {
    return Row(
      children: [
        Image.network(
          teamLogo,
          width: 24,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            teamName,
            style: TextStyle(
              fontWeight: isWinner != null && isWinner ? FontWeight.bold : null,
            ),
          ),
        ),
        Text(
          score?.toString() ?? '-',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode =
        Provider.of<SettingsManager>(context, listen: true).darkMode;
    var league = fixtures.first.league;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: title,
          subtitle: null,
        ),
      ),
      body: Column(
        children: [
          FavouriteHeaderTextClicker(
            isDarkMode: darkMode,
            country: league.country,
            league: league.name,
            imageUrl: league.flag,
            onTap: () {
              print('clicked');
            },
          ),
          Flexible(
            child: ListView(
              children: [
                for (var fixture in fixtures)
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTeamScoreRow(
                          teamName: fixture.teams.home.name,
                          score: fixture.score.fulltime.home,
                          isWinner: fixture.teams.home.winner,
                          teamLogo: fixture.teams.home.logo,
                        ),
                        const SizedBox(height: 5),
                        _buildTeamScoreRow(
                          teamName: fixture.teams.away.name,
                          score: fixture.score.fulltime.away,
                          isWinner: fixture.teams.away.winner,
                          teamLogo: fixture.teams.away.logo,
                        ),
                      ],
                    ),
                  ),
                ListTile(
                  leading: const Icon(Icons.format_list_numbered),
                  minLeadingWidth: 5,
                  title: const Text('Standings'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                  onTap: () {
                    print('Standings tapped');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
