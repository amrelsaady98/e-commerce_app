import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/repositories/product_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class ProductDetailsController extends GetxController {
  late ProductRepository _productRepository;
  Rxn<Product> product = Rxn<Product>();

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
}
