import 'package:get/get.dart';

class CartApiService {
  Future<Response<Map<String, dynamic>>> fetchAllCartItems() async {
    await Future.delayed(const Duration(seconds: 9));
    Map<String, dynamic>? body;

    Map<String, String> headers = {
      'success': 'false',
      'message': "network error",
      'code': "404",
    };

    return Response(
      body: body,
      headers: headers,
      statusCode: 404,
    );
  }

  Future<Response<void>> syncCartItems(Map<String, dynamic> body) async {
    await Future.delayed(const Duration(seconds: 9));

    Map<String, String> headers = {
      'success': 'true',
      'message': "success",
      'code': "200",
    };

    return Response(
      headers: headers,
      statusCode: 200,
    );
  }
}
