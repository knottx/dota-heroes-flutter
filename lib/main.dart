// ignore_for_file: always_use_package_imports

import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/core/api_client.dart';
import 'package:dota_heroes/app/managers/session/session_cubit.dart';
import 'package:dota_heroes/app/managers/session/session_state.dart';
import 'package:dota_heroes/app/managers/user_data_manager.dart';
import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserDataManager.initialize();

  await SessionCubit.initialize(
    UserDataManager.instance,
  );

  await APIClient.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionCubit.instance,
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
            supportedLocales: [
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
