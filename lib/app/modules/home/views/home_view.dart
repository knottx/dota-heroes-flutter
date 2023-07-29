import 'package:dota_heroes/app/constants/sort_type.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:dota_heroes/app/global_widgets/loading_indicator.dart';
import 'package:dota_heroes/app/modules/home/controllers/home_controller.dart';
import 'package:dota_heroes/app/modules/home/widgets/home_app_bar_bottom.dart';
import 'package:dota_heroes/app/modules/home/widgets/home_dota_hero_tile.dart';
import 'package:dota_heroes/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Image.asset(
                ImageName.dota2Logo,
                height: 32,
              ),
              centerTitle: true,
              bottom: _appBarBottom(context),
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    ImageName.background,
                    fit: BoxFit.cover,
                  ),
                ),
                _body(),
              ],
            ),
          ),
        ),
        Obx(() => OverlayLoadingIndicator(controller.isLoading.value)),
      ],
    );
  }

  PreferredSizeWidget _appBarBottom(BuildContext context) {
    return HomeAppBarBottom(
      filteredAttribute: controller.filteredAttribute,
      onTapFilteredAttribute: controller.onTapFilteredAtttibute,
      sortType: controller.sortType,
      onTapSortType: controller.onTapSortType,
      showFavorites: controller.showFavorites,
      onTapShowFavorites: controller.showFavorites.toggle,
      searchText: controller.searchText,
      searchTextController: controller.searchTextController,
    );
  }

  Widget _body() {
    return Obx(() {
      final dataSource = controller.dataSource;

      final favoriteIds = controller.favoriteIds;

      List<DotaHero> displayHeroes = [];
      displayHeroes = dataSource;

      final sortType = controller.sortType.value;
      switch (sortType) {
        case SortType.ascending:
          displayHeroes.sort(
            (a, b) =>
                (a.localizedName ?? '').compareTo((b.localizedName ?? '')),
          );
          break;

        case SortType.descending:
          displayHeroes.sort(
            (a, b) =>
                (b.localizedName ?? '').compareTo((a.localizedName ?? '')),
          );
          break;
      }

      final filterAttribute = controller.filteredAttribute.value;
      if (filterAttribute != null) {
        displayHeroes = displayHeroes
            .where((e) => e.primaryAttr == filterAttribute)
            .toList();
      }

      final searchText = controller.searchText.value;
      if (searchText.isNotEmpty) {
        displayHeroes = displayHeroes
            .where(
              (e) =>
                  e.localizedName
                      ?.toLowerCase()
                      .contains(searchText.toLowerCase()) ??
                  false,
            )
            .toList();
      }

      final showFavorite = controller.showFavorites.value;
      if (showFavorite) {
        displayHeroes = displayHeroes
            .where(
              (e) => favoriteIds.contains(e.id),
            )
            .toList();
      }

      final padding = Get.mediaQuery.padding;
      return RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: RawScrollbar(
          thumbColor: Colors.white38,
          radius: const Radius.circular(2),
          thickness: 4,
          controller: controller.scrollController,
          child: GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(8, 8, 8, padding.bottom + 8),
            controller: controller.scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 16.0 / 9.0,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: displayHeroes.length,
            itemBuilder: (context, index) {
              final dotaHero = displayHeroes[index];
              return HomeDotaHeroTile(
                dotaHero: dotaHero,
                isFavorite: favoriteIds.contains(dotaHero.id),
                onSelected: () {
                  FocusScope.of(context).unfocus();
                  controller.onSelectedDotaHero(dotaHero);
                },
              );
            },
          ),
        ),
      );
    });
  }
}
