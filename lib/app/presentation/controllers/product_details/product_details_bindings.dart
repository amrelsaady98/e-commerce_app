import 'package:get/get.dart';
import 'package:shop_app/app/data/data_sources/loacl/cart_local_services.dart';
import 'package:shop_app/app/data/data_sources/remote/cart_api_services.dart';
import 'package:shop_app/app/data/data_sources/remote/product_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/cart_repository_impl.dart';
import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/save_local_cart_use_case.dart';
import 'package:shop_app/app/presentation/controllers/product_details/product_details_controller.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaveLocalCartUseCase(
        CartRepositoryImpl(CartApiService(), CartLocalServices())));
    Get.lazyPut(() => ProductRepositoryImpl(ProductApiServices()));
    Get.put(ProductDetailsController());
  }
}
