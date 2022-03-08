// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_league_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APILeagueQuery _$APILeagueQueryFromJson(Map<String, dynamic> json) {
  return APILeagueQuery(
    errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    results: json['results'] as int,
    response: (json['response'] as List<dynamic>)
        .map((e) => APILeagueDesc.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$APILeagueQueryToJson(APILeagueQuery instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

APILeagueDesc _$APILeagueDescFromJson(Map<String, dynamic> json) {
  return APILeagueDesc(
    league: APILeague.fromJson(json['league'] as Map<String, dynamic>),
    country: APICountry.fromJson(json['country'] as Map<String, dynamic>),
    seasons: (json['seasons'] as List<dynamic>)
        .map((e) => APISeason.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$APILeagueDescToJson(APILeagueDesc instance) =>
    <String, dynamic>{
      'league': instance.league,
      'country': instance.country,
      'seasons': instance.seasons,
    };

APILeague _$APILeagueFromJson(Map<String, dynamic> json) {
  return APILeague(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    logo: json['logo'] as String,
  );
}

Map<String, dynamic> _$APILeagueToJson(APILeague instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
    };

APICountry _$APICountryFromJson(Map<String, dynamic> json) {
  return APICountry(
    name: json['name'] as String,
    code: json['code'] as String?,
    flag: json['flag'] as String?,
  );
}

Map<String, dynamic> _$APICountryToJson(APICountry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

APISeason _$APISeasonFromJson(Map<String, dynamic> json) {
  return APISeason(
    year: json['year'] as int,
    start: json['start'] as String,
    end: json['end'] as String,
    current: json['current'] as bool,
  );
}

Map<String, dynamic> _$APISeasonToJson(APISeason instance) => <String, dynamic>{
      'year': instance.year,
      'start': instance.start,
      'end': instance.end,
      'current': instance.current,
    };
