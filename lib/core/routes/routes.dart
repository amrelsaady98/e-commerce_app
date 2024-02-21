// ignore_for_file: non_constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop_app/app/presentation/controllers/address/add_address_bindings.dart';
import 'package:shop_app/app/presentation/controllers/address/address_bindings.dart';
import 'package:shop_app/app/presentation/controllers/authentication/login_bindings.dart';
import 'package:shop_app/app/presentation/controllers/cart/cart_bindings.dart';
import 'package:shop_app/app/presentation/controllers/home/home_bindings.dart';
import 'package:shop_app/app/presentation/controllers/main/main_bindings.dart';
import 'package:shop_app/app/presentation/controllers/payment/add_payment_bindings.dart';
import 'package:shop_app/app/presentation/controllers/splash/splash_bindings.dart';
import 'package:shop_app/app/presentation/pages/authintication/login_page.dart';
import 'package:shop_app/app/presentation/pages/authintication/signup_page.dart';
import 'package:shop_app/app/presentation/pages/cart/cart_page.dart';
import 'package:shop_app/app/presentation/pages/home/home_page.dart';
import 'package:shop_app/app/presentation/pages/home/main_page.dart';
import 'package:shop_app/app/presentation/pages/intro_page/intro_page.dart';
import 'package:shop_app/app/presentation/pages/payment/add_payment_page.dart';
import 'package:shop_app/app/presentation/pages/product_details/product_details_page.dart';
import 'package:shop_app/app/presentation/pages/shiping/add_shipping_address_page.dart';
import 'package:shop_app/app/presentation/pages/shiping/shipping_addresses_page.dart';
import 'package:shop_app/app/presentation/pages/splash_page/splash_page.dart';

class Routes {
  static String SPLASH_PAGE = '/splash';
  static String INTRO_PAGE = '/intro';
  static String MAIN_PAGE = '/main';
  static String HOME_PAGE = '/home';
  static String FAVOURITES_PAGE = '/favourites';
  static String NOTIFICATIONS_PAGE = '/notifications';
  static String PROFILE_PAGE = '/profile';
  static String PRODUCT_DETAILS_PAGE = '/product-details';
  static String SHIPPING_ADDRESSES_PAGE = '/shipping-addresses';
  static String ADD_SHIPPING_ADDRESSES_PAGE = '/add-shipping-addresses';
  static String ADD_PAYMENT_METHOD_PAGE = '/add-payment-method';
  static String LOGIN_PAGE = '/login';
  static String SIGNUP_PAGE = '/register';
  static String SEARCH_PAGE = '/search';
  static String INFO_PAGE = '/info';
  static String SCANNER_PAGE = '/scanner';
  static String TUTORAIL_INTRO = '/tutorial-intro';

  static String CART_PAGE = '/cart';
}

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
    binding: CartBindings(),
  ),
  GetPage(
    name: Routes.PRODUCT_DETAILS_PAGE,
    page: () => const ProductDetailsPage(),
  ),
  GetPage(
    name: Routes.SHIPPING_ADDRESSES_PAGE,
    page: () => const ShippingAddressesPage(),
    binding: AddressBindings(),
  ),
  GetPage(
    name: Routes.ADD_SHIPPING_ADDRESSES_PAGE,
    page: () => const AddShippingAddressPage(),
    binding: AddAddressBindings(),
  ),
  GetPage(
    name: Routes.ADD_PAYMENT_METHOD_PAGE,
    page: () => const AddPaymentPage(),
    binding: AddPaymentBindings()
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
