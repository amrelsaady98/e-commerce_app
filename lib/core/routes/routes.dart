import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop_app/app/presentation/controllers/authentication/login_bindings.dart';
import 'package:shop_app/app/presentation/controllers/home/home_bindings.dart';
import 'package:shop_app/app/presentation/controllers/main/main_bindings.dart';
import 'package:shop_app/app/presentation/controllers/splash/splash_bindings.dart';
import 'package:shop_app/app/presentation/pages/authintication/login_page.dart';
import 'package:shop_app/app/presentation/pages/authintication/signup_page.dart';
import 'package:shop_app/app/presentation/pages/cart/cart_page.dart';
import 'package:shop_app/app/presentation/pages/home/home_page.dart';
import 'package:shop_app/app/presentation/pages/home/main_page.dart';
import 'package:shop_app/app/presentation/pages/intro_page/intro_page.dart';
import 'package:shop_app/app/presentation/pages/product_details/product_details_page.dart';
import 'package:shop_app/app/presentation/pages/splash_page/splash_page.dart';

class Routes {
  static String SPLASH_PAGE = '/splash';
  static String INTRO_PAGE = '/intro';
  static String MAIN_PAGE = '/main';
  static String HOME_PAGE = '/home';
  static String PRODUCT_DETAILS_PAGE = '/product_details';
  static String LOGIN_PAGE = '/login';
  static String SIGNUP_PAGE = '/register';
  static String SEARCH_PAGE = '/search';
  static String INFO_PAGE = '/info';
  static String SCANNER_PAGE = '/scanner';
  static String TUTORAIL_INTRO = '/tutorial-intro';

  static String CART_PAGE = '/cart';
}

// ignore: non_constant_identifier_names
final List<GetPage> GET_PAGES = [
  GetPage(
    name: Routes.MAIN_PAGE,
    page: () => const MainPage(),
    binding: MainBindings(),
  ),
  GetPage(
    name: Routes.HOME_PAGE,
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: Routes.CART_PAGE,
    page: () => const CartPage(),
    
  ),
  GetPage(
    name: Routes.PRODUCT_DETAILS_PAGE,
    page: () => const ProductDetailsPage(),
  ),
  GetPage(
    name: Routes.SPLASH_PAGE,
    page: () => const SplashPage(),
    binding: SplashBindings(),
  ),
  GetPage(
    name: Routes.INTRO_PAGE,
    page: () => const IntroPage(),
  ),
  GetPage(
    name: Routes.LOGIN_PAGE,
    page: () => LoginPage(),
    binding: LoginBindings(),
  ),
  GetPage(
    name: Routes.SIGNUP_PAGE,
    page: () => const SignupPgae(),
  ),
];
