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

  static DotaHero? toEntityOrNull(DotaHeroModel? model) {
    return (model != null) ? toEntity(model) : null;
  }

  static DotaHeroModel toModel(DotaHero entity) {
    return DotaHeroModel(
      id: entity.id,
      name: entity.name,
      localizedName: entity.localizedName,
      primaryAttr: entity.primaryAttr,
      attackType: entity.attackType,
      roles: entity.roles,
      img: entity.img,
      icon: entity.icon,
      baseHealth: entity.baseHealth,
      baseHealthRegen: entity.baseHealthRegen,
      baseMana: entity.baseMana,
      baseManaRegen: entity.baseManaRegen,
      baseArmor: entity.baseArmor,
      baseMr: entity.baseMr,
      baseAttackMin: entity.baseAttackMin,
      baseAttackMax: entity.baseAttackMax,
      baseStr: entity.baseStr,
      baseAgi: entity.baseAgi,
      baseInt: entity.baseInt,
      strGain: entity.strGain,
      agiGain: entity.agiGain,
      intGain: entity.intGain,
      attackRange: entity.attackRange,
      projectileSpeed: entity.projectileSpeed,
      attackRate: entity.attackRate,
      baseAttackTime: entity.baseAttackTime,
      attackPoint: entity.attackPoint,
      moveSpeed: entity.moveSpeed,
      turnRate: entity.turnRate,
      cmEnabled: entity.cmEnabled,
      legs: entity.legs,
      dayVision: entity.dayVision,
      nightVision: entity.nightVision,
    );
  }

  static DotaHeroModel? toModelOrNull(DotaHero? entity) {
    return (entity != null) ? toModel(entity) : null;
  }
}
