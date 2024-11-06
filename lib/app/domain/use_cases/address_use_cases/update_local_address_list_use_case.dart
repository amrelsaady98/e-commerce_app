import 'package:shop_app/app/data/repositorites_impls/address_repository_impl.dart';
import 'package:shop_app/app/domain/entities/address.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class UpdateLocalAddressListUseCase extends UseCase<dynamic, List<Address>> {
  final AddressRepositoryImpl _addressRepositoryImpl;

  UpdateLocalAddressListUseCase(this._addressRepositoryImpl);

  @override
  Future call({required List<Address> params}) async {
    _addressRepositoryImpl.updateLocalAddressList(params);
  }
}
