// ignore_for_file: always_use_package_imports

import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/core/dio_client.dart';
import 'package:dota_heroes/app/managers/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupInstance();

  runApp(
    GetMaterialApp(
      title: 'Dota Heroes',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          color: AppColors.primaryBlack,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> _setupInstance() async {
  await GetStorage.init();

  Get.put(SessionManager(GetStorage()));

  Get.put(DioClient());

  return;
}
