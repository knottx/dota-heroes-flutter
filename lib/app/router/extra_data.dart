import 'package:dota_heroes/app/router/arguments/dota_hero_detail_page_arguments.dart';
import 'package:json_annotation/json_annotation.dart';

part 'extra_data.g.dart';

@JsonSerializable()
class ExtraData {
  final DotaHeroDetailScreenArguments? dotaHeroDetailArguments;

  const ExtraData({
    this.dotaHeroDetailArguments,
  });

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraDataToJson(this);
}
