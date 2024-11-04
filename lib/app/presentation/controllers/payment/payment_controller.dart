import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/use_cases/payment_card_use_cases/get_local_payment_cards_use_case.dart';
import 'package:shop_app/app/domain/use_cases/payment_card_use_cases/update_payment_card_use_case.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class PaymentController extends GetxController with WidgetsBindingObserver {
  final GetLocalPaymentCardsListUseCase _getLocalPaymentCardsListUseCase =
      Get.find();
  final UpdatePaymentCardUseCase _updatePaymentCardUseCase = Get.find();

  RxList<PaymentCard> paymentCards = RxList();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future _loadData() async {
    final data = await _getLocalPaymentCardsListUseCase.call(params: null);
    if (data is DataSuccess) {
      paymentCards.clear();
      paymentCards.addAll(data.data ?? []);
    } else {
      Get.showSnackbar(GetSnackBar(
        message: data.exception?.toString(),
      ));
    }
  }

  void onDefaultButtonPressed({required int index, required bool value}) {
    if (value) {
      // disable current default;
      final currentDefaultItemIndex =
          paymentCards.indexWhere((element) => element.isDefault == true);
      if (currentDefaultItemIndex >= 0) {
        PaymentCard currentDefaultItem = paymentCards[currentDefaultItemIndex];
        currentDefaultItem.isDefault = false;
        _updatePaymentCardUseCase.call(params: currentDefaultItem);
      }
      // make new default item;
      PaymentCard paymentCard = paymentCards[index];
      paymentCard.isDefault = value;
      _updatePaymentCardUseCase.call(params: paymentCard);
      _loadData();
    }
  }
}
