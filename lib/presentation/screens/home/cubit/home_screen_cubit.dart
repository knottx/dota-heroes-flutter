import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:dota_heroes/domain/use_cases/home_screen_use_case.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeScreenUseCase _homeScreenUseCase;

  final ScrollController scrollController = ScrollController();

  final TextEditingController searchTextController = TextEditingController();

  HomeScreenCubit(
    this._homeScreenUseCase,
  ) : super(const HomeScreenState()) {
    searchTextController.addListener(() {
      emit(
        state.copyWith(
          searchText: searchTextController.text,
        ),
      );
    });

    _getDotaHeroes();
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    searchTextController.dispose();
    return super.close();
  }

  Future<void> onRefresh() async {
    HapticFeedback.lightImpact();
    return _getDotaHeroes();
  }

  void onTapFilteredAtttibute(DotaHeroAttribute attribute) {
    HapticFeedback.selectionClick();
    if (state.filteredAttribute == attribute) {
      emit(state.clearFilteredAttribute());
    } else {
      emit(state.copyWith(filteredAttribute: attribute));
    }
    _scrollToTop();
  }

  void onTapSortType() {
    if (state.sortType == SortType.ascending) {
      emit(state.copyWith(sortType: SortType.descending));
    } else {
      emit(state.copyWith(sortType: SortType.ascending));
    }
    _scrollToTop();
  }

  void onTapShowFavorites() {
    emit(state.copyWith(showFavorites: !state.showFavorites));
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }

  void _getDotaHeroes() async {
    emit(state.loading());

    final result = await _homeScreenUseCase.getHeroStats();

    result.when(
      success: (data) {
        emit(state.ready(dotaHeroes: data));
      },
      failure: (error) {
        emit(state.failure(error));
      },
    );
  }
}
