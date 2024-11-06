import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/payment/payment_controller.dart';
import 'package:shop_app/app/presentation/pages/payment/payment_cards_widgets.dart';
import 'package:shop_app/core/routes/routes.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

class PaymentCardsPage extends GetView<PaymentController> {
  const PaymentCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_PAYMENT_METHOD_PAGE),
          shape: const CircleBorder(eccentricity: 0.1),
          child: const Icon(Icons.add),
        ),
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
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      PaymentCardWidget(
                        cardNumber: controller.paymentCards[index].cardNumber,
                        cardHolderName:
                            controller.paymentCards[index].cardHolderName,
                        cardExpiryDate:
                            controller.paymentCards[index].cardExpiryDate,
                        showBackSide: false,
                        cardBackgroundColor: controller
                                .paymentCards[index].isDefault
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.primary.withOpacity(0.6),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
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
                              'Use as Default Payment Card',
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
