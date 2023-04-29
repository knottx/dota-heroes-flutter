import 'package:dota_heroes/app/managers/session/session_cubit.dart';
import 'package:dota_heroes/app/managers/session/session_state.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/arguments/dota_hero_detail_page_arguments.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/cubit/dota_hero_detail_page_cubit.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/cubit/dota_hero_detail_page_state.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_attribute_section.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_header_section.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_roles_section.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_stats_section.dart';
import 'package:dota_heroes/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotaHeroDetailPage extends StatelessWidget {
  final DotaHeroDetailPageArguments? arguments;

  const DotaHeroDetailPage({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DotaHeroDetailPageCubit(
          arguments: arguments,
        );
      },
      child: const DotaHeroDetailView(),
    );
  }
}

class DotaHeroDetailView extends StatefulWidget {
  const DotaHeroDetailView({super.key});

  @override
  State<DotaHeroDetailView> createState() => _DotaHeroDetailViewState();
}

class _DotaHeroDetailViewState extends State<DotaHeroDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DotaHeroDetailPageCubit, DotaHeroDetailPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Assets.images.dota2Logo.image(
              height: 32,
            ),
            centerTitle: true,
            actions: [
              _favoriteAppBarButton(state),
            ],
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Assets.images.background.image(
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: _body(state),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: _listener,
    );
  }

  Widget _favoriteAppBarButton(DotaHeroDetailPageState state) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, sessionState) {
        final favoriteIds = sessionState.favoriteIds;
        final dotaHeroId = state.dotaHero?.id;
        final isFavorite = favoriteIds.contains(dotaHeroId);
        return IconButton(
          onPressed: () {
            if (dotaHeroId != null) {
              SessionCubit.instance.setFavorite(dotaHeroId.toInt());
            }
          },
          icon: Icon(
            isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            size: 24,
          ),
        );
      },
    );
  }

  Widget _body(DotaHeroDetailPageState state) {
    final dotaHero = state.dotaHero;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DotaHeroDetailHeaderSection(
          dotaHero: dotaHero,
        ),
        DotaHeroDetailAttributeSection(
          dotaHero: dotaHero,
        ),
        const Divider(
          thickness: 0.5,
          height: 0.5,
          color: Colors.grey,
        ),
        DotaHeroDetailRolesSection(
          dotaHero: dotaHero,
        ),
        const Divider(
          thickness: 0.5,
          height: 0.5,
          color: Colors.grey,
        ),
        DotaHeroDetailStatsSection(
          dotaHero: dotaHero,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _listener(BuildContext context, DotaHeroDetailPageState state) {
    switch (state.status) {
      case DotaHeroDetailPageStatus.initial:
      case DotaHeroDetailPageStatus.loading:
      case DotaHeroDetailPageStatus.ready:
        break;

      case DotaHeroDetailPageStatus.failure:
        break;
    }
  }
}
