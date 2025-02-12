import 'package:dota_heroes/domain/core/result.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';

class HomeScreenUseCase {
  final DotaHeroRepository _dotaHeroRepository;

  HomeScreenUseCase(
    this._dotaHeroRepository,
  );

  Future<Result<List<DotaHero>>> getHeroStats() async {
    try {
      final result = await _dotaHeroRepository.getHeroStats();
      return Result.success(result);
    } catch (error) {
      return Result.failure(error);
    }
  }
}
