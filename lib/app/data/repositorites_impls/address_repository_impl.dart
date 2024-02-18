import 'package:shop_app/app/data/data_sources/loacl/address_local_services.dart';
import 'package:shop_app/app/data/data_sources/remote/address_api_services.dart';
import 'package:shop_app/app/data/models/address_model.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/repositories/address_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressApiServices _addressApiServices;
  final AddressLocalServices _addressLocalServices;

  AddressRepositoryImpl(this._addressApiServices, this._addressLocalServices);

  @override
  Future<void> addAddress({required Address address}) async {
    final data = await _addressLocalServices.getAddressList();
    List<AddressModel> addressList = [];
    if (data != null && data.keys.isNotEmpty) {
      for (var index in data.keys) {
        var element = data[index];
        addressList.add(AddressModel.fromJson(element));
      }
    }
    addressList.add(address as AddressModel);
    _addressLocalServices.updateAddressList(addressList);
    await _addressApiServices.addAddress(address: address);
  }

  @override
  Future<List<Address>?> fetchLocalAddressList() async {
    var data = await _addressLocalServices.getAddressList();
    List<AddressModel> addressList = [];
    if (data != null && data.keys.isNotEmpty) {
      for (var index in data.keys) {
        var element = data[index];
        addressList.add(AddressModel.fromJson(element));
      }
    }
    return addressList;
  }

  @override
  Future<DataState<List<Address>?>> fetchRemoteAddressList() async {
    return await _addressApiServices.fetchAllAddresses();
  }

  @override
  Future<DataState<List<Address>>> saveAddressToLocal() {
    // TODO: implement saveAddressToLocal
    throw UnimplementedError();
  }
}
