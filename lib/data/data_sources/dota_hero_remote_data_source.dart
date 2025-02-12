import 'package:dota_heroes/domain/core/api_client.dart';
import 'package:dota_heroes/data/mappers/dota_hero_mapper.dart';
import 'package:dota_heroes/data/models/dota_hero_model.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';

class DotaHeroRemoteDataSource {
  final ApiClient _apiClient;

  DotaHeroRemoteDataSource(this._apiClient);

  Future<List<DotaHero>> getHeroStats() async {
    final response = await _apiClient.get('/api/heroStats');

    List<DotaHeroModel> result = [];
    if (response.data is List) {
      response.data.forEach((e) {
        result.add(DotaHeroModel.fromJson(e));
      });
    }

    return result.map((e) => DotaHeroMapper.toEntity(e)).toList();
  }
}
