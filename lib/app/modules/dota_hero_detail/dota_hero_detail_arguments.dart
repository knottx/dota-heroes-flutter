import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:dota_heroes/app/utils/base_view_arguments.dart';

class DotaHeroDetailArguments extends BaseViewArguments {
  final DotaHero dotaHero;

  DotaHeroDetailArguments({
    required this.dotaHero,
  });
}
