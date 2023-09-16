import 'package:dota_heroes/app/managers/session_manager.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/dota_hero_detail_arguments.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DotaHeroDetailController extends GetxController {
  final SessionManager _sessionManager = Get.find();

  late final DotaHeroDetailArguments arguments;
  late final RxList<int> favoriteIds;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments;
    favoriteIds = _sessionManager.favoriteIds;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapFavorite() {
    HapticFeedback.selectionClick();
    final id = arguments.dotaHero.id;
    if (id != null) {
      _sessionManager.setFavorite(id);
    }
  }
}
