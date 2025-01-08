import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_role.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class DotaHeroDetailRolesSection extends StatelessWidget {
  final DotaHero? dotaHero;

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
                    _roleItem(context, role: DotaHeroRole.carry),
                    _roleItem(context, role: DotaHeroRole.disabler),
                    _roleItem(context, role: DotaHeroRole.escape),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _roleItem(context, role: DotaHeroRole.support),
                    _roleItem(context, role: DotaHeroRole.jungler),
                    _roleItem(context, role: DotaHeroRole.pusher),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _roleItem(context, role: DotaHeroRole.nuker),
                    _roleItem(context, role: DotaHeroRole.durable),
                    _roleItem(context, role: DotaHeroRole.initiator),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _roleItem(
    BuildContext context, {
    required DotaHeroRole role,
  }) {
    final roles = dotaHero?.roles?.nonNulls ?? [];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        role.title(context),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: roles.contains(role) ? AppColors.primary : AppColors.tertiary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
