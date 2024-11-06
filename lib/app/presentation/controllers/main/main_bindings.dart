import 'package:get/get.dart';
import 'package:shop_app/app/presentation/controllers/main/main_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
