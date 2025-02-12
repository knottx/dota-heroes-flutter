import 'package:dota_heroes/data/data_sources/dota_hero_remote_data_source.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';

class DotaHeroRepositoryImpl implements DotaHeroRepository {
  final DotaHeroRemoteDataSource _dotaHeroRemoteDataSource;

  DotaHeroRepositoryImpl(this._dotaHeroRemoteDataSource);

  @override
  Future<List<DotaHero>> getHeroStats() async {
    return _dotaHeroRemoteDataSource.getHeroStats();
  }
}
