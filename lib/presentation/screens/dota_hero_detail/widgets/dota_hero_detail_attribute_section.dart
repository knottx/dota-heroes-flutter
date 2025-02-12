import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:dota_heroes/presentation/global_widgets/image_from_network.dart';
import 'package:flutter/material.dart';

class DotaHeroDetailAttributeSection extends StatelessWidget {
  final DotaHero? dotaHero;

  const DotaHeroDetailAttributeSection({
    super.key,
    required this.dotaHero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.detailContainer,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'ATTRIBUTES',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 160,
                    child: ImageFromNetwork(
                      url: dotaHero?.imageUrl(),
                    ),
                  ),
                  _healthAndManaBar(
                    gradientColors: AppColors.healthBar,
                    base: dotaHero?.health() ?? 0,
                    regen: dotaHero?.healthRegen() ?? 0,
                  ),
                  _healthAndManaBar(
                    gradientColors: AppColors.manaBar,
                    base: dotaHero?.mana() ?? 0,
                    regen: dotaHero?.manaRegen() ?? 0,
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _attributeItem(
                    attribute: DotaHeroAttribute.strength,
                    base: dotaHero?.baseStr ?? 0,
                    gain: dotaHero?.strGain ?? 0,
                  ),
                  _attributeItem(
                    attribute: DotaHeroAttribute.agility,
                    base: dotaHero?.baseAgi ?? 0,
                    gain: dotaHero?.agiGain ?? 0,
                  ),
                  _attributeItem(
                    attribute: DotaHeroAttribute.intelligence,
                    base: dotaHero?.baseInt ?? 0,
                    gain: dotaHero?.intGain ?? 0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _healthAndManaBar({
    required List<Color> gradientColors,
    required num base,
    required num regen,
  }) {
    return Container(
      height: 24,
      width: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: gradientColors,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 2,
            child: Text(
              base.toStringAsFixed(0),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 8,
            child: Text(
              '+${regen.toStringAsFixed(1)}',
              style: const TextStyle(
                color: AppColors.tertiary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _attributeItem({
    required DotaHeroAttribute attribute,
    required num base,
    required num gain,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Image.asset(
            attribute.iconAssetName,
            width: 32,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            base.toStringAsFixed(0),
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' + ${gain.toStringAsFixed(1)}',
            style: const TextStyle(
              color: AppColors.secondary,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
