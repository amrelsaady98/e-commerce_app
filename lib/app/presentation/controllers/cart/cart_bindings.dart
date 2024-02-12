import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/cart_manager.dart';
import 'package:shop_app/app/data/repositorites_impls/category_repository_impl.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_all_cart_items_use_case.dart';
import 'package:shop_app/app/presentation/controllers/cart/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GetAllCartItemsUseCase(CartRepo()));
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => CartManager());
  }
}
