import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/app/presentation/controllers/cart/cart_controller.dart';
import 'package:shop_app/app/presentation/pages/cart/cart_page_widgets.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Cart",
        onLeadingPressed: () => Get.back(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(
              () => Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListView.separated(
                  itemCount: controller.cartList.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Divider(
                        thickness: 0.5,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    CartItem cartItem = controller.cartList[index];
                    return CartItemTile(
                      cartItem: cartItem,
                      onRemovePressed: () =>
                          controller.deleteCartItem(cartItem),
                      onIcreasePressed: () =>
                          controller.increaseCartItemAmount(cartItem),
                      onDecreasePressed: () =>
                          controller.decreaseCartItemAmount(cartItem),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                Container(
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Get.theme.colorScheme.surface,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(138, 149, 158, 0.25),
                          blurRadius: 30,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your promo code",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 0,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                          size: 36,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "\$ 450.00",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ThikFilledTextButton(
                    onPressed: () => Get.toNamed(Routes.CHECKOUT_PAGE),
                    text: "Check out",
                    backgroundColor: Get.theme.colorScheme.primary,
                    textColor: Get.theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
