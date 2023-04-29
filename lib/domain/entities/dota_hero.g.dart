// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DotaHero _$DotaHeroFromJson(Map<String, dynamic> json) => DotaHero(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      localizedName: json['localizedName'] as String?,
      primaryAttr:
          $enumDecodeNullable(_$DotaHeroAttributeEnumMap, json['primaryAttr']),
      attackType:
          $enumDecodeNullable(_$DotaHeroAttackTypeEnumMap, json['attackType']),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$DotaHeroRoleEnumMap, e))
          .toList(),
      img: json['img'] as String?,
      icon: json['icon'] as String?,
      baseHealth: json['baseHealth'] as num?,
      baseHealthRegen: json['baseHealthRegen'] as num?,
      baseMana: json['baseMana'] as num?,
      baseManaRegen: json['baseManaRegen'] as num?,
      baseArmor: json['baseArmor'] as num?,
      baseMr: json['baseMr'] as num?,
      baseAttackMin: json['baseAttackMin'] as num?,
      baseAttackMax: json['baseAttackMax'] as num?,
      baseStr: json['baseStr'] as num?,
      baseAgi: json['baseAgi'] as num?,
      baseInt: json['baseInt'] as num?,
      strGain: json['strGain'] as num?,
      agiGain: json['agiGain'] as num?,
      intGain: json['intGain'] as num?,
      attackRange: json['attackRange'] as num?,
      projectileSpeed: json['projectileSpeed'] as num?,
      attackRate: json['attackRate'] as num?,
      baseAttackTime: json['baseAttackTime'] as num?,
      attackPoint: json['attackPoint'] as num?,
      moveSpeed: json['moveSpeed'] as num?,
      turnRate: json['turnRate'] as num?,
      cmEnabled: json['cmEnabled'] as bool?,
      legs: json['legs'] as num?,
      dayVision: json['dayVision'] as num?,
      nightVision: json['nightVision'] as num?,
    );

Map<String, dynamic> _$DotaHeroToJson(DotaHero instance) => <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.localizedName case final value?) 'localizedName': value,
      if (_$DotaHeroAttributeEnumMap[instance.primaryAttr] case final value?)
        'primaryAttr': value,
      if (_$DotaHeroAttackTypeEnumMap[instance.attackType] case final value?)
        'attackType': value,
      if (instance.roles?.map((e) => _$DotaHeroRoleEnumMap[e]).toList()
          case final value?)
        'roles': value,
      if (instance.img case final value?) 'img': value,
      if (instance.icon case final value?) 'icon': value,
      if (instance.baseHealth case final value?) 'baseHealth': value,
      if (instance.baseHealthRegen case final value?) 'baseHealthRegen': value,
      if (instance.baseMana case final value?) 'baseMana': value,
      if (instance.baseManaRegen case final value?) 'baseManaRegen': value,
      if (instance.baseArmor case final value?) 'baseArmor': value,
      if (instance.baseMr case final value?) 'baseMr': value,
      if (instance.baseAttackMin case final value?) 'baseAttackMin': value,
      if (instance.baseAttackMax case final value?) 'baseAttackMax': value,
      if (instance.baseStr case final value?) 'baseStr': value,
      if (instance.baseAgi case final value?) 'baseAgi': value,
      if (instance.baseInt case final value?) 'baseInt': value,
      if (instance.strGain case final value?) 'strGain': value,
      if (instance.agiGain case final value?) 'agiGain': value,
      if (instance.intGain case final value?) 'intGain': value,
      if (instance.attackRange case final value?) 'attackRange': value,
      if (instance.projectileSpeed case final value?) 'projectileSpeed': value,
      if (instance.attackRate case final value?) 'attackRate': value,
      if (instance.baseAttackTime case final value?) 'baseAttackTime': value,
      if (instance.attackPoint case final value?) 'attackPoint': value,
      if (instance.moveSpeed case final value?) 'moveSpeed': value,
      if (instance.turnRate case final value?) 'turnRate': value,
      if (instance.cmEnabled case final value?) 'cmEnabled': value,
      if (instance.legs case final value?) 'legs': value,
      if (instance.dayVision case final value?) 'dayVision': value,
      if (instance.nightVision case final value?) 'nightVision': value,
    };

const _$DotaHeroAttributeEnumMap = {
  DotaHeroAttribute.strength: 'str',
  DotaHeroAttribute.agility: 'agi',
  DotaHeroAttribute.intelligence: 'int',
  DotaHeroAttribute.universal: 'all',
};

const _$DotaHeroAttackTypeEnumMap = {
  DotaHeroAttackType.melee: 'Melee',
  DotaHeroAttackType.ranged: 'Ranged',
};

const _$DotaHeroRoleEnumMap = {
  DotaHeroRole.carry: 'Carry',
  DotaHeroRole.support: 'Support',
  DotaHeroRole.nuker: 'Nuker',
  DotaHeroRole.disabler: 'Disabler',
  DotaHeroRole.jungler: 'Jungler',
  DotaHeroRole.durable: 'Durable',
  DotaHeroRole.escape: 'Escape',
  DotaHeroRole.pusher: 'Pusher',
  DotaHeroRole.initiator: 'Initiator',
};
