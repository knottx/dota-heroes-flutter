import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:dota_heroes/resources/resources.dart';

void main() {
  test('svgimage_name assets test', () {
    expect(File(SVGImageName.melee).existsSync(), true);
    expect(File(SVGImageName.ranged).existsSync(), true);
  });
}
