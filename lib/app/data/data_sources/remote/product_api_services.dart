import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/data/models/product_model.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

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

  Future<DataState<List<ProductModel>>> fetchAllProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 9));

      Map<String, String> headers = {
        'success': 'true',
        'message': "success",
        'code': "200",
      };
      Map<String, dynamic> body = {
        "data": ProductModel.products,
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
      Response response = Response(
        headers: headers,
        body: body,
        statusCode: 200,
      );
      if (response.isOk) {
        List<ProductModel> data =
            (response.body?['data']['products'] as List<Map<String, dynamic>>)
                .map<ProductModel>((e) => ProductModel.fromJson(e))
                .toList();
        return DataSuccess(data);
      }
      return DataField(
        GetHttpException(response.headers?['message'] ?? "netwrok error"),
      );
    } catch (e) {
      throw e;
    }
  }
}
