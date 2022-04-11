import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/settings_view_model.dart';

class SettingsScreen extends StatefulWidget {

  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        centerTitle: true,
      ),
      body: Center(
        child: buildDarkModeRow(context),
      ),
    );
  }

  Widget buildDarkModeRow(BuildContext context) {
    final model = context.watch<SettingsViewModel>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: model.darkMode,
            onChanged: model.setDarkMode,
          )
        ],
      ),
    );
  }
}
