import 'package:get/get.dart';
import 'package:shop_app/app/data/repositorites_impls/address_repository_impl.dart';
import 'package:shop_app/app/data/repositorites_impls/payment_cards_repositroy_impl.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/entities/payment_card.dart';
import 'package:shop_app/app/domain/repositories/address_repository.dart';
import 'package:shop_app/app/domain/repositories/payment_cards_repository.dart';

class CheckOutController extends GetxController {
  final AddressRepository _addressRepository =
      Get.find<AddressRepositoryImpl>();
  final PaymentCardsRepository _paymentCardsRepository =
      Get.find<PaymentCardsRepositoryImpl>();

  Rxn<Address> selectedAddress = Rxn<Address>();
  Rxn<PaymentCard> selectedPaymentCard = Rxn<PaymentCard>();

  @override
  void onInit() async {
    super.onInit();
    _paymentCardsRepository.fetchLocalDefaultPaymentCard().then((value) {
      selectedPaymentCard.value = value.data;
    });
  }
}
