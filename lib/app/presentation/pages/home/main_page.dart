import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop_app/app/presentation/controllers/main/main_controller.dart';
import 'package:shop_app/app/presentation/pages/authintication/login_page.dart';
import 'package:shop_app/core/routes/routes.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Navigator(
          key: Get.nestedKey(1),
          initialRoute: Routes.HOME_PAGE,
          onGenerateRoute: (settings) => controller.onGenerateRoute(settings),
        ),
      ),
      bottomNavigationBar: Container(
        height: 64,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 50,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            controller.bottomNavItems.length,
            (index) => GestureDetector(
              onTap: () {
                if (controller.selectedIndex.value == index) return;
                if (controller.animationControllers[index] is SMIBool) {
                  controller.animationControllers[index]?.change(true);
                  Future.delayed(const Duration(seconds: 1)).whenComplete(() {
                    controller.animationControllers[index]?.change(false);
                  });
                }
                controller.changePage(index);
              },
              child: SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  controller.bottomNavItems[index].src,
                  artboard: controller.bottomNavItems[index].artboard,
                  stateMachines: [
                    controller.bottomNavItems[index].stateMachineName
                  ],
                  onInit: (Artboard artboard) =>
                      controller.onInitRiveAnimation(artboard, index),
                      
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RiveModel {
  final String src, artboard, stateMachineName;

  const RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
  });
}



/* 
Container(
        height: 64,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 50,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              fit: BoxFit.fitHeight,
              height: 24,
              "assets/vectors/bottom_home.svg",
            ),
            SvgPicture.asset(
              fit: BoxFit.fitHeight,
              height: 22,
              "assets/vectors/bottom_saved.svg",
            ),
            SvgPicture.asset(
              fit: BoxFit.fitHeight,
              height: 26,
              "assets/vectors/bottom_notification.svg",
            ),
            SvgPicture.asset(
              fit: BoxFit.fitHeight,
              height: 28,
              "assets/vectors/bottom_profile.svg",
            ),
          ],
        ),
      ),
 */
