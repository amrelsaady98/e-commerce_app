import 'package:shop_app/app/domain/entities/login_request.dart';
import 'package:shop_app/app/domain/entities/login_response.dart';
import 'package:shop_app/app/domain/entities/user.dart';

class AuthApiService {
  Future<LoginResponse> fetchLogin(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 3));
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
    }
  }
}