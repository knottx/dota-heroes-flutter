import 'package:bloc_test/bloc_test.dart';
import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/domain/core/result.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:dota_heroes/domain/use_cases/home_screen_use_case.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_cubit.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_cubit_test.mocks.dart';

@GenerateMocks([HomeScreenUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeScreenUseCase mockUseCase;

  final dummyHero = const DotaHero(id: 1, name: 'Test Hero');
  final dummyError = const AppError(message: 'Test error');

  setUp(() {
    mockUseCase = MockHomeScreenUseCase();
  });

  group('HomeScreenCubit', () {
    blocTest<HomeScreenCubit, HomeScreenState>(
      'emits updated searchText state when text controller changes',
      build: () => HomeScreenCubit(mockUseCase)..init(),
      act: (cubit) {
        cubit.searchTextController.text = 'new search';
        cubit.searchTextController.notifyListeners();
      },
      expect: () => [
        predicate<HomeScreenState>((state) => state.searchText == 'new search'),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'onTapFilteredAtttibute toggles filteredAttribute correctly',
      build: () => HomeScreenCubit(mockUseCase),
      act: (cubit) {
        final attribute = DotaHeroAttribute.str;
        cubit.onTapFilteredAtttibute(attribute);
        cubit.onTapFilteredAtttibute(attribute);
      },
      expect: () => [
        predicate<HomeScreenState>(
          (state) => state.filteredAttribute == DotaHeroAttribute.str,
        ),
        predicate<HomeScreenState>((state) => state.filteredAttribute == null),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'onTapSortType toggles sortType from ascending to descending and back',
      build: () => HomeScreenCubit(mockUseCase),
      act: (cubit) {
        cubit.onTapSortType();
        cubit.onTapSortType();
      },
      expect: () => [
        predicate<HomeScreenState>(
          (state) => state.sortType == SortType.descending,
        ),
        predicate<HomeScreenState>(
          (state) => state.sortType == SortType.ascending,
        ),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'onTapShowFavorites toggles showFavorites flag',
      build: () => HomeScreenCubit(mockUseCase),
      act: (cubit) {
        cubit.onTapShowFavorites();
        cubit.onTapShowFavorites();
      },
      expect: () => [
        predicate<HomeScreenState>((state) => state.showFavorites == true),
        predicate<HomeScreenState>((state) => state.showFavorites == false),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'getDotaHeroes emits loading then ready when use case returns success',
      build: () {
        when(mockUseCase.getHeroStats()).thenAnswer(
          (_) async => Result.success([dummyHero]),
        );
        return HomeScreenCubit(mockUseCase);
      },
      act: (cubit) => cubit.getDotaHeroes(),
      expect: () => [
        predicate<HomeScreenState>(
          (state) => state.status == HomeScreenStatus.loading,
        ),
        predicate<HomeScreenState>(
          (state) =>
              state.status == HomeScreenStatus.ready &&
              state.dotaHeroes.length == 1 &&
              state.dotaHeroes.first.id == dummyHero.id,
        ),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'getDotaHeroes emits loading then failure when use case returns failure',
      build: () {
        when(mockUseCase.getHeroStats()).thenAnswer(
          (_) async => Result.failure(dummyError),
        );
        return HomeScreenCubit(mockUseCase);
      },
      act: (cubit) => cubit.getDotaHeroes(),
      expect: () => [
        predicate<HomeScreenState>(
          (state) => state.status == HomeScreenStatus.loading,
        ),
        predicate<HomeScreenState>(
          (state) =>
              state.status == HomeScreenStatus.failure &&
              state.error == dummyError,
        ),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'onRefresh triggers getDotaHeroes and emits loading then ready',
      build: () {
        when(mockUseCase.getHeroStats()).thenAnswer(
          (_) async => Result.success([dummyHero]),
        );
        return HomeScreenCubit(mockUseCase);
      },
      act: (cubit) => cubit.onRefresh(),
      expect: () => [
        predicate<HomeScreenState>(
          (state) => state.status == HomeScreenStatus.loading,
        ),
        predicate<HomeScreenState>(
          (state) =>
              state.status == HomeScreenStatus.ready &&
              state.dotaHeroes.length == 1 &&
              state.dotaHeroes.first.id == dummyHero.id,
        ),
      ],
    );
  });
}
