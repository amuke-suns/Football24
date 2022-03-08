// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_standings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIStandingsQuery _$APIStandingsQueryFromJson(Map<String, dynamic> json) {
  return APIStandingsQuery(
    errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    results: json['results'] as int,
    response: (json['response'] as List<dynamic>)
        .map((e) => APILeagueDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$APIStandingsQueryToJson(APIStandingsQuery instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

APILeagueDetails _$APILeagueDetailsFromJson(Map<String, dynamic> json) {
  return APILeagueDetails(
    league: APILeague.fromJson(json['league'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APILeagueDetailsToJson(APILeagueDetails instance) =>
    <String, dynamic>{
      'league': instance.league,
    };

APILeague _$APILeagueFromJson(Map<String, dynamic> json) {
  return APILeague(
    id: json['id'] as int,
    name: json['name'] as String,
    country: json['country'] as String,
    logo: json['logo'] as String,
    season: json['season'] as int,
    standings: (json['standings'] as List<dynamic>)
        .map((e) => (e as List<dynamic>)
            .map((e) => APITeamStanding.fromJson(e as Map<String, dynamic>))
            .toList())
        .toList(),
  );
}

Map<String, dynamic> _$APILeagueToJson(APILeague instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'logo': instance.logo,
      'season': instance.season,
      'standings': instance.standings,
    };

APITeamStanding _$APITeamStandingFromJson(Map<String, dynamic> json) {
  return APITeamStanding(
    rank: json['rank'] as int,
    team: APITeam.fromJson(json['team'] as Map<String, dynamic>),
    points: json['points'] as int,
    goalsDiff: json['goalsDiff'] as int,
    form: json['form'] as String,
    description: json['description'] as String?,
    all: APITeamStats.fromJson(json['all'] as Map<String, dynamic>),
    home: APITeamStats.fromJson(json['home'] as Map<String, dynamic>),
    away: APITeamStats.fromJson(json['away'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APITeamStandingToJson(APITeamStanding instance) =>
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

APITeam _$APITeamFromJson(Map<String, dynamic> json) {
  return APITeam(
    id: json['id'] as int,
    name: json['name'] as String,
    logo: json['logo'] as String,
  );
}

Map<String, dynamic> _$APITeamToJson(APITeam instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

APITeamStats _$APITeamStatsFromJson(Map<String, dynamic> json) {
  return APITeamStats(
    played: json['played'] as int,
    win: json['win'] as int,
    draw: json['draw'] as int,
    lose: json['lose'] as int,
    goals: APITeamGoals.fromJson(json['goals'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APITeamStatsToJson(APITeamStats instance) =>
    <String, dynamic>{
      'played': instance.played,
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'goals': instance.goals,
    };

APITeamGoals _$APITeamGoalsFromJson(Map<String, dynamic> json) {
  return APITeamGoals(
    goalsFor: json['for'] as int,
    goalsAgainst: json['against'] as int,
  );
}

Map<String, dynamic> _$APITeamGoalsToJson(APITeamGoals instance) =>
    <String, dynamic>{
      'for': instance.goalsFor,
      'against': instance.goalsAgainst,
    };
