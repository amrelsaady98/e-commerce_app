import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/repositories/address_repository.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class GetLocalAddressesUsecase extends UseCase<List<Address>?, dynamic> {
  final AddressRepository _addressRepository;

  GetLocalAddressesUsecase(this._addressRepository);

  @override
  Future<List<Address>?> call({required void params}) async {
    return await _addressRepository.fetchLocalAddressList();
  }
}
