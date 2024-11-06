import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class AddressRepository {
  Future<DataState<List<Address>?>> fetchRemoteAddressList();
  Future<List<Address>?> fetchLocalAddressList();
  Future updateLocalAddressList(List<Address> addressList);
  Future<void> addAddress({required Address address});
  Future<DataState<List<Address>>> saveAddressToLocal();
}
