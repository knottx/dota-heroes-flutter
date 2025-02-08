// Mocks generated by Mockito 5.4.5 from annotations
// in dota_heroes/test/domain/use_cases/home_screen_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:dota_heroes/domain/entities/dota_hero.dart' as _i4;
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [DotaHeroRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDotaHeroRepository extends _i1.Mock
    implements _i2.DotaHeroRepository {
  MockDotaHeroRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.DotaHero>> getHeroStats() =>
      (super.noSuchMethod(
            Invocation.method(#getHeroStats, []),
            returnValue: _i3.Future<List<_i4.DotaHero>>.value(<_i4.DotaHero>[]),
          )
          as _i3.Future<List<_i4.DotaHero>>);
}
