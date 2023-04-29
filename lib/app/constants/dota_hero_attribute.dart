import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/resources/resources.dart';
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
        return ImageName.heroStrength;
      case DotaHeroAttribute.agility:
        return ImageName.heroAgility;
      case DotaHeroAttribute.intelligence:
        return ImageName.heroIntelligence;
      case DotaHeroAttribute.universal:
        return ImageName.heroUniversal;
    }
  }
}
