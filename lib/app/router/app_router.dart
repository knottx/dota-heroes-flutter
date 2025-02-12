import 'package:dota_heroes/app/router/extra_codec.dart';
import 'package:dota_heroes/app/router/extra_data.dart';
import 'package:dota_heroes/presentation/screens/dota_hero_detail/dota_hero_detail_page.dart';
import 'package:dota_heroes/presentation/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  AppRoute._();

  static const String home = '/';
  static const String dotaHeroDetail = '/dota-hero-detail';
}

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    extraCodec: const ExtraCodec(),
    initialLocation: AppRoute.home,
    routes: [
      /// Home
      GoRoute(
        path: AppRoute.home,
        builder: (context, state) => const HomeScreen(),
      ),

      /// Dota Hero Detail
      GoRoute(
        path: AppRoute.dotaHeroDetail,
        builder: (context, state) {
          final extra = state.extra as ExtraData?;
          final arguments = extra?.dotaHeroDetailScreenArguments;
          return DotaHeroDetailScreen(arguments: arguments);
        },
      ),
    ],
  );
}
