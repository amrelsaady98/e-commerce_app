import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/app/data/models/address_model.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class AddressApiServices {
  Future<DataState<List<AddressModel>?>> fetchAllAddresses() async {
    try {
      await Future.delayed(const Duration(seconds: 9));

      Map<String, String> headers = {
        'success': 'true',
        'message': "success",
        'code': "200",
      };
      Map<String, dynamic> body = {
        "data": [],
        "meta": {
          "pagination": {"per_page": 200, "current_page": 3}
        },
        "links": {
          "self": "<API base URL>/v3/locations?page=3",
          "first": "<API base URL>/v3/locations?page=1",
          "prev": "<API base URL>/v3/locations?page=2",
          "next": "<API base URL>/v3/locations?page=4"
        },
      };
      http.Response response =
          http.Response(jsonEncode(body), 200, headers: headers);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        final responseData = responseBody['data'] as List<Map<String, dynamic>>;
        List<AddressModel> data = responseData
            .map<AddressModel>((e) => AddressModel.fromJson(e))
            .toList();
        return DataSuccess(data);
      }
      return DataField(
        http.ClientException(response.headers['message'] ?? "netwrok error"),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<DataState> addAddress({required AddressModel address}) async {
    await Future.delayed(const Duration(seconds: 9));

    Map<String, String> headers = {
      'success': 'true',
      'message': "success",
      'code': "200",
    };
    Map<String, dynamic> body = {
      "data": [],
      "meta": {
        "pagination": {"per_page": 200, "current_page": 3}
      },
      "links": {
        "self": "<API base URL>/v3/locations?page=3",
        "first": "<API base URL>/v3/locations?page=1",
        "prev": "<API base URL>/v3/locations?page=2",
        "next": "<API base URL>/v3/locations?page=4"
      },
    };

    http.Response response =
        http.Response(jsonEncode(body), 200, headers: headers);
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final responseData = responseBody['data'] as List<Map<String, dynamic>>;
      
      return DataSuccess(null);
    }

    return DataField(http.ClientException(response.headers['message'] ?? ""));
  }
}
