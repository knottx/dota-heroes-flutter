import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/constants/dota_hero_attack_type.dart';
import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DotaHeroDetailHeaderSection extends StatelessWidget {
  final DotaHero dotaHero;

  const DotaHeroDetailHeaderSection({
    super.key,
    required this.dotaHero,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _title(),
        _body(),
      ],
    );
  }

  Widget _title() {
    final primaryAttr = dotaHero.primaryAttr;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (primaryAttr != null)
            Row(
              children: [
                Image.asset(
                  primaryAttr.iconAssetName,
                  width: 32,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    primaryAttr.title,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          if (primaryAttr != null) const SizedBox(height: 16),
          Text(
            dotaHero.localizedName?.toUpperCase() ?? '',
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    final potraitWidth = Get.width;
    final potraitHeight = potraitWidth * 0.75;
    return Stack(
      children: [
        Container(
          width: potraitWidth,
          height: potraitHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              alignment: Alignment.centerRight,
              image: NetworkImage(
                dotaHero.potraitImageUrl,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'ATTACK TYPE',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(
                    dotaHero.attackType?.svgImageAssetName ?? '',
                    width: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      dotaHero.attackType?.title.toUpperCase() ?? '',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
