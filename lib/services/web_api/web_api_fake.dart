import 'dart:convert';

import 'package:football_news/business_logic/models/fixtures_query.dart';
import 'package:football_news/business_logic/models/league_query.dart';
import 'package:football_news/business_logic/models/standings_query.dart';
import 'package:football_news/services/web_api/web_api.dart';
import 'package:flutter/services.dart' show rootBundle;

class WebApiFake implements WebApi {
  @override
  Future<LeagueQuery> getALlLeagues() async {
    final jsonString = await rootBundle.loadString('assets/league1.json');
    LeagueQuery decodedData = LeagueQuery.fromJson(jsonDecode(jsonString));
    return decodedData;
  }

  @override
  Future<FixturesQuery> getAllFixtures({required String date}) async {
    final jsonString = await rootBundle.loadString('assets/fixture2.json');
    FixturesQuery decodedData = FixturesQuery.fromJson(jsonDecode(jsonString));
    return decodedData;
  }

  @override
  Future<StandingsQuery> getAllStandings({required int leagueId, required int year}) async {
    final jsonString = await rootBundle.loadString('assets/standings1.json');
    StandingsQuery decodedData = StandingsQuery.fromJson(jsonDecode(jsonString));
    return decodedData;
  }

}