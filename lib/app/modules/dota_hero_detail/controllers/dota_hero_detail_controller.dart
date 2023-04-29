import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:dota_heroes/app/managers/session_manager.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DotaHeroDetailController extends GetxController {
  final SessionManager _sessionManager = Get.find();

  late final DotaHero dotaHero;
  late final RxList<int> favoriteIds;

  @override
  void onInit() {
    super.onInit();
    dotaHero = Get.arguments;
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
    final id = dotaHero.id;
    if (id != null) {
      _sessionManager.setFavorite(id);
    }
  }
}
