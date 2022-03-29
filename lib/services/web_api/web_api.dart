import '../../business_logic/models/fixtures_query.dart';
import '../../business_logic/models/league_query.dart';
import '../../business_logic/models/standings_query.dart';

// This is a contract all WebApi services must follow
abstract class WebApi {

  Future<LeagueQuery> getALlLeagues();

  Future<FixturesQuery> getAllFixtures({required String date});

  Future<StandingsQuery> getAllStandings({
    required int leagueId,
    required int year,
  });

}