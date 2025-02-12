import 'package:dota_heroes/app/router/arguments/dota_hero_detail_page_arguments.dart';
import 'package:dota_heroes/data/mapper/dota_hero_mapper.dart';
import 'package:dota_heroes/presentation/screens/dota_hero_detail/cubit/dota_hero_detail_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotaHeroDetailScreenCubit extends Cubit<DotaHeroDetailScreenState> {
  DotaHeroDetailScreenCubit({
    required DotaHeroDetailScreenArguments? arguments,
  }) : super(
          DotaHeroDetailScreenState(
            dotaHero: DotaHeroMapper.toEntityOrNull(arguments?.dotaHeroModel),
          ),
        );
}
