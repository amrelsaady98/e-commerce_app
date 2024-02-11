import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/application/auth_manager/auth_manager.dart';
import 'package:shop_app/app/application/auth_manager/cache_manager.dart';
import 'package:shop_app/core/routes/routes.dart';

class SplashContorller extends GetxController {
  final AuthManager _authmanager = Get.put(AuthManager());
  final String SKIP_INTRO_KEY = "SkipIntro";

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      bool? skipIntroPage = skipIntro();
      if (skipIntroPage ?? false) {
        if (_authmanager.checkLoginStatus()) {
          Get.offAllNamed(Routes.MAIN_PAGE);
        } else {
          Get.offAllNamed(Routes.LOGIN_PAGE);
        }
      } else {
        firstAppRun();
        Get.offAllNamed(Routes.INTRO_PAGE);
      }
    });
  }

  bool? skipIntro() {
    final box = GetStorage();
    return box.read(SKIP_INTRO_KEY);
  }

  Future<bool> firstAppRun() async {
    final box = GetStorage();
    await box.write(SKIP_INTRO_KEY, true);
    return true;
  }
}
