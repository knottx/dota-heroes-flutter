import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/constants/dota_hero_role.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:flutter/material.dart';

class DotaHeroDetailRolesSection extends StatelessWidget {
  final DotaHero dotaHero;

  const DotaHeroDetailRolesSection({
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
            'ROLES',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _roleItem(role: DotaHeroRole.carry),
                    _roleItem(role: DotaHeroRole.disabler),
                    _roleItem(role: DotaHeroRole.escape),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _roleItem(role: DotaHeroRole.support),
                    _roleItem(role: DotaHeroRole.jungler),
                    _roleItem(role: DotaHeroRole.pusher),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _roleItem(role: DotaHeroRole.nuker),
                    _roleItem(role: DotaHeroRole.durable),
                    _roleItem(role: DotaHeroRole.initiator),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _roleItem({
    required DotaHeroRole role,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        role.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: dotaHero.roles().contains(role)
              ? AppColors.primary
              : AppColors.tertiary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
