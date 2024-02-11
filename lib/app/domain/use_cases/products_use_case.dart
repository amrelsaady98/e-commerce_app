import 'package:shop_app/app/data/repositorites_impls/product_repository_impl.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetAllProductsUseCase extends UseCase<DataState<List<Product>>, void> {
  GetAllProductsUseCase(this._productRepository);

  final ProductRepositoryImpl _productRepository;

  @override
  Future<DataState<List<Product>>> call({void params}) async {
    return await _productRepository.fetchAllProducts();
  }
}
