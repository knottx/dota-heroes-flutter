import 'package:dota_heroes/app/utils/codable.dart';
import 'package:dota_heroes/data/models/dota_hero_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dota_hero_detail_page_arguments.g.dart';

@JsonSerializable()
class DotaHeroDetailScreenArguments {
  final DotaHeroModel? dotaHeroModel;

  const DotaHeroDetailScreenArguments({
    required this.dotaHeroModel,
  });

  factory DotaHeroDetailScreenArguments.fromJson(Map<String, dynamic> json) {
    return Codable.decode(_$DotaHeroDetailScreenArgumentsFromJson, json);
  }

  Map<String, dynamic> toJson() => _$DotaHeroDetailScreenArgumentsToJson(this);
}
