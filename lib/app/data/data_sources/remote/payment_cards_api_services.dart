import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shop_app/app/data/models/payment_card_model.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';
import 'package:http/http.dart' as http;

class PaymentCardsApiServices {
  // fetch all payment card list
  Future<DataState<List<PaymentCardModel>>> fetchPaymentCardList() async {
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
        final responseData = responseBody['data']['payment-cards'];
        if (responseData != null) {
          return DataSuccess([]);
        }
      }

      return DataField(http.ClientException(response.headers['message'] ?? ""));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(http.ClientException(error.toString()));
    }
  }

  // add payment card
  Future<DataState> addPaymentCard(PaymentCardModel paymentCard) async {
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
        final responseData = responseBody['data']['payment-cards'];
        if (responseData != null) {
          return DataSuccess(null);
        }
      }

      return DataField(http.ClientException(response.headers['message'] ?? ""));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(http.ClientException(error.toString()));
    }
  }

  // update payment card
  Future<DataState> updatePaymentCard(PaymentCardModel paymentCard) async {
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
        final responseData = responseBody['data']['payment-cards'];
        if (responseData != null) {
          return DataSuccess(null);
        }
      }

      return DataField(http.ClientException(response.headers['message'] ?? ""));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(http.ClientException(error.toString()));
    }
  }

  //remove payment card
  Future<DataState> removePaymentCard(String id) async {
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
        final responseData = responseBody['data']['payment-cards'];
        if (responseData != null) {
          return DataSuccess(null);
        }
      }

      return DataField(http.ClientException(response.headers['message'] ?? ""));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return DataField(http.ClientException(error.toString()));
    }
  }
}
