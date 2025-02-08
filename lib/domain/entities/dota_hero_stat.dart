import 'package:dota_heroes/generated/assets.gen.dart';

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
  ;

  String get iconAssetName {
    switch (this) {
      case DotaHeroStat.damage:
        return Assets.images.iconDamage.path;
      case DotaHeroStat.attackRate:
        return Assets.images.iconAttackRate.path;
      case DotaHeroStat.attackRange:
        return Assets.images.iconAttackRange.path;
      case DotaHeroStat.projectileSpeed:
        return Assets.images.iconProjectileSpeed.path;
      case DotaHeroStat.armor:
        return Assets.images.iconArmor.path;
      case DotaHeroStat.magicResistance:
        return Assets.images.iconMagicResist.path;
      case DotaHeroStat.movementSpeed:
        return Assets.images.iconMovementSpeed.path;
      case DotaHeroStat.turnRate:
        return Assets.images.iconTurnRate.path;
      case DotaHeroStat.vision:
        return Assets.images.iconVision.path;
    }
  }
}
