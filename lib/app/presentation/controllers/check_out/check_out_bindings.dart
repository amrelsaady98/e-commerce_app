import 'package:get/get.dart';
import 'package:shop_app/app/data/data_sources/loacl/address_local_services.dart';
import 'package:shop_app/app/data/data_sources/loacl/payment_cards_loacl_services.dart';
import 'package:shop_app/app/data/data_sources/remote/address_api_services.dart';
import 'package:shop_app/app/data/data_sources/remote/payment_cards_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/address_repository_impl.dart';
import 'package:shop_app/app/data/repositorites_impls/payment_cards_repositroy_impl.dart';

import 'check_out_controller.dart';

class CheckOutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressRepositoryImpl(
          AddressApiServices(),
          AddressLocalServices(),
        ));
    Get.lazyPut(() => PaymentCardsRepositoryImpl(
          PaymentCardsLocalServices(),
          PaymentCardsApiServices(),
        ));
    Get.lazyPut(() => CheckOutController());
  }
}
