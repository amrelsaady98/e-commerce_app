import 'package:get/get.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/get_local_addresses_use_case.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/update_local_address_list_use_case.dart';

class AddressController extends GetxController {
  RxList<Address> addressList = <Address>[].obs;

  final GetLocalAddressesUsecase _getLocalAddressesUsecase = Get.find();
  final UpdateLocalAddressListUseCase _updateLocalAddressListUseCase =
      Get.find();

  @override
  void onInit() {
    _loadLocalAddresses();
    super.onInit();
  }

  void _loadLocalAddresses() async {
    final localData = await _getLocalAddressesUsecase.call(params: null);
    addressList.clear();
    addressList.addAll(localData ?? <Address>[]);
  }

  void onDefaultChekboxPressed(int index, bool? value) {
    if (value ?? false) {
      for (var element in addressList) {
        element.isDefault = false;
      }
    }
    Address address = addressList[index];
    address.isDefault = value ?? false;
    addressList[index] = address;
    _updateLocalAddressListUseCase.call(params: addressList);
  }
}
