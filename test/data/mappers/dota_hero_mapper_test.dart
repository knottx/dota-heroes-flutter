import 'package:dota_heroes/data/mappers/dota_hero_mapper.dart';
import 'package:dota_heroes/data/models/dota_hero_model.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attack_type.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/dota_hero_role.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testModel = const DotaHeroModel(
    id: 1,
    name: 'Axe',
    localizedName: 'axe',
    primaryAttr: DotaHeroAttribute.str,
    attackType: DotaHeroAttackType.melee,
    roles: [DotaHeroRole.carry, DotaHeroRole.initiator],
    img: 'http://image.url/img.png',
    icon: 'http://image.url/icon.png',
    baseHealth: 100,
    baseHealthRegen: 1.0,
    baseMana: 50,
    baseManaRegen: 0.5,
    baseArmor: 3.0,
    baseMr: 25,
    baseAttackMin: 20,
    baseAttackMax: 30,
    baseStr: 25,
    baseAgi: 20,
    baseInt: 18,
    strGain: 2.5,
    agiGain: 1.8,
    intGain: 1.7,
    attackRange: 150,
    projectileSpeed: 300,
    attackRate: 1.7,
    baseAttackTime: 1.7,
    attackPoint: 0.3,
    moveSpeed: 310,
    turnRate: 0.6,
    cmEnabled: true,
    legs: 2,
    dayVision: 1800,
    nightVision: 800,
  );

  void expectHeroEquals(DotaHero hero) {
    expect(hero.id, equals(1));
    expect(hero.name, equals('Axe'));
    expect(hero.localizedName, equals('axe'));
    expect(hero.primaryAttr, equals(DotaHeroAttribute.str));
    expect(hero.attackType, equals(DotaHeroAttackType.melee));
    expect(hero.roles, equals([DotaHeroRole.carry, DotaHeroRole.initiator]));
    expect(hero.img, equals('http://image.url/img.png'));
    expect(hero.icon, equals('http://image.url/icon.png'));
    expect(hero.baseHealth, equals(100));
    expect(hero.baseHealthRegen, equals(1.0));
    expect(hero.baseMana, equals(50));
    expect(hero.baseManaRegen, equals(0.5));
    expect(hero.baseArmor, equals(3.0));
    expect(hero.baseMr, equals(25));
    expect(hero.baseAttackMin, equals(20));
    expect(hero.baseAttackMax, equals(30));
    expect(hero.baseStr, equals(25));
    expect(hero.baseAgi, equals(20));
    expect(hero.baseInt, equals(18));
    expect(hero.strGain, equals(2.5));
    expect(hero.agiGain, equals(1.8));
    expect(hero.intGain, equals(1.7));
    expect(hero.attackRange, equals(150));
    expect(hero.projectileSpeed, equals(300));
    expect(hero.attackRate, equals(1.7));
    expect(hero.baseAttackTime, equals(1.7));
    expect(hero.attackPoint, equals(0.3));
    expect(hero.moveSpeed, equals(310));
    expect(hero.turnRate, equals(0.6));
    expect(hero.cmEnabled, equals(true));
    expect(hero.legs, equals(2));
    expect(hero.dayVision, equals(1800));
    expect(hero.nightVision, equals(800));
  }

  group('DotaHeroMapper', () {
    test('toEntity converts DotaHeroModel to DotaHero correctly', () {
      final entity = DotaHeroMapper.toEntity(testModel);
      expectHeroEquals(entity);
    });

    test('toEntityOrNull returns null if input is null', () {
      final result = DotaHeroMapper.toEntityOrNull(null);
      expect(result, isNull);
    });

    test('toEntityOrNull converts non-null model correctly', () {
      final entity = DotaHeroMapper.toEntityOrNull(testModel);
      expect(entity, isNotNull);
      expectHeroEquals(entity!);
    });

    test('toModel converts DotaHero to DotaHeroModel correctly', () {
      final entity = DotaHeroMapper.toEntity(testModel);
      final model = DotaHeroMapper.toModel(entity);

      expect(model.id, equals(testModel.id));
      expect(model.name, equals(testModel.name));
      expect(model.localizedName, equals(testModel.localizedName));
      expect(model.primaryAttr, equals(testModel.primaryAttr));
      expect(model.attackType, equals(testModel.attackType));
      expect(model.roles, equals(testModel.roles));
      expect(model.img, equals(testModel.img));
      expect(model.icon, equals(testModel.icon));
      expect(model.baseHealth, equals(testModel.baseHealth));
      expect(model.baseHealthRegen, equals(testModel.baseHealthRegen));
      expect(model.baseMana, equals(testModel.baseMana));
      expect(model.baseManaRegen, equals(testModel.baseManaRegen));
      expect(model.baseArmor, equals(testModel.baseArmor));
      expect(model.baseMr, equals(testModel.baseMr));
      expect(model.baseAttackMin, equals(testModel.baseAttackMin));
      expect(model.baseAttackMax, equals(testModel.baseAttackMax));
      expect(model.baseStr, equals(testModel.baseStr));
      expect(model.baseAgi, equals(testModel.baseAgi));
      expect(model.baseInt, equals(testModel.baseInt));
      expect(model.strGain, equals(testModel.strGain));
      expect(model.agiGain, equals(testModel.agiGain));
      expect(model.intGain, equals(testModel.intGain));
      expect(model.attackRange, equals(testModel.attackRange));
      expect(model.projectileSpeed, equals(testModel.projectileSpeed));
      expect(model.attackRate, equals(testModel.attackRate));
      expect(model.baseAttackTime, equals(testModel.baseAttackTime));
      expect(model.attackPoint, equals(testModel.attackPoint));
      expect(model.moveSpeed, equals(testModel.moveSpeed));
      expect(model.turnRate, equals(testModel.turnRate));
      expect(model.cmEnabled, equals(testModel.cmEnabled));
      expect(model.legs, equals(testModel.legs));
      expect(model.dayVision, equals(testModel.dayVision));
      expect(model.nightVision, equals(testModel.nightVision));
    });

    test('toModelOrNull returns null if input is null', () {
      final result = DotaHeroMapper.toModelOrNull(null);
      expect(result, isNull);
    });

    test('toModelOrNull converts non-null entity correctly', () {
      final entity = DotaHeroMapper.toEntity(testModel);
      final model = DotaHeroMapper.toModelOrNull(entity);
      expect(model, isNotNull);
      expect(model!.id, equals(testModel.id));
      expect(model.name, equals(testModel.name));
    });
  });
}
