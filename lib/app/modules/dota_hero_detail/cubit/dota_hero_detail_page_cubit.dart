import 'package:dota_heroes/app/modules/dota_hero_detail/arguments/dota_hero_detail_page_arguments.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/cubit/dota_hero_detail_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotaHeroDetailPageCubit extends Cubit<DotaHeroDetailPageState> {
  DotaHeroDetailPageCubit({
    required DotaHeroDetailPageArguments? arguments,
  }) : super(
          DotaHeroDetailPageState(
            dotaHero: arguments?.dotaHero,
          ),
        );
}
