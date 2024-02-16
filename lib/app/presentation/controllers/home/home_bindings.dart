import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/cart_manager.dart';
import 'package:shop_app/app/data/data_sources/loacl/cart_local_services.dart';
import 'package:shop_app/app/data/data_sources/remote/cart_api_services.dart';
import 'package:shop_app/app/data/data_sources/remote/category_api_services.dart';
import 'package:shop_app/app/data/data_sources/remote/product_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/cart_repository_impl.dart';
import 'package:shop_app/app/data/repositorites_impls/category_repository_impl.dart';
import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_all_cart_items_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_local_cart_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/save_local_cart_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/sync_cart_list_use_case.dart';
import 'package:shop_app/app/domain/use_cases/category_use_case.dart';
import 'package:shop_app/app/domain/use_cases/products_use_case.dart';
import 'package:shop_app/app/presentation/controllers/cart/cart_controller.dart';
import 'package:shop_app/app/presentation/controllers/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
        GetAllCategoriesUsecase(CategoryRepositoryImpl(CategoryApiServices())));
    Get.lazyPut(() =>
        GetAllProductsUseCase(ProductRepositoryImpl(ProductApiServices())));
    Get.lazyPut(() => SyncCartItemsUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => SaveLocalCartUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => GetLocalCartItemsUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => GetRemoteCartItemsUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.put(CartManager());
    Get.lazyPut(() => HomeController());
  }
}
