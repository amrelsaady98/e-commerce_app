import 'package:shop_app/app/domain/entities/user.dart';
class LoginResponse {
  final String status;
  final String message;
  final DataModel? data;
  final dynamic errors;

  LoginResponse({
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
      'errors': errors,
    };
  }
}

class DataModel {
  final String refresh;
  final String access;
  final User user;

  DataModel({
    required this.refresh,
    required this.access,
    required this.user,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      refresh: json['refresh'],
      access: json['access'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': refresh,
      'access': access,
      'user': user.toJson(),
    };
  }
}

