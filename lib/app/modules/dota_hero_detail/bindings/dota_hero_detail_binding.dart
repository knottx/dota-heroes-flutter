import 'package:get/get.dart';

import '../controllers/dota_hero_detail_controller.dart';

class DotaHeroDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DotaHeroDetailController>(
      () => DotaHeroDetailController(),
    );
  }
}
