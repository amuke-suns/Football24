// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_fixture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIFixturesQuery _$APIFixturesQueryFromJson(Map<String, dynamic> json) {
  return APIFixturesQuery(
    errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    results: json['results'] as int,
    response: (json['response'] as List<dynamic>)
        .map((e) => APIFixtureDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$APIFixturesQueryToJson(APIFixturesQuery instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

APIFixtureDetails _$APIFixtureDetailsFromJson(Map<String, dynamic> json) {
  return APIFixtureDetails(
    fixture: APIFixture.fromJson(json['fixture'] as Map<String, dynamic>),
    league: APILeague.fromJson(json['league'] as Map<String, dynamic>),
    teams: APITeams.fromJson(json['teams'] as Map<String, dynamic>),
    goals: APIGoals.fromJson(json['goals'] as Map<String, dynamic>),
    score: APIScore.fromJson(json['score'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APIFixtureDetailsToJson(APIFixtureDetails instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'score': instance.score,
    };

APIFixture _$APIFixtureFromJson(Map<String, dynamic> json) {
  return APIFixture(
    id: json['id'] as int,
    referee: json['referee'] as String?,
    timezone: json['timezone'] as String,
    date: json['date'] as String,
    timestamp: (json['timestamp'] as num).toDouble(),
  );
}

Map<String, dynamic> _$APIFixtureToJson(APIFixture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referee': instance.referee,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
    };

APILeague _$APILeagueFromJson(Map<String, dynamic> json) {
  return APILeague(
    id: json['id'] as int,
    name: json['name'] as String,
    country: json['country'] as String,
    logo: json['logo'] as String,
    round: json['round'] as String,
    flag: json['flag'] as String?,
    season: json['season'] as int,
  );
}

Map<String, dynamic> _$APILeagueToJson(APILeague instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'round': instance.round,
      'flag': instance.flag,
      'season': instance.season,
    };

APITeams _$APITeamsFromJson(Map<String, dynamic> json) {
  return APITeams(
    home: APITeam.fromJson(json['home'] as Map<String, dynamic>),
    away: APITeam.fromJson(json['away'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APITeamsToJson(APITeams instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

APITeam _$APITeamFromJson(Map<String, dynamic> json) {
  return APITeam(
    id: json['id'] as int,
    name: json['name'] as String,
    logo: json['logo'] as String,
    winner: json['winner'] as bool?,
  );
}

Map<String, dynamic> _$APITeamToJson(APITeam instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'winner': instance.winner,
    };

APIGoals _$APIGoalsFromJson(Map<String, dynamic> json) {
  return APIGoals(
    home: json['home'] as int?,
    away: json['away'] as int?,
  );
}

Map<String, dynamic> _$APIGoalsToJson(APIGoals instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

APIScore _$APIScoreFromJson(Map<String, dynamic> json) {
  return APIScore(
    halftime: APIGoals.fromJson(json['halftime'] as Map<String, dynamic>),
    fulltime: APIGoals.fromJson(json['fulltime'] as Map<String, dynamic>),
    extratime: APIGoals.fromJson(json['extratime'] as Map<String, dynamic>),
    penalty: APIGoals.fromJson(json['penalty'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APIScoreToJson(APIScore instance) => <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };
