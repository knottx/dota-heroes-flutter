import 'package:dota_heroes/domain/entities/dota_hero.dart';

abstract class DotaHeroRemoteDataSource {
  Future<List<DotaHero>> getHeroStats();
}
