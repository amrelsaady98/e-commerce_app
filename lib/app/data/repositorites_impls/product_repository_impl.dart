import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/data/data_sources/remote/product_api_services.dart';
import 'package:shop_app/app/data/models/product_model.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/repositories/product_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(this._apiServices);
  final ProductApiServices _apiServices;

  @override
  Future<DataState<List<Product>>> fetchAllProducts(
      {String? categoryId}) async {
    var response = await _apiServices.fetchAllProducts();
    if (response.status.isOk) {
      List<ProductModel> categories =
          (response.body?['products'] as List<Map<String, dynamic>>)
              .map<ProductModel>((e) => ProductModel.fromJson(e))
              .toList();
      return DataSuccess<List<ProductModel>>(categories);
    } else {

      // TODO: retrive local data from local data source
      return DataField(
          GetHttpException(response.statusText ?? "Connection Failed"));
    }
  }
}