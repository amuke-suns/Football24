import 'package:flutter/foundation.dart';
import 'package:football_news/business_logic/models/standings_query.dart';
import 'package:football_news/services/service_locator.dart';
import 'package:football_news/services/web_api/web_api.dart';

class StandingsViewModel extends ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();

  List<int> _years = [];

  List<int> get years => List.unmodifiable(_years);

  int _selectedYear = -1;

  int get selectedYear => _selectedYear;

  String getYearTimeline(int year) {
    return '$year/${year + 1}';
  }

  void setYears(List<int> years) {
    _years = years;
    _selectedYear = _years.last;
  }

  Future<StandingsQuery> getAllStandings({
    required int id,
    required int year,
  }) async {
    return await _webService.getAllStandings(
      leagueId: id,
      year: year,
    );
  }
}
