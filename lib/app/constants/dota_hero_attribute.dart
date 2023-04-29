import 'package:dota_heroes/resources/resources.dart';

enum DotaHeroAttribute {
  strength,
  agility,
  intelligence,
  universal,
}

extension DotaHeroAttributeExtension on DotaHeroAttribute {
  String get keyValue {
    switch (this) {
      case DotaHeroAttribute.strength:
        return 'str';
      case DotaHeroAttribute.agility:
        return 'agi';
      case DotaHeroAttribute.intelligence:
        return 'int';
      case DotaHeroAttribute.universal:
        return 'all';
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

  String get title {
    switch (this) {
      case DotaHeroAttribute.strength:
        return 'STRENGTH';
      case DotaHeroAttribute.agility:
        return 'AGILITY';
      case DotaHeroAttribute.intelligence:
        return 'INTELLIGENCE';
      case DotaHeroAttribute.universal:
        return 'UNIVERSAL';
    }
  }
}
