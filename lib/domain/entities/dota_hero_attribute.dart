import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/generated/assets.gen.dart';
import 'package:flutter/material.dart';

enum DotaHeroAttribute {
  str,
  agi,
  int,
  all,
  ;

  String title(BuildContext context) {
    switch (this) {
      case DotaHeroAttribute.str:
        return AppLocalizations.of(context).attribute_str;
      case DotaHeroAttribute.agi:
        return AppLocalizations.of(context).attribute_agi;
      case DotaHeroAttribute.int:
        return AppLocalizations.of(context).attribute_int;
      case DotaHeroAttribute.all:
        return AppLocalizations.of(context).attribute_universal;
    }
  }

  String get iconAssetName {
    switch (this) {
      case DotaHeroAttribute.str:
        return Assets.images.heroStrength.path;
      case DotaHeroAttribute.agi:
        return Assets.images.heroAgility.path;
      case DotaHeroAttribute.int:
        return Assets.images.heroIntelligence.path;
      case DotaHeroAttribute.all:
        return Assets.images.heroUniversal.path;
    }
  }
}
