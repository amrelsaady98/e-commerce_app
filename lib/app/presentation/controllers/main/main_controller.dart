import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop_app/app/data/data_sources/remote/auth_api_service.dart';
import 'package:shop_app/app/data/repositorites_impls/auth_repository_impl.dart';
import 'package:shop_app/app/domain/use_cases/auth_use_case.dart';
import 'package:shop_app/app/presentation/controllers/authentication/login_bindings.dart';
import 'package:shop_app/app/presentation/controllers/authentication/login_controller.dart';
import 'package:shop_app/app/presentation/controllers/home/home_bindings.dart';
import 'package:shop_app/app/presentation/pages/authintication/login_page.dart';
import 'package:shop_app/app/presentation/pages/home/home_page.dart';
import 'package:shop_app/app/presentation/pages/home/main_page.dart';
import 'package:shop_app/app/presentation/pages/intro_page/intro_page.dart';
import 'package:shop_app/core/routes/routes.dart';

class MainController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<dynamic> animationControllers = [];

  final List<RiveModel> bottomNavItems = const [
    RiveModel(
      src: 'assets/rive/bottom_animated_icons.riv',
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
    RiveModel(
      src: 'assets/rive/bottom_animated_icons.riv',
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_interactivity",
    ),
    RiveModel(
      src: 'assets/rive/bottom_animated_icons.riv',
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
    ),
    RiveModel(
      src: 'assets/rive/bottom_animated_icons.riv',
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
  ];

  final List<String> pages = [
    Routes.HOME_PAGE,
    Routes.INTRO_PAGE,
    "Notification",
    "Profile"
  ];
  @override
  void onInit() {
    // TODO: implement onInit
  }

  void onInitRiveAnimation(Artboard artboard, int index) {
    StateMachineController? animationController =
        StateMachineController.fromArtboard(
            artboard, bottomNavItems[index].stateMachineName);

    if (animationController != null) {
      artboard.addController(animationController);
    }

    animationControllers.add(animationController != null
        ? animationController.findInput<bool>("active") as SMIBool
        : "");
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.HOME_PAGE)
      return GetPageRoute(
        settings: settings,
        page: () => HomePage(),
        bindings: [HomeBindings()],
      );
    if (settings.name == Routes.INTRO_PAGE)
      return GetPageRoute(
        settings: settings,
        page: () => IntroPage(),
      );

    return null;
  }

  void changePage(int index) {
    selectedIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }
}
