import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/data/models/dota_hero_model.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attack_type.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/dota_hero_role.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DotaHeroModel', () {
    test('should deserialize a valid JSON correctly', () {
      final json = {
        'id': 1,
        'name': 'npc_dota_hero_axe',
        'localized_name': 'Axe',
        'primary_attr': 'str',
        'attack_type': 'Melee',
        'roles': ['Initiator', 'Durable'],
        'img': '/apps/dota2/images/heroes/axe_full.png',
        'icon': '/apps/dota2/images/heroes/axe_icon.png',
        'base_health': 200,
        'base_health_regen': 2.5,
        'base_mana': 75,
        'base_mana_regen': 0.9,
        'base_armor': -1,
        'base_mr': 25,
        'base_attack_min': 27,
        'base_attack_max': 31,
        'base_str': 25,
        'base_agi': 20,
        'base_int': 18,
        'str_gain': 2.8,
        'agi_gain': 2.2,
        'int_gain': 1.6,
        'attack_range': 150,
        'projectile_speed': 0,
        'attack_rate': 1.7,
        'base_attack_time': 1.9,
        'attack_point': 0.5,
        'move_speed': 310,
        'turn_rate': 0.6,
        'cm_enabled': true,
        'legs': 2,
        'day_vision': 1800,
        'night_vision': 800,
      };

      final model = DotaHeroModel.fromJson(json);

      expect(model.id, 1);
      expect(model.name, 'npc_dota_hero_axe');
      expect(model.localizedName, 'Axe');
      expect(model.primaryAttr, DotaHeroAttribute.strength);
      expect(model.attackType, DotaHeroAttackType.melee);
      expect(model.roles, [DotaHeroRole.initiator, DotaHeroRole.durable]);
      expect(model.img, '/apps/dota2/images/heroes/axe_full.png');
      expect(model.icon, '/apps/dota2/images/heroes/axe_icon.png');
      expect(model.baseHealth, 200);
      expect(model.baseHealthRegen, 2.5);
      expect(model.baseMana, 75);
      expect(model.baseManaRegen, 0.9);
      expect(model.baseArmor, -1);
      expect(model.baseMr, 25);
      expect(model.baseAttackMin, 27);
      expect(model.baseAttackMax, 31);
      expect(model.baseStr, 25);
      expect(model.baseAgi, 20);
      expect(model.baseInt, 18);
      expect(model.strGain, 2.8);
      expect(model.agiGain, 2.2);
      expect(model.intGain, 1.6);
      expect(model.attackRange, 150);
      expect(model.projectileSpeed, 0);
      expect(model.attackRate, 1.7);
      expect(model.baseAttackTime, 1.9);
      expect(model.attackPoint, 0.5);
      expect(model.moveSpeed, 310);
      expect(model.turnRate, 0.6);
      expect(model.cmEnabled, true);
      expect(model.legs, 2);
      expect(model.dayVision, 1800);
      expect(model.nightVision, 800);
    });

    test('should throw AppError when given invalid JSON', () {
      final invalidJson = {
        'id': '1',
        'name': 'npc_dota_hero_axe',
      };

      expect(
        () => DotaHeroModel.fromJson(invalidJson),
        throwsA(isA<AppError>()),
      );
    });
  });
}
