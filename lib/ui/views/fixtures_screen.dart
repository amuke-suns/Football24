import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football_news/ui/widgets/custom_appbar_title.dart';
import 'package:football_news/ui/widgets/headers.dart';
import 'package:provider/provider.dart';

import '../../business_logic/models/fixtures_query.dart';
import '../../business_logic/routes/router.gr.dart';
import '../../business_logic/view_models/memory_repository.dart';
import '../../business_logic/view_models/settings_view_model.dart';

class FixturesScreen extends StatelessWidget {
  final String title;
  final List<FixtureDetails> fixtures;

  const FixturesScreen({
    Key? key,
    required this.title,
    required this.fixtures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkMode =
        Provider.of<SettingsViewModel>(context, listen: false).darkMode;

    var favIdList =
        Provider.of<MemoryRepository>(context, listen: true).favouriteIds;

    var league = fixtures.first.league;
    int leagueId = league.id;
    bool isFavourite = favIdList.contains(league.id.toString());

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: title,
          subtitle: null,
        ),
      ),
      body: Column(
        children: [
          isFavourite
              ? FavouriteFixturesHeader(
                  isDarkMode: darkMode,
                  country: league.country,
                  league: league.name,
                  imageUrl: league.flag,
                  onTap: () => goToStandings(context, leagueId),
                )
              : OthersFixturesHeader(
                  isDarkMode: darkMode,
                  country: league.country,
                  league: league.name,
                  imageUrl: league.flag,
                  onTap: () => goToStandings(context, leagueId),
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
                _buildStandingsTile(context, leagueId: leagueId),
                _buildFavouriteStarTile(
                  context,
                  isFavourite: isFavourite,
                  leagueId: leagueId,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

  ListTile _buildFavouriteStarTile(
    BuildContext context, {
    required bool isFavourite,
    required int leagueId,
  }) {
    return ListTile(
      leading: isFavourite
          ? const Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : const Icon(Icons.star_border),
      minLeadingWidth: 5,
      title: Text(
        isFavourite
            ? 'Remove from favourite competitions'
            : 'Add to favourite competitions',
      ),
      onTap: () {
        /*var manager = Provider.of<MemoryRepository>(context, listen: false);
        if (isFavourite) {
          manager.deleteId(leagueId);
        } else {
          manager.insertId(leagueId);
        }*/
      },
    );
  }

  ListTile _buildStandingsTile(
    BuildContext context, {
    required int leagueId,
  }) {
    return ListTile(
      leading: const Icon(Icons.format_list_numbered),
      minLeadingWidth: 5,
      title: const Text('Standings'),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: () => goToStandings(context, leagueId),
    );
  }

  void goToStandings(BuildContext context, leagueId) {
    context.router.push(StandingsRoute(leagueId: leagueId));
  }
}
