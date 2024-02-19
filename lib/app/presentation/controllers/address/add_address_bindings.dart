import 'package:get/get.dart';
import 'package:shop_app/app/data/data_sources/loacl/address_local_services.dart';
import 'package:shop_app/app/data/data_sources/remote/address_api_services.dart';
import 'package:shop_app/app/data/repositorites_impls/address_repository_impl.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/add_address_use_case.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/get_local_addresses_use_case.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/get_remote_addresses_use_case.dart';
import 'package:shop_app/app/presentation/controllers/address/add_address_controller.dart';

class AddAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressUseCase(
        AddressRepositoryImpl(AddressApiServices(), AddressLocalServices())));
    Get.lazyPut(() => GetLocalAddressesUsecase(
        AddressRepositoryImpl(AddressApiServices(), AddressLocalServices())));
    Get.lazyPut(() => GetRemoteAddressesUsecase(
        AddressRepositoryImpl(AddressApiServices(), AddressLocalServices())));
    Get.lazyPut(() => AddAddressController());
  }
}
