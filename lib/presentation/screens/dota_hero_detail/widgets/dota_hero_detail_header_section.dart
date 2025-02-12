import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:dota_heroes/presentation/global_widgets/image_from_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DotaHeroDetailHeaderSection extends StatelessWidget {
  final DotaHero? dotaHero;

  const DotaHeroDetailHeaderSection({
    super.key,
    required this.dotaHero,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _title(context),
        _body(context),
      ],
    );
  }

  Widget _title(BuildContext context) {
    final primaryAttr = dotaHero?.primaryAttr;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (primaryAttr != null)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                children: [
                  Image.asset(
                    primaryAttr.iconAssetName,
                    width: 32,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      primaryAttr.titlex(context),
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Text(
            dotaHero?.localizedName?.toUpperCase() ?? '',
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

  Widget _body(BuildContext context) {
    final attackType = dotaHero?.attackType;
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: ImageFromNetwork(
            url: dotaHero?.potraitImageUrl(),
            fit: BoxFit.contain,
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
                    attackType?.svgImageAssetName ?? '',
                    width: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      attackType?.title(context).toUpperCase() ?? '',
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
