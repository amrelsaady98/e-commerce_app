import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/get_local_addresses_use_case.dart';

class AddressController extends GetxController {
  RxList<Address> addressList = <Address>[].obs;

  GetLocalAddressesUsecase _getLocalAddressesUsecase = Get.find();

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
}
