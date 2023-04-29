import 'package:dota_heroes/app/constants/dota_hero_attribute.dart';
import 'package:dota_heroes/app/constants/sort_type.dart';
import 'package:dota_heroes/app/core/api/dota_hero_api.dart';
import 'package:dota_heroes/app/modules/home/cubit/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchTextController = TextEditingController();

  HomePageCubit() : super(const HomePageState()) {
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
    try {
      emit(state.loading());
      final result = await DotaHeroAPI.getHeroStats();
      emit(state.ready(dotaHeroes: result));
    } catch (error) {
      emit(state.failure(error));
      emit(state.ready());
    }
  }
}
