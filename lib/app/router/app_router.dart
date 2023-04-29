import 'package:dota_heroes/app/router/extra_codec.dart';
import 'package:dota_heroes/app/router/extra_data.dart';
import 'package:dota_heroes/presentation/screens/dota_hero_detail/dota_hero_detail_page.dart';
import 'package:dota_heroes/presentation/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    extraCodec: const ExtraCodec(),
    initialLocation: '/',
    routes: [
      /// Home
      /// '/'
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'dota-hero-detail',
            builder: (context, state) {
              final extraData = state.extra as ExtraData?;
              final arguments = extraData?.dotaHeroDetailArguments;
              return DotaHeroDetailScreen(
                arguments: arguments,
              );
            },
          ),
        ],
      ),
    ],
  );
}
