import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetAllCartItemsUseCase
    extends UseCase<DataState<List<CartItem>>, void> {
  GetAllCartItemsUseCase(this._cartRepository);

  final CartRepository _cartRepository;
  @override
  Future<DataState<List<CartItem>>> call({void params}) async {
    return await _cartRepository.fetchCartItems();
  }
}
