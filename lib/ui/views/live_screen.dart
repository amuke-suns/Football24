import 'package:flutter/material.dart';
import 'package:football_news/ui/widgets/widgets.dart';

import '../../business_logic/utils/constants.dart';

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
