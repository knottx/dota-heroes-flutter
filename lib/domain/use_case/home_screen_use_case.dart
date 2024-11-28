import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';

class HomeScreenUseCase {
  final DotaHeroRepository _dotaHeroRepository;

  HomeScreenUseCase(
    this._dotaHeroRepository,
  );

  Future<List<DotaHero>> getHeroStats() {
    return _dotaHeroRepository.getHeroStats();
  }
}
