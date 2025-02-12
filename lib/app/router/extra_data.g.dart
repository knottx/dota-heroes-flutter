// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) => ExtraData(
      dotaHeroDetailScreenArguments: json['dotaHeroDetailScreenArguments'] ==
              null
          ? null
          : DotaHeroDetailScreenArguments.fromJson(
              json['dotaHeroDetailScreenArguments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtraDataToJson(ExtraData instance) => <String, dynamic>{
      if (instance.dotaHeroDetailScreenArguments?.toJson() case final value?)
        'dotaHeroDetailScreenArguments': value,
    };
