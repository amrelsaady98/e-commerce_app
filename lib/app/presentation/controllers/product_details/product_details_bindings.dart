import 'package:get/get.dart';
import 'package:shop_app/app/data/data_sources/remote/product_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/presentation/controllers/product_details/product_details_controller.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRepositoryImpl(ProductApiServices()));
    Get.put(ProductDetailsController());
  }
}
