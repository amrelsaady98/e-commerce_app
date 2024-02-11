import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/repositories/auth_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/base/usecases/usecase.dart';

class AuthUseCase extends UseCase<DataState<LoginResponse>, LoginRequest> {
  AuthUseCase(this._authRepository);

  AuthRepository _authRepository;

  @override
  Future<DataState<LoginResponse>> call({LoginRequest? params}) async {
    return await _authRepository.fetchLogin(LoginRequest(
        email: params?.email ?? "", password: params?.password ?? ""));
  }
}
