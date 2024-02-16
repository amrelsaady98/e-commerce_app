import 'package:get/get.dart';
import 'package:shop_app/app/application/auth_manager/cart_manager.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';

class CartController extends GetxController {
  var cartList = Get.find<CartManager>().cartItems;
  var cartTotal = Get.find<CartManager>().cartTotal;
  RxBool isLoading = false.obs;
  RxBool iscartListSynced = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void deleteCartItem(CartItem cartItem) async {
    isLoading.value = true;
    await Get.find<CartManager>().removeCartItem(cartItem);
    isLoading.value = false;
  }

  void increaseCartItemAmount(CartItem cartItem) async {
    cartItem.count = 1;
    await Get.find<CartManager>().addCartItem(cartItem);
  }

  void decreaseCartItemAmount(CartItem cartItem) async {
    if (!(cartItem.count > 1)) {
      deleteCartItem(cartItem);
      return;
    }
    cartItem.count = -1;
    await Get.find<CartManager>().addCartItem(cartItem);
  }
}
