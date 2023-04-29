import 'package:dota_heroes/app/constants/app_constants.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attack_type.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/dota_hero_role.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dota_hero.g.dart';

@JsonSerializable()
class DotaHero extends Equatable {
  final int? id;
  final String? name;
  final String? localizedName;
  final DotaHeroAttribute? primaryAttr;
  final DotaHeroAttackType? attackType;
  final List<DotaHeroRole?>? roles;
  final String? img;
  final String? icon;
  final num? baseHealth;
  final num? baseHealthRegen;
  final num? baseMana;
  final num? baseManaRegen;
  final num? baseArmor;
  final num? baseMr;
  final num? baseAttackMin;
  final num? baseAttackMax;
  final num? baseStr;
  final num? baseAgi;
  final num? baseInt;
  final num? strGain;
  final num? agiGain;
  final num? intGain;
  final num? attackRange;
  final num? projectileSpeed;
  final num? attackRate;
  final num? baseAttackTime;
  final num? attackPoint;
  final num? moveSpeed;
  final num? turnRate;
  final bool? cmEnabled;
  final num? legs;
  final num? dayVision;
  final num? nightVision;

  const DotaHero({
    this.id,
    this.name,
    this.localizedName,
    this.primaryAttr,
    this.attackType,
    this.roles,
    this.img,
    this.icon,
    this.baseHealth,
    this.baseHealthRegen,
    this.baseMana,
    this.baseManaRegen,
    this.baseArmor,
    this.baseMr,
    this.baseAttackMin,
    this.baseAttackMax,
    this.baseStr,
    this.baseAgi,
    this.baseInt,
    this.strGain,
    this.agiGain,
    this.intGain,
    this.attackRange,
    this.projectileSpeed,
    this.attackRate,
    this.baseAttackTime,
    this.attackPoint,
    this.moveSpeed,
    this.turnRate,
    this.cmEnabled,
    this.legs,
    this.dayVision,
    this.nightVision,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        localizedName,
        primaryAttr,
        attackType,
        roles,
        img,
        icon,
        baseHealth,
        baseHealthRegen,
        baseMana,
        baseManaRegen,
        baseArmor,
        baseMr,
        baseAttackMin,
        baseAttackMax,
        baseStr,
        baseAgi,
        baseInt,
        strGain,
        agiGain,
        intGain,
        attackRange,
        projectileSpeed,
        attackRate,
        baseAttackTime,
        attackPoint,
        moveSpeed,
        turnRate,
        cmEnabled,
        legs,
        dayVision,
        nightVision,
      ];

  factory DotaHero.fromJson(Map<String, dynamic> json) =>
      _$DotaHeroFromJson(json);

  Map<String, dynamic> toJson() => _$DotaHeroToJson(this);

  String potraitImageUrl() {
    final path = img?.replaceAll(
      '/apps/dota2/images/dota_react/heroes/',
      '/apps/dota2/videos/dota_react/heroes/renders/',
    );
    return '${AppConstants.imageBaseUrl}${path ?? ''}';
  }

  String potraitVideoUrl() {
    return potraitImageUrl().replaceAll(
      '.png',
      '.webm',
    );
  }

  String imageUrl() {
    return '${AppConstants.imageBaseUrl}${img ?? ''}';
  }

  num health() {
    return (baseHealth ?? 0) + ((baseStr ?? 0) * 20.0);
  }

  num healthRegen() {
    return (baseHealthRegen ?? 0) + ((baseStr ?? 0) * 0.1);
  }

  num mana() {
    return (baseMana ?? 0) + ((baseInt ?? 0) * 12.0);
  }

  num manaRegen() {
    return (baseManaRegen ?? 0) + ((baseInt ?? 0) * 0.05);
  }

  num armor() {
    return (baseArmor ?? 0) + ((baseAgi ?? 0) * 0.167);
  }

  num attackMin() {
    switch (primaryAttr) {
      case DotaHeroAttribute.strength:
        return (baseAttackMin ?? 0) + (baseStr ?? 0);
      case DotaHeroAttribute.agility:
        return (baseAttackMin ?? 0) + (baseAgi ?? 0);
      case DotaHeroAttribute.intelligence:
        return (baseAttackMin ?? 0) + (baseInt ?? 0);
      case DotaHeroAttribute.universal:
        return (baseAttackMin ?? 0) +
            ((baseStr ?? 0) * 0.6) +
            ((baseAgi ?? 0) * 0.6) +
            ((baseInt ?? 0) * 0.6);
      default:
        return (baseAttackMin ?? 0);
    }
  }

  num attackMax() {
    switch (primaryAttr) {
      case DotaHeroAttribute.strength:
        return (baseAttackMax ?? 0) + (baseStr ?? 0);
      case DotaHeroAttribute.agility:
        return (baseAttackMax ?? 0) + (baseAgi ?? 0);
      case DotaHeroAttribute.intelligence:
        return (baseAttackMax ?? 0) + (baseInt ?? 0);
      case DotaHeroAttribute.universal:
        return (baseAttackMax ?? 0) +
            ((baseStr ?? 0) * 0.6) +
            ((baseAgi ?? 0) * 0.6) +
            ((baseInt ?? 0) * 0.6);
      default:
        return (baseAttackMax ?? 0);
    }
  }
}
