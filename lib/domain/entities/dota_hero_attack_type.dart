import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum DotaHeroAttackType {
  @JsonValue('Melee')
  melee,
  @JsonValue('Ranged')
  ranged,
  ;

  String title(BuildContext context) {
    switch (this) {
      case DotaHeroAttackType.melee:
        return AppLocalizations.of(context).attackTypeMelee;
      case DotaHeroAttackType.ranged:
        return AppLocalizations.of(context).attackTypeRanged;
    }
  }

  String get svgImageAssetName {
    switch (this) {
      case DotaHeroAttackType.melee:
        return Assets.images.melee.path;
      case DotaHeroAttackType.ranged:
        return Assets.images.ranged.path;
    }
  }
}
