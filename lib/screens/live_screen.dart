import 'package:flutter/material.dart';
import 'package:football_news/constants/constants.dart';
import 'package:football_news/models/models.dart';
import 'package:football_news/widgets/widgets.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(
          title: null,
          subtitle: MyTabs.titles[MyTabs.live],
        ),
        leading: const SettingsActionButton(),
        actions: const [
          SearchActionButton(),
        ],
      ),
      body: const Center(
        child: Text(
          'Live updates not supported',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
