import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/application/auth_manager/cart_manager.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/entities/category.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/use_cases/category_use_case.dart';
import 'package:shop_app/app/domain/use_cases/products_use_case.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/theme/colors.dart';

class HomeController extends GetxController {
  RxList<Category> categories = RxList<Category>([]);
  RxList<Product> products = RxList<Product>([]);

  RxBool isCategoryLoading = false.obs;
  RxBool isProductLoading = false.obs;

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
    isCategoryLoading.value = true;
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
    isCategoryLoading.value = false;
  }

  void fetchAllProducts() async {
    isProductLoading.value = true;
    var data = await _getAllProductsUseCase.call();
    if (data is DataSuccess) {
      products.clear();
      if (data.data != null) {
        products.addAll(data.data!);
      }
    } else {
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 2),
          title: "error",
          backgroundColor: AppColors.red,
          messageText: Text((data.exception as GetHttpException).message),
        ),
      );
    }
    isProductLoading.value = false;
  }

  void categoryItempresed(int index) {
    isProductLoading.value = true;
    selectedCategoryIndex.value = index;
    Future.delayed(Durations.long4)
        .whenComplete(() => isProductLoading.value = false);
  }

  void addToCartPressed({required int index}) async {
    Product selectedProduct = products[index];
    CartItem cartItem = CartItem(item: selectedProduct, count: 1);
    Get.find<CartManager>().addCartItem(cartItem);
  }
}
