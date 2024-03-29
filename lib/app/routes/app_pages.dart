// ignore_for_file: always_use_package_imports

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

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOTA_HERO_DETAIL,
      page: () => DotaHeroDetailView(),
      binding: DotaHeroDetailBinding(),
    ),
  ];
}
