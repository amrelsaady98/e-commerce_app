import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class CartRepository {
  Future<DataState<List<CartItem>>> fetchRemoteCartItems();
  Future<List<CartItem>?> fetchLocalCartItems();
  Future<DataState> syncCartItems(List<CartItem> cartItems);
  Future<void> saveLocalCartItems(List<CartItem> cartItems);
  Future<DataState<void>> addCartItem(CartItem item);
  Future<DataState<void>> updateCartItem(CartItem item);
  Future<DataState<void>> deleteCartItem(CartItem item);
}
