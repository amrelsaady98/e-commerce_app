import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:shop_app/app/presentation/controllers/splash/splash_controller.dart';

class SplashPage extends GetView<SplashContorller> {
  const SplashPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/apple_logo.png"),
      ),
    );
  }
}
