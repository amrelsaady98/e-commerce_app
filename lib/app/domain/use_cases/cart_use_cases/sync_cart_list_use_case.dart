import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class SyncCartItemsUseCase extends UseCase<void, List<CartItem>> {
  final CartRepository _cartRepository;

  SyncCartItemsUseCase(this._cartRepository);
  @override
  Future<void> call({required List<CartItem> params}) async {
    await _cartRepository.syncCartItems(params);
  }
}
