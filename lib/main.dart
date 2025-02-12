// ignore_for_file: always_use_package_imports

import 'package:dota_heroes/app/core/session/session_cubit.dart';
import 'package:dota_heroes/app/core/session/session_state.dart';
import 'package:dota_heroes/app/initializers/api_client_initializer.dart';
import 'package:dota_heroes/app/router/app_router.dart';
import 'package:dota_heroes/data/data_sources/remote_data_sources/dota_hero_remote_data_source_impl.dart';
import 'package:dota_heroes/data/repositories/dota_hero_repository_impl.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';
import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();

  final sessionCubit = SessionCubit(sharedPrefs);

  sessionCubit.loadSession();

  final apiClient = initializeApiClient();

  getIt.registerLazySingleton<DotaHeroRepository>(
    () => DotaHeroRepositoryImpl(DotaHeroRemoteDataSourceImpl(apiClient)),
  );

  runApp(
    MyApp(
      sessionCubit: sessionCubit,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SessionCubit sessionCubit;

  const MyApp({
    super.key,
    required this.sessionCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sessionCubit,
      child: BlocBuilder<SessionCubit, SessionState>(
        builder: (context, state) {
          return MaterialApp.router(
            themeMode: ThemeMode.light,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryBlack,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.primaryBlack,
                iconTheme: IconThemeData(
                  color: AppColors.primary,
                ),
              ),
            ),
            routerConfig: AppRouter.router,
            locale: const Locale('en'),
            supportedLocales: const [
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
