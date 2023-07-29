import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/constants/sort_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Rxn<DotaHeroAttribute> filteredAttribute;
  final Function(DotaHeroAttribute) onTapFilteredAttribute;
  final Rx<SortType> sortType;
  final Function() onTapSortType;
  final RxBool showFavorites;
  final Function() onTapShowFavorites;
  final RxString searchText;
  final TextEditingController searchTextController;

  const HomeAppBarBottom({
    super.key,
    required this.filteredAttribute,
    required this.onTapFilteredAttribute,
    required this.sortType,
    required this.onTapSortType,
    required this.showFavorites,
    required this.onTapShowFavorites,
    required this.searchText,
    required this.searchTextController,
  });

  @override
  Size get preferredSize => const Size.fromHeight(112);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Row(
                  children: DotaHeroAttribute.values
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                          ),
                          child: IconButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              onTapFilteredAttribute(e);
                            },
                            icon: Opacity(
                              opacity: filteredAttribute.value == e ? 1 : 0.25,
                              child: Image.asset(
                                e.iconAssetName,
                                width: 32,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              }),
              const Spacer(),
              Obx(() {
                return IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    onTapSortType();
                  },
                  icon: Icon(
                    sortType.value.iconData,
                    color: AppColors.primary,
                    size: 32,
                  ),
                );
              }),
              const SizedBox(
                width: 8,
              ),
              Obx(() {
                return IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    onTapShowFavorites();
                  },
                  icon: Opacity(
                    opacity: showFavorites.value ? 1 : 0.25,
                    child: const Icon(
                      CupertinoIcons.heart_fill,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.tertiary,
            ),
            child: TextFormField(
              obscureText: false,
              autocorrect: false,
              cursorColor: AppColors.primary,
              maxLines: 1,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: AppColors.secondary,
                  size: 24,
                ),
                contentPadding: const EdgeInsets.only(left: 8),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Obx(() {
                  return searchText.value.isNotEmpty
                      ? OutlinedButton(
                          onPressed: searchTextController.clear,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide.none,
                          ),
                          child: const Icon(
                            CupertinoIcons.xmark_circle_fill,
                            color: AppColors.secondary,
                            size: 18,
                          ),
                        )
                      : const SizedBox();
                }),
              ),
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              controller: searchTextController,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
