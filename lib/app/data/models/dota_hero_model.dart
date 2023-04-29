import 'package:dota_heroes/app/constants/app_constants.dart';
import 'package:dota_heroes/app/constants/dota_hero_attack_type.dart';
import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/constants/dota_hero_role.dart';
import 'package:get/get.dart';

class DotaHero {
  int? id;
  String? name;
  String? localizedName;
  String? _primaryAttr;
  String? _attackType;
  List<String>? _roles;
  String? img;
  String? icon;
  double? baseHealth;
  double? baseHealthRegen;
  double? baseMana;
  double? baseManaRegen;
  double? baseArmor;
  double? baseMr;
  double? baseAttackMin;
  double? baseAttackMax;
  double? baseStr;
  double? baseAgi;
  double? baseInt;
  double? strGain;
  double? agiGain;
  double? intGain;
  double? attackRange;
  double? projectileSpeed;
  double? attackRate;
  double? baseAttackTime;
  double? attackPoint;
  double? moveSpeed;
  double? turnRate;
  bool? cmEnabled;
  int? legs;
  double? dayVision;
  double? nightVision;
  int? heroId;
  int? turboPicks;
  int? turboWins;
  int? proBan;
  int? proWin;
  int? proPick;
  int? i1Pick;
  int? i1Win;
  int? i2Pick;
  int? i2Win;
  int? i3Pick;
  int? i3Win;
  int? i4Pick;
  int? i4Win;
  int? i5Pick;
  int? i5Win;
  int? i6Pick;
  int? i6Win;
  int? i7Pick;
  int? i7Win;
  int? i8Pick;
  int? i8Win;
  int? nullPick;
  int? nullWin;

  DotaHero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    _primaryAttr = json['primary_attr'];
    _attackType = json['attack_type'];
    _roles = json['roles']?.cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = (json['base_health'] as num?)?.toDouble();
    baseHealthRegen = (json['base_health_regen'] as num?)?.toDouble();
    baseMana = (json['base_mana'] as num?)?.toDouble();
    baseManaRegen = (json['base_mana_regen'] as num?)?.toDouble();
    baseArmor = (json['base_armor'] as num?)?.toDouble();
    baseMr = (json['base_mr'] as num?)?.toDouble();
    baseAttackMin = (json['base_attack_min'] as num?)?.toDouble();
    baseAttackMax = (json['base_attack_max'] as num?)?.toDouble();
    baseStr = (json['base_str'] as num?)?.toDouble();
    baseAgi = (json['base_agi'] as num?)?.toDouble();
    baseInt = (json['base_int'] as num?)?.toDouble();
    strGain = (json['str_gain'] as num?)?.toDouble();
    agiGain = (json['agi_gain'] as num?)?.toDouble();
    intGain = (json['int_gain'] as num?)?.toDouble();
    attackRange = (json['attack_range'] as num?)?.toDouble();
    projectileSpeed = (json['projectile_speed'] as num?)?.toDouble();
    attackRate = (json['attack_rate'] as num?)?.toDouble();
    baseAttackTime = (json['base_attack_time'] as num?)?.toDouble();
    attackPoint = (json['attack_point'] as num?)?.toDouble();
    moveSpeed = (json['move_speed'] as num?)?.toDouble();
    turnRate = (json['turn_rate'] as num?)?.toDouble();
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
    dayVision = (json['day_vision'] as num?)?.toDouble();
    nightVision = (json['night_vision'] as num?)?.toDouble();
    heroId = json['hero_id'];
    turboPicks = json['turbo_picks'];
    turboWins = json['turbo_wins'];
    proBan = json['pro_ban'];
    proWin = json['pro_win'];
    proPick = json['pro_pick'];
    i1Pick = json['1_pick'];
    i1Win = json['1_win'];
    i2Pick = json['2_pick'];
    i2Win = json['2_win'];
    i3Pick = json['3_pick'];
    i3Win = json['3_win'];
    i4Pick = json['4_pick'];
    i4Win = json['4_win'];
    i5Pick = json['5_pick'];
    i5Win = json['5_win'];
    i6Pick = json['6_pick'];
    i6Win = json['6_win'];
    i7Pick = json['7_pick'];
    i7Win = json['7_win'];
    i8Pick = json['8_pick'];
    i8Win = json['8_win'];
    nullPick = json['null_pick'];
    nullWin = json['null_win'];
  }
}

extension DotaHeroExtension on DotaHero {
  String get potraitImageUrl {
    final path = img?.replaceAll(
      '/apps/dota2/images/dota_react/heroes/',
      '/apps/dota2/videos/dota_react/heroes/renders/',
    );
    return 'https://cdn.cloudflare.steamstatic.com${path ?? ''}';
  }

  String get potraitVideoUrl {
    return potraitImageUrl.replaceAll(
      '.png',
      '.webm',
    );
  }

  String get imageUrl {
    return '${AppConstants.baseUrl}${img ?? ''}';
  }

  DotaHeroAttribute? get primaryAttr {
    return DotaHeroAttribute.values.firstWhereOrNull(
      (e) => e.keyValue == _primaryAttr,
    );
  }

  DotaHeroAttackType? get attackType {
    return DotaHeroAttackType.values.firstWhereOrNull(
      (e) => e.keyValue == _attackType,
    );
  }

  List<DotaHeroRole> get roles {
    return DotaHeroRole.values
        .where((e) => (_roles ?? []).contains(e.keyValue))
        .toList();
  }

  double get health {
    return (baseHealth ?? 0) + ((baseStr ?? 0) * 20.0);
  }

  double get healthRegen {
    return (baseHealthRegen ?? 0) + ((baseStr ?? 0) * 0.1);
  }

  double get mana {
    return (baseMana ?? 0) + ((baseInt ?? 0) * 12.0);
  }

  double get manaRegen {
    return (baseManaRegen ?? 0) + ((baseInt ?? 0) * 0.05);
  }

  double get armor {
    return (baseArmor ?? 0) + ((baseAgi ?? 0) * 0.167);
  }

  double get attackMin {
    switch (primaryAttr) {
      case DotaHeroAttribute.strength:
        return (baseAttackMin ?? 0) + (baseStr ?? 0);
      case DotaHeroAttribute.agility:
        return (baseAttackMin ?? 0) + (baseAgi ?? 0);
      case DotaHeroAttribute.intelligence:
        return (baseAttackMin ?? 0) + (baseInt ?? 0);
      case DotaHeroAttribute.universal:
        return (baseAttackMin ?? 0) +
            ((baseStr ?? 0) * 0.6) +
            ((baseAgi ?? 0) * 0.6) +
            ((baseInt ?? 0) * 0.6);
      default:
        return (baseAttackMin ?? 0);
    }
  }

  double get attackMax {
    switch (primaryAttr) {
      case DotaHeroAttribute.strength:
        return (baseAttackMax ?? 0) + (baseStr ?? 0);
      case DotaHeroAttribute.agility:
        return (baseAttackMax ?? 0) + (baseAgi ?? 0);
      case DotaHeroAttribute.intelligence:
        return (baseAttackMax ?? 0) + (baseInt ?? 0);
      case DotaHeroAttribute.universal:
        return (baseAttackMax ?? 0) +
            ((baseStr ?? 0) * 0.6) +
            ((baseAgi ?? 0) * 0.6) +
            ((baseInt ?? 0) * 0.6);
      default:
        return (baseAttackMax ?? 0);
    }
  }
}
