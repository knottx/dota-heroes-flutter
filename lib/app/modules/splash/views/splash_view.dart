import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:dota_heroes/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Center(
        child: Image.asset(
          controller.logoAssetName,
          width: 240,
        ),
      ),
    );
  }
}
