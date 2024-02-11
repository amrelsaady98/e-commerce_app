import 'package:get/get.dart';
import 'package:shop_app/app/data/models/category_model.dart';

class CategoryApiServices {
  Future<Response<Map<String, dynamic>>> fetchAllCategories() async {
    await Future.delayed(const Duration(seconds: 3));
    Map<String, dynamic> body = CategoryModel.catigories;

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
