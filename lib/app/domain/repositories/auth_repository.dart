import 'package:dio/dio.dart';
import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class AuthRepository {
  Future<DataState<LoginResponse>> fetchLogin(LoginRequest request);

  Future<DataState<Response>> fetchRegister({
    required String name,
    required String email,
    required String password,
  });
  
}
