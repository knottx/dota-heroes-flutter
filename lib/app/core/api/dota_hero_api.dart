import 'package:dota_heroes/app/core/api_client.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';

class DotaHeroAPI {
  static Future<List<DotaHero>> getHeroStats() async {
    const apiPath = '/api/heroStats';
    try {
      final response = await APIClient.instance.get(
        apiPath,
      );

      List<DotaHero> result = [];
      if (response.data is List) {
        response.data.forEach((e) {
          result.add(DotaHero.fromJson(e));
        });
      }
      return result;
    } catch (error) {
      rethrow;
    }
  }
}
