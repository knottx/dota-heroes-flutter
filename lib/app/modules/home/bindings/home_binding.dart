import 'package:dota_heroes/app/modules/home/controllers/home_controller.dart';
import 'package:dota_heroes/app/modules/home/home_arguments.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      tag: (Get.arguments as HomeArguments).tag,
    );
  }
}
