import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/add_address_use_case.dart';
import 'package:shop_app/app/domain/use_cases/address_use_cases/get_local_addresses_use_case.dart';
import 'package:shop_app/core/constants/address_constants.dart';
import 'package:shop_app/core/theme/colors.dart';

class AddAddressController extends GetxController {
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressLineController = TextEditingController();
  TextEditingController addressPhoneController = TextEditingController();

  Rx<String?> selectedGovernorateId = Rx<String?>(null);
  RxList<City?> citiesList = <City?>[].obs;
  Rx<String?> selectedCityId = Rx<String?>(null);
  Governorate? _selectedGovernorate;
  City? _selectedCity;

  Rx<String?> addresTitleError = Rx<String?>(null);
  Rx<String?> addresLineError = Rx<String?>(null);
  Rx<String?> addresPhoneError = Rx<String?>(null);

  final AddAddressUseCase _addAddressUseCase = Get.find<AddAddressUseCase>();
  final GetLocalAddressesUsecase _getLocalAddressesUsecase =
      Get.find<GetLocalAddressesUsecase>();

  void onGovernorateChange(String? value) {
    selectedGovernorateId.value = value;
    selectedCityId.value = null;
    // load Cities list
    _loadCitiesList(value);
  }

  void onCityChangged(String? value) {
    selectedCityId.value = value;
  }

  void _loadCitiesList(String? value) {
    citiesList.clear();
    List<City?> cities = [];

    /// TODO: filter with multi-threading [Isolate]
    for (var element in CITIES_LIST) {
      final city = City.fromJson(element);
      if (city.governorateId == value) {
        cities.add(city);
      }
    }
    citiesList.addAll(cities);
  }

  void onSaveAddressPressed() async {
    final addressList = await _getLocalAddressesUsecase.call(params: null);

    // validation
    bool isValidAddress = _validateAddress();
    if (isValidAddress) {
      _addAddressUseCase.call(
          params: Address(
        id: "${addressList?.length ?? 0}",
        addressTitle: addressNameController.text,
        addressLine: addressLineController.text,
        phoneNumber: addressPhoneController.text,
        governorate: _selectedGovernorate!,
        city: _selectedCity!,
      ));
    }
  }

  onCityItemPressed(City? element) {
    _selectedCity = element;
  }

  onGovernoratePressed(Governorate governorate) {
    _selectedGovernorate = governorate;
  }

  bool _validateAddress() {
    addresTitleError.value = null;
    addresLineError.value = null;
    addresPhoneError.value = null;
    if (addressNameController.text.isEmpty) {
      addresTitleError.value = 'Title is required';
      return false;
    }
    if (addressLineController.text.isEmpty) {
      addresLineError.value = 'Address is required';
      return false;
    }
    if (addressPhoneController.text.isEmpty) {
      addresPhoneError.value = 'Title is required';
      return false;
    }
    if (selectedGovernorateId.value == null) {
      _showError("Please, select your Governorate", "Invalid input");
      return false;
    }
    if (selectedCityId.value == null) {
      _showError("Please, select your city", "Invalid input");
      return false;
    }
    return true;
  }

  void _showError(String message, String title) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: AppColors.red,
      title: title,
      duration: Duration(seconds: 3),
    ));
  }
}
