import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:equatable/equatable.dart';

enum HomeScreenStatus {
  initial,
  loading,
  ready,
  failure,
  ;

  bool get isLoading => this == HomeScreenStatus.loading;
}

class HomeScreenState extends Equatable {
  final HomeScreenStatus status;
  final SortType sortType;
  final DotaHeroAttribute? filteredAttribute;
  final bool showFavorites;
  final String searchText;
  final List<DotaHero> dotaHeroes;
  final AppError? error;

  const HomeScreenState({
    this.status = HomeScreenStatus.initial,
    this.sortType = SortType.ascending,
    this.filteredAttribute,
    this.showFavorites = false,
    this.searchText = '',
    this.dotaHeroes = const [],
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        sortType,
        filteredAttribute,
        showFavorites,
        searchText,
        dotaHeroes,
        error,
      ];

  HomeScreenState copyWith({
    HomeScreenStatus? status,
    SortType? sortType,
    DotaHeroAttribute? filteredAttribute,
    bool? showFavorites,
    String? searchText,
    List<DotaHero>? dotaHeroes,
    AppError? error,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      sortType: sortType ?? this.sortType,
      filteredAttribute: filteredAttribute ?? this.filteredAttribute,
      showFavorites: showFavorites ?? this.showFavorites,
      searchText: searchText ?? this.searchText,
      dotaHeroes: dotaHeroes ?? this.dotaHeroes,
      error: error ?? this.error,
    );
  }

  HomeScreenState clearFilteredAttribute() {
    return HomeScreenState(
      status: status,
      sortType: sortType,
      filteredAttribute: null,
      showFavorites: showFavorites,
      searchText: searchText,
      dotaHeroes: dotaHeroes,
      error: error,
    );
  }

  HomeScreenState loading() {
    return copyWith(
      status: HomeScreenStatus.loading,
    );
  }

  HomeScreenState ready({
    List<DotaHero>? dotaHeroes,
  }) {
    return copyWith(
      status: HomeScreenStatus.ready,
      dotaHeroes: dotaHeroes,
    );
  }

  HomeScreenState failure(
    AppError error,
  ) {
    return copyWith(
      status: HomeScreenStatus.failure,
      error: error,
    );
  }
}
