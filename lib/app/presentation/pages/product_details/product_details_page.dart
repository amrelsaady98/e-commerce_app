import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/core/theme/colors.dart';
import 'package:shop_app/core/widgets/buttons.dart';

class ProductDetailsPage extends GetView {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 54),
                  child: Hero(
                    tag: "product_image${Get.parameters['id']}",
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(48)),
                      child: Image.asset(
                        'assets/images/product_image_1.png',
                        height: Get.height * 0.58,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // TODO: animation transition from left @ onInit
                Positioned(
                  top: 48,
                  left: 54 - 48 / 2,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Get.theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 50,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            ),
                          ]),
                      child: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 54 - 64 / 2,
                  child: Container(
                    width: 64,
                    height: 72 * 3,
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            blurRadius: 50,
                            offset: Offset(2, 2),
                            spreadRadius: 0,
                          ),
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Get.theme.colorScheme.secondaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),

                            // ignore: prefer_const_constructors
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              Get.theme.colorScheme.secondaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            // ignore: prefer_const_constructors
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFB4916C),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              Get.theme.colorScheme.secondaryContainer,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            // ignore: prefer_const_constructors
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFE4CBAD),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Minimal Stand",
                style: GoogleFonts.gelasio(
                    fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ 50.00",
                    style: GoogleFonts.nunitoSans(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.add_rounded,
                          size: 24,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "01",
                          style: GoogleFonts.nunitoSans(fontSize: 18),
                        ),
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.remove_rounded,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.yellow,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "4.5",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "(23 reviews)",
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                """
Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. """,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Get.theme.colorScheme.secondaryContainer,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Container(
                        height: (Get.width - 48 - 12) / 5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    flex: 4,
                    child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Get.theme.colorScheme.primary,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Container(
                        height: (Get.width - 48 - 12) / 5,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
