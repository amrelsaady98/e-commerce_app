import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/data/models/address_model.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/core/helpers/constants/local_storage_constants.dart';

class AddressLocalServices {
  final box = GetStorage();
  Future<Map<String, dynamic>?> getAddressList() async {
    try {
      final localData = box.read<Map<String, dynamic>?>(
        LocalStorageContants.ADDRESS_LIST_KEY,
      );
      return localData;
    } catch (e) {
      Get.printError(info: e.toString());
      throw e;
    }
  }

  Future<void> updateAddressList(List<AddressModel> addressList) async {
    try {
      box.remove(LocalStorageContants.ADDRESS_LIST_KEY);

      Map<String, Map<String, dynamic>> data = {};

      for (var item in addressList) {
        data[item.id] = item.toJson();
      }

      await box.write(LocalStorageContants.ADDRESS_LIST_KEY, data);
    } catch (error) {
      Get.printError(info: error.toString());
    }
  }
}
