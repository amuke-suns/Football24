import 'package:json_annotation/json_annotation.dart';

part 'news_standings_model.g.dart';

@JsonSerializable()
class APIStandingsQuery {
  List<String> errors;
  int results;
  List<APILeagueDetails> response;

  APIStandingsQuery({
    required this.errors,
    required this.results,
    required this.response,
  });

  factory APIStandingsQuery.fromJson(Map<String, dynamic> json) =>
      _$APIStandingsQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIStandingsQueryToJson(this);
}

@JsonSerializable()
class APILeagueDetails {
  APILeague league;

  APILeagueDetails({required this.league});

  factory APILeagueDetails.fromJson(Map<String, dynamic> json) =>
      _$APILeagueDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$APILeagueDetailsToJson(this);
}

@JsonSerializable()
class APILeague {
  int id;
  String name, country, logo, flag;
  int season;
  List<List<APITeamStanding>> standings;

  APILeague({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.season,
    required this.standings,
    required this.flag,
  });

  factory APILeague.fromJson(Map<String, dynamic> json) =>
      _$APILeagueFromJson(json);

  Map<String, dynamic> toJson() => _$APILeagueToJson(this);
}

@JsonSerializable()
class APITeamStanding {
  int rank;
  APITeam team;
  int points, goalsDiff;
  String form;
  String? description;
  APITeamStats all, home, away;

  APITeamStanding({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    required this.form,
    this.description,
    required this.all,
    required this.home,
    required this.away,
  });

  factory APITeamStanding.fromJson(Map<String, dynamic> json) =>
      _$APITeamStandingFromJson(json);

  Map<String, dynamic> toJson() => _$APITeamStandingToJson(this);
}

@JsonSerializable()
class APITeam {
  int id;
  String name, logo;

  APITeam({required this.id, required this.name, required this.logo});

  factory APITeam.fromJson(Map<String, dynamic> json) =>
      _$APITeamFromJson(json);

  Map<String, dynamic> toJson() => _$APITeamToJson(this);
}

@JsonSerializable()
class APITeamStats {
  int played, win, draw, lose;
  APITeamGoals goals;

  APITeamStats({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  factory APITeamStats.fromJson(Map<String, dynamic> json) =>
      _$APITeamStatsFromJson(json);

  Map<String, dynamic> toJson() => _$APITeamStatsToJson(this);
}

@JsonSerializable()
class APITeamGoals {
  @JsonKey(name: 'for')
  int goalsFor;
  @JsonKey(name: 'against')
  int goalsAgainst;

  APITeamGoals({
    required this.goalsFor,
    required this.goalsAgainst,
  });

  factory APITeamGoals.fromJson(Map<String, dynamic> json) =>
      _$APITeamGoalsFromJson(json);

  Map<String, dynamic> toJson() => _$APITeamGoalsToJson(this);
}
