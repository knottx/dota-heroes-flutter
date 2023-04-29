// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => ExtraData(
      dotaHeroDetailArguments: json['dotaHeroDetailArguments'] == null
          ? null
          : DotaHeroDetailScreenArguments.fromJson(
              json['dotaHeroDetailArguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtraDataToJson(ExtraData instance) => <String, dynamic>{
      if (instance.dotaHeroDetailArguments?.toJson() case final value?)
        'dotaHeroDetailArguments': value,
    };
