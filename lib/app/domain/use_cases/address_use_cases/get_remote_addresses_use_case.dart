import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/repositories/address_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetRemoteAddressesUsecase
    extends UseCase<DataState<List<Address>?>, void> {
  final AddressRepository _addressRepository;

  GetRemoteAddressesUsecase(this._addressRepository);

  @override
  Future<DataState<List<Address>?>> call({required void params}) async {
    return await _addressRepository.fetchRemoteAddressList();
  }
}
