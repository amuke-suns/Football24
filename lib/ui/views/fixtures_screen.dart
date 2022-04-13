import 'package:flutter/material.dart';
import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/business_logic/utils/utils.dart';
import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:football_news/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../business_logic/models/fixtures_query.dart';

class FixturesScreen extends StatelessWidget with ToStandingsMixin {
  final String title;
  final List<FixtureDetails> fixtures;

  const FixturesScreen({
    Key? key,
    required this.title,
    required this.fixtures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GamesViewModel>(context, listen: true);
    bool darkMode =
        Provider.of<SettingsViewModel>(context, listen: false).darkMode;

    var league = fixtures.first.league;
    int leagueId = league.id;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: title,
          subtitle: null,
        ),
      ),
      body: Column(
        children: [
          model.isFavourite(leagueId)
              ? FavouriteFixturesHeader(
                  isDarkMode: darkMode,
                  country: league.country,
                  league: league.name,
                  imageUrl: league.flag,
                  onTap: () => goToStandingsWithId(context, leagueId),
                )
              : OthersFixturesHeader(
                  isDarkMode: darkMode,
                  country: league.country,
                  league: league.name,
                  imageUrl: league.flag,
                  onTap: () => goToStandingsWithId(context, leagueId),
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
                    shape: MethodUtils.getTileShapeBorder(context),
                  ),
                _buildStandingsTile(context, leagueId: leagueId),
                Consumer<GamesViewModel>(builder: (context, model, child) {
                  return _buildFavouriteStarTile(
                    context,
                    favourite: Favourite(
                      id: leagueId,
                      country: league.country,
                      league: league.name,
                      flag: league.flag,
                    ),
                    isFavourite: model.isFavourite(leagueId),
                  );
                }),
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
    required Favourite favourite,
    required bool isFavourite,
  }) {
    final model = context.watch<GamesViewModel>();

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
        if (isFavourite) {
          model.removeFavourites(favourite.id);
        } else {
          model.saveToFavourites(favourite);
        }
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
      onTap: () => goToStandingsWithId(context, leagueId),
    );
  }
}
