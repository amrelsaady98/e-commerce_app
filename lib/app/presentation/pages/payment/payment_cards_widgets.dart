import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cardExpiryDate,
    required this.showBackSide,
    required this.cardBackgroundColor,
  });
  final String cardNumber, cardHolderName, cardExpiryDate;
  final bool showBackSide;
  final Color cardBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: !showBackSide
          ? Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: -20,
                  child: Image.asset("assets/images/visa_card_vector.png"),
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
                    cardNumber,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
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
                const Positioned(
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
                    cardHolderName,
                    style: const TextStyle(
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
                    cardExpiryDate,
                    style: const TextStyle(
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
              transform: Matrix4.identity()..rotateY(pi),
              child: Stack(
                children: [
                  Positioned(
                    top: 56,
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 64, vertical: 4),
                        height: 36,
                        width: 350,
                        color: Colors.white.withOpacity(0.85),
                        child: const Text("123"),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
