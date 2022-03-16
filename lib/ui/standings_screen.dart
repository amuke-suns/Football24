import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_news/network/news_league_model.dart';
import 'package:football_news/network/news_service.dart';
import 'package:football_news/network/news_standings_model.dart';

class StandingsScreen extends StatefulWidget {
  final APILeagueDesc leagueDesc;

  const StandingsScreen({
    Key? key,
    required this.leagueDesc,
  }) : super(key: key);

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  List<APITeamStanding>? _standings;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    // String jsonString = await rootBundle.loadString('assets/standings1.json');
    String jsonString = await NewsService().getAllStandings(
      leagueId: widget.leagueDesc.league.id,
      year: 2021,
    );

    var standings = APIStandingsQuery.fromJson(jsonDecode(jsonString));
    setState(() {
      _standings = standings.response[0].league.standings[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    var desc = widget.leagueDesc;

    return Scaffold(
      appBar: AppBar(title: Text(desc.league.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                SvgPicture.network(
                  desc.country.flag ?? '',
                  width: 30,
                ),
                const SizedBox(width: 5),
                Text(desc.country.name.toUpperCase())
                // Image.network(widget.leagueDesc.league.logo),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Image.network(
                  desc.league.logo,
                  width: 100,
                ),
                Text(
                  '${desc.league.name} 2021/2022',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            const Text(
              'Standings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildStandingsTable(_standings),
          ],
        ),
      ),
    );
  }

  Widget _buildStandingsTable(List<APITeamStanding>? standings) {
    return _standings == null
        ? const Center(child: CircularProgressIndicator())
        : DataTable(
            showCheckboxColumn: false,
            columnSpacing: 0,
            columns: const [
              DataColumn(label: Text('#')),
              DataColumn(label: Text('TEAM')),
              DataColumn(label: Text('MP')),
              DataColumn(label: Text('G')),
              DataColumn(label: Text('PTS')),
            ],
            rows: [
              for (int i = 0; i < _standings!.length; i++)
                DataRow(
                  onSelectChanged: (itemRow) {
                    print(_standings![i].description);
                  },
                  cells: [
                    DataCell(Text(_standings![i].rank.toString())),
                    DataCell(
                      Row(
                        children: [
                          Image.network(
                            _standings![i].team.logo,
                            width: 25,
                          ),
                          const SizedBox(width: 5),
                          Text(_standings![i].team.name)
                        ],
                      ),
                    ),
                    DataCell(Text(_standings![i].all.played.toString())),
                    DataCell(Text('${_standings![i].all.goals.goalsFor}'
                        ':${_standings![i].all.goals.goalsAgainst}')),
                    DataCell(Text(_standings![i].points.toString())),
                  ],
                ),
            ],
          );
  }
}
