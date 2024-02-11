import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/data/data_sources/remote/auth_api_service.dart';
import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/repositories/auth_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:shop_app/core/services/internet_service/dio_exception.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authApiService);
  final AuthApiService _authApiService;
  @override
  Future<DataState<LoginResponse>> fetchLogin(LoginRequest request) async {
    LoginResponse response = await _authApiService.fetchLogin(request);
    if (response.success ?? false) {
      return DataSuccess<LoginResponse>(response);
    } else {
      return DataField<LoginResponse>(
        GetHttpException(
          response.message ?? "error from authRepo",
        ),
      );
    }
  }

  @override
  Future<DataState<Response>> fetchRegister(
      {required String name, required String email, required String password}) {
    // TODO: implement fetchRegister
    throw UnimplementedError();
  }
}
