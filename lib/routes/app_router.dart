import 'package:dota_heroes/app/modules/dota_hero_detail/dota_hero_detail_page.dart';
import 'package:dota_heroes/app/modules/home/home_page.dart';
import 'package:dota_heroes/routes/extra_codec.dart';
import 'package:dota_heroes/routes/extra_data.dart';
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
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'dota-hero-detail',
            builder: (context, state) {
              final extraData = state.extra as ExtraData?;
              final arguments = extraData?.dotaHeroDetailArguments;
              return DotaHeroDetailPage(
                arguments: arguments,
              );
            },
          ),
        ],
      ),
    ],
  );
}
