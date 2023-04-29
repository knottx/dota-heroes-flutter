// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => ExtraData(
      dotaHeroDetailArguments: json['dotaHeroDetailArguments'] == null
          ? null
          : DotaHeroDetailPageArguments.fromJson(
              json['dotaHeroDetailArguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtraDataToJson(ExtraData instance) => <String, dynamic>{
      'dotaHeroDetailArguments': instance.dotaHeroDetailArguments,
    };
