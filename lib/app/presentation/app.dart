import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_app/app/presentation/pages/intro_page/intro_page.dart';
import 'package:shop_app/app/presentation/pages/splash_page/splash_page.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/theme/theme.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH_PAGE,
        theme: LIGHT_THEME,
        getPages: GET_PAGES,
      );
    });
  }
}
