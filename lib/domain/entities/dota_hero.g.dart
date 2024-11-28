// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dota_hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DotaHero _$DotaHeroFromJson(Map<String, dynamic> json) => DotaHero(
      id: json['id'] as num?,
      name: json['name'] as String?,
      localizedName: json['localized_name'] as String?,
      primaryAttr:
          $enumDecodeNullable(_$DotaHeroAttributeEnumMap, json['primary_attr']),
      attackType:
          $enumDecodeNullable(_$DotaHeroAttackTypeEnumMap, json['attack_type']),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$DotaHeroRoleEnumMap, e))
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

Map<String, dynamic> _$DotaHeroToJson(DotaHero instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('localized_name', instance.localizedName);
  writeNotNull(
      'primary_attr', _$DotaHeroAttributeEnumMap[instance.primaryAttr]);
  writeNotNull('attack_type', _$DotaHeroAttackTypeEnumMap[instance.attackType]);
  writeNotNull(
      'roles', instance.roles?.map((e) => _$DotaHeroRoleEnumMap[e]).toList());
  writeNotNull('img', instance.img);
  writeNotNull('icon', instance.icon);
  writeNotNull('base_health', instance.baseHealth);
  writeNotNull('base_health_regen', instance.baseHealthRegen);
  writeNotNull('base_mana', instance.baseMana);
  writeNotNull('base_mana_regen', instance.baseManaRegen);
  writeNotNull('base_armor', instance.baseArmor);
  writeNotNull('base_mr', instance.baseMr);
  writeNotNull('base_attack_min', instance.baseAttackMin);
  writeNotNull('base_attack_max', instance.baseAttackMax);
  writeNotNull('base_str', instance.baseStr);
  writeNotNull('base_agi', instance.baseAgi);
  writeNotNull('base_int', instance.baseInt);
  writeNotNull('str_gain', instance.strGain);
  writeNotNull('agi_gain', instance.agiGain);
  writeNotNull('int_gain', instance.intGain);
  writeNotNull('attack_range', instance.attackRange);
  writeNotNull('projectile_speed', instance.projectileSpeed);
  writeNotNull('attack_rate', instance.attackRate);
  writeNotNull('base_attack_time', instance.baseAttackTime);
  writeNotNull('attack_point', instance.attackPoint);
  writeNotNull('move_speed', instance.moveSpeed);
  writeNotNull('turn_rate', instance.turnRate);
  writeNotNull('cm_enabled', instance.cmEnabled);
  writeNotNull('legs', instance.legs);
  writeNotNull('day_vision', instance.dayVision);
  writeNotNull('night_vision', instance.nightVision);
  return val;
}

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
