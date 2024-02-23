import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/payment/payment_controller.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class PaymentCardsPage extends GetView<PaymentController> {
  const PaymentCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(
                  Routes.ADD_PAYMENT_METHOD_PAGE,
                )),
        body: CustomScrollView(
          slivers: [
            customSliverAppBar(
              leadingAsset: 'assets/vectors/icon_left_arrow.svg',
              viewActionIcon: false,
              onLeadingIconPressed: () => Get.back(),
              textSpan: [
                TextSpan(
                  text: "Payment Cards",
                  style: GoogleFonts.merriweather(
                    color: Get.theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Obx(
              () => SliverList.separated(
                itemCount: controller.paymentCards.length,
                separatorBuilder: (_, __) => SizedBox(
                  height: 24,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: controller.paymentCards[index].isDefault
                              ? Get.theme.colorScheme.primary
                              : Get.theme.colorScheme.primary.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: -20,
                              child: Image.asset(
                                  "assets/images/visa_card_vector.png"),
                            ),
                            Positioned(
                              top: 24,
                              left: 36,
                              child: Image.asset("assets/images/visa_logo.png"),
                            ),
                            Positioned(
                              top: 54,
                              left: 24,
                              child: Text(
                                controller.paymentCards[index].cardNumber,
                                style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 24,
                              bottom: 54,
                              child: Text(
                                "Card Holder Name",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 24,
                              bottom: 54,
                              child: Text(
                                'Expiry Date',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 24,
                              bottom: 28,
                              child: Text(
                                controller.paymentCards[index].cardHolderName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 50,
                              bottom: 28,
                              child: Text(
                                controller.paymentCards[index].cardExpiryDate,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: controller.paymentCards[index].isDefault,
                                onChanged: (value) =>
                                    controller.onDefaultButtonPressed(
                                  index: index,
                                  value: value ?? false,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Use as the shipping address',
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  height: 2,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
