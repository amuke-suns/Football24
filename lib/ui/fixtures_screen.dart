import 'package:flutter/material.dart';
import 'package:football_news/network/news_fixture_model.dart';

class FixturesScreen extends StatelessWidget {
  final String title;
  final List<APIFixtureDetails> fixtures;

  const FixturesScreen({
    Key? key,
    required this.title,
    required this.fixtures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: fixtures.length,
        itemBuilder: (BuildContext context, int index) {
          APIFixtureDetails fixture = fixtures[index];
          bool? isHomeWinner = fixture.teams.home.winner;

          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        fixture.teams.home.name,
                        style: TextStyle(
                          fontWeight: isHomeWinner != null && isHomeWinner
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                    ),
                    Text('${fixture.score.fulltime.home ?? '-'}'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        fixture.teams.away.name,
                        style: TextStyle(
                          fontWeight: isHomeWinner != null && !isHomeWinner
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                    ),
                    Text('${fixture.score.fulltime.away ?? '-'}')
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
