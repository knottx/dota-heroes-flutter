import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:dota_heroes/presentation/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final DotaHeroAttribute? filteredAttribute;
  final Function(DotaHeroAttribute) onTapFilteredAttribute;
  final SortType sortType;
  final Function() onTapSortType;
  final bool showFavorites;
  final Function() onTapShowFavorites;
  final String searchText;
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
              Row(
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
                            opacity: filteredAttribute == e ? 1 : 0.25,
                            child: Image.asset(
                              e.iconAssetName,
                              width: 32,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  onTapSortType();
                },
                icon: Icon(
                  sortType.iconData,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  onTapShowFavorites();
                },
                icon: Opacity(
                  opacity: showFavorites ? 1 : 0.25,
                  child: const Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: TextFormField(
              controller: searchTextController,
              obscureText: false,
              autocorrect: false,
              cursorColor: AppColors.primary,
              maxLines: 1,
              style: AppTextStyle.w400(16).colorWhite,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: AppColors.secondary,
                  size: 24,
                ),
                contentPadding: const EdgeInsets.only(left: 8),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                suffixIcon: searchText.isNotEmpty
                    ? IconButton(
                        onPressed: searchTextController.clear,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                        ),
                        icon: const Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: AppColors.secondary,
                          size: 18,
                        ),
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
