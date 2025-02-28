import 'package:dota_heroes/domain/data_sources/remote_data_sources/dota_hero_remote_data_source.dart';
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
