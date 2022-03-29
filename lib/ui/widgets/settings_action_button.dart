import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:football_news/business_logic/routes/router.gr.dart';

class SettingsActionButton extends StatelessWidget {
  const SettingsActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {

        context.router.push(const SettingsRoute());
      },
    );
  }
}
