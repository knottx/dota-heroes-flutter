import 'package:dota_heroes/domain/entities/dota_hero.dart';

abstract class DotaHeroRepository {
  Future<List<DotaHero>> getHeroStats();
}
