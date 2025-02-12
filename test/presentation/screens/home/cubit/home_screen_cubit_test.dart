import 'package:bloc_test/bloc_test.dart';
import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/domain/core/result.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
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
  late MockHomeScreenUseCase mockUseCase;
  late HomeScreenCubit cubit;

  setUp(() {
    mockUseCase = MockHomeScreenUseCase();
  });

  group('HomeScreenCubit', () {
    blocTest<HomeScreenCubit, HomeScreenState>(
      'emits loading then ready when getHeroStats succeeds',
      build: () {
        final heroes = [const DotaHero(id: 1, name: 'Axe')];
        when(mockUseCase.getHeroStats())
            .thenAnswer((_) async => Result.success(heroes));

        return HomeScreenCubit(mockUseCase);
      },
      verify: (_) {
        verify(mockUseCase.getHeroStats()).called(1);
      },
      expect: () => [
        const HomeScreenState(
          status: HomeScreenStatus.ready,
          sortType: SortType.ascending,
          filteredAttribute: null,
          showFavorites: false,
          searchText: '',
          dotaHeroes: [DotaHero(id: 1, name: 'Axe')],
          error: null,
        ),
      ],
    );

    blocTest<HomeScreenCubit, HomeScreenState>(
      'emits loading then failure when getHeroStats fails',
      build: () {
        final error = const AppError(message: 'Failed to load heroes');
        when(mockUseCase.getHeroStats())
            .thenAnswer((_) async => Result.failure(error));
        return HomeScreenCubit(mockUseCase);
      },
      verify: (_) {
        verify(mockUseCase.getHeroStats()).called(1);
      },
      expect: () => [
        const HomeScreenState(
          status: HomeScreenStatus.failure,
          sortType: SortType.ascending,
          filteredAttribute: null,
          showFavorites: false,
          searchText: '',
          dotaHeroes: [],
          error: AppError(message: 'Failed to load heroes'),
        ),
      ],
    );

    test('searchTextController listener updates state.searchText', () async {
      when(mockUseCase.getHeroStats())
          .thenAnswer((_) async => Result.success([]));
      cubit = HomeScreenCubit(mockUseCase);

      cubit.searchTextController.text = 'test search';

      await Future.delayed(const Duration(milliseconds: 10));

      expect(cubit.state.searchText, equals('test search'));
      await cubit.close();
    });
  });
}
