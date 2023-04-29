import 'dart:io';

import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:dota_heroes/app/global_widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDotaHeroTile extends StatelessWidget {
  final DotaHero dotaHero;
  final bool isFavorite;
  final Function() onSelected;

  const HomeDotaHeroTile({
    super.key,
    required this.dotaHero,
    required this.isFavorite,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final primaryAttr = dotaHero.primaryAttr;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              dotaHero.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const LoadingIndicator();
                } else {
                  return child;
                }
              },
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
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dotaHero.localizedName ?? '',
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            onPressed: onSelected,
            style: OutlinedButton.styleFrom(
              shape: const BeveledRectangleBorder(),
              side: BorderSide.none,
            ),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
