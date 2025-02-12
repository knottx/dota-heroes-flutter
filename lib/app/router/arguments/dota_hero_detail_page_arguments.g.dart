// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_hero_detail_page_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DotaHeroDetailScreenArguments _$DotaHeroDetailScreenArgumentsFromJson(
        Map<String, dynamic> json) =>
    DotaHeroDetailScreenArguments(
      dotaHeroModel: json['dotaHeroModel'] == null
          ? null
          : DotaHeroModel.fromJson(
              json['dotaHeroModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DotaHeroDetailScreenArgumentsToJson(
        DotaHeroDetailScreenArguments instance) =>
    <String, dynamic>{
      if (instance.dotaHeroModel?.toJson() case final value?)
        'dotaHeroModel': value,
    };
