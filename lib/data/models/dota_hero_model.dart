import 'package:dota_heroes/app/models/app_error.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attack_type.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/dota_hero_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dota_hero_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class DotaHeroModel extends DotaHero {
  @JsonKey(
    name: 'primary_attr',
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
  )
  final DotaHeroAttribute? primaryAttrField;

  @JsonKey(
    name: 'attack_type',
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
  )
  final DotaHeroAttackType? attackTypeField;

  @JsonKey(
    name: 'roles',
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
  )
  final List<DotaHeroRole?>? rolesField;

  const DotaHeroModel({
    super.id,
    super.name,
    super.localizedName,
    this.primaryAttrField,
    this.attackTypeField,
    this.rolesField,
    super.img,
    super.icon,
    super.baseHealth,
    super.baseHealthRegen,
    super.baseMana,
    super.baseManaRegen,
    super.baseArmor,
    super.baseMr,
    super.baseAttackMin,
    super.baseAttackMax,
    super.baseStr,
    super.baseAgi,
    super.baseInt,
    super.strGain,
    super.agiGain,
    super.intGain,
    super.attackRange,
    super.projectileSpeed,
    super.attackRate,
    super.baseAttackTime,
    super.attackPoint,
    super.moveSpeed,
    super.turnRate,
    super.cmEnabled,
    super.legs,
    super.dayVision,
    super.nightVision,
  }) : super(
          primaryAttr: primaryAttrField,
          attackType: attackTypeField,
          roles: rolesField,
        );

  factory DotaHeroModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$DotaHeroModelFromJson(json);
    } catch (error) {
      throw AppError(message: 'DotaHeroModel: $error');
    }
  }
}
