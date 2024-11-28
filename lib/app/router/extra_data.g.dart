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

Map<String, dynamic> _$ExtraDataToJson(ExtraData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'dotaHeroDetailArguments', instance.dotaHeroDetailArguments?.toJson());
  return val;
}
