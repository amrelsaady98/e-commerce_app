import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/cart_manager.dart';
import 'package:shop_app/app/data/data_sources/loacl/cart_local_services.dart';
import 'package:shop_app/app/data/data_sources/remote/cart_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/cart_repository_impl.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_all_cart_items_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_local_cart_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/save_local_cart_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/sync_cart_list_use_case.dart';

import 'package:shop_app/app/presentation/controllers/cart/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GetAllCartItemsUseCase(CartRepo()));

    Get.lazyPut(() => SyncCartItemsUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => SaveLocalCartUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => GetLocalCartItemsUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => GetRemoteCartItemsUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => CartManager());
  }
}
