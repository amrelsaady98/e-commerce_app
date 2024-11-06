import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/cart_manager.dart';
import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/repositories/product_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class ProductDetailsController extends GetxController {
  late ProductRepository _productRepository;
  Rxn<Product> product = Rxn<Product>();
  RxInt quantity = RxInt(1);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _productRepository = Get.find<ProductRepositoryImpl>();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    final response = await _productRepository.fetchProductById(
        productId: Get.parameters['id']!);
    if (kDebugMode) {
      print(response.data.toString());
    }
    if (response is DataSuccess) {
      product.value = response.data;
    }
  }

  void addToCart() {
    if (product.value == null) return;
    CartItem cartItem = CartItem(item: product.value!, count: quantity.value);
    Get.find<CartManager>().addCartItem(cartItem);
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Get.theme.colorScheme.primaryContainer,
        messageText: Text(
          'Item Added To Cart',
          style: Get.textTheme.bodyLarge
              ?.copyWith(color: Get.theme.colorScheme.primary),
        ),
      ),
    );
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    quantity.value--;
    if (quantity.value < 1) {
      quantity.value = 1;
    }
  }
}
