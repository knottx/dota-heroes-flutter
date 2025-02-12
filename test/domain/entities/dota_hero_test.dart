import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DotaHero', () {
    test('health calculation is correct', () {
      final hero = const DotaHero(
        baseHealth: 200,
        baseStr: 25,
      );

      final health = hero.health();

      expect(health, 700); // 200 + (25 * 20)
    });

    test('health regen calculation is correct', () {
      final hero = const DotaHero(
        baseHealthRegen: 1.0,
        baseStr: 30,
      );

      final healthRegen = hero.healthRegen();

      expect(healthRegen, 4.0); // 1.0 + (30 * 0.1)
    });

    test('mana calculation is correct', () {
      final hero = const DotaHero(
        baseMana: 75,
        baseInt: 20,
      );

      final mana = hero.mana();

      expect(mana, 315); // 75 + (20 * 12)
    });

    test('mana regen calculation is correct', () {
      final hero = const DotaHero(
        baseManaRegen: 1.0,
        baseInt: 15,
      );

      final manaRegen = hero.manaRegen();

      expect(manaRegen, 1.75); // 1.0 + (15 * 0.05)
    });

    test('armor calculation is correct', () {
      final hero = const DotaHero(
        baseArmor: 2.0,
        baseAgi: 18,
      );

      final armor = hero.armor();

      expect(armor, 5.006); // 2.0 + (18 * 0.167)
    });

    test('attackMin calculation is correct for primaryAttr = strength', () {
      final hero = const DotaHero(
        primaryAttr: DotaHeroAttribute.strength,
        baseAttackMin: 20,
        baseStr: 30,
      );

      final attackMin = hero.attackMin();

      expect(attackMin, 50); // 20 + 30
    });

    test('attackMax calculation is correct for primaryAttr = agility', () {
      final hero = const DotaHero(
        primaryAttr: DotaHeroAttribute.agility,
        baseAttackMax: 30,
        baseAgi: 25,
      );

      final attackMax = hero.attackMax();

      expect(attackMax, 55); // 30 + 25
    });

    test('universal hero attackMin calculation is correct', () {
      final hero = const DotaHero(
        primaryAttr: DotaHeroAttribute.universal,
        baseAttackMin: 10,
        baseStr: 20,
        baseAgi: 15,
        baseInt: 25,
      );

      final attackMin = hero.attackMin();

      expect(attackMin, 46); // 10 + (20 * 0.6) + (15 * 0.6) + (25 * 0.6)
    });
  });
}
