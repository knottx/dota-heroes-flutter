import 'package:dota_heroes/app/core/api/api_client.dart';
import 'package:dota_heroes/data/models/dota_hero_model.dart';

class DotaHeroRemoteDataSource {
  final ApiClient _apiClient;

  DotaHeroRemoteDataSource(this._apiClient);

  Future<List<DotaHeroModel>> getHeroStats() async {
    final response = await _apiClient.get('/api/heroStats');

    List<DotaHeroModel> result = [];
    if (response.data is List) {
      response.data.forEach((e) {
        result.add(DotaHeroModel.fromJson(e));
      });
    }
    return result;
  }
}
