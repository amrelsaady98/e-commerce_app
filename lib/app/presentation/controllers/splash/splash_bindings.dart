import 'package:get/get.dart';
import 'package:shop_app/app/presentation/controllers/splash/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashContorller());
  }
}
