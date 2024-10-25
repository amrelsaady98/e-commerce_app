import 'package:dio/dio.dart';
import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/entities/register_request.dart';
import 'package:shop_app/app/domain/entities/register_response.dart';
import 'package:shop_app/app/domain/entities/user.dart';
import 'package:shop_app/core/services/internet_service/dio_client.dart';

class AuthApiService {
  final DioClient _dioClient = DioClient.instance;

  // Future<LoginResponse> fetchLogin(LoginRequest request) async {
  //   try {
  //     final response = await _dioClient.post('auth/token/',
  //         data: {'email': request.email, 'password': request.password});

  //     if (response['status'] == 'success') {
  //       return LoginResponse(
  //         success: true,
  //         message: "Login Successfull",
  //         user: User(
  //           email: response['data']['user']['email'],
  //           id: response['data']['user']['id'].toString(),
  //           name: response['data']['user']['fisrt_name'],
  //           mobileNumber: response['data']['user']['phone'],
  //           token: response['data']['token'],
  //         ),
  //       );
  //     } else {
  //       return LoginResponse(
  //         success: false,
  //         message: response['errors'],
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return LoginResponse(
  //       success: false,
  //       message: ((e).response?.data['message']) ?? "",
  //     );
  //   } on Exception catch (e) {
  //     print((e).runtimeType);
  //     return LoginResponse(
  //       success: false,
  //       message: e.toString(),
  //     );
  //   }
  // }

  Future<LoginResponse> fetchLogin(LoginRequest request) async {
    try {
      final response = await _dioClient.post(
        'auth/token/',
        data: {
          'email': request.email,
          'password': request.password,
        },
      );

      print("Response from AuthApiService: $response");

      // Check if the request was successful
      if (response['status'] == 'success') {
        return LoginResponse.fromJson(
            response); // Use fromJson to map the response
      } else {
        return LoginResponse(
          status: 'error',
          message: response['message'] ?? 'Unknown error',
          errors: response['errors'] ?? 'An error occurred',
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific exceptions (e.g., network errors, etc.)
      print("Error from AuthApiService: ${e}");
      return LoginResponse(
        status: 'error',
        message: e.response?.data['message'] ?? 'Server error occurred',
        errors: e.response?.data['errors'] ?? 'Unknown server error',
      );
    } catch (e) {
      // Handle any other exceptions
      return LoginResponse(
        status: 'error',
        message: 'An unexpected error occurred: ${e.toString()}',
        errors: 'Unknown error',
      );
    }
  }

  Future<RegisterResponse> fetchRegister(
      {required RegisterRequest request}) async {
    try {
      final response = await _dioClient.post(
        'auth/register-customer/', // Adjust endpoint based on your API
        data: {
          'name': request.name,
          'email': request.email,
          'password': request.password,
        },
      );

      if (response['status'] == 'success') {
        // Return the response mapped into RegisterResponseModel
        return RegisterResponse.fromJson(response);
      } else {
        return RegisterResponse(
          status: 'error',
          message: response['message'] ?? 'Registration failed',
          data: null,
          errors: response['errors'],
        );
      }
    } on DioException catch (e) {
      // Handling Dio-specific exceptions
      return RegisterResponse(
        status: 'error',
        message: e.response?.data['message'] ?? 'Server error occurred',
        errors: e.response?.data['errors'],
        data: null,
      );
    } catch (e) {
      // Handling any other exceptions
      return RegisterResponse(
        status: 'error',
        message: 'An unexpected error occurred: ${e.toString()}',
        errors: null,
        data: null,
      );
    }
  }

  /* await Future.delayed(const Duration(seconds: 3));
    if (request.email == "admin@admin.com" && request.password == "12345678") {
      return LoginResponse(
        success: true,
        message: "Login Successfull",
        user: User(
          email: "admin@admin.com",
          id: "0",
          name: "Admin",
          mobileNumber: "01234567890",
          token: "access token",
        ),
      );
    } else {
      return LoginResponse(
        success: false,
        message: "user not found",
      );
    } */
}
