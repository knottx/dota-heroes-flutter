import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreenState', () {
    test('default state is correct', () {
      const state = HomeScreenState();
      expect(state.status, equals(HomeScreenStatus.initial));
      expect(state.sortType, equals(SortType.ascending));
      expect(state.filteredAttribute, isNull);
      expect(state.showFavorites, isFalse);
      expect(state.searchText, equals(''));
      expect(state.dotaHeroes, equals([]));
      expect(state.error, isNull);
    });

    test('copyWith updates fields correctly', () {
      const initialState = HomeScreenState(
        status: HomeScreenStatus.initial,
        sortType: SortType.ascending,
        filteredAttribute: DotaHeroAttribute.str,
        showFavorites: false,
        searchText: '',
        dotaHeroes: [],
        error: null,
      );
      final newHeroes = [const DotaHero()];
      final newState = initialState.copyWith(
        status: HomeScreenStatus.ready,
        sortType: SortType.descending,
        filteredAttribute: DotaHeroAttribute.agi,
        showFavorites: true,
        searchText: 'search text',
        dotaHeroes: newHeroes,
        error: 'error occurred',
      );
      expect(newState.status, equals(HomeScreenStatus.ready));
      expect(newState.sortType, equals(SortType.descending));
      expect(newState.filteredAttribute, equals(DotaHeroAttribute.agi));
      expect(newState.showFavorites, isTrue);
      expect(newState.searchText, equals('search text'));
      expect(newState.dotaHeroes, equals(newHeroes));
      expect(newState.error, equals('error occurred'));
    });

    test('clearFilteredAttribute returns state with filteredAttribute cleared',
        () {
      const state = HomeScreenState(filteredAttribute: DotaHeroAttribute.int);
      final newState = state.clearFilteredAttribute();
      expect(newState.filteredAttribute, isNull);
      expect(newState.status, equals(state.status));
      expect(newState.sortType, equals(state.sortType));
      expect(newState.showFavorites, equals(state.showFavorites));
      expect(newState.searchText, equals(state.searchText));
      expect(newState.dotaHeroes, equals(state.dotaHeroes));
      expect(newState.error, equals(state.error));
    });

    test('loading returns state with loading status', () {
      const state = HomeScreenState();
      final loadingState = state.loading();
      expect(loadingState.status, equals(HomeScreenStatus.loading));
    });

    test('ready returns state with ready status and updated heroes', () {
      const state = HomeScreenState();
      final heroes = [const DotaHero(id: 1, name: 'Axe')];
      final readyState = state.ready(dotaHeroes: heroes);
      expect(readyState.status, equals(HomeScreenStatus.ready));
      expect(readyState.dotaHeroes, equals(heroes));
    });

    test('failure returns state with failure status and sets error', () {
      const state = HomeScreenState();
      final failureState = state.failure('some error');
      expect(failureState.status, equals(HomeScreenStatus.failure));
      expect(failureState.error, equals('some error'));
    });

    test('copyWith returns the same state when no arguments are provided', () {
      const state = HomeScreenState(
        status: HomeScreenStatus.initial,
        sortType: SortType.ascending,
        filteredAttribute: DotaHeroAttribute.str,
        showFavorites: false,
        searchText: 'text',
        dotaHeroes: [DotaHero(id: 1, name: 'Axe')],
        error: null,
      );
      final copy = state.copyWith();
      expect(copy, equals(state));
    });
  });
}
