
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/use_cases/payment_card_use_cases/add_payment_card_use_case.dart';
import 'package:shop_app/app/domain/use_cases/payment_card_use_cases/get_local_payment_cards_use_case.dart';
import 'package:shop_app/core/theme/colors.dart';

class AddPaymentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rxn<String?> cardNumber = Rxn<String?>();
  Rxn<String?> cardHolderName = Rxn<String?>();
  Rxn<String?> cardExpiryDate = Rxn<String?>();
  Rxn<String?> cardCVV = Rxn<String?>();

  Rxn<String?> cardNumberError = Rxn<String?>();
  Rxn<String?> cardHolderNameError = Rxn<String?>();
  Rxn<String?> cardExpiryDateError = Rxn<String?>();
  Rxn<String?> cardCVVError = Rxn<String?>();

  RxBool isAddLoading = false.obs;

  final AddPaymentCardUseCase _addPaymentCardUseCase = Get.find();
  final GetLocalPaymentCardsListUseCase _getLocalPaymentCardsListUseCase =
      Get.find();

  final Rxn<AnimationController> _animationController =
      Rxn<AnimationController>();
  AnimationController? get animationController => _animationController.value;

  final Rxn<Animation<double?>> _valueAnimation = Rxn<Animation<double?>>();
  Animation<double?>? get colorAnimation => _valueAnimation.value;

  @override
  void onInit() {
    super.onInit();

    const duration = Duration(milliseconds: 1000);
    _animationController.value = AnimationController(
      vsync: this,
      duration: duration,
    );

    _valueAnimation.value = (Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.ease))
        .animate(_animationController.value!)
      ..addListener(() {
        update();
      }));
  }

  void addPaymentCard() async {
    final inputValid = _validateInput();

    if (inputValid) {
      isAddLoading.value = true;
      final savedList =
          await _getLocalPaymentCardsListUseCase.call(params: null);
      _addPaymentCardUseCase.call(
          params: PaymentCard(
        id: "${savedList.data?.length ?? 0}",
        isDefault: false,
        cardNumber: cardNumber.value!,
        cardHolderName: cardHolderName.value!,
        cardExpiryDate: cardExpiryDate.value!,
        cardCVV: cardCVV.value!,
      ));
      isAddLoading.value = false;
      Get.showSnackbar(
        const GetSnackBar(
          backgroundColor: AppColors.success,
          duration: Duration(seconds: 2),
          message: "Card Added Successfully!",
        ),
      );
    }
  }

  bool _validateInput() {
    cardNumberError.value = null;
    cardHolderNameError.value = null;
    cardExpiryDateError.value = null;
    cardCVVError.value = null;

    if (cardHolderName.value == null || cardHolderName.value!.isEmpty) {
      cardHolderNameError.value = 'required';
      return false;
    }
    if (cardNumber.value == null || cardNumber.value!.length < 16) {
      cardNumberError.value = 'Invalid Card Number';
      return false;
    }
    if (cardCVV.value == null || cardCVV.value!.length < 3) {
      cardCVVError.value = 'Invalid Card CVV';
      return false;
    }
    if (cardExpiryDate.value == null || cardExpiryDate.value!.length < 5) {
      cardExpiryDateError.value = 'Invalid Card Expiry Date';
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    _animationController.value!.dispose();
    super.onClose();
  }
}
