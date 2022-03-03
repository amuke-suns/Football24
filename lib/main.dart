import 'package:flutter/material.dart';
import 'package:football_news/ui/home.dart';

void main() {
  runApp(const FootballNewsApp());
}

class FootballNewsApp extends StatelessWidget {
  const FootballNewsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}