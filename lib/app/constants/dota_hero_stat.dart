import 'package:dota_heroes/resources/resources.dart';

enum DotaHeroStat {
  damage,
  attackRate,
  attackRange,
  projectileSpeed,
  armor,
  magicResistance,
  movementSpeed,
  turnRate,
  vision,
}

extension DotaHeroStatExtension on DotaHeroStat {
  String get iconAssetName {
    switch (this) {
      case DotaHeroStat.damage:
        return ImageName.iconDamage;
      case DotaHeroStat.attackRate:
        return ImageName.iconAttackRate;
      case DotaHeroStat.attackRange:
        return ImageName.iconAttackRange;
      case DotaHeroStat.projectileSpeed:
        return ImageName.iconProjectileSpeed;
      case DotaHeroStat.armor:
        return ImageName.iconArmor;
      case DotaHeroStat.magicResistance:
        return ImageName.iconMagicResist;
      case DotaHeroStat.movementSpeed:
        return ImageName.iconMovementSpeed;
      case DotaHeroStat.turnRate:
        return ImageName.iconTurnRate;
      case DotaHeroStat.vision:
        return ImageName.iconVision;
    }
  }
}
