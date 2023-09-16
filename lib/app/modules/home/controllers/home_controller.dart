import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/constants/sort_type.dart';
import 'package:dota_heroes/app/core/api/dota_hero_api.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:dota_heroes/app/extensions/bool_extension.dart';
import 'package:dota_heroes/app/managers/session_manager.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/dota_hero_detail_arguments.dart';
import 'package:dota_heroes/app/routes/app_pages.dart';
import 'package:dota_heroes/app/utils/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SessionManager _sessionManager = SessionManager.shared;

  late final RxList<int> favoriteIds;

  final ScrollController scrollController = ScrollController();

  final Rxn<DotaHeroAttribute> filteredAttribute = Rxn();

  final Rx<SortType> sortType = SortType.ascending.obs;

  final RxBool showFavorites = false.obs;

  final TextEditingController searchTextController = TextEditingController();
  final RxString searchText = ''.obs;

  final RxList<DotaHero> dataSource = RxList();

  final RxBool isLoadingGetHeroStats = false.obs;

  RxBool get isLoading {
    return [
      isLoadingGetHeroStats.value,
    ].atLeastOneTrue.obs;
  }

  @override
  void onInit() {
    super.onInit();
    favoriteIds = _sessionManager.favoriteIds;

    searchTextController.addListener(() {
      searchText(searchTextController.text);
    });
  }

  @override
  void onReady() {
    super.onReady();
    _getHeroStats();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {
    HapticFeedback.lightImpact();
    _getHeroStats();
    return;
  }

  void onTapFilteredAtttibute(DotaHeroAttribute attr) {
    HapticFeedback.selectionClick();
    if (filteredAttribute.value == attr) {
      filteredAttribute.value = null;
    } else {
      filteredAttribute.value = attr;
    }
    _scrollToTop();
  }

  void onTapSortType() {
    if (sortType.value == SortType.ascending) {
      sortType(SortType.descending);
    } else {
      sortType(SortType.ascending);
    }
    _scrollToTop();
  }

  void onSelectedDotaHero(DotaHero dotaHero) {
    Get.toNamed(
      Routes.DOTA_HERO_DETAIL,
      arguments: DotaHeroDetailArguments(
        dotaHero: dotaHero,
      ),
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }

  void _getHeroStats() async {
    try {
      isLoadingGetHeroStats(true);
      final result = await DotaHeroAPI.getHeroStats();
      isLoadingGetHeroStats(false);
      dataSource(result);
    } catch (error) {
      isLoadingGetHeroStats(false);
      showAlertError(error: error);
    }
  }
}
