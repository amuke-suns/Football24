// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixtures_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixturesQuery _$FixturesQueryFromJson(Map<String, dynamic> json) =>
    FixturesQuery(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      results: json['results'] as int,
      response: (json['response'] as List<dynamic>)
          .map((e) => FixtureDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FixturesQueryToJson(FixturesQuery instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

FixtureDetails _$FixtureDetailsFromJson(Map<String, dynamic> json) =>
    FixtureDetails(
      fixture: Fixture.fromJson(json['fixture'] as Map<String, dynamic>),
      league: League.fromJson(json['league'] as Map<String, dynamic>),
      teams: Teams.fromJson(json['teams'] as Map<String, dynamic>),
      goals: Goals.fromJson(json['goals'] as Map<String, dynamic>),
      score: Score.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureDetailsToJson(FixtureDetails instance) =>
    <String, dynamic>{
      'fixture': instance.fixture,
      'league': instance.league,
      'teams': instance.teams,
      'goals': instance.goals,
      'score': instance.score,
    };

Fixture _$FixtureFromJson(Map<String, dynamic> json) => Fixture(
      id: json['id'] as int,
      referee: json['referee'] as String?,
      timezone: json['timezone'] as String,
      date: json['date'] as String,
      timestamp: (json['timestamp'] as num).toDouble(),
      status: FixtureStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FixtureToJson(Fixture instance) => <String, dynamic>{
      'id': instance.id,
      'referee': instance.referee,
      'timezone': instance.timezone,
      'date': instance.date,
      'timestamp': instance.timestamp,
      'status': instance.status,
    };

FixtureStatus _$FixtureStatusFromJson(Map<String, dynamic> json) =>
    FixtureStatus(
      short: json['short'] as String,
      elapsed: json['elapsed'] as int?,
    );

Map<String, dynamic> _$FixtureStatusToJson(FixtureStatus instance) =>
    <String, dynamic>{
      'short': instance.short,
      'elapsed': instance.elapsed,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      logo: json['logo'] as String,
      round: json['round'] as String,
      flag: json['flag'] as String?,
      season: json['season'] as int,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'round': instance.round,
      'flag': instance.flag,
      'season': instance.season,
    };

Teams _$TeamsFromJson(Map<String, dynamic> json) => Teams(
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      away: Team.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      winner: json['winner'] as bool?,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'winner': instance.winner,
    };

Goals _$GoalsFromJson(Map<String, dynamic> json) => Goals(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$GoalsToJson(Goals instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

Score _$ScoreFromJson(Map<String, dynamic> json) => Score(
      halftime: Goals.fromJson(json['halftime'] as Map<String, dynamic>),
      fulltime: Goals.fromJson(json['fulltime'] as Map<String, dynamic>),
      extratime: Goals.fromJson(json['extratime'] as Map<String, dynamic>),
      penalty: Goals.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'halftime': instance.halftime,
      'fulltime': instance.fulltime,
      'extratime': instance.extratime,
      'penalty': instance.penalty,
    };
