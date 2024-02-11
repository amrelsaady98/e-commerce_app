import 'package:get/get.dart';
import 'package:shop_app/app/data/data_sources/remote/category_api_services.dart';
import 'package:shop_app/app/data/data_sources/remote/product_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/category_repository_impl.dart';
import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/domain/use_cases/category_use_case.dart';
import 'package:shop_app/app/domain/use_cases/products_use_case.dart';
import 'package:shop_app/app/presentation/controllers/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
        GetAllCategoriesUsecase(CategoryRepositoryImpl(CategoryApiServices())));
    Get.lazyPut(() =>
        GetAllProductsUseCase(ProductRepositoryImpl(ProductApiServices())));
    Get.lazyPut(() => HomeController());
  }
}
