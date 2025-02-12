import 'package:dota_heroes/common/codable.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attack_type.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/dota_hero_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dota_hero_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class DotaHeroModel {
  final int? id;
  final String? name;
  final String? localizedName;
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final DotaHeroAttribute? primaryAttr;
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
  final DotaHeroAttackType? attackType;
  @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
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

  const DotaHeroModel({
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

  factory DotaHeroModel.fromJson(Map<String, dynamic> json) {
    return Codable.decode(_$DotaHeroModelFromJson, json);
  }

  Map<String, dynamic> toJson() => _$DotaHeroModelToJson(this);
}
