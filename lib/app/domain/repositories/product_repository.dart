import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class ProductRepository {
  Future<DataState<List<Product>>> fetchAllProducts({String? categoryId});
}
