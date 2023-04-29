import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/constants/sort_type.dart';
import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:equatable/equatable.dart';

enum HomePageStatus {
  initial,
  loading,
  ready,
  failure,
  ;

  bool get isLoading => this == HomePageStatus.loading;
}

class HomePageState extends Equatable {
  final HomePageStatus status;
  final SortType sortType;
  final DotaHeroAttribute? filteredAttribute;
  final bool showFavorites;
  final String searchText;
  final List<DotaHero> dotaHeroes;
  final Object? error;

  const HomePageState({
    this.status = HomePageStatus.initial,
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

  HomePageState copyWith({
    HomePageStatus? status,
    SortType? sortType,
    DotaHeroAttribute? filteredAttribute,
    bool? showFavorites,
    String? searchText,
    List<DotaHero>? dotaHeroes,
    Object? error,
  }) {
    return HomePageState(
      status: status ?? this.status,
      sortType: sortType ?? this.sortType,
      filteredAttribute: filteredAttribute ?? this.filteredAttribute,
      showFavorites: showFavorites ?? this.showFavorites,
      searchText: searchText ?? this.searchText,
      dotaHeroes: dotaHeroes ?? this.dotaHeroes,
      error: error ?? this.error,
    );
  }

  HomePageState clearFilteredAttribute() {
    return HomePageState(
      status: status,
      sortType: sortType,
      filteredAttribute: null,
      showFavorites: showFavorites,
      searchText: searchText,
      dotaHeroes: dotaHeroes,
      error: error,
    );
  }

  HomePageState loading() {
    return copyWith(
      status: HomePageStatus.loading,
    );
  }

  HomePageState ready({
    List<DotaHero>? dotaHeroes,
  }) {
    return copyWith(
      status: HomePageStatus.ready,
      dotaHeroes: dotaHeroes,
    );
  }

  HomePageState failure(
    Object error,
  ) {
    return copyWith(
      status: HomePageStatus.failure,
      error: error,
    );
  }
}
