import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/app/domain/repositories/address_repository.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class AddAddressUseCase extends UseCase<dynamic, Address> {
  final AddressRepository _addressRepository;

  AddAddressUseCase(this._addressRepository);

  @override
  Future call({required Address params}) async {
    await _addressRepository.addAddress(address: params);
  }
}
