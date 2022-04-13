import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_news/business_logic/utils/methods_utils.dart';
import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:football_news/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../business_logic/models/standings_query.dart';


class StandingsScreen extends StatefulWidget {
  final int leagueId;
  final int year;

  const StandingsScreen({
    Key? key,
    required this.leagueId,
    required this.year,
  }) : super(key: key);

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<StandingsViewModel>(context, listen: false);

    return FutureBuilder<StandingsQuery>(
      future: model.getAllStandings(id: widget.leagueId, year: widget.year),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data!.response.isEmpty) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text('Error occurred'),
              ),
            );
          }

          var league = snapshot.data!.response.first.league;

          return Scaffold(
            appBar: AppBar(
              title: CustomAppBarTitle(
                title: league.name,
                subtitle: null,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildMainBody(league),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildMainBody(League league) {
    final model = Provider.of<StandingsViewModel>(context, listen: false);
    String leagueName = league.name;

    return ListView(
      children: [
        Row(
          children: [
            SvgPicture.network(
              league.flag,
              width: 30,
            ),
            const SizedBox(width: 5),
            Text(league.country.toUpperCase())
          ],
        ),
        const Divider(),
        Row(
          children: [
            Image.network(
              league.logo,
              width: 100,
            ),
            InkWell(
              onTap: () => showYearDialog(model, leagueName),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$leagueName ${model.getYearTimeline(widget.year)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
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
        _buildStandingsTable(league.standings.first),
      ],
    );
  }

  void showYearDialog(StandingsViewModel model, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 7),
          title: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            color: Theme.of(context).primaryColor,
          ),
          titlePadding: const EdgeInsets.all(0),
          elevation: 10,
          children: [
            for (int year in model.years)
              SimpleDialogOption(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  /*manager.selectedYearIndex = i;*/
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StandingsScreen(leagueId: widget.leagueId, year: year);
                  }));
                },
                child: ListTile(
                  tileColor:
                      year == widget.year ? Colors.grey : null,
                  shape: MethodUtils.getTileShapeBorder(context),
                  title: Text(
                    model.getYearTimeline(year),
                    style: TextStyle(
                      fontWeight: year == widget.year
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildStandingsTable(List<TeamStanding> standings) {
    return DataTable(
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
        for (int i = 0; i < standings.length; i++)
          DataRow(
            onSelectChanged: (itemRow) {
              print(standings[i].description);
            },
            cells: [
              DataCell(Text(standings[i].rank.toString())),
              DataCell(
                Row(
                  children: [
                    Image.network(
                      standings[i].team.logo,
                      width: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(standings[i].team.name)
                  ],
                ),
              ),
              DataCell(Text(standings[i].all.played.toString())),
              DataCell(Text('${standings[i].all.goals.goalsFor}'
                  ':${standings[i].all.goals.goalsAgainst}')),
              DataCell(Text(standings[i].points.toString())),
            ],
          ),
      ],
    );
  }
}
