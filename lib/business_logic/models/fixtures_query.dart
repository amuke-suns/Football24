import 'package:json_annotation/json_annotation.dart';

part 'fixtures_query.g.dart';

@JsonSerializable()
class FixturesQuery {
  List<String> errors;
  int results;
  List<FixtureDetails> response;

  FixturesQuery({
    required this.errors,
    required this.results,
    required this.response,
  });

  factory FixturesQuery.fromJson(Map<String, dynamic> json) =>
      _$FixturesQueryFromJson(json);

  Map<String, dynamic> toJson() => _$FixturesQueryToJson(this);
}

@JsonSerializable()
class FixtureDetails {
  Fixture fixture;
  League league;
  Teams teams;
  Goals goals;
  Score score;

  FixtureDetails({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  factory FixtureDetails.fromJson(Map<String, dynamic> json) =>
      _$FixtureDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureDetailsToJson(this);
}

@JsonSerializable()
class Fixture {
  int id;
  String? referee;
  String timezone, date;
  double timestamp;
  FixtureStatus status;

  Fixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) =>
      _$FixtureFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureToJson(this);
}

@JsonSerializable()
class FixtureStatus {

  String short;
  int? elapsed;

  FixtureStatus({
    required this.short,
    required this.elapsed,
  });

  bool hasNotStarted() => short == "NS" ? true : false;

  factory FixtureStatus.fromJson(Map<String, dynamic> json) =>
      _$FixtureStatusFromJson(json);

  Map<String, dynamic> toJson() => _$FixtureStatusToJson(this);
}

@JsonSerializable()
class League {
  int id;
  String name, country, logo, round;
  String? flag;
  int season;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.round,
    required this.flag,
    required this.season,
  });

  factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable()
class Teams {
  Team home;
  Team away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) =>
      _$TeamsFromJson(json);

  Map<String, dynamic> toJson() => _$TeamsToJson(this);
}

@JsonSerializable()
class Team {
  int id;
  String name;
  String logo;
  bool? winner;

  Team({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}

@JsonSerializable()
class Goals {
  int? home;
  int? away;

  Goals({required this.home, required this.away});

  factory Goals.fromJson(Map<String, dynamic> json) =>
      _$GoalsFromJson(json);

  Map<String, dynamic> toJson() => _$GoalsToJson(this);
}

@JsonSerializable()
class Score {
  Goals halftime;
  Goals fulltime;
  Goals extratime;
  Goals penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) =>
      _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}
