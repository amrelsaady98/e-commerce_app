import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/domain/use_cases/cart_use_cases/get_all_cart_items_use_case.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class CartManager extends GetxController {
  RxList<CartItem<Product>> cartItems = <CartItem<Product>>[].obs;
  RxDouble cartTotal = 0.0.obs;

  final GetAllCartItemsUseCase _getAllCartItemsUseCase =
      Get.find<GetAllCartItemsUseCase>();
  @override
  void onInit() {
    super.onInit();
    _initCartItems();
  }

  /// fetch remote items;
  /// if success write to local the update [cartItems] then return,
  /// if failed load from local to [cartItems];
  void _initCartItems() async {
    var data = await _getAllCartItemsUseCase.call();
    if (data is DataSuccess) {
      cartItems.clear();
      if (data.data?.isEmpty ?? true) return;
      cartItems.addAll(data.data ?? []);
      _updateLocal(data.data!);
    } else {
      _loadFromLocal();
    }
  }

  void _updateLocal(List<CartItem<Product>> cartItems) async {
    final box = GetStorage();
    await box.write('cart_items', cartItems);
  }

  /// update [cartItems] from local storage;
  void _loadFromLocal() {
    final box = GetStorage();
    final localData = box.read<List<CartItem<Product>>>('cart_items');
    cartItems.addAll(localData ?? []);
  }

  /// detrmine wether [toAddItem] is added before or add for first time;
  /// if [toAddItem] is added for first time, add directly to [cartItems];
  /// if [toAddItem] was added befor update its count;
  void _addCartItem(CartItem<Product> toAddItem) {
    final itemIndex =
        cartItems.indexWhere((element) => element.item.id == toAddItem.item.id);
    if (itemIndex >= 0) {
      cartItems[itemIndex].count += toAddItem.count;
    } else {
      cartItems.add(toAddItem);
    }
    _updateLocal(cartItems);
    //TODO: update remote
  }

  /// refresh [cartItems], then add [toAddItem] or update existing one;
  void addToCart(CartItem<Product> toAddItem) {
    _initCartItems();
    _addCartItem(toAddItem);
  }


}
