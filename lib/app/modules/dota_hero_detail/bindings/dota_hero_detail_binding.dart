import 'package:get/get.dart';

import 'package:dota_heroes/app/modules/dota_hero_detail/controllers/dota_hero_detail_controller.dart';

class DotaHeroDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DotaHeroDetailController>(
      () => DotaHeroDetailController(),
    );
  }
}
