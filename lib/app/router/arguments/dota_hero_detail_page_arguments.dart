import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dota_hero_detail_page_arguments.g.dart';

@JsonSerializable()
class DotaHeroDetailScreenArguments {
  final DotaHero? dotaHero;

  const DotaHeroDetailScreenArguments({
    required this.dotaHero,
  });

  factory DotaHeroDetailScreenArguments.fromJson(Map<String, dynamic> json) =>
      _$DotaHeroDetailScreenArgumentsFromJson(json);

  Map<String, dynamic> toJson() => _$DotaHeroDetailScreenArgumentsToJson(this);
}
