import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_stat.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class DotaHeroDetailStatsSection extends StatelessWidget {
  final DotaHero? dotaHero;

  const DotaHeroDetailStatsSection({
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'STATS',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _statItem(
                      stat: DotaHeroStat.damage,
                      value: [
                        dotaHero?.attackMin().toStringAsFixed(0),
                        dotaHero?.attackMax().toStringAsFixed(0),
                      ].join('-'),
                    ),
                    _statItem(
                      stat: DotaHeroStat.attackRate,
                      value: dotaHero?.attackRate?.toStringAsFixed(1) ?? '-',
                    ),
                    _statItem(
                      stat: DotaHeroStat.attackRange,
                      value: dotaHero?.attackRange?.toStringAsFixed(0) ?? '-',
                    ),
                    _statItem(
                      stat: DotaHeroStat.projectileSpeed,
                      value:
                          dotaHero?.projectileSpeed?.toStringAsFixed(0) ?? '-',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    _statItem(
                      stat: DotaHeroStat.armor,
                      value: dotaHero?.armor().toStringAsFixed(1) ?? '-',
                    ),
                    _statItem(
                      stat: DotaHeroStat.magicResistance,
                      value: '${dotaHero?.baseMr?.toStringAsFixed(0) ?? '-'}%',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    _statItem(
                      stat: DotaHeroStat.movementSpeed,
                      value: dotaHero?.moveSpeed?.toStringAsFixed(0) ?? '-',
                    ),
                    _statItem(
                      stat: DotaHeroStat.turnRate,
                      value: dotaHero?.turnRate?.toStringAsFixed(1) ?? '-',
                    ),
                    _statItem(
                      stat: DotaHeroStat.vision,
                      value: [
                        dotaHero?.dayVision?.toStringAsFixed(0) ?? '-',
                        dotaHero?.nightVision?.toStringAsFixed(0) ?? '-',
                      ].join('/'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem({
    required DotaHeroStat stat,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(
            stat.iconAssetName,
            width: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
