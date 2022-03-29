// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueQuery _$LeagueQueryFromJson(Map<String, dynamic> json) => LeagueQuery(
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      results: json['results'] as int,
      response: (json['response'] as List<dynamic>)
          .map((e) => LeagueDesc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeagueQueryToJson(LeagueQuery instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

LeagueDesc _$LeagueDescFromJson(Map<String, dynamic> json) => LeagueDesc(
      league: League.fromJson(json['league'] as Map<String, dynamic>),
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeagueDescToJson(LeagueDesc instance) =>
    <String, dynamic>{
      'league': instance.league,
      'country': instance.country,
      'seasons': instance.seasons,
    };

League _$LeagueFromJson(Map<String, dynamic> json) => League(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'logo': instance.logo,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      year: json['year'] as int,
      start: json['start'] as String,
      end: json['end'] as String,
      current: json['current'] as bool,
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'year': instance.year,
      'start': instance.start,
      'end': instance.end,
      'current': instance.current,
    };
