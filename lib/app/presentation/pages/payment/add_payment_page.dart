import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/payment/add_payment_controller.dart';
import 'package:shop_app/app/presentation/pages/payment/payment_cards_widgets.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';
import 'package:shop_app/core/widgets/inputs.dart';

class AddPaymentPage extends GetView<AddPaymentController> {
  const AddPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                customSliverAppBar(
                  leadingAsset: 'assets/vectors/icon_left_arrow.svg',
                  viewActionIcon: false,
                  onLeadingIconPressed: () => Get.back(),
                  textSpan: [
                    TextSpan(
                      text: "Add Payment Method",
                      style: GoogleFonts.merriweather(
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 36)),
                SliverToBoxAdapter(
                  child: AnimatedBuilder(
                      animation: controller.animationController!,
                      builder: (context, _) {
                        return Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateY(
                                pi * controller.animationController!.value)
                            ..scale(1 -
                                (0.2 * controller.animationController!.value)),
                          child: Obx(
                            () => PaymentCardWidget(
                              cardNumber:
                                  (controller.cardNumber.value?.isNotEmpty ??
                                          false)
                                      ? controller.cardNumber.value!
                                      : "**** **** **** XXXX",
                              cardHolderName: (controller
                                          .cardHolderName.value?.isNotEmpty ??
                                      false)
                                  ? controller.cardHolderName.value!
                                  : "-----------------------",
                              cardExpiryDate: (controller
                                          .cardExpiryDate.value?.isNotEmpty ??
                                      false)
                                  ? controller.cardExpiryDate.value!
                                  : "XX/XX",
                              showBackSide:
                                  controller.animationController!.value >= 0.5,
                              cardBackgroundColor:
                                  Get.theme.colorScheme.primary,
                            ),
                          ),
                        );
                      }),
                ),
                SliverToBoxAdapter(
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: SquareTextInput(
                        label: "Card Holder Name",
                        hint: "Ex: Amr El-Saady",
                        error: controller.cardHolderNameError.value,
                        onChanged: (value) =>
                            controller.cardHolderName.value = value,
                        textInputAction: TextInputAction.next,
                        maxLength: 25,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: SquareBorederdTextInput(
                        label: "Card Number",
                        hint: "**** **** **** 1234",
                        onChanged: (value) =>
                            controller.cardNumber.value = value,
                        formatters: [
                          CreditCardNumberInputFormatter(useSeparators: true)
                        ],
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        error: controller.cardNumberError.value,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Focus(
                            autofocus: false,
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                controller.animationController?.forward();
                              } else {
                                controller.animationController?.reverse();
                              }
                            },
                            child: Obx(
                              () => SquareTextInput(
                                error: controller.cardCVVError.value,
                                hint: "123",
                                label: "CVV",
                                formatters: [CreditCardCvcInputFormatter()],
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                onChanged: (value) =>
                                    controller.cardCVV.value = value,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Flexible(
                          flex: 1,
                          child: Obx(
                            () => SquareBorederdTextInput(
                              label: "Expiration Date",
                              hint: "03/25",
                              error: controller.cardExpiryDateError.value,
                              onChanged: (value) =>
                                  controller.cardExpiryDate.value = value,
                              formatters: [CreditCardExpirationDateFormatter()],
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
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
          Container(
            margin: const EdgeInsets.all(24),
            width: double.infinity,
            child: Obx(
              () => ThikFilledTextButton(
                onPressed: () => controller.addPaymentCard(),
                text: controller.isAddLoading.value
                    ? "Loading..."
                    : "Save Address",
                backgroundColor: Get.theme.colorScheme.primary,
                textColor: Get.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
