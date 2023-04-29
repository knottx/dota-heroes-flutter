import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dota_hero_detail_page_arguments.g.dart';

@JsonSerializable()
class DotaHeroDetailPageArguments {
  final DotaHero? dotaHero;

  const DotaHeroDetailPageArguments({
    required this.dotaHero,
  });

  factory DotaHeroDetailPageArguments.fromJson(Map<String, dynamic> json) =>
      _$DotaHeroDetailPageArgumentsFromJson(json);

  Map<String, dynamic> toJson() => _$DotaHeroDetailPageArgumentsToJson(this);
}
