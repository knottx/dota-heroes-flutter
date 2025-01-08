import 'package:dota_heroes/data/models/dota_hero_model.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';

class DotaHeroMapper {
  DotaHeroMapper._();

  static DotaHero toEntity(DotaHeroModel model) {
    return DotaHero(
      id: model.id,
      name: model.name,
      localizedName: model.localizedName,
      primaryAttr: model.primaryAttr,
      attackType: model.attackType,
      roles: model.roles,
      img: model.img,
      icon: model.icon,
      baseHealth: model.baseHealth,
      baseHealthRegen: model.baseHealthRegen,
      baseMana: model.baseMana,
      baseManaRegen: model.baseManaRegen,
      baseArmor: model.baseArmor,
      baseMr: model.baseMr,
      baseAttackMin: model.baseAttackMin,
      baseAttackMax: model.baseAttackMax,
      baseStr: model.baseStr,
      baseAgi: model.baseAgi,
      baseInt: model.baseInt,
      strGain: model.strGain,
      agiGain: model.agiGain,
      intGain: model.intGain,
      attackRange: model.attackRange,
      projectileSpeed: model.projectileSpeed,
      attackRate: model.attackRate,
      baseAttackTime: model.baseAttackTime,
      attackPoint: model.attackPoint,
      moveSpeed: model.moveSpeed,
      turnRate: model.turnRate,
      cmEnabled: model.cmEnabled,
      legs: model.legs,
      dayVision: model.dayVision,
      nightVision: model.nightVision,
    );
  }
}
