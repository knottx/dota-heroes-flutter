// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_hero_detail_page_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DotaHeroDetailPageArguments _$DotaHeroDetailPageArgumentsFromJson(
        Map<String, dynamic> json) =>
    DotaHeroDetailPageArguments(
      dotaHero: json['dotaHero'] == null
          ? null
          : DotaHero.fromJson(json['dotaHero'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DotaHeroDetailPageArgumentsToJson(
        DotaHeroDetailPageArguments instance) =>
    <String, dynamic>{
      'dotaHero': instance.dotaHero,
    };
