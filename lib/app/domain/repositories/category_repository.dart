import 'package:shop_app/app/domain/entities/category.dart';
import 'package:shop_app/core/base/data_state/data_state.dart';

abstract class CategoryRepository {
  Future<DataState<List<Category>>> fetchAllCategories();
}
