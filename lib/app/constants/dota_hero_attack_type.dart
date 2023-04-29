import 'package:dota_heroes/resources/resources.dart';

enum DotaHeroAttackType {
  melee,
  ranged,
}

extension DotaHeroAttackTypeExtension on DotaHeroAttackType {
  String get keyValue {
    switch (this) {
      case DotaHeroAttackType.melee:
        return 'Melee';
      case DotaHeroAttackType.ranged:
        return 'Ranged';
    }
  }

  String get svgImageAssetName {
    switch (this) {
      case DotaHeroAttackType.melee:
        return SVGImageName.melee;
      case DotaHeroAttackType.ranged:
        return SVGImageName.ranged;
    }
  }

  String get title {
    switch (this) {
      case DotaHeroAttackType.melee:
        return 'Melee';
      case DotaHeroAttackType.ranged:
        return 'Ranged';
    }
  }
}
