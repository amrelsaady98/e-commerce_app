import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class FavouritesPage extends GetView {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                customSliverAppBar(textSpan: [
                  TextSpan(
                    text: "Favourites",
                    style: GoogleFonts.merriweather(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 18,
                    ),
                  )
                ]),
                SliverList.separated(
                    itemCount: 23,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/product_image_1.png',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "cartItem.item.name",
                                        style: GoogleFonts.nunitoSans(),
                                      ),
                                      GestureDetector(
                                        // onTap: onRemovePressed,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              'assets/vectors/icon_close.svg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$ 250.00",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    width: double.infinity,
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Get.theme.colorScheme.primary
                                            .withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/vectors/icon_add_to_cart.svg',
                                        color: Get.theme.colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: Divider(
                          thickness: 0.5,
                          color: Get.theme.colorScheme.secondary,
                        ),
                      );
                    })
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            child: ThikFilledTextButton(
              onPressed: () {},
              text: "Add All to Cart",
              backgroundColor: Get.theme.colorScheme.primary,
              textColor: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
