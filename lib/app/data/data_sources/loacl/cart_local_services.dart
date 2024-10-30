import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/core/constants/local_storage_constants.dart';

class CartLocalServices {
  final box = GetStorage();

  Future<Map<String, dynamic>?> getCartItems() async {
    try {
      final localData = box.read<Map<String, dynamic>?>(
          LocalStorageContants.CART_ITEMS_LIST_KEY);
      return localData;
    } catch (e) {
      Get.printError(info: e.toString());
      return null;
    }
  }

  Future<void> updateCartItemsList(List<CartItem> cartItems) async {
    try {
      box.remove(LocalStorageContants.CART_ITEMS_LIST_KEY);

      Map<String, Map<String, dynamic>> data = {};

      for (var item in cartItems) {
        data[item.item.id] = item.toJson();
      }

      await box.write(LocalStorageContants.CART_ITEMS_LIST_KEY, data);
    } catch (error) {
      
      Get.printError(info: error.toString());
    }
  }
}
