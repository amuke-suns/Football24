import 'package:json_annotation/json_annotation.dart';

part 'news_fixture_model.g.dart';

@JsonSerializable()
class APIFixturesQuery {
  List<String> errors;
  int results;
  List<APIFixtureDetails> response;

  APIFixturesQuery({
    required this.errors,
    required this.results,
    required this.response,
  });

  factory APIFixturesQuery.fromJson(Map<String, dynamic> json) =>
      _$APIFixturesQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIFixturesQueryToJson(this);

}

@JsonSerializable()
class APIFixtureDetails {
  APIFixture fixture;
  APILeague league;
  APITeams teams;
  APIGoals goals;
  APIScore score;

  APIFixtureDetails({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  factory APIFixtureDetails.fromJson(Map<String, dynamic> json) =>
      _$APIFixtureDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$APIFixtureDetailsToJson(this);
}

@JsonSerializable()
class APIFixture {
  int id;
  String? referee;
  String timezone, date;
  double timestamp;

  APIFixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
  });

  factory APIFixture.fromJson(Map<String, dynamic> json) =>
      _$APIFixtureFromJson(json);

  Map<String, dynamic> toJson() => _$APIFixtureToJson(this);
}

@JsonSerializable()
class APILeague {
  int id;
  String name, country, logo, round;
  String? flag;
  int season;

  APILeague({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.round,
    required this.flag,
    required this.season,
  });

  factory APILeague.fromJson(Map<String, dynamic> json) =>
      _$APILeagueFromJson(json);

  Map<String, dynamic> toJson() => _$APILeagueToJson(this);
}

@JsonSerializable()
class APITeams {
  APITeam home;
  APITeam away;

  APITeams({required this.home, required this.away});

  factory APITeams.fromJson(Map<String, dynamic> json) =>
      _$APITeamsFromJson(json);

  Map<String, dynamic> toJson() => _$APITeamsToJson(this);
}

@JsonSerializable()
class APITeam {
  int id;
  String name;
  String logo;
  bool? winner;

  APITeam({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  factory APITeam.fromJson(Map<String, dynamic> json) =>
      _$APITeamFromJson(json);

  Map<String, dynamic> toJson() => _$APITeamToJson(this);
}

@JsonSerializable()
class APIGoals {
  int? home;
  int? away;

  APIGoals({required this.home, required this.away});

  factory APIGoals.fromJson(Map<String, dynamic> json) =>
      _$APIGoalsFromJson(json);

  Map<String, dynamic> toJson() => _$APIGoalsToJson(this);
}

@JsonSerializable()
class APIScore {
  APIGoals halftime;
  APIGoals fulltime;
  APIGoals extratime;
  APIGoals penalty;

  APIScore({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory APIScore.fromJson(Map<String, dynamic> json) =>
      _$APIScoreFromJson(json);

  Map<String, dynamic> toJson() => _$APIScoreToJson(this);
}
