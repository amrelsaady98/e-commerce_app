import 'package:get/get.dart';
import 'package:shop_app/core/services/internet_service/dio_client.dart';

class CategoryApiServices {
  final _dioClient = DioClient.instance;

  Future<Response<Map<String, dynamic>>> fetchAllCategories() async {
    final _response = await _dioClient.get(
      'products/categories/all/',
    );
    if (_response.statusCode == 200) {
      Map<String, dynamic> body = _response.data;

      Map<String, String> headers = {
        'success': 'true',
        'message': "success",
        'code': "200",
      };

      return Response(
        body: body,
        headers: headers,
        statusCode: 200,
        statusText: "success",
      );
    } else {
      return Response(
        body: null,
        headers: null,
        statusCode: _response.statusCode,
        statusText: _response.statusMessage,
      );
    }

    // final _response = await await Future.delayed(const Duration(seconds: 5));
  }
}
