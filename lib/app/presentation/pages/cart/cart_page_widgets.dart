import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/domain/entities/cart_item.dart';
import 'package:shop_app/core/helpers/constants/api_constants.dart';
import 'package:shop_app/core/widgets/buttons.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onRemovePressed,
    required this.onIcreasePressed,
    required this.onDecreasePressed,
  });

  final CartItem cartItem;
  final void Function() onRemovePressed;
  final void Function() onIcreasePressed;
  final void Function() onDecreasePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${ApiConstants.BASE_URL}${cartItem.item.thumbnailImage}',
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.item.name,
                      style: GoogleFonts.nunitoSans(),
                    ),
                    GestureDetector(
                      onTap: onRemovePressed,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            SvgPicture.asset('assets/vectors/icon_close.svg'),
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ ${cartItem.item.mainPrice}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                ProductCounter(
                  count: cartItem.count,
                  increse: onIcreasePressed,
                  decrese: onDecreasePressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
