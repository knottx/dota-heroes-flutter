// Mocks generated by Mockito 5.4.5 from annotations
// in dota_heroes/test/presentation/screens/home/cubit/home_screen_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dota_heroes/domain/core/result.dart' as _i2;
import 'package:dota_heroes/domain/entities/dota_hero.dart' as _i5;
import 'package:dota_heroes/domain/use_cases/home_screen_use_case.dart' as _i3;
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

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [HomeScreenUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeScreenUseCase extends _i1.Mock implements _i3.HomeScreenUseCase {
  MockHomeScreenUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<List<_i5.DotaHero>>> getHeroStats() =>
      (super.noSuchMethod(
            Invocation.method(#getHeroStats, []),
            returnValue: _i4.Future<_i2.Result<List<_i5.DotaHero>>>.value(
              _FakeResult_0<List<_i5.DotaHero>>(
                this,
                Invocation.method(#getHeroStats, []),
              ),
            ),
          )
          as _i4.Future<_i2.Result<List<_i5.DotaHero>>>);
}
