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
      primaryAttrField: $enumDecodeNullable(
          _$DotaHeroAttributeEnumMap, json['primary_attr'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      attackTypeField: $enumDecodeNullable(
          _$DotaHeroAttackTypeEnumMap, json['attack_type'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      rolesField: (json['roles'] as List<dynamic>?)
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
