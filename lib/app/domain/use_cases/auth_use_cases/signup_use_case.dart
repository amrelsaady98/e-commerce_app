import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/entities/register_request.dart';
import 'package:shop_app/app/domain/entities/register_response.dart';
import 'package:shop_app/app/domain/repositories/auth_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class SignupUseCase
    extends UseCase<DataState<RegisterResponse>, RegisterRequest> {
  SignupUseCase(this._authRepository);

  AuthRepository _authRepository;

  @override
  Future<DataState<RegisterResponse>> call({required RegisterRequest params}) async {
    return await _authRepository.fetchRegister(registerRequest: params);
  }
}
