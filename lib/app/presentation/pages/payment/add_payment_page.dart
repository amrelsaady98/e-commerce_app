import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/presentation/controllers/payment/add_payment_controller.dart';
import 'package:shop_app/core/widgets/buttons.dart';
import 'package:shop_app/core/widgets/custom_app_bar.dart';

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
                          child: GestureDetector(
                            onTap: () =>
                                controller.animationController?.forward(),
                            onDoubleTap: () =>
                                controller.animationController?.reverse(),
                            child: Obx(
                              () => Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 54),
                                child: controller.animationController!.value <=
                                        0.5
                                    ? Stack(
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
                                            child: Image.asset(
                                                "assets/images/visa_logo.png"),
                                          ),
                                          Positioned(
                                            top: 54,
                                            left: 24,
                                            child: Text(
                                              (controller.cardNumber.value
                                                          ?.isNotEmpty ??
                                                      false)
                                                  ? controller.cardNumber.value!
                                                  : "**** **** **** 1234",
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
                                              (controller.cardHolderName.value
                                                          ?.isNotEmpty ??
                                                      false)
                                                  ? controller
                                                      .cardHolderName.value!
                                                  : "-----------------------",
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
                                              (controller.cardExpiryDate.value
                                                          ?.isNotEmpty ??
                                                      false)
                                                  ? controller
                                                      .cardExpiryDate.value!
                                                  : "##/##",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Transform(
                                        alignment: FractionalOffset.center,
                                        transform: Matrix4.identity()
                                          ..rotateY(pi),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 56,
                                              child: Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 64,
                                                      vertical: 4),
                                                  height: 36,
                                                  width: 350,
                                                  color: Colors.white
                                                      .withOpacity(0.85),
                                                  child: Text("123"),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 12,
                      right: 12,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.secondaryContainer,
                    ),
                    child: Obx(
                      () => TextField(
                        enabled: true,
                        // controller: controller.addressNameController,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 18),

                        onChanged: (value) =>
                            controller.cardHolderName.value = value,
                        maxLength: 25,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          errorText: controller.cardHolderName.value,
                          hintText: "Ex: Amr El-Saady",
                          labelText: "Card Holder Name",
                          // errorText: controller.addresTitleError.value,

                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(
                            gapPadding: 12,
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 12,
                      right: 12,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Get.theme.colorScheme.primary, width: 0.5),
                    ),
                    child: Obx(
                      () => TextField(
                        enabled: true,
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            controller.cardNumber.value = value,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 18),
                        inputFormatters: [
                          CreditCardNumberInputFormatter(useSeparators: true)
                        ],
                        decoration: InputDecoration(
                          errorText: controller.cardNumberError.value,
                          contentPadding: EdgeInsets.zero,
                          labelText: "Card Number",
                          hintText: "**** **** **** 1234",
                          // errorText: controller.addresTitleError.value,

                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(
                            gapPadding: 12,
                            borderSide: BorderSide.none,
                          ),
                        ),
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
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 12,
                              right: 12,
                              bottom: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.secondaryContainer,
                            ),
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
                                () => TextField(
                                  enabled: true,
                                  // controller: controller.addressNameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 18),
                                  inputFormatters: [
                                    CreditCardCvcInputFormatter()
                                  ],

                                  focusNode: FocusNode(),
                                  decoration: InputDecoration(
                                    errorText: controller.cardCVVError.value,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: "123",
                                    labelText: "CVV",
                                    // errorText: controller.addresTitleError.value,

                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: const OutlineInputBorder(
                                      gapPadding: 12,
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 24),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 12,
                              right: 12,
                              bottom: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Get.theme.colorScheme.primary,
                                  width: 0.5),
                            ),
                            child: Focus(
                              child: Obx(
                                () => TextField(
                                  enabled: true,
                                  // controller: controller.addressNameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 18),
                                  inputFormatters: [
                                    CreditCardExpirationDateFormatter()
                                  ],
                                  onChanged: (value) =>
                                      controller.cardExpiryDate.value = value,
                                  decoration: InputDecoration(
                                    errorText:
                                        controller.cardExpiryDateError.value,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: "03/25",
                                    labelText: "Expiration Date",
                                    // errorText: controller.addresTitleError.value,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: const OutlineInputBorder(
                                      gapPadding: 12,
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
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
            margin: EdgeInsets.all(24),
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
