import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shop_app/app/presentation/controllers/splash/splash_controller.dart';

class SplashPage extends GetView<SplashContorller> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "assets/vectors/login_header_icon.svg",
          height: 110,
          width: 110,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
