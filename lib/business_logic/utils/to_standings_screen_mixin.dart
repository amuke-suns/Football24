import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:football_news/business_logic/models/league_query.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';
import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:provider/provider.dart';

mixin ToStandingsMixin {
  void goToStandingsWithId(BuildContext context, int id) {
    final List<int> years = Provider.of<GamesViewModel>(context, listen: false)
        .getSeasonYears(leagueId: id);

    final model = Provider.of<StandingsViewModel>(context, listen: false);
    model.setYears(years);

    context.router.push(StandingsRoute(
      leagueId: id,
      year: model.selectedYear,
    ));
  }

  void goToStandingsWithDesc(BuildContext context, LeagueDesc desc) {
    final standingsViewModel = Provider.of<StandingsViewModel>(context, listen: false);
    standingsViewModel.setYears(desc.getSeasonYears());

    context.router.push(StandingsRoute(
      leagueId: desc.league.id,
      year: standingsViewModel.selectedYear,
    ));
  }
}
