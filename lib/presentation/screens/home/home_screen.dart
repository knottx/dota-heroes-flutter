import 'package:dota_heroes/app/core/session/session_cubit.dart';
import 'package:dota_heroes/app/core/session/session_state.dart';
import 'package:dota_heroes/app/router/app_router.dart';
import 'package:dota_heroes/app/router/arguments/dota_hero_detail_page_arguments.dart';
import 'package:dota_heroes/app/router/extra_data.dart';
import 'package:dota_heroes/data/mappers/dota_hero_mapper.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/sort_type.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';
import 'package:dota_heroes/domain/use_cases/home_screen_use_case.dart';
import 'package:dota_heroes/generated/assets.gen.dart';
import 'package:dota_heroes/main.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_cubit.dart';
import 'package:dota_heroes/presentation/screens/home/cubit/home_screen_state.dart';
import 'package:dota_heroes/presentation/screens/home/widgets/home_app_bar_bottom.dart';
import 'package:dota_heroes/presentation/screens/home/widgets/home_dota_hero_tile.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:dota_heroes/presentation/utils/app_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeScreenCubit(
          HomeScreenUseCase(
            getIt<DotaHeroRepository>(),
          ),
        );
      },
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Assets.images.dota2Logo.image(
                    height: 32,
                  ),
                  centerTitle: true,
                  bottom: _appBarBottom(
                    context,
                    state: state,
                  ),
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    Assets.images.background.image(
                      fit: BoxFit.cover,
                    ),
                    _body(state),
                  ],
                ),
              ),
            ),
            // OverlayLoadingIndicator(state.status.isLoading),
          ],
        );
      },
      listener: _listener,
    );
  }

  PreferredSizeWidget _appBarBottom(
    BuildContext context, {
    required HomeScreenState state,
  }) {
    final cubit = context.read<HomeScreenCubit>();
    return HomeAppBarBottom(
      filteredAttribute: state.filteredAttribute,
      onTapFilteredAttribute: cubit.onTapFilteredAtttibute,
      sortType: state.sortType,
      onTapSortType: cubit.onTapSortType,
      showFavorites: state.showFavorites,
      onTapShowFavorites: cubit.onTapShowFavorites,
      searchText: state.searchText,
      searchTextController: cubit.searchTextController,
    );
  }

  Widget _body(HomeScreenState state) {
    final cubit = context.read<HomeScreenCubit>();
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, sessionState) {
        final favoriteIds = sessionState.favoriteIds;

        List<DotaHero> dotaHeroes = [];
        dotaHeroes.addAll(state.dotaHeroes);

        final sortType = state.sortType;
        switch (sortType) {
          case SortType.ascending:
            dotaHeroes.sort(
              (a, b) =>
                  (a.localizedName ?? '').compareTo((b.localizedName ?? '')),
            );
            break;

          case SortType.descending:
            dotaHeroes.sort(
              (a, b) =>
                  (b.localizedName ?? '').compareTo((a.localizedName ?? '')),
            );
            break;
        }

        final filterAttribute = state.filteredAttribute;
        if (filterAttribute != null) {
          dotaHeroes = dotaHeroes
              .where((e) => e.primaryAttr == filterAttribute)
              .toList();
        }

        final searchText = state.searchText;
        if (searchText.isNotEmpty) {
          dotaHeroes = dotaHeroes
              .where(
                (e) =>
                    e.localizedName
                        ?.toLowerCase()
                        .contains(searchText.toLowerCase()) ??
                    false,
              )
              .toList();
        }

        final showFavorite = state.showFavorites;
        if (showFavorite) {
          dotaHeroes = dotaHeroes
              .where(
                (e) => favoriteIds.contains(e.id),
              )
              .toList();
        }

        return RefreshIndicator.adaptive(
          color: AppColors.primary,
          onRefresh: cubit.onRefresh,
          child: RawScrollbar(
            thumbColor: Colors.white38,
            radius: const Radius.circular(2),
            thickness: 4,
            controller: cubit.scrollController,
            child: GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              controller: cubit.scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 16.0 / 9.0,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: dotaHeroes.length,
              itemBuilder: (context, index) {
                final dotaHero = dotaHeroes[index];
                return HomeDotaHeroTile(
                  dotaHero: dotaHero,
                  isFavorite: favoriteIds.contains(dotaHero.id),
                  onSelected: (dotaHero) {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                    _onSelectedDotaHero(dotaHero);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _onSelectedDotaHero(DotaHero dotaHero) {
    context.push(
      AppRoute.dotaHeroDetail,
      extra: ExtraData(
        dotaHeroDetailScreenArguments: DotaHeroDetailScreenArguments(
          dotaHeroModel: DotaHeroMapper.toModel(dotaHero),
        ),
      ),
    );
  }

  void _listener(BuildContext context, HomeScreenState state) {
    switch (state.status) {
      case HomeScreenStatus.initial:
      case HomeScreenStatus.loading:
      case HomeScreenStatus.ready:
        break;

      case HomeScreenStatus.failure:
        AppAlert.error(context, error: state.error);
        break;
    }
  }
}
