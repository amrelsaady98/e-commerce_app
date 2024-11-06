import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetLocalCartItemsUseCase extends UseCase<List<CartItem>?, void> {
  final CartRepository _cartRepository;

  GetLocalCartItemsUseCase(this._cartRepository);

  @override
  Future<List<CartItem>?> call({void params}) async {
    return _cartRepository.fetchLocalCartItems();
  }
}
