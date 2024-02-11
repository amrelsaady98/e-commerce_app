import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:shop_app/app/data/data_sources/remote/category_api_services.dart';
import 'package:shop_app/app/data/models/category_model.dart';
import 'package:shop_app/app/domain/repositories/category_repository.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryApiServices _apiServices;

  CategoryRepositoryImpl(this._apiServices);

  @override
  Future<DataState<List<CategoryModel>>> fetchAllCategories() async {
    var response = await _apiServices.fetchAllCategories();

    if (response.status.isOk) {
      List<CategoryModel> categories =
          (response.body?['categories'] as List<Map<String, dynamic>>)
              .map<CategoryModel>((e) => CategoryModel.fromJson(e))
              .toList();
      return DataSuccess<List<CategoryModel>>(categories);
    } else {
      return DataField(
          GetHttpException(response.statusText ?? "Connection Failed"));
    }
  }
}
