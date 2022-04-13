import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football_news/business_logic/models/league_query.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';
import 'package:football_news/business_logic/utils/utils.dart';

import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:football_news/ui/widgets/widgets.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class CompetitionsScreen extends StatefulWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionsScreen> createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen> with ToStandingsMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: null,
          subtitle: MyTabs.titles[MyTabs.standings],
        ),
        leading: const SettingsActionButton(),
        actions: const [SearchActionButton()],
      ),
      body: _buildStandingsLoader(context),
    );
  }

  Widget _buildStandingsLoader(context) {
    final model = Provider.of<GamesViewModel>(context, listen: true);

    return FutureBuilder<Map<String, List<LeagueDesc>>>(
      future: model.getCompetitionData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          }

          var data = snapshot.data!;
          var keys = data.keys.toList();
          bool darkMode =
              Provider.of<SettingsViewModel>(context, listen: false).darkMode;

          return GroupedListView<String, String>(
            elements: keys,
            groupBy: (key) => key == kFavouriteKey ? key : key[0],
            groupSeparatorBuilder: (String groupByValue) {
              return groupByValue == kFavouriteKey
                  ? FavouriteGroupHeader(isDarkMode: darkMode)
                  : OthersGroupHeader(
                      isDarkMode: darkMode,
                      text: groupByValue,
                    );
            },
            useStickyGroupSeparators: true,
            itemBuilder: (context, key) {
              List<LeagueDesc> leagues = data[key]!;

              return key == kFavouriteKey
                  ? _buildFavouriteList(context, model.sortLeagueDescs(leagues))
                  : _buildCompetitionCard(leagues, key, context);
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

  Widget _buildFavouriteList(
      BuildContext context, List<LeagueDesc> leaguesDesc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var desc in leaguesDesc)
          ListTile(
            title: CompetitionCard(
              imageUrl: desc.country.flag,
              text: '${desc.country.name}: ${desc.league.name}',
              total: null,
            ),
            onTap: () async {
              goToStandingsWithDesc(context, desc);
            },
          )
      ],
    );
  }

  Widget _buildCompetitionCard(
    List<LeagueDesc> leagues,
    String key,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: CompetitionCard(
            imageUrl: leagues.first.country.flag,
            text: key,
            total: null,
          ),
          onTap: () {
            context.router.push(LeaguesRoute(title: key, leagues: leagues));
          },
        ),
      ],
    );
  }
}
