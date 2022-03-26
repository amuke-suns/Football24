import 'package:flutter/material.dart';
import 'package:football_news/models/models.dart';
import 'package:provider/provider.dart';

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
        child: buildDarkModeRow(),
      ),
    );
  }

  Widget buildDarkModeRow() {
    var manager = Provider.of<SettingsManager>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: manager.darkMode,
            onChanged: (value) {
              manager.darkMode = value;
            },
          )
        ],
      ),
    );
  }
}
