import 'package:dota_heroes/app/managers/session_manager.dart';
import 'package:dota_heroes/app/routes/app_pages.dart';
import 'package:dota_heroes/resources/resources.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SessionManager _sessionManager = Get.find();

  final logoAssetName = ImageName.dota2LogoColor;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _onFirstLoad();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _onFirstLoad() {
    _sessionManager.loadSession();

    Future.delayed(const Duration(milliseconds: 250), () {
      Get.offAllNamed(Routes.HOME);
    });
  }
}
