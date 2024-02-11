import 'package:get/get.dart';
import 'package:shop_app/app/data/models/product_model.dart';

class ProductApiServices {
  Future<Response<Map<String, dynamic>>> fetchAllProducts() async {

    //TODO: implement network manager features 
    await Future.delayed(const Duration(seconds: 5));
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
  }
}
