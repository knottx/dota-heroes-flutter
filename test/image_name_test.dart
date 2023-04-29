import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:dota_heroes/resources/resources.dart';

void main() {
  test('image_name assets test', () {
    expect(File(ImageName.background).existsSync(), true);
    expect(File(ImageName.dota2Logo).existsSync(), true);
    expect(File(ImageName.dota2LogoColor).existsSync(), true);
    expect(File(ImageName.heroAgility).existsSync(), true);
    expect(File(ImageName.heroIntelligence).existsSync(), true);
    expect(File(ImageName.heroStrength).existsSync(), true);
    expect(File(ImageName.heroUniversal).existsSync(), true);
    expect(File(ImageName.iconArmor).existsSync(), true);
    expect(File(ImageName.iconAttackRange).existsSync(), true);
    expect(File(ImageName.iconAttackRate).existsSync(), true);
    expect(File(ImageName.iconDamage).existsSync(), true);
    expect(File(ImageName.iconMagicResist).existsSync(), true);
    expect(File(ImageName.iconMovementSpeed).existsSync(), true);
    expect(File(ImageName.iconProjectileSpeed).existsSync(), true);
    expect(File(ImageName.iconTurnRate).existsSync(), true);
    expect(File(ImageName.iconVision).existsSync(), true);
  });
}
