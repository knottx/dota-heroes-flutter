// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_hero_detail_page_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DotaHeroDetailScreenArguments _$DotaHeroDetailScreenArgumentsFromJson(
        Map<String, dynamic> json) =>
    DotaHeroDetailScreenArguments(
      dotaHero: json['dotaHero'] == null
          ? null
          : DotaHero.fromJson(json['dotaHero'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DotaHeroDetailScreenArgumentsToJson(
    DotaHeroDetailScreenArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dotaHero', instance.dotaHero?.toJson());
  return val;
}
