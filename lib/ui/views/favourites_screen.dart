import 'package:flutter/material.dart';
import 'package:football_news/business_logic/models/favourite.dart';
import 'package:football_news/business_logic/utils/utils.dart';
import 'package:football_news/business_logic/view_models/view_models.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> with ToStandingsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: MyTabs.titles[MyTabs.favorites],
          subtitle: null,
        ),
        leading: const SettingsActionButton(),
      ),
      body: _buildStandingsLoader(context),
    );
  }

  Widget _buildFavouriteCard(
    BuildContext context,
    Favourite favourite,
  ) {
    return ListTile(
      title: CompetitionCard(
        imageUrl: favourite.flag,
        text: '${favourite.country}: ${favourite.league}',
        total: null,
      ),
      onTap: () {
        goToStandingsWithId(context, favourite.id);
      },
    );
  }

  Widget _buildStandingsLoader(context) {
    final model = Provider.of<GamesViewModel>(context, listen: true);
    /*bool darkMode =
        Provider.of<SettingsManager>(context, listen: true).darkMode;*/

    return FutureBuilder<List<Favourite>>(
      future: Future.value(model.favourites),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          }

          var favourites = snapshot.data!;

          return ListView(
            children: [
              //FavouriteGroupHeader(isDarkMode: darkMode),
              for (var favourite in favourites)
                _buildFavouriteCard(context, favourite),
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
