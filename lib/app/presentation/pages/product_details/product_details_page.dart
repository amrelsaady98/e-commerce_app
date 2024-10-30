import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/domain/entities/product.dart';
import 'package:shop_app/app/presentation/app.dart';
import 'package:shop_app/app/presentation/controllers/product_details/product_details_controller.dart';
import 'package:shop_app/core/helpers/constants/api_constants.dart';
import 'package:shop_app/core/theme/colors.dart';
import 'package:shop_app/core/widgets/buttons.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            // TODO: animation transition from left @ onInit
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.only(left: 54),
                          child: Hero(
                            tag: "product_image${Get.parameters['id']}",
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(48)),
                              child: controller.product.value == null
                                  ? Image.network(
                                      ApiConstants.BASE_URL +
                                              (Get.arguments as Product)
                                                  .thumbnailImage ??
                                          "",
                                      height: Get.height * 0.58,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "${ApiConstants.BASE_URL}${controller.product.value?.thumbnailImage}",
                                      height: Get.height * 0.58,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
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
                      Obx(
                        () => Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${controller.product.value?.mainPrice}",
                                style: GoogleFonts.nunitoSans(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Get.theme.colorScheme
                                            .secondaryContainer,
                                        borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.add_rounded,
                                      size: 24,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    child: Text(
                                      "01",
                                      style:
                                          GoogleFonts.nunitoSans(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        color: Get.theme.colorScheme
                                            .secondaryContainer,
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
                      ),
                      const SizedBox(height: 12),
                      Obx(() => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.yellow,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${controller.product.value?.totalRating ?? 3.0}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                const Text(
                                  "(23 reviews)",
                                  style:
                                      TextStyle(color: AppColors.secondaryText),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 12),
                      Obx(() => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              "${controller.product.value?.description ?? ""}",
                              style: TextStyle(fontSize: 14),
                            ),
                          )),
                      const SizedBox(height: 100),
                    ],
                  ),
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
                        padding: const EdgeInsets.all(8),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
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
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),

                              // ignore: prefer_const_constructors
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Get.theme.colorScheme.secondaryContainer,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              // ignore: prefer_const_constructors
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFB4916C),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Get.theme.colorScheme.secondaryContainer,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              // ignore: prefer_const_constructors
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFE4CBAD),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Get.height - 80,
              left: 0,
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                            child: const Text(
                              "Add To Cart",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
