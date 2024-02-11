import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class CartRepository {
  Future<DataState<List<CartItem<Product>>>> fetchCartItems();
  Future<DataState<void>> addCartItem(CartItem<Product> item);
  Future<DataState<void>> updateCartItem(CartItem<Product> item);
  Future<DataState<void>> deleteCartItem(CartItem<Product> item);
}
