import 'package:dota_heroes/app/core/dio_client.dart';
import 'package:dota_heroes/app/core/handle_exceptions.dart';
import 'package:dota_heroes/app/core/router/dota_hero_router.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';

class DotaHeroAPI {
  static Future<List<DotaHero>> getHeroStats() async {
    const apiPath = DotaHeroRouter.heroStats;
    try {
      final response = await DioClient.shared.get(apiPath);

      List<DotaHero> result = [];
      if (response.data is List) {
        response.data.forEach((e) {
          result.add(DotaHero.fromJson(e));
        });
      }
      return result;
    } catch (error) {
      throw HandleExceptions.handleError(
        error: error,
        apiPath: apiPath,
      );
    }
  }
}
