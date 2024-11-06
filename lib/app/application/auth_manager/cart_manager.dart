import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/repositories/cart_repository.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_all_cart_items_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_local_cart_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/save_local_cart_use_case.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/sync_cart_list_use_case.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class CartManager extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxDouble cartTotal = 0.0.obs;

  final GetRemoteCartItemsUseCase _getRemoteCartItemsUseCase =
      Get.find<GetRemoteCartItemsUseCase>();
  final GetLocalCartItemsUseCase _getLocalCartsUseCase =
      Get.find<GetLocalCartItemsUseCase>();
  final SyncCartItemsUseCase _syncCartItemsUseCase =
      Get.find<SyncCartItemsUseCase>();
  final SaveLocalCartUseCase _saveCartItemsUseCase =
      Get.find<SaveLocalCartUseCase>();
  @override
  void onInit() {
    super.onInit();
    _initCartItems();
  }

  /// fetch remote items;
  /// if success write to local the update [cartItems] then return,
  /// if failed load from local to [cartItems];
  Future<void> _initCartItems() async {
    _loadFromLocal();
    return;
    var data = await _getRemoteCartItemsUseCase.call();
    if (data is DataSuccess) {
      cartItems.clear();
      if (data.data?.isEmpty ?? true) return;
      cartItems.addAll(data.data ?? []);
      await _updateLocal(data.data!);
    } else {}
  }

  Future<void> _updateLocal(List<CartItem> cartItems) async {
    await _saveCartItemsUseCase.call(params: cartItems);
  }

  /// update [cartItems] from local storage;
  Future<void> _loadFromLocal() async {
    final data = await _getLocalCartsUseCase.call();

    if (data == null) return;

    cartItems.clear();
    cartItems.addAll(data);
  }

  /// detrmine wether [toAddItem] is added before or add for first time;
  /// if [toAddItem] is added for first time, add directly to [cartItems];
  /// if [toAddItem] was added befor update its count;
  Future<void> _addCartItem(CartItem toAddItem) async {
    final itemIndex = cartItems.indexWhere((element) {
      var id = element.item.id;
      return element.item.id == toAddItem.item.id;
    });
    if (itemIndex >= 0) {
      cartItems[itemIndex].count += toAddItem.count;
    } else {
      cartItems.add(toAddItem);
    }
    await _updateLocal(cartItems);
  }

  /// find [cartItem] index then remove itm matches this index form [cartItems];
  /// update local cart;
  Future<void> _removeCartItem(CartItem cartItem) async {
    final itemIndex =
        cartItems.indexWhere((element) => element.item.id == cartItem.item.id);
    if (itemIndex >= 0) {
      cartItems.removeAt(itemIndex);
    } else {
      debugPrint('No Items In Cart');
    }
    await _updateLocal(cartItems);
    //TODO: update remote
  }

  /// refresh [cartItems], then add [cartItem] or update existing one;
  Future<void> addCartItem(CartItem cartItem) async {
    await _initCartItems();
    await _addCartItem(cartItem);
  }

  /// refresh [cartItems], then remove [cartItem];
  Future<void> removeCartItem(CartItem cartItem) async {
    await _initCartItems();
    await _removeCartItem(cartItem);
  }
}
