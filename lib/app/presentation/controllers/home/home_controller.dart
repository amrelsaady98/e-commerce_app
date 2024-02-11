import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/domain/entities/category.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/use_cases/category_use_case.dart';
import 'package:shop_app/app/domain/use_cases/products_use_case.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/theme/colors.dart';

class HomeController extends GetxController {
  RxList<Category> categories = RxList<Category>([]);
  RxList<Product> products = RxList<Product>([]);

  final _getAllCategoriesUseCase = Get.find<GetAllCategoriesUsecase>();
  final _getAllProductsUseCase = Get.find<GetAllProductsUseCase>();
  var selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    fetchAllCategories();
    fetchAllProducts();
    super.onInit();
  }

  void fetchAllCategories() async {
    var data = await _getAllCategoriesUseCase.call();
    if (data is DataSuccess) {
      categories.clear();
      if (data.data != null) {
        categories.addAll(data.data!);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 2),
        title: "error",
        backgroundColor: AppColors.red,
        messageText: Text((data.exception as GetHttpException).message),
      ));
    }
  }

  void fetchAllProducts() async {
    var data = await _getAllProductsUseCase.call();
    if (data is DataSuccess) {
      products.clear();
      if (data.data != null) {
        products.addAll(data.data!);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        title: "error",
        backgroundColor: AppColors.red,
        messageText: Text((data.exception as GetHttpException).message),
      ));
    }
  }

  void categoryItempresed(int index) {
    selectedCategoryIndex.value = index;
    selectedCategoryIndex.refresh();
  }
}
