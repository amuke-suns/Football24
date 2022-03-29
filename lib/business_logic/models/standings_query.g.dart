// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingsQuery _$StandingsQueryFromJson(Map<String, dynamic> json) =>
    StandingsQuery(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      results: json['results'] as int,
      response: (json['response'] as List<dynamic>)
          .map((e) => LeagueDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StandingsQueryToJson(StandingsQuery instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

LeagueDetails _$LeagueDetailsFromJson(Map<String, dynamic> json) =>
    LeagueDetails(
      league: League.fromJson(json['league'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeagueDetailsToJson(LeagueDetails instance) =>
    <String, dynamic>{
      'league': instance.league,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] as String,
      logo: json['logo'] as String,
      season: json['season'] as int,
      standings: (json['standings'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => TeamStanding.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'flag': instance.flag,
      'season': instance.season,
      'standings': instance.standings,
    };

TeamStanding _$TeamStandingFromJson(Map<String, dynamic> json) => TeamStanding(
      rank: json['rank'] as int,
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      points: json['points'] as int,
      goalsDiff: json['goalsDiff'] as int,
      form: json['form'] as String,
      description: json['description'] as String?,
      all: TeamStats.fromJson(json['all'] as Map<String, dynamic>),
      home: TeamStats.fromJson(json['home'] as Map<String, dynamic>),
      away: TeamStats.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamStandingToJson(TeamStanding instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'team': instance.team,
      'points': instance.points,
      'goalsDiff': instance.goalsDiff,
      'form': instance.form,
      'description': instance.description,
      'all': instance.all,
      'home': instance.home,
      'away': instance.away,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

TeamStats _$TeamStatsFromJson(Map<String, dynamic> json) => TeamStats(
      played: json['played'] as int,
      win: json['win'] as int,
      draw: json['draw'] as int,
      lose: json['lose'] as int,
      goals: TeamGoals.fromJson(json['goals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamStatsToJson(TeamStats instance) => <String, dynamic>{
      'played': instance.played,
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'goals': instance.goals,
    };

TeamGoals _$TeamGoalsFromJson(Map<String, dynamic> json) => TeamGoals(
      goalsFor: json['for'] as int,
      goalsAgainst: json['against'] as int,
    );

Map<String, dynamic> _$TeamGoalsToJson(TeamGoals instance) => <String, dynamic>{
      'for': instance.goalsFor,
      'against': instance.goalsAgainst,
    };
