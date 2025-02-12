// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_hero_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DotaHeroModel _$DotaHeroModelFromJson(Map<String, dynamic> json) =>
    DotaHeroModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      localizedName: json['localized_name'] as String?,
      primaryAttr: $enumDecodeNullable(
          _$DotaHeroAttributeEnumMap, json['primary_attr'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      attackType: $enumDecodeNullable(
          _$DotaHeroAttackTypeEnumMap, json['attack_type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$DotaHeroRoleEnumMap, e,
              unknownValue: JsonKey.nullForUndefinedEnumValue))
          .toList(),
      img: json['img'] as String?,
      icon: json['icon'] as String?,
      baseHealth: json['base_health'] as num?,
      baseHealthRegen: json['base_health_regen'] as num?,
      baseMana: json['base_mana'] as num?,
      baseManaRegen: json['base_mana_regen'] as num?,
      baseArmor: json['base_armor'] as num?,
      baseMr: json['base_mr'] as num?,
      baseAttackMin: json['base_attack_min'] as num?,
      baseAttackMax: json['base_attack_max'] as num?,
      baseStr: json['base_str'] as num?,
      baseAgi: json['base_agi'] as num?,
      baseInt: json['base_int'] as num?,
      strGain: json['str_gain'] as num?,
      agiGain: json['agi_gain'] as num?,
      intGain: json['int_gain'] as num?,
      attackRange: json['attack_range'] as num?,
      projectileSpeed: json['projectile_speed'] as num?,
      attackRate: json['attack_rate'] as num?,
      baseAttackTime: json['base_attack_time'] as num?,
      attackPoint: json['attack_point'] as num?,
      moveSpeed: json['move_speed'] as num?,
      turnRate: json['turn_rate'] as num?,
      cmEnabled: json['cm_enabled'] as bool?,
      legs: json['legs'] as num?,
      dayVision: json['day_vision'] as num?,
      nightVision: json['night_vision'] as num?,
    );

Map<String, dynamic> _$DotaHeroModelToJson(DotaHeroModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.localizedName case final value?) 'localized_name': value,
      if (_$DotaHeroAttributeEnumMap[instance.primaryAttr] case final value?)
        'primary_attr': value,
      if (_$DotaHeroAttackTypeEnumMap[instance.attackType] case final value?)
        'attack_type': value,
      if (instance.roles?.map((e) => _$DotaHeroRoleEnumMap[e]).toList()
          case final value?)
        'roles': value,
      if (instance.img case final value?) 'img': value,
      if (instance.icon case final value?) 'icon': value,
      if (instance.baseHealth case final value?) 'base_health': value,
      if (instance.baseHealthRegen case final value?)
        'base_health_regen': value,
      if (instance.baseMana case final value?) 'base_mana': value,
      if (instance.baseManaRegen case final value?) 'base_mana_regen': value,
      if (instance.baseArmor case final value?) 'base_armor': value,
      if (instance.baseMr case final value?) 'base_mr': value,
      if (instance.baseAttackMin case final value?) 'base_attack_min': value,
      if (instance.baseAttackMax case final value?) 'base_attack_max': value,
      if (instance.baseStr case final value?) 'base_str': value,
      if (instance.baseAgi case final value?) 'base_agi': value,
      if (instance.baseInt case final value?) 'base_int': value,
      if (instance.strGain case final value?) 'str_gain': value,
      if (instance.agiGain case final value?) 'agi_gain': value,
      if (instance.intGain case final value?) 'int_gain': value,
      if (instance.attackRange case final value?) 'attack_range': value,
      if (instance.projectileSpeed case final value?) 'projectile_speed': value,
      if (instance.attackRate case final value?) 'attack_rate': value,
      if (instance.baseAttackTime case final value?) 'base_attack_time': value,
      if (instance.attackPoint case final value?) 'attack_point': value,
      if (instance.moveSpeed case final value?) 'move_speed': value,
      if (instance.turnRate case final value?) 'turn_rate': value,
      if (instance.cmEnabled case final value?) 'cm_enabled': value,
      if (instance.legs case final value?) 'legs': value,
      if (instance.dayVision case final value?) 'day_vision': value,
      if (instance.nightVision case final value?) 'night_vision': value,
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
