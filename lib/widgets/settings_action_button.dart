import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/routes/router.gr.dart';
import 'package:football_news/screens/screens.dart';
import 'package:provider/provider.dart';

class SettingsActionButton extends StatelessWidget {
  const SettingsActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {

        context.router.push(const SettingsRoute());

        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SettingsScreen(
              darkMode: Provider.of<SettingsManager>(
                context,
                listen: false,
              ).darkMode,
            );
          }),
        );*/
      },
    );
  }
}
