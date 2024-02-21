import 'package:get/get.dart';
import 'package:shop_app/app/data/data_sources/loacl/payment_cards_loacl_services.dart';
import 'package:shop_app/app/data/data_sources/remote/payment_cards_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/payment_cards_repositroy_impl.dart';
import 'package:shop_app/app/domain/use_cases/payment_card_use_cases/get_local_payment_cards_use_case.dart';
import 'package:shop_app/app/presentation/controllers/payment/add_payment_controller.dart';

class AddPaymentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetLocalPaymentCardsListUseCase(
        PaymentCardsRepositoryImpl(
            PaymentCardsLocalServices(), PaymentCardsApiServices())));
    Get.lazyPut(() => AddPaymentController());
  }
}
