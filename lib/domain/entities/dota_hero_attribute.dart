import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum DotaHeroAttribute {
  @JsonValue('str')
  strength,
  @JsonValue('agi')
  agility,
  @JsonValue('int')
  intelligence,
  @JsonValue('all')
  universal,
  ;

  String titlex(BuildContext context) {
    switch (this) {
      case DotaHeroAttribute.strength:
        return AppLocalizations.of(context).attributeStr;
      case DotaHeroAttribute.agility:
        return AppLocalizations.of(context).attributeAgi;
      case DotaHeroAttribute.intelligence:
        return AppLocalizations.of(context).attributeInt;
      case DotaHeroAttribute.universal:
        return AppLocalizations.of(context).attributeUniversal;
    }
  }

  String get iconAssetName {
    switch (this) {
      case DotaHeroAttribute.strength:
        return Assets.images.heroStrength.path;
      case DotaHeroAttribute.agility:
        return Assets.images.heroAgility.path;
      case DotaHeroAttribute.intelligence:
        return Assets.images.heroIntelligence.path;
      case DotaHeroAttribute.universal:
        return Assets.images.heroUniversal.path;
    }
  }
}
