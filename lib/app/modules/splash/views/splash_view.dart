import 'package:dota_heroes/app/constants/app_colors.dart';
import 'package:dota_heroes/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

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
