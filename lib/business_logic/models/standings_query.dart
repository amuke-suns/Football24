import 'package:json_annotation/json_annotation.dart';

part 'standings_query.g.dart';

@JsonSerializable()
class StandingsQuery {
  List<String> errors;
  int results;
  List<LeagueDetails> response;

  StandingsQuery({
    required this.errors,
    required this.results,
    required this.response,
  });

  factory StandingsQuery.fromJson(Map<String, dynamic> json) =>
      _$StandingsQueryFromJson(json);

  Map<String, dynamic> toJson() => _$StandingsQueryToJson(this);
}

@JsonSerializable()
class LeagueDetails {
  League league;

  LeagueDetails({required this.league});

  factory LeagueDetails.fromJson(Map<String, dynamic> json) =>
      _$LeagueDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueDetailsToJson(this);
}

@JsonSerializable()
class League {
  int id;
  String name, country, logo, flag;
  int season;
  List<List<TeamStanding>> standings;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.season,
    required this.standings,
    required this.flag,
  });

  factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable()
class TeamStanding {
  int rank;
  Team team;
  int points, goalsDiff;
  String form;
  String? description;
  TeamStats all, home, away;

  TeamStanding({
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

  factory TeamStanding.fromJson(Map<String, dynamic> json) =>
      _$TeamStandingFromJson(json);

  Map<String, dynamic> toJson() => _$TeamStandingToJson(this);
}

@JsonSerializable()
class Team {
  int id;
  String name, logo;

  Team({required this.id, required this.name, required this.logo});

  factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class TeamStats {
  int played, win, draw, lose;
  TeamGoals goals;

  TeamStats({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  factory TeamStats.fromJson(Map<String, dynamic> json) =>
      _$TeamStatsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamStatsToJson(this);
}

@JsonSerializable()
class TeamGoals {
  @JsonKey(name: 'for')
  int goalsFor;
  @JsonKey(name: 'against')
  int goalsAgainst;

  TeamGoals({
    required this.goalsFor,
    required this.goalsAgainst,
  });

  factory TeamGoals.fromJson(Map<String, dynamic> json) =>
      _$TeamGoalsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamGoalsToJson(this);
}
