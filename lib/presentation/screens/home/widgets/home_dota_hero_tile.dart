import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:dota_heroes/presentation/style/app_text_style.dart';
import 'package:dota_heroes/presentation/widgets/image_from_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDotaHeroTile extends StatelessWidget {
  final DotaHero dotaHero;
  final bool isFavorite;
  final Function(DotaHero) onSelected;

  const HomeDotaHeroTile({
    super.key,
    required this.dotaHero,
    required this.isFavorite,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final primaryAttr = dotaHero.primaryAttr;
    final localizedName = dotaHero.localizedName ?? '';
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageFromNetwork(
                url: dotaHero.imageUrl(),
                fit: BoxFit.cover,
              ),
            ),
            if (isFavorite)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  CupertinoIcons.heart_fill,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    (primaryAttr != null)
                        ? Image.asset(
                            primaryAttr.iconAssetName,
                            width: 24,
                          )
                        : const Icon(
                            CupertinoIcons.circle_fill,
                            size: 24,
                          ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 24,
                        child: localizedName.isNotEmpty
                            ? FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  localizedName,
                                  maxLines: 1,
                                  style: AppTextStyle.w700(16).colorPrimaryText,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => onSelected(dotaHero),
              style: OutlinedButton.styleFrom(
                shape: const BeveledRectangleBorder(),
                side: BorderSide.none,
              ),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
