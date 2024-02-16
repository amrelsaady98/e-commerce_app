import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/data/data_sources/loacl/cart_local_services.dart';
import 'package:shop_app/app/data/data_sources/remote/cart_api_services.dart';
import 'package:shop_app/app/data/models/cart_item_model.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class CartRepositoryImpl extends CartRepository {
  final CartApiService _cartApiService;
  final CartLocalServices _cartLocalServices;

  CartRepositoryImpl(this._cartApiService, this._cartLocalServices);
  @override
  @override
  Future<DataState<void>> deleteCartItem(CartItem item) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<CartItem>>> fetchRemoteCartItems() async {
    List<CartItem> data = [];
    final response = await _cartApiService.fetchAllCartItems();
    if (response.isOk) {
      // json to Model list conversion
      data = (response.body?['cart-items'] as List<Map<String, dynamic>>)
          .map((e) => CartItemModel.fromJson(e))
          .toList();
      return DataSuccess<List<CartItem>>(data);
    } else {
      return DataField(
        GetHttpException(
          response.statusText ?? "error @cart_repository_impl.dart",
        ),
      );
    }
  }

  @override
  Future<List<CartItem>?> fetchLocalCartItems() async {
    List<CartItem> data = [];
    final localData = await _cartLocalServices.getCartItems();

    if (localData != null) {
      for (var element in localData.keys) {
        data.add(CartItemModel.fromJson(localData[element]!));
      }
      return data;
    }
    return null;
  }

  @override
  Future<DataState> syncCartItems(List<CartItem> cartItems) async {
    Map<String, dynamic> data = {};
    for (var element in cartItems) {
      data[element.item.id] = element.toJson();
    }
    final response = await _cartApiService.syncCartItems(data);
    if (response.isOk) {
      return DataSuccess(null);
    }

    return DataField(
      GetHttpException(
          response.statusText ?? "network error @cart_repository_impl.dart"),
    );
  }

  @override
  Future<DataState<void>> updateCartItem(CartItem item) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> addCartItem(CartItem item) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveLocalCartItems(List<CartItem> cartItems) async {
    await _cartLocalServices.updateCartItemsList(cartItems);
  }
}
