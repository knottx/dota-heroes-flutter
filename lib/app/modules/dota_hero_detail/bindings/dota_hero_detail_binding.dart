import 'package:dota_heroes/app/modules/dota_hero_detail/controllers/dota_hero_detail_controller.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/dota_hero_detail_arguments.dart';
import 'package:get/get.dart';

class DotaHeroDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DotaHeroDetailController>(
      () => DotaHeroDetailController(),
      tag: (Get.arguments as DotaHeroDetailArguments).tag,
    );
  }
}
