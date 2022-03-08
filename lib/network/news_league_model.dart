import 'package:json_annotation/json_annotation.dart';

part 'news_league_model.g.dart';

@JsonSerializable()
class APILeagueQuery {
  List<String> errors;
  int results;
  List<APILeagueDesc> response;

  APILeagueQuery({
    required this.errors,
    required this.results,
    required this.response,
  });

  factory APILeagueQuery.fromJson(Map<String, dynamic> json) =>
      _$APILeagueQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APILeagueQueryToJson(this);
}

@JsonSerializable()
class APILeagueDesc {
  APILeague league;
  APICountry country;
  List<APISeason> seasons;

  APILeagueDesc({
    required this.league,
    required this.country,
    required this.seasons,
  });

  factory APILeagueDesc.fromJson(Map<String, dynamic> json) =>
      _$APILeagueDescFromJson(json);

  Map<String, dynamic> toJson() => _$APILeagueDescToJson(this);
}

@JsonSerializable()
class APILeague {
  int id;
  String name;
  String type;
  String logo;

  APILeague({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  factory APILeague.fromJson(Map<String, dynamic> json) =>
      _$APILeagueFromJson(json);

  Map<String, dynamic> toJson() => _$APILeagueToJson(this);
}

@JsonSerializable()
class APICountry {
  String name;
  String? code, flag;

  APICountry({
    required this.name,
    required this.code,
    required this.flag,
  });

  factory APICountry.fromJson(Map<String, dynamic> json) =>
      _$APICountryFromJson(json);

  Map<String, dynamic> toJson() => _$APICountryToJson(this);
}

@JsonSerializable()
class APISeason {
  int year;
  String start, end;
  bool current;
  // APICoverage coverage;

  APISeason({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    // required this.coverage,
  });

  factory APISeason.fromJson(Map<String, dynamic> json) =>
      _$APISeasonFromJson(json);

  Map<String, dynamic> toJson() => _$APISeasonToJson(this);
}