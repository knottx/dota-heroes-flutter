import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreenState', () {
    // Dummy instances for testing.
    // Adjust constructors and properties based on your actual classes.
    final dummyError = const AppError(message: 'Test error');

    test('initial state has correct default values', () {
      final state = const HomeScreenState();
      expect(state.status, HomeScreenStatus.initial);
      expect(state.sortType, SortType.ascending);
      expect(state.filteredAttribute, isNull);
      expect(state.showFavorites, isFalse);
      expect(state.searchText, '');
      expect(state.dotaHeroes, isEmpty);
      expect(state.error, isNull);
    });

    test('copyWith updates properties correctly', () {
      final state = const HomeScreenState();
      final updatedState = state.copyWith(
        status: HomeScreenStatus.loading,
        sortType: SortType.descending,
        filteredAttribute: DotaHeroAttribute.str,
        showFavorites: true,
        searchText: 'Test search',
        dotaHeroes: [const DotaHero(id: 1, name: 'Hero1')],
        error: dummyError,
      );

      expect(updatedState.status, HomeScreenStatus.loading);
      expect(updatedState.sortType, SortType.descending);
      expect(updatedState.filteredAttribute, DotaHeroAttribute.str);
      expect(updatedState.showFavorites, isTrue);
      expect(updatedState.searchText, 'Test search');
      expect(updatedState.dotaHeroes.length, 1);
      expect(updatedState.dotaHeroes.first.id, 1);
      expect(updatedState.dotaHeroes.first.name, 'Hero1');
      expect(updatedState.error, dummyError);
    });

    test('clearFilteredAttribute resets filteredAttribute to null', () {
      final state = const HomeScreenState(
        filteredAttribute: DotaHeroAttribute.agi,
      );
      final clearedState = state.clearFilteredAttribute();
      expect(clearedState.filteredAttribute, isNull);
    });

    test('loading method returns state with status loading', () {
      final state = const HomeScreenState();
      final loadingState = state.loading();
      expect(loadingState.status, HomeScreenStatus.loading);
    });

    test('ready method returns state with status ready and updated dotaHeroes',
        () {
      final hero = const DotaHero(id: 2, name: 'Hero2');
      final state = const HomeScreenState(status: HomeScreenStatus.loading);
      final readyState = state.ready(dotaHeroes: [hero]);
      expect(readyState.status, HomeScreenStatus.ready);
      expect(readyState.dotaHeroes, [hero]);
    });

    test('failure method returns state with status failure and error', () {
      final state = const HomeScreenState();
      final error = const AppError(message: 'An error occurred');
      final failureState = state.failure(error);
      expect(failureState.status, HomeScreenStatus.failure);
      expect(failureState.error, error);
    });
  });
}
