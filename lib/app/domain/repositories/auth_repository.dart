import 'package:dio/dio.dart';
import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/entities/register_request.dart';
import 'package:shop_app/app/domain/entities/register_response.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class AuthRepository {
  Future<DataState<LoginResponse>> fetchLogin(LoginRequest request);

  Future<DataState<RegisterResponse>> fetchRegister({
    required RegisterRequest registerRequest
  });
  
}
