// ignore_for_file: always_use_package_imports

import 'package:dota_heroes/app/config/dio_initializer.dart';
import 'package:dota_heroes/app/core/api/api_client.dart';
import 'package:dota_heroes/app/core/session/session_cubit.dart';
import 'package:dota_heroes/app/core/session/session_state.dart';
import 'package:dota_heroes/app/core/session/user_data_manager.dart';
import 'package:dota_heroes/app/router/app_router.dart';
import 'package:dota_heroes/data/data_source/api_client_impl.dart';
import 'package:dota_heroes/data/data_source/dota_hero_remote_data_source.dart';
import 'package:dota_heroes/data/repositories/dota_hero_repository_impl.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';
import 'package:dota_heroes/presentation/generated/app_localizations.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserDataManager.initialize();

  final sessionCubit = SessionCubit(
    userDataManager: UserDataManager.instance,
  );

  await sessionCubit.loadSession();

  final dio = initializeDio();

  getIt.registerSingleton<ApiClientImpl>(ApiClientImpl(dio));

  getIt.registerSingleton<ApiClient>(getIt<ApiClientImpl>());

  getIt.registerSingleton(DotaHeroRemoteDataSource(getIt<ApiClientImpl>()));

  getIt.registerLazySingleton<DotaHeroRepository>(
    () => DotaHeroRepositoryImpl(getIt<DotaHeroRemoteDataSource>()),
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
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.primaryBlack,
                iconTheme: IconThemeData(
                  color: AppColors.primary,
                ),
              ),
            ),
            routerConfig: AppRouter.router,
            locale: Locale('en'),
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
