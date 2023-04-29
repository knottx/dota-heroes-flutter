import 'package:get/get.dart';

import '../modules/dota_hero_detail/bindings/dota_hero_detail_binding.dart';
import '../modules/dota_hero_detail/views/dota_hero_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.DOTA_HERO_DETAIL,
      page: () => const DotaHeroDetailView(),
      binding: DotaHeroDetailBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
