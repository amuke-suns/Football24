import 'package:json_annotation/json_annotation.dart';

part 'league_query.g.dart';

@JsonSerializable()
class LeagueQuery {
  List<String> errors;
  int results;
  List<LeagueDesc> response;

  LeagueQuery({
    required this.errors,
    required this.results,
    required this.response,
  });

  factory LeagueQuery.fromJson(Map<String, dynamic> json) =>
      _$LeagueQueryFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueQueryToJson(this);
}

@JsonSerializable()
class LeagueDesc {
  League league;
  Country country;
  List<Season> seasons;

  LeagueDesc({
    required this.league,
    required this.country,
    required this.seasons,
  });

  factory LeagueDesc.fromJson(Map<String, dynamic> json) =>
      _$LeagueDescFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueDescToJson(this);

  List<int> getSeasonYears() {
    List<int> years = [];
    for (var season in seasons) {
      years.add(season.year);
    }
    return years;
  }
}

@JsonSerializable()
class League {
  int id;
  String name;
  String type;
  String logo;

  League({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);

  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}

@JsonSerializable()
class Country {
  String name;
  String? code, flag;

  Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Season {
  int year;
  String start, end;
  bool current;
  // Coverage coverage;

  Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    // required this.coverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) =>
      _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}