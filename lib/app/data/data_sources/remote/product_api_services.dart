


import 'package:dio/dio.dart' as dio;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shop_app/core/services/internet_service/dio_client.dart';

class ProductApiServices {
  /* Future<Response<Map<String, dynamic>>> fetchAllProducts() async {
    //TODO: implement network manager features
    await Future.delayed(const Duration(seconds: 9));
    Map<String, dynamic> body = ProductModel.products;

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
  } */

  final _dioClient = DioClient.instance;

  Future<Response<Map<String, dynamic>>> fetchAllProducts() async {
    try {
      final _response = await _dioClient.get(
        '/products/all',
      );
      await Future.delayed(const Duration(seconds: 9));

      Map<String, String> headers = {
        'success': 'true',
        'message': "success",
        'code': "200",
      };

      // if (_response.statusCode == 200) {
      //   return _response;
      // }

      // Map<String, dynamic> body = {
      //   "data": ProductModel.products,
      //   "meta": {
      //     "pagination": {"per_page": 200, "current_page": 3}
      //   },
      //   "links": {
      //     "self": "<API base URL>/v3/locations?page=3",
      //     "first": "<API base URL>/v3/locations?page=1",
      //     "prev": "<API base URL>/v3/locations?page=2",
      //     "next": "<API base URL>/v3/locations?page=4"
      //   },
      // };
      // Response response = Response(
      //   headers: headers,
      //   body: body,
      //   statusCode: 200,
      // );
      if (_response.data['status'] == 'success') {
        return Response(
          body: _response.data,
          headers: headers,
          statusCode: _response.statusCode,
          statusText: _response.data['status'],
        );
      }
      return Response(
        body: null,
        headers: null,
        statusCode: _response.statusCode,
        statusText:
            _response.data['status'] ?? _response.statusMessage ?? "Failed",
      );
    } catch (e) {
      throw e;
    }
  }

  Future<Response<dynamic>> fetchProductById(
      String productId) async {
    try {
      final _response = await _dioClient.get(
        '/products/$productId',
      );

      if (_response.data['status'] == 'success') {
        return Response(
          body: _response.data,
          statusCode: _response.statusCode,
          statusText: _response.data['status'],
        );
      }
      return Response(
        body: null,
        headers: null,
        statusCode: _response.statusCode,
        statusText:
            _response.data['status'] ?? _response.statusMessage ?? "Failed",
      );
    }  on dio.DioException catch (e) {
      final _response = e.response;
      return  Response(
        body: null,
        headers: null,
        statusCode: _response?.statusCode,
        statusText:
            _response?.data['status'] ?? _response?.statusMessage ?? "Failed",
      );
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
